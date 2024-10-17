Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E59A9A25C0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 16:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C6010E854;
	Thu, 17 Oct 2024 14:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXMivsfl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C3110E348
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 14:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729177107; x=1760713107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L+bTp4KQs4/ZNa04Z84SMK9EfUPitue85mL3ScVeD4M=;
 b=HXMivsflOEbpmZ1IpLptSLdfFTi6ScnxgOKfvrTr5m2/HPFJUDolptm0
 7/ZFIEn8yCxtBH8XYtI1ZTGhR5yYLZ1L12vqwoCz5iRg/GHo5RLavyTks
 ngxaUKGFX/qIMu5ePCZUNkSEEXi4OtQWcpGLyV5C9fRDKuoEcgsNV4XKU
 2FofHnO5tK7NmUbiqHCdWJXHXPQSXpih+vTUor3RaGIjq1W7XoWJ5TU4l
 FQYsthVri8gZCh0GRgOTrnA0BoKKmVWqdFgGbMvJeyKNMvu31Qh+T5NJR
 aLQspbPZtFALkE+9T4do19alEAyJsXEPpM8LZs6ynsQuEn1znWjRpeRsJ g==;
X-CSE-ConnectionGUID: zueEKH2DQOyO/0+ci17k9w==
X-CSE-MsgGUID: Lwbe7Y4FTF6lGXeNNbZfHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39790328"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39790328"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:26 -0700
X-CSE-ConnectionGUID: Xmq1W+F3TfeFa/y/wvjTPA==
X-CSE-MsgGUID: ju7f9ORSRrC9XeFbtJZo7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="109374503"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:25 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 03/11] accel/ivpu: Remove copy engine support
Date: Thu, 17 Oct 2024 16:58:09 +0200
Message-ID: <20241017145817.121590-4-jacek.lawrynowicz@linux.intel.com>
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

From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>

Copy engine was deprecated by the FW and is no longer supported.
Compute engine includes all copy engine functionality and should be used
instead.

This change does not affect user space as the copy engine was never
used outside of a couple of tests.

Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.h     |  5 +---
 drivers/accel/ivpu/ivpu_job.c     | 43 +++++++++++--------------------
 drivers/accel/ivpu/ivpu_jsm_msg.c |  8 +++---
 include/uapi/drm/ivpu_accel.h     |  6 +----
 4 files changed, 21 insertions(+), 41 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index f905021ac1748..5b4f5104b4708 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -49,11 +49,8 @@
 #define IVPU_JOB_ID_JOB_MASK		GENMASK(7, 0)
 #define IVPU_JOB_ID_CONTEXT_MASK	GENMASK(31, 8)
 
-#define IVPU_NUM_ENGINES       2
 #define IVPU_NUM_PRIORITIES    4
-#define IVPU_NUM_CMDQS_PER_CTX (IVPU_NUM_ENGINES * IVPU_NUM_PRIORITIES)
-
-#define IVPU_CMDQ_INDEX(engine, priority) ((engine) * IVPU_NUM_PRIORITIES + (priority))
+#define IVPU_NUM_CMDQS_PER_CTX (IVPU_NUM_PRIORITIES)
 
 #define IVPU_PLATFORM_SILICON 0
 #define IVPU_PLATFORM_SIMICS  2
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 98e0b7b614071..f580959e87787 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -247,8 +247,7 @@ static int ivpu_cmdq_fini(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cm
 static struct ivpu_cmdq *ivpu_cmdq_acquire(struct ivpu_file_priv *file_priv, u16 engine,
 					   u8 priority)
 {
-	int cmdq_idx = IVPU_CMDQ_INDEX(engine, priority);
-	struct ivpu_cmdq *cmdq = file_priv->cmdq[cmdq_idx];
+	struct ivpu_cmdq *cmdq = file_priv->cmdq[priority];
 	int ret;
 
 	lockdep_assert_held(&file_priv->lock);
@@ -257,7 +256,7 @@ static struct ivpu_cmdq *ivpu_cmdq_acquire(struct ivpu_file_priv *file_priv, u16
 		cmdq = ivpu_cmdq_alloc(file_priv);
 		if (!cmdq)
 			return NULL;
-		file_priv->cmdq[cmdq_idx] = cmdq;
+		file_priv->cmdq[priority] = cmdq;
 	}
 
 	ret = ivpu_cmdq_init(file_priv, cmdq, engine, priority);
@@ -267,15 +266,14 @@ static struct ivpu_cmdq *ivpu_cmdq_acquire(struct ivpu_file_priv *file_priv, u16
 	return cmdq;
 }
 
-static void ivpu_cmdq_release_locked(struct ivpu_file_priv *file_priv, u16 engine, u8 priority)
+static void ivpu_cmdq_release_locked(struct ivpu_file_priv *file_priv, u8 priority)
 {
-	int cmdq_idx = IVPU_CMDQ_INDEX(engine, priority);
-	struct ivpu_cmdq *cmdq = file_priv->cmdq[cmdq_idx];
+	struct ivpu_cmdq *cmdq = file_priv->cmdq[priority];
 
 	lockdep_assert_held(&file_priv->lock);
 
 	if (cmdq) {
-		file_priv->cmdq[cmdq_idx] = NULL;
+		file_priv->cmdq[priority] = NULL;
 		ivpu_cmdq_fini(file_priv, cmdq);
 		ivpu_cmdq_free(file_priv, cmdq);
 	}
@@ -283,14 +281,12 @@ static void ivpu_cmdq_release_locked(struct ivpu_file_priv *file_priv, u16 engin
 
 void ivpu_cmdq_release_all_locked(struct ivpu_file_priv *file_priv)
 {
-	u16 engine;
 	u8 priority;
 
 	lockdep_assert_held(&file_priv->lock);
 
-	for (engine = 0; engine < IVPU_NUM_ENGINES; engine++)
-		for (priority = 0; priority < IVPU_NUM_PRIORITIES; priority++)
-			ivpu_cmdq_release_locked(file_priv, engine, priority);
+	for (priority = 0; priority < IVPU_NUM_PRIORITIES; priority++)
+		ivpu_cmdq_release_locked(file_priv, priority);
 }
 
 /*
@@ -301,19 +297,15 @@ void ivpu_cmdq_release_all_locked(struct ivpu_file_priv *file_priv)
  */
 static void ivpu_cmdq_reset(struct ivpu_file_priv *file_priv)
 {
-	u16 engine;
 	u8 priority;
 
 	mutex_lock(&file_priv->lock);
 
-	for (engine = 0; engine < IVPU_NUM_ENGINES; engine++) {
-		for (priority = 0; priority < IVPU_NUM_PRIORITIES; priority++) {
-			int cmdq_idx = IVPU_CMDQ_INDEX(engine, priority);
-			struct ivpu_cmdq *cmdq = file_priv->cmdq[cmdq_idx];
+	for (priority = 0; priority < IVPU_NUM_PRIORITIES; priority++) {
+		struct ivpu_cmdq *cmdq = file_priv->cmdq[priority];
 
-			if (cmdq)
-				cmdq->db_registered = false;
-		}
+		if (cmdq)
+			cmdq->db_registered = false;
 	}
 
 	mutex_unlock(&file_priv->lock);
@@ -334,16 +326,11 @@ void ivpu_cmdq_reset_all_contexts(struct ivpu_device *vdev)
 
 static void ivpu_cmdq_fini_all(struct ivpu_file_priv *file_priv)
 {
-	u16 engine;
 	u8 priority;
 
-	for (engine = 0; engine < IVPU_NUM_ENGINES; engine++) {
-		for (priority = 0; priority < IVPU_NUM_PRIORITIES; priority++) {
-			int cmdq_idx = IVPU_CMDQ_INDEX(engine, priority);
-
-			if (file_priv->cmdq[cmdq_idx])
-				ivpu_cmdq_fini(file_priv, file_priv->cmdq[cmdq_idx]);
-		}
+	for (priority = 0; priority < IVPU_NUM_PRIORITIES; priority++) {
+		if (file_priv->cmdq[priority])
+			ivpu_cmdq_fini(file_priv, file_priv->cmdq[priority]);
 	}
 }
 
@@ -699,7 +686,7 @@ int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	int idx, ret;
 	u8 priority;
 
-	if (params->engine > DRM_IVPU_ENGINE_COPY)
+	if (params->engine != DRM_IVPU_ENGINE_COMPUTE)
 		return -EINVAL;
 
 	if (params->priority > DRM_IVPU_JOB_PRIORITY_REALTIME)
diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.c b/drivers/accel/ivpu/ivpu_jsm_msg.c
index 8f5d904ca1ed4..30a40be769301 100644
--- a/drivers/accel/ivpu/ivpu_jsm_msg.c
+++ b/drivers/accel/ivpu/ivpu_jsm_msg.c
@@ -132,7 +132,7 @@ int ivpu_jsm_get_heartbeat(struct ivpu_device *vdev, u32 engine, u64 *heartbeat)
 	struct vpu_jsm_msg resp;
 	int ret;
 
-	if (engine > VPU_ENGINE_COPY)
+	if (engine != VPU_ENGINE_COMPUTE)
 		return -EINVAL;
 
 	req.payload.query_engine_hb.engine_idx = engine;
@@ -155,7 +155,7 @@ int ivpu_jsm_reset_engine(struct ivpu_device *vdev, u32 engine)
 	struct vpu_jsm_msg resp;
 	int ret;
 
-	if (engine > VPU_ENGINE_COPY)
+	if (engine != VPU_ENGINE_COMPUTE)
 		return -EINVAL;
 
 	req.payload.engine_reset.engine_idx = engine;
@@ -174,7 +174,7 @@ int ivpu_jsm_preempt_engine(struct ivpu_device *vdev, u32 engine, u32 preempt_id
 	struct vpu_jsm_msg resp;
 	int ret;
 
-	if (engine > VPU_ENGINE_COPY)
+	if (engine != VPU_ENGINE_COMPUTE)
 		return -EINVAL;
 
 	req.payload.engine_preempt.engine_idx = engine;
@@ -346,7 +346,7 @@ int ivpu_jsm_hws_resume_engine(struct ivpu_device *vdev, u32 engine)
 	struct vpu_jsm_msg resp;
 	int ret;
 
-	if (engine >= VPU_ENGINE_NB)
+	if (engine != VPU_ENGINE_COMPUTE)
 		return -EINVAL;
 
 	req.payload.hws_resume_engine.engine_idx = engine;
diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
index 234664d352507..a35b97b097bf6 100644
--- a/include/uapi/drm/ivpu_accel.h
+++ b/include/uapi/drm/ivpu_accel.h
@@ -258,7 +258,7 @@ struct drm_ivpu_bo_info {
 
 /* drm_ivpu_submit engines */
 #define DRM_IVPU_ENGINE_COMPUTE 0
-#define DRM_IVPU_ENGINE_COPY    1
+#define DRM_IVPU_ENGINE_COPY    1 /* Deprecated */
 
 /**
  * struct drm_ivpu_submit - Submit commands to the VPU
@@ -289,10 +289,6 @@ struct drm_ivpu_submit {
 	 * %DRM_IVPU_ENGINE_COMPUTE:
 	 *
 	 * Performs Deep Learning Neural Compute Inference Operations
-	 *
-	 * %DRM_IVPU_ENGINE_COPY:
-	 *
-	 * Performs memory copy operations to/from system memory allocated for VPU
 	 */
 	__u32 engine;
 
-- 
2.45.1

