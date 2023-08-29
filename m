Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1062F78BF99
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 09:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B6910E0A6;
	Tue, 29 Aug 2023 07:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9569510E0A6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 07:49:59 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1qatU2-0000LO-Fo; Tue, 29 Aug 2023 09:49:54 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1qatU0-0003hv-5P; Tue, 29 Aug 2023 09:49:52 +0200
Date: Tue, 29 Aug 2023 09:49:52 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH 3/5] drm/bridge: samsung-dsim: update PLL reference clock
Message-ID: <20230829074952.GF17387@pengutronix.de>
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <20230818-samsung-dsim-v1-3-b39716db6b7a@pengutronix.de>
 <20230828164148.tm23yudt76eqefzh@pengutronix.de>
 <CAHCN7xL8nMs3w82EWtxr1DGncejZtwDgVfR6KBxmkJdD7xAYQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xL8nMs3w82EWtxr1DGncejZtwDgVfR6KBxmkJdD7xAYQg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 kernel@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
 Marco Felsch <m.felsch@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Aug 2023 13:17:44 -0500, Adam Ford wrote:
> On Mon, Aug 28, 2023 at 11:42 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > On 23-08-28, Michael Tretter wrote:
> > > The PLL requires a clock between 2 MHz and 30 MHz after the pre-divider.
> > > The reference clock for the PLL may change due to changes to it's parent
> > > clock. Thus, the frequency may be out of range or unsuited for
> > > generating the high speed clock for MIPI DSI.
> > >
> > > Try to keep the pre-devider small, and set the reference clock close to
> > > 30 MHz before recalculating the PLL configuration. Use a divider with a
> > > power of two for the reference clock as this seems to work best in
> > > my tests.
> > >
> > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > ---
> > >  drivers/gpu/drm/bridge/samsung-dsim.c | 15 +++++++++++++--
> > >  1 file changed, 13 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > index da90c2038042..4de6e4f116db 100644
> > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > @@ -611,10 +611,21 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
> > >       u16 m;
> > >       u32 reg;
> > >
> > > -     if (dsi->pll_clk)
> > > +     if (dsi->pll_clk) {
> > > +             /*
> > > +              * Ensure that the reference clock is generated with a power of
> > > +              * two divider from its parent, but close to the PLLs upper
> > > +              * limit of the valid range of 2 MHz to 30 MHz.
> > > +              */
> > > +             fin = clk_get_rate(clk_get_parent(dsi->pll_clk));
> > > +             while (fin > 30 * MHZ)
> > > +                     fin = fin / 2;
> >
> > Really just a cosmetic nit: fin /= 2;
> >
> > Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> >
> > > +             clk_set_rate(dsi->pll_clk, fin);
> > > +
> > >               fin = clk_get_rate(dsi->pll_clk);
> > > -     else
> > > +     } else {
> > >               fin = dsi->pll_clk_rate;
> > > +     }
> 
> I don't have all the code style rules memorized.  Did you run it
> through checkpatch?  I wonder if the braces here are appropriate for a
> 1-line after the else.  If checkpatch is happy, I am fine with it.

checkpatch is happy: The coding style states that if one of the branches needs
braces because it has multiple statements, all branches should have braces.

Michael

> 
> adam
> > >       dev_dbg(dsi->dev, "PLL ref clock freq %lu\n", fin);
> > >
> > >       fout = samsung_dsim_pll_find_pms(dsi, fin, freq, &p, &m, &s);
> > >
> > > --
> > > 2.39.2
> > >
> > >
> > >
> 
