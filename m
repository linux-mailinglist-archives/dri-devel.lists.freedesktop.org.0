Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A397A8C4064
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 14:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AB510E715;
	Mon, 13 May 2024 12:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IT6J1VnJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BCE10E712
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 12:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715601881; x=1747137881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bCbqy8uDAVVZMMqH038VX7yGQq6CCAa7WC5mEQZj3/k=;
 b=IT6J1VnJ+JNrtajBpg7u0vlAvH2V4zDjR7Dnbe6s7xngu8sC0A5PoUny
 DEdo6kzp+014vU0AMA/k6Ykv4kPA45uQFcCoxQCsYOveFVWo37ZKbPy80
 s+0Ogh5Jx1m0/hqpWrEPjfzKgXmTg2ub1e4/7vHqbXmkrxNd0Mr2QYL4u
 299pz8VgYf0SahaGAJ5d/oVlIgc0jSmOGZfi5ZMNmVl6qC/wPfQ2IGS9a
 ks+MR/SJDMrFVylQW0ABN6QeBFoVExKg0EeLGw1CiuAMzZmF/gKNAsdFX
 t1qvBjsosibitZbOPAaQb8XX36wWD/SituDbsWNPhsrHOQewQbmCvjQwM A==;
X-CSE-ConnectionGUID: WTL/mvADQsW7r8VBFEIWgw==
X-CSE-MsgGUID: lMSDNpDIQV6Jq55EjMstkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22131731"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22131731"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:04:41 -0700
X-CSE-ConnectionGUID: oJKJmdxySAKpr0UuznnlvA==
X-CSE-MsgGUID: 8UEfFI/ZS5aw1uBp+8B8Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30341057"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:04:39 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 04/12] accel/ivpu: Implement support for preemption buffers
Date: Mon, 13 May 2024 14:04:23 +0200
Message-ID: <20240513120431.3187212-5-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240513120431.3187212-1-jacek.lawrynowicz@linux.intel.com>
References: <20240513120431.3187212-1-jacek.lawrynowicz@linux.intel.com>
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

Allocate per-context preemption buffers that are required by HWS.

There are two preemption buffers:
  * primary - allocated in user memory range (PIOVA accessible)
  * secondary - allocated in shave memory range

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/ivpu/ivpu_drv.h |  1 +
 drivers/accel/ivpu/ivpu_fw.c  |  3 ++
 drivers/accel/ivpu/ivpu_fw.h  |  2 ++
 drivers/accel/ivpu/ivpu_job.c | 65 +++++++++++++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_job.h |  2 ++
 5 files changed, 73 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index aafc5c3e9041..f500b2d92452 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -170,6 +170,7 @@ extern bool ivpu_disable_mmu_cont_pages;
 #define IVPU_TEST_MODE_NULL_SUBMISSION    BIT(2)
 #define IVPU_TEST_MODE_D0I3_MSG_DISABLE   BIT(4)
 #define IVPU_TEST_MODE_D0I3_MSG_ENABLE    BIT(5)
+#define IVPU_TEST_MODE_PREEMPTION_DISABLE BIT(6)
 extern int ivpu_test_mode;
 
 struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv);
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 1457300828bf..29ecf7db238b 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -200,6 +200,9 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 
 	fw->dvfs_mode = 0;
 
+	fw->primary_preempt_buf_size = fw_hdr->preemption_buffer_1_size;
+	fw->secondary_preempt_buf_size = fw_hdr->preemption_buffer_2_size;
+
 	ivpu_dbg(vdev, FW_BOOT, "Size: file %lu image %u runtime %u shavenn %u\n",
 		 fw->file->size, fw->image_size, fw->runtime_size, fw->shave_nn_size);
 	ivpu_dbg(vdev, FW_BOOT, "Address: runtime 0x%llx, load 0x%llx, entry point 0x%llx\n",
diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
index 66b60fa161b5..66fc7da3ab0f 100644
--- a/drivers/accel/ivpu/ivpu_fw.h
+++ b/drivers/accel/ivpu/ivpu_fw.h
@@ -28,6 +28,8 @@ struct ivpu_fw_info {
 	u32 trace_destination_mask;
 	u64 trace_hw_component_mask;
 	u32 dvfs_mode;
+	u32 primary_preempt_buf_size;
+	u32 secondary_preempt_buf_size;
 };
 
 int ivpu_fw_init(struct ivpu_device *vdev);
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index b56035de1a59..3ef9d8022c9c 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -12,11 +12,13 @@
 #include <uapi/drm/ivpu_accel.h>
 
 #include "ivpu_drv.h"
+#include "ivpu_fw.h"
 #include "ivpu_hw.h"
 #include "ivpu_ipc.h"
 #include "ivpu_job.h"
 #include "ivpu_jsm_msg.h"
 #include "ivpu_pm.h"
+#include "vpu_boot_api.h"
 
 #define CMD_BUF_IDX	     0
 #define JOB_ID_JOB_MASK	     GENMASK(7, 0)
@@ -28,6 +30,53 @@ static void ivpu_cmdq_ring_db(struct ivpu_device *vdev, struct ivpu_cmdq *cmdq)
 	ivpu_hw_reg_db_set(vdev, cmdq->db_id);
 }
 
+static int ivpu_preemption_buffers_create(struct ivpu_device *vdev,
+					  struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq)
+{
+	u64 primary_size = ALIGN(vdev->fw->primary_preempt_buf_size, PAGE_SIZE);
+	u64 secondary_size = ALIGN(vdev->fw->secondary_preempt_buf_size, PAGE_SIZE);
+	struct ivpu_addr_range range;
+
+	if (vdev->hw->sched_mode != VPU_SCHEDULING_MODE_HW)
+		return 0;
+
+	range.start = vdev->hw->ranges.user.end - (primary_size * IVPU_NUM_CMDQS_PER_CTX);
+	range.end = vdev->hw->ranges.user.end;
+	cmdq->primary_preempt_buf = ivpu_bo_create(vdev, &file_priv->ctx, &range, primary_size,
+						   DRM_IVPU_BO_WC);
+	if (!cmdq->primary_preempt_buf) {
+		ivpu_err(vdev, "Failed to create primary preemption buffer\n");
+		return -ENOMEM;
+	}
+
+	range.start = vdev->hw->ranges.shave.end - (secondary_size * IVPU_NUM_CMDQS_PER_CTX);
+	range.end = vdev->hw->ranges.shave.end;
+	cmdq->secondary_preempt_buf = ivpu_bo_create(vdev, &file_priv->ctx, &range, secondary_size,
+						     DRM_IVPU_BO_WC);
+	if (!cmdq->secondary_preempt_buf) {
+		ivpu_err(vdev, "Failed to create secondary preemption buffer\n");
+		goto err_free_primary;
+	}
+
+	return 0;
+
+err_free_primary:
+	ivpu_bo_free(cmdq->primary_preempt_buf);
+	return -ENOMEM;
+}
+
+static void ivpu_preemption_buffers_free(struct ivpu_device *vdev,
+					 struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq)
+{
+	if (vdev->hw->sched_mode != VPU_SCHEDULING_MODE_HW)
+		return;
+
+	drm_WARN_ON(&vdev->drm, !cmdq->primary_preempt_buf);
+	drm_WARN_ON(&vdev->drm, !cmdq->secondary_preempt_buf);
+	ivpu_bo_free(cmdq->primary_preempt_buf);
+	ivpu_bo_free(cmdq->secondary_preempt_buf);
+}
+
 static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv, u16 engine)
 {
 	struct xa_limit db_xa_limit = {.max = IVPU_MAX_DB, .min = IVPU_MIN_DB};
@@ -50,6 +99,10 @@ static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv, u16 e
 	if (!cmdq->mem)
 		goto err_erase_xa;
 
+	ret = ivpu_preemption_buffers_create(vdev, file_priv, cmdq);
+	if (ret)
+		goto err_free_cmdq_mem;
+
 	cmdq->entry_count = (u32)((ivpu_bo_size(cmdq->mem) - sizeof(struct vpu_job_queue_header)) /
 				  sizeof(struct vpu_job_queue_entry));
 
@@ -62,6 +115,8 @@ static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv, u16 e
 
 	return cmdq;
 
+err_free_cmdq_mem:
+	ivpu_bo_free(cmdq->mem);
 err_erase_xa:
 	xa_erase(&vdev->db_xa, cmdq->db_id);
 err_free_cmdq:
@@ -74,6 +129,7 @@ static void ivpu_cmdq_free(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *c
 	if (!cmdq)
 		return;
 
+	ivpu_preemption_buffers_free(file_priv->vdev, file_priv, cmdq);
 	ivpu_bo_free(cmdq->mem);
 	xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
 	kfree(cmdq);
@@ -207,6 +263,15 @@ static int ivpu_cmdq_push_job(struct ivpu_cmdq *cmdq, struct ivpu_job *job)
 	entry->flags = 0;
 	if (unlikely(ivpu_test_mode & IVPU_TEST_MODE_NULL_SUBMISSION))
 		entry->flags = VPU_JOB_FLAGS_NULL_SUBMISSION_MASK;
+
+	if (vdev->hw->sched_mode == VPU_SCHEDULING_MODE_HW &&
+	    (unlikely(!(ivpu_test_mode & IVPU_TEST_MODE_PREEMPTION_DISABLE)))) {
+		entry->primary_preempt_buf_addr = cmdq->primary_preempt_buf->vpu_addr;
+		entry->primary_preempt_buf_size = ivpu_bo_size(cmdq->primary_preempt_buf);
+		entry->secondary_preempt_buf_addr = cmdq->secondary_preempt_buf->vpu_addr;
+		entry->secondary_preempt_buf_size = ivpu_bo_size(cmdq->secondary_preempt_buf);
+	}
+
 	wmb(); /* Ensure that tail is updated after filling entry */
 	header->tail = next_entry;
 	wmb(); /* Flush WC buffer for jobq header */
diff --git a/drivers/accel/ivpu/ivpu_job.h b/drivers/accel/ivpu/ivpu_job.h
index ca4984071cc7..e50002b5788c 100644
--- a/drivers/accel/ivpu/ivpu_job.h
+++ b/drivers/accel/ivpu/ivpu_job.h
@@ -24,6 +24,8 @@ struct ivpu_file_priv;
  */
 struct ivpu_cmdq {
 	struct vpu_job_queue *jobq;
+	struct ivpu_bo *primary_preempt_buf;
+	struct ivpu_bo *secondary_preempt_buf;
 	struct ivpu_bo *mem;
 	u32 entry_count;
 	u32 db_id;
-- 
2.43.2

