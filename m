Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B3F41AED8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 14:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61586E51A;
	Tue, 28 Sep 2021 12:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81096E51A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 12:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id AC75EFB03;
 Tue, 28 Sep 2021 14:20:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EggkIh7qLVK4; Tue, 28 Sep 2021 14:20:35 +0200 (CEST)
Date: Tue, 28 Sep 2021 14:20:33 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm: mxsfb: Set proper default bus format when using a
 bridge
Message-ID: <YVMIkaJnCyvBu6/d@qwark.sigxcpu.org>
References: <YVLYh/SgBritG/RJ@qwark.sigxcpu.org>
 <1fda3b80-7df2-2ce3-b049-6773e849e9dc@denx.de>
 <YVLeMlQWd/lBNjsX@qwark.sigxcpu.org>
 <3ebcbc4dba56011ddf4761dc47513dbb66fe656d.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ebcbc4dba56011ddf4761dc47513dbb66fe656d.camel@pengutronix.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Tue, Sep 28, 2021 at 11:27:49AM +0200, Lucas Stach wrote:
> Am Dienstag, dem 28.09.2021 um 11:19 +0200 schrieb Guido Günther:
> > Hi,
> > On Tue, Sep 28, 2021 at 11:08:58AM +0200, Marek Vasut wrote:
> > > On 9/28/21 10:55 AM, Guido Günther wrote:
> > > > If a bridge doesn't do any bus format handling MEDIA_BUS_FMT_FIXED is
> > > > returned. Fallback to a reasonable default (MEDIA_BUS_FMT_RGB888_1X24) in
> > > > that case.
> > > > 
> > > > This unbreaks e.g. using mxsfb with the nwl bridge and mipi panels.
> > > > 
> > > > Fixes: b776b0f00f24 ("drm: mxsfb: Use bus_format from the nearest bridge if present")
> > > > 
> > > > Signed-off-by: Guido Günther <agx@sigxcpu.org>
> > > > ---
> > > > 
> > > > I'll look at what needs to be done in nwl separately but this also
> > > > unbreaks other bridge seupts that don't to format negotiation yet.
> > > > 
> > > >   drivers/gpu/drm/mxsfb/mxsfb_kms.c | 2 ++
> > > >   1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > > > index af6c620adf6e..4ef94cf686b0 100644
> > > > --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > > > +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > > > @@ -369,6 +369,8 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
> > > >   			drm_atomic_get_new_bridge_state(state,
> > > >   							mxsfb->bridge);
> > > >   		bus_format = bridge_state->input_bus_cfg.format;
> > > > +		if (bus_format == MEDIA_BUS_FMT_FIXED)
> > > > +			bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> > > 
> > > Shouldn't the NWL bridge return the correct format ?
> > 
> > Yes it should and I'll send a separate patch for that but we currently
> > don't do anything meaningful at all if the bridge doesn't do format
> > negotiation and then fail setup in mxsfb_set_formats().
> > 
> > I think we should at least preserve the status quo (as we do with the
> > non bridge case in b776b0f00f24 too).
> > 
> > We could have a warning to spot drivers that don't do that yet and hence
> > the generic code returns MEDIA_BUS_FMT_FIXED.
> > 
> That sounds sensible. Using a default format if we don't know what to
> do is going to be a unpleasant surprise for those with a display
> pipeline that doesn't work with the default format. So please add a
> dev_warn when we are doing this fallback.
> 
> Also I would argue that the NWL fix is the patch that should go in the
> stable tree. This one should only be a additional safety net, so I
> would drop the Fixes tag.

Dropped and folded into the small series with other fixes needed to
get get the bus format propagated up from the panel.
Cheers,
 -- Guido

> 
> Regards,
> Lucas
> 
