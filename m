Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12F4D117D6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 10:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6CE10E06D;
	Mon, 12 Jan 2026 09:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="S8HteJDN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4271310E06D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 09:28:29 +0000 (UTC)
Received: from francesco-nb
 (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
 by mail11.truemail.it (Postfix) with ESMTPA id 325C31FB2D;
 Mon, 12 Jan 2026 10:28:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1768210107;
 bh=IUGM7tUYpJzm3kIg7W7yUdT2FccbaCQQyhc9oICILzk=; h=From:To:Subject;
 b=S8HteJDNdUpKPGR2payHmpuG99yQXEUxklnIefkRqVoYk8CvZpkSKTc9slVFksE8q
 8lJv0Pd+wNqtUxsHK+Vp7RLuWxAC6L28EK+g3i5KC6cQDi693xMpO4I2CoavcLI1J7
 SGRRi8Bh4o1kEdDNQhtxd980j6NhGyJGSOJORAR0jLLnlQclDvzIBmmEOfkjurGOwG
 EhIAtjuWYSrEqLYXSBHmIIYykyYTn5g4U+nYkLvB/WQhrTbq4qZwTrKvROJheOa3kF
 OpLBh4OgoH7sGCxbE+JwttpBdiXn7n8I1umdKrTYQIpS4wxvX2ztt4Wm4aMYmdkgyD
 VtzmsjiriAoRg==
Date: Mon, 12 Jan 2026 10:27:38 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Vitor Soares <ivitro@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Vitor Soares <vitor.soares@toradex.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Jayesh Choudhary <j-choudhary@ti.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3] drm/bridge: cdns-dsi: Replace deprecated
 UNIVERSAL_DEV_PM_OPS()
Message-ID: <20260112092738.GA120199@francesco-nb>
References: <20250512083215.436149-1-ivitro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512083215.436149-1-ivitro@gmail.com>
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

Hello Maarten, Maxime, Thomas, Simona, David,

On Mon, May 12, 2025 at 09:32:15AM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> The deprecated UNIVERSAL_DEV_PM_OPS() macro uses the provided callbacks
> for both runtime PM and system sleep. This causes the DSI clocks to be
> disabled twice: once during runtime suspend and again during system
> suspend, resulting in a WARN message from the clock framework when
> attempting to disable already-disabled clocks.
> 
> [   84.384540] clk:231:5 already disabled
> [   84.388314] WARNING: CPU: 2 PID: 531 at /drivers/clk/clk.c:1181 clk_core_disable+0xa4/0xac
> ...
> [   84.579183] Call trace:
> [   84.581624]  clk_core_disable+0xa4/0xac
> [   84.585457]  clk_disable+0x30/0x4c
> [   84.588857]  cdns_dsi_suspend+0x20/0x58 [cdns_dsi]
> [   84.593651]  pm_generic_suspend+0x2c/0x44
> [   84.597661]  ti_sci_pd_suspend+0xbc/0x15c
> [   84.601670]  dpm_run_callback+0x8c/0x14c
> [   84.605588]  __device_suspend+0x1a0/0x56c
> [   84.609594]  dpm_suspend+0x17c/0x21c
> [   84.613165]  dpm_suspend_start+0xa0/0xa8
> [   84.617083]  suspend_devices_and_enter+0x12c/0x634
> [   84.621872]  pm_suspend+0x1fc/0x368
> 
> To address this issue, replace UNIVERSAL_DEV_PM_OPS() with
> SET_RUNTIME_PM_OPS(), enabling suspend/resume handling through the
> _enable()/_disable() hooks managed by the DRM framework for both
> runtime and system-wide PM.
> 
> Cc: <stable@vger.kernel.org> # 6.1.x
> Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>

I am a little bit stuck on what is the best way to have this patch
moving forward.

Who can help on this?
Can any of you guide me a little bit?

Francesco


