Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3968B4666
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 15:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933D210F56D;
	Sat, 27 Apr 2024 13:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="k1fS7Yw2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com
 [91.218.175.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E4A10F56D
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 13:12:07 +0000 (UTC)
Message-ID: <fc9132ec-68ae-4d28-afe8-0fc6ab2eec8c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714223524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ku4jJuCrxWroVraIv9fiL80ign+FS7tm7M7KNTXdEEI=;
 b=k1fS7Yw2uTskNtYQ+uCW5Y2o8VISSJ3vaslSshvCxdtNhInx6Q5NUjtF4GkQ1Trj1IsDLz
 NDpVosEB//XZ8LWEjizaMDyMO5Z0qrEk1Ru7ZDgVhgWHz4hrn2KZZRSLr9BNfWN9lRqomb
 MzDPNDmJcwfoRp3ULOiIFNJn0dpgngI=
Date: Sat, 27 Apr 2024 21:11:47 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v4 7/9] drm-bridge: it66121: Use fwnode API to acquire
 device properties
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Phong LE <ple@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240422191903.255642-1-sui.jingfeng@linux.dev>
 <20240422191903.255642-8-sui.jingfeng@linux.dev>
 <ugo62mcrvo5csp7umzvn3jhffh625agnjr3rtujnbgm7gxvgtr@re4q2xg46iqn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <ugo62mcrvo5csp7umzvn3jhffh625agnjr3rtujnbgm7gxvgtr@re4q2xg46iqn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2024/4/23 04:06, Dmitry Baryshkov wrote:
>> +
>>   static int it66121_probe(struct i2c_client *client)
>>   {
>>   	u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
>> -	struct device_node *ep;
>>   	int ret;
>>   	struct it66121_ctx *ctx;
>>   	struct device *dev = &client->dev;
>> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
>>   
>>   	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
>>   		dev_err(dev, "I2C check functionality failed.\n");
>> @@ -1520,29 +1542,20 @@ static int it66121_probe(struct i2c_client *client)
>>   	if (!ctx)
>>   		return -ENOMEM;
>>   
>> -	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
>> -	if (!ep)
>> -		return -EINVAL;
>> -
>>   	ctx->dev = dev;
>>   	ctx->client = client;
>>   	ctx->info = i2c_get_match_data(client);
>>   
>> -	of_property_read_u32(ep, "bus-width", &ctx->bus_width);
>> -	of_node_put(ep);
>> -
>> -	if (ctx->bus_width != 12 && ctx->bus_width != 24)
>> -		return -EINVAL;
>> -
>> -	ep = of_graph_get_remote_node(dev->of_node, 1, -1);
>> -	if (!ep) {
>> -		dev_err(ctx->dev, "The endpoint is unconnected\n");
>> -		return -EINVAL;
>> -	}
>> +	ret = it66121_read_bus_width(fwnode, &ctx->bus_width);
>> +	if (ret)
>> +		return ret;
>>   
>> -	ctx->next_bridge = of_drm_find_bridge(ep);
>> -	of_node_put(ep);
>> -	if (!ctx->next_bridge) {
>> +	ctx->next_bridge = drm_bridge_find_next_bridge_by_fwnode(fwnode, 1);
>> +	if (IS_ERR(ctx->next_bridge)) {
>> +		ret = PTR_ERR(ctx->next_bridge);
>> +		dev_err(dev, "Error in founding the next bridge: %d\n", ret);
>> +		return ret;
> return dev_err_probe(dev, ret, "msg"), if your function doesn't do this.
> If it does, just return ret.


My drm_bridge_find_next_bridge_by_fwnode() function won't return -EPROBE_DEFER
this is known for sure. As a//prior(priori) knowledge. Calling the dev_err_probe()
just introduce extra overhead. It is useless to use dev_err_probe() here.
  

-- 
Best regards,
Sui

