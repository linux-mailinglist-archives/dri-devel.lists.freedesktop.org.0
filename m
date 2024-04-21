Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC0D8ABFA7
	for <lists+dri-devel@lfdr.de>; Sun, 21 Apr 2024 16:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7961D10E85F;
	Sun, 21 Apr 2024 14:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=xff.cz header.i=@xff.cz header.b="Q5hzTT/b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2206110E85F
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 14:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1713711247; bh=DquiAy/l3EzCcC9zc5B4mjOJ1S+6pthVCA5/7nB4vTI=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=Q5hzTT/bFnyW6HRXRlwtJ9+jsjMfHBSOE+9lF5iqXY35r0LttRPbWTFCyMYkJloP4
 uXuFpEyUNp7/KgAWCnVnA8xgJPzh5/j7ofMKoxxDqLaIpPj1cVbydpOJxcPX9TEOwj
 cflMQBsltsfbxduKYC7RhVhQlyx8pzdMcVNVB1CQ=
Date: Sun, 21 Apr 2024 16:54:06 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH] drm: bridge: dw-mipi-dsi: Call modeset in modeset
 callback
Message-ID: <iw3lj7vthckcrkxp2y5lnlx4lnoud6x3v46s4s5moye4dgsayj@6s4serjkiogp>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
 Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20240421002330.172723-1-marex@denx.de>
 <t3dkuckbko5lmkfezhdtcwrynnbcs4yfn5mtmdyirnktellc5a@ktab3j6rvf3u>
 <4da75f3b-16a7-46f4-97d9-6f51a54fbe7e@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4da75f3b-16a7-46f4-97d9-6f51a54fbe7e@denx.de>
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

On Sun, Apr 21, 2024 at 04:25:34PM GMT, Marek Vasut wrote:
> On 4/21/24 1:09 PM, Ondřej Jirman wrote:
> > Hi,
> 
> Hi,
> 
> > On Sun, Apr 21, 2024 at 02:22:35AM GMT, Marek Vasut wrote:
> > > Doing modeset in .atomic_pre_enable callback instead of dedicated .mode_set
> > > callback does not seem right. Undo this change, which was added as part of
> > 
> > Actually no. If anything, mode_set callback should be dropped entirely:
> > 
> > See https://elixir.bootlin.com/linux/latest/source/include/drm/drm_bridge.h#L231
> > 
> > It's deprecated, and enable callback should just use adjusted_mode:
> > 
> >      This is deprecated, do not use! New drivers shall set their mode in the
> >      &drm_bridge_funcs.atomic_enable operation.
> 
> This mentions new drivers ?

Yes.

> > > commit 05aa61334592 ("drm: bridge: dw-mipi-dsi: Fix enable/disable of DSI
> > > controller") as it breaks STM32MP15xx LTDC scanout (DSI)->TC358762 DSI-to-DPI
> > > bridge->PT800480 DPI panel pipeline. The original fix for HX8394 panel likely
> > > requires HX8394 panel side fix instead.
> > 
> > There's nothing wrong with the panel driver. And that commit is not fixing issue
> > with the panel driver, just like the subject hints at. Look at the referenced
> > commit, at "Before:" sequence specifically.
> > 
> > dw_mipi_dsi_mode_set may be named *_mode_set or whatever, but it's basically
> > an enable function that turns on clocks, initalizes phy, etc. etc.
> > 
> > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L998
> > 
> > And if you check "Before:" sequence, you'll see that .mode_set callback is just
> > called once at boot and never again. And it's atomic(_pre)_enable/atomic(_post)_disable
> > callbacks that actually are called in ballanced way to enable/disable the
> > controller repeatedly ever after.
> > 
> > Function dw_mipi_dsi_bridge_post_atomic_disable is the inverse of
> > dw_mipi_dsi_mode_set, it undoes everything that dw_mipi_dsi_mode_set does.
> > 
> > You need to find root cause for your issue on STM32MP15xx instead of reverting
> > fixes for resource use bugs in this driver.
> 
> Actually, reverting commit 05aa61334592 ("drm: bridge: dw-mipi-dsi: Fix
> enable/disable of DSI controller") makes the STM32MP15xx work again like it
> used to since Linux 5.10 or so, so that commit breaks existing working use
> case.

It may simply be revealing bug elsewhere in the STM display stack.

> It seems it is sufficient to revert only this part of the commit to make the
> STM32MP15xx work as it used to, do you have any idea why ?

No, I don't have any STM based board. This revert reintroduces the bug that
causes this driver resource use failures after a simple blanking/unblnaking
cycle done via sysfs when using Linux VT.

It's quite likely reproducible on your board, too. It's pretty clear from the code
why that happens and it will happen regardless of what panel you're using.

You can't expect to call pm_runtime_get once and pm_runtime_put 5 times and have
this driver work at all. The same thing for clk_enable_*/disable_* and so on.

You'll need to fix the issue you're seeing differently without the revert.

kind regards,
	o.
