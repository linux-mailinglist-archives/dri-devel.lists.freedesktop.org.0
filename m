Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C1D83F67D
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 17:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DE71126D4;
	Sun, 28 Jan 2024 16:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30231126D4;
 Sun, 28 Jan 2024 16:13:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D5437CE0C6E;
 Sun, 28 Jan 2024 16:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CD6C433C7;
 Sun, 28 Jan 2024 16:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706458428;
 bh=i/X8sJUEdMa6mxFYT3RNkS2xTbTEwS3rLCNeAa6jM5Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=heSEq6tqMoaLt2BYdJRb2HbpgtB3yRWsW5CSDkt57CUajOCm1HHwxsdgD5B/3yjKF
 8eGnjqJ/kJQomftA0cY6z55e0QCPuzRZf9Yr9bnBrPtkV5FjOOobybt8kjNpPcULPD
 nAhDFBgzmXBBpJ+Woav/9nmADRZltFHStEMMli0ayp3lsWRDaEN+//efCqrNKPZPDF
 rl8PZroIUWe7pMu09iBrhzIpQImwiM8arWJy8sQAFAVMOzZL3/lc9dAnCAlqxr+rLb
 eLmR/AL4uO/znBBOjE20TCegv0+aDf4yOFDgSjD/5+gK1asmvZ0X1/+7oGAroWU7W9
 jofhqwdOp7ErQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 19/31] drm/amdkfd: Fix lock dependency warning
Date: Sun, 28 Jan 2024 11:12:49 -0500
Message-ID: <20240128161315.201999-19-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240128161315.201999-1-sashal@kernel.org>
References: <20240128161315.201999-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.14
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
Cc: Sasha Levin <sashal@kernel.org>, Philip Yang <philip.yang@amd.com>,
 Felix.Kuehling@amd.com, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Felix Kuehling <felix.kuehling@amd.com>

[ Upstream commit 47bf0f83fc86df1bf42b385a91aadb910137c5c9 ]

======================================================
WARNING: possible circular locking dependency detected
6.5.0-kfd-fkuehlin #276 Not tainted
------------------------------------------------------
kworker/8:2/2676 is trying to acquire lock:
ffff9435aae95c88 ((work_completion)(&svm_bo->eviction_work)){+.+.}-{0:0}, at: __flush_work+0x52/0x550

but task is already holding lock:
ffff9435cd8e1720 (&svms->lock){+.+.}-{3:3}, at: svm_range_deferred_list_work+0xe8/0x340 [amdgpu]

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #2 (&svms->lock){+.+.}-{3:3}:
       __mutex_lock+0x97/0xd30
       kfd_ioctl_alloc_memory_of_gpu+0x6d/0x3c0 [amdgpu]
       kfd_ioctl+0x1b2/0x5d0 [amdgpu]
       __x64_sys_ioctl+0x86/0xc0
       do_syscall_64+0x39/0x80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #1 (&mm->mmap_lock){++++}-{3:3}:
       down_read+0x42/0x160
       svm_range_evict_svm_bo_worker+0x8b/0x340 [amdgpu]
       process_one_work+0x27a/0x540
       worker_thread+0x53/0x3e0
       kthread+0xeb/0x120
       ret_from_fork+0x31/0x50
       ret_from_fork_asm+0x11/0x20

-> #0 ((work_completion)(&svm_bo->eviction_work)){+.+.}-{0:0}:
       __lock_acquire+0x1426/0x2200
       lock_acquire+0xc1/0x2b0
       __flush_work+0x80/0x550
       __cancel_work_timer+0x109/0x190
       svm_range_bo_release+0xdc/0x1c0 [amdgpu]
       svm_range_free+0x175/0x180 [amdgpu]
       svm_range_deferred_list_work+0x15d/0x340 [amdgpu]
       process_one_work+0x27a/0x540
       worker_thread+0x53/0x3e0
       kthread+0xeb/0x120
       ret_from_fork+0x31/0x50
       ret_from_fork_asm+0x11/0x20

other info that might help us debug this:

Chain exists of:
  (work_completion)(&svm_bo->eviction_work) --> &mm->mmap_lock --> &svms->lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&svms->lock);
                               lock(&mm->mmap_lock);
                               lock(&svms->lock);
  lock((work_completion)(&svm_bo->eviction_work));

I believe this cannot really lead to a deadlock in practice, because
svm_range_evict_svm_bo_worker only takes the mmap_read_lock if the BO
refcount is non-0. That means it's impossible that svm_range_bo_release
is running concurrently. However, there is no good way to annotate this.

To avoid the problem, take a BO reference in
svm_range_schedule_evict_svm_bo instead of in the worker. That way it's
impossible for a BO to get freed while eviction work is pending and the
cancel_work_sync call in svm_range_bo_release can be eliminated.

v2: Use svm_bo_ref_unless_zero and explained why that's safe. Also
removed redundant checks that are already done in
amdkfd_fence_enable_signaling.

Signed-off-by: Felix Kuehling <felix.kuehling@amd.com>
Reviewed-by: Philip Yang <philip.yang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 8e368e4659fd..a4c911fa1675 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -391,14 +391,9 @@ static void svm_range_bo_release(struct kref *kref)
 		spin_lock(&svm_bo->list_lock);
 	}
 	spin_unlock(&svm_bo->list_lock);
-	if (!dma_fence_is_signaled(&svm_bo->eviction_fence->base)) {
-		/* We're not in the eviction worker.
-		 * Signal the fence and synchronize with any
-		 * pending eviction work.
-		 */
+	if (!dma_fence_is_signaled(&svm_bo->eviction_fence->base))
+		/* We're not in the eviction worker. Signal the fence. */
 		dma_fence_signal(&svm_bo->eviction_fence->base);
-		cancel_work_sync(&svm_bo->eviction_work);
-	}
 	dma_fence_put(&svm_bo->eviction_fence->base);
 	amdgpu_bo_unref(&svm_bo->bo);
 	kfree(svm_bo);
@@ -3424,13 +3419,14 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 
 int svm_range_schedule_evict_svm_bo(struct amdgpu_amdkfd_fence *fence)
 {
-	if (!fence)
-		return -EINVAL;
-
-	if (dma_fence_is_signaled(&fence->base))
-		return 0;
-
-	if (fence->svm_bo) {
+	/* Dereferencing fence->svm_bo is safe here because the fence hasn't
+	 * signaled yet and we're under the protection of the fence->lock.
+	 * After the fence is signaled in svm_range_bo_release, we cannot get
+	 * here any more.
+	 *
+	 * Reference is dropped in svm_range_evict_svm_bo_worker.
+	 */
+	if (svm_bo_ref_unless_zero(fence->svm_bo)) {
 		WRITE_ONCE(fence->svm_bo->evicting, 1);
 		schedule_work(&fence->svm_bo->eviction_work);
 	}
@@ -3445,8 +3441,6 @@ static void svm_range_evict_svm_bo_worker(struct work_struct *work)
 	int r = 0;
 
 	svm_bo = container_of(work, struct svm_range_bo, eviction_work);
-	if (!svm_bo_ref_unless_zero(svm_bo))
-		return; /* svm_bo was freed while eviction was pending */
 
 	if (mmget_not_zero(svm_bo->eviction_fence->mm)) {
 		mm = svm_bo->eviction_fence->mm;
-- 
2.43.0

