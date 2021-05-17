Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E31F386D7E
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 01:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEDB6E15A;
	Mon, 17 May 2021 23:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37706E15A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 23:03:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DEADC3EE;
 Tue, 18 May 2021 01:03:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1621292618;
 bh=mGm46fh5DjIqkWfA1ZeGnO+GioI0QR0SXTVO6nekEco=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QZX2xhsI/wFimJ8YZ0/31lO3bOf/+W4c5IIkYJOnzdtW0XCelGpDiKvH66HEV1P5k
 M56MWKQJik4wccH3Los5ZY7eB8YcVcvwDtuEl+3EgitPINXLQ3r461/rza7Aq1Alsk
 fDnmdqLaRIJ6yajXQoF3gV+VuxqXd5xJXZad85gY=
Date: Tue, 18 May 2021 02:03:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/2] drm/bridge: lvds-codec: Add support for LVDS data
 mapping select
Message-ID: <YKL2SAfonHJcoTw/@pendragon.ideasonboard.com>
References: <20210515204656.367442-1-marex@denx.de>
 <20210515204656.367442-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210515204656.367442-2-marex@denx.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, ch@denx.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Thank you for the patch.

On Sat, May 15, 2021 at 10:46:56PM +0200, Marek Vasut wrote:
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
>  drivers/gpu/drm/bridge/lvds-codec.c | 50 +++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> index 8a7cb267ab14..33f992d52902 100644
> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> @@ -23,6 +23,7 @@ struct lvds_codec {
>  	struct regulator *vcc;
>  	struct gpio_desc *powerdown_gpio;
>  	u32 connector_type;
> +	unsigned int bus_format;
>  };
>  
>  static inline struct lvds_codec *to_lvds_codec(struct drm_bridge *bridge)
> @@ -69,10 +70,33 @@ static void lvds_codec_disable(struct drm_bridge *bridge)
>  			"Failed to disable regulator \"vcc\": %d\n", ret);
>  }
>  
> +static bool lvds_codec_mode_fixup(struct drm_bridge *bridge,
> +				const struct drm_display_mode *mode,
> +				struct drm_display_mode *adj)
> +{
> +	struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_device *ddev = encoder->dev;
> +	struct drm_connector *connector;
> +
> +	/* If 'data-mapping' was not specified, do nothing. */
> +	if (!lvds_codec->bus_format)
> +		return true;
> +
> +	/* Patch in the LVDS format */
> +	list_for_each_entry(connector, &ddev->mode_config.connector_list, head) {
> +		drm_display_info_set_bus_formats(&connector->display_info,
> +						 &lvds_codec->bus_format, 1);
> +	}

This part bothers me, as the format at the input of the LVDS decoder
doesn't match the format on the connector. Shouldn't you implement
.atomic_get_output_bus_fmts() instead ?

> +
> +	return true;
> +}
> +
>  static const struct drm_bridge_funcs funcs = {
>  	.attach = lvds_codec_attach,
>  	.enable = lvds_codec_enable,
>  	.disable = lvds_codec_disable,
> +	.mode_fixup = lvds_codec_mode_fixup,
>  };
>  
>  static int lvds_codec_probe(struct platform_device *pdev)
> @@ -81,6 +105,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  	struct device_node *panel_node;
>  	struct drm_panel *panel;
>  	struct lvds_codec *lvds_codec;
> +	const char *mapping;

I would have moved this variable to the if () { ... } below, but maybe
that's just me.

>  	u32 val;
>  
>  	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
> @@ -133,6 +158,31 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  			DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE;
>  	}
>  
> +	/*
> +	 * Decoder input LVDS format is a property of the decoder chip or even
> +	 * its strapping. Handle data-mapping the same way lvds-panel does. In
> +	 * case data-mapping is not present, do nothing, since there are still
> +	 * legacy bindings which do not specify this property.
> +	 */
> +	if (lvds_codec->connector_type != DRM_MODE_CONNECTOR_LVDS) {
> +		ret = of_property_read_string(dev->of_node, "data-mapping",
> +					      &mapping);
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
> +		}
> +	}
> +
>  	/*
>  	 * The panel_bridge bridge is attached to the panel's of_node,
>  	 * but we need a bridge attached to our of_node for our user

-- 
Regards,

Laurent Pinchart
