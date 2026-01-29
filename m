Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBx0Hox0fGmAMwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:06:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089DCB8B7F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F9D10E943;
	Fri, 30 Jan 2026 09:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=139.com header.i=@139.com header.b="S4nqc7Fc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 553 seconds by postgrey-1.36 at gabe;
 Thu, 29 Jan 2026 09:22:46 UTC
Received: from n169-111.mail.139.com (n169-111.mail.139.com [120.232.169.111])
 by gabe.freedesktop.org (Postfix) with ESMTP id 49B7510E173;
 Thu, 29 Jan 2026 09:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=139.com; s=dkim; l=0;
 h=from:subject:message-id:to:cc:mime-version;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=S4nqc7FcSohhJvalh1BxGGC/0wnK575uL6Bc0d0NThsl96D2a9wU/IwkAwHIzIrhXD+6CC3cE5sGy
 ljN+eE6z1xWjlK+SVb9tYS5Svjwl2iKIx5NP+OzzhreX0yPGRpawrqezs/nk8POg5bTL9Gr/f3YFiC
 shlt4EEoO/+vt8vo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from NTT-kernel-dev (unknown[60.247.85.88])
 by rmsmtp-lg-appmail-16-12015 (RichMail) with SMTP id 2eef697b24b99e2-009f0;
 Thu, 29 Jan 2026 17:13:32 +0800 (CST)
X-RM-TRANSID: 2eef697b24b99e2-009f0
From: Li hongliang <1468888505@139.com>
To: gregkh@linuxfoundation.org, stable@vger.kernel.org,
 srinivasan.shanmugam@amd.com
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, sashal@kernel.org,
 mario.limonciello@amd.com, superm1@kernel.org, Jun.Ma2@amd.com,
 Zhigang.Luo@amd.com, Hawking.Zhang@amd.com, Jesse.Zhang@amd.com,
 victor.skvortsov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, lin.cao@amd.com, Jingwen.Chen2@amd.com
Subject: [PATCH 6.6.y] drm/amdgpu: Replace Mutex with Spinlock for RLCG
 register access to avoid Priority Inversion in SRIOV
Date: Thu, 29 Jan 2026 17:13:25 +0800
Message-Id: <20260129091325.3637010-1-1468888505@139.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 30 Jan 2026 09:06:10 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[139.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[139.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[139.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,amd.com,gmail.com,ffwll.ch,kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[139.com:-];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1468888505@139.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 089DCB8B7F
X-Rspamd-Action: no action

From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

[ Upstream commit dc0297f3198bd60108ccbd167ee5d9fa4af31ed0 ]

RLCG Register Access is a way for virtual functions to safely access GPU
registers in a virtualized environment., including TLB flushes and
register reads. When multiple threads or VFs try to access the same
registers simultaneously, it can lead to race conditions. By using the
RLCG interface, the driver can serialize access to the registers. This
means that only one thread can access the registers at a time,
preventing conflicts and ensuring that operations are performed
correctly. Additionally, when a low-priority task holds a mutex that a
high-priority task needs, ie., If a thread holding a spinlock tries to
acquire a mutex, it can lead to priority inversion. register access in
amdgpu_virt_rlcg_reg_rw especially in a fast code path is critical.

The call stack shows that the function amdgpu_virt_rlcg_reg_rw is being
called, which attempts to acquire the mutex. This function is invoked
from amdgpu_sriov_wreg, which in turn is called from
gmc_v11_0_flush_gpu_tlb.

The [ BUG: Invalid wait context ] indicates that a thread is trying to
acquire a mutex while it is in a context that does not allow it to sleep
(like holding a spinlock).

Fixes the below:

[  253.013423] =============================
[  253.013434] [ BUG: Invalid wait context ]
[  253.013446] 6.12.0-amdstaging-drm-next-lol-050225 #14 Tainted: G     U     OE
[  253.013464] -----------------------------
[  253.013475] kworker/0:1/10 is trying to lock:
[  253.013487] ffff9f30542e3cf8 (&adev->virt.rlcg_reg_lock){+.+.}-{3:3}, at: amdgpu_virt_rlcg_reg_rw+0xf6/0x330 [amdgpu]
[  253.013815] other info that might help us debug this:
[  253.013827] context-{4:4}
[  253.013835] 3 locks held by kworker/0:1/10:
[  253.013847]  #0: ffff9f3040050f58 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x3f5/0x680
[  253.013877]  #1: ffffb789c008be40 ((work_completion)(&wfc.work)){+.+.}-{0:0}, at: process_one_work+0x1d6/0x680
[  253.013905]  #2: ffff9f3054281838 (&adev->gmc.invalidate_lock){+.+.}-{2:2}, at: gmc_v11_0_flush_gpu_tlb+0x198/0x4f0 [amdgpu]
[  253.014154] stack backtrace:
[  253.014164] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Tainted: G     U     OE      6.12.0-amdstaging-drm-next-lol-050225 #14
[  253.014189] Tainted: [U]=USER, [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
[  253.014203] Hardware name: Microsoft Corporation Virtual Machine/Virtual Machine, BIOS Hyper-V UEFI Release v4.1 11/18/2024
[  253.014224] Workqueue: events work_for_cpu_fn
[  253.014241] Call Trace:
[  253.014250]  <TASK>
[  253.014260]  dump_stack_lvl+0x9b/0xf0
[  253.014275]  dump_stack+0x10/0x20
[  253.014287]  __lock_acquire+0xa47/0x2810
[  253.014303]  ? srso_alias_return_thunk+0x5/0xfbef5
[  253.014321]  lock_acquire+0xd1/0x300
[  253.014333]  ? amdgpu_virt_rlcg_reg_rw+0xf6/0x330 [amdgpu]
[  253.014562]  ? __lock_acquire+0xa6b/0x2810
[  253.014578]  __mutex_lock+0x85/0xe20
[  253.014591]  ? amdgpu_virt_rlcg_reg_rw+0xf6/0x330 [amdgpu]
[  253.014782]  ? sched_clock_noinstr+0x9/0x10
[  253.014795]  ? srso_alias_return_thunk+0x5/0xfbef5
[  253.014808]  ? local_clock_noinstr+0xe/0xc0
[  253.014822]  ? amdgpu_virt_rlcg_reg_rw+0xf6/0x330 [amdgpu]
[  253.015012]  ? srso_alias_return_thunk+0x5/0xfbef5
[  253.015029]  mutex_lock_nested+0x1b/0x30
[  253.015044]  ? mutex_lock_nested+0x1b/0x30
[  253.015057]  amdgpu_virt_rlcg_reg_rw+0xf6/0x330 [amdgpu]
[  253.015249]  amdgpu_sriov_wreg+0xc5/0xd0 [amdgpu]
[  253.015435]  gmc_v11_0_flush_gpu_tlb+0x44b/0x4f0 [amdgpu]
[  253.015667]  gfx_v11_0_hw_init+0x499/0x29c0 [amdgpu]
[  253.015901]  ? __pfx_smu_v13_0_update_pcie_parameters+0x10/0x10 [amdgpu]
[  253.016159]  ? srso_alias_return_thunk+0x5/0xfbef5
[  253.016173]  ? smu_hw_init+0x18d/0x300 [amdgpu]
[  253.016403]  amdgpu_device_init+0x29ad/0x36a0 [amdgpu]
[  253.016614]  amdgpu_driver_load_kms+0x1a/0xc0 [amdgpu]
[  253.017057]  amdgpu_pci_probe+0x1c2/0x660 [amdgpu]
[  253.017493]  local_pci_probe+0x4b/0xb0
[  253.017746]  work_for_cpu_fn+0x1a/0x30
[  253.017995]  process_one_work+0x21e/0x680
[  253.018248]  worker_thread+0x190/0x330
[  253.018500]  ? __pfx_worker_thread+0x10/0x10
[  253.018746]  kthread+0xe7/0x120
[  253.018988]  ? __pfx_kthread+0x10/0x10
[  253.019231]  ret_from_fork+0x3c/0x60
[  253.019468]  ? __pfx_kthread+0x10/0x10
[  253.019701]  ret_from_fork_asm+0x1a/0x30
[  253.019939]  </TASK>

v2: s/spin_trylock/spin_lock_irqsave to be safe (Christian).

Fixes: e864180ee49b ("drm/amdgpu: Add lock around VF RLCG interface")
Cc: lin cao <lin.cao@amd.com>
Cc: Jingwen Chen <Jingwen.Chen2@amd.com>
Cc: Victor Skvortsov <victor.skvortsov@amd.com>
Cc: Zhigang Luo <zhigang.luo@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Suggested-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
[ Minor conflict resolved. ]
Signed-off-by: Li hongliang <1468888505@139.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c   | 5 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h   | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index c1b9333d7b78..584f9bcbe294 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3582,7 +3582,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	mutex_init(&adev->grbm_idx_mutex);
 	mutex_init(&adev->mn_lock);
 	mutex_init(&adev->virt.vf_errors.lock);
-	mutex_init(&adev->virt.rlcg_reg_lock);
 	hash_init(adev->mn_hash);
 	mutex_init(&adev->psp.mutex);
 	mutex_init(&adev->notifier_lock);
@@ -3604,6 +3603,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	spin_lock_init(&adev->se_cac_idx_lock);
 	spin_lock_init(&adev->audio_endpt_idx_lock);
 	spin_lock_init(&adev->mm_stats.lock);
+	spin_lock_init(&adev->virt.rlcg_reg_lock);
 
 	INIT_LIST_HEAD(&adev->shadow_list);
 	mutex_init(&adev->shadow_list_lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 5a4b1b625f03..0f4661d1f23b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -1007,6 +1007,7 @@ static u32 amdgpu_virt_rlcg_reg_rw(struct amdgpu_device *adev, u32 offset, u32 v
 	void *scratch_reg2;
 	void *scratch_reg3;
 	void *spare_int;
+	unsigned long flags;
 
 	if (!adev->gfx.rlc.rlcg_reg_access_supported) {
 		dev_err(adev->dev,
@@ -1028,7 +1029,7 @@ static u32 amdgpu_virt_rlcg_reg_rw(struct amdgpu_device *adev, u32 offset, u32 v
 	scratch_reg2 = (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scratch_reg2;
 	scratch_reg3 = (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scratch_reg3;
 
-	mutex_lock(&adev->virt.rlcg_reg_lock);
+	spin_lock_irqsave(&adev->virt.rlcg_reg_lock, flags);
 
 	if (reg_access_ctrl->spare_int)
 		spare_int = (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->spare_int;
@@ -1086,7 +1087,7 @@ static u32 amdgpu_virt_rlcg_reg_rw(struct amdgpu_device *adev, u32 offset, u32 v
 
 	ret = readl(scratch_reg0);
 
-	mutex_unlock(&adev->virt.rlcg_reg_lock);
+	spin_unlock_irqrestore(&adev->virt.rlcg_reg_lock, flags);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
index 891713757a8f..bffbb7ef40d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
@@ -267,7 +267,8 @@ struct amdgpu_virt {
 	/* the ucode id to signal the autoload */
 	uint32_t autoload_ucode_id;
 
-	struct mutex rlcg_reg_lock;
+	/* Spinlock to protect access to the RLCG register interface */
+	spinlock_t rlcg_reg_lock;
 };
 
 struct amdgpu_video_codec_info;
-- 
2.34.1


