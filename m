Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31946788FE4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 22:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B9A10E6DC;
	Fri, 25 Aug 2023 20:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9A510E6DC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 20:36:15 +0000 (UTC)
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 87956660728A;
 Fri, 25 Aug 2023 21:36:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692995773;
 bh=QjsO4cgMmum5UtA5z9YELYtMHr8uDnTg/88rwpYh80s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aK11sHXEA04PzQa+lTQCgvfbFwVZhN5HW5UjDV3lgwlaghtqK+phCi/j7lbEcADf4
 O+O1RboM0p8M3pIFp2QUu5mYPMv9XcYrv5PZa5aS21o3rw2eTwzax7VEAVsSJZBZF7
 YGgtPYo8uUSYlh8zQiF/8Dk8Q8thisRDbhaYwqzqc9N5Rdl9Gy+dWCov7iFHiMTxmw
 BiTXoU9ErDL3V44VATOVoU7czLKQAz09fu0I11dqoWB20tekNJsoZK8bVm/mzC6tMG
 hqy6CsLpyiMqkV83WCdmZnzVI5qwt0hvVx8ZeKTC85TONWDZVuBYjqs7xhDwFLLBlw
 gUtZvdn92OliA==
Date: Fri, 25 Aug 2023 16:36:07 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH v7 09/11] drm/mediatek: dp: Add support for embedded
 DisplayPort aux-bus
Message-ID: <00f65d49-497c-4ade-a2f3-7a5b7ad803b6@notapiano>
References: <20230725073234.55892-10-angelogioacchino.delregno@collabora.com>
 <20230825120109.3132209-1-mwalle@kernel.org>
 <5b438dba-9b85-4448-bc89-08a11ddb822a@notapiano>
 <fc6c054941420ac2d016496ccbeecad4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc6c054941420ac2d016496ccbeecad4@kernel.org>
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
Cc: chunkuang.hu@kernel.org, amergnat@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, wenst@chromium.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 25, 2023 at 05:42:59PM +0200, Michael Walle wrote:
> Hi Nicolas,
> 
> > > > For the eDP case we can support using aux-bus on MediaTek DP: this
> > > > gives us the possibility to declare our panel as generic "panel-edp"
> > > > which will automatically configure the timings and available modes
> > > > via the EDID that we read from it.
> > > >
> > > > To do this, move the panel parsing at the end of the probe function
> > > > so that the hardware is initialized beforehand and also initialize
> > > > the DPTX AUX block and power both on as, when we populate the
> > > > aux-bus, the panel driver will trigger an EDID read to perform
> > > > panel detection.
> > > >
> > > > Last but not least, since now the AUX transfers can happen in the
> > > > separated aux-bus, it was necessary to add an exclusion for the
> > > > cable_plugged_in check in `mtk_dp_aux_transfer()` and the easiest
> > > > way to do this is to simply ignore checking that when the bridge
> > > > type is eDP.
> > > 
> > > This patch breaks my board based on the MT8195 which only has one
> > > DisplayPort output port. I suspect it might also break the
> > > mt8195-cherry
> > > board.
> > 
> > Do you mean that your board does not have an internal display, only the
> > one
> > output port? If so, why are you enabling the nodes for the internal
> > display path
> > in your board specific DT?
> 
> Well, that depends. The board actually has an eDP socket, but because we
> are an OEM, there might be no display connected to it. (And I haven't
> tried it yet). It should probably go into an own device tree or overlay
> if it is used. I agree. But it looked like it was auto-detectable (it
> even has a HDP pin on the eDP socket, not sure about its use case..)

Right, given it has an HPD pin it should be possible to hotplug. Although
hotplugging a panel to eDP doesn't seem common, so Angelo even removed HPD
irq support for eDP in patch 11 of this series.

The unit I have is a mt8195-cherry-tomato, a Chromebook, so I couldn't really
test hotplugging the internal display.

> 
> But the real reason I've enabled it was because I'll get an kernel
> oops otherwise. I thought it might be some quirk that you'll need both,
> because eDP will register even if theres no display - as you've
> mentioned below.
> 
> Here's the splat:
> [    3.237064] mediatek-drm mediatek-drm.10.auto: bound 1c110000.vpp-merge
> (ops mtk_disp_merge_component_ops)
> [    3.238274] mediatek-drm mediatek-drm.8.auto: Not creating crtc 0 because
> component 8 is disabled or missing
> [    3.239504] mediatek-drm mediatek-drm.8.auto: Not creating crtc 0 because
> component 9 is disabled or missing
> [    3.240741] Unable to handle kernel NULL pointer dereference at virtual
> address 00000000000004a0
> [    3.241841] Mem abort info:
> [    3.242192]   ESR = 0x0000000096000004
> [    3.242662]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    3.243328]   SET = 0, FnV = 0
> [    3.243710]   EA = 0, S1PTW = 0
> [    3.244104]   FSC = 0x04: level 0 translation fault
> [    3.244717] Data abort info:
> [    3.245078]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    3.245765]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    3.246398]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    3.247063] [00000000000004a0] user address but active_mm is swapper
> [    3.247860] Internal error: Oops: 0000000096000004 [#1] SMP
> [    3.248559] Modules linked in:
> [    3.248945] CPU: 4 PID: 11 Comm: kworker/u16:0 Not tainted
> 6.5.0-rc7-next-20230821+ #2225
> [    3.249970] Hardware name: Kontron 3.5"-SBC-i1200 (DT)
> [    3.250614] Workqueue: events_unbound deferred_probe_work_func
> [    3.251347] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS
> BTYPE=--)
> [    3.252220] pc : mtk_drm_crtc_dma_dev_get+0x8/0x18
> [    3.252824] lr : mtk_drm_bind+0x458/0x558
> [    3.253326] sp : ffff800082b23a20
> [    3.253741] x29: ffff800082b23a20 x28: ffff000002c78880 x27:
> ffff8000816466d0
> [    3.254635] x26: ffff000002c6f010 x25: 0000000000000003 x24:
> 0000000000000000
> [    3.255529] x23: ffff000002c78880 x22: 0000000000000002 x21:
> 0000000000000000
> [    3.256423] x20: ffff000006516800 x19: ffff000002c78880 x18:
> ffffffffffffffff
> [    3.257317] x17: 6f63206573756163 x16: 6562203020637472 x15:
> 6320676e69746165
> [    3.258211] x14: 726320746f4e203a x13: 676e697373696d20 x12:
> 726f2064656c6261
> [    3.259106] x11: 7369642073692039 x10: ffff80008275c0c0 x9 :
> ffff80008091ebf8
> [    3.260000] x8 : 00000000ffffefff x7 : ffff80008275c0c0 x6 :
> 80000000fffff000
> [    3.260895] x5 : 000000000000bff4 x4 : 0000000000000000 x3 :
> ffff000006516ae0
> [    3.261789] x2 : ffff000006516ae0 x1 : 0000000000000000 x0 :
> 0000000000000000
> [    3.262684] Call trace:
> [    3.262991]  mtk_drm_crtc_dma_dev_get+0x8/0x18
> [    3.263549]  try_to_bring_up_aggregate_device+0x16c/0x1e0
> [    3.264227]  __component_add+0xac/0x180
> [    3.264708]  component_add+0x1c/0x30
> [    3.265158]  mtk_disp_rdma_probe+0x17c/0x270
> [    3.265695]  platform_probe+0x70/0xd0
> [    3.266155]  really_probe+0x150/0x2c0
> [    3.266615]  __driver_probe_device+0x80/0x140
> [    3.267162]  driver_probe_device+0x44/0x170
> [    3.267687]  __device_attach_driver+0xc0/0x148
> [    3.268245]  bus_for_each_drv+0x88/0xf0
> [    3.268727]  __device_attach+0xa4/0x198
> [    3.269208]  device_initial_probe+0x1c/0x30
> [    3.269732]  bus_probe_device+0xb4/0xc0
> [    3.270214]  deferred_probe_work_func+0x90/0xd0
> [    3.270783]  process_one_work+0x144/0x3a0
> [    3.271289]  worker_thread+0x2ac/0x4b8
> [    3.271761]  kthread+0xec/0xf8
> [    3.272145]  ret_from_fork+0x10/0x20
> [    3.272597] Code: 814f7858 ffff8000 aa1e03e9 d503201f (f9425000)
> [    3.273361] ---[ end trace 0000000000000000 ]---

I tried reproducing this on mt8192-asurada-spherion and mt8195-cherry-tomato but
wasn't able to. However, I did see another issue

[    3.183314] mediatek-drm mediatek-drm.9.auto: Not creating crtc 0 because component 14 is disabled or missing
[    3.199404] Bogus possible_crtcs: [ENCODER:31:TMDS-31] possible_crtcs=0x2 (full crtc mask=0x1)
[    3.208081] WARNING: CPU: 6 PID: 68 at drivers/gpu/drm/drm_mode_config.c:626 drm_mode_config_validate+0x1c8/0x548
[    3.224789] Modules linked in:
[    3.227838] CPU: 6 PID: 68 Comm: kworker/u16:1 Not tainted 6.5.0-rc3-next-20230728+ #100
[    3.235918] Hardware name: Google Spherion (rev0 - 3) (DT)
[    3.241391] Workqueue: events_unbound deferred_probe_work_func
[    3.247216] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    3.254167] pc : drm_mode_config_validate+0x1c8/0x548
[    3.259209] lr : drm_mode_config_validate+0x1c8/0x548
[    3.264250] sp : ffff8000804e3970
[    3.267552] x29: ffff8000804e3980 x28: ffff4841827c1880 x27: 0000000000000001
[    3.274677] x26: 0000000000000001 x25: ffff4841825f5ab0 x24: ffff4841825f5ab0
[    3.281801] x23: ffff484182469880 x22: ffffa80dbfbdde28 x21: ffffa80dbfbddba8
[    3.288925] x20: ffff4841825f5800 x19: ffff4841825f5aa8 x18: 0000000000000030
[    3.296050] x17: 6628203278303d73 x16: 637472635f656c62 x15: 6973736f70205d31
[    3.303174] x14: 332d53444d543a31 x13: 293178303d6b7361 x12: 6d2063747263206c
[    3.310298] x11: 6c75662820327830 x10: 3d73637472635f65 x9 : ffffa80dbdd3805c
[    3.317422] x8 : 455b203a73637472 x7 : 205d343034393931 x6 : ffffa80dbe6365d8
[    3.324546] x5 : ffffa80dc0fcc48f x4 : ffffa80dc0049b40 x3 : 00000000ffffffff
[    3.331671] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff4841809d5e80
[    3.338796] Call trace:
[    3.341232]  drm_mode_config_validate+0x1c8/0x548
[    3.345924]  drm_dev_register+0x198/0x248
[    3.345931]  mtk_drm_bind+0x2cc/0x590
[    3.345936]  try_to_bring_up_aggregate_device+0x1f8/0x308
[    3.345940]  __component_add+0xac/0x1a0
[    3.345942]  component_add+0x1c/0x30
[    3.345944]  mtk_dpi_probe+0x1c0/0x300
[    3.358100]  platform_probe+0x70/0xe8
[    3.358106]  really_probe+0x18c/0x3d8
[    3.358108]  __driver_probe_device+0x84/0x180
[    3.358109]  driver_probe_device+0x44/0x120
[    3.358111]  __device_attach_driver+0xc4/0x168
[    3.358113]  bus_for_each_drv+0x8c/0xf0
[    3.367146]  __device_attach+0xb0/0x1e8
[    3.367148]  device_initial_probe+0x1c/0x30
[    3.367150]  bus_probe_device+0xb4/0xc0
[    3.367153]  deferred_probe_work_func+0xa4/0x100
[    3.367155]  process_one_work+0x1ec/0x480
[    3.374543]  worker_thread+0x74/0x448
[    3.374545]  kthread+0x120/0x130
[    3.374548]  ret_from_fork+0x10/0x20

The mtk-dpi driver populates its encoder's possible_crtcs from the result of
mtk_drm_find_possible_crtc_by_comp(), and this function assumes the CRTC for the
main path will always have ID 0, and the external path ID 1, but when the
main path components are disabled, the external path CRTC becomes the one with
ID 0.

So we'd need to make that function return the crtc id dynamically based on
whether the components for each path are enabled or not.

With that function hacked to force the right crtc ID, I was able to have a
working external DP, with the eDP pipeline disabled on both mt8192 and mt8195.

Thanks,
Nícolas
