Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E93274FD35E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 11:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A35510E54A;
	Tue, 12 Apr 2022 09:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1C810E4BB
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 09:41:35 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1neD1N-0001dC-4R; Tue, 12 Apr 2022 11:41:13 +0200
Message-ID: <439bd1aa1feaa0c43adb7b4c2dda57b5f2c5487c.camel@pengutronix.de>
Subject: Re: [PATCH v0 00/10] i.MX8MP HDMI support
From: Lucas Stach <l.stach@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Date: Tue, 12 Apr 2022 11:41:11 +0200
In-Reply-To: <3484598.R56niFO833@steina-w>
References: <20220406160123.1272911-1-l.stach@pengutronix.de>
 <3484598.R56niFO833@steina-w>
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
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Vinod Koul <vkoul@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, patchwork-lst@pengutronix.de,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexander,

Am Dienstag, dem 12.04.2022 um 11:18 +0200 schrieb Alexander Stein:
> Hello Lucas,
> 
> Am Mittwoch, 6. April 2022, 18:01:13 CEST schrieb Lucas Stach:
> > Hi all,
> > 
> > this adds support for the HDMI output pipeline on the i.MX8MP.
> > It currently depends on the i.MX8MP HDMI power domain series [1]
> > and support for the new LCDIF [2] in the i.MX8MP. I guess the
> > implementation presented here also still has some warts that
> > require fixing and the individual patches most likely need to go
> > through different maintainer trees, so I don't expect this series
> > to be applied right away.
> > 
> > However this complete series should allow people to test it more
> > easily and provide feedback on the implementation with the full
> > picture available.
> > 
> > Compared to downstream this implementation actually allows to
> > power down the separate HDMI PHY power domain when the display
> > is inactive or no HDMI cable is connected.
> 
> Thanks for these patches.
> I tried using them on my imx8mp based board (TQMa8MPxL + MBa8MPxL) but failed 
> to get the display showing anything. I noticed several things though:
> 
> * For some reason the HDMI PHY PLL does not lock. I get the error
> > fsl-samsung-hdmi-phy 32fdff00.phy: PLL failed to lock
> Increasing timeout does not change anything.
> 
> * The HDMI bridge wants to use bus format 0x200f which is not supported by 
> lcdif.
> > lcdif 32fc6000.display-controller: Unknown media bus format 0x200f
> I wonder which part in the DRM chain choses to use this.

Do have a 4k HDMI display connected that wants to do YUV input? That's
something I have to admit I didn't test yet and would be likely to
cause this bus format selection.

> But even hard limiting to 0x100a the screen stayed in suspend
> 
> * If the drivers are built as modules I get a hard lockup during boot. Using 
> built-in drivers or 'clk_ignore_unused' workarounds this.
> 
> * DDC does actually work. The display is detected and EDID can be read.
> 
> * Sometimes I get the following error:
> ------------[ cut here ]------------
> [CRTC:33:crtc-0] vblank wait timed out
> WARNING: CPU: 2 PID: 151 at drivers/gpu/drm/drm_atomic_helper.c:1529 
> drm_atomic_helper_wait_for_vblanks.part.0+0x2ac/0x2fc
> Modules linked in: caamhash_desc caamalg_desc crypto_engine rng_core mcp320x 
> dw_hdmi_cec authenc libdes dw100 videobuf2_dma_contig lcdif crct10dif_ce 
> phy_fsl_samsung_hdmi v4l2_mem2mem imx_sdma flexcan imx8mm_thermal can_dev caam 
> error pwm_fan fuse ipv6
> CPU: 2 PID: 151 Comm: kworker/u8:7 Not tainted 5.18.0-rc2-next-20220412+ #165 
> d226098cac46ded24901c7090f909ca8f5098eb0
> Hardware name: TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8MPxL (DT)
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : drm_atomic_helper_wait_for_vblanks.part.0+0x2ac/0x2fc
> lr : drm_atomic_helper_wait_for_vblanks.part.0+0x2ac/0x2fc
> sp : ffff80000a133430
> x29: ffff80000a133430 x28: 0000000000000000 x27: 0000000000000000
> x26: 0000000000000000 x25: 0000000000000001 x24: ffff80000935f030
> x23: ffff00000433e000 x22: ffff0000029e7000 x21: 0000000000000001
> x20: ffff000002e7fb48 x19: 0000000000000000 x18: 0000000000000001
> x17: 4d554e5145530065 x16: 6c75646f6d3d4d45 x15: 5453595342555300
> x14: 0000000000000000 x13: 0a74756f2064656d x12: 6974207469617720
> x11: 0000000000000000 x10: 000000000000003a x9 : ffff80000a133430
> x8 : 00000000ffffffff x7 : 6974207469617720 x6 : 6b6e616c6276205d
> x5 : ffff00007fb91b00 x4 : 0000000000000000 x3 : 0000000000000027
> x2 : 0000000000000023 x1 : 0000000000000000 x0 : 0000000000000000
> Call trace:
>  drm_atomic_helper_wait_for_vblanks.part.0+0x2ac/0x2fc
>  drm_atomic_helper_commit_tail_rpm+0x80/0xa0
>  commit_tail+0xcc/0x1f0
>  drm_atomic_helper_commit+0x13c/0x370
>  drm_atomic_commit+0xa4/0xe0
>  drm_client_modeset_commit_atomic+0x1fc/0x250
>  drm_client_modeset_commit_locked+0x58/0xa0
>  drm_client_modeset_commit+0x2c/0x50
>  __drm_fb_helper_restore_fbdev_mode_unlocked+0xec/0x140
>  drm_fb_helper_set_par+0x38/0x6c
>  fbcon_init+0x264/0x5e4
>  visual_init+0xc8/0x15c
>  do_bind_con_driver.isra.0+0x20c/0x470
>  do_take_over_console+0x44/0x60
>  do_fbcon_takeover+0x80/0x140
>  fbcon_fb_registered+0x1c4/0x260
>  do_register_framebuffer+0x1e0/0x2d0
>  register_framebuffer+0x2c/0x50
>  __drm_fb_helper_initial_config_and_unlock+0x9c/0x130
>  drm_fbdev_client_hotplug+0x1a8/0x20c
>  drm_fbdev_generic_setup+0xc0/0x1d0
>  lcdif_probe+0x7c/0xa0 [lcdif e756925430e957a7bc9e6376ad5964e4b1cb143e]
>  platform_probe+0x64/0x100
>  call_driver_probe+0x28/0x130
>  really_probe+0x178/0x310
>  __driver_probe_device+0xfc/0x144
>  driver_probe_device+0x38/0x12c
>  __device_attach_driver+0xd4/0x180
>  bus_for_each_drv+0x74/0xc4
>  __device_attach+0xd8/0x1e0
>  device_initial_probe+0x10/0x20
>  bus_probe_device+0x90/0xa0
>  deferred_probe_work_func+0x9c/0xf0
>  process_one_work+0x1d0/0x330
>  worker_thread+0x68/0x390
>  kthread+0xec/0xfc
>  ret_from_fork+0x10/0x20
> ---[ end trace 0000000000000000 ]---
> 
> But given that the PLL did not lock I assume this is not too surprising.
> 
Yes, that's just the fallout of the LCDIF not seeing any pixel clock.

You could aid me in diagnosing this by posting the output of
/sys/kernel/debug/clk/clk_summary and
/sys/kernel/debug/pm_genpd/pm_genpd_summary when the system is in this
failed state.

Regards,
Lucas


