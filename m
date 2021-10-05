Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73135421B14
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 02:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB75B6EACF;
	Tue,  5 Oct 2021 00:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5206EACF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 00:23:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D26D225B;
 Tue,  5 Oct 2021 02:23:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1633393382;
 bh=4DnE9NCoGB1wlYjTRO5i9MP1EIij713NzbRiy2mIPRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rI7IzRyW+fZcFBPbZGgQGUihkZPcYd9WWvq3vORZb7q1fpIECCRKHLQmiNvoY0U3E
 s1xqBUcGidjl67emyY0tlYMq1gZBiDUx3nGvAFOd+LHzrzj/+RThCXp3va2QvPGH1x
 9UlKGQ2s41zkCokcANn1VQFG2C/rLEQcVkgPYuS0=
Date: Tue, 5 Oct 2021 03:22:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH V4 2/2] drm/bridge: lvds-codec: Add support for LVDS data
 mapping select
Message-ID: <YVua3/wI86EoIt1N@pendragon.ideasonboard.com>
References: <20210727161357.8842-1-marex@denx.de>
 <20210727161357.8842-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210727161357.8842-2-marex@denx.de>
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

Hi Marek,

Thank you for the patch, and all my apologies for the delay.

On Tue, Jul 27, 2021 at 06:13:57PM +0200, Marek Vasut wrote:
> Decoder input LVDS format is a property of the decoder chip or even
> its strapping. Handle data-mapping the same way lvds-panel does. In
> case data-mapping is not present, do nothing, since there are still
> legacy bindings which do not specify this property.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> To: dri-devel@lists.freedesktop.org
> ---
> V2: - Move the data-mapping to endpoint
> V3: - Rebase on V2 submitted a while ago, reinstate changelog
>     - Use .atomic_get_input_bus_fmts for the decoder, separate funcs for encoder
> V4: - No change
> ---
>  drivers/gpu/drm/bridge/lvds-codec.c | 76 ++++++++++++++++++++++++++++-
>  1 file changed, 75 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> index dcf579a4cf833..afa7ce7ea01e8 100644
> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> @@ -12,6 +12,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
>  
> +#include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_panel.h>
>  
> @@ -22,6 +23,7 @@ struct lvds_codec {
>  	struct regulator *vcc;
>  	struct gpio_desc *powerdown_gpio;
>  	u32 connector_type;
> +	unsigned int bus_format;
>  };
>  
>  static inline struct lvds_codec *to_lvds_codec(struct drm_bridge *bridge)
> @@ -74,12 +76,50 @@ static const struct drm_bridge_funcs funcs = {
>  	.disable = lvds_codec_disable,
>  };
>  
> +#define MAX_INPUT_SEL_FORMATS 1
> +static u32 *
> +lvds_codec_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *bridge_state,
> +				     struct drm_crtc_state *crtc_state,
> +				     struct drm_connector_state *conn_state,
> +				     u32 output_fmt,
> +				     unsigned int *num_input_fmts)
> +{
> +	struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
> +	u32 *input_fmts;
> +
> +	*num_input_fmts = 0;
> +
> +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> +			     GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	input_fmts[0] = lvds_codec->bus_format;
> +	*num_input_fmts = MAX_INPUT_SEL_FORMATS;

Are there cases where the input format would depend on the output format
? For instance, a 24-bit RGB output that could also work in RGB666 mode,
where we would select between MEDIA_BUS_FMT_RGB666_1X7X3_SPWG and
MEDIA_BUS_FMT_RGB888_1X7X4_SPWG depending on whether the output is
RGB666 or RGB888 ? I don't think we need to handle this now, and I
believe it will be possible to do this in a backward-compatible way if
the need ever arises. A confirmation that I'm not missing something
obvious would be nice.

> +
> +	return input_fmts;
> +}
> +
> +static const struct drm_bridge_funcs funcs_decoder = {
> +	.attach = lvds_codec_attach,
> +	.enable = lvds_codec_enable,
> +	.disable = lvds_codec_disable,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_get_input_bus_fmts = lvds_codec_atomic_get_input_bus_fmts,
> +};
> +
>  static int lvds_codec_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *panel_node;
> +	struct device_node *bus_node;
>  	struct drm_panel *panel;
>  	struct lvds_codec *lvds_codec;
> +	const char *mapping;
> +	int ret;
>  
>  	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
>  	if (!lvds_codec)
> @@ -119,13 +159,47 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  	if (IS_ERR(lvds_codec->panel_bridge))
>  		return PTR_ERR(lvds_codec->panel_bridge);
>  
> +	lvds_codec->bridge.funcs = &funcs;
> +
> +	/*
> +	 * Decoder input LVDS format is a property of the decoder chip or even
> +	 * its strapping. Handle data-mapping the same way lvds-panel does. In
> +	 * case data-mapping is not present, do nothing, since there are still
> +	 * legacy bindings which do not specify this property.
> +	 */
> +	if (lvds_codec->connector_type != DRM_MODE_CONNECTOR_LVDS) {
> +		bus_node = of_graph_get_endpoint_by_regs(dev->of_node, 1, 0);

I think this should be

		bus_node = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);

(see the comment on patch 1/2).

> +		if (!bus_node) {
> +			dev_dbg(dev, "bus DT node not found\n");
> +			return -ENXIO;
> +		}
> +
> +		ret = of_property_read_string(bus_node, "data-mapping",
> +					      &mapping);
> +		of_node_put(bus_node);
> +		if (ret < 0) {
> +			dev_err(dev, "missing 'data-mapping' DT property\n");
> +		} else {
> +			if (!strcmp(mapping, "jeida-18")) {
> +				lvds_codec->bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG;
> +			} else if (!strcmp(mapping, "jeida-24")) {
> +				lvds_codec->bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
> +			} else if (!strcmp(mapping, "vesa-24")) {
> +				lvds_codec->bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG;
> +			} else {
> +				dev_err(dev, "invalid 'data-mapping' DT property\n");
> +				return -EINVAL;
> +			}
> +			lvds_codec->bridge.funcs = &funcs_decoder;
> +		}

I may have split this to a separate function to reduce line length and
simplify error handling, up to you.

With at least the port number fix above (unless I'm mistaken of course),

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	}
> +
>  	/*
>  	 * The panel_bridge bridge is attached to the panel's of_node,
>  	 * but we need a bridge attached to our of_node for our user
>  	 * to look up.
>  	 */
>  	lvds_codec->bridge.of_node = dev->of_node;
> -	lvds_codec->bridge.funcs = &funcs;
>  	drm_bridge_add(&lvds_codec->bridge);
>  
>  	platform_set_drvdata(pdev, lvds_codec);

-- 
Regards,

Laurent Pinchart
