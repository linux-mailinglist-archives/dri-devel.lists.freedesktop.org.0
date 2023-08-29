Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA9778BFDA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 10:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B38D10E00A;
	Tue, 29 Aug 2023 08:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FD810E00A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 08:04:05 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1qathX-0002ae-FI; Tue, 29 Aug 2023 10:03:51 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1qathU-0005OL-9u; Tue, 29 Aug 2023 10:03:48 +0200
Date: Tue, 29 Aug 2023 10:03:48 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH 0/5] drm/bridge: samsung-dsim: fix various modes with
 ADV7535 bridge
Message-ID: <20230829080348.GH17387@pengutronix.de>
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <CAHCN7xKasndWCkvU31Lqftty0Y1aDD370WJhaZio+_E4oajLrg@mail.gmail.com>
 <CAHCN7x+jhW9a+v6pc1bNUjj59gZQWvCT4TLSUZ6jKouGNUZasw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7x+jhW9a+v6pc1bNUjj59gZQWvCT4TLSUZ6jKouGNUZasw@mail.gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Aug 2023 18:07:08 -0500, Adam Ford wrote:
> On Mon, Aug 28, 2023 at 11:13 AM Adam Ford <aford173@gmail.com> wrote:
> >
> > On Mon, Aug 28, 2023 at 10:59 AM Michael Tretter
> > <m.tretter@pengutronix.de> wrote:
> > >
> > > I tested the i.MX8M Nano EVK with the NXP supplied MIPI-DSI adapter,
> > > which uses an ADV7535 MIPI-DSI to HDMI converter. I found that a few
> > > modes were working, but in many modes my monitor stayed dark.
> > >
> > > This series fixes the Samsung DSIM bridge driver to bring up a few more
> > > modes:
> > >
> > > The driver read the rate of the PLL ref clock only during probe.
> > > However, if the clock is re-parented to the VIDEO_PLL, changes to the
> > > pixel clock have an effect on the PLL ref clock. Therefore, the driver
> > > must read and potentially update the PLL ref clock on every modeset.
> > >
> > > I also found that the rounding mode of the porches and active area has
> > > an effect on the working modes. If the driver rounds up instead of
> > > rounding down and be calculates them in Hz instead of kHz, more modes
> > > start to work.
> > >
> > > The following table shows the modes that were working in my test without
> > > this patch set and the modes that are working now:
> > >
> > > |            Mode | Before | Now |
> > > | 1920x1080-60.00 | X      | X   |
> > > | 1920x1080-59.94 |        | X   |
> > > | 1920x1080-50.00 |        | X   |
> > > | 1920x1080-30.00 |        | X   |
> > > | 1920x1080-29.97 |        | X   |
> > > | 1920x1080-25.00 |        | X   |
> > > | 1920x1080-24.00 |        |     |
> > > | 1920x1080-23.98 |        |     |
> > > | 1680x1050-59.88 |        | X   |
> > > | 1280x1024-75.03 | X      | X   |
> > > | 1280x1024-60.02 | X      | X   |
> > > |  1200x960-59.99 |        | X   |
> > > |  1152x864-75.00 | X      | X   |
> > > |  1280x720-60.00 |        |     |
> > > |  1280x720-59.94 |        |     |
> > > |  1280x720-50.00 |        | X   |
> > > |  1024x768-75.03 |        | X   |
> > > |  1024x768-60.00 |        | X   |
> > > |   800x600-75.00 | X      | X   |
> > > |   800x600-60.32 | X      | X   |
> > > |   720x576-50.00 | X      | X   |
> > > |   720x480-60.00 |        |     |
> > > |   720x480-59.94 | X      |     |
> > > |   640x480-75.00 | X      | X   |
> > > |   640x480-60.00 |        | X   |
> > > |   640x480-59.94 |        | X   |
> > > |   720x400-70.08 |        |     |
> > >
> >
> > Nice!
> >
> > > Interestingly, the 720x480-59.94 mode stopped working. However, I am
> > > able to bring up the 720x480 modes by manually hacking the active area
> > > (hsa) to 40 and carefully adjusting the clocks, but something still
> > > seems to be off.
> >
> > Checkout my
> >
> > branch: https://github.com/aford173/linux/commit/183cf6d154afeb9b0300500b09d7b8ec53047a12

Thanks for the pointer.

> >
> > I found that certain resolutions don't properly round, and it seemed
> > to be related to the size of HFP.  HFP of 110 when divded between 4
> > lanes, required a round-up, but then I had to recalculate the rest of
> > the horizontal timings to compensate.
> >
> > I was going to push that as an RFC, but I will investigate your patch
> > series first.  With my small rounding correction, I am able to get
> > 720x480 and 720p on my imx8mp, but not my mini/nano, so I am hoping
> > your patch series fixes that issue for me.
> >
> > >
> > > Unfortunately, a few more modes are still not working at all. The NXP
> > > downstream kernel has some quirks to handle some of the modes especially
> > > wrt. to the porches, but I cannot figure out, what the driver should
> > > actually do in these cases. Maybe there is still an error in the
> > > calculation of the porches and someone at NXP can chime in.
> >
> > Hopefully the comment in my above patch explains how the calculation
> > is corrected and adjusted to get some of the missing resolutions.
> 
> I tested my above patch and it works to sync 720p-60 on my imx8mp, but
> it doesn't seem to sync on my imx8mm using the same monitor and HDMI
> cable.  I don't have a DSI analyzer, so I might still send out a
> modified version of my patch as an RFC once this gets approved.

I tested your patch with all modes of my monitor. 720p-60 doesn't work on my
imx8mn either. The results are the same for DIV_ROUND_CLOSEST and
DIV64_U64_ROUND_UP, but I didn't check for differences in the actually
calculated HFP, yet.

Michael

> 
> adam
> >
> > > Michael
> > >
> > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> >
> > I'll try to reivew this week and respond with my feedback.
> >
> > adam
> >
> > > ---
> > > Marco Felsch (1):
> > >       drm/bridge: samsung-dsim: add more mipi-dsi device debug information
> > >
> > > Michael Tretter (4):
> > >       drm/bridge: samsung-dsim: reread ref clock before configuring PLL
> > >       drm/bridge: samsung-dsim: update PLL reference clock
> > >       drm/bridge: samsung-dsim: adjust porches by rounding up
> > >       drm/bridge: samsung-dsim: calculate porches in Hz
> > >
> > >  drivers/gpu/drm/bridge/samsung-dsim.c | 42 +++++++++++++++++++++++++----------
> > >  include/drm/bridge/samsung-dsim.h     |  1 +
> > >  2 files changed, 31 insertions(+), 12 deletions(-)
> > > ---
> > > base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
> > > change-id: 20230818-samsung-dsim-42346444bce5
> > >
> > > Best regards,
> > > --
> > > Michael Tretter <m.tretter@pengutronix.de>
> > >
> 
