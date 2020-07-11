Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8181721C6A4
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jul 2020 00:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE706E135;
	Sat, 11 Jul 2020 22:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4A66E135
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 22:56:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25E26259;
 Sun, 12 Jul 2020 00:56:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1594508183;
 bh=1D9gsSpOqNtr2EA/i5DInQhRG9+Ed2QV4tlt4zRcJXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CKI3druQCqbblf8Y0+x4Hx48+RCMUujGUg9v0mqciaX5uuch0Ec4NCaitcYHUAMuc
 XPtANYY5UT2NwBbpjCSVhWNorE+ZEWatBMLzoHO1C1kIrGvmvrH+SaCMeK0zcHNG3Z
 VSVQ6Ajwk6E7XldN2YCJLx0C+2K7kL0PiSex80l8=
Date: Sun, 12 Jul 2020 01:56:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm/panel: panel-simple: validate panel description
Message-ID: <20200711225616.GF5954@pendragon.ideasonboard.com>
References: <20200703192417.372164-1-sam@ravnborg.org>
 <20200703192417.372164-3-sam@ravnborg.org>
 <20200710221124.GI5964@pendragon.ideasonboard.com>
 <20200711074807.GA779438@ravnborg.org>
 <20200711094726.GA940164@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200711094726.GA940164@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, kbuild test robot <lkp@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thierry Reding <thierry.reding@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

(CC'ing Daniel)

Thank you for the patch.

On Sat, Jul 11, 2020 at 11:47:26AM +0200, Sam Ravnborg wrote:
> Warn is we detect a panel with missing descriptions.

s/is/if/

> This is inpsired by a similar patch by Laurent that introduced checks
> for LVDS panels - this extends the checks to the reminaing type of

s/reminaing type/remaining types/

> connectors.
> 
> This is known to fail for some of the existing panels but added
> despite this as we need help from people using the panels to
> add the missing info.
> The checks are not complete but will catch the most common mistakes.
> The checks at the same time serves as documentation for the minimum
> required description for a panel.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
> 
> This is my attempt on the validation described in the previous mail.
> The assignment of default connector_type will then be a follow-up patch
> to this.
> 
> 	Sam
> 
>  drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 2aff93accad5..025a7ccdfcb3 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -549,8 +549,12 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  			panel_simple_parse_panel_timing_node(dev, panel, &dt);
>  	}
>  
> -	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS) {
> -		/* Catch common mistakes for LVDS panels. */
> +	/* Catch common mistakes for panels. */
> +	switch (desc->connector_type) {
> +	case 0:
> +		WARN(desc->connector_type == 0, "specify missing connector_type\n");
> +		break;
> +	case DRM_MODE_CONNECTOR_LVDS:
>  		WARN_ON(desc->bus_flags &
>  			~(DRM_BUS_FLAG_DE_LOW |
>  			  DRM_BUS_FLAG_DE_HIGH |
> @@ -564,6 +568,30 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  		WARN_ON((desc->bus_format == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG ||
>  			 desc->bus_format == MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA) &&
>  			desc->bpc != 8);
> +		break;
> +	case DRM_MODE_CONNECTOR_eDP:
> +		WARN_ON(desc->bus_format == 0);
> +		WARN_ON(desc->bpc != 6 && desc->bpc != 8);
> +		break;
> +	case DRM_MODE_CONNECTOR_DSI:
> +		WARN_ON(desc->bpc != 6 && desc->bpc != 8);
> +		break;
> +	case DRM_MODE_CONNECTOR_DPI:
> +		WARN_ON(desc->bus_flags &
> +			~(DRM_BUS_FLAG_DE_LOW |
> +			  DRM_BUS_FLAG_DE_HIGH |
> +			  DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
> +			  DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> +			  DRM_BUS_FLAG_DATA_MSB_TO_LSB |
> +			  DRM_BUS_FLAG_DATA_LSB_TO_MSB |
> +			  DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE |
> +			  DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE));
> +		WARN_ON(desc->bus_format == 0);
> +		WARN_ON(desc->bpc != 6 && desc->bpc != 8);
> +		break;
> +	default:
> +		WARN(true, "panel has unknown connector_type: %d\n", desc->connector_type);
> +		break;
>  	}

The checks look sane to me. For LVDS we've added the WARN_ON after
checking all LVDS panels [1], so the warning will only get displayed for
new panel drivers. For other types of panel, this will cause lots of
WARN_ON to trigger. On one hand it gets the issues noticed, which should
help fixing them, but on the other hand it will also scare lots of users
and developers. I'm not sure if we should downgrade that to a dev_warn()
for some time until we get at least the majority of the issues fixed.
Daniel, any opinion ?

[1] Actually not quite, I've just sent "[PATCH] drm: panel: simple: Fix
bpc for LG LB070WV8 panel" to fix one bpc issue.

>  	drm_panel_init(&panel->base, dev, &panel_simple_funcs,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
