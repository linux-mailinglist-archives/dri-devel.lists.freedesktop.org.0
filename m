Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FC76B7196
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 09:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A51810E032;
	Mon, 13 Mar 2023 08:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CC610E032
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 08:51:16 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pbdta-0001gg-NM; Mon, 13 Mar 2023 09:51:06 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pbdtZ-0004f2-TH; Mon, 13 Mar 2023 09:51:05 +0100
Date: Mon, 13 Mar 2023 09:51:05 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Subject: Re: MXSFB and Video PLL clock on i.MX8M Mini/Nano Question
Message-ID: <20230313085105.GB7446@pengutronix.de>
References: <CAHCN7xJXMmwYqD=Eb2=_vJw390KAd6NgkWCpq6yCbAyaJ3xK5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xJXMmwYqD=Eb2=_vJw390KAd6NgkWCpq6yCbAyaJ3xK5A@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
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
Cc: Marek Vasut <marex@denx.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 12, 2023 at 02:28:45PM -0500, Adam Ford wrote:
> I am trying to work through a series that was submitted for enabling
> the DSI on the i.MX8M Mini and Nano.  I have extended this series to
> route the DSI to an HDMI bridge, and I am able to get several
> resolutions to properly sync on my monitor.  However, there are also a
>  bunch that appear on the list when I run modetest that do not sync on
> my monitor.
> 
> When running some debug code, it appears that it's related to the
> clocking of the MXSFB driver.
> 
> From what I can tell, the MSXFB driver attempts to set the clock based
> on the desired resolution and refresh rate.  When the default
> VIDEO_PLL clock is set to 594MHz, many of the resolutions that cleanly
> divide from the 594MHz clock appear to sync with my monitor.  However,
> in order to get other resolutions to appear, I have to manually change
> the device tree to set VIDEO_PLL to a different clock rate so MSXFB
> can use it.  Unfortunately, that breaks the resolutions that used to
> work.
> 
> I threw together a hack into the MXSFB driver which adds a new
> optional clock to the MSXFB driver.  When I pass VIDEO_PLL to this
> driver, it can automatically set the clock rate to match that of
> whatever the desired clock is, and I can get many more resolutions to
> appear.
> Another advantage of this is that the Video_PLL can be the minimum
> speed needed for a given rate instead of setting a higher rate, then
> dividing it down.

Isn't it possible to add the CLK_SET_RATE_PARENT flag to the pixel
clock? That's what i.MX6sx and i.MX7 do.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
