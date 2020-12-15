Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFD82DA7C7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 06:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764096E0D1;
	Tue, 15 Dec 2020 05:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF0F6E0D1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 05:44:29 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 5F3E28064A;
 Tue, 15 Dec 2020 06:44:24 +0100 (CET)
Date: Tue, 15 Dec 2020 06:44:22 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/panel: s6e63m0: Support max-brightness
Message-ID: <20201215054422.GA1027716@ravnborg.org>
References: <20201214222210.238081-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214222210.238081-1-linus.walleij@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=j8Cu_9a8AAAA:8 a=KKAkSRfTAAAA:8 a=7gkXJVJtAAAA:8
 a=3cD3iEMV03z5kAF0JKkA:9 a=CjuIK1q_8ugA:10 a=A2jcf3dkIZPIRbEE90CI:22
 a=cvBusfyB2V15izCimMoJ:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Stephan Gerhold <stephan@gerhold.net>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus.
On Mon, Dec 14, 2020 at 11:22:10PM +0100, Linus Walleij wrote:
> The "max-brightness" is a standard backlight property that
> we need to support for the Samsung GT-I8190 Golden because
> the display will go black if we crank up the brightness
> too high.
> 
> As the platform needs this ability to give picture this is
> a regression fix along with the addition of the property
> to the GT-I8190 device tree.
> 
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Fixes: 9c3f0a0dd6a1 ("drm/panel: s6e63m0: Implement 28 backlight levels")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Looks good. backlight_properties.max_brightness is an int, but this
looks like a sub-optimal type so the use of u32 in this patch is fine.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

As we are in the merge window it should be drm-next-fixes material,
but you may have to wait until -rc2 before the drm-next-fixes branched
is ready.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> index bf6d704d4d27..603c5dfe8768 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> @@ -692,12 +692,12 @@ static const struct backlight_ops s6e63m0_backlight_ops = {
>  	.update_status	= s6e63m0_set_brightness,
>  };
>  
> -static int s6e63m0_backlight_register(struct s6e63m0 *ctx)
> +static int s6e63m0_backlight_register(struct s6e63m0 *ctx, u32 max_brightness)
>  {
>  	struct backlight_properties props = {
>  		.type		= BACKLIGHT_RAW,
> -		.brightness	= MAX_BRIGHTNESS,
> -		.max_brightness = MAX_BRIGHTNESS
> +		.brightness	= max_brightness,
> +		.max_brightness = max_brightness,
>  	};
>  	struct device *dev = ctx->dev;
>  	int ret = 0;
> @@ -719,6 +719,7 @@ int s6e63m0_probe(struct device *dev,
>  		  bool dsi_mode)
>  {
>  	struct s6e63m0 *ctx;
> +	u32 max_brightness;
>  	int ret;
>  
>  	ctx = devm_kzalloc(dev, sizeof(struct s6e63m0), GFP_KERNEL);
> @@ -734,6 +735,14 @@ int s6e63m0_probe(struct device *dev,
>  	ctx->enabled = false;
>  	ctx->prepared = false;
>  
> +	ret = device_property_read_u32(dev, "max-brightness", &max_brightness);
> +	if (ret)
> +		max_brightness = MAX_BRIGHTNESS;
> +	if (max_brightness > MAX_BRIGHTNESS) {
> +		dev_err(dev, "illegal max brightness specified\n");
> +		max_brightness = MAX_BRIGHTNESS;
> +	}
> +
>  	ctx->supplies[0].supply = "vdd3";
>  	ctx->supplies[1].supply = "vci";
>  	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> @@ -753,7 +762,7 @@ int s6e63m0_probe(struct device *dev,
>  		       dsi_mode ? DRM_MODE_CONNECTOR_DSI :
>  		       DRM_MODE_CONNECTOR_DPI);
>  
> -	ret = s6e63m0_backlight_register(ctx);
> +	ret = s6e63m0_backlight_register(ctx, max_brightness);
>  	if (ret < 0)
>  		return ret;
>  
> -- 
> 2.29.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
