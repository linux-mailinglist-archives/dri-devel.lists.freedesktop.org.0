Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC9C9A25C7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 16:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE6910E859;
	Thu, 17 Oct 2024 14:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Umnt3ZqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6FC10E856
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 14:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729177114; x=1760713114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=60Xi2HLQBUSzibzFXeSI7fAGMAk5A0iUGW/hY/Cs1iY=;
 b=Umnt3ZqTxSbwgVu2rroF4Rmrf3MTSR2oU55YX/rp194qtNsf5x0fyqOz
 A4xOZ2xkHm8BhzUITRpEPBGPgF5LA/h0X0dkF0X2fo9RWw3NSjzEdTI6A
 L0QEi90hvBNc0Fpoo6y+WUJHzjjV715eIPk6SHAcqUnTFnDw/6pWsmEck
 hMY5m2McVaaJDrrr45v01OaEKL4K/2c3U0+5y8L2wvCj4Fr/OIagMs3oq
 imZ5L+VCYmIJjf7EAfQDcXpdb4CdCMlty0JyiWf2Ieom4UDa87rqVn/X7
 0x6USU4XzqhFG6k+CL95AIDqEJEzS/fkYfyKkxV+UhJGWg4fGWLbhaGr+ A==;
X-CSE-ConnectionGUID: lxqpA403QR6u3VBMyQhYNA==
X-CSE-MsgGUID: RJ8bTkgxTdWQ9zawKHsiMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39790350"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39790350"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:34 -0700
X-CSE-ConnectionGUID: 28g20RpfRru0aq7sUvp/0g==
X-CSE-MsgGUID: kaZR8SueTRGp2KuI7yYdaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="109374543"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:32 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 07/11] accel/ivpu: Make command queue ID allocated on XArray
Date: Thu, 17 Oct 2024 16:58:13 +0200
Message-ID: <20241017145817.121590-8-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
References: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Use XArray for dynamic command queue ID allocations instead of fixed
ones. This is required by upcoming changes to UAPI that will allow to
manage command queues by user space instead of having predefined number
of queues in a context.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c |  6 +++
 drivers/accel/ivpu/ivpu_drv.h |  7 ++-
 drivers/accel/ivpu/ivpu_job.c | 91 ++++++++++++++++++-----------------
 drivers/accel/ivpu/ivpu_job.h |  2 +
 4 files changed, 60 insertions(+), 46 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 383e3eb988983..f5a8d93fe2a57 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -104,6 +104,8 @@ static void file_priv_release(struct kref *ref)
 	pm_runtime_get_sync(vdev->drm.dev);
 	mutex_lock(&vdev->context_list_lock);
 	file_priv_unbind(vdev, file_priv);
+	drm_WARN_ON(&vdev->drm, !xa_empty(&file_priv->cmdq_xa));
+	xa_destroy(&file_priv->cmdq_xa);
 	mutex_unlock(&vdev->context_list_lock);
 	pm_runtime_put_autosuspend(vdev->drm.dev);
 
@@ -259,6 +261,10 @@ static int ivpu_open(struct drm_device *dev, struct drm_file *file)
 	file_priv->job_limit.min = FIELD_PREP(IVPU_JOB_ID_CONTEXT_MASK, (file_priv->ctx.id - 1));
 	file_priv->job_limit.max = file_priv->job_limit.min | IVPU_JOB_ID_JOB_MASK;
 
+	xa_init_flags(&file_priv->cmdq_xa, XA_FLAGS_ALLOC1);
+	file_priv->cmdq_limit.min = IVPU_CMDQ_MIN_ID;
+	file_priv->cmdq_limit.max = IVPU_CMDQ_MAX_ID;
+
 	mutex_unlock(&vdev->context_list_lock);
 	drm_dev_exit(idx);
 
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 6774402821706..8e79d78906bfe 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -52,6 +52,9 @@
 #define IVPU_NUM_PRIORITIES    4
 #define IVPU_NUM_CMDQS_PER_CTX (IVPU_NUM_PRIORITIES)
 
+#define IVPU_CMDQ_MIN_ID 1
+#define IVPU_CMDQ_MAX_ID 255
+
 #define IVPU_PLATFORM_SILICON 0
 #define IVPU_PLATFORM_SIMICS  2
 #define IVPU_PLATFORM_FPGA    3
@@ -168,13 +171,15 @@ struct ivpu_file_priv {
 	struct kref ref;
 	struct ivpu_device *vdev;
 	struct mutex lock; /* Protects cmdq */
-	struct ivpu_cmdq *cmdq[IVPU_NUM_CMDQS_PER_CTX];
+	struct xarray cmdq_xa;
 	struct ivpu_mmu_context ctx;
 	struct mutex ms_lock; /* Protects ms_instance_list, ms_info_bo */
 	struct list_head ms_instance_list;
 	struct ivpu_bo *ms_info_bo;
 	struct xa_limit job_limit;
 	u32 job_id_next;
+	struct xa_limit cmdq_limit;
+	u32 cmdq_id_next;
 	bool has_mmu_faults;
 	bool bound;
 	bool aborted;
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 9154c2e14245f..82a57a30244d3 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -89,9 +89,16 @@ static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv)
 		goto err_free_cmdq;
 	}
 
+	ret = xa_alloc_cyclic(&file_priv->cmdq_xa, &cmdq->id, cmdq, file_priv->cmdq_limit,
+			      &file_priv->cmdq_id_next, GFP_KERNEL);
+	if (ret < 0) {
+		ivpu_err(vdev, "Failed to allocate command queue id: %d\n", ret);
+		goto err_erase_db_xa;
+	}
+
 	cmdq->mem = ivpu_bo_create_global(vdev, SZ_4K, DRM_IVPU_BO_WC | DRM_IVPU_BO_MAPPABLE);
 	if (!cmdq->mem)
-		goto err_erase_xa;
+		goto err_erase_cmdq_xa;
 
 	ret = ivpu_preemption_buffers_create(vdev, file_priv, cmdq);
 	if (ret)
@@ -99,7 +106,9 @@ static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv)
 
 	return cmdq;
 
-err_erase_xa:
+err_erase_cmdq_xa:
+	xa_erase(&file_priv->cmdq_xa, cmdq->id);
+err_erase_db_xa:
 	xa_erase(&vdev->db_xa, cmdq->db_id);
 err_free_cmdq:
 	kfree(cmdq);
@@ -123,13 +132,13 @@ static int ivpu_hws_cmdq_init(struct ivpu_file_priv *file_priv, struct ivpu_cmdq
 	struct ivpu_device *vdev = file_priv->vdev;
 	int ret;
 
-	ret = ivpu_jsm_hws_create_cmdq(vdev, file_priv->ctx.id, file_priv->ctx.id, cmdq->db_id,
+	ret = ivpu_jsm_hws_create_cmdq(vdev, file_priv->ctx.id, file_priv->ctx.id, cmdq->id,
 				       task_pid_nr(current), engine,
 				       cmdq->mem->vpu_addr, ivpu_bo_size(cmdq->mem));
 	if (ret)
 		return ret;
 
-	ret = ivpu_jsm_hws_set_context_sched_properties(vdev, file_priv->ctx.id, cmdq->db_id,
+	ret = ivpu_jsm_hws_set_context_sched_properties(vdev, file_priv->ctx.id, cmdq->id,
 							priority);
 	if (ret)
 		return ret;
@@ -143,20 +152,21 @@ static int ivpu_register_db(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *
 	int ret;
 
 	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW)
-		ret = ivpu_jsm_hws_register_db(vdev, file_priv->ctx.id, cmdq->db_id, cmdq->db_id,
+		ret = ivpu_jsm_hws_register_db(vdev, file_priv->ctx.id, cmdq->id, cmdq->db_id,
 					       cmdq->mem->vpu_addr, ivpu_bo_size(cmdq->mem));
 	else
 		ret = ivpu_jsm_register_db(vdev, file_priv->ctx.id, cmdq->db_id,
 					   cmdq->mem->vpu_addr, ivpu_bo_size(cmdq->mem));
 
 	if (!ret)
-		ivpu_dbg(vdev, JOB, "DB %d registered to ctx %d\n", cmdq->db_id, file_priv->ctx.id);
+		ivpu_dbg(vdev, JOB, "DB %d registered to cmdq %d ctx %d\n",
+			 cmdq->db_id, cmdq->id, file_priv->ctx.id);
 
 	return ret;
 }
 
 static int
-ivpu_cmdq_init(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq, u16 engine, u8 priority)
+ivpu_cmdq_init(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq, u8 priority)
 {
 	struct ivpu_device *vdev = file_priv->vdev;
 	struct vpu_job_queue_header *jobq_header;
@@ -172,7 +182,7 @@ ivpu_cmdq_init(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq, u16 eng
 
 	cmdq->jobq = (struct vpu_job_queue *)ivpu_bo_vaddr(cmdq->mem);
 	jobq_header = &cmdq->jobq->header;
-	jobq_header->engine_idx = engine;
+	jobq_header->engine_idx = VPU_ENGINE_COMPUTE;
 	jobq_header->head = 0;
 	jobq_header->tail = 0;
 	if (ivpu_test_mode & IVPU_TEST_MODE_TURBO) {
@@ -183,7 +193,7 @@ ivpu_cmdq_init(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq, u16 eng
 	wmb(); /* Flush WC buffer for jobq->header */
 
 	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW) {
-		ret = ivpu_hws_cmdq_init(file_priv, cmdq, engine, priority);
+		ret = ivpu_hws_cmdq_init(file_priv, cmdq, VPU_ENGINE_COMPUTE, priority);
 		if (ret)
 			return ret;
 	}
@@ -210,9 +220,9 @@ static int ivpu_cmdq_fini(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cm
 	cmdq->db_registered = false;
 
 	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW) {
-		ret = ivpu_jsm_hws_destroy_cmdq(vdev, file_priv->ctx.id, cmdq->db_id);
+		ret = ivpu_jsm_hws_destroy_cmdq(vdev, file_priv->ctx.id, cmdq->id);
 		if (!ret)
-			ivpu_dbg(vdev, JOB, "Command queue %d destroyed\n", cmdq->db_id);
+			ivpu_dbg(vdev, JOB, "Command queue %d destroyed\n", cmdq->id);
 	}
 
 	ret = ivpu_jsm_unregister_db(vdev, cmdq->db_id);
@@ -222,51 +232,46 @@ static int ivpu_cmdq_fini(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cm
 	return 0;
 }
 
-static struct ivpu_cmdq *ivpu_cmdq_acquire(struct ivpu_file_priv *file_priv, u16 engine,
-					   u8 priority)
+static struct ivpu_cmdq *ivpu_cmdq_acquire(struct ivpu_file_priv *file_priv, u8 priority)
 {
-	struct ivpu_cmdq *cmdq = file_priv->cmdq[priority];
+	struct ivpu_cmdq *cmdq;
+	unsigned long cmdq_id;
 	int ret;
 
 	lockdep_assert_held(&file_priv->lock);
 
+	xa_for_each(&file_priv->cmdq_xa, cmdq_id, cmdq)
+		if (cmdq->priority == priority)
+			break;
+
 	if (!cmdq) {
 		cmdq = ivpu_cmdq_alloc(file_priv);
 		if (!cmdq)
 			return NULL;
-		file_priv->cmdq[priority] = cmdq;
+		cmdq->priority = priority;
 	}
 
-	ret = ivpu_cmdq_init(file_priv, cmdq, engine, priority);
+	ret = ivpu_cmdq_init(file_priv, cmdq, priority);
 	if (ret)
 		return NULL;
 
 	return cmdq;
 }
 
-static void ivpu_cmdq_release_locked(struct ivpu_file_priv *file_priv, u8 priority)
+void ivpu_cmdq_release_all_locked(struct ivpu_file_priv *file_priv)
 {
-	struct ivpu_cmdq *cmdq = file_priv->cmdq[priority];
+	struct ivpu_cmdq *cmdq;
+	unsigned long cmdq_id;
 
 	lockdep_assert_held(&file_priv->lock);
 
-	if (cmdq) {
-		file_priv->cmdq[priority] = NULL;
+	xa_for_each(&file_priv->cmdq_xa, cmdq_id, cmdq) {
+		xa_erase(&file_priv->cmdq_xa, cmdq_id);
 		ivpu_cmdq_fini(file_priv, cmdq);
 		ivpu_cmdq_free(file_priv, cmdq);
 	}
 }
 
-void ivpu_cmdq_release_all_locked(struct ivpu_file_priv *file_priv)
-{
-	u8 priority;
-
-	lockdep_assert_held(&file_priv->lock);
-
-	for (priority = 0; priority < IVPU_NUM_PRIORITIES; priority++)
-		ivpu_cmdq_release_locked(file_priv, priority);
-}
-
 /*
  * Mark the doorbell as unregistered
  * This function needs to be called when the VPU hardware is restarted
@@ -275,16 +280,13 @@ void ivpu_cmdq_release_all_locked(struct ivpu_file_priv *file_priv)
  */
 static void ivpu_cmdq_reset(struct ivpu_file_priv *file_priv)
 {
-	u8 priority;
+	struct ivpu_cmdq *cmdq;
+	unsigned long cmdq_id;
 
 	mutex_lock(&file_priv->lock);
 
-	for (priority = 0; priority < IVPU_NUM_PRIORITIES; priority++) {
-		struct ivpu_cmdq *cmdq = file_priv->cmdq[priority];
-
-		if (cmdq)
-			cmdq->db_registered = false;
-	}
+	xa_for_each(&file_priv->cmdq_xa, cmdq_id, cmdq)
+		cmdq->db_registered = false;
 
 	mutex_unlock(&file_priv->lock);
 }
@@ -304,12 +306,11 @@ void ivpu_cmdq_reset_all_contexts(struct ivpu_device *vdev)
 
 static void ivpu_cmdq_fini_all(struct ivpu_file_priv *file_priv)
 {
-	u8 priority;
+	struct ivpu_cmdq *cmdq;
+	unsigned long cmdq_id;
 
-	for (priority = 0; priority < IVPU_NUM_PRIORITIES; priority++) {
-		if (file_priv->cmdq[priority])
-			ivpu_cmdq_fini(file_priv, file_priv->cmdq[priority]);
-	}
+	xa_for_each(&file_priv->cmdq_xa, cmdq_id, cmdq)
+		ivpu_cmdq_fini(file_priv, cmdq);
 }
 
 void ivpu_context_abort_locked(struct ivpu_file_priv *file_priv)
@@ -334,8 +335,8 @@ static int ivpu_cmdq_push_job(struct ivpu_cmdq *cmdq, struct ivpu_job *job)
 
 	/* Check if there is space left in job queue */
 	if (next_entry == header->head) {
-		ivpu_dbg(vdev, JOB, "Job queue full: ctx %d engine %d db %d head %d tail %d\n",
-			 job->file_priv->ctx.id, job->engine_idx, cmdq->db_id, header->head, tail);
+		ivpu_dbg(vdev, JOB, "Job queue full: ctx %d cmdq %d db %d head %d tail %d\n",
+			 job->file_priv->ctx.id, cmdq->id, cmdq->db_id, header->head, tail);
 		return -EBUSY;
 	}
 
@@ -522,7 +523,7 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority)
 
 	mutex_lock(&file_priv->lock);
 
-	cmdq = ivpu_cmdq_acquire(file_priv, job->engine_idx, priority);
+	cmdq = ivpu_cmdq_acquire(file_priv, priority);
 	if (!cmdq) {
 		ivpu_warn_ratelimited(vdev, "Failed to get job queue, ctx %d engine %d prio %d\n",
 				      file_priv->ctx.id, job->engine_idx, priority);
diff --git a/drivers/accel/ivpu/ivpu_job.h b/drivers/accel/ivpu/ivpu_job.h
index 6accb94028c7a..8b19e3f8b4cfb 100644
--- a/drivers/accel/ivpu/ivpu_job.h
+++ b/drivers/accel/ivpu/ivpu_job.h
@@ -28,8 +28,10 @@ struct ivpu_cmdq {
 	struct ivpu_bo *secondary_preempt_buf;
 	struct ivpu_bo *mem;
 	u32 entry_count;
+	u32 id;
 	u32 db_id;
 	bool db_registered;
+	u8 priority;
 };
 
 /**
-- 
2.45.1

