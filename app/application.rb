class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      picked_item = req.path.split("/items/").last
      if final_item = @@items.find {|item| item.name == picked_item}
          resp.write final_item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
      #binding.pry
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
