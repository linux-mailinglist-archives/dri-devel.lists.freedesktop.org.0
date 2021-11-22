Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 936B5458E9F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 13:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CAE6E0EF;
	Mon, 22 Nov 2021 12:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014996E0EF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 12:45:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0C2F14C3;
 Mon, 22 Nov 2021 13:45:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1637585142;
 bh=Fb0Ic+6FgKbOwIEWyVXc2jNdQwfMfrI/wPnTiG04rOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tkcd77yaUzlWvOKPmJxEi8Gss6gAGMeWPb+XnMRMWYTSw3Q8YYVckvLwxLebIeT1I
 s9E+pczAwKB+bxzXYZx9r275Yq+w6uasGJ8FDWqr5Lxqfp7Sh1KB1qhBIEompR35ig
 oz4hvu6q+HmMdRLk7y9JKdcUgQrotRgyeGWMrOw0=
Date: Mon, 22 Nov 2021 14:45:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v5 3/7] drm: sun4i: dsi: Convert to bridge driver
Message-ID: <YZuQ30O5/PcFEFMT@pendragon.ideasonboard.com>
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-4-jagan@amarulasolutions.com>
 <20211122100712.dls4eqsu6o5gcc5k@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211122100712.dls4eqsu6o5gcc5k@gilmour>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Mon, Nov 22, 2021 at 11:07:12AM +0100, Maxime Ripard wrote:
> On Mon, Nov 22, 2021 at 12:22:19PM +0530, Jagan Teki wrote:
> > Some display panels would come up with a non-DSI output, those
> > can have an option to connect the DSI host by means of interface
> > bridge converter.
> > 
> > This DSI to non-DSI interface bridge converter would requires
> > DSI Host to handle drm bridge functionalities in order to DSI
> > Host to Interface bridge.
> 
> In order to do this you would need to use the DRM bridge API...
> 
> > This patch convert the existing to a drm bridge driver with a
> > built-in encoder support for compatibility with existing
> > component drivers.
> 
> ... but changing the encoder driver to a bridge is completely
> unnecessary to do so. Why did you need to make that change?
> 
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >
> > ---
> > Changes for v5:
> > - add atomic APIs
> > - find host and device variant DSI devices.
> > Changes for v4, v3:
> > - none
> > 
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 112 ++++++++++++++++++++-----
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |   7 ++
> >  2 files changed, 96 insertions(+), 23 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > index 43d9c9e5198d..a6a272b55f77 100644
> > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > @@ -21,6 +21,7 @@
> >  
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_of.h>
> >  #include <drm/drm_panel.h>
> >  #include <drm/drm_print.h>
> >  #include <drm/drm_probe_helper.h>
> > @@ -713,10 +714,11 @@ static int sun6i_dsi_start(struct sun6i_dsi *dsi,
> >  	return 0;
> >  }
> >  
> > -static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> > +static void sun6i_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> > +					   struct drm_bridge_state *old_bridge_state)
> >  {
> > -	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> > -	struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
> > +	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
> > +	struct drm_display_mode *mode = &bridge->encoder->crtc->state->adjusted_mode;
> >  	struct mipi_dsi_device *device = dsi->device;
> >  	union phy_configure_opts opts = { };
> >  	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> > @@ -772,6 +774,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> >  	if (dsi->panel)
> >  		drm_panel_prepare(dsi->panel);
> >  
> > +	if (dsi->next_bridge)
> > +		dsi->next_bridge->funcs->atomic_pre_enable(dsi->next_bridge, old_bridge_state);
> > +
> 
> Please use the proper helpers.

I don't know about this series in particular, but overall we try to move
encoders to bridge drivers in order to standardize on a single API. The
drm_encoder can't be removed as it's exposed to userspace, so it then
becomes a dumb encoder, without any operation implemented.

> >  	/*
> >  	 * FIXME: This should be moved after the switch to HS mode.
> >  	 *
> > @@ -787,6 +792,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> >  	if (dsi->panel)
> >  		drm_panel_enable(dsi->panel);
> >  
> > +	if (dsi->next_bridge)
> > +		dsi->next_bridge->funcs->atomic_enable(dsi->next_bridge, old_bridge_state);
> > +
> 
> Ditto
> 
> >  	sun6i_dsi_start(dsi, DSI_START_HSC);
> >  
> >  	udelay(1000);
> > @@ -794,15 +802,19 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> >  	sun6i_dsi_start(dsi, DSI_START_HSD);
> >  }
> >  
> > -static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
> > +static void sun6i_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
> > +					    struct drm_bridge_state *old_bridge_state)
> >  {
> > -	struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
> > +	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
> >  
> >  	DRM_DEBUG_DRIVER("Disabling DSI output\n");
> >  
> >  	if (dsi->panel) {
> >  		drm_panel_disable(dsi->panel);
> >  		drm_panel_unprepare(dsi->panel);
> > +	} else if (dsi->next_bridge) {
> > +		dsi->next_bridge->funcs->atomic_disable(dsi->next_bridge, old_bridge_state);
> > +		dsi->next_bridge->funcs->atomic_post_disable(dsi->next_bridge, old_bridge_state);
> 
> Ditto
> 
> >  	}
> >  
> >  	phy_power_off(dsi->dphy);
> > @@ -842,9 +854,25 @@ static const struct drm_connector_funcs sun6i_dsi_connector_funcs = {
> >  	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
> >  };
> >  
> > -static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_funcs = {
> > -	.disable	= sun6i_dsi_encoder_disable,
> > -	.enable		= sun6i_dsi_encoder_enable,
> > +static int sun6i_dsi_bridge_attach(struct drm_bridge *bridge,
> > +				   enum drm_bridge_attach_flags flags)
> > +{
> > +	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
> > +
> > +	if (dsi->next_bridge)
> > +		return drm_bridge_attach(bridge->encoder, dsi->next_bridge,
> > +					 NULL, 0);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct drm_bridge_funcs sun6i_dsi_bridge_funcs = {
> > +	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
> > +	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
> > +	.atomic_reset		= drm_atomic_helper_bridge_reset,
> > +	.atomic_enable		= sun6i_dsi_bridge_atomic_enable,
> > +	.atomic_disable		= sun6i_dsi_bridge_atomic_disable,
> > +	.attach			= sun6i_dsi_bridge_attach,
> >  };
> >  
> >  static u32 sun6i_dsi_dcs_build_pkt_hdr(struct sun6i_dsi *dsi,
> > @@ -966,8 +994,6 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
> >  	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
> >  	int ret;
> >  
> > -	drm_encoder_helper_add(&dsi->encoder,
> > -			       &sun6i_dsi_enc_helper_funcs);
> >  	ret = drm_simple_encoder_init(drm, &dsi->encoder,
> >  				      DRM_MODE_ENCODER_DSI);
> >  	if (ret) {
> > @@ -976,18 +1002,26 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
> >  	}
> >  	dsi->encoder.possible_crtcs = BIT(0);
> >  
> > -	drm_connector_helper_add(&dsi->connector,
> > -				 &sun6i_dsi_connector_helper_funcs);
> > -	ret = drm_connector_init(drm, &dsi->connector,
> > -				 &sun6i_dsi_connector_funcs,
> > -				 DRM_MODE_CONNECTOR_DSI);
> > +	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL, 0);
> >  	if (ret) {
> > -		dev_err(dsi->dev,
> > -			"Couldn't initialise the DSI connector\n");
> > +		dev_err(dsi->dev, "Couldn't attach drm bridge\n");
> >  		goto err_cleanup_connector;
> >  	}
> >  
> > -	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
> > +	if (dsi->panel) {
> > +		drm_connector_helper_add(&dsi->connector,
> > +					 &sun6i_dsi_connector_helper_funcs);
> > +		ret = drm_connector_init(drm, &dsi->connector,
> > +					 &sun6i_dsi_connector_funcs,
> > +					 DRM_MODE_CONNECTOR_DSI);
> > +		if (ret) {
> > +			dev_err(dsi->dev,
> > +				"Couldn't initialise the DSI connector\n");
> > +			goto err_cleanup_connector;
> > +		}
> > +
> > +		drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
> > +	}
> >  
> >  	return 0;
> >  
> > @@ -1013,16 +1047,46 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
> >  			    struct mipi_dsi_device *device)
> >  {
> >  	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
> > -	struct drm_panel *panel = of_drm_find_panel(device->dev.of_node);
> > +	struct device_node *remote = device->dev.of_node;
> >  	int ret;
> >  
> > -	if (IS_ERR(panel))
> > -		return PTR_ERR(panel);
> > +	if (!of_device_is_available(remote)) {
> > +		/**
> > +		 * I2C interfaced DSI bridges will register DSI host on the
> > +		 * bridge drivers instead of conventional device.
> > +		 *
> > +		 * Those are probed via host of_node instead of device of_node.
> > +		 */
> 
> I have no idea what you mean here. Can you expand on what issue you've
> tried to solve here?
> 
> > +		remote = of_graph_get_remote_node(host->dev->of_node, 0, 0);
> > +		if (!remote)
> > +			return -ENODEV;
> > +	}
> > +
> > +	dsi->panel = of_drm_find_panel(remote);
> > +	if (IS_ERR(dsi->panel)) {
> > +		dsi->panel = NULL;
> > +
> > +		dsi->next_bridge = of_drm_find_bridge(remote);
> > +		if (IS_ERR(dsi->next_bridge)) {
> > +			dev_err(dsi->dev, "failed to find bridge\n");
> > +			return PTR_ERR(dsi->next_bridge);
> > +		}
> > +	} else {
> > +		dsi->next_bridge = NULL;
> > +	}
> > +
> > +	of_node_put(remote);
> 
> Using devm_drm_of_get_bridge would greatly simplify the driver
> 
> Maxime



-- 
Regards,

Laurent Pinchart
