Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14237C6149
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 01:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A4010E30C;
	Wed, 11 Oct 2023 23:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CD010E30A;
 Wed, 11 Oct 2023 23:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697068685; x=1728604685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d1Z1qtQqQsWe9HV9Bj1lY4qnfOEWKQAxp9vP9yR+GKs=;
 b=lIyJ88wFRcIjge6fSrQreBhICMOSXZaEZvzLOKoZiEDJo744BKIpdk2m
 bZ3NEXqjV0hkMVU6i4w4P3iSBFROJrFr/RK4eC62IPiHLXy/wN8RXCRke
 22XkFHwcvU5t5hq+QzwhFnm6n8sSmWaZjyPYBzeWsoV00zGffoxD+5+jr
 XBui3/+8mKDIWNBCbhrzaW8nfNJJf31AXWzUn5T3tAMH6VWjibwUJQnqg
 hUazF6IwIYfbB+R/6wTnY8S9dc8YLRv/EbIhrM8sncwwTw2U2be9yK7vh
 HJOT/Lmq1bUdBmgk1ZjN/rb86JcFF/G/RqzXHZQ0yTcT5iEtfmKnMdb2g w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="387637363"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="387637363"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 16:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="824367784"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="824367784"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 16:58:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v5 1/7] drm/sched: Add drm_sched_wqueue_* helpers
Date: Wed, 11 Oct 2023 16:58:20 -0700
Message-Id: <20231011235826.585624-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011235826.585624-1-matthew.brost@intel.com>
References: <20231011235826.585624-1-matthew.brost@intel.com>
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
 Matthew Brost <matthew.brost@intel.com>, lina@asahilina.net,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add scheduler wqueue ready, stop, and start helpers to hide the
implementation details of the scheduler from the drivers.

v2:
  - s/sched_wqueue/sched_wqueue (Luben)
  - Remove the extra white line after the return-statement (Luben)
  - update drm_sched_wqueue_ready comment (Luben)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 15 +++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 12 +++---
 drivers/gpu/drm/msm/adreno/adreno_device.c    |  6 ++-
 drivers/gpu/drm/scheduler/sched_main.c        | 39 ++++++++++++++++++-
 include/drm/gpu_scheduler.h                   |  3 ++
 6 files changed, 59 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index 625db444df1c..10d56979fe3b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -290,7 +290,7 @@ static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool sus
 	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
 		struct amdgpu_ring *ring = &adev->gfx.compute_ring[i];
 
-		if (!(ring && ring->sched.thread))
+		if (!(ring && drm_sched_wqueue_ready(&ring->sched)))
 			continue;
 
 		/* stop secheduler and drain ring. */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index a4faea4fa0b5..a4c0bb358db7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1659,9 +1659,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !drm_sched_wqueue_ready(&ring->sched))
 			continue;
-		kthread_park(ring->sched.thread);
+		drm_sched_wqueue_stop(&ring->sched);
 	}
 
 	seq_puts(m, "run ib test:\n");
@@ -1675,9 +1675,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !drm_sched_wqueue_ready(&ring->sched))
 			continue;
-		kthread_unpark(ring->sched.thread);
+		drm_sched_wqueue_start(&ring->sched);
 	}
 
 	up_write(&adev->reset_domain->sem);
@@ -1897,7 +1897,8 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 
 	ring = adev->rings[val];
 
-	if (!ring || !ring->funcs->preempt_ib || !ring->sched.thread)
+	if (!ring || !ring->funcs->preempt_ib ||
+	    !drm_sched_wqueue_ready(&ring->sched))
 		return -EINVAL;
 
 	/* the last preemption failed */
@@ -1915,7 +1916,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 		goto pro_end;
 
 	/* stop the scheduler */
-	kthread_park(ring->sched.thread);
+	drm_sched_wqueue_stop(&ring->sched);
 
 	/* preempt the IB */
 	r = amdgpu_ring_preempt_ib(ring);
@@ -1949,7 +1950,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 
 failure:
 	/* restart the scheduler */
-	kthread_unpark(ring->sched.thread);
+	drm_sched_wqueue_start(&ring->sched);
 
 	up_read(&adev->reset_domain->sem);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2b8356699f23..b1aafe815f28 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4588,7 +4588,7 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev)
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !drm_sched_wqueue_ready(&ring->sched))
 			continue;
 
 		spin_lock(&ring->sched.job_list_lock);
@@ -4727,7 +4727,7 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !drm_sched_wqueue_ready(&ring->sched))
 			continue;
 
 		/* Clear job fence from fence drv to avoid force_completion
@@ -5266,7 +5266,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 			struct amdgpu_ring *ring = tmp_adev->rings[i];
 
-			if (!ring || !ring->sched.thread)
+			if (!ring || !drm_sched_wqueue_ready(&ring->sched))
 				continue;
 
 			drm_sched_stop(&ring->sched, job ? &job->base : NULL);
@@ -5341,7 +5341,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 			struct amdgpu_ring *ring = tmp_adev->rings[i];
 
-			if (!ring || !ring->sched.thread)
+			if (!ring || !drm_sched_wqueue_ready(&ring->sched))
 				continue;
 
 			drm_sched_start(&ring->sched, true);
@@ -5667,7 +5667,7 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
 		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 			struct amdgpu_ring *ring = adev->rings[i];
 
-			if (!ring || !ring->sched.thread)
+			if (!ring || !drm_sched_wqueue_ready(&ring->sched))
 				continue;
 
 			drm_sched_stop(&ring->sched, NULL);
@@ -5795,7 +5795,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !drm_sched_wqueue_ready(&ring->sched))
 			continue;
 
 		drm_sched_start(&ring->sched, true);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index fa527935ffd4..8fa9ce3746b6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -809,7 +809,8 @@ static void suspend_scheduler(struct msm_gpu *gpu)
 	 */
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
-		kthread_park(sched->thread);
+
+		drm_sched_wqueue_stop(sched);
 	}
 }
 
@@ -819,7 +820,8 @@ static void resume_scheduler(struct msm_gpu *gpu)
 
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
-		kthread_unpark(sched->thread);
+
+		drm_sched_wqueue_start(sched);
 	}
 }
 
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 5a3a622fc672..6f2f7dd4ba0a 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -439,7 +439,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 {
 	struct drm_sched_job *s_job, *tmp;
 
-	kthread_park(sched->thread);
+	drm_sched_wqueue_stop(sched);
 
 	/*
 	 * Reinsert back the bad job here - now it's safe as
@@ -552,7 +552,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 		spin_unlock(&sched->job_list_lock);
 	}
 
-	kthread_unpark(sched->thread);
+	drm_sched_wqueue_start(sched);
 }
 EXPORT_SYMBOL(drm_sched_start);
 
@@ -1206,3 +1206,38 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	}
 }
 EXPORT_SYMBOL(drm_sched_increase_karma);
+
+/**
+ * drm_sched_wqueue_ready - Is the scheduler ready for submission
+ *
+ * @sched: scheduler instance
+ *
+ * Returns true if submission is ready
+ */
+bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched)
+{
+	return !!sched->thread;
+}
+EXPORT_SYMBOL(drm_sched_wqueue_ready);
+
+/**
+ * drm_sched_wqueue_stop - stop scheduler submission
+ *
+ * @sched: scheduler instance
+ */
+void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
+{
+	kthread_park(sched->thread);
+}
+EXPORT_SYMBOL(drm_sched_wqueue_stop);
+
+/**
+ * drm_sched_wqueue_start - start scheduler submission
+ *
+ * @sched: scheduler instance
+ */
+void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
+{
+	kthread_unpark(sched->thread);
+}
+EXPORT_SYMBOL(drm_sched_wqueue_start);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index f9544d9b670d..38578fe74573 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -550,6 +550,9 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
+bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
+void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
+void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
 void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
-- 
2.34.1

