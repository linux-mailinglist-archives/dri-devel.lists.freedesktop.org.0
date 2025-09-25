Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98157B9DF03
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 09:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3146F10E87C;
	Thu, 25 Sep 2025 07:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="TZQ8vvPj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284C510E87E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:57:14 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250925075712euoutp02fc4a33fe28d7ec35f10cb63e8ee9319c~od3zLjjuK0124601246euoutp02P
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:57:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250925075712euoutp02fc4a33fe28d7ec35f10cb63e8ee9319c~od3zLjjuK0124601246euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1758787032;
 bh=+ijBeTVh2qMoqGY4XXlzT1UoXFC5cgdqYwVNgvrBe2U=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=TZQ8vvPjFj5PkMyDHybH6PwN7dyr3NhtdVbEpqMffQ8EpGjF/ePqtm3CIVT7exurA
 0Ktnnx4yMfDievDvYDVmxXqdf99VFOwreQhODpr+4ii57R5fBmKt8xsmT1xIEcYQaB
 3C+f5VFdyryFGWVl5/LRz+VORHGL9j30aN36Ml4Q=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3~od3yzCY6p2636426364eucas1p2F;
 Thu, 25 Sep 2025 07:57:11 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250925075710eusmtip21342a4d5fdce7eebd984c1532f6130c3~od3x4W-jr1189111891eusmtip2X;
 Thu, 25 Sep 2025 07:57:10 +0000 (GMT)
Message-ID: <727aa0c8-2981-4662-adf3-69cac2da956d@samsung.com>
Date: Thu, 25 Sep 2025 09:57:10 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz
 Julienne <nsaenz@kernel.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, Maxime
 Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>, Iago Toral
 Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>, Dave
 Stevenson <dave.stevenson@raspberrypi.com>, Philipp Zabel
 <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250731-v3d-power-management-v2-2-032d56b01964@igalia.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3
X-EPHeader: CA
X-CMS-RootMailID: 20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
 <20250731-v3d-power-management-v2-2-032d56b01964@igalia.com>
 <CGME20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3@eucas1p2.samsung.com>
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

On 31.07.2025 23:06, Maíra Canal wrote:
> Currently, when we prepare or unprepare RPi's clocks, we don't actually
> enable/disable the firmware clock. This means that
> `clk_disable_unprepare()` doesn't actually change the clock state at
> all, nor does it lowers the clock rate.
>
> >From the Mailbox Property Interface documentation [1], we can see that
> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
> prepare and an unprepare hook for RPi's firmware clock.
>
> As now the clocks are actually turned off, some of them are now marked
> CLK_IS_CRITICAL, as those are required to be on during the whole system
> operation.
>
> Link: https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface [1]
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>
> ---
>
> About the pixel clock: currently, if we actually disable the pixel
> clock during a hotplug, the system will crash. This happens in the
> RPi 4.
>
> The crash happens after we disabled the CRTC (thus, the pixel clock),
> but before the end of atomic commit tail. As vc4's pixel valve doesn't
> directly hold a reference to its clock – we use the HDMI encoder to
> manage the pixel clock – I believe we might be disabling the clock
> before we should.
>
> After this investigation, I decided to keep things as they current are:
> the pixel clock is never disabled, as fixing it would go out of
> the scope of this series.
> ---
>   drivers/clk/bcm/clk-raspberrypi.c | 56 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 55 insertions(+), 1 deletion(-)

This patch landed recently in linux-next as commit 919d6924ae9b ("clk: 
bcm: rpi: Turn firmware clock on/off when preparing/unpreparing"). In my 
tests I found that it breaks booting of RaspberryPi3B+ board in ARM 
32bit mode. Surprisingly the same board in ARM 64bit mode correctly 
boots a kernel compiled from the same source. The RPi3B+ board freezes 
after loading the DRM modules (kernel compiled from arm/multi_v7_defconfig):

---->8---

[    7.317423] cfg80211: Loading compiled-in X.509 certificates for 
regulatory database
[    7.379464] Console: switching to colour dummy device 80x30
[    7.407475] vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [vc4])
[    7.434647] input: vc4-hdmi HDMI Jack as 
/devices/platform/soc/3f902000.hdmi/sound/card0/input0
[    7.448937] vc4-drm soc:gpu: bound 3f902000.hdmi (ops vc4_hdmi_ops [vc4])
[    7.455677] vc4-drm soc:gpu: bound 3f806000.vec (ops vc4_vec_ops [vc4])
[    7.462371] vc4-drm soc:gpu: bound 3f004000.txp (ops vc4_txp_ops [vc4])
[    7.468962] vc4-drm soc:gpu: bound 3f206000.pixelvalve (ops 
vc4_crtc_ops [vc4])
[    7.476424] vc4-drm soc:gpu: bound 3f207000.pixelvalve (ops 
vc4_crtc_ops [vc4])
[    7.483831] vc4-drm soc:gpu: bound 3f807000.pixelvalve (ops 
vc4_crtc_ops [vc4])

(system frozen at this point)


> ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

