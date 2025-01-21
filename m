Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3844A17B2A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4264510E537;
	Tue, 21 Jan 2025 10:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xOyt0PL0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9124210E537
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:15:36 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5439b0dd4bfso3614022e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 02:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737454535; x=1738059335; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tt5Ql6OGl14sC3Y6nyXqTJyqcaO6LNq+FvDCSE3LXuc=;
 b=xOyt0PL0PDuJt6MiNF+H/+7pPGQkNqCkF4vDpy65hsQicmS5nYCD17E2NmpPNUh6La
 kKSjYfEkJuSYWGBcKDjgY81Xoow7sYRj/FG0qix2mv83IMu1JGFz3wxan91pm13OZQ8z
 5Ptwm4HGPIopLcsDLBR4rfwitdAUfarzdMvDA89jVe+sQr+zmiqFCt2jjINqsXidWSri
 r96JO3E6d4cOpfFfYYwVIgUOBoMXZPSw+voFnU97nB8p3qwaeQ5+77ZbiPZEBTqKY2gp
 LfDRRgVF+sfJgGnxSmcE9ku4weQznL7iggEw2SKS2k4TTuQPR50lRxfbRbyh4F1kVx32
 24TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737454535; x=1738059335;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tt5Ql6OGl14sC3Y6nyXqTJyqcaO6LNq+FvDCSE3LXuc=;
 b=md8UwXOZBu0DyFo8+WNz4tgCh5mwXRCAvO/K4HzOpEy15QZUFhuCBXhiyh0T1GkXzp
 KUEu8wE8TOvIa1VNqp2vPCiQdBalPW+Ah110xc9Df4L9a0g+CNPcx0T9Ov/fMQQoLkgX
 r4Vh3hXCSY4jyhOaiZX21jURDC3vi7ZGNNYpdS14S8bWwJX8Tv6sYsiK2xtn+Dn9eUGs
 ulfoIIlG9f3wOL5Y28lSmrjbkFxOiL9ixrQynnDYehuB9Hk5PfNtMaQUcvu0uMztP73B
 dBe3DXakE9LtWpivwFoQcPLuZqfTvWOmAl7ur+aQHo+0iO0YgzRTPouCssXjuUBvtiAV
 L+kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+igMJ3FEzicAp6cZ3XgKzqwuV7Sy3191wl+LtdbEyI47R5w5YdQ1u3EaNPqhnWltq6TzvFLRMmzg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOXKVOmuW993bqvdcIaCkuFymGn6waKMVcuXq2T6tzz+yqlwEv
 nntn/TVuM3QDGt+b44IHFT7qfvSvzJGi6K7Nd7lkRerf7aTM+CqSWyx84T7ecrc=
X-Gm-Gg: ASbGnctGY52DRBsZoV9MnaVHVEb5OoeJ3cL++1VStlff7ThriU9AEaG+f9QXeeyShD+
 mxoR/jXmTA4H/ZlnnpvFZhsWwLBesTqBOP8q+a0c5xbVdPwKGgbc0yVHNRqoongPp6mNx+KsZ2l
 H0MK7LJ2cScr5QyqCNv3ilfmWqVlvkNH8TO3FEAGd4cMYNqTGeDhY78cDC1FC4q7NwZvXt0JSGA
 D2wFIuRwvsHrP20EOgEQS3+dJHcPIyFDcB/4rGVgft19JIfEni4Ykijzp3YLBATrjY37DZ7x703
 y6jFj0OT2v0khctyK7MWUxmBAPgXlnk2/RrN4lSTq0U6JzG1Jw==
X-Google-Smtp-Source: AGHT+IH1ZnH92jYRRVnodSzZzeJo6/UjSIyRtX/wPZ2M/UK5ljyXVKqtCZEU+Jjn67GL7xvf0ER4KA==
X-Received: by 2002:ac2:44b3:0:b0:540:3561:969d with SMTP id
 2adb3069b0e04-5439c287f06mr5314261e87.49.1737454534463; 
 Tue, 21 Jan 2025 02:15:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a35a998sm20798771fa.53.2025.01.21.02.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 02:15:33 -0800 (PST)
Date: Tue, 21 Jan 2025 12:15:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 treapking@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw
Subject: Re: [PATCH] drm/bridge: it6505: support hdmi_codec_ops for audio
 stream setup
Message-ID: <mubznqagapsm2n3eym7664u2x6mgjxa2phsalk5w647uecvson@7q3okwl3mgu4>
References: <20250121-add-audio-codec-v1-1-e3ff71b3c819@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-add-audio-codec-v1-1-e3ff71b3c819@ite.com.tw>
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

On Tue, Jan 21, 2025 at 04:59:22PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> IT6505 supports audio form I2S to DP audio data sub stream
> 
> Support audio codec operation include
> hw_params, audio_startup, audio_shutdown, hook_plugged_cb.

The DRM framework recently got generic HDMI codec framework
(display/drm_hdmi_audio_helper.c), drm_bridge callbacks to implement
HDMI codec functions and glue code in drm_bridge_connector.c.

Please consider using it instead of manually implementing all the glue
on your own. The drm_bridge_connector code is limited to the HDMI case,
but it can be extended to support DP too.

> In order to prevent pop noise from sink devise, delay audio by
> after I2S signal is enable by source.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 67 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 62 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 88ef76a37fe6accacdd343839ff2569b31b18ceb..9dc58d307dae360ffab5df15e8fe8420d084c764 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -3095,18 +3095,39 @@ static int __maybe_unused it6505_audio_setup_hw_params(struct it6505 *it6505,
>  	return 0;
>  }
>  
> -static void __maybe_unused it6505_audio_shutdown(struct device *dev, void *data)
> +static void it6505_audio_shutdown(struct device *dev, void *data)
>  {
>  	struct it6505 *it6505 = dev_get_drvdata(dev);
>  
> +	cancel_delayed_work_sync(&it6505->delayed_audio);
> +
>  	if (it6505->powered)
>  		it6505_disable_audio(it6505);
>  }
>  
> -static int __maybe_unused it6505_audio_hook_plugged_cb(struct device *dev,
> -						       void *data,
> -						       hdmi_codec_plugged_cb fn,
> -						       struct device *codec_dev)
> +static int it6505_audio_hw_params(struct device *dev,
> +				  void *data,
> +				  struct hdmi_codec_daifmt *daifmt,
> +				  struct hdmi_codec_params *params)
> +{
> +	struct it6505 *it6505 = dev_get_drvdata(dev);
> +
> +	return it6505_audio_setup_hw_params(it6505, params);
> +}
> +
> +static int it6505_audio_startup(struct device *dev, void *data)
> +{
> +	struct it6505 *it6505 = dev_get_drvdata(dev);
> +
> +	queue_delayed_work(system_wq, &it6505->delayed_audio,
> +			   msecs_to_jiffies(180));

Where does 180 msec delay come from? It sounds like some kind of
platform issue rather than the IT6505 issue. Can you change the order of
the operations in the platform code?

> +	return 0;
> +}
> +
> +static int it6505_audio_hook_plugged_cb(struct device *dev,
> +					void *data,
> +					hdmi_codec_plugged_cb fn,
> +					struct device *codec_dev)
>  {
>  	struct it6505 *it6505 = data;
>  
> @@ -3117,6 +3138,36 @@ static int __maybe_unused it6505_audio_hook_plugged_cb(struct device *dev,
>  	return 0;
>  }
>  
> +static const struct hdmi_codec_ops it6505_audio_codec_ops = {
> +	.hw_params = it6505_audio_hw_params,
> +	.audio_startup = it6505_audio_startup,
> +	.audio_shutdown = it6505_audio_shutdown,
> +	.hook_plugged_cb = it6505_audio_hook_plugged_cb,
> +};
> +
> +static int it6505_register_audio_driver(struct device *dev)
> +{
> +	struct it6505 *it6505 = dev_get_drvdata(dev);
> +	struct hdmi_codec_pdata codec_data = {
> +		.ops = &it6505_audio_codec_ops,
> +		.max_i2s_channels = 8,
> +		.i2s = 1,
> +		.data = it6505,
> +	};
> +	struct platform_device *pdev;
> +
> +	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
> +					     PLATFORM_DEVID_AUTO, &codec_data,
> +					     sizeof(codec_data));
> +	if (IS_ERR(pdev))
> +		return PTR_ERR(pdev);
> +
> +	INIT_DELAYED_WORK(&it6505->delayed_audio, it6505_delayed_audio);
> +	DRM_DEV_DEBUG_DRIVER(dev, "bound to %s", HDMI_CODEC_DRV_NAME);

it's not bound, the message is useless.

> +
> +	return 0;
> +}
> +
>  static inline struct it6505 *bridge_to_it6505(struct drm_bridge *bridge)
>  {
>  	return container_of(bridge, struct it6505, bridge);
> @@ -3677,6 +3728,12 @@ static int it6505_i2c_probe(struct i2c_client *client)
>  		return err;
>  	}
>  
> +	err = it6505_register_audio_driver(dev);

There is no code to unregister the platform device.

> +	if (err < 0) {
> +		dev_err(dev, "Failed to register audio driver: %d", err);
> +		return err;
> +	}
> +
>  	INIT_WORK(&it6505->link_works, it6505_link_training_work);
>  	INIT_WORK(&it6505->hdcp_wait_ksv_list, it6505_hdcp_wait_ksv_list);
>  	INIT_DELAYED_WORK(&it6505->hdcp_work, it6505_hdcp_work);
> 
> ---
> base-commit: fe003bcb69f7bff9ff2b30b659b004dbafe52907
> change-id: 20250114-add-audio-codec-8c9d47062a6c
> 
> Best regards,
> -- 
> Hermes Wu <Hermes.wu@ite.com.tw>
> 
> 

-- 
With best wishes
Dmitry
