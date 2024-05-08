Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78CC8BFE96
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 15:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99583112962;
	Wed,  8 May 2024 13:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVa194wu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8AF112932
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 13:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715174476; x=1746710476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rbaXBto9WKhp9DIzUGHOk9s1C2uJqhHmcaFrnC2Irz0=;
 b=IVa194wuuxf7EpDtX6/e5UhnbbdFBQDFJB6+EqWv8kw58duMhJfi3g2o
 mDqYBZytsK7PvQ5vmQvExsfgrkrRvrX3soW8olOjtrCmEsW0+piEzYATT
 7hPbqxizHE5kiAUYCpKPzk2XDPZhAc54l148K/ccI/8Kgz2qMmsDgw2xz
 np34HxN5xtslfoJxBlGVTFvvAIRNWV4musSA6seK4uhzv1NHghRVJLZTp
 D/DAsrPFzhFyyod9/LrYgqbsRm6rC4euGbQxkYh8DqnLziegGqT0Pu9wi
 v/wloO020dm1uZ+i1eWTEL0IdZjPxqNfi4E/MIyD4sDB1v93yOMRX48Di w==;
X-CSE-ConnectionGUID: 9cNFlD4+T+ummzu9+jBW+w==
X-CSE-MsgGUID: I8NiBId+Tl28N51ViISRhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="33540036"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33540036"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:21:16 -0700
X-CSE-ConnectionGUID: DCLg6zSDSC62knFtZC5Aew==
X-CSE-MsgGUID: olPIHnm/QAKK4q5/RdhhNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29289353"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:21:14 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 03/12] accel/ivpu: Create priority based command queues
Date: Wed,  8 May 2024 15:21:00 +0200
Message-ID: <20240508132106.2387464-4-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
References: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
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

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Create multiple command queues per engine with different priorities.
The cmdqs are created on-demand and they support 4 priority levels.
These priorities will later be used by the HWS (hardware scheduler).

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.h |  8 +++--
 drivers/accel/ivpu/ivpu_job.c | 61 +++++++++++++++++++++++------------
 2 files changed, 46 insertions(+), 23 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index a3993c93403a..2277718b31f7 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -39,7 +39,11 @@
 #define IVPU_MIN_DB 1
 #define IVPU_MAX_DB 255
 
-#define IVPU_NUM_ENGINES 2
+#define IVPU_NUM_ENGINES       2
+#define IVPU_NUM_PRIORITIES    4
+#define IVPU_NUM_CMDQS_PER_CTX (IVPU_NUM_ENGINES * IVPU_NUM_PRIORITIES)
+
+#define IVPU_CMDQ_INDEX(engine, priority) ((engine) * IVPU_NUM_PRIORITIES + (priority))
 
 #define IVPU_PLATFORM_SILICON 0
 #define IVPU_PLATFORM_SIMICS  2
@@ -149,7 +153,7 @@ struct ivpu_file_priv {
 	struct kref ref;
 	struct ivpu_device *vdev;
 	struct mutex lock; /* Protects cmdq */
-	struct ivpu_cmdq *cmdq[IVPU_NUM_ENGINES];
+	struct ivpu_cmdq *cmdq[IVPU_NUM_CMDQS_PER_CTX];
 	struct ivpu_mmu_context ctx;
 	bool has_mmu_faults;
 	bool bound;
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index a49bc9105ed0..b56035de1a59 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -79,10 +79,12 @@ static void ivpu_cmdq_free(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *c
 	kfree(cmdq);
 }
 
-static struct ivpu_cmdq *ivpu_cmdq_acquire(struct ivpu_file_priv *file_priv, u16 engine)
+static struct ivpu_cmdq *ivpu_cmdq_acquire(struct ivpu_file_priv *file_priv, u16 engine,
+					   u8 priority)
 {
+	int cmdq_idx = IVPU_CMDQ_INDEX(engine, priority);
+	struct ivpu_cmdq *cmdq = file_priv->cmdq[cmdq_idx];
 	struct ivpu_device *vdev = file_priv->vdev;
-	struct ivpu_cmdq *cmdq = file_priv->cmdq[engine];
 	int ret;
 
 	lockdep_assert_held(&file_priv->lock);
@@ -91,7 +93,7 @@ static struct ivpu_cmdq *ivpu_cmdq_acquire(struct ivpu_file_priv *file_priv, u16
 		cmdq = ivpu_cmdq_alloc(file_priv, engine);
 		if (!cmdq)
 			return NULL;
-		file_priv->cmdq[engine] = cmdq;
+		file_priv->cmdq[cmdq_idx] = cmdq;
 	}
 
 	if (cmdq->db_registered)
@@ -107,14 +109,15 @@ static struct ivpu_cmdq *ivpu_cmdq_acquire(struct ivpu_file_priv *file_priv, u16
 	return cmdq;
 }
 
-static void ivpu_cmdq_release_locked(struct ivpu_file_priv *file_priv, u16 engine)
+static void ivpu_cmdq_release_locked(struct ivpu_file_priv *file_priv, u16 engine, u8 priority)
 {
-	struct ivpu_cmdq *cmdq = file_priv->cmdq[engine];
+	int cmdq_idx = IVPU_CMDQ_INDEX(engine, priority);
+	struct ivpu_cmdq *cmdq = file_priv->cmdq[cmdq_idx];
 
 	lockdep_assert_held(&file_priv->lock);
 
 	if (cmdq) {
-		file_priv->cmdq[engine] = NULL;
+		file_priv->cmdq[cmdq_idx] = NULL;
 		if (cmdq->db_registered)
 			ivpu_jsm_unregister_db(file_priv->vdev, cmdq->db_id);
 
@@ -124,12 +127,14 @@ static void ivpu_cmdq_release_locked(struct ivpu_file_priv *file_priv, u16 engin
 
 void ivpu_cmdq_release_all_locked(struct ivpu_file_priv *file_priv)
 {
-	int i;
+	u16 engine;
+	u8 priority;
 
 	lockdep_assert_held(&file_priv->lock);
 
-	for (i = 0; i < IVPU_NUM_ENGINES; i++)
-		ivpu_cmdq_release_locked(file_priv, i);
+	for (engine = 0; engine < IVPU_NUM_ENGINES; engine++)
+		for (priority = 0; priority < IVPU_NUM_PRIORITIES; priority++)
+			ivpu_cmdq_release_locked(file_priv, engine, priority);
 }
 
 /*
@@ -138,9 +143,10 @@ void ivpu_cmdq_release_all_locked(struct ivpu_file_priv *file_priv)
  * and FW loses job queue state. The next time job queue is used it
  * will be registered again.
  */
-static void ivpu_cmdq_reset_locked(struct ivpu_file_priv *file_priv, u16 engine)
+static void ivpu_cmdq_reset_locked(struct ivpu_file_priv *file_priv, u16 engine, u8 priority)
 {
-	struct ivpu_cmdq *cmdq = file_priv->cmdq[engine];
+	int cmdq_idx = IVPU_CMDQ_INDEX(engine, priority);
+	struct ivpu_cmdq *cmdq = file_priv->cmdq[cmdq_idx];
 
 	lockdep_assert_held(&file_priv->lock);
 
@@ -154,12 +160,14 @@ static void ivpu_cmdq_reset_locked(struct ivpu_file_priv *file_priv, u16 engine)
 
 static void ivpu_cmdq_reset_all(struct ivpu_file_priv *file_priv)
 {
-	int i;
+	u16 engine;
+	u8 priority;
 
 	mutex_lock(&file_priv->lock);
 
-	for (i = 0; i < IVPU_NUM_ENGINES; i++)
-		ivpu_cmdq_reset_locked(file_priv, i);
+	for (engine = 0; engine < IVPU_NUM_ENGINES; engine++)
+		for (priority = 0; priority < IVPU_NUM_PRIORITIES; priority++)
+			ivpu_cmdq_reset_locked(file_priv, engine, priority);
 
 	mutex_unlock(&file_priv->lock);
 }
@@ -328,7 +336,7 @@ void ivpu_jobs_abort_all(struct ivpu_device *vdev)
 		ivpu_job_signal_and_destroy(vdev, id, DRM_IVPU_JOB_STATUS_ABORTED);
 }
 
-static int ivpu_job_submit(struct ivpu_job *job)
+static int ivpu_job_submit(struct ivpu_job *job, u8 priority)
 {
 	struct ivpu_file_priv *file_priv = job->file_priv;
 	struct ivpu_device *vdev = job->vdev;
@@ -342,10 +350,10 @@ static int ivpu_job_submit(struct ivpu_job *job)
 
 	mutex_lock(&file_priv->lock);
 
-	cmdq = ivpu_cmdq_acquire(job->file_priv, job->engine_idx);
+	cmdq = ivpu_cmdq_acquire(job->file_priv, job->engine_idx, priority);
 	if (!cmdq) {
-		ivpu_warn_ratelimited(vdev, "Failed get job queue, ctx %d engine %d\n",
-				      file_priv->ctx.id, job->engine_idx);
+		ivpu_warn_ratelimited(vdev, "Failed to get job queue, ctx %d engine %d prio %d\n",
+				      file_priv->ctx.id, job->engine_idx, priority);
 		ret = -EINVAL;
 		goto err_unlock_file_priv;
 	}
@@ -375,8 +383,8 @@ static int ivpu_job_submit(struct ivpu_job *job)
 		ivpu_cmdq_ring_db(vdev, cmdq);
 	}
 
-	ivpu_dbg(vdev, JOB, "Job submitted: id %3u ctx %2d engine %d addr 0x%llx next %d\n",
-		 job->job_id, file_priv->ctx.id, job->engine_idx,
+	ivpu_dbg(vdev, JOB, "Job submitted: id %3u ctx %2d engine %d prio %d addr 0x%llx next %d\n",
+		 job->job_id, file_priv->ctx.id, job->engine_idx, priority,
 		 job->cmd_buf_vpu_addr, cmdq->jobq->header.tail);
 
 	xa_unlock(&vdev->submitted_jobs_xa);
@@ -464,6 +472,14 @@ ivpu_job_prepare_bos_for_submit(struct drm_file *file, struct ivpu_job *job, u32
 	return ret;
 }
 
+static inline u8 ivpu_job_to_hws_priority(struct ivpu_file_priv *file_priv, u8 priority)
+{
+	if (priority == DRM_IVPU_JOB_PRIORITY_DEFAULT)
+		return DRM_IVPU_JOB_PRIORITY_NORMAL;
+
+	return priority - 1;
+}
+
 int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct ivpu_file_priv *file_priv = file->driver_priv;
@@ -472,6 +488,7 @@ int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct ivpu_job *job;
 	u32 *buf_handles;
 	int idx, ret;
+	u8 priority;
 
 	if (params->engine > DRM_IVPU_ENGINE_COPY)
 		return -EINVAL;
@@ -525,8 +542,10 @@ int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_destroy_job;
 	}
 
+	priority = ivpu_job_to_hws_priority(file_priv, params->priority);
+
 	down_read(&vdev->pm->reset_lock);
-	ret = ivpu_job_submit(job);
+	ret = ivpu_job_submit(job, priority);
 	up_read(&vdev->pm->reset_lock);
 	if (ret)
 		goto err_signal_fence;
-- 
2.43.2

