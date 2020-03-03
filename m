Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D10CC1780A4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 20:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F606E8E0;
	Tue,  3 Mar 2020 19:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FD96E8DA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 19:00:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A4632AF;
 Tue,  3 Mar 2020 20:00:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583262021;
 bh=uSydvVjoCnKH1jjRz35LIwmd54EEtom3m51nnbDtjWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YGv1MK/q0AKSAi2CgJmU2d6R/SnIYq0LHVH+IobbI7bOQ7ouiH4a1Kir4ABqaawaD
 scGJ5OA7YHp4ml0/PZoQald8P4EMH3P+EU9ut+n0+l391ruZxgGIT4mehjjlG176nm
 03nztfEiVI7dlfxHAQRKrsaWa3fHHzb24pp/WayA=
Date: Tue, 3 Mar 2020 21:00:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC PATCH v3 5/5] drm/panel: simple: add panel-dpi support
Message-ID: <20200303190000.GK11333@pendragon.ideasonboard.com>
References: <20200216181513.28109-1-sam@ravnborg.org>
 <20200216181513.28109-6-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200216181513.28109-6-sam@ravnborg.org>
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, devicetree@vger.kernel.org,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Sun, Feb 16, 2020 at 07:15:13PM +0100, Sam Ravnborg wrote:
> RFC only - not tested yet!
> 
> The panel-dpi compatible is a fallback that
> allows the DT to specify the timing.
> 
> When matching panel-dpi expect the device tree to include the
> timing information for the display-panel.
> 
> Background for this change:
> There are a lot of panels and new models hits the market very often.
> It is a lost cause trying to chase them all and users of new panels
> will often find them in situations that the panel they ues are not

s/ues/use/

> supported by the kernel.
> On top of this a lot of panels are customized based on customer
> specifications.
> 
> Including the panel timing in the device tree allows for a simple
> way to describe the actual HW and use this description in a generic
> way in the kernel.
> This allows uses of proprietary panels, or panels which are not
> included in the kernel, to specify the timing in the device tree
> together with all the other HW descriptions.
> And thus, using the device tree it is then easy to add support
> for an otherwise unknown panel.
> 
> The current support expect panels that do not require any
> delays for prepare/enable/disable/unprepare.

I've proposed something similar a few times in the past, so I can't
disagree :-)

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 74 +++++++++++++++++++++++++++-
>  1 file changed, 72 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 82363d05bad4..188526637398 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -351,6 +351,65 @@ static const struct drm_panel_funcs panel_simple_funcs = {
>  	.get_timings = panel_simple_get_timings,
>  };
>  
> +static struct panel_desc panel_dpi;

Do you need this, can't you set data to 0 in the panel-dpi entry ?

> +
> +static int panel_dpi_probe(struct device *dev,
> +			   struct panel_simple *panel)
> +{
> +	struct display_timing *timing;
> +	const struct device_node *np;
> +	struct panel_desc *desc;
> +	unsigned int bus_flags;
> +	struct videomode vm;
> +	const char *mapping;
> +	int ret;
> +
> +	np = dev->of_node;
> +	desc = devm_kzalloc(dev, sizeof(*desc), GFP_KERNEL);
> +	if (!desc)
> +		return -ENOMEM;
> +
> +	timing = devm_kzalloc(dev, sizeof(*timing), GFP_KERNEL);
> +	if (!timing)
> +		return -ENOMEM;
> +
> +	ret = of_get_display_timing(np, "panel-timing", timing);
> +	if (ret < 0) {
> +		dev_err(dev, "%pOF: no panel-timing node found for \"panel-dpi\" binding\n",
> +			np);
> +		return ret;
> +	}
> +
> +	desc->timings = timing;
> +	desc->num_timings = 1;
> +
> +	of_property_read_u32(np, "width-mm", &desc->size.width);
> +	of_property_read_u32(np, "height-mm", &desc->size.height);
> +
> +	of_property_read_string(np, "data-mapping", &mapping);
> +	if (!strcmp(mapping, "rgb24"))
> +		desc->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +	else if (!strcmp(mapping, "rgb565"))
> +		desc->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
> +	else if (!strcmp(mapping, "bgr666"))
> +		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
> +	else if (!strcmp(mapping, "lvds666"))
> +		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;

I think you've dropped lvds666 in the DT bindings, so this should be
dropped too. Furthermore, I think the data-mapping property should be
reconsidered (see my review of the bindings), so this would need to
change too.

> +
> +	/* Extract bus_flags from display_timing */
> +	bus_flags = 0;
> +	vm.flags = timing->flags;
> +	drm_bus_flags_from_videomode(&vm, &bus_flags);
> +	desc->bus_flags = bus_flags;
> +
> +	/* We do not know the connector for the DT node, so guess it */
> +	desc->connector_type = DRM_MODE_CONNECTOR_DPI;
> +
> +	panel->desc = desc;
> +
> +	return 0;
> +}
> +
>  #define PANEL_SIMPLE_BOUNDS_CHECK(to_check, bounds, field) \
>  	(to_check->field.typ >= bounds->field.min && \
>  	 to_check->field.typ <= bounds->field.max)
> @@ -437,8 +496,15 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  			return -EPROBE_DEFER;
>  	}
>  
> -	if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
> -		panel_simple_parse_panel_timing_node(dev, panel, &dt);
> +	if (desc == &panel_dpi) {
> +		/* Handle the generic panel-dpi binding */
> +		err = panel_dpi_probe(dev, panel);
> +		if (err)
> +			goto free_ddc;
> +	} else {
> +		if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
> +			panel_simple_parse_panel_timing_node(dev, panel, &dt);
> +	}
>  
>  	drm_panel_init(&panel->base, dev, &panel_simple_funcs,
>  		       desc->connector_type);
> @@ -3688,6 +3754,10 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "winstar,wf35ltiacd",
>  		.data = &winstar_wf35ltiacd,
> +	}, {
> +		/* Must be the last entry */
> +		.compatible = "panel-dpi",
> +		.data = &panel_dpi,
>  	}, {
>  		/* sentinel */
>  	}

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
