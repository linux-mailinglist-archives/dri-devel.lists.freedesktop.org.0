Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAFD79C287
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 04:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F2010E20C;
	Tue, 12 Sep 2023 02:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A454910E265;
 Tue, 12 Sep 2023 02:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694485039; x=1726021039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IoOZzXMGH+WqJZOoqJK8+yG4nUFPLgpY/yidQ7923hM=;
 b=hIvK6sBfYOrTMGpMDjQZ3kkJCOn5UT8qsJv63olYRjAI8CBieMqkqkrk
 t3DDYIUVxRW1AqsLXr/mVd8AX8PtwLmMFSuuQJ+EQHuI0oCQiZHA5DNFk
 TEfnBW3WaNrnODipfc6jDxh5LpoOrIbZT6nogv1slTwwZrijDB8/ZGq27
 ZGstFKNF5IBDMVsjz5Al4DwRNoPdk0vnTTM+/feynSWd+o2Y/7Yt4Ek82
 o5bK8bN1dRh8dZyrijd/vRlDgMs397gCWRbM5CF3IphNig6pz+QDFA4YE
 d/JTfBkhRN3UZdcz8uutt2/Ua0nDEhTWCCBUBMptfdjcRJs06IEknYCvC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="377172503"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="377172503"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="917255556"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="917255556"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v3 01/13] drm/sched: Add drm_sched_submit_* helpers
Date: Mon, 11 Sep 2023 19:16:03 -0700
Message-Id: <20230912021615.2086698-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912021615.2086698-1-matthew.brost@intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 Matthew Brost <matthew.brost@intel.com>, sarah.walker@imgtec.com,
 ketil.johnsen@arm.com, mcanal@igalia.com, Liviu.Dudau@arm.com,
 luben.tuikov@amd.com, lina@asahilina.net, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add scheduler submit ready, stop, and start helpers to hide the
implementation details of the scheduler from the drivers.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 15 +++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 12 +++---
 drivers/gpu/drm/msm/adreno/adreno_device.c    |  6 ++-
 drivers/gpu/drm/scheduler/sched_main.c        | 40 ++++++++++++++++++-
 include/drm/gpu_scheduler.h                   |  3 ++
 6 files changed, 60 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index 625db444df1c..36a1accbc846 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -290,7 +290,7 @@ static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool sus
 	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
 		struct amdgpu_ring *ring = &adev->gfx.compute_ring[i];
 
-		if (!(ring && ring->sched.thread))
+		if (!(ring && drm_sched_submit_ready(&ring->sched)))
 			continue;
 
 		/* stop secheduler and drain ring. */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index a4faea4fa0b5..fb5dad687168 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1659,9 +1659,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !drm_sched_submit_ready(&ring->sched))
 			continue;
-		kthread_park(ring->sched.thread);
+		drm_sched_submit_stop(&ring->sched);
 	}
 
 	seq_puts(m, "run ib test:\n");
@@ -1675,9 +1675,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !drm_sched_submit_ready(&ring->sched))
 			continue;
-		kthread_unpark(ring->sched.thread);
+		drm_sched_submit_start(&ring->sched);
 	}
 
 	up_write(&adev->reset_domain->sem);
@@ -1897,7 +1897,8 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 
 	ring = adev->rings[val];
 
-	if (!ring || !ring->funcs->preempt_ib || !ring->sched.thread)
+	if (!ring || !ring->funcs->preempt_ib ||
+	    !drm_sched_submit_ready(&ring->sched))
 		return -EINVAL;
 
 	/* the last preemption failed */
@@ -1915,7 +1916,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 		goto pro_end;
 
 	/* stop the scheduler */
-	kthread_park(ring->sched.thread);
+	drm_sched_submit_stop(&ring->sched);
 
 	/* preempt the IB */
 	r = amdgpu_ring_preempt_ib(ring);
@@ -1949,7 +1950,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 
 failure:
 	/* restart the scheduler */
-	kthread_unpark(ring->sched.thread);
+	drm_sched_submit_start(&ring->sched);
 
 	up_read(&adev->reset_domain->sem);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 3f001a50b34a..1f8a794704d0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4614,7 +4614,7 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev)
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !drm_sched_submit_ready(&ring->sched))
 			continue;
 
 		spin_lock(&ring->sched.job_list_lock);
@@ -4753,7 +4753,7 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !drm_sched_submit_ready(&ring->sched))
 			continue;
 
 		/* Clear job fence from fence drv to avoid force_completion
@@ -5292,7 +5292,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 			struct amdgpu_ring *ring = tmp_adev->rings[i];
 
-			if (!ring || !ring->sched.thread)
+			if (!ring || !drm_sched_submit_ready(&ring->sched))
 				continue;
 
 			drm_sched_stop(&ring->sched, job ? &job->base : NULL);
@@ -5367,7 +5367,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 			struct amdgpu_ring *ring = tmp_adev->rings[i];
 
-			if (!ring || !ring->sched.thread)
+			if (!ring || !drm_sched_submit_ready(&ring->sched))
 				continue;
 
 			drm_sched_start(&ring->sched, true);
@@ -5693,7 +5693,7 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
 		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 			struct amdgpu_ring *ring = adev->rings[i];
 
-			if (!ring || !ring->sched.thread)
+			if (!ring || !drm_sched_submit_ready(&ring->sched))
 				continue;
 
 			drm_sched_stop(&ring->sched, NULL);
@@ -5821,7 +5821,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !drm_sched_submit_ready(&ring->sched))
 			continue;
 
 		drm_sched_start(&ring->sched, true);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index fa527935ffd4..e046dc5ff72a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -809,7 +809,8 @@ static void suspend_scheduler(struct msm_gpu *gpu)
 	 */
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
-		kthread_park(sched->thread);
+
+		drm_sched_submit_stop(sched);
 	}
 }
 
@@ -819,7 +820,8 @@ static void resume_scheduler(struct msm_gpu *gpu)
 
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
-		kthread_unpark(sched->thread);
+
+		drm_sched_submit_start(sched);
 	}
 }
 
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 506371c42745..e4fa62abca41 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -439,7 +439,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 {
 	struct drm_sched_job *s_job, *tmp;
 
-	kthread_park(sched->thread);
+	drm_sched_submit_stop(sched);
 
 	/*
 	 * Reinsert back the bad job here - now it's safe as
@@ -552,7 +552,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 		spin_unlock(&sched->job_list_lock);
 	}
 
-	kthread_unpark(sched->thread);
+	drm_sched_submit_start(sched);
 }
 EXPORT_SYMBOL(drm_sched_start);
 
@@ -1206,3 +1206,39 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	}
 }
 EXPORT_SYMBOL(drm_sched_increase_karma);
+
+/**
+ * drm_sched_submit_ready - scheduler ready for submission
+ *
+ * @sched: scheduler instance
+ *
+ * Returns true if submission is ready
+ */
+bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched)
+{
+	return !!sched->thread;
+
+}
+EXPORT_SYMBOL(drm_sched_submit_ready);
+
+/**
+ * drm_sched_submit_stop - stop scheduler submission
+ *
+ * @sched: scheduler instance
+ */
+void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
+{
+	kthread_park(sched->thread);
+}
+EXPORT_SYMBOL(drm_sched_submit_stop);
+
+/**
+ * drm_sched_submit_start - start scheduler submission
+ *
+ * @sched: scheduler instance
+ */
+void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
+{
+	kthread_unpark(sched->thread);
+}
+EXPORT_SYMBOL(drm_sched_submit_start);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index f9544d9b670d..f12c5aea5294 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -550,6 +550,9 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
+bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched);
+void drm_sched_submit_stop(struct drm_gpu_scheduler *sched);
+void drm_sched_submit_start(struct drm_gpu_scheduler *sched);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
 void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
-- 
2.34.1

