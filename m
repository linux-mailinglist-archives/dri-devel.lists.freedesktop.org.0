Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F57542540C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 15:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA406F49E;
	Thu,  7 Oct 2021 13:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FA26F49B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 13:26:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="206367350"
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="206367350"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 06:26:51 -0700
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="440264999"
Received: from ibanaga-mobl.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.250])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 06:26:50 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [RFC PATCH 2/2] drm/amdgpu: Use an rwsem for the notifier lock
Date: Thu,  7 Oct 2021 15:26:30 +0200
Message-Id: <20211007132630.495184-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007132630.495184-1-thomas.hellstrom@linux.intel.com>
References: <20211007132630.495184-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an rwsem as the notifier lock, and take it in read mode during
command submission.
This avoids the device-wide serialization of command submission in
the absence of userptr invalidations.

Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h              |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           | 12 ++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c           | 10 +++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          |  2 +-
 6 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index d356e329e6f8..04fec2299c02 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1051,7 +1051,7 @@ struct amdgpu_device {
 	struct rw_semaphore reset_sem;
 	struct amdgpu_doorbell_index doorbell_index;
 
-	struct mutex			notifier_lock;
+	struct rw_semaphore		notifier_sem;
 
 	int asic_reset_res;
 	struct work_struct		xgmi_reset_work;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 2d6b2d77b738..14be51692539 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2049,7 +2049,7 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
 
 		/*
 		 * FIXME: Cannot ignore the return code, must hold
-		 * notifier_lock
+		 * notifier_sem in read mode.
 		 */
 		amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 0311d799a010..26f447c49bdd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1224,11 +1224,13 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 
 	drm_sched_job_arm(&job->base);
 
-	/* No memory allocation is allowed while holding the notifier lock.
+	/* No memory allocation is allowed while holding the notifier sem.
 	 * The lock is held until amdgpu_cs_submit is finished and fence is
 	 * added to BOs.
 	 */
-	mutex_lock(&p->adev->notifier_lock);
+	r = down_read_interruptible(&p->adev->notifier_sem);
+	if (r)
+		goto error_notifier;
 
 	/* If userptr are invalidated after amdgpu_cs_parser_bos(), return
 	 * -EAGAIN, drmIoctl in libdrm will restart the amdgpu_cs_ioctl.
@@ -1288,13 +1290,15 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	}
 
 	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
-	mutex_unlock(&p->adev->notifier_lock);
+	up_read(&p->adev->notifier_sem);
 
 	return 0;
 
 error_abort:
+	up_read(&p->adev->notifier_sem);
+
+error_notifier:
 	drm_sched_job_cleanup(&job->base);
-	mutex_unlock(&p->adev->notifier_lock);
 
 error_unlock:
 	amdgpu_job_free(job);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 48089dc0180b..aa27b462152d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3476,7 +3476,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	atomic_set(&adev->in_gpu_reset, 0);
 	init_rwsem(&adev->reset_sem);
 	mutex_init(&adev->psp.mutex);
-	mutex_init(&adev->notifier_lock);
+	init_rwsem(&adev->notifier_sem);
 
 	r = amdgpu_device_init_apu_flags(adev);
 	if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
index d3d340a6129c..e0b1b6e11bf5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
@@ -71,11 +71,11 @@ static bool amdgpu_mn_invalidate_gfx(struct mmu_interval_notifier *mni,
 	if (!mmu_notifier_range_blockable(range))
 		return false;
 
-	mutex_lock(&adev->notifier_lock);
+	down_write(&adev->notifier_sem);
 
 	mmu_interval_set_seq(mni, cur_seq);
 
-	mutex_unlock(&adev->notifier_lock);
+	up_write(&adev->notifier_sem);
 
 	r = dma_resv_wait_timeout(bo->tbo.base.resv, true, false,
 				  MAX_SCHEDULE_TIMEOUT);
@@ -108,12 +108,12 @@ static bool amdgpu_mn_invalidate_hsa(struct mmu_interval_notifier *mni,
 	if (!mmu_notifier_range_blockable(range))
 		return false;
 
-	mutex_lock(&adev->notifier_lock);
+	down_write(&adev->notifier_sem);
 
 	mmu_interval_set_seq(mni, cur_seq);
 
 	amdgpu_amdkfd_evict_userptr(bo->kfd_bo, bo->notifier.mm);
-	mutex_unlock(&adev->notifier_lock);
+	up_write(&adev->notifier_sem);
 
 	return true;
 }
@@ -215,7 +215,7 @@ int amdgpu_hmm_range_get_pages(struct mmu_interval_notifier *notifier,
 	/*
 	 * Due to default_flags, all pages are HMM_PFN_VALID or
 	 * hmm_range_fault() fails. FIXME: The pages cannot be touched outside
-	 * the notifier_lock, and mmu_interval_read_retry() must be done first.
+	 * the notifier_sem, and mmu_interval_read_retry() must be done first.
 	 */
 	for (i = 0; pages && i < npages; i++)
 		pages[i] = hmm_pfn_to_page(pfns[i]);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 0cf94421665f..b2af53a05fb5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -723,7 +723,7 @@ bool amdgpu_ttm_tt_get_user_pages_done(struct ttm_tt *ttm)
 
 	if (gtt->range) {
 		/*
-		 * FIXME: Must always hold notifier_lock for this, and must
+		 * FIXME: Must always hold notifier_sem for this, and must
 		 * not ignore the return code.
 		 */
 		r = amdgpu_hmm_range_get_pages_done(gtt->range);
-- 
2.31.1

