Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 501FB79390A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFD010E5C3;
	Wed,  6 Sep 2023 09:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD09C10E5C3
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 09:56:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1qdpGk-00011B-Bx; Wed, 06 Sep 2023 11:56:18 +0200
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mtr@pengutronix.de>)
 id 1qdpGi-004Oay-4u; Wed, 06 Sep 2023 11:56:16 +0200
Received: from mtr by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1qdpGh-0028cS-V9; Wed, 06 Sep 2023 11:56:15 +0200
Date: Wed, 6 Sep 2023 11:56:15 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH 0/5] drm/bridge: samsung-dsim: fix various modes with
 ADV7535 bridge
Message-ID: <20230906095615.GB375493@pengutronix.de>
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <a95481b7-e38c-4b7c-be49-4c74e07d3523@kontron.de>
 <86fac1f0-0fcb-4cbd-a983-03a6e7c41097@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <86fac1f0-0fcb-4cbd-a983-03a6e7c41097@kontron.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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

Hi Frieder,

On Wed, 06 Sep 2023 11:31:45 +0200, Frieder Schrempf wrote:
> On 04.09.23 16:02, Frieder Schrempf wrote:
> > On 28.08.23 17:59, Michael Tretter wrote:
> >> I tested the i.MX8M Nano EVK with the NXP supplied MIPI-DSI adapter,
> >> which uses an ADV7535 MIPI-DSI to HDMI converter. I found that a few
> >> modes were working, but in many modes my monitor stayed dark.
> >>
> >> This series fixes the Samsung DSIM bridge driver to bring up a few more
> >> modes:
> >>
> >> The driver read the rate of the PLL ref clock only during probe.
> >> However, if the clock is re-parented to the VIDEO_PLL, changes to the
> >> pixel clock have an effect on the PLL ref clock. Therefore, the driver
> >> must read and potentially update the PLL ref clock on every modeset.
> >>
> >> I also found that the rounding mode of the porches and active area has
> >> an effect on the working modes. If the driver rounds up instead of
> >> rounding down and be calculates them in Hz instead of kHz, more modes
> >> start to work.
> >>
> >> The following table shows the modes that were working in my test without
> >> this patch set and the modes that are working now:
> >>
> >> |            Mode | Before | Now |
> >> | 1920x1080-60.00 | X      | X   |
> >> | 1920x1080-59.94 |        | X   |
> >> | 1920x1080-50.00 |        | X   |
> >> | 1920x1080-30.00 |        | X   |
> >> | 1920x1080-29.97 |        | X   |
> >> | 1920x1080-25.00 |        | X   |
> >> | 1920x1080-24.00 |        |     |
> >> | 1920x1080-23.98 |        |     |
> >> | 1680x1050-59.88 |        | X   |
> >> | 1280x1024-75.03 | X      | X   |
> >> | 1280x1024-60.02 | X      | X   |
> >> |  1200x960-59.99 |        | X   |
> >> |  1152x864-75.00 | X      | X   |
> >> |  1280x720-60.00 |        |     |
> >> |  1280x720-59.94 |        |     |
> >> |  1280x720-50.00 |        | X   |
> >> |  1024x768-75.03 |        | X   |
> >> |  1024x768-60.00 |        | X   |
> >> |   800x600-75.00 | X      | X   |
> >> |   800x600-60.32 | X      | X   |
> >> |   720x576-50.00 | X      | X   |
> >> |   720x480-60.00 |        |     |
> >> |   720x480-59.94 | X      |     |
> >> |   640x480-75.00 | X      | X   |
> >> |   640x480-60.00 |        | X   |
> >> |   640x480-59.94 |        | X   |
> >> |   720x400-70.08 |        |     |
> >>
> >> Interestingly, the 720x480-59.94 mode stopped working. However, I am
> >> able to bring up the 720x480 modes by manually hacking the active area
> >> (hsa) to 40 and carefully adjusting the clocks, but something still
> >> seems to be off.
> >>
> >> Unfortunately, a few more modes are still not working at all. The NXP
> >> downstream kernel has some quirks to handle some of the modes especially
> >> wrt. to the porches, but I cannot figure out, what the driver should
> >> actually do in these cases. Maybe there is still an error in the
> >> calculation of the porches and someone at NXP can chime in.
> > 
> > Thanks for working on this! We tested these patches with our Kontron BL
> > i.MX8MM board and a "10.1inch HDMI LCD (E)" display from Waveshare  [1].
> > 
> > Without this series we don't get an image with the default mode of the
> > display (1024x600). With this series applied, it's now working.
> 
> Minor correction: The display does work, but there is some flickering
> and occasional black screens if you let it run for some time. So there
> is still some sync issue.

What is the parent of the dsi_phy_ref clock in your test case?  Make sure that
the lcdif_pixel and dsi_phy_ref clocks are driven by the same PLL.

I saw occasional black screens, if the lcdif_pixel and dsi_phy_ref clock had
different parents, and fixed it by changing the assigned-parent of
IMX8MN_CLK_DSI_PHY_REF to IMX8MN_VIDEO_PLL1_OUT in the device tree. If the
clocks are not in sync, it seems that the ADV3575 has issues correctly
reconstructing the pixel clock and HDMI monitors loose sync.

This is something that must be configured in the board device tree, though.

Michael

> 
> Anyway it's better than not working at all.
> 
> > 
> > For the whole series:
> > 
> > Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL
> > i.MX8MM + Waveshare 10.1inch HDMI LCD (E)
> > 
> > Thanks
> > Frieder
> > 
> > [1] https://www.waveshare.com/10.1inch-hdmi-lcd-e.htm
> 
