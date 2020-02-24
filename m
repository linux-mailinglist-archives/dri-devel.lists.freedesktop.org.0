Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7A416B4C0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 00:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659658925D;
	Mon, 24 Feb 2020 23:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1904 seconds by postgrey-1.36 at gabe;
 Mon, 24 Feb 2020 23:03:46 UTC
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E218925D;
 Mon, 24 Feb 2020 23:03:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12D91E89;
 Tue, 25 Feb 2020 00:03:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582585424;
 bh=0QHOsrjvYWmYzh5ekC9eP1zpenZDLSbZmOms1v8B5Ag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KY3cc0e/MxQ+m4OmrB8mjNQ0qFFIgi+uMaD/sUYrjiwpfXJh9sZcuL6ibkK5xOqIf
 iVFagcbO9BBmUDfW5rQKvlQx7da3ed2Hu0oO0PdEgRMShGcUCHmhicUNzPKOHhdb3j
 adnfaQCehJWMuNE83tZH3iT69B2EXI82f+i+E8Cg=
Date: Tue, 25 Feb 2020 01:03:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v10 08/12] drm/bridge: lvds-codec: Implement basic bus
 format negotiation
Message-ID: <20200224230322.GE16163@pendragon.ideasonboard.com>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
 <20200128135514.108171-9-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128135514.108171-9-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Mark Rutland <mark.rutland@arm.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 intel-gfx-trybot@lists.freedesktop.org, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

Thank you for the patch.

On Tue, Jan 28, 2020 at 02:55:10PM +0100, Boris Brezillon wrote:
> Some DPI -> LVDS encoders might support several input bus width. Add a
> DT property to describe the bus width used on a specific design.
> 
> v10:
> * Add changelog to the commit message
> 
> v8 -> v9:
> * No changes
> 
> v7:
> * Fix a use-after-release problem
> * Get rid of the data-mapping parsing
> * Use kmalloc instead of kcalloc.
> 
> v4 -> v6:
> * Not part of the series
> 
> v3:
> * Use bus-width for the rgb24/rgb18 distinction
> * Adjust code to match core changes
> * Get rid of of_get_data_mapping()
> * Don't implement ->atomic_check() (the core now takes care of bus
>   flags propagation)
> 
> v2:
> * Make the bus-format negotiation logic more generic
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/bridge/lvds-codec.c | 64 ++++++++++++++++++++++++++---
>  1 file changed, 58 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> index 5f04cc11227e..f4fd8472c335 100644
> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> @@ -11,6 +11,7 @@
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  
> +#include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_panel.h>
>  
> @@ -19,6 +20,7 @@ struct lvds_codec {
>  	struct drm_bridge *panel_bridge;
>  	struct gpio_desc *powerdown_gpio;
>  	u32 connector_type;
> +	u32 input_fmt;
>  };
>  
>  static int lvds_codec_attach(struct drm_bridge *bridge)
> @@ -48,18 +50,47 @@ static void lvds_codec_disable(struct drm_bridge *bridge)
>  		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 1);
>  }
>  
> +static u32 *
> +lvds_codec_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *bridge_state,
> +				     struct drm_crtc_state *crtc_state,
> +				     struct drm_connector_state *conn_state,
> +				     u32 output_fmt,
> +				     unsigned int *num_input_fmts)
> +{
> +	struct lvds_codec *lvds_codec = container_of(bridge,
> +						     struct lvds_codec, bridge);
> +	u32 *input_fmts;
> +
> +	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts) {
> +		*num_input_fmts = 0;
> +		return NULL;
> +	}
> +
> +	*num_input_fmts = 1;
> +	input_fmts[0] = lvds_codec->input_fmt;
> +	return input_fmts;
> +}
> +
>  static struct drm_bridge_funcs funcs = {
>  	.attach = lvds_codec_attach,
>  	.enable = lvds_codec_enable,
>  	.disable = lvds_codec_disable,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_get_input_bus_fmts = lvds_codec_atomic_get_input_bus_fmts,
>  };
>  
>  static int lvds_codec_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct device_node *panel_node;
> +	struct device_node *np;
>  	struct drm_panel *panel;
>  	struct lvds_codec *lvds_codec;
> +	u32 input_bus_width;
> +	int err;
>  
>  	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
>  	if (!lvds_codec)
> @@ -69,22 +100,43 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
>  							     GPIOD_OUT_HIGH);
>  	if (IS_ERR(lvds_codec->powerdown_gpio)) {
> -		int err = PTR_ERR(lvds_codec->powerdown_gpio);
> +		err = PTR_ERR(lvds_codec->powerdown_gpio);
>  
>  		if (err != -EPROBE_DEFER)
>  			dev_err(dev, "powerdown GPIO failure: %d\n", err);
>  		return err;
>  	}
>  
> +	np = of_graph_get_port_by_id(dev->of_node, 0);
> +	if (!np) {
> +		dev_dbg(dev, "port 0 not found\n");
> +		return -ENXIO;
> +	}
> +
> +	err = of_property_read_u32(np, "bus-width", &input_bus_width);
> +	of_node_put(np);
> +
> +	if (err) {
> +		lvds_codec->input_fmt = MEDIA_BUS_FMT_FIXED;
> +	} else if (input_bus_width == 18) {
> +		lvds_codec->input_fmt = MEDIA_BUS_FMT_RGB666_1X18;
> +	} else if (input_bus_width == 24) {
> +		lvds_codec->input_fmt = MEDIA_BUS_FMT_RGB888_1X24;
> +	} else {
> +		dev_dbg(dev, "unsupported bus-width value %u on port 0\n",
> +			input_bus_width);
> +		return -ENOTSUPP;

ENOTSUPP is "Operation not supported", I'd go for -EINVAL.

> +	}

Doesn't this apply to LVDS encoders only ? For LVDS decoders I don't
think we want to report an RGB format on the input.

> +
>  	/* Locate the panel DT node. */
> -	panel_node = of_graph_get_remote_node(dev->of_node, 1, 0);
> -	if (!panel_node) {
> +	np = of_graph_get_remote_node(dev->of_node, 1, 0);
> +	if (!np) {
>  		dev_dbg(dev, "panel DT node not found\n");
>  		return -ENXIO;
>  	}
>  
> -	panel = of_drm_find_panel(panel_node);
> -	of_node_put(panel_node);
> +	panel = of_drm_find_panel(np);
> +	of_node_put(np);
>  	if (IS_ERR(panel)) {
>  		dev_dbg(dev, "panel not found, deferring probe\n");
>  		return PTR_ERR(panel);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
