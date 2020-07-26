Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D099722E2BA
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 23:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EAA6E103;
	Sun, 26 Jul 2020 21:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162316E103
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 21:26:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4922B304;
 Sun, 26 Jul 2020 23:26:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595798775;
 bh=xCXF96c9a2QmAawxpeCN9WG3PigydXgwcPDo7N5QJSw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dAbDIpVsrjpx4QKZHVKKtwXB8uASZMWbwIHJw4qGI1CX2aVFjl59CiYhzu7t4kvt9
 8ZaRtmkyFa23ckdyWcZmzdohfTfYAbUHG2Sz207q9DD6l03R/aGG4oNAKWXtIafcb4
 JidiHZtTFP7f03s8OKVOZOF5CKF0x/+wQZVAhBZQ=
Date: Mon, 27 Jul 2020 00:26:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 02/15] drm/panel: panel-simple: add default
 connector_type
Message-ID: <20200726212607.GF14755@pendragon.ideasonboard.com>
References: <20200726203324.3722593-1-sam@ravnborg.org>
 <20200726203324.3722593-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726203324.3722593-3-sam@ravnborg.org>
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
 Peter Senna Tschudin <peter.senna@gmail.com>,
 kbuild test robot <lkp@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Sun, Jul 26, 2020 at 10:33:11PM +0200, Sam Ravnborg wrote:
> All panels shall report a connector type.
> panel-simple has a lot of panels with no connector_type,
> and for these fall back to DPI as the default.
> 
> v2:
>   - Rebased on top of validation of panel description
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index a8d68102931e..56ab073e4e6e 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -500,6 +500,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  	struct panel_simple *panel;
>  	struct display_timing dt;
>  	struct device_node *ddc;
> +	int connector_type;
>  	u32 bus_flags;
>  	int err;
>  
> @@ -550,10 +551,12 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  			panel_simple_parse_panel_timing_node(dev, panel, &dt);
>  	}
>  
> +	connector_type = desc->connector_type;
>  	/* Catch common mistakes for panels. */
> -	switch (desc->connector_type) {
> +	switch (connector_type) {
>  	case 0:
>  		dev_warn(dev, "Specify missing connector_type\n");
> +		connector_type = DRM_MODE_CONNECTOR_DPI;
>  		break;
>  	case DRM_MODE_CONNECTOR_LVDS:
>  		WARN_ON(desc->bus_flags &
> @@ -600,11 +603,11 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  		break;
>  	default:
>  		dev_warn(dev, "Specify a valid connector_type: %d\n", desc->connector_type);
> +		connector_type = DRM_MODE_CONNECTOR_DPI;
>  		break;
>  	}
>  
> -	drm_panel_init(&panel->base, dev, &panel_simple_funcs,
> -		       desc->connector_type);
> +	drm_panel_init(&panel->base, dev, &panel_simple_funcs, connector_type);
>  
>  	err = drm_panel_of_backlight(&panel->base);
>  	if (err)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
