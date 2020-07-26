Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5269922E2C4
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 23:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06556E10E;
	Sun, 26 Jul 2020 21:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB75C6E037
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 21:37:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02F3551D;
 Sun, 26 Jul 2020 23:37:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595799436;
 bh=6ZhLla5EyO5q9ABM2PTg0DadEM/rWQoFloaMKzlTvfY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cIH9AfShQbrXlOMN/3gV9fIJHN9aXhQTZlLCOlQJEDN9t6AREG1iZjWG97XbAtRsT
 58Ygw47MAwvkerCGG230Dc/gYJrVxUh1ieBiBkz7ANbcvnHS/GkJjFP5CIZuzcnlq5
 56PmyfWXScxjeE+gialUHwez26B+PkBk8s8bETGA=
Date: Mon, 27 Jul 2020 00:37:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 04/15] drm/bridge: tc358764: add drm_panel_bridge
 support
Message-ID: <20200726213708.GA28704@pendragon.ideasonboard.com>
References: <20200726203324.3722593-1-sam@ravnborg.org>
 <20200726203324.3722593-5-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726203324.3722593-5-sam@ravnborg.org>
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
 Peter Senna Tschudin <peter.senna@gmail.com>,
 kbuild test robot <lkp@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Sun, Jul 26, 2020 at 10:33:13PM +0200, Sam Ravnborg wrote:
> Prepare the tc358764 bridge driver for use in a chained setup by
> replacing direct use of drm_panel with drm_panel_bridge support.
> 
> The bridge panel will use the connector type reported by the panel,
> where the connector for this driver hardcodes DRM_MODE_CONNECTOR_LVDS.
> 
> The tc358764 did not any additional info the the connector so the

Did you mean s/did not any/did not add any/ ?
s/the the/to the/

> connector creation is passed to the bridge panel driver.
> 
> v3:
>   - Merge with patch to make connector creation optional to avoid
>     creating two connectors (Laurent)
>   - Pass connector creation to bridge panel, as this bridge driver
>     did not add any extra info to the connector.
>   - Set bridge.type to DRM_MODE_CONNECTOR_LVDS.
> 
> v2:
>   - Use PTR_ERR_OR_ZERO() (kbuild test robot)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: kbuild test robot <lkp@intel.com>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/bridge/tc358764.c | 107 +++++-------------------------
>  1 file changed, 16 insertions(+), 91 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
> index a277739fab58..fdde4cfdc724 100644
> --- a/drivers/gpu/drm/bridge/tc358764.c
> +++ b/drivers/gpu/drm/bridge/tc358764.c
> @@ -153,10 +153,9 @@ static const char * const tc358764_supplies[] = {
>  struct tc358764 {
>  	struct device *dev;
>  	struct drm_bridge bridge;
> -	struct drm_connector connector;
>  	struct regulator_bulk_data supplies[ARRAY_SIZE(tc358764_supplies)];
>  	struct gpio_desc *gpio_reset;
> -	struct drm_panel *panel;
> +	struct drm_bridge *panel_bridge;
>  	int error;
>  };
>  
> @@ -210,12 +209,6 @@ static inline struct tc358764 *bridge_to_tc358764(struct drm_bridge *bridge)
>  	return container_of(bridge, struct tc358764, bridge);
>  }
>  
> -static inline
> -struct tc358764 *connector_to_tc358764(struct drm_connector *connector)
> -{
> -	return container_of(connector, struct tc358764, connector);
> -}
> -
>  static int tc358764_init(struct tc358764 *ctx)
>  {
>  	u32 v = 0;
> @@ -278,43 +271,11 @@ static void tc358764_reset(struct tc358764 *ctx)
>  	usleep_range(1000, 2000);
>  }
>  
> -static int tc358764_get_modes(struct drm_connector *connector)
> -{
> -	struct tc358764 *ctx = connector_to_tc358764(connector);
> -
> -	return drm_panel_get_modes(ctx->panel, connector);
> -}
> -
> -static const
> -struct drm_connector_helper_funcs tc358764_connector_helper_funcs = {
> -	.get_modes = tc358764_get_modes,
> -};
> -
> -static const struct drm_connector_funcs tc358764_connector_funcs = {
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
> -	.reset = drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
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
> @@ -335,70 +296,28 @@ static void tc358764_pre_enable(struct drm_bridge *bridge)
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
>  			   enum drm_bridge_attach_flags flags)
> -{
> -	struct tc358764 *ctx = bridge_to_tc358764(bridge);
> -	struct drm_device *drm = bridge->dev;
> -	int ret;
> -
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -		DRM_ERROR("Fix bridge driver to make connector optional!");
> -		return -EINVAL;
> -	}
> -
> -	ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
> -	ret = drm_connector_init(drm, &ctx->connector,
> -				 &tc358764_connector_funcs,
> -				 DRM_MODE_CONNECTOR_LVDS);
> -	if (ret) {
> -		DRM_ERROR("Failed to initialize connector\n");
> -		return ret;
> -	}
> -
> -	drm_connector_helper_add(&ctx->connector,
> -				 &tc358764_connector_helper_funcs);
> -	drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
> -	drm_panel_attach(ctx->panel, &ctx->connector);
> -	ctx->connector.funcs->reset(&ctx->connector);
> -
> -	return 0;
> -}
> -
> -static void tc358764_detach(struct drm_bridge *bridge)
>  {
>  	struct tc358764 *ctx = bridge_to_tc358764(bridge);
>  
> -	drm_panel_detach(ctx->panel);
> -	ctx->panel = NULL;
> +	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
> +				 bridge, flags);
>  }
>  
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
> +	struct drm_bridge *panel_bridge;
>  	struct device *dev = ctx->dev;
> +	struct drm_panel *panel;
>  	int ret;
>  
>  	ctx->gpio_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> @@ -407,12 +326,17 @@ static int tc358764_parse_dt(struct tc358764 *ctx)
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
> +	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> +

You can drop this blank line.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	if (IS_ERR(panel_bridge))
> +		return PTR_ERR(panel_bridge);
> +
> +	ctx->panel_bridge = panel_bridge;
> +	return 0;
>  }
>  
>  static int tc358764_configure_regulators(struct tc358764 *ctx)
> @@ -458,6 +382,7 @@ static int tc358764_probe(struct mipi_dsi_device *dsi)
>  		return ret;
>  
>  	ctx->bridge.funcs = &tc358764_bridge_funcs;
> +	ctx->bridge.type = DRM_MODE_CONNECTOR_LVDS;
>  	ctx->bridge.of_node = dev->of_node;
>  
>  	drm_bridge_add(&ctx->bridge);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
