Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C0621C319
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 09:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2156E059;
	Sat, 11 Jul 2020 07:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324676E059
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 07:48:14 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 7BB3720023;
 Sat, 11 Jul 2020 09:48:09 +0200 (CEST)
Date: Sat, 11 Jul 2020 09:48:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 02/21] drm/panel: panel-simple: add default
 connector_type
Message-ID: <20200711074807.GA779438@ravnborg.org>
References: <20200703192417.372164-1-sam@ravnborg.org>
 <20200703192417.372164-3-sam@ravnborg.org>
 <20200710221124.GI5964@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200710221124.GI5964@pendragon.ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=E32O7hXo7yQk33TpG0kA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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

Hi Laurent.
On Sat, Jul 11, 2020 at 01:11:24AM +0300, Laurent Pinchart wrote:
> Hi Sam,
> 
> Thank you for the patch.
> 
> On Fri, Jul 03, 2020 at 09:23:58PM +0200, Sam Ravnborg wrote:
> > All panels shall report a connector type.
> > panel-simple has a lot of panels with no connector_type,
> > and for these fall back to DPI as the default.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 7b5d212215e0..b3ec965721b0 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -500,6 +500,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
> >  	struct panel_simple *panel;
> >  	struct display_timing dt;
> >  	struct device_node *ddc;
> > +	int connector_type;
> >  	int err;
> >  
> >  	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
> > @@ -566,8 +567,13 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
> >  			desc->bpc != 8);
> >  	}
> >  
> > -	drm_panel_init(&panel->base, dev, &panel_simple_funcs,
> > -		       desc->connector_type);
> > +	/* Default DRM_MODE_CONNECTOR_DPI if no connector_type is set */
> > +	if (desc->connector_type != 0)
> > +		connector_type = desc->connector_type;
> > +	else
> > +		connector_type = DRM_MODE_CONNECTOR_DPI;
> 
> This avoids a WARN_ON(), which is good, but should we add a dev_warn()
> to get this fixed ?

We need a proper check for all relevant properties for DPI
and the other connectors. Like you already did for LVDS.

The idea is we shall introduce the checks in one series,
so users when they fix the warnings they are all good.

And then we will have to catch less during review which is good.

It is on my TODO list, but wanted to have some other stuff done
first.

So in other words, good to go with this patch or do we need the proper
checks in place first?

	Sam

> 
> > +
> > +	drm_panel_init(&panel->base, dev, &panel_simple_funcs, connector_type);
> >  
> >  	err = drm_panel_of_backlight(&panel->base);
> >  	if (err)
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
