Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FC5BC371C
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 08:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F4410E75B;
	Wed,  8 Oct 2025 06:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MNq9i6yT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECF210E759
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 06:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759903984; x=1791439984;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y15NU+LEx+AXQ61gTqTXgINba6epVPUVIP/DB7OscHQ=;
 b=MNq9i6yTt9u3ahwRR4ce7xe/ehbj5HdvW47Z9oLTqRFjwSiMUbgM4Zsn
 SUN1AlIfSw9FrHJWEM7ewdK+OWdzg8+o7fRyi3iK6aUQaZl1UDZQM5bbT
 Slv75WMJYGtZn9SipUEc0naYwXUWLpzMD/L1Kp2v2lAWil6U+9FEAu0fp
 cd7pJvPf6ygEX10l32eNmfbv6W3IOhRCttxfuEIT/flcXhDyUj0RjjTIZ
 E8kmHxdp5ApvumCFq9JpOFxY638+Uuwuz/GP8vUpirlCZuM1J0PuyYEYr
 dIB9tJiPTlW8oJy2s2YNlSX1OIEKN9AbQjQ3HNs6U6/myQ+8aF7l2V1wK Q==;
X-CSE-ConnectionGUID: cH9Ulh3OSjq+7l6p3fn9ZQ==
X-CSE-MsgGUID: qY/vYfGCQTuY5GkMxUqw7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="62253519"
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="62253519"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 23:13:03 -0700
X-CSE-ConnectionGUID: aRy+jVF4TUWk5wLb9pDEZA==
X-CSE-MsgGUID: IsgsP7lwSiC+pCXfv8pbBg==
X-ExtLoop1: 1
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 23:13:01 -0700
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH v2] accel/ivpu: Return correct job error status
Date: Wed,  8 Oct 2025 08:12:55 +0200
Message-ID: <20251008061255.2909794-1-karol.wachowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>

The driver was returning ABORTED for all errors that trigger engine reset.
It is better to distinguish between different error types by returning
the actual error code reported by firmware. This allows userspace to
take different actions based on the error type and improves
debuggability.

Refactor ivpu_job_signal_and_destroy() by extracting engine error
handling logic into a new function ivpu_job_handle_engine_error().
This simplifies engine error handling logic by removing necessity of
calling ivpu_job_singal_and_destroy() multiple times by a single job
changing it's behavior based on job status.

Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
Changes between v1 and v2:
 Improved commit message describing that returning a single status code
 for all different errors was not desirable.
---
 drivers/accel/ivpu/ivpu_job.c | 49 ++++++++++++++++++++++++-----------
 drivers/accel/ivpu/ivpu_job.h |  3 +++
 2 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index fd548028f1d6..ba4535a75aa7 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -564,25 +564,26 @@ static struct ivpu_job *ivpu_job_remove_from_submitted_jobs(struct ivpu_device *
 	return job;
 }
 
-static int ivpu_job_signal_and_destroy(struct ivpu_device *vdev, u32 job_id, u32 job_status)
+bool ivpu_job_handle_engine_error(struct ivpu_device *vdev, u32 job_id, u32 job_status)
 {
-	struct ivpu_job *job;
-
 	lockdep_assert_held(&vdev->submitted_jobs_lock);
 
-	job = xa_load(&vdev->submitted_jobs_xa, job_id);
-	if (!job)
-		return -ENOENT;
-
 	switch (job_status) {
 	case VPU_JSM_STATUS_PROCESSING_ERR:
 	case VPU_JSM_STATUS_ENGINE_RESET_REQUIRED_MIN ... VPU_JSM_STATUS_ENGINE_RESET_REQUIRED_MAX:
 	{
+		struct ivpu_job *job = xa_load(&vdev->submitted_jobs_xa, job_id);
+
+		if (!job)
+			return false;
+
 		/* Trigger an engine reset */
 		guard(mutex)(&job->file_priv->lock);
 
+		job->job_status = job_status;
+
 		if (job->file_priv->has_mmu_faults)
-			return 0;
+			return false;
 
 		/*
 		 * Mark context as faulty and defer destruction of the job to jobs abort thread
@@ -591,26 +592,42 @@ static int ivpu_job_signal_and_destroy(struct ivpu_device *vdev, u32 job_id, u32
 		 */
 		job->file_priv->has_mmu_faults = true;
 		queue_work(system_wq, &vdev->context_abort_work);
-		return 0;
+		return true;
 	}
 	default:
 		/* Complete job with error status, engine reset not required */
 		break;
 	}
 
-	job = ivpu_job_remove_from_submitted_jobs(vdev, job_id);
+	return false;
+}
+
+static int ivpu_job_signal_and_destroy(struct ivpu_device *vdev, u32 job_id, u32 job_status)
+{
+	struct ivpu_job *job;
+
+	lockdep_assert_held(&vdev->submitted_jobs_lock);
+
+	job = xa_load(&vdev->submitted_jobs_xa, job_id);
 	if (!job)
 		return -ENOENT;
 
-	if (job->file_priv->has_mmu_faults)
-		job_status = DRM_IVPU_JOB_STATUS_ABORTED;
+	ivpu_job_remove_from_submitted_jobs(vdev, job_id);
+
+	if (job->job_status == VPU_JSM_STATUS_SUCCESS) {
+		if (job->file_priv->has_mmu_faults)
+			job->job_status = DRM_IVPU_JOB_STATUS_ABORTED;
+		else
+			job->job_status = job_status;
+	}
 
-	job->bos[CMD_BUF_IDX]->job_status = job_status;
+	job->bos[CMD_BUF_IDX]->job_status = job->job_status;
 	dma_fence_signal(job->done_fence);
 
 	trace_job("done", job);
 	ivpu_dbg(vdev, JOB, "Job complete:  id %3u ctx %2d cmdq_id %u engine %d status 0x%x\n",
-		 job->job_id, job->file_priv->ctx.id, job->cmdq_id, job->engine_idx, job_status);
+		 job->job_id, job->file_priv->ctx.id, job->cmdq_id, job->engine_idx,
+		 job->job_status);
 
 	ivpu_job_destroy(job);
 	ivpu_stop_job_timeout_detection(vdev);
@@ -1030,7 +1047,9 @@ ivpu_job_done_callback(struct ivpu_device *vdev, struct ivpu_ipc_hdr *ipc_hdr,
 	payload = (struct vpu_ipc_msg_payload_job_done *)&jsm_msg->payload;
 
 	mutex_lock(&vdev->submitted_jobs_lock);
-	ivpu_job_signal_and_destroy(vdev, payload->job_id, payload->job_status);
+	if (!ivpu_job_handle_engine_error(vdev, payload->job_id, payload->job_status))
+		/* No engine error, complete the job normally */
+		ivpu_job_signal_and_destroy(vdev, payload->job_id, payload->job_status);
 	mutex_unlock(&vdev->submitted_jobs_lock);
 }
 
diff --git a/drivers/accel/ivpu/ivpu_job.h b/drivers/accel/ivpu/ivpu_job.h
index d2fc4c151614..3ab61e6a5616 100644
--- a/drivers/accel/ivpu/ivpu_job.h
+++ b/drivers/accel/ivpu/ivpu_job.h
@@ -51,6 +51,7 @@ struct ivpu_cmdq {
  * @cmdq_id:             Command queue ID used for submission
  * @job_id:              Unique job ID for tracking and status reporting
  * @engine_idx:          Engine index for job execution
+ * @job_status:          Status reported by firmware for this job
  * @primary_preempt_buf: Primary preemption buffer for job
  * @secondary_preempt_buf: Secondary preemption buffer for job (optional)
  * @bo_count:            Number of buffer objects associated with this job
@@ -64,6 +65,7 @@ struct ivpu_job {
 	u32 cmdq_id;
 	u32 job_id;
 	u32 engine_idx;
+	u32 job_status;
 	struct ivpu_bo *primary_preempt_buf;
 	struct ivpu_bo *secondary_preempt_buf;
 	size_t bo_count;
@@ -83,6 +85,7 @@ void ivpu_cmdq_abort_all_jobs(struct ivpu_device *vdev, u32 ctx_id, u32 cmdq_id)
 
 void ivpu_job_done_consumer_init(struct ivpu_device *vdev);
 void ivpu_job_done_consumer_fini(struct ivpu_device *vdev);
+bool ivpu_job_handle_engine_error(struct ivpu_device *vdev, u32 job_id, u32 job_status);
 void ivpu_context_abort_work_fn(struct work_struct *work);
 
 void ivpu_jobs_abort_all(struct ivpu_device *vdev);
-- 
2.43.0

