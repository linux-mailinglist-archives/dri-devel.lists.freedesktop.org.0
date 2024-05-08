Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B38D8BFE97
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 15:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AEA1129A2;
	Wed,  8 May 2024 13:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IL8dRCo/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7D8112950
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715174482; x=1746710482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9GzWSdnKbr3jVOp1qDqjBVcyZePcy6kEp7e2lYcKoEo=;
 b=IL8dRCo/rmNMmhwFQLfTdDbQ8bxzwHDpeGQL3d9BYK+EKtoSK34uiu5V
 K6gQMaA7icTMBgJgbQGxH7d1Em3WYTUwvhLC7rnyw626GxZADijqR0d+F
 eeozmW6nNwSuTOXsQnqoA+NCyue/rMON3F5ZabJBZa2Ltum4XwGqyO+rF
 P5EJnAGxiILjtLTUzvtXoQPln+MjawuGHQ6E/9ygUUuDqGAt2ojOVuuzz
 lEAcQJtNZ0R70iG0aQwF7zMy4g7QGz0jUECXBtM13OHTmt6bYxwEiaJPM
 vn8X8UFt4i/MPPSNo1T5ZOpEhgt6X5TACpZutSQ6PsePJrczfeXxBdIRj w==;
X-CSE-ConnectionGUID: 6zh6ThCMQWy3mt201ncb9Q==
X-CSE-MsgGUID: UnmukR0MSKi4T1hjc6v1+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="33540058"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33540058"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:21:21 -0700
X-CSE-ConnectionGUID: 4PH/n53xRLK2yzf7Wxv/Rw==
X-CSE-MsgGUID: LXFbBH+2Sj2oj4PvpFdfpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29289375"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:21:19 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 06/12] accel/ivpu: Implement support for hardware scheduler
Date: Wed,  8 May 2024 15:21:03 +0200
Message-ID: <20240508132106.2387464-7-jacek.lawrynowicz@linux.intel.com>
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

Add support for HWS (hardware scheduler). It is disabled by default.
The sched_mode module param can be used to enable it.

Each context has multiple command queues with different priorities and
HWS enables priority based execution on the HW/FW side.

The driver in HWS mode has to send a couple additional messages to
initialize HWS and describe command queue priorities.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c |  20 ++++-
 drivers/accel/ivpu/ivpu_fw.c  |   9 ++
 drivers/accel/ivpu/ivpu_job.c | 162 ++++++++++++++++++++++++----------
 3 files changed, 144 insertions(+), 47 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index db47e7ef6322..49261fa7c5f4 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -78,7 +78,6 @@ static void file_priv_unbind(struct ivpu_device *vdev, struct ivpu_file_priv *fi
 		ivpu_dbg(vdev, FILE, "file_priv unbind: ctx %u\n", file_priv->ctx.id);
 
 		ivpu_cmdq_release_all_locked(file_priv);
-		ivpu_jsm_context_release(vdev, file_priv->ctx.id);
 		ivpu_bo_unbind_all_bos_from_context(vdev, &file_priv->ctx);
 		ivpu_mmu_user_context_fini(vdev, &file_priv->ctx);
 		file_priv->bound = false;
@@ -327,6 +326,21 @@ static int ivpu_wait_for_ready(struct ivpu_device *vdev)
 	return ret;
 }
 
+static int ivpu_hw_sched_init(struct ivpu_device *vdev)
+{
+	int ret = 0;
+
+	if (vdev->hw->sched_mode == VPU_SCHEDULING_MODE_HW) {
+		ret = ivpu_jsm_hws_setup_priority_bands(vdev);
+		if (ret) {
+			ivpu_err(vdev, "Failed to enable hw scheduler: %d", ret);
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
 /**
  * ivpu_boot() - Start VPU firmware
  * @vdev: VPU device
@@ -360,6 +374,10 @@ int ivpu_boot(struct ivpu_device *vdev)
 	enable_irq(vdev->irq);
 	ivpu_hw_irq_enable(vdev);
 	ivpu_ipc_enable(vdev);
+
+	if (ivpu_fw_is_cold_boot(vdev))
+		return ivpu_hw_sched_init(vdev);
+
 	return 0;
 }
 
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 29ecf7db238b..6a33a3193d5c 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -44,6 +44,8 @@
 #define IVPU_FW_CHECK_API_VER_LT(vdev, fw_hdr, name, major, minor) \
 	ivpu_fw_check_api_ver_lt(vdev, fw_hdr, #name, VPU_##name##_API_VER_INDEX, major, minor)
 
+#define IVPU_FOCUS_PRESENT_TIMER_MS 1000
+
 static char *ivpu_firmware;
 module_param_named_unsafe(firmware, ivpu_firmware, charp, 0644);
 MODULE_PARM_DESC(firmware, "NPU firmware binary in /lib/firmware/..");
@@ -467,6 +469,10 @@ static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_
 		 boot_params->punit_telemetry_sram_size);
 	ivpu_dbg(vdev, FW_BOOT, "boot_params.vpu_telemetry_enable = 0x%x\n",
 		 boot_params->vpu_telemetry_enable);
+	ivpu_dbg(vdev, FW_BOOT, "boot_params.vpu_scheduling_mode = 0x%x\n",
+		 boot_params->vpu_scheduling_mode);
+	ivpu_dbg(vdev, FW_BOOT, "boot_params.vpu_focus_present_timer_ms = %u\n",
+		 boot_params->vpu_focus_present_timer_ms);
 	ivpu_dbg(vdev, FW_BOOT, "boot_params.dvfs_mode = %u\n",
 		 boot_params->dvfs_mode);
 	ivpu_dbg(vdev, FW_BOOT, "boot_params.d0i3_delayed_entry = %d\n",
@@ -567,6 +573,9 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	boot_params->punit_telemetry_sram_base = ivpu_hw_reg_telemetry_offset_get(vdev);
 	boot_params->punit_telemetry_sram_size = ivpu_hw_reg_telemetry_size_get(vdev);
 	boot_params->vpu_telemetry_enable = ivpu_hw_reg_telemetry_enable_get(vdev);
+	boot_params->vpu_scheduling_mode = vdev->hw->sched_mode;
+	if (vdev->hw->sched_mode == VPU_SCHEDULING_MODE_HW)
+		boot_params->vpu_focus_present_timer_ms = IVPU_FOCUS_PRESENT_TIMER_MS;
 	boot_params->dvfs_mode = vdev->fw->dvfs_mode;
 	if (!IVPU_WA(disable_d0i3_msg))
 		boot_params->d0i3_delayed_entry = 1;
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 3ef9d8022c9c..1d7b4388eb3b 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -77,11 +77,10 @@ static void ivpu_preemption_buffers_free(struct ivpu_device *vdev,
 	ivpu_bo_free(cmdq->secondary_preempt_buf);
 }
 
-static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv, u16 engine)
+static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv)
 {
 	struct xa_limit db_xa_limit = {.max = IVPU_MAX_DB, .min = IVPU_MIN_DB};
 	struct ivpu_device *vdev = file_priv->vdev;
-	struct vpu_job_queue_header *jobq_header;
 	struct ivpu_cmdq *cmdq;
 	int ret;
 
@@ -103,16 +102,6 @@ static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv, u16 e
 	if (ret)
 		goto err_free_cmdq_mem;
 
-	cmdq->entry_count = (u32)((ivpu_bo_size(cmdq->mem) - sizeof(struct vpu_job_queue_header)) /
-				  sizeof(struct vpu_job_queue_entry));
-
-	cmdq->jobq = (struct vpu_job_queue *)ivpu_bo_vaddr(cmdq->mem);
-	jobq_header = &cmdq->jobq->header;
-	jobq_header->engine_idx = engine;
-	jobq_header->head = 0;
-	jobq_header->tail = 0;
-	wmb(); /* Flush WC buffer for jobq->header */
-
 	return cmdq;
 
 err_free_cmdq_mem:
@@ -135,33 +124,126 @@ static void ivpu_cmdq_free(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *c
 	kfree(cmdq);
 }
 
+static int ivpu_hws_cmdq_init(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq, u16 engine,
+			      u8 priority)
+{
+	struct ivpu_device *vdev = file_priv->vdev;
+	int ret;
+
+	ret = ivpu_jsm_hws_create_cmdq(vdev, file_priv->ctx.id, file_priv->ctx.id, cmdq->db_id,
+				       task_pid_nr(current), engine,
+				       cmdq->mem->vpu_addr, ivpu_bo_size(cmdq->mem));
+	if (ret)
+		return ret;
+
+	ret = ivpu_jsm_hws_set_context_sched_properties(vdev, file_priv->ctx.id, cmdq->db_id,
+							priority);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ivpu_register_db(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq)
+{
+	struct ivpu_device *vdev = file_priv->vdev;
+	int ret;
+
+	if (vdev->hw->sched_mode == VPU_SCHEDULING_MODE_HW)
+		ret = ivpu_jsm_hws_register_db(vdev, file_priv->ctx.id, cmdq->db_id, cmdq->db_id,
+					       cmdq->mem->vpu_addr, ivpu_bo_size(cmdq->mem));
+	else
+		ret = ivpu_jsm_register_db(vdev, file_priv->ctx.id, cmdq->db_id,
+					   cmdq->mem->vpu_addr, ivpu_bo_size(cmdq->mem));
+
+	if (!ret)
+		ivpu_dbg(vdev, JOB, "DB %d registered to ctx %d\n", cmdq->db_id, file_priv->ctx.id);
+
+	return ret;
+}
+
+static int
+ivpu_cmdq_init(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq, u16 engine, u8 priority)
+{
+	struct ivpu_device *vdev = file_priv->vdev;
+	struct vpu_job_queue_header *jobq_header;
+	int ret;
+
+	lockdep_assert_held(&file_priv->lock);
+
+	if (cmdq->db_registered)
+		return 0;
+
+	cmdq->entry_count = (u32)((ivpu_bo_size(cmdq->mem) - sizeof(struct vpu_job_queue_header)) /
+				  sizeof(struct vpu_job_queue_entry));
+
+	cmdq->jobq = (struct vpu_job_queue *)ivpu_bo_vaddr(cmdq->mem);
+	jobq_header = &cmdq->jobq->header;
+	jobq_header->engine_idx = engine;
+	jobq_header->head = 0;
+	jobq_header->tail = 0;
+	wmb(); /* Flush WC buffer for jobq->header */
+
+	if (vdev->hw->sched_mode == VPU_SCHEDULING_MODE_HW) {
+		ret = ivpu_hws_cmdq_init(file_priv, cmdq, engine, priority);
+		if (ret)
+			return ret;
+	}
+
+	ret = ivpu_register_db(file_priv, cmdq);
+	if (ret)
+		return ret;
+
+	cmdq->db_registered = true;
+
+	return 0;
+}
+
+static int ivpu_cmdq_fini(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq)
+{
+	struct ivpu_device *vdev = file_priv->vdev;
+	int ret;
+
+	lockdep_assert_held(&file_priv->lock);
+
+	if (!cmdq->db_registered)
+		return 0;
+
+	cmdq->db_registered = false;
+
+	if (vdev->hw->sched_mode == VPU_SCHEDULING_MODE_HW) {
+		ret = ivpu_jsm_hws_destroy_cmdq(vdev, file_priv->ctx.id, cmdq->db_id);
+		if (!ret)
+			ivpu_dbg(vdev, JOB, "Command queue %d destroyed\n", cmdq->db_id);
+	}
+
+	ret = ivpu_jsm_unregister_db(vdev, cmdq->db_id);
+	if (!ret)
+		ivpu_dbg(vdev, JOB, "DB %d unregistered\n", cmdq->db_id);
+
+	return 0;
+}
+
 static struct ivpu_cmdq *ivpu_cmdq_acquire(struct ivpu_file_priv *file_priv, u16 engine,
 					   u8 priority)
 {
 	int cmdq_idx = IVPU_CMDQ_INDEX(engine, priority);
 	struct ivpu_cmdq *cmdq = file_priv->cmdq[cmdq_idx];
-	struct ivpu_device *vdev = file_priv->vdev;
 	int ret;
 
 	lockdep_assert_held(&file_priv->lock);
 
 	if (!cmdq) {
-		cmdq = ivpu_cmdq_alloc(file_priv, engine);
+		cmdq = ivpu_cmdq_alloc(file_priv);
 		if (!cmdq)
 			return NULL;
 		file_priv->cmdq[cmdq_idx] = cmdq;
 	}
 
-	if (cmdq->db_registered)
-		return cmdq;
-
-	ret = ivpu_jsm_register_db(vdev, file_priv->ctx.id, cmdq->db_id,
-				   cmdq->mem->vpu_addr, ivpu_bo_size(cmdq->mem));
+	ret = ivpu_cmdq_init(file_priv, cmdq, engine, priority);
 	if (ret)
 		return NULL;
 
-	cmdq->db_registered = true;
-
 	return cmdq;
 }
 
@@ -174,9 +256,7 @@ static void ivpu_cmdq_release_locked(struct ivpu_file_priv *file_priv, u16 engin
 
 	if (cmdq) {
 		file_priv->cmdq[cmdq_idx] = NULL;
-		if (cmdq->db_registered)
-			ivpu_jsm_unregister_db(file_priv->vdev, cmdq->db_id);
-
+		ivpu_cmdq_fini(file_priv, cmdq);
 		ivpu_cmdq_free(file_priv, cmdq);
 	}
 }
@@ -194,36 +274,27 @@ void ivpu_cmdq_release_all_locked(struct ivpu_file_priv *file_priv)
 }
 
 /*
- * Mark the doorbell as unregistered and reset job queue pointers.
+ * Mark the doorbell as unregistered
  * This function needs to be called when the VPU hardware is restarted
  * and FW loses job queue state. The next time job queue is used it
  * will be registered again.
  */
-static void ivpu_cmdq_reset_locked(struct ivpu_file_priv *file_priv, u16 engine, u8 priority)
-{
-	int cmdq_idx = IVPU_CMDQ_INDEX(engine, priority);
-	struct ivpu_cmdq *cmdq = file_priv->cmdq[cmdq_idx];
-
-	lockdep_assert_held(&file_priv->lock);
-
-	if (cmdq) {
-		cmdq->db_registered = false;
-		cmdq->jobq->header.head = 0;
-		cmdq->jobq->header.tail = 0;
-		wmb(); /* Flush WC buffer for jobq header */
-	}
-}
-
-static void ivpu_cmdq_reset_all(struct ivpu_file_priv *file_priv)
+static void ivpu_cmdq_reset(struct ivpu_file_priv *file_priv)
 {
 	u16 engine;
 	u8 priority;
 
 	mutex_lock(&file_priv->lock);
 
-	for (engine = 0; engine < IVPU_NUM_ENGINES; engine++)
-		for (priority = 0; priority < IVPU_NUM_PRIORITIES; priority++)
-			ivpu_cmdq_reset_locked(file_priv, engine, priority);
+	for (engine = 0; engine < IVPU_NUM_ENGINES; engine++) {
+		for (priority = 0; priority < IVPU_NUM_PRIORITIES; priority++) {
+			int cmdq_idx = IVPU_CMDQ_INDEX(engine, priority);
+			struct ivpu_cmdq *cmdq = file_priv->cmdq[cmdq_idx];
+
+			if (cmdq)
+				cmdq->db_registered = false;
+		}
+	}
 
 	mutex_unlock(&file_priv->lock);
 }
@@ -236,10 +307,9 @@ void ivpu_cmdq_reset_all_contexts(struct ivpu_device *vdev)
 	mutex_lock(&vdev->context_list_lock);
 
 	xa_for_each(&vdev->context_xa, ctx_id, file_priv)
-		ivpu_cmdq_reset_all(file_priv);
+		ivpu_cmdq_reset(file_priv);
 
 	mutex_unlock(&vdev->context_list_lock);
-
 }
 
 static int ivpu_cmdq_push_job(struct ivpu_cmdq *cmdq, struct ivpu_job *job)
-- 
2.43.2

