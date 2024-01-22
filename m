Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 364088362D2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 13:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC3810EE36;
	Mon, 22 Jan 2024 12:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4329310EE2F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 12:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705925392; x=1737461392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ODWxZvoM8QGWbbLTAa600KuAzPbC577RkHvAFz4IYjY=;
 b=VeB7odmo1ogVfvc2iiKSzQ6DWc+4/PJBteUDbYSmGLFcF16rsAVkVY3H
 QwzoUHG7YMIZ00JqgP4fyqr2HnKkg3bRzb0DwYcvc/E9D1Snr34O0Hnyr
 ixVYPBabfRNW83m0RjUxzX3pDm4igSAnzjM13EydnK9I7h8Tzhhw2r/Km
 VFUHOckmMnrJOq2eQLtGN5fVvhcsNm/++zKRrhXPb/mlvBhx3zLiYBRJP
 2ztTKu7OU/5juANuhyTRW3Wwzh5ebwDBC1hRnJWYG0GFiQRTitwY2Ft23
 fUcQeJ/Qr+D8niaboE935DTEG8bjRu3FL62pjUciAb9J3qrVL9Mp+Bfsi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="432353290"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="432353290"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 04:09:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="904834044"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="904834044"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 04:09:50 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] accel/ivpu: Improve stability of ivpu_submit_ioctl()
Date: Mon, 22 Jan 2024 13:09:44 +0100
Message-ID: <20240122120945.1150728-3-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122120945.1150728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240122120945.1150728-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Wake up the device as late as possible
- Remove job reference counting in order to simplify the code
- Don't put jobs that are not fully submitted on submitted_jobs_xa in
  order to avoid potential races with reset/recovery

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 139 +++++++++++++++-------------------
 drivers/accel/ivpu/ivpu_job.h |   1 -
 2 files changed, 62 insertions(+), 78 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 4fed0c05e051..d9b47a04b35f 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -125,7 +125,7 @@ void ivpu_cmdq_release_all_locked(struct ivpu_file_priv *file_priv)
 /*
  * Mark the doorbell as unregistered and reset job queue pointers.
  * This function needs to be called when the VPU hardware is restarted
- * and FW looses job queue state. The next time job queue is used it
+ * and FW loses job queue state. The next time job queue is used it
  * will be registered again.
  */
 static void ivpu_cmdq_reset_locked(struct ivpu_file_priv *file_priv, u16 engine)
@@ -239,60 +239,32 @@ static struct dma_fence *ivpu_fence_create(struct ivpu_device *vdev)
 	return &fence->base;
 }
 
-static void job_get(struct ivpu_job *job, struct ivpu_job **link)
+static void ivpu_job_destroy(struct ivpu_job *job)
 {
 	struct ivpu_device *vdev = job->vdev;
-
-	kref_get(&job->ref);
-	*link = job;
-
-	ivpu_dbg(vdev, KREF, "Job get: id %u refcount %u\n", job->job_id, kref_read(&job->ref));
-}
-
-static void job_release(struct kref *ref)
-{
-	struct ivpu_job *job = container_of(ref, struct ivpu_job, ref);
-	struct ivpu_device *vdev = job->vdev;
 	u32 i;
 
+	ivpu_dbg(vdev, JOB, "Job destroyed: id %3u ctx %2d engine %d",
+		 job->job_id, job->file_priv->ctx.id, job->engine_idx);
+
 	for (i = 0; i < job->bo_count; i++)
 		if (job->bos[i])
 			drm_gem_object_put(&job->bos[i]->base.base);
 
 	dma_fence_put(job->done_fence);
 	ivpu_file_priv_put(&job->file_priv);
-
-	ivpu_dbg(vdev, KREF, "Job released: id %u\n", job->job_id);
 	kfree(job);
-
-	/* Allow the VPU to get suspended, must be called after ivpu_file_priv_put() */
-	ivpu_rpm_put(vdev);
-}
-
-static void job_put(struct ivpu_job *job)
-{
-	struct ivpu_device *vdev = job->vdev;
-
-	ivpu_dbg(vdev, KREF, "Job put: id %u refcount %u\n", job->job_id, kref_read(&job->ref));
-	kref_put(&job->ref, job_release);
 }
 
 static struct ivpu_job *
-ivpu_create_job(struct ivpu_file_priv *file_priv, u32 engine_idx, u32 bo_count)
+ivpu_job_create(struct ivpu_file_priv *file_priv, u32 engine_idx, u32 bo_count)
 {
 	struct ivpu_device *vdev = file_priv->vdev;
 	struct ivpu_job *job;
-	int ret;
-
-	ret = ivpu_rpm_get(vdev);
-	if (ret < 0)
-		return NULL;
 
 	job = kzalloc(struct_size(job, bos, bo_count), GFP_KERNEL);
 	if (!job)
-		goto err_rpm_put;
-
-	kref_init(&job->ref);
+		return NULL;
 
 	job->vdev = vdev;
 	job->engine_idx = engine_idx;
@@ -306,17 +278,14 @@ ivpu_create_job(struct ivpu_file_priv *file_priv, u32 engine_idx, u32 bo_count)
 	job->file_priv = ivpu_file_priv_get(file_priv);
 
 	ivpu_dbg(vdev, JOB, "Job created: ctx %2d engine %d", file_priv->ctx.id, job->engine_idx);
-
 	return job;
 
 err_free_job:
 	kfree(job);
-err_rpm_put:
-	ivpu_rpm_put(vdev);
 	return NULL;
 }
 
-static int ivpu_job_done(struct ivpu_device *vdev, u32 job_id, u32 job_status)
+static int ivpu_job_signal_and_destroy(struct ivpu_device *vdev, u32 job_id, u32 job_status)
 {
 	struct ivpu_job *job;
 
@@ -333,9 +302,10 @@ static int ivpu_job_done(struct ivpu_device *vdev, u32 job_id, u32 job_status)
 	ivpu_dbg(vdev, JOB, "Job complete:  id %3u ctx %2d engine %d status 0x%x\n",
 		 job->job_id, job->file_priv->ctx.id, job->engine_idx, job_status);
 
+	ivpu_job_destroy(job);
 	ivpu_stop_job_timeout_detection(vdev);
 
-	job_put(job);
+	ivpu_rpm_put(vdev);
 	return 0;
 }
 
@@ -345,10 +315,10 @@ void ivpu_jobs_abort_all(struct ivpu_device *vdev)
 	unsigned long id;
 
 	xa_for_each(&vdev->submitted_jobs_xa, id, job)
-		ivpu_job_done(vdev, id, VPU_JSM_STATUS_ABORTED);
+		ivpu_job_signal_and_destroy(vdev, id, VPU_JSM_STATUS_ABORTED);
 }
 
-static int ivpu_direct_job_submission(struct ivpu_job *job)
+static int ivpu_job_submit(struct ivpu_job *job)
 {
 	struct ivpu_file_priv *file_priv = job->file_priv;
 	struct ivpu_device *vdev = job->vdev;
@@ -356,53 +326,65 @@ static int ivpu_direct_job_submission(struct ivpu_job *job)
 	struct ivpu_cmdq *cmdq;
 	int ret;
 
+	ret = ivpu_rpm_get(vdev);
+	if (ret < 0)
+		return ret;
+
 	mutex_lock(&file_priv->lock);
 
 	cmdq = ivpu_cmdq_acquire(job->file_priv, job->engine_idx);
 	if (!cmdq) {
-		ivpu_warn(vdev, "Failed get job queue, ctx %d engine %d\n",
-			  file_priv->ctx.id, job->engine_idx);
+		ivpu_warn_ratelimited(vdev, "Failed get job queue, ctx %d engine %d\n",
+				      file_priv->ctx.id, job->engine_idx);
 		ret = -EINVAL;
-		goto err_unlock;
+		goto err_unlock_file_priv;
 	}
 
 	job_id_range.min = FIELD_PREP(JOB_ID_CONTEXT_MASK, (file_priv->ctx.id - 1));
 	job_id_range.max = job_id_range.min | JOB_ID_JOB_MASK;
 
-	job_get(job, &job);
-	ret = xa_alloc(&vdev->submitted_jobs_xa, &job->job_id, job, job_id_range, GFP_KERNEL);
+	xa_lock(&vdev->submitted_jobs_xa);
+	ret = __xa_alloc(&vdev->submitted_jobs_xa, &job->job_id, job, job_id_range, GFP_KERNEL);
 	if (ret) {
-		ivpu_warn_ratelimited(vdev, "Failed to allocate job id: %d\n", ret);
-		goto err_job_put;
+		ivpu_dbg(vdev, JOB, "Too many active jobs in ctx %d\n",
+			 file_priv->ctx.id);
+		ret = -EBUSY;
+		goto err_unlock_submitted_jobs_xa;
 	}
 
 	ret = ivpu_cmdq_push_job(cmdq, job);
 	if (ret)
-		goto err_xa_erase;
+		goto err_erase_xa;
 
 	ivpu_start_job_timeout_detection(vdev);
 
-	ivpu_dbg(vdev, JOB, "Job submitted: id %3u addr 0x%llx ctx %2d engine %d next %d\n",
-		 job->job_id, job->cmd_buf_vpu_addr, file_priv->ctx.id,
-		 job->engine_idx, cmdq->jobq->header.tail);
-
-	if (ivpu_test_mode & IVPU_TEST_MODE_NULL_HW) {
-		ivpu_job_done(vdev, job->job_id, VPU_JSM_STATUS_SUCCESS);
+	if (unlikely(ivpu_test_mode & IVPU_TEST_MODE_NULL_HW)) {
 		cmdq->jobq->header.head = cmdq->jobq->header.tail;
 		wmb(); /* Flush WC buffer for jobq header */
 	} else {
 		ivpu_cmdq_ring_db(vdev, cmdq);
 	}
 
+	ivpu_dbg(vdev, JOB, "Job submitted: id %3u ctx %2d engine %d addr 0x%llx next %d\n",
+		 job->job_id, file_priv->ctx.id, job->engine_idx,
+		 job->cmd_buf_vpu_addr, cmdq->jobq->header.tail);
+
+	xa_unlock(&vdev->submitted_jobs_xa);
+
 	mutex_unlock(&file_priv->lock);
+
+	if (unlikely(ivpu_test_mode & IVPU_TEST_MODE_NULL_HW))
+		ivpu_job_signal_and_destroy(vdev, job->job_id, VPU_JSM_STATUS_SUCCESS);
+
 	return 0;
 
-err_xa_erase:
-	xa_erase(&vdev->submitted_jobs_xa, job->job_id);
-err_job_put:
-	job_put(job);
-err_unlock:
+err_erase_xa:
+	__xa_erase(&vdev->submitted_jobs_xa, job->job_id);
+err_unlock_submitted_jobs_xa:
+	xa_unlock(&vdev->submitted_jobs_xa);
+err_unlock_file_priv:
 	mutex_unlock(&file_priv->lock);
+	ivpu_rpm_put(vdev);
 	return ret;
 }
 
@@ -508,44 +490,47 @@ int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			     params->buffer_count * sizeof(u32));
 	if (ret) {
 		ret = -EFAULT;
-		goto free_handles;
+		goto err_free_handles;
 	}
 
 	if (!drm_dev_enter(&vdev->drm, &idx)) {
 		ret = -ENODEV;
-		goto free_handles;
+		goto err_free_handles;
 	}
 
 	ivpu_dbg(vdev, JOB, "Submit ioctl: ctx %u buf_count %u\n",
 		 file_priv->ctx.id, params->buffer_count);
 
-	job = ivpu_create_job(file_priv, params->engine, params->buffer_count);
+	job = ivpu_job_create(file_priv, params->engine, params->buffer_count);
 	if (!job) {
 		ivpu_err(vdev, "Failed to create job\n");
 		ret = -ENOMEM;
-		goto dev_exit;
+		goto err_exit_dev;
 	}
 
 	ret = ivpu_job_prepare_bos_for_submit(file, job, buf_handles, params->buffer_count,
 					      params->commands_offset);
 	if (ret) {
-		ivpu_err(vdev, "Failed to prepare job, ret %d\n", ret);
-		goto job_put;
+		ivpu_err(vdev, "Failed to prepare job: %d\n", ret);
+		goto err_destroy_job;
 	}
 
-	ret = ivpu_direct_job_submission(job);
-	if (ret) {
-		dma_fence_signal(job->done_fence);
-		ivpu_err(vdev, "Failed to submit job to the HW, ret %d\n", ret);
-	}
+	ret = ivpu_job_submit(job);
+	if (ret)
+		goto err_signal_fence;
 
-job_put:
-	job_put(job);
-dev_exit:
 	drm_dev_exit(idx);
-free_handles:
 	kfree(buf_handles);
+	return ret;
 
+err_signal_fence:
+	dma_fence_signal(job->done_fence);
+err_destroy_job:
+	ivpu_job_destroy(job);
+err_exit_dev:
+	drm_dev_exit(idx);
+err_free_handles:
+	kfree(buf_handles);
 	return ret;
 }
 
@@ -567,7 +552,7 @@ ivpu_job_done_callback(struct ivpu_device *vdev, struct ivpu_ipc_hdr *ipc_hdr,
 	}
 
 	payload = (struct vpu_ipc_msg_payload_job_done *)&jsm_msg->payload;
-	ret = ivpu_job_done(vdev, payload->job_id, payload->job_status);
+	ret = ivpu_job_signal_and_destroy(vdev, payload->job_id, payload->job_status);
 	if (!ret && !xa_empty(&vdev->submitted_jobs_xa))
 		ivpu_start_job_timeout_detection(vdev);
 }
diff --git a/drivers/accel/ivpu/ivpu_job.h b/drivers/accel/ivpu/ivpu_job.h
index bd22cf8e39e7..ca4984071cc7 100644
--- a/drivers/accel/ivpu/ivpu_job.h
+++ b/drivers/accel/ivpu/ivpu_job.h
@@ -43,7 +43,6 @@ struct ivpu_cmdq {
 			  will update the job status
  */
 struct ivpu_job {
-	struct kref ref;
 	struct ivpu_device *vdev;
 	struct ivpu_file_priv *file_priv;
 	struct dma_fence *done_fence;
-- 
2.43.0

