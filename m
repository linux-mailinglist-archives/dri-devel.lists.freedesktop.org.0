Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD7378CBEC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 20:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0894810E052;
	Tue, 29 Aug 2023 18:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B5E10E052
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 18:19:46 +0000 (UTC)
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A1DFF66071FD;
 Tue, 29 Aug 2023 19:19:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693333184;
 bh=iaB4kq0fWVi2Z/hKFk4MBuH2N/Z1dOZdMAJcFz68CWE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EuGQN8K7muGN9Zm6ulrmECtOaLvthsPl63fX7rIiQ5XFh6HPWTYzOe7uBgek+LmT/
 S14xs16rZUto5He7PljZt/Y386N9Lyi9b1uPaJWzzYUIToL8F4sECUS0H3lgFYUeKf
 c2MFIpQCOEjvybOO3839WF41DJ/KqvHLaHd1bgCDBF3P5ZGVFccjQzqKEl3OEl0D6/
 b3XPaCfJL7155XRAgjM5NbfyOHlpY+9tm8Pfb96IUmkc4NmKVvOPo8tkLKC3JZF5dR
 mrSjG6eAL2v/5FjxvI8vx506tF8rm5BVyBE5MRnLj8I+1jnDbMKs5yswlWVVUbCY0G
 VFquPPRlbcu6A==
Date: Tue, 29 Aug 2023 14:19:39 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH v7 09/11] drm/mediatek: dp: Add support for embedded
 DisplayPort aux-bus
Message-ID: <cce6f9c2-e0b6-47e4-ae1c-9a3d8a4e4b02@notapiano>
References: <20230725073234.55892-10-angelogioacchino.delregno@collabora.com>
 <20230825120109.3132209-1-mwalle@kernel.org>
 <5b438dba-9b85-4448-bc89-08a11ddb822a@notapiano>
 <fc6c054941420ac2d016496ccbeecad4@kernel.org>
 <00f65d49-497c-4ade-a2f3-7a5b7ad803b6@notapiano>
 <18bfffdd7ce3bd7693c8362b28651b49@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18bfffdd7ce3bd7693c8362b28651b49@kernel.org>
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

On Tue, Aug 29, 2023 at 03:30:24PM +0200, Michael Walle wrote:
> Hi Nícolas,
> 
> > > But the real reason I've enabled it was because I'll get an kernel
> > > oops otherwise. I thought it might be some quirk that you'll need
> > > both,
> > > because eDP will register even if theres no display - as you've
> > > mentioned below.
> > > 
> > > Here's the splat:
> > > [    3.237064] mediatek-drm mediatek-drm.10.auto: bound
> > > 1c110000.vpp-merge
> > > (ops mtk_disp_merge_component_ops)
> > > [    3.238274] mediatek-drm mediatek-drm.8.auto: Not creating crtc 0
> > > because
> > > component 8 is disabled or missing
> > > [    3.239504] mediatek-drm mediatek-drm.8.auto: Not creating crtc 0
> > > because
> > > component 9 is disabled or missing
> > > [    3.240741] Unable to handle kernel NULL pointer dereference at
> > > virtual
> > > address 00000000000004a0
> > > [    3.241841] Mem abort info:
> > > [    3.242192]   ESR = 0x0000000096000004
> > > [    3.242662]   EC = 0x25: DABT (current EL), IL = 32 bits
> > > [    3.243328]   SET = 0, FnV = 0
> > > [    3.243710]   EA = 0, S1PTW = 0
> > > [    3.244104]   FSC = 0x04: level 0 translation fault
> > > [    3.244717] Data abort info:
> > > [    3.245078]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> > > [    3.245765]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> > > [    3.246398]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> > > [    3.247063] [00000000000004a0] user address but active_mm is
> > > swapper
> > > [    3.247860] Internal error: Oops: 0000000096000004 [#1] SMP
> > > [    3.248559] Modules linked in:
> > > [    3.248945] CPU: 4 PID: 11 Comm: kworker/u16:0 Not tainted
> > > 6.5.0-rc7-next-20230821+ #2225
> > > [    3.249970] Hardware name: Kontron 3.5"-SBC-i1200 (DT)
> > > [    3.250614] Workqueue: events_unbound deferred_probe_work_func
> > > [    3.251347] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS
> > > BTYPE=--)
> > > [    3.252220] pc : mtk_drm_crtc_dma_dev_get+0x8/0x18
> > > [    3.252824] lr : mtk_drm_bind+0x458/0x558
> > > [    3.253326] sp : ffff800082b23a20
> > > [    3.253741] x29: ffff800082b23a20 x28: ffff000002c78880 x27:
> > > ffff8000816466d0
> > > [    3.254635] x26: ffff000002c6f010 x25: 0000000000000003 x24:
> > > 0000000000000000
> > > [    3.255529] x23: ffff000002c78880 x22: 0000000000000002 x21:
> > > 0000000000000000
> > > [    3.256423] x20: ffff000006516800 x19: ffff000002c78880 x18:
> > > ffffffffffffffff
> > > [    3.257317] x17: 6f63206573756163 x16: 6562203020637472 x15:
> > > 6320676e69746165
> > > [    3.258211] x14: 726320746f4e203a x13: 676e697373696d20 x12:
> > > 726f2064656c6261
> > > [    3.259106] x11: 7369642073692039 x10: ffff80008275c0c0 x9 :
> > > ffff80008091ebf8
> > > [    3.260000] x8 : 00000000ffffefff x7 : ffff80008275c0c0 x6 :
> > > 80000000fffff000
> > > [    3.260895] x5 : 000000000000bff4 x4 : 0000000000000000 x3 :
> > > ffff000006516ae0
> > > [    3.261789] x2 : ffff000006516ae0 x1 : 0000000000000000 x0 :
> > > 0000000000000000
> > > [    3.262684] Call trace:
> > > [    3.262991]  mtk_drm_crtc_dma_dev_get+0x8/0x18
> > > [    3.263549]  try_to_bring_up_aggregate_device+0x16c/0x1e0
> > > [    3.264227]  __component_add+0xac/0x180
> > > [    3.264708]  component_add+0x1c/0x30
> > > [    3.265158]  mtk_disp_rdma_probe+0x17c/0x270
> > > [    3.265695]  platform_probe+0x70/0xd0
> > > [    3.266155]  really_probe+0x150/0x2c0
> > > [    3.266615]  __driver_probe_device+0x80/0x140
> > > [    3.267162]  driver_probe_device+0x44/0x170
> > > [    3.267687]  __device_attach_driver+0xc0/0x148
> > > [    3.268245]  bus_for_each_drv+0x88/0xf0
> > > [    3.268727]  __device_attach+0xa4/0x198
> > > [    3.269208]  device_initial_probe+0x1c/0x30
> > > [    3.269732]  bus_probe_device+0xb4/0xc0
> > > [    3.270214]  deferred_probe_work_func+0x90/0xd0
> > > [    3.270783]  process_one_work+0x144/0x3a0
> > > [    3.271289]  worker_thread+0x2ac/0x4b8
> > > [    3.271761]  kthread+0xec/0xf8
> > > [    3.272145]  ret_from_fork+0x10/0x20
> > > [    3.272597] Code: 814f7858 ffff8000 aa1e03e9 d503201f (f9425000)
> > > [    3.273361] ---[ end trace 0000000000000000 ]---
> > 
> > I tried reproducing this on mt8192-asurada-spherion and
> > mt8195-cherry-tomato but
> > wasn't able to. However, I did see another issue
> 
> Yeah sorry, I tried to reproduce my initial oops but messed my DT up
> and ended up with no path enabled at all.

No worries, thanks for sending fixes for both!

> 
[..]
> > The mtk-dpi driver populates its encoder's possible_crtcs from the
> > result of
> > mtk_drm_find_possible_crtc_by_comp(), and this function assumes the CRTC
> > for the
> > main path will always have ID 0, and the external path ID 1, but when
> > the
> > main path components are disabled, the external path CRTC becomes the
> > one with
> > ID 0.
> > 
> > So we'd need to make that function return the crtc id dynamically based
> > on
> > whether the components for each path are enabled or not.
> > 
> > With that function hacked to force the right crtc ID, I was able to have
> > a
> > working external DP, with the eDP pipeline disabled on both mt8192 and
> > mt8195.
> 
> Thanks for the hint, where to look at.
> 
> While digging through the code I realized that all the outputs and pipelines
> are harcoded. Doh. For all the mediatek SoCs. Looks like major restriction
> to
> me. E.g. there is also DSI and HDMI output on the mt8195. I looked at the
> downstream linux and there, the output is not part of the pipeline. Are you
> aware of any work in that direction?

I'm not sure I get what output and pipelines are hardcoded that you're referring
to (besides the one in the mtk-dsi/dpi driver that you already sent the patch
fixing).

And I'm not familiar with the DSI and HDMI output support on MT8195, so I can't
help with that.

Thanks,
Nícolas
