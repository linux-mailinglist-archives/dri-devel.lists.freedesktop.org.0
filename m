Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8821A7774
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 11:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214AA6E061;
	Tue, 14 Apr 2020 09:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569B06E061
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 09:36:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EB94521;
 Tue, 14 Apr 2020 11:35:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586856958;
 bh=pHluiPTlq1shA3IZGOtjVgEaO3Z+dFGyceemzuNFv5k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V48zMCAq3U5QjkmUkSG2nYmeAoea+Ct1GijlTopu/R9GJKcfAxRnRENESuoFkRQZF
 sdIkeZUI858NCvGWPxv5RnYgruy8kA5ME6DmCifdz5KxQpG3pqdPjatLmb1FqTmqcB
 qToDB4dru+UKqngd0Q35xNpUdbZ1A+sHp59a8t/A=
Date: Tue, 14 Apr 2020 12:35:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 3/4] drm/bridge: tc358764: add drm_panel_bridge support
Message-ID: <20200414093546.GC19819@pendragon.ideasonboard.com>
References: <20200414084727.8326-1-sam@ravnborg.org>
 <20200414084727.8326-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414084727.8326-4-sam@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Tue, Apr 14, 2020 at 10:47:26AM +0200, Sam Ravnborg wrote:
> Prepare the bridge driver for use in a chained setup by
> replacing direct use of drm_panel with drm_panel_bridge support.
> 
> Note that this change requires that the panel reports the correct
> type of connector.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/bridge/tc358764.c | 59 +++++++++----------------------
>  1 file changed, 16 insertions(+), 43 deletions(-)

I like the diffstat :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> 
> diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
> index a277739fab58..a5abf15e5c7f 100644
> --- a/drivers/gpu/drm/bridge/tc358764.c
> +++ b/drivers/gpu/drm/bridge/tc358764.c
> @@ -156,7 +156,7 @@ struct tc358764 {
>  	struct drm_connector connector;
>  	struct regulator_bulk_data supplies[ARRAY_SIZE(tc358764_supplies)];
>  	struct gpio_desc *gpio_reset;
> -	struct drm_panel *panel;
> +	struct drm_bridge *panel_bridge;
>  	int error;
>  };
>  
> @@ -282,7 +282,7 @@ static int tc358764_get_modes(struct drm_connector *connector)
>  {
>  	struct tc358764 *ctx = connector_to_tc358764(connector);
>  
> -	return drm_panel_get_modes(ctx->panel, connector);
> +	return drm_bridge_get_modes(ctx->panel_bridge, connector);
>  }
>  
>  static const
> @@ -298,23 +298,11 @@ static const struct drm_connector_funcs tc358764_connector_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>  
> -static void tc358764_disable(struct drm_bridge *bridge)
> -{
> -	struct tc358764 *ctx = bridge_to_tc358764(bridge);
> -	int ret = drm_panel_disable(bridge_to_tc358764(bridge)->panel);
> -
> -	if (ret < 0)
> -		dev_err(ctx->dev, "error disabling panel (%d)\n", ret);
> -}
> -
>  static void tc358764_post_disable(struct drm_bridge *bridge)
>  {
>  	struct tc358764 *ctx = bridge_to_tc358764(bridge);
>  	int ret;
>  
> -	ret = drm_panel_unprepare(ctx->panel);
> -	if (ret < 0)
> -		dev_err(ctx->dev, "error unpreparing panel (%d)\n", ret);
>  	tc358764_reset(ctx);
>  	usleep_range(10000, 15000);
>  	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> @@ -335,18 +323,6 @@ static void tc358764_pre_enable(struct drm_bridge *bridge)
>  	ret = tc358764_init(ctx);
>  	if (ret < 0)
>  		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
> -	ret = drm_panel_prepare(ctx->panel);
> -	if (ret < 0)
> -		dev_err(ctx->dev, "error preparing panel (%d)\n", ret);
> -}
> -
> -static void tc358764_enable(struct drm_bridge *bridge)
> -{
> -	struct tc358764 *ctx = bridge_to_tc358764(bridge);
> -	int ret = drm_panel_enable(ctx->panel);
> -
> -	if (ret < 0)
> -		dev_err(ctx->dev, "error enabling panel (%d)\n", ret);
>  }
>  
>  static int tc358764_attach(struct drm_bridge *bridge,
> @@ -356,6 +332,11 @@ static int tc358764_attach(struct drm_bridge *bridge,
>  	struct drm_device *drm = bridge->dev;
>  	int ret;
>  
> +	ret = drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
> +				bridge, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret < 0)
> +		return ret;
> +
>  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
>  		DRM_ERROR("Fix bridge driver to make connector optional!");
>  		return -EINVAL;
> @@ -373,32 +354,21 @@ static int tc358764_attach(struct drm_bridge *bridge,
>  	drm_connector_helper_add(&ctx->connector,
>  				 &tc358764_connector_helper_funcs);
>  	drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
> -	drm_panel_attach(ctx->panel, &ctx->connector);
>  	ctx->connector.funcs->reset(&ctx->connector);
>  
>  	return 0;
>  }
>  
> -static void tc358764_detach(struct drm_bridge *bridge)
> -{
> -	struct tc358764 *ctx = bridge_to_tc358764(bridge);
> -
> -	drm_panel_detach(ctx->panel);
> -	ctx->panel = NULL;
> -}
> -
>  static const struct drm_bridge_funcs tc358764_bridge_funcs = {
> -	.disable = tc358764_disable,
>  	.post_disable = tc358764_post_disable,
> -	.enable = tc358764_enable,
>  	.pre_enable = tc358764_pre_enable,
>  	.attach = tc358764_attach,
> -	.detach = tc358764_detach,
>  };
>  
>  static int tc358764_parse_dt(struct tc358764 *ctx)
>  {
>  	struct device *dev = ctx->dev;
> +	struct drm_panel *panel;
>  	int ret;
>  
>  	ctx->gpio_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> @@ -407,12 +377,15 @@ static int tc358764_parse_dt(struct tc358764 *ctx)
>  		return PTR_ERR(ctx->gpio_reset);
>  	}
>  
> -	ret = drm_of_find_panel_or_bridge(ctx->dev->of_node, 1, 0, &ctx->panel,
> -					  NULL);
> -	if (ret && ret != -EPROBE_DEFER)
> -		dev_err(dev, "cannot find panel (%d)\n", ret);
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
> +	if (ret)
> +		return ret;
>  
> -	return ret;
> +	ctx->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> +	if (IS_ERR(ctx->panel_bridge))
> +		return PTR_ERR(ctx->panel_bridge);
> +
> +	return 0;
>  }
>  
>  static int tc358764_configure_regulators(struct tc358764 *ctx)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
