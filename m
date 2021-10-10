Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3551042807A
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 12:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990A96E28A;
	Sun, 10 Oct 2021 10:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBB86E28A
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 10:25:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26BFA2FD;
 Sun, 10 Oct 2021 12:25:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1633861526;
 bh=WoeJZzGDCwjm7Y4JOixxwSO7/xkoRnEs+xf2HIGpx6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mreN5K91Zv+sY1QkeotKqYFv8xoA3K6D28esaehL0TMen6oAN3c6nyjUi8VJdAzkV
 OtbLYx+FRap1zPRNvhz4vcSGTqRjGf55AQeWR53z6oTujWUcEqVw5ENJcTxGGIVrHQ
 fwhTAP3m2UCTXmp449jNPiQS/C8O9nmzlQHOXy+0=
Date: Sun, 10 Oct 2021 13:25:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 2/2] drm/bridge: lvds-codec: Add support for LVDS data
 mapping select
Message-ID: <YWK/it9fu4yojFH5@pendragon.ideasonboard.com>
References: <20211009224152.427219-1-marex@denx.de>
 <20211009224152.427219-2-marex@denx.de>
 <YWKhVrqwANLHoc8H@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YWKhVrqwANLHoc8H@ravnborg.org>
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

Hi Sam,

On Sun, Oct 10, 2021 at 10:16:22AM +0200, Sam Ravnborg wrote:
> On Sun, Oct 10, 2021 at 12:41:52AM +0200, Marek Vasut wrote:
> > Decoder input LVDS format is a property of the decoder chip or even
> > its strapping. Handle data-mapping the same way lvds-panel does. In
> > case data-mapping is not present, do nothing, since there are still
> > legacy bindings which do not specify this property.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > To: dri-devel@lists.freedesktop.org
> 
> I am late to the game here - sorry. A few details in the following.
> With these considered:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> > ---
> > V2: - Move the data-mapping to endpoint
> > V3: - Rebase on V2 submitted a while ago, reinstate changelog
> >     - Use .atomic_get_input_bus_fmts for the decoder, separate funcs for encoder
> > V4: - No change
> > V5: - Move the data-mapping property to port@0 , decoder LVDS input
> >     - Add RB from Laurent
> > ---
> >  drivers/gpu/drm/bridge/lvds-codec.c | 76 ++++++++++++++++++++++++++++-
> >  1 file changed, 75 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> > index dcf579a4cf83..08091bab4857 100644
> > --- a/drivers/gpu/drm/bridge/lvds-codec.c
> > +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/regulator/consumer.h>
> >  
> > +#include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_bridge.h>
> >  #include <drm/drm_panel.h>
> >  
> > @@ -22,6 +23,7 @@ struct lvds_codec {
> >  	struct regulator *vcc;
> >  	struct gpio_desc *powerdown_gpio;
> >  	u32 connector_type;
> > +	unsigned int bus_format;
> >  };
> >  
> >  static inline struct lvds_codec *to_lvds_codec(struct drm_bridge *bridge)
> > @@ -74,12 +76,50 @@ static const struct drm_bridge_funcs funcs = {
> >  	.disable = lvds_codec_disable,
> >  };
> >  
> > +#define MAX_INPUT_SEL_FORMATS 1
> > +static u32 *
> > +lvds_codec_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > +				     struct drm_bridge_state *bridge_state,
> > +				     struct drm_crtc_state *crtc_state,
> > +				     struct drm_connector_state *conn_state,
> > +				     u32 output_fmt,
> > +				     unsigned int *num_input_fmts)
> > +{
> > +	struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
> > +	u32 *input_fmts;
> > +
> > +	*num_input_fmts = 0;
> > +
> > +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> > +			     GFP_KERNEL);
> > +	if (!input_fmts)
> > +		return NULL;
> > +
> > +	input_fmts[0] = lvds_codec->bus_format;
> > +	*num_input_fmts = MAX_INPUT_SEL_FORMATS;
> > +
> > +	return input_fmts;
> > +}
> > +
> > +static const struct drm_bridge_funcs funcs_decoder = {
> > +	.attach = lvds_codec_attach,
> > +	.enable = lvds_codec_enable,
> > +	.disable = lvds_codec_disable,
> > +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > +	.atomic_reset = drm_atomic_helper_bridge_reset,
> > +	.atomic_get_input_bus_fmts = lvds_codec_atomic_get_input_bus_fmts,
> > +};
> > +
> >  static int lvds_codec_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct device_node *panel_node;
> > +	struct device_node *bus_node;
> >  	struct drm_panel *panel;
> >  	struct lvds_codec *lvds_codec;
> > +	const char *mapping;
> > +	int ret;
> >  
> >  	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
> >  	if (!lvds_codec)
> > @@ -119,13 +159,47 @@ static int lvds_codec_probe(struct platform_device *pdev)
> >  	if (IS_ERR(lvds_codec->panel_bridge))
> >  		return PTR_ERR(lvds_codec->panel_bridge);
> >  
> > +	lvds_codec->bridge.funcs = &funcs;
> > +
> > +	/*
> > +	 * Decoder input LVDS format is a property of the decoder chip or even
> > +	 * its strapping. Handle data-mapping the same way lvds-panel does. In
> > +	 * case data-mapping is not present, do nothing, since there are still
> > +	 * legacy bindings which do not specify this property.
>
> The missing data-mapping property is reported as an error, but this
> comments says it is OK. Info?

It's not a fatal error, probe still continues in backward-compatibility
mode. The message is there to tell that the DT should be updated. Would
you downgrade that to a warning ?

> > +	 */
> > +	if (lvds_codec->connector_type != DRM_MODE_CONNECTOR_LVDS) {
> > +		bus_node = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
>
> Are there any reg specified in the binding? If not then the second
> parameter should be -1 here.

Yes, the DT node has two ports, with port 0 being the input. For LVDS
decoders, that's where the LVDS bus is.

> > +		if (!bus_node) {
> > +			dev_dbg(dev, "bus DT node not found\n");
> > +			return -ENXIO;
> > +		}
> > +
> > +		ret = of_property_read_string(bus_node, "data-mapping",
> > +					      &mapping);
> > +		of_node_put(bus_node);
> > +		if (ret < 0) {
> > +			dev_err(dev, "missing 'data-mapping' DT property\n");
> > +		} else {
>
> It would be nice with a helper for the below code if we need this a third
> time.

Where would you store it ?

> > +			if (!strcmp(mapping, "jeida-18")) {
> > +				lvds_codec->bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG;
> > +			} else if (!strcmp(mapping, "jeida-24")) {
> > +				lvds_codec->bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
> > +			} else if (!strcmp(mapping, "vesa-24")) {
> > +				lvds_codec->bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG;
> > +			} else {
> > +				dev_err(dev, "invalid 'data-mapping' DT property\n");
> > +				return -EINVAL;
> > +			}
>
> Add empty line here.
>
> > +			lvds_codec->bridge.funcs = &funcs_decoder;
> > +		}
> > +	}
> > +
> >  	/*
> >  	 * The panel_bridge bridge is attached to the panel's of_node,
> >  	 * but we need a bridge attached to our of_node for our user
> >  	 * to look up.
> >  	 */
> >  	lvds_codec->bridge.of_node = dev->of_node;
> > -	lvds_codec->bridge.funcs = &funcs;
> >  	drm_bridge_add(&lvds_codec->bridge);
> >  
> >  	platform_set_drvdata(pdev, lvds_codec);

-- 
Regards,

Laurent Pinchart
