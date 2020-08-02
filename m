Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F92223579F
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 16:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787FC6E081;
	Sun,  2 Aug 2020 14:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3148B6E081
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 14:33:04 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 3EEEB80511;
 Sun,  2 Aug 2020 16:33:01 +0200 (CEST)
Date: Sun, 2 Aug 2020 16:32:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v1 16/22] drm/bridge: parade-ps8622: Backlight update
Message-ID: <20200802143259.GA1264750@ravnborg.org>
References: <20200802110636.1018743-1-sam@ravnborg.org>
 <20200802110636.1018743-17-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802110636.1018743-17-sam@ravnborg.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=hD80L64hAAAA:8 a=IpJZQVW2AAAA:8
 a=P1BnusSwAAAA:8 a=RwHePtW7AAAA:8 a=6EamX4xhOt02RnpUPrMA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=D0XLA9XvdZm18NrgonBM:22 a=FqraQwd7dyEg5dwJgZJs:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 02, 2020 at 01:06:30PM +0200, Sam Ravnborg wrote:
> - Use blacklight_get_brightness() helper
> - Use devm_ variant to register backlight device and drop explicit
>   unregister
> - Use macro for initialization
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>

Build errors fixed, will be included in v2.

	Sam

> ---
>  drivers/gpu/drm/bridge/parade-ps8622.c | 43 +++++++++++++-------------
>  1 file changed, 21 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
> index d789ea2a7fb9..9304484e7f71 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8622.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8622.c
> @@ -284,8 +284,7 @@ static int ps8622_send_config(struct ps8622_bridge *ps8622)
>  			goto error;
>  
>  		/* FFh for 100% brightness, 0h for 0% brightness */
> -		err = ps8622_set(cl, 0x01, 0xa7,
> -				ps8622->bl->props.brightness);
> +		err = ps8622_set(cl, 0x01, 0xa7, backlight_get_brightness(ps8622->bl));
>  		if (err)
>  			goto error;
>  	} else {
> @@ -331,18 +330,11 @@ static int ps8622_send_config(struct ps8622_bridge *ps8622)
>  static int ps8622_backlight_update(struct backlight_device *bl)
>  {
>  	struct ps8622_bridge *ps8622 = dev_get_drvdata(&bl->dev);
> -	int ret, brightness = bl->props.brightness;
> -
> -	if (bl->props.power != FB_BLANK_UNBLANK ||
> -	    bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> -		brightness = 0;
>  
>  	if (!ps8622->enabled)
>  		return -EINVAL;
>  
> -	ret = ps8622_set(ps8622->client, 0x01, 0xa7, brightness);
> -
> -	return ret;
> +	return ps8622_set(ps8622->client, 0x01, 0xa7, blacklight_get_brightness(bl));
>  }
>  
>  static const struct backlight_ops ps8622_backlight_ops = {
> @@ -521,7 +513,23 @@ static const struct drm_bridge_funcs ps8622_bridge_funcs = {
>  	.attach = ps8622_attach,
>  };
>  
> -static const struct of_device_id ps8622_devices[] = {
> +static int ps8622_register_blacklight(struct ps8622_bridge *ps8622)
> +{
> +	DECLARE_BACKLIGHT_INIT_RAW(props, PS8622_MAX_BRIGHTNESS, PS8622_MAX_BRIGHTNESS);
> +	backlight_device *bl;
> +
> +	bl = devm_backlight_device_register(dev, dev_name(dev), dev,
> +					    ps8622, &ps8622_backlight_ops, &props);
> +	if (IS_ERR(bl)) {
> +		DRM_ERROR("failed to register backlight\n");
> +		return PTR_ERR(bl);
> +	}
> +
> +	ps8622->bl = bl;
> +	return 0;
> +}
> +
> +const struct of_device_id ps8622_devices[] = {
>  	{.compatible = "parade,ps8622",},
>  	{.compatible = "parade,ps8625",},
>  	{}
> @@ -581,17 +589,9 @@ static int ps8622_probe(struct i2c_client *client,
>  	}
>  
>  	if (!of_find_property(dev->of_node, "use-external-pwm", NULL)) {
> -		ps8622->bl = backlight_device_register("ps8622-backlight",
> -				dev, ps8622, &ps8622_backlight_ops,
> -				NULL);
> -		if (IS_ERR(ps8622->bl)) {
> -			DRM_ERROR("failed to register backlight\n");
> -			ret = PTR_ERR(ps8622->bl);
> -			ps8622->bl = NULL;
> +		ret = ps8622_register_blacklight(ps8622);
> +		if (ret)
>  			return ret;
> -		}
> -		ps8622->bl->props.max_brightness = PS8622_MAX_BRIGHTNESS;
> -		ps8622->bl->props.brightness = PS8622_MAX_BRIGHTNESS;
>  	}
>  
>  	ps8622->bridge.funcs = &ps8622_bridge_funcs;
> @@ -607,7 +607,6 @@ static int ps8622_remove(struct i2c_client *client)
>  {
>  	struct ps8622_bridge *ps8622 = i2c_get_clientdata(client);
>  
> -	backlight_device_unregister(ps8622->bl);
>  	drm_bridge_remove(&ps8622->bridge);
>  
>  	return 0;
> -- 
> 2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
