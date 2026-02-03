Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ok2GHcbgmmZPAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:59:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3C2DB9F8
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1286410E6ED;
	Tue,  3 Feb 2026 15:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xwuV7SNC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54DA10E6EA;
 Tue,  3 Feb 2026 15:59:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 801D740020;
 Tue,  3 Feb 2026 15:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC10EC116D0;
 Tue,  3 Feb 2026 15:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1770134387;
 bh=QvI791hkbSam4XEYdOoSmCwiOfUhGvejURrmRygpJA8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=xwuV7SNCfWS1WLaBVURatTzUdUW8Sy4EmlqjH9GrEBsziXFEx1n2Phw/Gqu0nX748
 qAq7K+Zbt8wY+FckjTTpmHHrlaSdCNHuZCzTtMNLB21pe0iZt+vvqBnEXFbMZd1Hef
 toUiJhQRSspYI8++gSILMF3nc6e+p+MWVWQtOcSE=
Subject: Patch "drm/amdgpu: Replace Mutex with Spinlock for RLCG register
 access to avoid Priority Inversion in SRIOV" has been added to the 6.1-stable
 tree
To: 1468888505@139.com, Hawking.Zhang@amd.com, Jesse.Zhang@amd.com,
 Jingwen.Chen2@amd.com, Jun.Ma2@amd.com, Xinhui.Pan@amd.com,
 Zhigang.Luo@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org, lin.cao@amd.com,
 mario.limonciello@amd.com, patches@lists.linux.dev, sashal@kernel.org,
 srinivasan.shanmugam@amd.com, superm1@kernel.org, victor.skvortsov@amd.com,
 zhigang.luo@amd.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 03 Feb 2026 16:59:08 +0100
In-Reply-To: <20260129092702.3671189-1-1468888505@139.com>
Message-ID: <2026020308-chain-pectin-78ba@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
X-Spamd-Result: default: False [4.99 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[139.com,amd.com,gmail.com,lists.freedesktop.org,ffwll.ch,linuxfoundation.org,lists.linux.dev,kernel.org];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linuxfoundation.org:email,linux.dev:email,139.com:email]
X-Rspamd-Queue-Id: CD3C2DB9F8
X-Rspamd-Action: no action


This is a note to let you know that I've just added the patch titled

    drm/amdgpu: Replace Mutex with Spinlock for RLCG register access to avoid Priority Inversion in SRIOV

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-amdgpu-replace-mutex-with-spinlock-for-rlcg-register-access-to-avoid-priority-inversion-in-sriov.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-212755-greg=kroah.com@vger.kernel.org Thu Jan 29 10:27:16 2026
From: Li hongliang <1468888505@139.com>
Date: Thu, 29 Jan 2026 17:27:02 +0800
Subject: drm/amdgpu: Replace Mutex with Spinlock for RLCG register access to avoid Priority Inversion in SRIOV
To: gregkh@linuxfoundation.org, stable@vger.kernel.org, srinivasan.shanmugam@amd.com
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch, sashal@kernel.org, mario.limonciello@amd.com, superm1@kernel.org, Jun.Ma2@amd.com, Zhigang.Luo@amd.com, Hawking.Zhang@amd.com, Jesse.Zhang@amd.com, victor.skvortsov@amd.com, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, lin.cao@amd.com, Jingwen.Chen2@amd.com
Message-ID: <20260129092702.3671189-1-1468888505@139.com>

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c   |    5 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h   |    3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3652,7 +3652,6 @@ int amdgpu_device_init(struct amdgpu_dev
 	mutex_init(&adev->grbm_idx_mutex);
 	mutex_init(&adev->mn_lock);
 	mutex_init(&adev->virt.vf_errors.lock);
-	mutex_init(&adev->virt.rlcg_reg_lock);
 	hash_init(adev->mn_hash);
 	mutex_init(&adev->psp.mutex);
 	mutex_init(&adev->notifier_lock);
@@ -3674,6 +3673,7 @@ int amdgpu_device_init(struct amdgpu_dev
 	spin_lock_init(&adev->se_cac_idx_lock);
 	spin_lock_init(&adev->audio_endpt_idx_lock);
 	spin_lock_init(&adev->mm_stats.lock);
+	spin_lock_init(&adev->virt.rlcg_reg_lock);
 
 	INIT_LIST_HEAD(&adev->shadow_list);
 	mutex_init(&adev->shadow_list_lock);
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -965,6 +965,7 @@ static u32 amdgpu_virt_rlcg_reg_rw(struc
 	void *scratch_reg2;
 	void *scratch_reg3;
 	void *spare_int;
+	unsigned long flags;
 
 	if (!adev->gfx.rlc.rlcg_reg_access_supported) {
 		dev_err(adev->dev,
@@ -978,7 +979,7 @@ static u32 amdgpu_virt_rlcg_reg_rw(struc
 	scratch_reg2 = (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scratch_reg2;
 	scratch_reg3 = (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scratch_reg3;
 
-	mutex_lock(&adev->virt.rlcg_reg_lock);
+	spin_lock_irqsave(&adev->virt.rlcg_reg_lock, flags);
 
 	if (reg_access_ctrl->spare_int)
 		spare_int = (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->spare_int;
@@ -1034,7 +1035,7 @@ static u32 amdgpu_virt_rlcg_reg_rw(struc
 
 	ret = readl(scratch_reg0);
 
-	mutex_unlock(&adev->virt.rlcg_reg_lock);
+	spin_unlock_irqrestore(&adev->virt.rlcg_reg_lock, flags);
 
 	return ret;
 }
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
@@ -264,7 +264,8 @@ struct amdgpu_virt {
 	/* the ucode id to signal the autoload */
 	uint32_t autoload_ucode_id;
 
-	struct mutex rlcg_reg_lock;
+	/* Spinlock to protect access to the RLCG register interface */
+	spinlock_t rlcg_reg_lock;
 };
 
 struct amdgpu_video_codec_info;


Patches currently in stable-queue which might be from 1468888505@139.com are

queue-6.1/vhost-scsi-fix-handling-of-multiple-calls-to-vhost_scsi_set_endpoint.patch
queue-6.1/fs-ntfs3-initialize-allocated-memory-before-use.patch
queue-6.1/drm-radeon-delete-radeon_fence_process-in-is_signaled-no-deadlock.patch
queue-6.1/ksmbd-fix-race-condition-in-rpc-handle-list-access.patch
queue-6.1/ksmbd-fix-use-after-free-in-ksmbd_session_rpc_open.patch
queue-6.1/drm-amdgpu-replace-mutex-with-spinlock-for-rlcg-register-access-to-avoid-priority-inversion-in-sriov.patch
queue-6.1/sctp-linearize-cloned-gso-packets-in-sctp_rcv.patch
