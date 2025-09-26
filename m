Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82375BA2C20
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 09:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EAC10E9FD;
	Fri, 26 Sep 2025 07:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="SXqxsBnu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A8C10EA27
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 07:27:47 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250926072746euoutp01aef7bbda925c02cb0e08d44f676c0e6a~oxHYch79a1204812048euoutp01h
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 07:27:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250926072746euoutp01aef7bbda925c02cb0e08d44f676c0e6a~oxHYch79a1204812048euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1758871666;
 bh=vfTqJAeUpyWDWUY0mZYgZGj49ET2JHgaUA22xnXpmkY=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=SXqxsBnupU76fIpOgWpc3cxxUgtojx8A4U9ZVmc3fjzLt8Sai/y7EnEfFFn8i25Fc
 zpM07Ptxl+rmYuluBBD0NxZSbiKLTU0oFTxEj74zJPuHnq/8s/p0OZmMxAVi7MNVtT
 HUD0rXWmiHD+q5rhEnZr7Pcmr1EVqMIgBFaTMBsI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250926072745eucas1p139b192b8a0342c448f1917a867b91b23~oxHXwfdhJ1038710387eucas1p1w;
 Fri, 26 Sep 2025 07:27:45 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250926072743eusmtip144b115372f153f8c07ba60b620d2d799~oxHWbRlP82061920619eusmtip1S;
 Fri, 26 Sep 2025 07:27:43 +0000 (GMT)
Message-ID: <1e5d1625-1326-4565-8407-71a58a91d230@samsung.com>
Date: Fri, 26 Sep 2025 09:27:42 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
To: Stefan Wahren <wahrenst@gmx.net>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Maxime Ripard
 <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga
 <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <2b1537c1-93e4-4c6c-8554-a2d877759201@gmx.net>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250926072745eucas1p139b192b8a0342c448f1917a867b91b23
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3
X-EPHeader: CA
X-CMS-RootMailID: 20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
 <20250731-v3d-power-management-v2-2-032d56b01964@igalia.com>
 <CGME20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3@eucas1p2.samsung.com>
 <727aa0c8-2981-4662-adf3-69cac2da956d@samsung.com>
 <2b1537c1-93e4-4c6c-8554-a2d877759201@gmx.net>
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

On 25.09.2025 18:48, Stefan Wahren wrote:
> Am 25.09.25 um 09:57 schrieb Marek Szyprowski:
>> On 31.07.2025 23:06, Maíra Canal wrote:
>>> Currently, when we prepare or unprepare RPi's clocks, we don't actually
>>> enable/disable the firmware clock. This means that
>>> `clk_disable_unprepare()` doesn't actually change the clock state at
>>> all, nor does it lowers the clock rate.
>>>
>>> >From the Mailbox Property Interface documentation [1], we can see that
>>> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
>>> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
>>> prepare and an unprepare hook for RPi's firmware clock.
>>>
>>> As now the clocks are actually turned off, some of them are now marked
>>> CLK_IS_CRITICAL, as those are required to be on during the whole system
>>> operation.
>>>
>>> Link:https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface 
>>> [1]
>>> Signed-off-by: Maíra Canal<mcanal@igalia.com>
>>>
>>> ---
>>>
>>> About the pixel clock: currently, if we actually disable the pixel
>>> clock during a hotplug, the system will crash. This happens in the
>>> RPi 4.
>>>
>>> The crash happens after we disabled the CRTC (thus, the pixel clock),
>>> but before the end of atomic commit tail. As vc4's pixel valve doesn't
>>> directly hold a reference to its clock – we use the HDMI encoder to
>>> manage the pixel clock – I believe we might be disabling the clock
>>> before we should.
>>>
>>> After this investigation, I decided to keep things as they current are:
>>> the pixel clock is never disabled, as fixing it would go out of
>>> the scope of this series.
>>> ---
>>>    drivers/clk/bcm/clk-raspberrypi.c | 56 
>>> ++++++++++++++++++++++++++++++++++++++-
>>>    1 file changed, 55 insertions(+), 1 deletion(-)
>> This patch landed recently in linux-next as commit 919d6924ae9b ("clk:
>> bcm: rpi: Turn firmware clock on/off when preparing/unpreparing"). In my
>> tests I found that it breaks booting of RaspberryPi3B+ board in ARM
>> 32bit mode. Surprisingly the same board in ARM 64bit mode correctly
>> boots a kernel compiled from the same source. The RPi3B+ board freezes
>> after loading the DRM modules (kernel compiled from 
>> arm/multi_v7_defconfig):
> thanks for spotting and bisecting this. Sorry, I only reviewed the 
> changes and didn't had the time to test any affected board.
>
> I was able to reproduce this issue and the following workaround avoid 
> the hang in my case:
>
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c 
> b/drivers/clk/bcm/clk-raspberrypi.c
> index 1a9162f0ae31..94fd4f6e2837 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -137,6 +137,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>         [RPI_FIRMWARE_V3D_CLK_ID] = {
>                 .export = true,
>                 .maximize = true,
> +               .flags = CLK_IS_CRITICAL,
>         },
>         [RPI_FIRMWARE_PIXEL_CLK_ID] = {
>                 .export = true,
>
Right, this fixes (frankly speaking 'hides') the issue. Feel free to add:

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


> The proper fix should be in the clock consumer drivers. I found that 
> vc4_v3d doesn't ensure that the clock is enabled before accessing the 
> registers. Unfortunately the following change doesn't fix the issue 
> for me :-(
>
> diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c 
> b/drivers/gpu/drm/vc4/vc4_v3d.c
> index bb09df5000bd..5e43523732b4 100644
> --- a/drivers/gpu/drm/vc4/vc4_v3d.c
> +++ b/drivers/gpu/drm/vc4/vc4_v3d.c
> @@ -441,7 +441,7 @@ static int vc4_v3d_bind(struct device *dev, struct 
> device *master, void *data)
>         vc4->v3d = v3d;
>         v3d->vc4 = vc4;
>
> -       v3d->clk = devm_clk_get_optional(dev, NULL);
> +       v3d->clk = devm_clk_get_optional_enabled(dev, NULL);
>         if (IS_ERR(v3d->clk))
>                 return dev_err_probe(dev, PTR_ERR(v3d->clk), "Failed 
> to get V3D clock\n");

Well, this can be sorted out in the drivers as a next step.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

