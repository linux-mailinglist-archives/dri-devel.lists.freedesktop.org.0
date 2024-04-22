Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E98B8AD57D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 22:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BD610F815;
	Mon, 22 Apr 2024 20:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qXw87LSr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A0D10F815
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 20:02:34 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5176f217b7bso8052910e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 13:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713816153; x=1714420953; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BYULDphY2ItayKozrZGvB0zK/xqIWuEyrYhocBQEPFk=;
 b=qXw87LSr4D3QkXj7bmYVy9dhMiSfcRMbZ28tSqxxyQl7Azyr8zGy8uI+QYBHMd9zBn
 U9UPhNGOUsILCxb8CSGSuisaWEJohzczMNr99E690XqZzTtmtxcdsKVb1MUrKKZb8p6U
 e9D4bQuczWSmASkPF7SyIULwVDn13p7qPcxacwvOwOx7iUJ9qhemc/Hbh1P3OSg3d9nE
 7wooCescS479ZRaIDtjuQxpLcgZgjcUoTRXODACM6h5t9MN1IonNFp1nmeoVZLqYyR6s
 B6md3byMlxgJu1xFCLjQ5dC3TQ6IN/9lPmy8yMn1wTp2MNKfdg7RCdb8OP7ApTyn1jKo
 t5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713816153; x=1714420953;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BYULDphY2ItayKozrZGvB0zK/xqIWuEyrYhocBQEPFk=;
 b=bbN8mMSQNi6F1V0cKrQn0zBg2yICWCa4roPg8159+jVaZcTtVBiURfdjtsSZAf7jar
 VEK+Uze6Im1CrG7BCVgKQf64qHFYRw4/Ow8mShHTwVArR826BVxoZVKKoeV6iaKXhPOX
 2FLedcsZIDg+5PqyCoT0QpMUxcyTJXnSaizQG09x1EDExskbid77Y3vMV/Z+Kjco2Mg0
 6kjATvwImExWn3fP76EMu57S6vK3mGCvM+pivmwN/Uj9uG+OC+XLVFcpPHRiemEtm6OW
 R5nNWzvhDAOzsABT3T5OfbYD98MHeIJxhk6PxABI+yGn3xK0DL3GEA1AkHeKaMJOJOJ5
 ahJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCwr7zVRf44qqT1IMgHhQ7lzMnY3F+dW5UgjDjTfWhqktsjhShZROQGzc7oJr1b5irGMh41KZRm63oCHZZesGzBtu6XzZ08+BPXgGdSAWj
X-Gm-Message-State: AOJu0YzLIDRZwlXvntxr9NqyySJrcjEVtZH/T0ffu+hoT9QNFIwryq8z
 bitBKw+pfIVAYfsgQl5rtFRG5uzf/pZShbAIRhclN9q1ZZI5ZqbJVX7kAa5Lws0=
X-Google-Smtp-Source: AGHT+IEHpYdHUl6OKNU8zFWazWcfkMxAo7AMxHLtOACiqPGyPX821vxF/ZHJDF+BCrU8Qx8Gkp+mOQ==
X-Received: by 2002:a05:6512:3086:b0:51a:e51c:46be with SMTP id
 z6-20020a056512308600b0051ae51c46bemr8101937lfd.33.1713816152889; 
 Mon, 22 Apr 2024 13:02:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a05651212ca00b0051aecc1c038sm877383lfg.223.2024.04.22.13.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 13:02:32 -0700 (PDT)
Date: Mon, 22 Apr 2024 23:02:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Phong LE <ple@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/9] drm-bridge: sii902x: Use fwnode API to acquire
 device properties
Message-ID: <nv2tqsoxj3ste4mqhzmbwhibms7obhqrw62c6vquxdkwrsiez4@yxmexbvocds7>
References: <20240422191903.255642-1-sui.jingfeng@linux.dev>
 <20240422191903.255642-7-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422191903.255642-7-sui.jingfeng@linux.dev>
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

On Tue, Apr 23, 2024 at 03:19:00AM +0800, Sui Jingfeng wrote:
> Make this driver less DT-dependent by calling the freshly created helper
> functions, which reduce boilerplate. Should be no functional changes for
> DT based systems.
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 43 +++++++++++---------------------
>  1 file changed, 14 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 8f84e98249c7..04436f318c7f 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -827,20 +827,19 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
>  		.spdif = 0,
>  		.max_i2s_channels = 0,
>  	};
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
>  	u8 lanes[4];
>  	int num_lanes, i;
>  
> -	if (!of_property_read_bool(dev->of_node, "#sound-dai-cells")) {
> +	if (!fwnode_property_present(fwnode, "#sound-dai-cells")) {
>  		dev_dbg(dev, "%s: No \"#sound-dai-cells\", no audio\n",
>  			__func__);
>  		return 0;
>  	}
>  
> -	num_lanes = of_property_read_variable_u8_array(dev->of_node,
> -						       "sil,i2s-data-lanes",
> -						       lanes, 1,
> -						       ARRAY_SIZE(lanes));
> -
> +	num_lanes = fwnode_property_read_u8_array(fwnode,
> +						  "sil,i2s-data-lanes",
> +						  lanes, ARRAY_SIZE(lanes));

You have lost support for having less than 4 lanes. Please see the
documentation for this function.

>  	if (num_lanes == -EINVAL) {
>  		dev_dbg(dev,
>  			"%s: No \"sil,i2s-data-lanes\", use default <0>\n",
> @@ -1097,13 +1096,13 @@ static int sii902x_init(struct sii902x *sii902x)
>  		goto err_unreg_audio;
>  
>  	sii902x->bridge.funcs = &sii902x_bridge_funcs;
> -	sii902x->bridge.of_node = dev->of_node;
>  	sii902x->bridge.timings = &default_sii902x_timings;
>  	sii902x->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
>  
>  	if (sii902x->i2c->irq > 0)
>  		sii902x->bridge.ops |= DRM_BRIDGE_OP_HPD;
>  
> +	drm_bridge_set_node(&sii902x->bridge, dev_fwnode(dev));

Move back to the place of the of_node setter.

>  	drm_bridge_add(&sii902x->bridge);
>  
>  	return 0;
> @@ -1118,7 +1117,6 @@ static int sii902x_init(struct sii902x *sii902x)
>  static int sii902x_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> -	struct device_node *endpoint;
>  	struct sii902x *sii902x;
>  	static const char * const supplies[] = {"iovcc", "cvcc12"};
>  	int ret;
> @@ -1147,27 +1145,14 @@ static int sii902x_probe(struct i2c_client *client)
>  		return PTR_ERR(sii902x->reset_gpio);
>  	}
>  
> -	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 1, -1);
> -	if (endpoint) {
> -		struct device_node *remote = of_graph_get_remote_port_parent(endpoint);
> -
> -		of_node_put(endpoint);
> -		if (!remote) {
> -			dev_err(dev, "Endpoint in port@1 unconnected\n");
> -			return -ENODEV;
> -		}
> -
> -		if (!of_device_is_available(remote)) {
> -			dev_err(dev, "port@1 remote device is disabled\n");
> -			of_node_put(remote);
> -			return -ENODEV;
> -		}
> -
> -		sii902x->next_bridge = of_drm_find_bridge(remote);
> -		of_node_put(remote);
> -		if (!sii902x->next_bridge)
> -			return dev_err_probe(dev, -EPROBE_DEFER,
> -					     "Failed to find remote bridge\n");
> +	sii902x->next_bridge = drm_bridge_find_next_bridge_by_fwnode(dev_fwnode(dev), 1);
> +	if (!sii902x->next_bridge) {
> +		return dev_err_probe(dev, -EPROBE_DEFER,
> +				     "Failed to find the next bridge\n");
> +	} else if (IS_ERR(sii902x->next_bridge)) {
> +		ret = PTR_ERR(sii902x->next_bridge);
> +		dev_err(dev, "Error on find the next bridge: %d\n", ret);
> +		return ret;
>  	}
>  
>  	mutex_init(&sii902x->mutex);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
