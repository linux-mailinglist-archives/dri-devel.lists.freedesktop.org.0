Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADBD22E2B7
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 23:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8888F6E0F3;
	Sun, 26 Jul 2020 21:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8844E6E0F3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 21:24:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADBDB304;
 Sun, 26 Jul 2020 23:24:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595798689;
 bh=K93g8cGjsFLpKVAoBLZ6TGgR+2xoJ9Fb4n1cxI475xQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S0KHywEunLeMI+DaJ6rp/U9YxnDBM8dR/g7XkJ3ZQytn+t5HKjJR3TKxzIdL1NTal
 +lNooNJXJr+5keGt39/GPaaSHMDpQCkIrxYLTexEf1u67tSyQpB15+HXlSCwV5eubQ
 8iwFFcNklFLCLxnb/2AR9wGByWjUugBYZLf9yu1o=
Date: Mon, 27 Jul 2020 00:24:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 01/15] drm/panel: panel-simple: validate panel
 description
Message-ID: <20200726212441.GE14755@pendragon.ideasonboard.com>
References: <20200726203324.3722593-1-sam@ravnborg.org>
 <20200726203324.3722593-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726203324.3722593-2-sam@ravnborg.org>
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

On Sun, Jul 26, 2020 at 10:33:10PM +0200, Sam Ravnborg wrote:
> Warn if we detect a panel with incomplete/wrong description.
> This is inspired by a similar patch by Laurent that introduced checks
> for LVDS panels - this extends the checks to the remaining type of
> connectors.
> 
> This is known to warn for some of the existing panels but added
> despite this as we need help from people using the panels to
> add the missing info.
> The checks are not complete but will catch the most common mistakes.
> 
> The checks at the same time serves as documentation for the minimum

s/serves/serve/

> required description for a panel.
> 
> The checks uses dev_warn() as we know this will hit. WARN() was
> too noisy at the moment for anything else than LVDS.
> 
> v2:
>   - Use dev_warn (Laurent)
>   - Check for empty bus_flags
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 41 ++++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 54323515ca2c..a8d68102931e 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -500,6 +500,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  	struct panel_simple *panel;
>  	struct display_timing dt;
>  	struct device_node *ddc;
> +	u32 bus_flags;
>  	int err;
>  
>  	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
> @@ -549,8 +550,12 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  			panel_simple_parse_panel_timing_node(dev, panel, &dt);
>  	}
>  
> -	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS) {
> -		/* Catch common mistakes for LVDS panels. */
> +	/* Catch common mistakes for panels. */
> +	switch (desc->connector_type) {
> +	case 0:
> +		dev_warn(dev, "Specify missing connector_type\n");
> +		break;
> +	case DRM_MODE_CONNECTOR_LVDS:
>  		WARN_ON(desc->bus_flags &
>  			~(DRM_BUS_FLAG_DE_LOW |
>  			  DRM_BUS_FLAG_DE_HIGH |
> @@ -564,6 +569,38 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  		WARN_ON((desc->bus_format == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG ||
>  			 desc->bus_format == MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA) &&
>  			desc->bpc != 8);
> +		break;
> +	case DRM_MODE_CONNECTOR_eDP:
> +		if (desc->bus_format == 0)
> +			dev_warn(dev, "Specify missing bus_format\n");
> +		if (desc->bpc != 6 && desc->bpc != 8)
> +			dev_warn(dev, "Expected bpc in {6,8} but got: %d\n", desc->bpc);

bpc is unsigned, so s/%d/%u/

> +		break;
> +	case DRM_MODE_CONNECTOR_DSI:
> +		if (desc->bpc != 6 && desc->bpc != 8)
> +			dev_warn(dev, "Expected bpc in {6,8} but got: %d\n", desc->bpc);

Same here.

> +		break;
> +	case DRM_MODE_CONNECTOR_DPI:
> +		bus_flags = DRM_BUS_FLAG_DE_LOW |
> +			    DRM_BUS_FLAG_DE_HIGH |
> +			    DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
> +			    DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> +			    DRM_BUS_FLAG_DATA_MSB_TO_LSB |
> +			    DRM_BUS_FLAG_DATA_LSB_TO_MSB |
> +			    DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE |
> +			    DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE;
> +		if (desc->bus_flags & ~bus_flags)
> +			dev_warn(dev, "Unexpected bus_flags(%d)\n", desc->bus_flags & ~bus_flags);
> +		if (!(desc->bus_flags & bus_flags))
> +			dev_warn(dev, "Specify missing bus_flags\n");
> +		if (desc->bus_format == 0)
> +			dev_warn(dev, "Specify missing bus_format\n");
> +		if (desc->bpc != 6 && desc->bpc != 8)
> +			dev_warn(dev, "Expected bpc in {6,8} but got: %d\n", desc->bpc);

And here too.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		break;
> +	default:
> +		dev_warn(dev, "Specify a valid connector_type: %d\n", desc->connector_type);
> +		break;
>  	}
>  
>  	drm_panel_init(&panel->base, dev, &panel_simple_funcs,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
