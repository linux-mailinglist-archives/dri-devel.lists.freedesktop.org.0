Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5067223E7DE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 09:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1B66E06D;
	Fri,  7 Aug 2020 07:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3C36E06D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 07:24:23 +0000 (UTC)
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BE49C20866;
 Fri,  7 Aug 2020 07:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596785062;
 bh=hAUDwFphZaG/bTTyxFHaDilU4WlCS5Mmno4jOjdUkyQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hZDFE6sKFuCETU4mGtiA4J3ZaUpZlrvcvYTUPZ3Mwc0ciwXy8XLab7W1x2Y4RBh2A
 T3xU2vKrf9BnhbgpfPv5ZZ9jS44jlCM6yzqLH0ywlU/XWfHyCx8M8zFLbM+b23eS0n
 zApawN6cZdqotcydbwO8uy7wkkytfR5ijGxnvfkU=
Date: Fri, 7 Aug 2020 09:24:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: DRM/KMS experimental drivers for HiKey 970
Message-ID: <20200807092418.57843051@coco.lan>
In-Reply-To: <CALAqxLV_8phvdvezZV39sumS=D42+cZdfxCrCz6ht6eia8totQ@mail.gmail.com>
References: <20200805105137.2b272efc@coco.lan>
 <CALAqxLV_8phvdvezZV39sumS=D42+cZdfxCrCz6ht6eia8totQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, mani@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Thu, 6 Aug 2020 12:24:40 -0700
John Stultz <john.stultz@linaro.org> escreveu:

> On Wed, Aug 5, 2020 at 1:51 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> > I've been working to get upstream support for the DRM driver on HiKey 970.
> >
> > While the patches are not ready yet for upstream merge, I'm placing
> > what I've sone so far on this repository:
> >
> >         https://github.com/mchehab/linux/tree/hikey970/to_upstream-2.0-v1.1
> >
> > The drivers there are a port from the Linaro's HiKey official Kernel:
> >
> >         https://github.com/96boards-hikey/linux
> >
> > The patches there preserve the old history. The porting patches
> > are applied after the original patches imported from that tree.
> >
> > Besides the DRM driver, this repository contains:
> >
> > - a PMIC/regulator driver;
> > - an iommu driver (still requiring some changes at DT properties);
> > - A DMA driver;
> > - a small ugly hack reverting some PM changes at the WiFi driver,
> >   causing a regression on this board for HiKey 970.
> >
> > My current plans are to start upstreaming those needed drivers.
> >
> > The KMS/DRM driver there still need some changes. I guess it is
> > not ready for being upstreamed yet. Also, it depends on the
> > other drivers to work.  
> 
> Hey Mauro,
>   I'm really excited to see this effort being picked up! Thanks for
> taking this on!
> 
> The patch set you have looks like it maybe started with a 4.9 tree
> (I'm guessing the hikey960 4.9 tree which maybe was adapted as a
> starting point for the hikey970?). 

Yes. It came from the official Hikey tree from Linaro.

> Its nice to have the full history
> but given the long lifetime, it may complicate reviewing a bit.

I know. What can be done is to send a diff at patch 00/xx with
the entire history for each driver folded, in order to easy
for reviewers. Still, applying upstream with the full history
sounds valuable, specially if some patch needs to be reverted.

It also helps preserving the original authorship for each change.

> A while back, after 4.9, some folks at HiSilicon reworked the display
> driver so that it could re-use and share logic with the already
> upstream kirin drm driver, in the hopes of upstreaming it. This helped
> avoid the smmu dependency, and some of the odd bits about how it was
> tied to the ion heap driver

Sounds nice! I ended doing something similar to it on my patchset
(but taking a different approach), with regards of supporting
both 960 and 970 by the same driver, by converting all ifdefs
into runtime code.

Did this work cover the Hikey 970 or just 960?

The current driver has some issues - even at the original tree:

1. EDAC doesn't work with the upstream adv7535 driver
   (on 4.9, EDAC sometimes works with a forked version of adv7535,
   with several hacks on it);

2. Sometimes LDI underflows occur - usually when switching resolution;

3. DPMS causes the monitor to not work after suspend;

4. There are problems at the panel switch HDMI code. I ended solving
   it by removing the panel settings from DT.

Does any of the above issues got solved at the version on your tree?

-

With regards to (2), the driver sets several clocks to adjust to the
pixel rate:

	[    6.391078] [drm] Got built-in EDID base block and 0 extensions from "edid/1920x1080.bin" for connector "HDMI-A-1"
	[    6.402931] [drm] Valid mode: 1920x1080@60, clock 148500 (adjusted to 144000)
	[    6.417986] [drm] Valid mode: 1920x1080@60, clock 148500 (adjusted to 144000)
	[    6.418046] [drm] enabling DPE regulator
	[    6.418053] [drm] -.
	[    6.418261] [drm] dss_pri_clk:[300000000]->[300000000].
	[    6.418417] [drm] dss_mmbuf_clk:[238000000]->[237142858].
	[    6.418445] [drm] Requested clock 148500 kHz, setting to 144000 kHz
	[    6.418451] [drm] PLL7 set to (0x4903405, 0x6800000)
	[    6.418615] [drm] dss_pxl0_clk:[144000000]->[144000000].

However, PXL0 clock is always set to 144 MHz, no matter the pixel clock.

At the 4.9 version, there is a commented out code trying to set it
on a higher frequency:

	#if 1
		ret = clk_set_rate(ctx->dss_pxl0_clk, 144000000UL);
	#else
		/*comfirm ldi1 switch ppll7*/
		if (pixel_clock_ori <= 255000000)
			ret = clk_set_rate(ctx->dss_pxl0_clk, DEFAULT_MIDIA_PPLL7_CLOCK_FREQ/7);
		else if (pixel_clock_ori <= 415000000)
			ret = clk_set_rate(ctx->dss_pxl0_clk, DEFAULT_MIDIA_PPLL7_CLOCK_FREQ/5);
		else if (pixel_clock_ori <= 594000000)
			ret = clk_set_rate(ctx->dss_pxl0_clk, DEFAULT_MIDIA_PPLL7_CLOCK_FREQ/3);
		else {
			DRM_ERROR("Clock don't support!!\n");
			return -EINVAL;
		}
	#endif

Which seems to be focusing on supporting 1080p and 4K modes, but I was
unable to make the commented out part of the code to work.

> (looks like you've already pulled that out in your tree). 

Yes, I was able to drop ION by removing the old framebuffer API
part of the driver, using FB emulation. 

> Unfortunately the upstreaming effort fell apart, but
> I've been forward porting along the results of that work along. But I
> haven't had the cycles to clean the code up (it has *lots* of
> checkpatch issues for a start) to submit it.

Yes, I can figure out. The 4.9 patchset also had lots of those.
I guess I fixed most of them on this version.

> You can find my current mainline tracking tree here:
> https://git.linaro.org/people/john.stultz/android-dev.git/log/?h=dev/hikey960-mainline-WIP
> 
> And the drm display bits are here:
> https://git.linaro.org/people/john.stultz/android-dev.git/log/?h=dev/hikey960-mainline-WIP&id=f5e888b02b683a9a6636174c6d2b74f697e87513

Are they covering both Hikey 960 and 970?

If I knew that before, I would have started from your tree. Before
jumping into it, I tried to seek other trees with Hikey 970. The
only one I found was a 4.19 Kernel tree from Mani - which didn't
carry the DRM driver.

So, I had to start from the 4.9 tree, getting rid of lots of
Android and Chrome-OS specific patches. There were around 2K
patches on the top of vanilla 4.9.78. I had to mine them, picking
just the ones needed for DRM to work.

-

Btw, were you able to make USB work on Hikey 970? I noticed that
you recently ported rt1711h and added bindings for Hikey 960.

I did myself a quick port from the ones at 4.9 Kernel but didn't spend 
much time on them[1]. The Hikey 970 also uses the Richtek 1711 driver
but donwstream has a different USB phy driver, and the 4.9 version
do some changes at the DWG3 for it to work. There's also an USB hub
driver, which also seems to be need.

With my port, despite the drivers being probed fine, lsusb doesn't
show anything, even after fixing the SPMI driver for it to properly
control the needed power lines. I didn't spend much time debugging
it.

[1] my goal here is just to find a way to send evdev events to
XWayland. Unfortunately, things like "x2x" won't work on Wayland.

> If you want to pick up these patches, refactor and submit them, I'd of
> course have *zero* complaints :)
> But even if you don't, hopefully this tree might be helpful for
> comparison sake as you shake out issues with the current tree.

Thanks for pointing to it!

On a quick look, I'm not seeing there the other drivers that
seem to be required by Hikey 970 GPU drivers:

	- drivers/dma/hisi_dma_64.c;
	- drivers/clk/hisilicon/clk-kirin970-stub.c;
	  (this one seems to be needed by Mali/Panfrost only);
	- Hikey 6421v600 SPMI PMIC drivers;
	- drivers/iommu/hisi_smmu_lpae.c.

At least the SPMI drivers are specific for Hikey 970, as Hikey960
uses a normal mfd PMIC driver. Yet, maybe the other drivers were
replaced by some alternative ones upstream (although I was not
able to find them on Kernel v5.7 - which is the version that I
used to start this port).

The clk-kirin970-stub also seems to be specific for 970, as it
seems to be implementing something different than the kirin960
one.

> 
> Do keep me in the loop, as I'd love to test and validate whatever
> patches you do end up planning to submit.


Surely. It is great to have some help reviewing those patches.

My current plan is to start submitting the non-DRM drivers
soon. I guess the SPMI drivers are ready for upstream submission.
I'll probably start sending patches from this one.

The DMA also seems to be fine.

The iommu driver still require some adjustments, in order to
use a more standard DT description. 

Thanks,
Mauro
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
