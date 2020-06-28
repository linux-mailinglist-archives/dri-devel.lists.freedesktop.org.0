Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A479920C732
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 11:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC22C6E202;
	Sun, 28 Jun 2020 09:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921C66E202
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 09:13:50 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 4725E2002B;
 Sun, 28 Jun 2020 11:13:48 +0200 (CEST)
Date: Sun, 28 Jun 2020 11:13:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: panel: simple: Drop drive/sample bus flags for LVDS
 panels
Message-ID: <20200628091347.GA133729@ravnborg.org>
References: <20200628075401.10975-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200628075401.10975-1-laurent.pinchart+renesas@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=IqnTTH7IcBKYc38AM6cA:9
 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
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
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Pascal Roeleven <dev@pascalroeleven.nl>,
 Thierry Reding <thierry.reding@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 28, 2020 at 10:54:01AM +0300, Laurent Pinchart wrote:
> The DRM bus flags reporting on which clock edge the pixel data and sync
> signals are sampled or driven don't make sense for LVDS panels, as the
> bus then uses sub-clock timings to send data. Drop those flags and add a
> warning in the probe function to make sure the mistake won't be
> repeated.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 30 +++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index bff1cab529d2..537d75ef7fc2 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -549,6 +549,14 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  			panel_simple_parse_panel_timing_node(dev, panel, &dt);
>  	}
>  
> +	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS)
> +		/* Catch common mistakes for LVDS panels. */
> +		WARN_ON(desc->bus_flags &
> +			(DRM_BUS_FLAG_PIXDATA_POSEDGE |
> +			 DRM_BUS_FLAG_PIXDATA_NEGEDGE |
> +			 DRM_BUS_FLAG_SYNC_POSEDGE |
> +			 DRM_BUS_FLAG_SYNC_NEGEDGE));
The above are only the legacy flags.
For LVDS panels I think we could check if either
DRM_BUS_FLAG_DE_LOW or DRM_BUS_FLAG_DE_HIGH is set and nothing else.
And then as an additional check that the .bus_format is relevant.

Then we have managed to catch most of the mistakes for LVDS panels.

We could add checks for DPI panels too, but that would be later.

	Sam

> +
>  	drm_panel_init(&panel->base, dev, &panel_simple_funcs,
>  		       desc->connector_type);
>  
> @@ -688,7 +696,7 @@ static const struct panel_desc auo_b101aw03 = {
>  		.height = 125,
>  	},
>  	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> @@ -1398,7 +1406,7 @@ static const struct panel_desc chunghwa_claa070wp03xg = {
>  		.height = 150,
>  	},
>  	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> @@ -1423,7 +1431,7 @@ static const struct panel_desc chunghwa_claa101wa01a = {
>  		.height = 120,
>  	},
>  	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> @@ -1448,7 +1456,7 @@ static const struct panel_desc chunghwa_claa101wb01 = {
>  		.height = 125,
>  	},
>  	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> @@ -2123,7 +2131,7 @@ static const struct panel_desc innolux_n156bge_l21 = {
>  		.height = 193,
>  	},
>  	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> @@ -2256,7 +2264,7 @@ static const struct panel_desc koe_tx26d202vm0bwa = {
>  		.disable = 1000,
>  	},
>  	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> @@ -2497,9 +2505,7 @@ static const struct panel_desc logictechno_lt170410_2whc = {
>  		.height = 136,
>  	},
>  	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> -	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
> -		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> -		     DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> @@ -3072,7 +3078,7 @@ static const struct panel_desc samsung_ltn101nt05 = {
>  		.height = 125,
>  	},
>  	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> @@ -3319,7 +3325,7 @@ static const struct panel_desc starry_kr070pe2t = {
>  		.height = 86,
>  	},
>  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> @@ -3512,7 +3518,7 @@ static const struct panel_desc toshiba_lt089ac29000 = {
>  		.height = 116,
>  	},
>  	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> -- 
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
