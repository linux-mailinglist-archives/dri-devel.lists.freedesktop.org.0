Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9DFA04226
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:22:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B89C10E6FB;
	Tue,  7 Jan 2025 14:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BINaFZjQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BAE10E6FB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736259765; x=1767795765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rWyldU0O6dmHH3v5FxIb7hS4ISh5mElv37BxXipdo2g=;
 b=BINaFZjQuWl4XfHd3btxh6YE072cHuxsKed9x6tGb6TG0Zf8BBxKEzNT
 MLcHEq0ITrmudhXtJgtCOesc9oFg4j9432LLxFWhG1fHJXW1lKKmz7+Qd
 HfSVR5KOu1wfGGC3wsi9HL83C6XxYGvAZE5+X7izwelVavWROeg2HJNeM
 i1uRyr4BsbcAk1MQRjWFZwxP1i7WQRxJaaWK08v1J1wTzdArb9x1rW7iC
 aU47zps4bfJA3Av7/H2ZjC4t14ye8Wz/jq/i5R2zLYt1Fmum/98lJCK38
 JlQwqfSI0Mq9I3XVFrI0RlkL4xshlDC8j5ENScxjCWaxP70CQKEIvGhN5 Q==;
X-CSE-ConnectionGUID: /4B6s7/7Qtajuie6f1LDfg==
X-CSE-MsgGUID: AzS1n+CWR5ac75rf1XXHVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36324455"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36324455"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:45 -0800
X-CSE-ConnectionGUID: ObjW/04nSEOKT2otOPME4Q==
X-CSE-MsgGUID: qMuBj2eeThubQiQfu5B96Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103635473"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:44 -0800
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH 09/14] accel/ivpu: Set command queue management capability
 based on HWS
Date: Tue,  7 Jan 2025 18:32:32 +0100
Message-ID: <20250107173238.381120-10-maciej.falkowski@linux.intel.com>
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

Control explicit command queue management capability bit based on
scheduling mode. Capability will be available only when hardware
scheduling mode is set.

There is no point of allowing user space to create and destroy command
queues with OS schedling mode because FW does not support all required
functionalities for correct command queue management with OS scheduling.

Return -ENODEV from command queue create/destroy/submit IOCTLs.

Remove is_valid field from struct ivpu_job_cmdq

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 19 +++++++------------
 drivers/accel/ivpu/ivpu_drv.h |  1 +
 drivers/accel/ivpu/ivpu_job.c | 24 +++++++++++-------------
 drivers/accel/ivpu/ivpu_job.h |  1 -
 4 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 9b0d99873fb3..6a80d626d609 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -127,23 +127,18 @@ void ivpu_file_priv_put(struct ivpu_file_priv **link)
 	kref_put(&file_priv->ref, file_priv_release);
 }
 
-static int ivpu_get_capabilities(struct ivpu_device *vdev, struct drm_ivpu_param *args)
+bool ivpu_is_capable(struct ivpu_device *vdev, u32 capability)
 {
-	switch (args->index) {
+	switch (capability) {
 	case DRM_IVPU_CAP_METRIC_STREAMER:
-		args->value = 1;
-		break;
+		return true;
 	case DRM_IVPU_CAP_DMA_MEMORY_RANGE:
-		args->value = 1;
-		break;
+		return true;
 	case DRM_IVPU_CAP_MANAGE_CMDQ:
-		args->value = 1;
-		break;
+		return vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW;
 	default:
-		return -EINVAL;
+		return false;
 	}
-
-	return 0;
 }
 
 static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
@@ -203,7 +198,7 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
 		args->value = vdev->hw->sku;
 		break;
 	case DRM_IVPU_PARAM_CAPABILITIES:
-		ret = ivpu_get_capabilities(vdev, args);
+		args->value = ivpu_is_capable(vdev, args->index);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index b57d878f2fcd..d53902b34070 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -213,6 +213,7 @@ void ivpu_file_priv_put(struct ivpu_file_priv **link);
 int ivpu_boot(struct ivpu_device *vdev);
 int ivpu_shutdown(struct ivpu_device *vdev);
 void ivpu_prepare_for_reset(struct ivpu_device *vdev);
+bool ivpu_is_capable(struct ivpu_device *vdev, u32 capability);
 
 static inline u8 ivpu_revision(struct ivpu_device *vdev)
 {
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index c55de9736d84..37ea92eb4b25 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -123,7 +123,6 @@ static struct ivpu_cmdq *ivpu_cmdq_create(struct ivpu_file_priv *file_priv, u8 p
 
 	cmdq->priority = priority;
 	cmdq->is_legacy = is_legacy;
-	cmdq->is_valid = true;
 
 	ret = xa_alloc_cyclic(&file_priv->cmdq_xa, &cmdq->id, cmdq, file_priv->cmdq_limit,
 			      &file_priv->cmdq_id_next, GFP_KERNEL);
@@ -307,7 +306,7 @@ static struct ivpu_cmdq *ivpu_cmdq_acquire(struct ivpu_file_priv *file_priv, u32
 	lockdep_assert_held(&file_priv->lock);
 
 	cmdq = xa_load(&file_priv->cmdq_xa, cmdq_id);
-	if (!cmdq || !cmdq->is_valid) {
+	if (!cmdq) {
 		ivpu_warn_ratelimited(vdev, "Failed to find command queue with ID: %u\n", cmdq_id);
 		return NULL;
 	}
@@ -832,6 +831,9 @@ int ivpu_cmdq_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *
 	struct ivpu_file_priv *file_priv = file->driver_priv;
 	struct drm_ivpu_cmdq_submit *args = data;
 
+	if (!ivpu_is_capable(file_priv->vdev, DRM_IVPU_CAP_MANAGE_CMDQ))
+		return -ENODEV;
+
 	if (args->cmdq_id < IVPU_CMDQ_MIN_ID || args->cmdq_id > IVPU_CMDQ_MAX_ID)
 		return -EINVAL;
 
@@ -857,6 +859,9 @@ int ivpu_cmdq_create_ioctl(struct drm_device *dev, void *data, struct drm_file *
 	struct drm_ivpu_cmdq_create *args = data;
 	struct ivpu_cmdq *cmdq;
 
+	if (!ivpu_is_capable(file_priv->vdev, DRM_IVPU_CAP_MANAGE_CMDQ))
+		return -ENODEV;
+
 	if (args->priority > DRM_IVPU_JOB_PRIORITY_REALTIME)
 		return -EINVAL;
 
@@ -880,24 +885,17 @@ int ivpu_cmdq_destroy_ioctl(struct drm_device *dev, void *data, struct drm_file
 	u32 cmdq_id;
 	int ret = 0;
 
+	if (!ivpu_is_capable(vdev, DRM_IVPU_CAP_MANAGE_CMDQ))
+		return -ENODEV;
+
 	mutex_lock(&file_priv->lock);
 
 	cmdq = xa_load(&file_priv->cmdq_xa, args->cmdq_id);
-	if (!cmdq || !cmdq->is_valid || cmdq->is_legacy) {
+	if (!cmdq || cmdq->is_legacy) {
 		ret = -ENOENT;
 		goto unlock;
 	}
 
-	/*
-	 * There is no way to stop executing jobs per command queue
-	 * in OS scheduling mode, mark command queue as invalid instead
-	 * and it will be freed together with context release.
-	 */
-	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_OS) {
-		cmdq->is_valid = false;
-		goto unlock;
-	}
-
 	cmdq_id = cmdq->id;
 	ivpu_cmdq_destroy(file_priv, cmdq);
 	ivpu_cmdq_abort_all_jobs(vdev, file_priv->ctx.id, cmdq_id);
diff --git a/drivers/accel/ivpu/ivpu_job.h b/drivers/accel/ivpu/ivpu_job.h
index ff77ee1fcee2..2e301c2eea7b 100644
--- a/drivers/accel/ivpu/ivpu_job.h
+++ b/drivers/accel/ivpu/ivpu_job.h
@@ -31,7 +31,6 @@ struct ivpu_cmdq {
 	u32 id;
 	u32 db_id;
 	u8 priority;
-	bool is_valid;
 	bool is_legacy;
 };
 
-- 
2.43.0

