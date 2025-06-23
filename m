Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FF5AE3B89
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 12:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FB910E0E9;
	Mon, 23 Jun 2025 10:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="YknfX437";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A263110E05B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 10:02:59 +0000 (UTC)
Received: from francesco-nb
 (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
 by mail11.truemail.it (Postfix) with ESMTPA id 7A76A1FA8F;
 Mon, 23 Jun 2025 12:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1750672974;
 bh=o9gK1oyJAjE6oa76DzirijbCMI6ITVFFKA9WRcVsiT0=; h=From:To:Subject;
 b=YknfX437HZgovMEl0FLqq8i55sHKy/dG4VIucIsOBk8u3uBSNsAItiKCi5jZr9Qkr
 Ne6V6S5/eXWz9kYtVokuXMtXW+KqJBZH+IM8Fr2mdd3tLwmNEWHwsrl1LL4WXiwHDz
 nQgvlbBZh8R69LAC5fYhsC09mmJzzrzrKZ6PIrkBxuNLuoBPZoKNNEMnZsPGo+YqdM
 UwzUPqZRGxyqafupcruy1tPc/vAGWk4eTUAk0sS7Y1HZ+cz/yF8oI4w00RJVaVhwri
 vH2bpx476LPXct4rPIoowpK+n8A3zkYUdjmxzMayQdm8ckWwgC4sXGdXazkOxm6OVj
 DHu331xwM3NvA==
Date: Mon, 23 Jun 2025 12:02:49 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hiago De Franco <hiagofranco@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH] drm/bridge: samsung-dsim: Fix init order
Message-ID: <20250623100249.GA32388@francesco-nb>
References: <CGME20250619122746eucas1p149ff73e78cb82dc06c19960a2bbd3d89@eucas1p1.samsung.com>
 <20250619-samsung-dsim-fix-v1-1-6b5de68fb115@ideasonboard.com>
 <e23e6192-6e13-41b4-acdd-2593f4f37895@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e23e6192-6e13-41b4-acdd-2593f4f37895@samsung.com>
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

On Mon, Jun 23, 2025 at 11:34:34AM +0200, Marek Szyprowski wrote:
> On 19.06.2025 14:27, Tomi Valkeinen wrote:
> > The commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain
> > pre-enable and post-disable") changed the order of enable/disable calls.
> > Previously the calls (on imx8mm) were:
> >
> > mxsfb_crtc_atomic_enable()
> > samsung_dsim_atomic_pre_enable()
> > samsung_dsim_atomic_enable()
> >
> > now the order is:
> >
> > samsung_dsim_atomic_pre_enable()
> > mxsfb_crtc_atomic_enable()
> > samsung_dsim_atomic_enable()
> >
> > On imx8mm (possibly on imx8mp, and other platforms too) this causes two
> > issues:
> >
> > 1. The DSI PLL setup depends on a refclk, but the DSI driver does not
> > set the rate, just uses it with the rate it has. On imx8mm this refclk
> > seems to be related to the LCD controller's video clock. So, when the
> > mxsfb driver sets its video clock, DSI's refclk rate changes.
> >
> > Earlier this mxsfb_crtc_atomic_enable() set the video clock, so the PLL
> > refclk rate was set (and didn't change) in the DSI enable calls. Now the
> > rate changes between DSI's pre_enable() and enable(), but the driver
> > configures the PLL in the pre_enable().
> >
> > Thus you get a black screen on a modeset. Doing the modeset again works,
> > as the video clock rate stays the same.
> >
> > 2. The image on the screen is shifted/wrapped horizontally. I have not
> > found the exact reason for this, but the documentation seems to hint
> > that the LCD controller's pixel stream should be enabled first, before
> > setting up the DSI. This would match the change, as now the pixel stream
> > starts only after DSI driver's pre_enable().
> >
> > The main function related to this issue is samsung_dsim_init() which
> > will do the clock and link configuration. samsung_dsim_init() is
> > currently called from pre_enable(), but it is also called from
> > samsung_dsim_host_transfer() to set up the link if the peripheral driver
> > wants to send a DSI command.
> >
> > This patch fixes both issues by moving the samsung_dsim_init() call from
> > pre_enable() to enable().
> >
> > However, to deal with the case where the samsung_dsim_init() has already
> > been called from samsung_dsim_host_transfer() and the refclk rate has
> > changed, we need to make sure we re-initialize the DSI with the new rate
> > in enable(). This is achieved by clearing the DSIM_STATE_INITIALIZED
> > flag and uninitializing the clocks and irqs before calling
> > samsung_dsim_init().
> >
> > Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
> > Reported-by: Hiago De Franco <hiagofranco@gmail.com>
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Seems to be working fine on all my Exynos based boards:
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> 
> BTW, it was a long discussion how to handle the dsim initialization and 
> we agreed to keep calling samsung_dsim_init() on first dsi transfer for 
> Exynos case and from pre-enable for others:
> 
> https://lore.kernel.org/all/20221209152343.180139-11-jagan@amarulasolutions.com/
> 
> I'm not sure if changing this won't break again something, especially 
> the boards with DSI bridge or panel controlled via I2C instead of the 
> DSI commands. This has to be tested on the all supported variants of 
> this hardware.

FWIW, DSI bridges (LT8912B and SN65DSI83) controlled over I2C were
tested fine with this patch on both NXP i.MX8MP and 8MM (see Hiago
tested-by).


Francesco

