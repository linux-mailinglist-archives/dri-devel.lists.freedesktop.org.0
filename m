Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8023820236E
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jun 2020 13:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEACF6E13D;
	Sat, 20 Jun 2020 11:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098446E13D
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 11:50:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5E74552;
 Sat, 20 Jun 2020 13:49:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1592653798;
 bh=Yse0xxkqBA9zQB6NsSCfIUQj4zPL9RqWGQSBetYmgs0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=caO5V8De5kZPcWSI3NiTx50Pyd+048IPqlDXioJyxqyW6a9pEgbGV8+AlYIYDJRSy
 9W5I1Rd/UvI5MkhlWUbfPmQBPuhybIVAG/MqS72vC/EFTw3OzsdGGpKpaVycEsuSuN
 TFd87E3I4eFwFqyE77kJr5H8D0e6/N6eaj2z0Eu4=
Date: Sat, 20 Jun 2020 14:49:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v8 7/7] drm/panel-simple: Add missing connector type for
 some panels
Message-ID: <20200620114934.GB5829@pendragon.ideasonboard.com>
References: <20200617222703.17080-1-digetx@gmail.com>
 <20200617222703.17080-8-digetx@gmail.com>
 <20200620112132.GB16901@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200620112132.GB16901@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam and Dmitry,

On Sat, Jun 20, 2020 at 01:21:32PM +0200, Sam Ravnborg wrote:
> On Thu, Jun 18, 2020 at 01:27:03AM +0300, Dmitry Osipenko wrote:
> > The DRM panel bridge core requires connector type to be set up properly,
> > otherwise it rejects the panel. The missing connector type problem popped
> > up while I was trying to wrap CLAA070WP03XG panel into a DRM bridge in
> > order to test whether panel's rotation property work properly using
> > panel-simple driver on NVIDIA Tegra30 Nexus 7 tablet device, which uses
> > CLAA070WP03XG display panel.
> > 
> > The NVIDIA Tegra DRM driver recently gained DRM bridges support for the
> > RGB output and now driver wraps directly-connected panels into DRM bridge.
> > Hence all panels should have connector type set properly now, otherwise
> > the panel's wrapping fails.
> > 
> > This patch adds missing connector types for the LVDS panels that are found
> > on NVIDIA Tegra devices:
> > 
> >   1. AUO B101AW03
> >   2. Chunghwa CLAA070WP03XG
> >   3. Chunghwa CLAA101WA01A
> >   4. Chunghwa CLAA101WB01
> >   5. EDT ET057090DHU
> >   6. Innolux N156BGE L21
> >   7. Samsung LTN101NT05
> > 
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> Very good to have this fixed.
> I went ahead and pushed this commit to drm-misc-next as it is really
> independent from the rest of the series.
> 
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 6764ac630e22..9eb2dbb7bfa6 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -687,6 +687,7 @@ static const struct panel_desc auo_b101aw03 = {
> >  		.width = 223,
> >  		.height = 125,
> >  	},
> > +	.connector_type = DRM_MODE_CONNECTOR_LVDS,

Note that, for LVDS panels, the bus_format field is mandatory. This
panel, for instance, according to
http://www.vslcd.com/Specification/B101AW03%20V.0.pdf, uses
MEDIA_BUS_FMT_RGB666_1X7X3_SPWG (see
https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/subdev-formats.html#v4l2-mbus-pixelcode).
The panels below need to be investigated similarly.

> >  };
> >  
> >  static const struct display_timing auo_b101ean01_timing = {
> > @@ -1340,6 +1341,7 @@ static const struct panel_desc chunghwa_claa070wp03xg = {
> >  		.width = 94,
> >  		.height = 150,
> >  	},
> > +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >  
> >  static const struct drm_display_mode chunghwa_claa101wa01a_mode = {
> > @@ -1362,6 +1364,7 @@ static const struct panel_desc chunghwa_claa101wa01a = {
> >  		.width = 220,
> >  		.height = 120,
> >  	},
> > +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >  
> >  static const struct drm_display_mode chunghwa_claa101wb01_mode = {
> > @@ -1384,6 +1387,7 @@ static const struct panel_desc chunghwa_claa101wb01 = {
> >  		.width = 223,
> >  		.height = 125,
> >  	},
> > +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >  
> >  static const struct drm_display_mode dataimage_scf0700c48ggu18_mode = {
> > @@ -1573,6 +1577,7 @@ static const struct panel_desc edt_et057090dhu = {
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> >  	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> > +	.connector_type = DRM_MODE_CONNECTOR_LVDS,

This contradicts .bus_format and .bus_flags that hint that the panel is
a DPI panel, not an LVDS panel. According to
https://www.lcdtek.co.uk/dwpdf/ET057090DHU-RoHS.pdf, this isn't an LVDS
panel.

I'm worried enough research hasn't gone into this patch, and I'd prefer
reverting it until we check each panel individually.

> >  };
> >  
> >  static const struct drm_display_mode edt_etm0700g0dh6_mode = {
> > @@ -2055,6 +2060,7 @@ static const struct panel_desc innolux_n156bge_l21 = {
> >  		.width = 344,
> >  		.height = 193,
> >  	},
> > +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >  
> >  static const struct drm_display_mode innolux_p120zdg_bf1_mode = {
> > @@ -3001,6 +3007,7 @@ static const struct panel_desc samsung_ltn101nt05 = {
> >  		.width = 223,
> >  		.height = 125,
> >  	},
> > +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >  
> >  static const struct drm_display_mode samsung_ltn140at29_301_mode = {

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
