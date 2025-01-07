Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4654CA0421E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:22:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA85110E6F1;
	Tue,  7 Jan 2025 14:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZvELwux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED95110E6F1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736259753; x=1767795753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P0yB0j2VoTKpHq5isI5auP3Xy9H5auQKgT29vvJeMa4=;
 b=LZvELwuxRk2D20Oucn4AD2khOoKbaA83QU6wnFNJtqmNV2NiffxHRn5P
 9LjJfQkol13xLQg4cznh3HQiozBZC3IFcx4UyjhDAAFnCzaDyz9JWLJIS
 72ajlFtzxhtgiDn1PNbC7PST1qtU45JXYqZUV1v/sDzayGWLbjZ6cF8nr
 ximNJfxpYYm8kG3wVqc5SU0Ff90MT/sZJDacoNvrKvSR1UuWlm11jBACF
 4o/JabOWlv9Ebdw3/7dfqN2C0/lL43YVWUA7o2yt/QFUJTG9EjE3gsx2N
 Qk+Qx/ODTO0bsCeg5gR8/Qarwy1pRqAwY8RBGiB6/6LcTQDN+5Scw60k+ g==;
X-CSE-ConnectionGUID: 7+k9J/YbTGuo99SvS8XS3Q==
X-CSE-MsgGUID: bIgRx5IOTDGiBs3N+IkqSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36324425"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36324425"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:32 -0800
X-CSE-ConnectionGUID: sG7xWJnJTXmsn3GsSkvMCg==
X-CSE-MsgGUID: thG6Ng3YSPywet8KPsOgoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103635410"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:31 -0800
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH 02/14] accel/ivpu: Add API for command queue
 create/destroy/submit
Date: Tue,  7 Jan 2025 18:32:25 +0100
Message-ID: <20250107173238.381120-3-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
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

Implement support for explicit command queue management.
To allow more flexible control over command queues add capabilities
to create, destroy and submit jobs to specific command queues.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c |   6 +
 drivers/accel/ivpu/ivpu_job.c | 369 +++++++++++++++++++++-------------
 drivers/accel/ivpu/ivpu_job.h |   5 +-
 include/uapi/drm/ivpu_accel.h |  84 ++++++++
 4 files changed, 319 insertions(+), 145 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 1e8ffbe25eee..f4171536640b 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -137,6 +137,9 @@ static int ivpu_get_capabilities(struct ivpu_device *vdev, struct drm_ivpu_param
 	case DRM_IVPU_CAP_DMA_MEMORY_RANGE:
 		args->value = 1;
 		break;
+	case DRM_IVPU_CAP_MANAGE_CMDQ:
+		args->value = 1;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -310,6 +313,9 @@ static const struct drm_ioctl_desc ivpu_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(IVPU_METRIC_STREAMER_GET_DATA, ivpu_ms_get_data_ioctl, 0),
 	DRM_IOCTL_DEF_DRV(IVPU_METRIC_STREAMER_STOP, ivpu_ms_stop_ioctl, 0),
 	DRM_IOCTL_DEF_DRV(IVPU_METRIC_STREAMER_GET_INFO, ivpu_ms_get_info_ioctl, 0),
+	DRM_IOCTL_DEF_DRV(IVPU_CMDQ_CREATE, ivpu_cmdq_create_ioctl, 0),
+	DRM_IOCTL_DEF_DRV(IVPU_CMDQ_DESTROY, ivpu_cmdq_destroy_ioctl, 0),
+	DRM_IOCTL_DEF_DRV(IVPU_CMDQ_SUBMIT, ivpu_cmdq_submit_ioctl, 0),
 };
 
 static int ivpu_wait_for_ready(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 98e53cb38ecd..43507d3aea51 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -100,15 +100,43 @@ static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv)
 
 static void ivpu_cmdq_free(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq)
 {
-	if (!cmdq)
-		return;
-
 	ivpu_preemption_buffers_free(file_priv->vdev, file_priv, cmdq);
 	ivpu_bo_free(cmdq->mem);
-	xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
 	kfree(cmdq);
 }
 
+static struct ivpu_cmdq *ivpu_cmdq_create(struct ivpu_file_priv *file_priv, u8 priority,
+					  bool is_legacy)
+{
+	struct ivpu_device *vdev = file_priv->vdev;
+	struct ivpu_cmdq *cmdq = NULL;
+	int ret;
+
+	lockdep_assert_held(&file_priv->lock);
+
+	cmdq = ivpu_cmdq_alloc(file_priv);
+	if (!cmdq) {
+		ivpu_err(vdev, "Failed to allocate command queue\n");
+		return NULL;
+	}
+
+	cmdq->priority = priority;
+	cmdq->is_legacy = is_legacy;
+
+	ret = xa_alloc_cyclic(&file_priv->cmdq_xa, &cmdq->id, cmdq, file_priv->cmdq_limit,
+			      &file_priv->cmdq_id_next, GFP_KERNEL);
+	if (ret < 0) {
+		ivpu_err(vdev, "Failed to allocate command queue ID: %d\n", ret);
+		goto err_free_cmdq;
+	}
+
+	return cmdq;
+
+err_free_cmdq:
+	ivpu_cmdq_free(file_priv, cmdq);
+	return NULL;
+}
+
 static int ivpu_hws_cmdq_init(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq, u16 engine,
 			      u8 priority)
 {
@@ -134,6 +162,13 @@ static int ivpu_register_db(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *
 	struct ivpu_device *vdev = file_priv->vdev;
 	int ret;
 
+	ret = xa_alloc_cyclic(&vdev->db_xa, &cmdq->db_id, NULL, vdev->db_limit, &vdev->db_next,
+			      GFP_KERNEL);
+	if (ret < 0) {
+		ivpu_err(vdev, "Failed to allocate doorbell ID: %d\n", ret);
+		return ret;
+	}
+
 	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW)
 		ret = ivpu_jsm_hws_register_db(vdev, file_priv->ctx.id, cmdq->id, cmdq->db_id,
 					       cmdq->mem->vpu_addr, ivpu_bo_size(cmdq->mem));
@@ -142,41 +177,52 @@ static int ivpu_register_db(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *
 					   cmdq->mem->vpu_addr, ivpu_bo_size(cmdq->mem));
 
 	if (!ret)
-		ivpu_dbg(vdev, JOB, "DB %d registered to cmdq %d ctx %d\n",
-			 cmdq->db_id, cmdq->id, file_priv->ctx.id);
+		ivpu_dbg(vdev, JOB, "DB %d registered to cmdq %d ctx %d priority %d\n",
+			 cmdq->db_id, cmdq->id, file_priv->ctx.id, cmdq->priority);
+	else
+		xa_erase(&vdev->db_xa, cmdq->db_id);
 
 	return ret;
 }
 
-static int
-ivpu_cmdq_init(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq, u8 priority)
+static void ivpu_cmdq_jobq_init(struct ivpu_device *vdev, struct vpu_job_queue *jobq)
+{
+	jobq->header.engine_idx = VPU_ENGINE_COMPUTE;
+	jobq->header.head = 0;
+	jobq->header.tail = 0;
+
+	if (ivpu_test_mode & IVPU_TEST_MODE_TURBO) {
+		ivpu_dbg(vdev, JOB, "Turbo mode enabled");
+		jobq->header.flags = VPU_JOB_QUEUE_FLAGS_TURBO_MODE;
+	}
+
+	wmb(); /* Flush WC buffer for jobq->header */
+}
+
+static inline u32 ivpu_cmdq_get_entry_count(struct ivpu_cmdq *cmdq)
+{
+	size_t size = ivpu_bo_size(cmdq->mem) - sizeof(struct vpu_job_queue_header);
+
+	return size / sizeof(struct vpu_job_queue_entry);
+}
+
+static int ivpu_cmdq_register(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq)
 {
 	struct ivpu_device *vdev = file_priv->vdev;
-	struct vpu_job_queue_header *jobq_header;
 	int ret;
 
 	lockdep_assert_held(&file_priv->lock);
 
-	if (cmdq->db_registered)
+	if (cmdq->db_id)
 		return 0;
 
-	cmdq->entry_count = (u32)((ivpu_bo_size(cmdq->mem) - sizeof(struct vpu_job_queue_header)) /
-				  sizeof(struct vpu_job_queue_entry));
-
+	cmdq->entry_count = ivpu_cmdq_get_entry_count(cmdq);
 	cmdq->jobq = (struct vpu_job_queue *)ivpu_bo_vaddr(cmdq->mem);
-	jobq_header = &cmdq->jobq->header;
-	jobq_header->engine_idx = VPU_ENGINE_COMPUTE;
-	jobq_header->head = 0;
-	jobq_header->tail = 0;
-	if (ivpu_test_mode & IVPU_TEST_MODE_TURBO) {
-		ivpu_dbg(vdev, JOB, "Turbo mode enabled");
-		jobq_header->flags = VPU_JOB_QUEUE_FLAGS_TURBO_MODE;
-	}
 
-	wmb(); /* Flush WC buffer for jobq->header */
+	ivpu_cmdq_jobq_init(vdev, cmdq->jobq);
 
 	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW) {
-		ret = ivpu_hws_cmdq_init(file_priv, cmdq, VPU_ENGINE_COMPUTE, priority);
+		ret = ivpu_hws_cmdq_init(file_priv, cmdq, VPU_ENGINE_COMPUTE, cmdq->priority);
 		if (ret)
 			return ret;
 	}
@@ -185,23 +231,19 @@ ivpu_cmdq_init(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq, u8 prio
 	if (ret)
 		return ret;
 
-	cmdq->db_registered = true;
-
 	return 0;
 }
 
-static int ivpu_cmdq_fini(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq)
+static int ivpu_cmdq_unregister(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq)
 {
 	struct ivpu_device *vdev = file_priv->vdev;
 	int ret;
 
 	lockdep_assert_held(&file_priv->lock);
 
-	if (!cmdq->db_registered)
+	if (!cmdq->db_id)
 		return 0;
 
-	cmdq->db_registered = false;
-
 	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW) {
 		ret = ivpu_jsm_hws_destroy_cmdq(vdev, file_priv->ctx.id, cmdq->id);
 		if (!ret)
@@ -212,91 +254,61 @@ static int ivpu_cmdq_fini(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cm
 	if (!ret)
 		ivpu_dbg(vdev, JOB, "DB %d unregistered\n", cmdq->db_id);
 
+	xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
+	cmdq->db_id = 0;
+
 	return 0;
 }
 
-static int ivpu_db_id_alloc(struct ivpu_device *vdev, u32 *db_id)
+static inline u8 ivpu_job_to_jsm_priority(u8 priority)
 {
-	int ret;
-	u32 id;
-
-	ret = xa_alloc_cyclic(&vdev->db_xa, &id, NULL, vdev->db_limit, &vdev->db_next, GFP_KERNEL);
-	if (ret < 0)
-		return ret;
+	if (priority == DRM_IVPU_JOB_PRIORITY_DEFAULT)
+		return VPU_JOB_SCHEDULING_PRIORITY_BAND_NORMAL;
 
-	*db_id = id;
-	return 0;
+	return priority - 1;
 }
 
-static int ivpu_cmdq_id_alloc(struct ivpu_file_priv *file_priv, u32 *cmdq_id)
+static void ivpu_cmdq_destroy(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq)
 {
-	int ret;
-	u32 id;
-
-	ret = xa_alloc_cyclic(&file_priv->cmdq_xa, &id, NULL, file_priv->cmdq_limit,
-			      &file_priv->cmdq_id_next, GFP_KERNEL);
-	if (ret < 0)
-		return ret;
-
-	*cmdq_id = id;
-	return 0;
+	ivpu_cmdq_unregister(file_priv, cmdq);
+	xa_erase(&file_priv->cmdq_xa, cmdq->id);
+	ivpu_cmdq_free(file_priv, cmdq);
 }
 
-static struct ivpu_cmdq *ivpu_cmdq_acquire(struct ivpu_file_priv *file_priv, u8 priority)
+static struct ivpu_cmdq *ivpu_cmdq_acquire_legacy(struct ivpu_file_priv *file_priv, u8 priority)
 {
-	struct ivpu_device *vdev = file_priv->vdev;
 	struct ivpu_cmdq *cmdq;
 	unsigned long id;
-	int ret;
 
 	lockdep_assert_held(&file_priv->lock);
 
 	xa_for_each(&file_priv->cmdq_xa, id, cmdq)
-		if (cmdq->priority == priority)
+		if (cmdq->is_legacy && cmdq->priority == priority)
 			break;
 
 	if (!cmdq) {
-		cmdq = ivpu_cmdq_alloc(file_priv);
-		if (!cmdq) {
-			ivpu_err(vdev, "Failed to allocate command queue\n");
+		cmdq = ivpu_cmdq_create(file_priv, priority, true);
+		if (!cmdq)
 			return NULL;
-		}
+	}
 
-		ret = ivpu_db_id_alloc(vdev, &cmdq->db_id);
-		if (ret) {
-			ivpu_err(file_priv->vdev, "Failed to allocate doorbell ID: %d\n", ret);
-			goto err_free_cmdq;
-		}
+	return cmdq;
+}
 
-		ret = ivpu_cmdq_id_alloc(file_priv, &cmdq->id);
-		if (ret) {
-			ivpu_err(vdev, "Failed to allocate command queue ID: %d\n", ret);
-			goto err_erase_db_id;
-		}
+static struct ivpu_cmdq *ivpu_cmdq_acquire(struct ivpu_file_priv *file_priv, u32 cmdq_id)
+{
+	struct ivpu_device *vdev = file_priv->vdev;
+	struct ivpu_cmdq *cmdq;
 
-		cmdq->priority = priority;
-		ret = xa_err(xa_store(&file_priv->cmdq_xa, cmdq->id, cmdq, GFP_KERNEL));
-		if (ret) {
-			ivpu_err(vdev, "Failed to store command queue in cmdq_xa: %d\n", ret);
-			goto err_erase_cmdq_id;
-		}
-	}
+	lockdep_assert_held(&file_priv->lock);
 
-	ret = ivpu_cmdq_init(file_priv, cmdq, priority);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize command queue: %d\n", ret);
-		goto err_free_cmdq;
+	cmdq = xa_load(&file_priv->cmdq_xa, cmdq_id);
+	if (!cmdq) {
+		ivpu_err(vdev, "Failed to find command queue with ID: %u\n", cmdq_id);
+		return NULL;
 	}
 
 	return cmdq;
-
-err_erase_cmdq_id:
-	xa_erase(&file_priv->cmdq_xa, cmdq->id);
-err_erase_db_id:
-	xa_erase(&vdev->db_xa, cmdq->db_id);
-err_free_cmdq:
-	ivpu_cmdq_free(file_priv, cmdq);
-	return NULL;
 }
 
 void ivpu_cmdq_release_all_locked(struct ivpu_file_priv *file_priv)
@@ -306,11 +318,8 @@ void ivpu_cmdq_release_all_locked(struct ivpu_file_priv *file_priv)
 
 	lockdep_assert_held(&file_priv->lock);
 
-	xa_for_each(&file_priv->cmdq_xa, cmdq_id, cmdq) {
-		xa_erase(&file_priv->cmdq_xa, cmdq_id);
-		ivpu_cmdq_fini(file_priv, cmdq);
-		ivpu_cmdq_free(file_priv, cmdq);
-	}
+	xa_for_each(&file_priv->cmdq_xa, cmdq_id, cmdq)
+		ivpu_cmdq_destroy(file_priv, cmdq);
 }
 
 /*
@@ -326,8 +335,10 @@ static void ivpu_cmdq_reset(struct ivpu_file_priv *file_priv)
 
 	mutex_lock(&file_priv->lock);
 
-	xa_for_each(&file_priv->cmdq_xa, cmdq_id, cmdq)
-		cmdq->db_registered = false;
+	xa_for_each(&file_priv->cmdq_xa, cmdq_id, cmdq) {
+		xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
+		cmdq->db_id = 0;
+	}
 
 	mutex_unlock(&file_priv->lock);
 }
@@ -345,13 +356,13 @@ void ivpu_cmdq_reset_all_contexts(struct ivpu_device *vdev)
 	mutex_unlock(&vdev->context_list_lock);
 }
 
-static void ivpu_cmdq_fini_all(struct ivpu_file_priv *file_priv)
+static void ivpu_cmdq_unregister_all(struct ivpu_file_priv *file_priv)
 {
 	struct ivpu_cmdq *cmdq;
 	unsigned long cmdq_id;
 
 	xa_for_each(&file_priv->cmdq_xa, cmdq_id, cmdq)
-		ivpu_cmdq_fini(file_priv, cmdq);
+		ivpu_cmdq_unregister(file_priv, cmdq);
 }
 
 void ivpu_context_abort_locked(struct ivpu_file_priv *file_priv)
@@ -360,7 +371,7 @@ void ivpu_context_abort_locked(struct ivpu_file_priv *file_priv)
 
 	lockdep_assert_held(&file_priv->lock);
 
-	ivpu_cmdq_fini_all(file_priv);
+	ivpu_cmdq_unregister_all(file_priv);
 
 	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_OS)
 		ivpu_jsm_context_release(vdev, file_priv->ctx.id);
@@ -549,7 +560,7 @@ void ivpu_jobs_abort_all(struct ivpu_device *vdev)
 		ivpu_job_signal_and_destroy(vdev, id, DRM_IVPU_JOB_STATUS_ABORTED);
 }
 
-static int ivpu_job_submit(struct ivpu_job *job, u8 priority)
+static int ivpu_job_submit(struct ivpu_job *job, u8 priority, u32 cmdq_id)
 {
 	struct ivpu_file_priv *file_priv = job->file_priv;
 	struct ivpu_device *vdev = job->vdev;
@@ -563,14 +574,22 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority)
 
 	mutex_lock(&file_priv->lock);
 
-	cmdq = ivpu_cmdq_acquire(file_priv, priority);
+	if (cmdq_id == 0)
+		cmdq = ivpu_cmdq_acquire_legacy(file_priv, priority);
+	else
+		cmdq = ivpu_cmdq_acquire(file_priv, cmdq_id);
 	if (!cmdq) {
-		ivpu_warn_ratelimited(vdev, "Failed to get job queue, ctx %d engine %d prio %d\n",
-				      file_priv->ctx.id, job->engine_idx, priority);
+		ivpu_warn_ratelimited(vdev, "Failed to get job queue, ctx %d\n", file_priv->ctx.id);
 		ret = -EINVAL;
 		goto err_unlock_file_priv;
 	}
 
+	ret = ivpu_cmdq_register(file_priv, cmdq);
+	if (ret) {
+		ivpu_err(vdev, "Failed to register command queue: %d\n", ret);
+		goto err_unlock_file_priv;
+	}
+
 	xa_lock(&vdev->submitted_jobs_xa);
 	is_first_job = xa_empty(&vdev->submitted_jobs_xa);
 	ret = __xa_alloc_cyclic(&vdev->submitted_jobs_xa, &job->job_id, job, file_priv->job_limit,
@@ -599,7 +618,7 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority)
 
 	trace_job("submit", job);
 	ivpu_dbg(vdev, JOB, "Job submitted: id %3u ctx %2d engine %d prio %d addr 0x%llx next %d\n",
-		 job->job_id, file_priv->ctx.id, job->engine_idx, priority,
+		 job->job_id, file_priv->ctx.id, job->engine_idx, cmdq->priority,
 		 job->cmd_buf_vpu_addr, cmdq->jobq->header.tail);
 
 	xa_unlock(&vdev->submitted_jobs_xa);
@@ -625,7 +644,7 @@ static int
 ivpu_job_prepare_bos_for_submit(struct drm_file *file, struct ivpu_job *job, u32 *buf_handles,
 				u32 buf_count, u32 commands_offset)
 {
-	struct ivpu_file_priv *file_priv = file->driver_priv;
+	struct ivpu_file_priv *file_priv = job->file_priv;
 	struct ivpu_device *vdev = file_priv->vdev;
 	struct ww_acquire_ctx acquire_ctx;
 	enum dma_resv_usage usage;
@@ -687,49 +706,20 @@ ivpu_job_prepare_bos_for_submit(struct drm_file *file, struct ivpu_job *job, u32
 	return ret;
 }
 
-static inline u8 ivpu_job_to_hws_priority(struct ivpu_file_priv *file_priv, u8 priority)
+static int ivpu_submit(struct drm_file *file, struct ivpu_file_priv *file_priv, u32 cmdq_id,
+		       u32 buffer_count, u32 engine, void __user *buffers_ptr, u32 cmds_offset,
+		       u8 priority)
 {
-	if (priority == DRM_IVPU_JOB_PRIORITY_DEFAULT)
-		return DRM_IVPU_JOB_PRIORITY_NORMAL;
-
-	return priority - 1;
-}
-
-int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
-{
-	struct ivpu_file_priv *file_priv = file->driver_priv;
 	struct ivpu_device *vdev = file_priv->vdev;
-	struct drm_ivpu_submit *params = data;
 	struct ivpu_job *job;
 	u32 *buf_handles;
 	int idx, ret;
-	u8 priority;
-
-	if (params->engine != DRM_IVPU_ENGINE_COMPUTE)
-		return -EINVAL;
-
-	if (params->priority > DRM_IVPU_JOB_PRIORITY_REALTIME)
-		return -EINVAL;
-
-	if (params->buffer_count == 0 || params->buffer_count > JOB_MAX_BUFFER_COUNT)
-		return -EINVAL;
-
-	if (!IS_ALIGNED(params->commands_offset, 8))
-		return -EINVAL;
 
-	if (!file_priv->ctx.id)
-		return -EINVAL;
-
-	if (file_priv->has_mmu_faults)
-		return -EBADFD;
-
-	buf_handles = kcalloc(params->buffer_count, sizeof(u32), GFP_KERNEL);
+	buf_handles = kcalloc(buffer_count, sizeof(u32), GFP_KERNEL);
 	if (!buf_handles)
 		return -ENOMEM;
 
-	ret = copy_from_user(buf_handles,
-			     (void __user *)params->buffers_ptr,
-			     params->buffer_count * sizeof(u32));
+	ret = copy_from_user(buf_handles, buffers_ptr, buffer_count * sizeof(u32));
 	if (ret) {
 		ret = -EFAULT;
 		goto err_free_handles;
@@ -740,27 +730,23 @@ int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_free_handles;
 	}
 
-	ivpu_dbg(vdev, JOB, "Submit ioctl: ctx %u buf_count %u\n",
-		 file_priv->ctx.id, params->buffer_count);
+	ivpu_dbg(vdev, JOB, "Submit ioctl: ctx %u buf_count %u\n", file_priv->ctx.id, buffer_count);
 
-	job = ivpu_job_create(file_priv, params->engine, params->buffer_count);
+	job = ivpu_job_create(file_priv, engine, buffer_count);
 	if (!job) {
 		ivpu_err(vdev, "Failed to create job\n");
 		ret = -ENOMEM;
 		goto err_exit_dev;
 	}
 
-	ret = ivpu_job_prepare_bos_for_submit(file, job, buf_handles, params->buffer_count,
-					      params->commands_offset);
+	ret = ivpu_job_prepare_bos_for_submit(file, job, buf_handles, buffer_count, cmds_offset);
 	if (ret) {
 		ivpu_err(vdev, "Failed to prepare job: %d\n", ret);
 		goto err_destroy_job;
 	}
 
-	priority = ivpu_job_to_hws_priority(file_priv, params->priority);
-
 	down_read(&vdev->pm->reset_lock);
-	ret = ivpu_job_submit(job, priority);
+	ret = ivpu_job_submit(job, priority, cmdq_id);
 	up_read(&vdev->pm->reset_lock);
 	if (ret)
 		goto err_signal_fence;
@@ -780,6 +766,101 @@ int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	return ret;
 }
 
+int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct ivpu_file_priv *file_priv = file->driver_priv;
+	struct drm_ivpu_submit *args = data;
+	u8 priority;
+
+	if (args->engine != DRM_IVPU_ENGINE_COMPUTE)
+		return -EINVAL;
+
+	if (args->priority > DRM_IVPU_JOB_PRIORITY_REALTIME)
+		return -EINVAL;
+
+	if (args->buffer_count == 0 || args->buffer_count > JOB_MAX_BUFFER_COUNT)
+		return -EINVAL;
+
+	if (!IS_ALIGNED(args->commands_offset, 8))
+		return -EINVAL;
+
+	if (!file_priv->ctx.id)
+		return -EINVAL;
+
+	if (file_priv->has_mmu_faults)
+		return -EBADFD;
+
+	priority = ivpu_job_to_jsm_priority(args->priority);
+
+	return ivpu_submit(file, file_priv, 0, args->buffer_count, args->engine,
+			   (void __user *)args->buffers_ptr, args->commands_offset, priority);
+}
+
+int ivpu_cmdq_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct ivpu_file_priv *file_priv = file->driver_priv;
+	struct drm_ivpu_cmdq_submit *args = data;
+
+	if (args->cmdq_id < IVPU_CMDQ_MIN_ID || args->cmdq_id > IVPU_CMDQ_MAX_ID)
+		return -EINVAL;
+
+	if (args->buffer_count == 0 || args->buffer_count > JOB_MAX_BUFFER_COUNT)
+		return -EINVAL;
+
+	if (!IS_ALIGNED(args->commands_offset, 8))
+		return -EINVAL;
+
+	if (!file_priv->ctx.id)
+		return -EINVAL;
+
+	if (file_priv->has_mmu_faults)
+		return -EBADFD;
+
+	return ivpu_submit(file, file_priv, args->cmdq_id, args->buffer_count, VPU_ENGINE_COMPUTE,
+			   (void __user *)args->buffers_ptr, args->commands_offset, 0);
+}
+
+int ivpu_cmdq_create_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct ivpu_file_priv *file_priv = file->driver_priv;
+	struct drm_ivpu_cmdq_create *args = data;
+	struct ivpu_cmdq *cmdq;
+
+	if (args->priority > DRM_IVPU_JOB_PRIORITY_REALTIME)
+		return -EINVAL;
+
+	mutex_lock(&file_priv->lock);
+
+	cmdq = ivpu_cmdq_create(file_priv, ivpu_job_to_jsm_priority(args->priority), false);
+	if (cmdq)
+		args->cmdq_id = cmdq->id;
+
+	mutex_unlock(&file_priv->lock);
+
+	return cmdq ? 0 : -ENOMEM;
+}
+
+int ivpu_cmdq_destroy_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct ivpu_file_priv *file_priv = file->driver_priv;
+	struct drm_ivpu_cmdq_destroy *args = data;
+	struct ivpu_cmdq *cmdq;
+	int ret = 0;
+
+	mutex_lock(&file_priv->lock);
+
+	cmdq = xa_load(&file_priv->cmdq_xa, args->cmdq_id);
+	if (!cmdq || cmdq->is_legacy) {
+		ret = -ENOENT;
+		goto unlock;
+	}
+
+	ivpu_cmdq_destroy(file_priv, cmdq);
+unlock:
+	mutex_unlock(&file_priv->lock);
+	return ret;
+}
+
 static void
 ivpu_job_done_callback(struct ivpu_device *vdev, struct ivpu_ipc_hdr *ipc_hdr,
 		       struct vpu_jsm_msg *jsm_msg)
diff --git a/drivers/accel/ivpu/ivpu_job.h b/drivers/accel/ivpu/ivpu_job.h
index 8b19e3f8b4cf..4d31277bcc41 100644
--- a/drivers/accel/ivpu/ivpu_job.h
+++ b/drivers/accel/ivpu/ivpu_job.h
@@ -30,8 +30,8 @@ struct ivpu_cmdq {
 	u32 entry_count;
 	u32 id;
 	u32 db_id;
-	bool db_registered;
 	u8 priority;
+	bool is_legacy;
 };
 
 /**
@@ -58,6 +58,9 @@ struct ivpu_job {
 };
 
 int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+int ivpu_cmdq_create_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+int ivpu_cmdq_destroy_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+int ivpu_cmdq_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
 
 void ivpu_context_abort_locked(struct ivpu_file_priv *file_priv);
 
diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
index a35b97b097bf..746c43bd3eb6 100644
--- a/include/uapi/drm/ivpu_accel.h
+++ b/include/uapi/drm/ivpu_accel.h
@@ -22,6 +22,9 @@ extern "C" {
 #define DRM_IVPU_METRIC_STREAMER_STOP	  0x08
 #define DRM_IVPU_METRIC_STREAMER_GET_DATA 0x09
 #define DRM_IVPU_METRIC_STREAMER_GET_INFO 0x0a
+#define DRM_IVPU_CMDQ_CREATE              0x0b
+#define DRM_IVPU_CMDQ_DESTROY             0x0c
+#define DRM_IVPU_CMDQ_SUBMIT              0x0d
 
 #define DRM_IOCTL_IVPU_GET_PARAM                                               \
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_IVPU_GET_PARAM, struct drm_ivpu_param)
@@ -57,6 +60,15 @@ extern "C" {
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_IVPU_METRIC_STREAMER_GET_INFO,         \
 		 struct drm_ivpu_metric_streamer_get_data)
 
+#define DRM_IOCTL_IVPU_CMDQ_CREATE                                             \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_IVPU_CMDQ_CREATE, struct drm_ivpu_cmdq_create)
+
+#define DRM_IOCTL_IVPU_CMDQ_DESTROY                                            \
+	DRM_IOW(DRM_COMMAND_BASE + DRM_IVPU_CMDQ_DESTROY, struct drm_ivpu_cmdq_destroy)
+
+#define DRM_IOCTL_IVPU_CMDQ_SUBMIT                                             \
+	DRM_IOW(DRM_COMMAND_BASE + DRM_IVPU_CMDQ_SUBMIT, struct drm_ivpu_cmdq_submit)
+
 /**
  * DOC: contexts
  *
@@ -107,6 +119,13 @@ extern "C" {
  * accessible by hardware DMA.
  */
 #define DRM_IVPU_CAP_DMA_MEMORY_RANGE	2
+/**
+ * DRM_IVPU_CAP_MANAGE_CMDQ
+ *
+ * Driver supports explicit command queue operations like command queue create,
+ * command queue destroy and submit job on specific command queue.
+ */
+#define DRM_IVPU_CAP_MANAGE_CMDQ       3
 
 /**
  * struct drm_ivpu_param - Get/Set VPU parameters
@@ -316,6 +335,44 @@ struct drm_ivpu_submit {
 	__u32 priority;
 };
 
+/**
+ * struct drm_ivpu_cmdq_submit - Submit commands to the VPU using explicit command queue
+ *
+ * Execute a single command buffer on a given command queue.
+ * Handles to all referenced buffer objects have to be provided in @buffers_ptr.
+ *
+ * User space may wait on job completion using %DRM_IVPU_BO_WAIT ioctl.
+ */
+struct drm_ivpu_cmdq_submit {
+	/**
+	 * @buffers_ptr:
+	 *
+	 * A pointer to an u32 array of GEM handles of the BOs required for this job.
+	 * The number of elements in the array must be equal to the value given by @buffer_count.
+	 *
+	 * The first BO is the command buffer. The rest of array has to contain all
+	 * BOs referenced from the command buffer.
+	 */
+	__u64 buffers_ptr;
+
+	/** @buffer_count: Number of elements in the @buffers_ptr */
+	__u32 buffer_count;
+
+	/** @cmdq_id: ID for the command queue where job will be submitted */
+	__u32 cmdq_id;
+
+	/** @flags: Reserved for future use - must be zero */
+	__u32 flags;
+
+	/**
+	 * @commands_offset:
+	 *
+	 * Offset inside the first buffer in @buffers_ptr containing commands
+	 * to be executed. The offset has to be 8-byte aligned.
+	 */
+	__u32 commands_offset;
+};
+
 /* drm_ivpu_bo_wait job status codes */
 #define DRM_IVPU_JOB_STATUS_SUCCESS 0
 #define DRM_IVPU_JOB_STATUS_ABORTED 256
@@ -388,6 +445,33 @@ struct drm_ivpu_metric_streamer_get_data {
 	__u64 data_size;
 };
 
+/**
+ * struct drm_ivpu_cmdq_create - Create command queue for job submission
+ */
+struct drm_ivpu_cmdq_create {
+	/** @cmdq_id: Returned ID of created command queue */
+	__u32 cmdq_id;
+	/**
+	 * @priority:
+	 *
+	 * Priority to be set for related job command queue, can be one of the following:
+	 * %DRM_IVPU_JOB_PRIORITY_DEFAULT
+	 * %DRM_IVPU_JOB_PRIORITY_IDLE
+	 * %DRM_IVPU_JOB_PRIORITY_NORMAL
+	 * %DRM_IVPU_JOB_PRIORITY_FOCUS
+	 * %DRM_IVPU_JOB_PRIORITY_REALTIME
+	 */
+	__u32 priority;
+};
+
+/**
+ * struct drm_ivpu_cmdq_destroy - Destroy a command queue
+ */
+struct drm_ivpu_cmdq_destroy {
+	/** @cmdq_id: ID of command queue to destroy */
+	__u32 cmdq_id;
+};
+
 /**
  * struct drm_ivpu_metric_streamer_stop - Stop collecting metric data
  */
-- 
2.43.0

