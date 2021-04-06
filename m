Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2949354D69
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 09:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7773889DEC;
	Tue,  6 Apr 2021 07:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 326 seconds by postgrey-1.36 at gabe;
 Tue, 06 Apr 2021 07:08:47 UTC
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2552D89DEC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 07:08:47 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 666E580A4;
 Tue,  6 Apr 2021 07:04:28 +0000 (UTC)
Date: Tue, 6 Apr 2021 10:03:16 +0300
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] drm/panel: panel-dsi-cm: disable TE for now
Message-ID: <YGwHtGs0bH5z2zx5@atomide.com>
References: <YDnyVV/O78sQjtWb@atomide.com>
 <20210227214542.99961-1-sebastian.reichel@collabora.com>
 <c8d624ce-5cc5-ba83-4446-4c7a7903b344@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8d624ce-5cc5-ba83-4446-4c7a7903b344@ideasonboard.com>
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
Cc: Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

* Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210316 14:12]:
> Hi Sebastian, Sam, Thierry,
> 
> On 27/02/2021 23:45, Sebastian Reichel wrote:
> > From: Sebastian Reichel <sre@kernel.org>
> > 
> > Disable TE for Droid 4 panel, since implementation is currently
> > broken. Also disable it for N950 panel, which is untested.
> > 
> > Reported-by: Tony Lindgren <tony@atomide.com>
> > Reported-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > Fixes: 4c1b935fea54 ("drm/omap: dsi: move TE GPIO handling into core")
> > Signed-off-by: Sebastian Reichel <sre@kernel.org>
> > ---
> > I suggest to start by fix the regression like this and look into
> > proper Droid 4 TE support separatly. Assumption is, that Tomi
> > tested taal panel, droid4 panel is 'broken' and N950 (himalaya)
> > is untested [*], so choosing safe default. Patch is compile-tested
> > only.
> > 
> > [*] N950 display is not yet functional on mainline, since it needs
> > the omap3 FIFO workaround:
> > https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-n900.git/commit/?h=n950-display-tony&id=d4cbc226a30b29bf2583ffff97b052c9ec68c8a3
> > ---
> >   drivers/gpu/drm/panel/panel-dsi-cm.c | 12 +++++++++---
> >   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Sam, Thierry, will you pick this up or can I push to drm-misc-fixes?

Looks like this regression fix is still pending, can you guys please
apply?

Regards,

Tony


> > diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> > index af381d756ac1..5fbfb71ca3d9 100644
> > --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> > +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> > @@ -37,6 +37,7 @@ struct dsic_panel_data {
> >   	u32 height_mm;
> >   	u32 max_hs_rate;
> >   	u32 max_lp_rate;
> > +	bool te_support;
> >   };
> >   struct panel_drv_data {
> > @@ -334,9 +335,11 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
> >   	if (r)
> >   		goto err;
> > -	r = mipi_dsi_dcs_set_tear_on(ddata->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> > -	if (r)
> > -		goto err;
> > +	if (ddata->panel_data->te_support) {
> > +		r = mipi_dsi_dcs_set_tear_on(ddata->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> > +		if (r)
> > +			goto err;
> > +	}
> >   	/* possible panel bug */
> >   	msleep(100);
> > @@ -619,6 +622,7 @@ static const struct dsic_panel_data taal_data = {
> >   	.height_mm = 0,
> >   	.max_hs_rate = 300000000,
> >   	.max_lp_rate = 10000000,
> > +	.te_support = true,
> >   };
> >   static const struct dsic_panel_data himalaya_data = {
> > @@ -629,6 +633,7 @@ static const struct dsic_panel_data himalaya_data = {
> >   	.height_mm = 88,
> >   	.max_hs_rate = 300000000,
> >   	.max_lp_rate = 10000000,
> > +	.te_support = false,
> >   };
> >   static const struct dsic_panel_data droid4_data = {
> > @@ -639,6 +644,7 @@ static const struct dsic_panel_data droid4_data = {
> >   	.height_mm = 89,
> >   	.max_hs_rate = 300000000,
> >   	.max_lp_rate = 10000000,
> > +	.te_support = false,
> >   };
> >   static const struct of_device_id dsicm_of_match[] = {
> > 
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
