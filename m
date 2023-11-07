Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4BD7E3D56
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B2F10E588;
	Tue,  7 Nov 2023 12:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD9E10E586
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 12:27:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0166B611C2;
 Tue,  7 Nov 2023 12:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5740DC433CB;
 Tue,  7 Nov 2023 12:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699360070;
 bh=wtPuCirPCwlkOkkKp7DO+VejojY2Gc2O8EZm7AjJt24=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iQOoP3TrP0KfK42v8aH/WNiBw9ZuihfjyKo/RWfFhZFx+jgkISTZilBRR8lMUUXYM
 x3NXqo2+ak6tDxeb+uHV2BhUri7+RyoxMOEurDOHopaWhfpPMZbydES2uO5oaHXT96
 582qApsHrpluvZHHuPt2kOEV546al3vgL8oIPIXtBqZt9LJMXjLJeGukMW0ciXlIPe
 JgKYHQooxcAwH9pcaqSWfXAebvj5U1/7yVqXEInn0qGvFHel1QbfMnzZ3t6r9HR4Pm
 sPfcBkol9jXfVo+t/DFgLMXfX7DBhBUUoe768JNp9oPITwg8zppLeT0+QCaCHUeQVj
 t5vX5CUa0el7w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 02/25] drm/komeda: drop all currently held locks
 if deadlock happens
Date: Tue,  7 Nov 2023 07:26:41 -0500
Message-ID: <20231107122745.3761613-2-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107122745.3761613-1-sashal@kernel.org>
References: <20231107122745.3761613-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.61
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, "baozhu.liu" <lucas.liu@siengine.com>,
 mripard@kernel.org, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 Liviu Dudau <liviu.dudau@arm.com>,
 "menghui . huang" <menghui.huang@siengine.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "baozhu.liu" <lucas.liu@siengine.com>

[ Upstream commit 19ecbe8325a2a7ffda5ff4790955b84eaccba49f ]

If komeda_pipeline_unbound_components() returns -EDEADLK,
it means that a deadlock happened in the locking context.
Currently, komeda is not dealing with the deadlock properly,producing the
following output when CONFIG_DEBUG_WW_MUTEX_SLOWPATH is enabled:

 ------------[ cut here ]------------
[   26.103984] WARNING: CPU: 2 PID: 345 at drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:1248
	       komeda_release_unclaimed_resources+0x13c/0x170
[   26.117453] Modules linked in:
[   26.120511] CPU: 2 PID: 345 Comm: composer@2.1-se Kdump: loaded Tainted: G   W  5.10.110-SE-SDK1.8-dirty #16
[   26.131374] Hardware name: Siengine Se1000 Evaluation board (DT)
[   26.137379] pstate: 20400009 (nzCv daif +PAN -UAO -TCO BTYPE=--)
[   26.143385] pc : komeda_release_unclaimed_resources+0x13c/0x170
[   26.149301] lr : komeda_release_unclaimed_resources+0xbc/0x170
[   26.155130] sp : ffff800017b8b8d0
[   26.158442] pmr_save: 000000e0
[   26.161493] x29: ffff800017b8b8d0 x28: ffff000cf2f96200
[   26.166805] x27: ffff000c8f5a8800 x26: 0000000000000000
[   26.172116] x25: 0000000000000038 x24: ffff8000116a0140
[   26.177428] x23: 0000000000000038 x22: ffff000cf2f96200
[   26.182739] x21: ffff000cfc300300 x20: ffff000c8ab77080
[   26.188051] x19: 0000000000000003 x18: 0000000000000000
[   26.193362] x17: 0000000000000000 x16: 0000000000000000
[   26.198672] x15: b400e638f738ba38 x14: 0000000000000000
[   26.203983] x13: 0000000106400a00 x12: 0000000000000000
[   26.209294] x11: 0000000000000000 x10: 0000000000000000
[   26.214604] x9 : ffff800012f80000 x8 : ffff000ca3308000
[   26.219915] x7 : 0000000ff3000000 x6 : ffff80001084034c
[   26.225226] x5 : ffff800017b8bc40 x4 : 000000000000000f
[   26.230536] x3 : ffff000ca3308000 x2 : 0000000000000000
[   26.235847] x1 : 0000000000000000 x0 : ffffffffffffffdd
[   26.241158] Call trace:
[   26.243604] komeda_release_unclaimed_resources+0x13c/0x170
[   26.249175] komeda_crtc_atomic_check+0x68/0xf0
[   26.253706] drm_atomic_helper_check_planes+0x138/0x1f4
[   26.258929] komeda_kms_check+0x284/0x36c
[   26.262939] drm_atomic_check_only+0x40c/0x714
[   26.267381] drm_atomic_nonblocking_commit+0x1c/0x60
[   26.272344] drm_mode_atomic_ioctl+0xa3c/0xb8c
[   26.276787] drm_ioctl_kernel+0xc4/0x120
[   26.280708] drm_ioctl+0x268/0x534
[   26.284109] __arm64_sys_ioctl+0xa8/0xf0
[   26.288030] el0_svc_common.constprop.0+0x80/0x240
[   26.292817] do_el0_svc+0x24/0x90
[   26.296132] el0_svc+0x20/0x30
[   26.299185] el0_sync_handler+0xe8/0xf0
[   26.303018] el0_sync+0x1a4/0x1c0
[   26.306330] irq event stamp: 0
[   26.309384] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
[   26.315650] hardirqs last disabled at (0): [<ffff800010056d34>] copy_process+0x5d0/0x183c
[   26.323825] softirqs last  enabled at (0): [<ffff800010056d34>] copy_process+0x5d0/0x183c
[   26.331997] softirqs last disabled at (0): [<0000000000000000>] 0x0
[   26.338261] ---[ end trace 20ae984fa860184a ]---
[   26.343021] ------------[ cut here ]------------
[   26.347646] WARNING: CPU: 3 PID: 345 at drivers/gpu/drm/drm_modeset_lock.c:228 drm_modeset_drop_locks+0x84/0x90
[   26.357727] Modules linked in:
[   26.360783] CPU: 3 PID: 345 Comm: composer@2.1-se Kdump: loaded Tainted: G   W  5.10.110-SE-SDK1.8-dirty #16
[   26.371645] Hardware name: Siengine Se1000 Evaluation board (DT)
[   26.377647] pstate: 20400009 (nzCv daif +PAN -UAO -TCO BTYPE=--)
[   26.383649] pc : drm_modeset_drop_locks+0x84/0x90
[   26.388351] lr : drm_mode_atomic_ioctl+0x860/0xb8c
[   26.393137] sp : ffff800017b8bb10
[   26.396447] pmr_save: 000000e0
[   26.399497] x29: ffff800017b8bb10 x28: 0000000000000001
[   26.404807] x27: 0000000000000038 x26: 0000000000000002
[   26.410115] x25: ffff000cecbefa00 x24: ffff000cf2f96200
[   26.415423] x23: 0000000000000001 x22: 0000000000000018
[   26.420731] x21: 0000000000000001 x20: ffff800017b8bc10
[   26.426039] x19: 0000000000000000 x18: 0000000000000000
[   26.431347] x17: 0000000002e8bf2c x16: 0000000002e94c6b
[   26.436655] x15: 0000000002ea48b9 x14: ffff8000121f0300
[   26.441963] x13: 0000000002ee2ca8 x12: ffff80001129cae0
[   26.447272] x11: ffff800012435000 x10: ffff000ed46b5e88
[   26.452580] x9 : ffff000c9935e600 x8 : 0000000000000000
[   26.457888] x7 : 000000008020001e x6 : 000000008020001f
[   26.463196] x5 : ffff80001085fbe0 x4 : fffffe0033a59f20
[   26.468504] x3 : 000000008020001e x2 : 0000000000000000
[   26.473813] x1 : 0000000000000000 x0 : ffff000c8f596090
[   26.479122] Call trace:
[   26.481566] drm_modeset_drop_locks+0x84/0x90
[   26.485918] drm_mode_atomic_ioctl+0x860/0xb8c
[   26.490359] drm_ioctl_kernel+0xc4/0x120
[   26.494278] drm_ioctl+0x268/0x534
[   26.497677] __arm64_sys_ioctl+0xa8/0xf0
[   26.501598] el0_svc_common.constprop.0+0x80/0x240
[   26.506384] do_el0_svc+0x24/0x90
[   26.509697] el0_svc+0x20/0x30
[   26.512748] el0_sync_handler+0xe8/0xf0
[   26.516580] el0_sync+0x1a4/0x1c0
[   26.519891] irq event stamp: 0
[   26.522943] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
[   26.529207] hardirqs last disabled at (0): [<ffff800010056d34>] copy_process+0x5d0/0x183c
[   26.537379] softirqs last  enabled at (0): [<ffff800010056d34>] copy_process+0x5d0/0x183c
[   26.545550] softirqs last disabled at (0): [<0000000000000000>] 0x0
[   26.551812] ---[ end trace 20ae984fa860184b ]---

According to the call trace information,it can be located to be
WARN_ON(IS_ERR(c_st)) in the komeda_pipeline_unbound_components function;
Then follow the function.
komeda_pipeline_unbound_components
-> komeda_component_get_state_and_set_user
  -> komeda_pipeline_get_state_and_set_crtc
    -> komeda_pipeline_get_state
      ->drm_atomic_get_private_obj_state
        -> drm_atomic_get_private_obj_state
          -> drm_modeset_lock

komeda_pipeline_unbound_components
-> komeda_component_get_state_and_set_user
  -> komeda_component_get_state
    -> drm_atomic_get_private_obj_state
     -> drm_modeset_lock

ret = drm_modeset_lock(&obj->lock, state->acquire_ctx); if (ret)
	return ERR_PTR(ret);
Here it return -EDEADLK.

deal with the deadlock as suggested by [1], using the
function drm_modeset_backoff().
[1] https://docs.kernel.org/gpu/drm-kms.html?highlight=kms#kms-locking

Therefore, handling this problem can be solved
by adding return -EDEADLK back to the drm_modeset_backoff processing flow
in the drm_mode_atomic_ioctl function.

Signed-off-by: baozhu.liu <lucas.liu@siengine.com>
Signed-off-by: menghui.huang <menghui.huang@siengine.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230804013117.6870-1-menghui.huang@siengine.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/arm/display/komeda/komeda_pipeline_state.c   | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
index 3276a3e82c628..916f2c36bf2f7 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
@@ -1223,7 +1223,7 @@ int komeda_build_display_data_flow(struct komeda_crtc *kcrtc,
 	return 0;
 }
 
-static void
+static int
 komeda_pipeline_unbound_components(struct komeda_pipeline *pipe,
 				   struct komeda_pipeline_state *new)
 {
@@ -1243,8 +1243,12 @@ komeda_pipeline_unbound_components(struct komeda_pipeline *pipe,
 		c = komeda_pipeline_get_component(pipe, id);
 		c_st = komeda_component_get_state_and_set_user(c,
 				drm_st, NULL, new->crtc);
+		if (PTR_ERR(c_st) == -EDEADLK)
+			return -EDEADLK;
 		WARN_ON(IS_ERR(c_st));
 	}
+
+	return 0;
 }
 
 /* release unclaimed pipeline resource */
@@ -1266,9 +1270,8 @@ int komeda_release_unclaimed_resources(struct komeda_pipeline *pipe,
 	if (WARN_ON(IS_ERR_OR_NULL(st)))
 		return -EINVAL;
 
-	komeda_pipeline_unbound_components(pipe, st);
+	return komeda_pipeline_unbound_components(pipe, st);
 
-	return 0;
 }
 
 /* Since standalone disabled components must be disabled separately and in the
-- 
2.42.0

