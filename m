Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEA8310DC5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 17:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FE26F487;
	Fri,  5 Feb 2021 16:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs11.siol.net [185.57.226.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582586F487
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 16:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id CDAA15212DD;
 Fri,  5 Feb 2021 17:21:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id TKfwXNZRDSav; Fri,  5 Feb 2021 17:21:25 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id 7BD0E52391A;
 Fri,  5 Feb 2021 17:21:25 +0100 (CET)
Received: from kista.localnet (cpe-86-58-58-53.static.triera.net [86.58.58.53])
 (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Zimbra) with ESMTPA id C6873523912;
 Fri,  5 Feb 2021 17:21:24 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>
Subject: Re: Re: [PATCH 2/5] drm/sun4i: tcon: set sync polarity for tcon1
 channel
Date: Fri, 05 Feb 2021 17:21:24 +0100
Message-ID: <2156838.FvJGUiYDvf@kista>
In-Reply-To: <20210205160130.ccp7jfcaa5hgyekb@gilmour>
References: <20210204184710.1880895-1-jernej.skrabec@siol.net>
 <CAGb2v64qww4pFwMVrY5UpHOQtM43Q0VPx=3PwJGbB5Oh0qnx=w@mail.gmail.com>
 <20210205160130.ccp7jfcaa5hgyekb@gilmour>
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne petek, 05. februar 2021 ob 17:01:30 CET je Maxime Ripard napisal(a):
> On Fri, Feb 05, 2021 at 11:21:22AM +0800, Chen-Yu Tsai wrote:
> > On Fri, Feb 5, 2021 at 2:48 AM Jernej Skrabec <jernej.skrabec@siol.net> 
wrote:
> > >
> > > Channel 1 has polarity bits for vsync and hsync signals but driver never
> > > sets them. It turns out that with pre-HDMI2 controllers seemingly there
> > > is no issue if polarity is not set. However, with HDMI2 controllers
> > > (H6) there often comes to de-synchronization due to phase shift. This
> > > causes flickering screen. It's safe to assume that similar issues might
> > > happen also with pre-HDMI2 controllers.
> > >
> > > Solve issue with setting vsync and hsync polarity. Note that display
> > > stacks with tcon top have polarity bits actually in tcon0 polarity
> > > register.
> > >
> > > Fixes: 9026e0d122ac ("drm: Add Allwinner A10 Display Engine support")
> > > Tested-by: Andre Heider <a.heider@gmail.com>
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > ---
> > >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 24 ++++++++++++++++++++++++
> > >  drivers/gpu/drm/sun4i/sun4i_tcon.h |  5 +++++
> > >  2 files changed, 29 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/
sun4i_tcon.c
> > > index 6b9af4c08cd6..0d132dae58c0 100644
> > > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > @@ -672,6 +672,29 @@ static void sun4i_tcon1_mode_set(struct sun4i_tcon 
*tcon,
> > >                      SUN4I_TCON1_BASIC5_V_SYNC(vsync) |
> > >                      SUN4I_TCON1_BASIC5_H_SYNC(hsync));
> > >
> > > +       /* Setup the polarity of sync signals */
> > > +       if (tcon->quirks->polarity_in_ch0) {
> > > +               val = 0;
> > > +
> > > +               if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> > > +                       val |= SUN4I_TCON0_IO_POL_HSYNC_POSITIVE;
> > > +
> > > +               if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> > > +                       val |= SUN4I_TCON0_IO_POL_VSYNC_POSITIVE;
> > > +
> > > +               regmap_write(tcon->regs, SUN4I_TCON0_IO_POL_REG, val);
> > > +       } else {
> > > +               val = SUN4I_TCON1_IO_POL_UNKNOWN;
> > 
> > I think a comment for the origin of this is warranted.
> 
> If it's anything like TCON0, it's the pixel clock polarity

Hard to say, DW HDMI controller has "data enable" polarity along hsync and 
vsync. It could be either or none of those.

What should I write in comment? BSP drivers and documentation use only generic 
names like io2_inv.

Best regards,
Jernej


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
