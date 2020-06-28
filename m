Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4364520C7BA
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 13:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0B16E284;
	Sun, 28 Jun 2020 11:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C9D6E284
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 11:48:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E2104FB;
 Sun, 28 Jun 2020 13:48:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1593344903;
 bh=qWOcxVyZe5YxbMc6IFDP2qrC3q98BrWUZDj04A7bwHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zd9J7Yhwq72CQDbalpTkgj2BaNhG+kuwicgQG46sWH1j5Ej/K/j+JWpOwhHZy16/X
 VmeiWdrzR171bx069/FtTgw/M7dyvG28etK0bEEoSaz6If2ihEfTW23c0RgAv2YVXC
 BDi329TKD4P75yeRmypfVk5G7PMZrYF/0pJtl7Wo=
Date: Sun, 28 Jun 2020 14:48:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm: panel: simple: Drop drive/sample bus flags for LVDS
 panels
Message-ID: <20200628114820.GO6954@pendragon.ideasonboard.com>
References: <20200628075401.10975-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200628091347.GA133729@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200628091347.GA133729@ravnborg.org>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Pascal Roeleven <dev@pascalroeleven.nl>,
 Thierry Reding <thierry.reding@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Sun, Jun 28, 2020 at 11:13:47AM +0200, Sam Ravnborg wrote:
> On Sun, Jun 28, 2020 at 10:54:01AM +0300, Laurent Pinchart wrote:
> > The DRM bus flags reporting on which clock edge the pixel data and sync
> > signals are sampled or driven don't make sense for LVDS panels, as the
> > bus then uses sub-clock timings to send data. Drop those flags and add a
> > warning in the probe function to make sure the mistake won't be
> > repeated.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 30 +++++++++++++++++-----------
> >  1 file changed, 18 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index bff1cab529d2..537d75ef7fc2 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -549,6 +549,14 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
> >  			panel_simple_parse_panel_timing_node(dev, panel, &dt);
> >  	}
> >  
> > +	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS)
> > +		/* Catch common mistakes for LVDS panels. */
> > +		WARN_ON(desc->bus_flags &
> > +			(DRM_BUS_FLAG_PIXDATA_POSEDGE |
> > +			 DRM_BUS_FLAG_PIXDATA_NEGEDGE |
> > +			 DRM_BUS_FLAG_SYNC_POSEDGE |
> > +			 DRM_BUS_FLAG_SYNC_NEGEDGE));
>
> The above are only the legacy flags.

We currently have

	DRM_BUS_FLAG_PIXDATA_POSEDGE = BIT(2),
	DRM_BUS_FLAG_PIXDATA_NEGEDGE = BIT(3),
	DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE = DRM_BUS_FLAG_PIXDATA_POSEDGE,
	DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE = DRM_BUS_FLAG_PIXDATA_NEGEDGE,
	DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE = DRM_BUS_FLAG_PIXDATA_NEGEDGE,
	DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE = DRM_BUS_FLAG_PIXDATA_POSEDGE,

Only the first two are legacy, but the last four have the same values. I
could pick DRIVE or SAMPLE (the latter seems to be a better match here)
instead.

> For LVDS panels I think we could check if either
> DRM_BUS_FLAG_DE_LOW or DRM_BUS_FLAG_DE_HIGH is set and nothing else.

A whitelist instead of a blacklist is a good idea.

> And then as an additional check that the .bus_format is relevant.

I have a patch for that, but we first need to fix two occurrences of
incorrect formats. As I couldn't find documentation for these two
panels, I've replied to the patches that introduced them, and am waiting
for answers.

> Then we have managed to catch most of the mistakes for LVDS panels.
> 
> We could add checks for DPI panels too, but that would be later.
> 
> > +
> >  	drm_panel_init(&panel->base, dev, &panel_simple_funcs,
> >  		       desc->connector_type);
> >  
> > @@ -688,7 +696,7 @@ static const struct panel_desc auo_b101aw03 = {
> >  		.height = 125,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> >  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >  
> > @@ -1398,7 +1406,7 @@ static const struct panel_desc chunghwa_claa070wp03xg = {
> >  		.height = 150,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> >  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >  
> > @@ -1423,7 +1431,7 @@ static const struct panel_desc chunghwa_claa101wa01a = {
> >  		.height = 120,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> >  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >  
> > @@ -1448,7 +1456,7 @@ static const struct panel_desc chunghwa_claa101wb01 = {
> >  		.height = 125,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> >  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >  
> > @@ -2123,7 +2131,7 @@ static const struct panel_desc innolux_n156bge_l21 = {
> >  		.height = 193,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> >  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >  
> > @@ -2256,7 +2264,7 @@ static const struct panel_desc koe_tx26d202vm0bwa = {
> >  		.disable = 1000,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> >  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >  
> > @@ -2497,9 +2505,7 @@ static const struct panel_desc logictechno_lt170410_2whc = {
> >  		.height = 136,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
> > -		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> > -		     DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> >  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >  
> > @@ -3072,7 +3078,7 @@ static const struct panel_desc samsung_ltn101nt05 = {
> >  		.height = 125,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> >  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >  
> > @@ -3319,7 +3325,7 @@ static const struct panel_desc starry_kr070pe2t = {
> >  		.height = 86,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> >  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >  
> > @@ -3512,7 +3518,7 @@ static const struct panel_desc toshiba_lt089ac29000 = {
> >  		.height = 116,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> >  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
