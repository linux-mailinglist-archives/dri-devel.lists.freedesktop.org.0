Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5EC282CEA
	for <lists+dri-devel@lfdr.de>; Sun,  4 Oct 2020 21:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FC589B83;
	Sun,  4 Oct 2020 19:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0F589B83
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Oct 2020 19:14:48 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 54417804F6;
 Sun,  4 Oct 2020 21:14:43 +0200 (CEST)
Date: Sun, 4 Oct 2020 21:14:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH RESEND] drm/bridge: tc358764: restore connector support
Message-ID: <20201004191441.GA551257@ravnborg.org>
References: <CGME20200930114050eucas1p2fd39f213b4cf82068b79c97992a9acc7@eucas1p2.samsung.com>
 <20200930114042.5806-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930114042.5806-1-m.szyprowski@samsung.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=hD80L64hAAAA:8 a=VwQbUJbxAAAA:8
 a=TywVMfzB9f1nFpWJDQUA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, linux-samsung-soc@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek.

On Wed, Sep 30, 2020 at 01:40:42PM +0200, Marek Szyprowski wrote:
> This patch restores DRM connector registration in the TC358764 bridge
> driver and restores usage of the old drm_panel_* API, thus allows dynamic
> panel registration. This fixes panel operation on Exynos5250-based
> Arndale board.
> 
> This is equivalent to the revert of the following commits:
> 1644127f83bc "drm/bridge: tc358764: add drm_panel_bridge support"
> 385ca38da29c "drm/bridge: tc358764: drop drm_connector_(un)register"
> and removal of the calls to drm_panel_attach()/drm_panel_detach(), which
> were no-ops and has been removed in meanwhile.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Thanks for providing the revert so we can have this fixed in upstream.
So far I have had no time to dive deeper into what is going wrong but
and the revert is the right cause of action for now.

I expect Andrzej to pick it up as he has already reviewed it.

	Sam

> ---
> As I've reported and Andrzej Hajda pointed, the reverted patches break
> operation of the panel on the Arndale board. Noone suggested how to fix
> the regression, I've decided to send a revert until a new solution is
> found.
> 
> The issues with tc358764 might be automatically resolved once the Exynos
> DSI itself is converted to DRM bridge:
> https://patchwork.kernel.org/cover/11770683/
> but that approach has also its own issues so far.
> 
> Resend reason: added Sam Ravnborg to CC:
> 
> Best regards,
> Marek Szyprowski
> ---
>  drivers/gpu/drm/bridge/tc358764.c | 107 +++++++++++++++++++++++++-----
>  1 file changed, 92 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
> index d89394bc5aa4..c1e35bdf9232 100644
> --- a/drivers/gpu/drm/bridge/tc358764.c
> +++ b/drivers/gpu/drm/bridge/tc358764.c
> @@ -153,9 +153,10 @@ static const char * const tc358764_supplies[] = {
>  struct tc358764 {
>  	struct device *dev;
>  	struct drm_bridge bridge;
> +	struct drm_connector connector;
>  	struct regulator_bulk_data supplies[ARRAY_SIZE(tc358764_supplies)];
>  	struct gpio_desc *gpio_reset;
> -	struct drm_bridge *panel_bridge;
> +	struct drm_panel *panel;
>  	int error;
>  };
>  
> @@ -209,6 +210,12 @@ static inline struct tc358764 *bridge_to_tc358764(struct drm_bridge *bridge)
>  	return container_of(bridge, struct tc358764, bridge);
>  }
>  
> +static inline
> +struct tc358764 *connector_to_tc358764(struct drm_connector *connector)
> +{
> +	return container_of(connector, struct tc358764, connector);
> +}
> +
>  static int tc358764_init(struct tc358764 *ctx)
>  {
>  	u32 v = 0;
> @@ -271,11 +278,43 @@ static void tc358764_reset(struct tc358764 *ctx)
>  	usleep_range(1000, 2000);
>  }
>  
> +static int tc358764_get_modes(struct drm_connector *connector)
> +{
> +	struct tc358764 *ctx = connector_to_tc358764(connector);
> +
> +	return drm_panel_get_modes(ctx->panel, connector);
> +}
> +
> +static const
> +struct drm_connector_helper_funcs tc358764_connector_helper_funcs = {
> +	.get_modes = tc358764_get_modes,
> +};
> +
> +static const struct drm_connector_funcs tc358764_connector_funcs = {
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static void tc358764_disable(struct drm_bridge *bridge)
> +{
> +	struct tc358764 *ctx = bridge_to_tc358764(bridge);
> +	int ret = drm_panel_disable(bridge_to_tc358764(bridge)->panel);
> +
> +	if (ret < 0)
> +		dev_err(ctx->dev, "error disabling panel (%d)\n", ret);
> +}
> +
>  static void tc358764_post_disable(struct drm_bridge *bridge)
>  {
>  	struct tc358764 *ctx = bridge_to_tc358764(bridge);
>  	int ret;
>  
> +	ret = drm_panel_unprepare(ctx->panel);
> +	if (ret < 0)
> +		dev_err(ctx->dev, "error unpreparing panel (%d)\n", ret);
>  	tc358764_reset(ctx);
>  	usleep_range(10000, 15000);
>  	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> @@ -296,28 +335,71 @@ static void tc358764_pre_enable(struct drm_bridge *bridge)
>  	ret = tc358764_init(ctx);
>  	if (ret < 0)
>  		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
> +	ret = drm_panel_prepare(ctx->panel);
> +	if (ret < 0)
> +		dev_err(ctx->dev, "error preparing panel (%d)\n", ret);
> +}
> +
> +static void tc358764_enable(struct drm_bridge *bridge)
> +{
> +	struct tc358764 *ctx = bridge_to_tc358764(bridge);
> +	int ret = drm_panel_enable(ctx->panel);
> +
> +	if (ret < 0)
> +		dev_err(ctx->dev, "error enabling panel (%d)\n", ret);
>  }
>  
>  static int tc358764_attach(struct drm_bridge *bridge,
>  			   enum drm_bridge_attach_flags flags)
> +{
> +	struct tc358764 *ctx = bridge_to_tc358764(bridge);
> +	struct drm_device *drm = bridge->dev;
> +	int ret;
> +
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> +		DRM_ERROR("Fix bridge driver to make connector optional!");
> +		return -EINVAL;
> +	}
> +
> +	ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
> +	ret = drm_connector_init(drm, &ctx->connector,
> +				 &tc358764_connector_funcs,
> +				 DRM_MODE_CONNECTOR_LVDS);
> +	if (ret) {
> +		DRM_ERROR("Failed to initialize connector\n");
> +		return ret;
> +	}
> +
> +	drm_connector_helper_add(&ctx->connector,
> +				 &tc358764_connector_helper_funcs);
> +	drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
> +	ctx->connector.funcs->reset(&ctx->connector);
> +	drm_connector_register(&ctx->connector);
> +
> +	return 0;
> +}
> +
> +static void tc358764_detach(struct drm_bridge *bridge)
>  {
>  	struct tc358764 *ctx = bridge_to_tc358764(bridge);
>  
> -	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
> -				 bridge, flags);
> +	drm_connector_unregister(&ctx->connector);
> +	ctx->panel = NULL;
> +	drm_connector_put(&ctx->connector);
>  }
>  
>  static const struct drm_bridge_funcs tc358764_bridge_funcs = {
> +	.disable = tc358764_disable,
>  	.post_disable = tc358764_post_disable,
> +	.enable = tc358764_enable,
>  	.pre_enable = tc358764_pre_enable,
>  	.attach = tc358764_attach,
> +	.detach = tc358764_detach,
>  };
>  
>  static int tc358764_parse_dt(struct tc358764 *ctx)
>  {
> -	struct drm_bridge *panel_bridge;
>  	struct device *dev = ctx->dev;
> -	struct drm_panel *panel;
>  	int ret;
>  
>  	ctx->gpio_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> @@ -326,16 +408,12 @@ static int tc358764_parse_dt(struct tc358764 *ctx)
>  		return PTR_ERR(ctx->gpio_reset);
>  	}
>  
> -	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
> -	if (ret)
> -		return ret;
> -
> -	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> -	if (IS_ERR(panel_bridge))
> -		return PTR_ERR(panel_bridge);
> +	ret = drm_of_find_panel_or_bridge(ctx->dev->of_node, 1, 0, &ctx->panel,
> +					  NULL);
> +	if (ret && ret != -EPROBE_DEFER)
> +		dev_err(dev, "cannot find panel (%d)\n", ret);
>  
> -	ctx->panel_bridge = panel_bridge;
> -	return 0;
> +	return ret;
>  }
>  
>  static int tc358764_configure_regulators(struct tc358764 *ctx)
> @@ -381,7 +459,6 @@ static int tc358764_probe(struct mipi_dsi_device *dsi)
>  		return ret;
>  
>  	ctx->bridge.funcs = &tc358764_bridge_funcs;
> -	ctx->bridge.type = DRM_MODE_CONNECTOR_LVDS;
>  	ctx->bridge.of_node = dev->of_node;
>  
>  	drm_bridge_add(&ctx->bridge);
> -- 
> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
