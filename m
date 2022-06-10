Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 520C6545DD6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 09:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6913E10F349;
	Fri, 10 Jun 2022 07:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D0610F2F0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 07:52:56 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nzZRl-0000uG-KA; Fri, 10 Jun 2022 09:52:45 +0200
Message-ID: <7d3bcbaa027422018b956507d5ac5d19422dc892.camel@pengutronix.de>
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Fri, 10 Jun 2022 09:52:40 +0200
In-Reply-To: <e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com>
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <CAPY8ntC-2Yij+a5wWEZ3BRBSh7bz+74coHCoB01ZhY550H+BDg@mail.gmail.com>
 <CGME20220405114402eucas1p1d139ce6825a481d1318f013cf27a5fe7@eucas1p1.samsung.com>
 <CAPY8ntAi1tM7BZEpKkMAasRH3R_+tJCUFY7k-yVBdtogvxQNRA@mail.gmail.com>
 <e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Mittwoch, dem 11.05.2022 um 16:58 +0200 schrieb Marek Szyprowski:
> Hi Dave,
> 
> On 05.04.2022 13:43, Dave Stevenson wrote:
> > On Fri, 18 Mar 2022 at 12:25, Dave Stevenson
> > <dave.stevenson@raspberrypi.com>  wrote:
> > > On Fri, 4 Mar 2022 at 15:18, Dave Stevenson
> > > <dave.stevenson@raspberrypi.com>  wrote:
> > > > Hi All
> > > A gentle ping on this series. Any comments on the approach?
> > > Thanks.
> > I realise the merge window has just closed and therefore folks have
> > been busy, but no responses on this after a month?
> > 
> > Do I give up and submit a patch to document that DSI is broken and no one cares?
> 
> Thanks for pointing this patchset in the 'drm: bridge: Add Samsung MIPI 
> DSIM bridge' thread, otherwise I would miss it since I'm not involved 
> much in the DRM development.
> 
> This resolves most of the issues in the Exynos DSI and its recent 
> conversion to the drm bridge framework. I've added the needed 
> prepare_upstream_first flags to the panels and everything works fine 
> without the bridge chain order hacks.
> 
> Feel free to add:
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> 
> The only remaining thing to resolve is the moment of enabling DSI host. 
> The proper sequence is:
> 
> 1. host power on, 2. device power on, 3. host init, 4. device init, 5. 
> video enable.
> 
> #1 is done in dsi's pre_enable, #2 is done in panel's prepare. #3 was so 
> far done in the first host transfer call, which usually happens in 
> panel's prepare, then the #4 happens. Then video enable is done in the 
> enable callbacks.
> 
> Jagan wants to move it to the dsi host pre_enable() to let it work with 
> DSI bridges controlled over different interfaces 
> (https://lore.kernel.org/all/20220504114021.33265-6-jagan@amarulasolutions.com/ 
> ). This however fails on Exynos with DSI panels, because when dsi's 
> pre_enable is called, the dsi device is not yet powered. I've discussed 
> this with Andrzej Hajda and we came to the conclusion that this can be 
> resolved by adding the init() callback to the struct mipi_dsi_host_ops. 
> Then DSI client (next bridge or panel) would call it after powering self 
> on, but before sending any DSI commands in its pre_enable/prepare functions.
> 
> I've prepared a prototype of such solution. This approach finally 
> resolved all the initialization issues! The bridge chain finally matches 
> the hardware, no hack are needed, and everything is controlled by the 
> DRM core. This prototype also includes the Jagan's patches, which add 
> IMX support to Samsung DSIM. If one is interested, here is my git repo 
> with all the PoC patches:
> 
> https://github.com/mszyprow/linux/tree/v5.18-next-20220511-dsi-rework

While this needs rework on the bridge chip side, I fear that we need
something like that to allow the bridge to control the sequencing of
the DSI host init. While most bridges that aren't controlled via the
DSI channel might be fine with just initializing the host right before
a video signal is driven, there are some that need a different
sequencing.

The chip I'm currently looking at is a TC368767, where the datasheet
states that the DSI lanes must be in LP-11 before the reset is
released. While the datasheet doesn't specify what happens if that
sequence is violated, Marek Vasut found that the chip enters a test
mode if the lanes are not in LP-11 at that point and I can confirm this
observation.
Now with the TC358767 being a DSI to (e)DP converter, we need to
release the chip from reset pretty early to establish the DP AUX
connection to communicate with the display, in order to find out which
video modes we can drive. As the chip is controlled via i2c in my case,
initializing the DSI host on first DSI command transaction is out and
doing so before the bridge pre_enable is way too late.

What I would need for this chip to work properly is an explicit call,
like the mipi_dsi_host_init() added in the PoC above, to allow the
bridge driver to kick the DSI host initialization before releasing the
chip from reset state.

Regards,
Lucas

