Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158D0B5767C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 12:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642C710E421;
	Mon, 15 Sep 2025 10:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xzyozeya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85DE10E421
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757932491; x=1789468491;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/QpECp8mDQbje/3SnDylFX2MumjBo/H9uSK0tPMBrig=;
 b=XzyozeyaEBeumakvzGRNK0b/rSh2CvEPc/Alu32lBdZSMfSbfY/3Vv7s
 4q9DTkKJCjqG8VAJpZtpucfaRUV/RqUjONU3XedG+iP1WOk0pTD6MB2mq
 yij1WilHLwUdCc7JWytR5R/lh6w9Z3PMUovqrQqD2SYVxntcITMoUozUA
 XjM33joh8lKOB/XfjCWy5ZK1qN+5Ik+F5ejwtwHj+2Rs+jJ+oqsVo1tnX
 cQ0MiJsd5RSvZfU1TR7IXE97zKjWoeYOs9dm6Sa1gjHyPA7Yt0hN3e15D
 bsEdIHjoejcg+3phsZ+oOilF/3+VPn3YIhZ+BEPSPTLckEt2bNJZd6Zol A==;
X-CSE-ConnectionGUID: vTcw7B5cQNCP2myQn3HXvA==
X-CSE-MsgGUID: 4ztLsb29T+6WMnI9L1Oc0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="62811015"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="62811015"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 03:34:51 -0700
X-CSE-ConnectionGUID: QhS9gcYPSWKFgOUgKbQ86Q==
X-CSE-MsgGUID: qMpB6RhfQOu/PJPuCSWhPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="178897282"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 03:34:49 -0700
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Add support for user-managed preemption buffer
Date: Mon, 15 Sep 2025 12:34:37 +0200
Message-ID: <20250915103437.830086-1-karol.wachowski@linux.intel.com>
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

From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>

Allow user mode drivers to manage preemption buffers, enabling
memory savings by sharing a single buffer across multiple
command queues within the same memory context.

Introduce DRM_IVPU_PARAM_PREEMPT_BUFFER_SIZE to report the required
preemption buffer size as specified by the firmware.

The preemption buffer is now passed from user space as an entry
in the BO list of DRM_IVPU_CMDQ_SUBMIT. The buffer must be
non-mappable and large enough to hold preemption data.

For backward compatibility, the kernel will allocate an internal
preemption buffer if user space does not provide one.

User space can only provide a single preemption buffer,
simplifying the ioctl interface and parameter validation.
A separate secondary preemption buffer is only needed
to save below 4GB address space on 37xx and only if preemption
buffers are not shared.

Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c |  3 ++
 drivers/accel/ivpu/ivpu_fw.c  | 57 +++++++++++++++++----
 drivers/accel/ivpu/ivpu_fw.h  |  7 ++-
 drivers/accel/ivpu/ivpu_gem.h |  7 ++-
 drivers/accel/ivpu/ivpu_job.c | 96 ++++++++++++++++++++++++-----------
 drivers/accel/ivpu/ivpu_job.h |  4 +-
 include/uapi/drm/ivpu_accel.h | 11 ++++
 7 files changed, 141 insertions(+), 44 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 3d6d52492536..61c4f627c7c7 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -200,6 +200,9 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
 	case DRM_IVPU_PARAM_CAPABILITIES:
 		args->value = ivpu_is_capable(vdev, args->index);
 		break;
+	case DRM_IVPU_PARAM_PREEMPT_BUFFER_SIZE:
+		args->value = ivpu_fw_preempt_buf_size(vdev);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 9db741695401..6e0941d324a8 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -26,6 +26,8 @@
 #define FW_RUNTIME_MIN_ADDR	(FW_GLOBAL_MEM_START)
 #define FW_RUNTIME_MAX_ADDR	(FW_GLOBAL_MEM_END - FW_SHARED_MEM_SIZE)
 #define FW_FILE_IMAGE_OFFSET	(VPU_FW_HEADER_SIZE + FW_VERSION_HEADER_SIZE)
+#define FW_PREEMPT_BUF_MIN_SIZE SZ_4K
+#define FW_PREEMPT_BUF_MAX_SIZE SZ_32M
 
 #define WATCHDOG_MSS_REDIRECT	32
 #define WATCHDOG_NCE_REDIRECT	33
@@ -151,6 +153,47 @@ ivpu_fw_sched_mode_select(struct ivpu_device *vdev, const struct vpu_firmware_he
 	return VPU_SCHEDULING_MODE_HW;
 }
 
+static void
+ivpu_preemption_config_parse(struct ivpu_device *vdev, const struct vpu_firmware_header *fw_hdr)
+{
+	struct ivpu_fw_info *fw = vdev->fw;
+	u32 primary_preempt_buf_size, secondary_preempt_buf_size;
+
+	if (fw_hdr->preemption_buffer_1_max_size)
+		primary_preempt_buf_size = fw_hdr->preemption_buffer_1_max_size;
+	else
+		primary_preempt_buf_size = fw_hdr->preemption_buffer_1_size;
+
+	if (fw_hdr->preemption_buffer_2_max_size)
+		secondary_preempt_buf_size = fw_hdr->preemption_buffer_2_max_size;
+	else
+		secondary_preempt_buf_size = fw_hdr->preemption_buffer_2_size;
+
+	ivpu_dbg(vdev, FW_BOOT, "Preemption buffer size, primary: %u, secondary: %u\n",
+		 primary_preempt_buf_size, secondary_preempt_buf_size);
+
+	if (primary_preempt_buf_size < FW_PREEMPT_BUF_MIN_SIZE ||
+	    secondary_preempt_buf_size < FW_PREEMPT_BUF_MIN_SIZE) {
+		ivpu_warn(vdev, "Preemption buffers size too small\n");
+		return;
+	}
+
+	if (primary_preempt_buf_size > FW_PREEMPT_BUF_MAX_SIZE ||
+	    secondary_preempt_buf_size > FW_PREEMPT_BUF_MAX_SIZE) {
+		ivpu_warn(vdev, "Preemption buffers size too big\n");
+		return;
+	}
+
+	if (fw->sched_mode != VPU_SCHEDULING_MODE_HW)
+		return;
+
+	if (ivpu_test_mode & IVPU_TEST_MODE_MIP_DISABLE)
+		return;
+
+	vdev->fw->primary_preempt_buf_size = ALIGN(primary_preempt_buf_size, PAGE_SIZE);
+	vdev->fw->secondary_preempt_buf_size = ALIGN(secondary_preempt_buf_size, PAGE_SIZE);
+}
+
 static int ivpu_fw_parse(struct ivpu_device *vdev)
 {
 	struct ivpu_fw_info *fw = vdev->fw;
@@ -235,17 +278,9 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 	fw->sched_mode = ivpu_fw_sched_mode_select(vdev, fw_hdr);
 	ivpu_info(vdev, "Scheduler mode: %s\n", fw->sched_mode ? "HW" : "OS");
 
-	if (fw_hdr->preemption_buffer_1_max_size)
-		fw->primary_preempt_buf_size = fw_hdr->preemption_buffer_1_max_size;
-	else
-		fw->primary_preempt_buf_size = fw_hdr->preemption_buffer_1_size;
-
-	if (fw_hdr->preemption_buffer_2_max_size)
-		fw->secondary_preempt_buf_size = fw_hdr->preemption_buffer_2_max_size;
-	else
-		fw->secondary_preempt_buf_size = fw_hdr->preemption_buffer_2_size;
-	ivpu_dbg(vdev, FW_BOOT, "Preemption buffer sizes: primary %u, secondary %u\n",
-		 fw->primary_preempt_buf_size, fw->secondary_preempt_buf_size);
+	ivpu_preemption_config_parse(vdev, fw_hdr);
+	ivpu_dbg(vdev, FW_BOOT, "Mid-inference preemption %s supported\n",
+		 ivpu_fw_preempt_buf_size(vdev) ? "is" : "is not");
 
 	if (fw_hdr->ro_section_start_address && !is_within_range(fw_hdr->ro_section_start_address,
 								 fw_hdr->ro_section_size,
diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
index 7081913fb0dd..6fe2917abda6 100644
--- a/drivers/accel/ivpu/ivpu_fw.h
+++ b/drivers/accel/ivpu/ivpu_fw.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2020-2024 Intel Corporation
+ * Copyright (C) 2020-2025 Intel Corporation
  */
 
 #ifndef __IVPU_FW_H__
@@ -52,4 +52,9 @@ static inline bool ivpu_fw_is_cold_boot(struct ivpu_device *vdev)
 	return vdev->fw->entry_point == vdev->fw->cold_boot_entry_point;
 }
 
+static inline u32 ivpu_fw_preempt_buf_size(struct ivpu_device *vdev)
+{
+	return vdev->fw->primary_preempt_buf_size + vdev->fw->secondary_preempt_buf_size;
+}
+
 #endif /* __IVPU_FW_H__ */
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index aa8ff14f7aae..3ee996d503b2 100644
--- a/drivers/accel/ivpu/ivpu_gem.h
+++ b/drivers/accel/ivpu/ivpu_gem.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2025 Intel Corporation
  */
 #ifndef __IVPU_GEM_H__
 #define __IVPU_GEM_H__
@@ -96,4 +96,9 @@ static inline u32 cpu_to_vpu_addr(struct ivpu_bo *bo, void *cpu_addr)
 	return bo->vpu_addr + (cpu_addr - ivpu_bo_vaddr(bo));
 }
 
+static inline bool ivpu_bo_is_mappable(struct ivpu_bo *bo)
+{
+	return bo->flags & DRM_IVPU_BO_MAPPABLE;
+}
+
 #endif /* __IVPU_GEM_H__ */
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index fa1720fa06a4..521b7ac6e35e 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -34,22 +34,20 @@ static void ivpu_cmdq_ring_db(struct ivpu_device *vdev, struct ivpu_cmdq *cmdq)
 static int ivpu_preemption_buffers_create(struct ivpu_device *vdev,
 					  struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq)
 {
-	u64 primary_size = ALIGN(vdev->fw->primary_preempt_buf_size, PAGE_SIZE);
-	u64 secondary_size = ALIGN(vdev->fw->secondary_preempt_buf_size, PAGE_SIZE);
-
-	if (vdev->fw->sched_mode != VPU_SCHEDULING_MODE_HW ||
-	    ivpu_test_mode & IVPU_TEST_MODE_MIP_DISABLE)
+	if (ivpu_fw_preempt_buf_size(vdev) == 0)
 		return 0;
 
 	cmdq->primary_preempt_buf = ivpu_bo_create(vdev, &file_priv->ctx, &vdev->hw->ranges.user,
-						   primary_size, DRM_IVPU_BO_WC);
+						   vdev->fw->primary_preempt_buf_size,
+						   DRM_IVPU_BO_WC);
 	if (!cmdq->primary_preempt_buf) {
 		ivpu_err(vdev, "Failed to create primary preemption buffer\n");
 		return -ENOMEM;
 	}
 
 	cmdq->secondary_preempt_buf = ivpu_bo_create(vdev, &file_priv->ctx, &vdev->hw->ranges.dma,
-						     secondary_size, DRM_IVPU_BO_WC);
+						     vdev->fw->secondary_preempt_buf_size,
+						     DRM_IVPU_BO_WC);
 	if (!cmdq->secondary_preempt_buf) {
 		ivpu_err(vdev, "Failed to create secondary preemption buffer\n");
 		goto err_free_primary;
@@ -66,20 +64,39 @@ static int ivpu_preemption_buffers_create(struct ivpu_device *vdev,
 static void ivpu_preemption_buffers_free(struct ivpu_device *vdev,
 					 struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq)
 {
-	if (vdev->fw->sched_mode != VPU_SCHEDULING_MODE_HW)
-		return;
-
 	if (cmdq->primary_preempt_buf)
 		ivpu_bo_free(cmdq->primary_preempt_buf);
 	if (cmdq->secondary_preempt_buf)
 		ivpu_bo_free(cmdq->secondary_preempt_buf);
 }
 
+static int ivpu_preemption_job_init(struct ivpu_device *vdev, struct ivpu_file_priv *file_priv,
+				    struct ivpu_cmdq *cmdq, struct ivpu_job *job)
+{
+	int ret;
+
+	/* Use preemption buffer provided by the user space */
+	if (job->primary_preempt_buf)
+		return 0;
+
+	if (!cmdq->primary_preempt_buf) {
+		/* Allocate per command queue preemption buffers */
+		ret = ivpu_preemption_buffers_create(vdev, file_priv, cmdq);
+		if (ret)
+			return ret;
+	}
+
+	/* Use preemption buffers allocated by the kernel */
+	job->primary_preempt_buf = cmdq->primary_preempt_buf;
+	job->secondary_preempt_buf = cmdq->secondary_preempt_buf;
+
+	return 0;
+}
+
 static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv)
 {
 	struct ivpu_device *vdev = file_priv->vdev;
 	struct ivpu_cmdq *cmdq;
-	int ret;
 
 	cmdq = kzalloc(sizeof(*cmdq), GFP_KERNEL);
 	if (!cmdq)
@@ -89,10 +106,6 @@ static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv)
 	if (!cmdq->mem)
 		goto err_free_cmdq;
 
-	ret = ivpu_preemption_buffers_create(vdev, file_priv, cmdq);
-	if (ret)
-		ivpu_warn(vdev, "Failed to allocate preemption buffers, preemption limited\n");
-
 	return cmdq;
 
 err_free_cmdq:
@@ -429,17 +442,14 @@ static int ivpu_cmdq_push_job(struct ivpu_cmdq *cmdq, struct ivpu_job *job)
 	if (unlikely(ivpu_test_mode & IVPU_TEST_MODE_NULL_SUBMISSION))
 		entry->flags = VPU_JOB_FLAGS_NULL_SUBMISSION_MASK;
 
-	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW) {
-		if (cmdq->primary_preempt_buf) {
-			entry->primary_preempt_buf_addr = cmdq->primary_preempt_buf->vpu_addr;
-			entry->primary_preempt_buf_size = ivpu_bo_size(cmdq->primary_preempt_buf);
-		}
+	if (job->primary_preempt_buf) {
+		entry->primary_preempt_buf_addr = job->primary_preempt_buf->vpu_addr;
+		entry->primary_preempt_buf_size = ivpu_bo_size(job->primary_preempt_buf);
+	}
 
-		if (cmdq->secondary_preempt_buf) {
-			entry->secondary_preempt_buf_addr = cmdq->secondary_preempt_buf->vpu_addr;
-			entry->secondary_preempt_buf_size =
-				ivpu_bo_size(cmdq->secondary_preempt_buf);
-		}
+	if (job->secondary_preempt_buf) {
+		entry->secondary_preempt_buf_addr = job->secondary_preempt_buf->vpu_addr;
+		entry->secondary_preempt_buf_size = ivpu_bo_size(job->secondary_preempt_buf);
 	}
 
 	wmb(); /* Ensure that tail is updated after filling entry */
@@ -663,6 +673,13 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority, u32 cmdq_id)
 		goto err_unlock;
 	}
 
+	ret = ivpu_preemption_job_init(vdev, file_priv, cmdq, job);
+	if (ret) {
+		ivpu_err(vdev, "Failed to initialize preemption buffers for job %d: %d\n",
+			 job->job_id, ret);
+		goto err_unlock;
+	}
+
 	job->cmdq_id = cmdq->id;
 
 	is_first_job = xa_empty(&vdev->submitted_jobs_xa);
@@ -716,7 +733,7 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority, u32 cmdq_id)
 
 static int
 ivpu_job_prepare_bos_for_submit(struct drm_file *file, struct ivpu_job *job, u32 *buf_handles,
-				u32 buf_count, u32 commands_offset)
+				u32 buf_count, u32 commands_offset, u32 preempt_buffer_index)
 {
 	struct ivpu_file_priv *file_priv = job->file_priv;
 	struct ivpu_device *vdev = file_priv->vdev;
@@ -752,6 +769,20 @@ ivpu_job_prepare_bos_for_submit(struct drm_file *file, struct ivpu_job *job, u32
 
 	job->cmd_buf_vpu_addr = bo->vpu_addr + commands_offset;
 
+	if (preempt_buffer_index) {
+		struct ivpu_bo *preempt_bo = job->bos[preempt_buffer_index];
+
+		if (ivpu_bo_size(preempt_bo) < ivpu_fw_preempt_buf_size(vdev)) {
+			ivpu_warn(vdev, "Preemption buffer is too small\n");
+			return -EINVAL;
+		}
+		if (ivpu_bo_is_mappable(preempt_bo)) {
+			ivpu_warn(vdev, "Preemption buffer cannot be mappable\n");
+			return -EINVAL;
+		}
+		job->primary_preempt_buf = preempt_bo;
+	}
+
 	ret = drm_gem_lock_reservations((struct drm_gem_object **)job->bos, buf_count,
 					&acquire_ctx);
 	if (ret) {
@@ -782,7 +813,7 @@ ivpu_job_prepare_bos_for_submit(struct drm_file *file, struct ivpu_job *job, u32
 
 static int ivpu_submit(struct drm_file *file, struct ivpu_file_priv *file_priv, u32 cmdq_id,
 		       u32 buffer_count, u32 engine, void __user *buffers_ptr, u32 cmds_offset,
-		       u8 priority)
+		       u32 preempt_buffer_index, u8 priority)
 {
 	struct ivpu_device *vdev = file_priv->vdev;
 	struct ivpu_job *job;
@@ -814,7 +845,8 @@ static int ivpu_submit(struct drm_file *file, struct ivpu_file_priv *file_priv,
 		goto err_exit_dev;
 	}
 
-	ret = ivpu_job_prepare_bos_for_submit(file, job, buf_handles, buffer_count, cmds_offset);
+	ret = ivpu_job_prepare_bos_for_submit(file, job, buf_handles, buffer_count, cmds_offset,
+					      preempt_buffer_index);
 	if (ret) {
 		ivpu_err(vdev, "Failed to prepare job: %d\n", ret);
 		goto err_destroy_job;
@@ -868,7 +900,7 @@ int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	priority = ivpu_job_to_jsm_priority(args->priority);
 
 	return ivpu_submit(file, file_priv, 0, args->buffer_count, args->engine,
-			   (void __user *)args->buffers_ptr, args->commands_offset, priority);
+			   (void __user *)args->buffers_ptr, args->commands_offset, 0, priority);
 }
 
 int ivpu_cmdq_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
@@ -885,6 +917,9 @@ int ivpu_cmdq_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *
 	if (args->buffer_count == 0 || args->buffer_count > JOB_MAX_BUFFER_COUNT)
 		return -EINVAL;
 
+	if (args->preempt_buffer_index >= args->buffer_count)
+		return -EINVAL;
+
 	if (!IS_ALIGNED(args->commands_offset, 8))
 		return -EINVAL;
 
@@ -895,7 +930,8 @@ int ivpu_cmdq_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *
 		return -EBADFD;
 
 	return ivpu_submit(file, file_priv, args->cmdq_id, args->buffer_count, VPU_ENGINE_COMPUTE,
-			   (void __user *)args->buffers_ptr, args->commands_offset, 0);
+			   (void __user *)args->buffers_ptr, args->commands_offset,
+			   args->preempt_buffer_index, 0);
 }
 
 int ivpu_cmdq_create_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/drivers/accel/ivpu/ivpu_job.h b/drivers/accel/ivpu/ivpu_job.h
index 2e301c2eea7b..6c8b9c739b51 100644
--- a/drivers/accel/ivpu/ivpu_job.h
+++ b/drivers/accel/ivpu/ivpu_job.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2020-2024 Intel Corporation
+ * Copyright (C) 2020-2025 Intel Corporation
  */
 
 #ifndef __IVPU_JOB_H__
@@ -55,6 +55,8 @@ struct ivpu_job {
 	u32 job_id;
 	u32 engine_idx;
 	size_t bo_count;
+	struct ivpu_bo *primary_preempt_buf;
+	struct ivpu_bo *secondary_preempt_buf;
 	struct ivpu_bo *bos[] __counted_by(bo_count);
 };
 
diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
index 160ee1411d4a..e470b0221e02 100644
--- a/include/uapi/drm/ivpu_accel.h
+++ b/include/uapi/drm/ivpu_accel.h
@@ -90,6 +90,7 @@ extern "C" {
 #define DRM_IVPU_PARAM_TILE_CONFIG	    11
 #define DRM_IVPU_PARAM_SKU		    12
 #define DRM_IVPU_PARAM_CAPABILITIES	    13
+#define DRM_IVPU_PARAM_PREEMPT_BUFFER_SIZE  14
 
 #define DRM_IVPU_PLATFORM_TYPE_SILICON	    0
 
@@ -176,6 +177,9 @@ struct drm_ivpu_param {
 	 *
 	 * %DRM_IVPU_PARAM_CAPABILITIES:
 	 * Supported capabilities (read-only)
+	 *
+	 * %DRM_IVPU_PARAM_PREEMPT_BUFFER_SIZE:
+	 * Size of the preemption buffer (read-only)
 	 */
 	__u32 param;
 
@@ -371,6 +375,13 @@ struct drm_ivpu_cmdq_submit {
 	 * to be executed. The offset has to be 8-byte aligned.
 	 */
 	__u32 commands_offset;
+	/**
+	 * @preempt_buffer_index:
+	 *
+	 * Index of the preemption buffer in the buffers_ptr array.
+	 */
+	__u32 preempt_buffer_index;
+	__u32 reserved;
 };
 
 /* drm_ivpu_bo_wait job status codes */
-- 
2.43.0

