Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A5C346E86
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 02:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F9989D5F;
	Wed, 24 Mar 2021 01:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8797889D5F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 01:12:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D570580;
 Wed, 24 Mar 2021 02:12:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616548360;
 bh=vuJ0DJ9qBEKJ/rNxZ8TfWwwC3KkXweg/inkaD3SvBis=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l9u0FhdwnK7GE0kV+gqZ6kr1o5Sq808ZbOnOqFY0RCRXBISo7NsoT3pI48YDnbeAD
 GxHaY/n6LYJhtPUz9GHf+vGmk1X4s4Oi9PNDelNGEbHdThXXPCd5fngGAFyvhnD0LR
 fwtRzQHoE/oTWKWpGqieU103cK4dSwcfPCRFLo9w=
Date: Wed, 24 Mar 2021 03:11:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v4 3/4] drm: sun4i: dsi: Convert to bridge driver
Message-ID: <YFqR3mcXFrM1PNWo@pendragon.ideasonboard.com>
References: <20210322140152.101709-1-jagan@amarulasolutions.com>
 <20210322140152.101709-4-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322140152.101709-4-jagan@amarulasolutions.com>
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
 Samuel Holland <samuel@sholland.org>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

Thank you for the patch.

On Mon, Mar 22, 2021 at 07:31:51PM +0530, Jagan Teki wrote:
> DRM bridge drivers have build-in handling of treating all display
> pipeline components as bridges.
> 
> So, convert the existing to a drm bridge driver with a built-in
> encoder support for compatibility with existing component drivers.

It would be best if possible to move this patch before 2/4, to first
convert to the bridge model, and then build on top of it.

> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v4:
> - none
> Changes for v3:
> - new patch
> 
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 75 ++++++++++++++++----------
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  6 +++
>  2 files changed, 54 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> index 39321299dc27..6f3c5330a468 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -714,10 +714,10 @@ static int sun6i_dsi_start(struct sun6i_dsi *dsi,
>  	return 0;
>  }
>  
> -static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> +static void sun6i_dsi_bridge_enable(struct drm_bridge *bridge)
>  {
> -	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> -	struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
> +	struct drm_display_mode *mode = &bridge->encoder->crtc->state->adjusted_mode;
> +	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
>  	struct mipi_dsi_device *device = dsi->device;
>  	union phy_configure_opts opts = { };
>  	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> @@ -801,9 +801,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
>  	sun6i_dsi_start(dsi, DSI_START_HSD);
>  }
>  
> -static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
> +static void sun6i_dsi_bridge_disable(struct drm_bridge *bridge)
>  {
> -	struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
> +	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
>  
>  	DRM_DEBUG_DRIVER("Disabling DSI output\n");
>  
> @@ -852,9 +852,40 @@ static const struct drm_connector_funcs sun6i_dsi_connector_funcs = {
>  	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
>  };
>  
> -static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_funcs = {
> -	.disable	= sun6i_dsi_encoder_disable,
> -	.enable		= sun6i_dsi_encoder_enable,
> +static int sun6i_dsi_bridge_attach(struct drm_bridge *bridge,
> +				   enum drm_bridge_attach_flags flags)
> +{
> +	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
> +	int ret;
> +
> +	if (dsi->panel_bridge)
> +		return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, NULL, 0);
> +
> +	if (dsi->panel) {
> +		drm_connector_helper_add(&dsi->connector,
> +					 &sun6i_dsi_connector_helper_funcs);
> +		ret = drm_connector_init(bridge->dev, &dsi->connector,
> +					 &sun6i_dsi_connector_funcs,
> +					 DRM_MODE_CONNECTOR_DSI);
> +		if (ret) {
> +			dev_err(dsi->dev, "Couldn't initialise the DSI connector\n");
> +			goto err_cleanup_connector;
> +		}
> +
> +		drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
> +	}
> +
> +	return 0;
> +
> +err_cleanup_connector:
> +	drm_encoder_cleanup(&dsi->encoder);
> +	return ret;
> +}
> +
> +static const struct drm_bridge_funcs sun6i_dsi_bridge_funcs = {
> +	.enable		= sun6i_dsi_bridge_enable,
> +	.disable	= sun6i_dsi_bridge_disable,
> +	.attach		= sun6i_dsi_bridge_attach,
>  };
>  
>  static u32 sun6i_dsi_dcs_build_pkt_hdr(struct sun6i_dsi *dsi,
> @@ -1063,8 +1094,6 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
>  	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
>  	int ret;
>  
> -	drm_encoder_helper_add(&dsi->encoder,
> -			       &sun6i_dsi_enc_helper_funcs);
>  	ret = drm_simple_encoder_init(drm, &dsi->encoder,
>  				      DRM_MODE_ENCODER_DSI);
>  	if (ret) {
> @@ -1073,27 +1102,12 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
>  	}
>  	dsi->encoder.possible_crtcs = BIT(0);
>  
> -	drm_connector_helper_add(&dsi->connector,
> -				 &sun6i_dsi_connector_helper_funcs);
> -	ret = drm_connector_init(drm, &dsi->connector,
> -				 &sun6i_dsi_connector_funcs,
> -				 DRM_MODE_CONNECTOR_DSI);
> +	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL, 0);
>  	if (ret) {
> -		dev_err(dsi->dev,
> -			"Couldn't initialise the DSI connector\n");
> +		dev_err(dsi->dev, "Couldn't attach drm bridge\n");
>  		goto err_cleanup_connector;
>  	}
>  
> -	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
> -
> -	if (dsi->panel_bridge) {
> -		ret = drm_bridge_attach(&dsi->encoder, dsi->panel_bridge, NULL, 0);
> -		if (ret) {
> -			dev_err(dsi->dev, "Couldn't attach drm bridge\n");
> -			goto err_cleanup_connector;
> -		}
> -	}
> -
>  	return 0;
>  
>  err_cleanup_connector:
> @@ -1199,6 +1213,12 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
>  		goto err_unprotect_clk;
>  	}
>  
> +	dsi->bridge.funcs = &sun6i_dsi_bridge_funcs;
> +	dsi->bridge.of_node = dev->of_node;
> +	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> +
> +	drm_bridge_add(&dsi->bridge);
> +
>  	ret = component_add(&pdev->dev, &sun6i_dsi_ops);
>  	if (ret) {
>  		dev_err(dev, "Couldn't register our component\n");
> @@ -1222,6 +1242,7 @@ static int sun6i_dsi_remove(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
>  
> +	drm_bridge_remove(&dsi->bridge);
>  	component_del(&pdev->dev, &sun6i_dsi_ops);
>  	mipi_dsi_host_unregister(&dsi->host);
>  	clk_rate_exclusive_put(dsi->mod_clk);
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> index 370ecb356a63..5e70666089ad 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> @@ -16,6 +16,7 @@
>  #define SUN6I_DSI_TCON_DIV	4
>  
>  struct sun6i_dsi {
> +	struct drm_bridge	bridge;
>  	struct drm_connector	connector;
>  	struct drm_encoder	encoder;

The drm_encoder should be dropped from this driver, the encoder should
be created by the main display driver.

>  	struct mipi_dsi_host	host;
> @@ -38,6 +39,11 @@ static inline struct sun6i_dsi *host_to_sun6i_dsi(struct mipi_dsi_host *host)
>  	return container_of(host, struct sun6i_dsi, host);
>  };
>  
> +static inline struct sun6i_dsi *bridge_to_sun6i_dsi(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct sun6i_dsi, bridge);
> +}
> +
>  static inline struct sun6i_dsi *connector_to_sun6i_dsi(struct drm_connector *connector)
>  {
>  	return container_of(connector, struct sun6i_dsi, connector);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
