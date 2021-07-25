Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0053D4EE5
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 19:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3555A6E42F;
	Sun, 25 Jul 2021 17:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A696E42F
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 17:08:29 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id f7c3d2b2-ed6a-11eb-8d1a-0050568cd888;
 Sun, 25 Jul 2021 17:08:44 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 301A2194B37;
 Sun, 25 Jul 2021 19:08:47 +0200 (CEST)
Date: Sun, 25 Jul 2021 19:08:26 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [RFC PATCH 01/17] drm/exynos: dsi: Convert to bridge driver
Message-ID: <YP2aiv3kQXMh3wLd@ravnborg.org>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <20210704090230.26489-2-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704090230.26489-2-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

See a few comments below.

	Sam

On Sun, Jul 04, 2021 at 02:32:14PM +0530, Jagan Teki wrote:
> DRM bridge drivers have built-in handling of treating
> all display pipeline components as bridges.
> 
> Convert exynos_drm_dsi to a bridge driver with built-in
> encoder support for compatibility with existing component
> drivers.
> 
> This keeps switching the driver into the bridge in a more
> feasible manner.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 57 +++++++++++++++++--------
>  1 file changed, 39 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 1d777d8c1a83..90d2ce2c3055 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -257,6 +257,7 @@ struct exynos_dsi {
>  	struct drm_connector connector;
>  	struct drm_panel *panel;
>  	struct list_head bridge_chain;
> +	struct drm_bridge bridge;
>  	struct drm_bridge *out_bridge;
>  	struct device *dev;
>  
> @@ -287,9 +288,9 @@ struct exynos_dsi {
>  #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
>  #define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
>  
> -static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
> +static inline struct exynos_dsi *bridge_to_dsi(struct drm_bridge *b)
>  {
> -	return container_of(e, struct exynos_dsi, encoder);
> +	return container_of(b, struct exynos_dsi, bridge);
>  }
>  
>  enum reg_idx {
> @@ -1374,9 +1375,9 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
>  	}
>  }
>  
> -static void exynos_dsi_enable(struct drm_encoder *encoder)
> +static void exynos_dsi_bridge_enable(struct drm_bridge *bridge)
>  {
> -	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>  	struct drm_bridge *iter;
>  	int ret;
>  
> @@ -1429,9 +1430,9 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
>  	pm_runtime_put(dsi->dev);
>  }
>  
> -static void exynos_dsi_disable(struct drm_encoder *encoder)
> +static void exynos_dsi_bridge_disable(struct drm_bridge *bridge)
>  {
> -	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>  	struct drm_bridge *iter;
>  
>  	if (!(dsi->state & DSIM_STATE_ENABLED))
> @@ -1494,9 +1495,9 @@ static const struct drm_connector_helper_funcs exynos_dsi_connector_helper_funcs
>  	.get_modes = exynos_dsi_get_modes,
>  };
>  
> -static int exynos_dsi_create_connector(struct drm_encoder *encoder)
> +static int exynos_dsi_create_connector(struct exynos_dsi *dsi)
>  {
> -	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> +	struct drm_encoder *encoder = &dsi->encoder;
>  	struct drm_connector *connector = &dsi->connector;
>  	struct drm_device *drm = encoder->dev;
>  	int ret;
> @@ -1522,9 +1523,16 @@ static int exynos_dsi_create_connector(struct drm_encoder *encoder)
>  	return 0;
>  }
>  
> -static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
> -	.enable = exynos_dsi_enable,
> -	.disable = exynos_dsi_disable,
> +static int exynos_dsi_bridge_attach(struct drm_bridge *bridge,
> +				    enum drm_bridge_attach_flags flags)
> +{
> +	return 0;
> +}
> +
> +static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
> +	.enable = exynos_dsi_bridge_enable,
> +	.disable = exynos_dsi_bridge_disable,
> +	.attach = exynos_dsi_bridge_attach,
>  };
For new bridge drivers please use atomic_{enable,disable}.
The non-atomic variants are deprecated and it is now also documneted.
It was not documented when you wrote this patch!

	Sam
>  
>  MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
> @@ -1543,7 +1551,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>  		dsi->out_bridge = out_bridge;
>  		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
>  	} else {
> -		int ret = exynos_dsi_create_connector(encoder);
> +		int ret = exynos_dsi_create_connector(dsi);
>  
>  		if (ret) {
>  			DRM_DEV_ERROR(dsi->dev,
> @@ -1596,7 +1604,7 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>  
>  	if (dsi->panel) {
>  		mutex_lock(&drm->mode_config.mutex);
> -		exynos_dsi_disable(&dsi->encoder);
> +		exynos_dsi_bridge_disable(&dsi->bridge);
>  		dsi->panel = NULL;
>  		dsi->connector.status = connector_status_disconnected;
>  		mutex_unlock(&drm->mode_config.mutex);
> @@ -1702,12 +1710,16 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
>  
>  	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
>  
> -	drm_encoder_helper_add(encoder, &exynos_dsi_encoder_helper_funcs);
> -
>  	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
>  	if (ret < 0)
>  		return ret;
>  
> +	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL, 0);

I assume a later patch will move connector creation to the display
driver.


> +	if (ret) {
> +		drm_encoder_cleanup(&dsi->encoder);
> +		return ret;
> +	}
> +
>  	in_bridge_node = of_graph_get_remote_node(dev->of_node, DSI_PORT_IN, 0);
>  	if (in_bridge_node) {
>  		in_bridge = of_drm_find_bridge(in_bridge_node);
> @@ -1723,10 +1735,9 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
>  				void *data)
>  {
>  	struct exynos_dsi *dsi = dev_get_drvdata(dev);
> -	struct drm_encoder *encoder = &dsi->encoder;
> -
> -	exynos_dsi_disable(encoder);
>  
> +	exynos_dsi_bridge_disable(&dsi->bridge);
> +	drm_encoder_cleanup(&dsi->encoder);
>  	mipi_dsi_host_unregister(&dsi->dsi_host);
>  }
>  
> @@ -1821,6 +1832,12 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>  
>  	pm_runtime_enable(dev);
>  
> +	dsi->bridge.funcs = &exynos_dsi_bridge_funcs;
> +	dsi->bridge.of_node = dev->of_node;
> +	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> +
> +	drm_bridge_add(&dsi->bridge);
> +
>  	ret = component_add(dev, &exynos_dsi_component_ops);
>  	if (ret)
>  		goto err_disable_runtime;
> @@ -1835,6 +1852,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>  
>  static int exynos_dsi_remove(struct platform_device *pdev)
>  {
> +	struct exynos_dsi *dsi = platform_get_drvdata(pdev);
> +
> +	drm_bridge_remove(&dsi->bridge);
> +
>  	pm_runtime_disable(&pdev->dev);
>  
>  	component_del(&pdev->dev, &exynos_dsi_component_ops);
> -- 
> 2.25.1
