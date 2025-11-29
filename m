Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E44C9437D
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 17:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E3210E159;
	Sat, 29 Nov 2025 16:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 345 seconds by postgrey-1.36 at gabe;
 Sat, 29 Nov 2025 16:43:33 UTC
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C1210E159
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 16:43:33 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 43BA73EB7F;
 Sat, 29 Nov 2025 17:37:45 +0100 (CET)
Date: Sat, 29 Nov 2025 17:37:43 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v16 10/10] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <tjakx64c25gyakblncsvuoj2iquoknx4ngwujt2uf2clhhfvfl@lbvhrimf6gwp>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-10-ff6232e3472f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-10-ff6232e3472f@linaro.org>
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

On 2025-09-18 21:29:02, Jun Nie wrote:
> To support high-resolution cases that exceed the width limitation of
> a pair of SSPPs, or scenarios that surpass the maximum MDP clock rate,
> additional pipes are necessary to enable parallel data processing
> within the SSPP width constraints and MDP clock rate.
> 
> Request 4 mixers and 4 DSCs for high-resolution cases where both DSC
> and dual interfaces are enabled. More use cases can be incorporated
> later if quad-pipe capabilities are required.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 27 +++++++++++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++----------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
>  6 files changed, 35 insertions(+), 32 deletions(-)

With this patch applied, I get the following crash on the Sony Xperia 1 III, a
dual-DSI dual-DSC device:

	Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
	Mem abort info:
	  ESR = 0x0000000096000004
	  EC = 0x25: DABT (current EL), IL = 32 bits
	  SET = 0, FnV = 0
	  EA = 0, S1PTW = 0
	  FSC = 0x04: level 0 translation fault
	Data abort info:
	  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
	  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
	  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
	user pgtable: 4k pages, 48-bit VAs, pgdp=000000012d4e1000
	[0000000000000020] pgd=0000000000000000, p4d=0000000000000000
	Internal error: Oops: 0000000096000004 [#1]  SMP
	Modules linked in: msm drm_client_lib ubwc_config drm_dp_aux_bus gpu_sched drm_gpuvm drm_exec
	CPU: 5 UID: 0 PID: 3081 Comm: (sd-close) Tainted: G     U              6.18.0-rc7-next-20251127-SoMainline-12422-g10b6db5b056d-dirty #21 NONE
	Tainted: [U]=USER
	Hardware name: Sony Xperia 1 III (DT)
	pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
	pc : dpu_plane_atomic_check_sspp.isra.0+0x88/0x3f4 [msm]
	lr : dpu_plane_atomic_check_sspp.isra.0+0x84/0x3f4 [msm]
	sp : ffff800081e23940
	x29: ffff800081e23950 x28: ffff0000bf2700d0 x27: 0000000000000a00
	x26: ffff0000bf270000 x25: 0000000000000a00 x24: ffff0000bd0e5c18
	x23: ffff000087a6c080 x22: 0000000000000224 x21: ffff00008ce88080
	x20: 0000000000000002 x19: ffff0000bf270138 x18: ffff8000818350b0
	x17: 000000040044ffff x16: ffffc488ae2e37e0 x15: 0000000000000005
	x14: 0000000000000a00 x13: 0000000000000000 x12: 0000000000000138
	x11: 0000000000000000 x10: 0000000000000012 x9 : 0000000000000000
	x8 : 0000000000000a00 x7 : 0000000000000000 x6 : 0000000000000000
	x5 : 0000000000000002 x4 : 0000000000000000 x3 : ffffc48897741db0
	x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
	Call trace:
	 dpu_plane_atomic_check_sspp.isra.0+0x88/0x3f4 [msm] (P)
	 dpu_plane_atomic_check+0x100/0x1a0 [msm]
	 drm_atomic_helper_check_planes+0xd8/0x224
	 drm_atomic_helper_check+0x50/0xb4
	 msm_atomic_check+0xd0/0xe0 [msm]
	 drm_atomic_check_only+0x4e0/0x928
	 drm_atomic_commit+0x50/0xd4
	 drm_client_modeset_commit_atomic+0x200/0x260
	 drm_client_modeset_commit_locked+0x64/0x180
	 drm_client_modeset_commit+0x30/0x60
	 drm_fb_helper_lastclose+0x60/0xb0
	 drm_fbdev_client_restore+0x18/0x38 [drm_client_lib]
	 drm_client_dev_restore+0xac/0xf8
	 drm_release+0x124/0x158
	 __fput+0xd4/0x2e4
	 fput_close_sync+0x3c/0xe0
	 __arm64_sys_close+0x3c/0x84
	 invoke_syscall.constprop.0+0x44/0x100
	 el0_svc_common.constprop.0+0x3c/0xe4
	 do_el0_svc+0x20/0x3c
	 el0_svc+0x38/0x110
	 el0t_64_sync_handler+0xa8/0xec
	 el0t_64_sync+0x1a0/0x1a4
	Code: 2a1403e5 52800082 94008e28 f9400380 (f940101b)
	---[ end trace 0000000000000000 ]---
	pstore: backend (ramoops) writing error (-28)
	[drm:dpu_encoder_frame_done_timeout:2726] [dpu error]enc33 frame done timeout

I don't see any thought given to it in the extremely terse patch description,
but this patch seems to unconditionally select 4 DSCs and 4 LMs on this device
because the underlying SM8350 SoC has 4 available in its catalog - while it
was previously affixed to 2:2:2 matching the downstream and known-working
configuration of this device - and I can only imagine things are rolling
downhill from there.

faddr2line seems to be failing for me, but this is the line
`dpu_plane_atomic_check_sspp.isra.0+0x88` seems to be referring to:

	aarch64-linux-gnu-objdump .output/drivers/gpu/drm/msm/msm.ko -dS | grep dpu_plane_atomic_check_sspp.isra.0\> -A80
	00000000000671ac <dpu_plane_atomic_check_sspp.isra.0>:
	static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
	...
	   67234:	f940101b 	ldr	x27, [x0, #32]
		if (!(sblk->scaler_blk.len && pipe->sspp->ops.setup_scaler) &&

Please help resolve this issue, as I am not understanding the thought process
behind this patch and unsure how to solve this issue short of just reverting it.

Looking forward to some assistance, thanks;
- Marijn
