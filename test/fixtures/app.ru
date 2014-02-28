require 'rack'
require 'rack/server'

require 'puma_worker_killer'

PumaWorkerKiller.config do |config|
  config.ram       = Integer(ENV['PUMA_RAM'])       if ENV['PUMA_RAM']
  config.frequency = Integer(ENV['PUMA_FREQUENCY']) if ENV['PUMA_FREQUENCY']
end
PumaWorkerKiller.start


class HelloWorld
  def response
    [200, {}, ['Hello World']]
  end
end

class HelloWorldApp
  def self.call(env)
    HelloWorld.new.response
  end
end

run HelloWorldApp
