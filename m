Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DB93CC6E6
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jul 2021 01:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACED89F49;
	Sat, 17 Jul 2021 23:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDEB89F49
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 23:47:31 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1m4u1k-0007Nq-DG; Sun, 18 Jul 2021 01:47:24 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonathan Liu <net147@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: Find the possible DSI devices
Date: Sun, 18 Jul 2021 01:47:23 +0200
Message-ID: <8327301.GXAFRqVoOG@diego>
In-Reply-To: <20210704140309.268469-1-jagan@amarulasolutions.com>
References: <20210704140309.268469-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Sonntag, 4. Juli 2021, 16:03:09 CEST schrieb Jagan Teki:
> Finding panel_or_bridge might vary based on associated
> DSI devices like DSI panel, bridge, and I2C based DSI
> bridge.
> 
> 1. DSI panels and bridges will invoke the host attach
>    from probe in order to find the panel_or_bridge.
> 
>    chipone_probe()
>        dw_mipi_dsi_host_attach().start
> 	   dw_mipi_dsi_panel_or_bridge()
> 		...found the panel_or_bridge...
> 
>    ltdc_encoder_init().start
>        dw_mipi_dsi_bridge_attach().start
> 		   dw_mipi_dsi_host_attach().start
> 		       chipone_attach(). start
> 
> 	               chipone_attach(). done
> 		   dw_mipi_dsi_host_attach().done
>        dw_mipi_dsi_bridge_attach(). done
>    ltdc_encoder_init().done
> 
> 2. I2C based DSI bridge will invoke the drm_bridge_attach
>    from bridge attach in order to find the panel_or_bridge.
> 
>    ltdc_encoder_init().start
>        dw_mipi_dsi_bridge_attach().start
> 	   dw_mipi_dsi_panel_or_bridge()
> 		...found the panel_or_bridge...
> 		   dw_mipi_dsi_host_attach().start
> 		       sn65dsi83_attach(). start
> 
> 	               sn65dsi83_attach(). done
> 		   dw_mipi_dsi_host_attach().done
>        dw_mipi_dsi_bridge_attach(). done
>    ltdc_encoder_init().done
> 
> So, invoke the panel_or_bridge from host attach and
> bridge attach in order to find all possible DSI devices.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

On px30 with a dsi-display and rk3399 with my csi-phy patches
hooking into the rockchip-dsi
Tested-by: Heiko Stuebner <heiko@sntech.de>


> ---
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 58 ++++++++++++++-----
>  1 file changed, 43 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 6b268f9445b3..45f4515dda00 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -246,6 +246,7 @@ struct dw_mipi_dsi {
>  
>  	struct clk *pclk;
>  
> +	bool device_found;
>  	unsigned int lane_mbps; /* per lane */
>  	u32 channel;
>  	u32 lanes;
> @@ -309,13 +310,37 @@ static inline u32 dsi_read(struct dw_mipi_dsi *dsi, u32 reg)
>  	return readl(dsi->base + reg);
>  }
>  
> +static int dw_mipi_dsi_panel_or_bridge(struct dw_mipi_dsi *dsi,
> +				       struct device_node *node)
> +{
> +	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
> +	int ret;
> +
> +	ret = drm_of_find_panel_or_bridge(node, 1, 0, &panel, &bridge);
> +	if (ret)
> +		return ret;
> +
> +	if (panel) {
> +		bridge = drm_panel_bridge_add_typed(panel,
> +						    DRM_MODE_CONNECTOR_DSI);
> +		if (IS_ERR(bridge))
> +			return PTR_ERR(bridge);
> +	}
> +
> +	dsi->panel_bridge = bridge;
> +
> +	if (!dsi->panel_bridge)
> +		return -EPROBE_DEFER;
> +
> +	return 0;
> +}
> +
>  static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  				   struct mipi_dsi_device *device)
>  {
>  	struct dw_mipi_dsi *dsi = host_to_dsi(host);
>  	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
> -	struct drm_bridge *bridge;
> -	struct drm_panel *panel;
>  	int ret;
>  
>  	if (device->lanes > dsi->plat_data->max_data_lanes) {
> @@ -329,22 +354,14 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  	dsi->format = device->format;
>  	dsi->mode_flags = device->mode_flags;
>  
> -	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0,
> -					  &panel, &bridge);
> -	if (ret)
> -		return ret;
> +	if (!dsi->device_found) {
> +		ret = dw_mipi_dsi_panel_or_bridge(dsi, host->dev->of_node);
> +		if (ret)
> +			return ret;
>  
> -	if (panel) {
> -		bridge = drm_panel_bridge_add_typed(panel,
> -						    DRM_MODE_CONNECTOR_DSI);
> -		if (IS_ERR(bridge))
> -			return PTR_ERR(bridge);
> +		dsi->device_found = true;
>  	}
>  
> -	dsi->panel_bridge = bridge;
> -
> -	drm_bridge_add(&dsi->bridge);
> -
>  	if (pdata->host_ops && pdata->host_ops->attach) {
>  		ret = pdata->host_ops->attach(pdata->priv_data, device);
>  		if (ret < 0)
> @@ -999,6 +1016,16 @@ static int dw_mipi_dsi_bridge_attach(struct drm_bridge *bridge,
>  	/* Set the encoder type as caller does not know it */
>  	bridge->encoder->encoder_type = DRM_MODE_ENCODER_DSI;
>  
> +	if (!dsi->device_found) {
> +		int ret;
> +
> +		ret = dw_mipi_dsi_panel_or_bridge(dsi, dsi->dev->of_node);
> +		if (ret)
> +			return ret;
> +
> +		dsi->device_found = true;
> +	}
> +
>  	/* Attach the panel-bridge to the dsi bridge */
>  	return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, bridge,
>  				 flags);
> @@ -1181,6 +1208,7 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>  #ifdef CONFIG_OF
>  	dsi->bridge.of_node = pdev->dev.of_node;
>  #endif
> +	drm_bridge_add(&dsi->bridge);
>  
>  	return dsi;
>  }
> 




