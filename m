Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE29415AD2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 11:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D92D6E0FC;
	Thu, 23 Sep 2021 09:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5037C6E0FC
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 09:23:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42AB645E;
 Thu, 23 Sep 2021 11:23:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1632388987;
 bh=VjJpqIAYH2MRk9pUvcqP/sn9mrtZsubUoivRdIenC1M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CyyrQQVefFjU+Ssk9+5S9UHyjpRxRTZwuQpr0EeqgkO9WyX99mgYyj8t518/6w0vO
 WKNJfhHlRCTxmBOrkhqaSXXxNWf5yF0302qwN7zHan5/nBfBCj7B+Gc4v7XWKuh6GT
 /uAX5MhmELaVMNnwWOV17g3fCoL9jMlqxWAZDgSU=
Date: Thu, 23 Sep 2021 12:23:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-mips <linux-mips@vger.kernel.org>, list@opendingux.net,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 6/6] drm/ingenic: Attach bridge chain to encoders
Message-ID: <YUxHeTRr2JOIFSLh@pendragon.ideasonboard.com>
References: <20210922205555.496871-1-paul@crapouillou.net>
 <20210922205555.496871-7-paul@crapouillou.net>
 <32234186-1802-4FDF-801A-B14E48FB86D8@goldelico.com>
 <RTPVZQ.WN90B9MHPMZ13@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <RTPVZQ.WN90B9MHPMZ13@crapouillou.net>
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

Hello,

On Thu, Sep 23, 2021 at 09:49:03AM +0100, Paul Cercueil wrote:
> Le jeu., sept. 23 2021 at 07:52:08 +0200, H. Nikolaus Schaller a écrit :
> > Hi Paul,
> > thanks for another update.
> > 
> > We have been delayed to rework the CI20 HDMI code on top of your series
> > but it basically works in some situations. There is for example a problem
> > if the EDID reports DRM_COLOR_FORMAT_YCRCB422 but it appears to be outside
> > of your series.
> 
> I think the SoC can output YCbCr as well, but I never tried to use it.
> 
> > The only issue we have is described below.
> > 
> >>  Am 22.09.2021 um 22:55 schrieb Paul Cercueil <paul@crapouillou.net>:
> >> 
> >>  Attach a top-level bridge to each encoder, which will be used for
> >>  negociating the bus format and flags.
> >> 
> >>  All the bridges are now attached with DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> >> 
> >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> >>  ---
> >>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 92 +++++++++++++++++------
> >>  1 file changed, 70 insertions(+), 22 deletions(-)
> >> 
> >>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> >>  index a5e2880e07a1..a05a9fa6e115 100644
> >>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> >>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> >>  @@ -21,6 +21,7 @@
> >>  #include <drm/drm_atomic.h>
> >>  #include <drm/drm_atomic_helper.h>
> >>  #include <drm/drm_bridge.h>
> >>  +#include <drm/drm_bridge_connector.h>
> >>  #include <drm/drm_color_mgmt.h>
> >>  #include <drm/drm_crtc.h>
> >>  #include <drm/drm_crtc_helper.h>
> >>  @@ -108,6 +109,19 @@ struct ingenic_drm {
> >>  	struct drm_private_obj private_obj;
> >>  };
> >> 
> >>  +struct ingenic_drm_bridge {
> >>  +	struct drm_encoder encoder;
> >>  +	struct drm_bridge bridge, *next_bridge;
> >>  +
> >>  +	struct drm_bus_cfg bus_cfg;
> >>  +};
> >>  +
> >>  +static inline struct ingenic_drm_bridge *
> >>  +to_ingenic_drm_bridge(struct drm_encoder *encoder)
> >>  +{
> >>  +	return container_of(encoder, struct ingenic_drm_bridge, encoder);
> >>  +}
> >>  +
> >>  static inline struct ingenic_drm_private_state *
> >>  to_ingenic_drm_priv_state(struct drm_private_state *state)
> >>  {
> >>  @@ -668,11 +682,10 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
> >>  {
> >>  	struct ingenic_drm *priv = drm_device_get_priv(encoder->dev);
> >>  	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> >>  -	struct drm_connector *conn = conn_state->connector;
> >>  -	struct drm_display_info *info = &conn->display_info;
> >>  +	struct ingenic_drm_bridge *bridge = to_ingenic_drm_bridge(encoder);
> >>  	unsigned int cfg, rgbcfg = 0;
> >> 
> >>  -	priv->panel_is_sharp = info->bus_flags & DRM_BUS_FLAG_SHARP_SIGNALS;
> >>  +	priv->panel_is_sharp = bridge->bus_cfg.flags & DRM_BUS_FLAG_SHARP_SIGNALS;
> >> 
> >>  	if (priv->panel_is_sharp) {
> >>  		cfg = JZ_LCD_CFG_MODE_SPECIAL_TFT_1 | JZ_LCD_CFG_REV_POLARITY;
> >>  @@ -685,19 +698,19 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
> >>  		cfg |= JZ_LCD_CFG_HSYNC_ACTIVE_LOW;
> >>  	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> >>  		cfg |= JZ_LCD_CFG_VSYNC_ACTIVE_LOW;
> >>  -	if (info->bus_flags & DRM_BUS_FLAG_DE_LOW)
> >>  +	if (bridge->bus_cfg.flags & DRM_BUS_FLAG_DE_LOW)
> >>  		cfg |= JZ_LCD_CFG_DE_ACTIVE_LOW;
> >>  -	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> >>  +	if (bridge->bus_cfg.flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> >>  		cfg |= JZ_LCD_CFG_PCLK_FALLING_EDGE;
> >> 
> >>  	if (!priv->panel_is_sharp) {
> >>  -		if (conn->connector_type == DRM_MODE_CONNECTOR_TV) {
> >>  +		if (conn_state->connector->connector_type == DRM_MODE_CONNECTOR_TV) {
> >>  			if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> >>  				cfg |= JZ_LCD_CFG_MODE_TV_OUT_I;
> >>  			else
> >>  				cfg |= JZ_LCD_CFG_MODE_TV_OUT_P;
> >>  		} else {
> >>  -			switch (*info->bus_formats) {
> >>  +			switch (bridge->bus_cfg.format) {
> >>  			case MEDIA_BUS_FMT_RGB565_1X16:
> >>  				cfg |= JZ_LCD_CFG_MODE_GENERIC_16BIT;
> >>  				break;
> >>  @@ -723,20 +736,29 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
> >>  	regmap_write(priv->map, JZ_REG_LCD_RGBC, rgbcfg);
> >>  }
> >> 
> >>  -static int ingenic_drm_encoder_atomic_check(struct drm_encoder *encoder,
> >>  -					    struct drm_crtc_state *crtc_state,
> >>  -					    struct drm_connector_state *conn_state)
> >>  +static int ingenic_drm_bridge_attach(struct drm_bridge *bridge,
> >>  +				     enum drm_bridge_attach_flags flags)
> >>  +{
> >>  +	struct ingenic_drm_bridge *ib = to_ingenic_drm_bridge(bridge->encoder);
> >>  +
> >>  +	return drm_bridge_attach(bridge->encoder, ib->next_bridge,
> >>  +				 &ib->bridge, flags);
> >>  +}
> >>  +
> >>  +static int ingenic_drm_bridge_atomic_check(struct drm_bridge *bridge,
> >>  +					   struct drm_bridge_state *bridge_state,
> >>  +					   struct drm_crtc_state *crtc_state,
> >>  +					   struct drm_connector_state *conn_state)
> >>  {
> >>  -	struct drm_display_info *info = &conn_state->connector->display_info;
> >>  	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> >>  +	struct ingenic_drm_bridge *ib = to_ingenic_drm_bridge(bridge->encoder);
> >> 
> >>  -	if (info->num_bus_formats != 1)
> >>  -		return -EINVAL;
> >>  +	ib->bus_cfg = bridge_state->output_bus_cfg;
> >> 
> >>  	if (conn_state->connector->connector_type == DRM_MODE_CONNECTOR_TV)
> >>  		return 0;
> >> 
> >>  -	switch (*info->bus_formats) {
> >>  +	switch (bridge_state->output_bus_cfg.format) {
> >>  	case MEDIA_BUS_FMT_RGB888_3X8:
> >>  	case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
> >>  		/*
> >>  @@ -900,8 +922,16 @@ static const struct drm_crtc_helper_funcs ingenic_drm_crtc_helper_funcs = {
> >>  };
> >> 
> >>  static const struct drm_encoder_helper_funcs ingenic_drm_encoder_helper_funcs = {
> >>  -	.atomic_mode_set	= ingenic_drm_encoder_atomic_mode_set,
> >>  -	.atomic_check		= ingenic_drm_encoder_atomic_check,
> >>  +	.atomic_mode_set        = ingenic_drm_encoder_atomic_mode_set,
> >>  +};
> >>  +
> >>  +static const struct drm_bridge_funcs ingenic_drm_bridge_funcs = {
> >>  +	.attach			= ingenic_drm_bridge_attach,
> >>  +	.atomic_check		= ingenic_drm_bridge_atomic_check,
> >>  +	.atomic_reset		= drm_atomic_helper_bridge_reset,
> >>  +	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
> >>  +	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
> >>  +	.atomic_get_input_bus_fmts = drm_atomic_helper_bridge_propagate_bus_fmt,
> >>  };
> >> 
> >>  static const struct drm_mode_config_funcs ingenic_drm_mode_config_funcs = {
> >>  @@ -976,7 +1006,9 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
> >>  	struct drm_plane *primary;
> >>  	struct drm_bridge *bridge;
> >>  	struct drm_panel *panel;
> >>  +	struct drm_connector *connector;
> >>  	struct drm_encoder *encoder;
> >>  +	struct ingenic_drm_bridge *ib;
> >>  	struct drm_device *drm;
> >>  	void __iomem *base;
> >>  	long parent_rate;
> >>  @@ -1154,20 +1186,36 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
> >>  			bridge = devm_drm_panel_bridge_add_typed(dev, panel,
> >>  								 DRM_MODE_CONNECTOR_DPI);
> >> 
> >>  -		encoder = drmm_plain_encoder_alloc(drm, NULL, DRM_MODE_ENCODER_DPI, NULL);
> >>  -		if (IS_ERR(encoder)) {
> >>  -			ret = PTR_ERR(encoder);
> >>  +		ib = drmm_encoder_alloc(drm, struct ingenic_drm_bridge, encoder,
> >>  +					NULL, DRM_MODE_ENCODER_DPI, NULL);
> >>  +		if (IS_ERR(ib)) {
> >>  +			ret = PTR_ERR(ib);
> >>  			dev_err(dev, "Failed to init encoder: %d\n", ret);
> >>  			return ret;
> >>  		}
> >> 
> >>  -		encoder->possible_crtcs = 1;
> >>  +		encoder = &ib->encoder;
> >>  +		encoder->possible_crtcs = drm_crtc_mask(&priv->crtc);
> >> 
> >>  		drm_encoder_helper_add(encoder, &ingenic_drm_encoder_helper_funcs);
> >> 
> >>  -		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
> >>  -		if (ret)
> >>  +		ib->bridge.funcs = &ingenic_drm_bridge_funcs;
> >>  +		ib->next_bridge = bridge;
> >>  +
> >>  +		ret = drm_bridge_attach(encoder, &ib->bridge, NULL,
> >>  +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > 
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR makes it fundamentally incompatible
> > with synopsys/dw_hdmi.c
> > 
> > That driver checks for DRM_BRIDGE_ATTACH_NO_CONNECTOR being NOT present,
> > since it wants to register its own connector through 
> > dw_hdmi_connector_create().

Does it ? The driver has

static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
                                 enum drm_bridge_attach_flags flags)
{
	struct dw_hdmi *hdmi = bridge->driver_private;

	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
					 bridge, flags);

	return dw_hdmi_connector_create(hdmi);
}

If DRM_BRIDGE_ATTACH_NO_CONNECTOR is not set, it will create a
connector, otherwise it will just attach to the next bridge. I'm using
it on a Renesas platform with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
set, without any issue as far as I can tell.

> > It does it for a reason: the dw-hdmi is a multi-function driver which does
> > HDMI and DDC/EDID stuff in a single driver (because I/O registers and power
> > management seem to be shared).
> 
> The IT66121 driver does all of that too, and does not need 
> DRM_BRIDGE_ATTACH_NO_CONNECTOR. The drm_bridge_funcs struct has 
> callbacks to handle cable detection and DDC stuff.
> 
> > Since I do not see who could split this into a separate bridge and a connector driver
> > and test it on multiple SoC platforms (there are at least 3 or 4), I think modifying
> > the fundamentals of the dw-hdmi architecture just to get CI20 HDMI working is not
> > our turf.
> 
> You could have a field in the dw-hdmi pdata structure, that would 
> instruct the driver whether or not it should use the new API. Ugly, I 
> know, and would probably duplicate a lot of code, but that would allow 
> other drivers to be updated at a later date.
> 
> > Therefore the code here should be able to detect if drm_bridge_attach() already
> > creates and attaches a connector and then skip the code below.
> 
> Not that easy, unfortunately. On one side we have dw-hdmi which checks 
> that DRM_BRIDGE_ATTACH_NO_CONNECTOR is not set, and on the other side 
> we have other drivers like the IT66121 which will fail if this flag is 
> not set.

> >>  +		if (ret) {
> >>  +			dev_err(dev, "Unable to attach bridge\n");
> >>  			return ret;
> >>  +		}
> >>  +
> >>  +		connector = drm_bridge_connector_init(drm, encoder);
> >>  +		if (IS_ERR(connector)) {
> >>  +			dev_err(dev, "Unable to init connector\n");
> >>  +			return PTR_ERR(connector);
> >>  +		}
> >>  +
> >>  +		drm_connector_attach_encoder(connector, encoder);
> >>  	}
> >> 
> >>  	drm_for_each_encoder(encoder, drm) {
> >>  --
> >>  2.33.0
> > 
> > I haven't replaced v2 with v3 in our test tree yet, but will do asap.

-- 
Regards,

Laurent Pinchart
