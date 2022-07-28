Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA736583FD1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 15:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAC7931A6;
	Thu, 28 Jul 2022 13:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236128B6F4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 13:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659014262; x=1690550262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mmqbMHbo19fvO2VerzjPbnYWCIo4ZSl5kKa6cd+X1VM=;
 b=deSJ5v3wR0sf6hr0sOO0dVusIhFB9fH5xV9Lwcm/iBGAGMs8u86jk5Y3
 O2s0bvv/lwg9RvzVlrqVM+Kw1mgE2VFvXfLSsfGJvBUcrcEHGlFvY+pgB
 K8wFVAHx5EVmTgotDlMlk/5o3p2AYwW4bAejOis/ev4lXvRfy3TkLFmqE
 RGQsl0wi9sl5rLiJvil5pJBHdt+nQ4W/Qd39z7z5jBaKcfqsmZoI98Itt
 RkN4pQESqq02onKeQcGwQ99FbCzaf7TGgNBgmoiBDYdoGvCpJ0DDJDWgV
 N9qt2fFiwcj9AtSGXA1YIY5klmjnHJ5CrHBxEUtA8DSFXY3EGY2tWu7ri w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="288520412"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="288520412"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 06:17:41 -0700
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="659722692"
Received: from jlawryno-desktop.igk.intel.com ([172.22.229.64])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 06:17:40 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v1 7/7] drm/vpu: Add PM support
Date: Thu, 28 Jul 2022 15:17:09 +0200
Message-Id: <20220728131709.1087188-8-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com>
References: <20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: andrzej.kacprowski@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  - Implement cold and warm firmware boot flows
  - Add hang recovery support
  - Add runtime power management support

Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/gpu/drm/vpu/Makefile     |   3 +-
 drivers/gpu/drm/vpu/vpu_drv.c    |  32 ++-
 drivers/gpu/drm/vpu/vpu_drv.h    |   1 +
 drivers/gpu/drm/vpu/vpu_fw.c     |   4 +
 drivers/gpu/drm/vpu/vpu_hw_mtl.c |  12 ++
 drivers/gpu/drm/vpu/vpu_ipc.c    |   6 +
 drivers/gpu/drm/vpu/vpu_job.c    |  17 +-
 drivers/gpu/drm/vpu/vpu_mmu.c    |   4 +
 drivers/gpu/drm/vpu/vpu_pm.c     | 353 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/vpu/vpu_pm.h     |  38 ++++
 10 files changed, 466 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/vpu/vpu_pm.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_pm.h

diff --git a/drivers/gpu/drm/vpu/Makefile b/drivers/gpu/drm/vpu/Makefile
index 70493dacecda..f8218a0b0729 100644
--- a/drivers/gpu/drm/vpu/Makefile
+++ b/drivers/gpu/drm/vpu/Makefile
@@ -10,6 +10,7 @@ intel_vpu-y := \
 	vpu_job.o \
 	vpu_jsm_msg.o \
 	vpu_mmu.o \
-	vpu_mmu_context.o
+	vpu_mmu_context.o \
+	vpu_pm.o
 
 obj-$(CONFIG_DRM_VPU) += intel_vpu.o
diff --git a/drivers/gpu/drm/vpu/vpu_drv.c b/drivers/gpu/drm/vpu/vpu_drv.c
index 74db0cb18491..d62aed956f02 100644
--- a/drivers/gpu/drm/vpu/vpu_drv.c
+++ b/drivers/gpu/drm/vpu/vpu_drv.c
@@ -23,6 +23,7 @@
 #include "vpu_jsm_msg.h"
 #include "vpu_mmu.h"
 #include "vpu_mmu_context.h"
+#include "vpu_pm.h"
 
 #ifndef DRIVER_VERSION_STR
 #define DRIVER_VERSION_STR __stringify(DRM_VPU_DRIVER_MAJOR) "." \
@@ -80,9 +81,11 @@ static void file_priv_release(struct kref *ref)
 	vpu_dbg(FILE, "file_priv release: ctx %u\n", file_priv->ctx.id);
 
 	if (file_priv->ctx.id) {
+		vpu_rpm_get(vdev);
 		vpu_cmdq_release_all(file_priv);
 		vpu_bo_remove_all_bos_from_context(&file_priv->ctx);
 		vpu_mmu_user_context_fini(file_priv);
+		vpu_rpm_put(vdev);
 	}
 
 	kfree(file_priv);
@@ -428,6 +431,10 @@ static int vpu_dev_init(struct vpu_device *vdev)
 	if (!vdev->ipc)
 		return -ENOMEM;
 
+	vdev->pm = devm_kzalloc(vdev->drm.dev, sizeof(*vdev->pm), GFP_KERNEL);
+	if (!vdev->pm)
+		return -ENOMEM;
+
 	vdev->hw->ops = &vpu_hw_mtl_ops;
 	vdev->platform = VPU_PLATFORM_INVALID;
 
@@ -486,10 +493,16 @@ static int vpu_dev_init(struct vpu_device *vdev)
 		goto err_fw_fini;
 	}
 
+	ret = vpu_pm_init(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to initialize PM: %d\n", ret);
+		goto err_ipc_fini;
+	}
+
 	ret = vpu_job_done_thread_init(vdev);
 	if (ret) {
 		vpu_err(vdev, "Failed to initialize job done thread: %d\n", ret);
-		goto err_ipc_fini;
+		goto err_pm_fini;
 	}
 
 	ret = vpu_fw_load(vdev);
@@ -508,6 +521,8 @@ static int vpu_dev_init(struct vpu_device *vdev)
 
 err_job_done_thread_fini:
 	vpu_job_done_thread_fini(vdev);
+err_pm_fini:
+	vpu_pm_fini(vdev);
 err_ipc_fini:
 	vpu_ipc_fini(vdev);
 err_fw_fini:
@@ -530,6 +545,7 @@ static void vpu_dev_fini(struct vpu_device *vdev)
 	vpu_shutdown(vdev);
 
 	vpu_job_done_thread_fini(vdev);
+	vpu_pm_fini(vdev);
 	vpu_ipc_fini(vdev);
 	vpu_fw_fini(vdev);
 	vpu_mmu_fini(vdev);
@@ -584,11 +600,25 @@ static void vpu_remove(struct pci_dev *pdev)
 	vpu_dev_fini(vdev);
 }
 
+static const struct dev_pm_ops vpu_drv_pci_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(vpu_pm_suspend_cb, vpu_pm_resume_cb)
+	SET_RUNTIME_PM_OPS(vpu_pm_runtime_suspend_cb, vpu_pm_runtime_resume_cb, NULL)
+};
+
+static const struct pci_error_handlers vpu_drv_pci_err = {
+	.reset_prepare = vpu_pm_reset_prepare_cb,
+	.reset_done = vpu_pm_reset_done_cb,
+};
+
 static struct pci_driver vpu_pci_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = vpu_pci_ids,
 	.probe = vpu_probe,
 	.remove = vpu_remove,
+	.driver = {
+		.pm = &vpu_drv_pci_pm,
+	},
+	.err_handler = &vpu_drv_pci_err,
 };
 
 static __init int vpu_init(void)
diff --git a/drivers/gpu/drm/vpu/vpu_drv.h b/drivers/gpu/drm/vpu/vpu_drv.h
index f4898399e64b..52593831dc6a 100644
--- a/drivers/gpu/drm/vpu/vpu_drv.h
+++ b/drivers/gpu/drm/vpu/vpu_drv.h
@@ -89,6 +89,7 @@ struct vpu_device {
 	struct vpu_mmu_info *mmu;
 	struct vpu_fw_info *fw;
 	struct vpu_ipc_info *ipc;
+	struct vpu_pm_info *pm;
 
 	struct vpu_mmu_context gctx;
 	struct xarray context_xa;
diff --git a/drivers/gpu/drm/vpu/vpu_fw.c b/drivers/gpu/drm/vpu/vpu_fw.c
index 153aafcf3423..4c10a6f963bc 100644
--- a/drivers/gpu/drm/vpu/vpu_fw.c
+++ b/drivers/gpu/drm/vpu/vpu_fw.c
@@ -14,6 +14,7 @@
 #include "vpu_gem.h"
 #include "vpu_hw.h"
 #include "vpu_ipc.h"
+#include "vpu_pm.h"
 
 #define FW_MAX_NAMES		3
 #define FW_GLOBAL_MEM_START	(2ull * SZ_1G)
@@ -361,9 +362,12 @@ void vpu_fw_boot_params_setup(struct vpu_device *vdev, struct vpu_boot_params *b
 	/* In case of warm boot we only have to reset the entrypoint addr */
 	if (!vpu_fw_is_cold_boot(vdev)) {
 		boot_params->save_restore_ret_address = 0;
+		vdev->pm->is_warmboot = true;
 		return;
 	}
 
+	vdev->pm->is_warmboot = false;
+
 	boot_params->magic = VPU_BOOT_PARAMS_MAGIC;
 	boot_params->vpu_id = to_pci_dev(vdev->drm.dev)->bus->number;
 	boot_params->frequency = vpu_hw_reg_pll_freq_get(vdev);
diff --git a/drivers/gpu/drm/vpu/vpu_hw_mtl.c b/drivers/gpu/drm/vpu/vpu_hw_mtl.c
index ba24dc29f962..93f1799c7284 100644
--- a/drivers/gpu/drm/vpu/vpu_hw_mtl.c
+++ b/drivers/gpu/drm/vpu/vpu_hw_mtl.c
@@ -10,6 +10,7 @@
 #include "vpu_hw.h"
 #include "vpu_ipc.h"
 #include "vpu_mmu.h"
+#include "vpu_pm.h"
 
 #define TILE_FUSE_ENABLE_BOTH	     0x0
 #define TILE_FUSE_ENABLE_LOWER	     0x1
@@ -916,6 +917,8 @@ static irqreturn_t vpu_hw_mtl_irq_wdt_nce_handler(struct vpu_device *vdev)
 {
 	vpu_warn_ratelimited(vdev, "WDT NCE irq\n");
 
+	vpu_pm_schedule_recovery(vdev);
+
 	return IRQ_HANDLED;
 }
 
@@ -924,6 +927,7 @@ static irqreturn_t vpu_hw_mtl_irq_wdt_mss_handler(struct vpu_device *vdev)
 	vpu_warn_ratelimited(vdev, "WDT MSS irq\n");
 
 	vpu_hw_wdt_disable(vdev);
+	vpu_pm_schedule_recovery(vdev);
 
 	return IRQ_HANDLED;
 }
@@ -932,6 +936,8 @@ static irqreturn_t vpu_hw_mtl_irq_noc_firewall_handler(struct vpu_device *vdev)
 {
 	vpu_warn_ratelimited(vdev, "NOC Firewall irq\n");
 
+	vpu_pm_schedule_recovery(vdev);
+
 	return IRQ_HANDLED;
 }
 
@@ -970,6 +976,7 @@ static irqreturn_t vpu_hw_mtl_irqv_handler(struct vpu_device *vdev, int irq)
 /* Handler for IRQs from Buttress core (irqB) */
 static irqreturn_t vpu_hw_mtl_irqb_handler(struct vpu_device *vdev, int irq)
 {
+	bool schedule_recovery = false;
 	u32 status = REGB_RD32(MTL_BUTTRESS_INTERRUPT_STAT) & BUTTRESS_IRQ_MASK;
 
 	REGB_WR32(MTL_BUTTRESS_INTERRUPT_STAT, status);
@@ -980,13 +987,18 @@ static irqreturn_t vpu_hw_mtl_irqb_handler(struct vpu_device *vdev, int irq)
 	if (REG_TEST_FLD(MTL_BUTTRESS_INTERRUPT_STAT, ATS_ERR, status)) {
 		vpu_dbg(IRQ, "ATS_ERR 0x%016llx", REGB_RD64(MTL_BUTTRESS_ATS_ERR_LOG_0));
 		REGB_WR32(MTL_BUTTRESS_ATS_ERR_CLEAR, 0x1);
+		schedule_recovery = true;
 	}
 
 	if (REG_TEST_FLD(MTL_BUTTRESS_INTERRUPT_STAT, UFI_ERR, status)) {
 		vpu_dbg(IRQ, "UFI_ERR 0x%08x", REGB_RD32(MTL_BUTTRESS_UFI_ERR_LOG));
 		REGB_WR32(MTL_BUTTRESS_UFI_ERR_CLEAR, 0x1);
+		schedule_recovery = true;
 	}
 
+	if (schedule_recovery)
+		vpu_pm_schedule_recovery(vdev);
+
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/gpu/drm/vpu/vpu_ipc.c b/drivers/gpu/drm/vpu/vpu_ipc.c
index 0a01e5614a5f..db8a18f353b5 100644
--- a/drivers/gpu/drm/vpu/vpu_ipc.c
+++ b/drivers/gpu/drm/vpu/vpu_ipc.c
@@ -13,6 +13,7 @@
 #include "vpu_hw.h"
 #include "vpu_ipc.h"
 #include "vpu_jsm_msg.h"
+#include "vpu_pm.h"
 
 #define IPC_MAX_RX_MSG	128
 #define IS_KTHREAD()	(get_current()->flags & PF_KTHREAD)
@@ -264,6 +265,10 @@ int vpu_ipc_send_receive(struct vpu_device *vdev, struct vpu_jsm_msg *req,
 
 	vpu_ipc_consumer_add(vdev, &cons, channel);
 
+	ret = vpu_rpm_get(vdev);
+	if (ret < 0)
+		return ret;
+
 	ret = vpu_ipc_send(vdev, &cons, req);
 	if (ret) {
 		vpu_warn(vdev, "IPC send failed: %d\n", ret);
@@ -282,6 +287,7 @@ int vpu_ipc_send_receive(struct vpu_device *vdev, struct vpu_jsm_msg *req,
 	}
 
 consumer_del:
+	vpu_rpm_put(vdev);
 	vpu_ipc_consumer_del(vdev, &cons);
 
 	return ret;
diff --git a/drivers/gpu/drm/vpu/vpu_job.c b/drivers/gpu/drm/vpu/vpu_job.c
index 16ca280d12b2..5b9fed41d34f 100644
--- a/drivers/gpu/drm/vpu/vpu_job.c
+++ b/drivers/gpu/drm/vpu/vpu_job.c
@@ -17,6 +17,7 @@
 #include "vpu_ipc.h"
 #include "vpu_job.h"
 #include "vpu_jsm_msg.h"
+#include "vpu_pm.h"
 
 #define CMD_BUF_IDX	    0
 #define JOB_ID_JOB_MASK	    GENMASK(7, 0)
@@ -264,6 +265,9 @@ static void job_release(struct kref *ref)
 
 	vpu_dbg(KREF, "Job released: id %u\n", job->job_id);
 	kfree(job);
+
+	/* Allow the VPU to get suspended, must be called after vpu_file_priv_put() */
+	vpu_rpm_put(vdev);
 }
 
 static void job_put(struct vpu_job *job)
@@ -280,11 +284,16 @@ vpu_create_job(struct vpu_file_priv *file_priv, u32 engine_idx, u32 bo_count)
 	struct vpu_device *vdev = file_priv->vdev;
 	struct vpu_job *job;
 	size_t buf_size;
+	int ret;
+
+	ret = vpu_rpm_get(vdev);
+	if (ret < 0)
+		return NULL;
 
 	buf_size = sizeof(*job) + bo_count * sizeof(struct vpu_bo *);
 	job = kzalloc(buf_size, GFP_KERNEL);
 	if (!job)
-		return NULL;
+		goto err_rpm_put;
 
 	kref_init(&job->ref);
 
@@ -305,6 +314,8 @@ vpu_create_job(struct vpu_file_priv *file_priv, u32 engine_idx, u32 bo_count)
 
 err_free_job:
 	kfree(job);
+err_rpm_put:
+	vpu_rpm_put(vdev);
 	return NULL;
 }
 
@@ -573,8 +584,10 @@ static int vpu_job_done_thread(void *arg)
 		if (!ret) {
 			vpu_job_done_message(vdev, &jsm_msg);
 		} else if (ret == -ETIMEDOUT) {
-			if (jobs_submitted && !xa_empty(&vdev->submitted_jobs_xa))
+			if (jobs_submitted && !xa_empty(&vdev->submitted_jobs_xa)) {
 				vpu_err(vdev, "TDR detected, timeout %d ms", timeout);
+				vpu_pm_schedule_recovery(vdev);
+			}
 		}
 	}
 
diff --git a/drivers/gpu/drm/vpu/vpu_mmu.c b/drivers/gpu/drm/vpu/vpu_mmu.c
index ace91ee5a857..b0a17d3bc274 100644
--- a/drivers/gpu/drm/vpu/vpu_mmu.c
+++ b/drivers/gpu/drm/vpu/vpu_mmu.c
@@ -11,6 +11,7 @@
 #include "vpu_hw_reg_io.h"
 #include "vpu_mmu.h"
 #include "vpu_mmu_context.h"
+#include "vpu_pm.h"
 
 #define VPU_MMU_IDR0_REF		0x080f3e0f
 #define VPU_MMU_IDR0_REF_SIMICS		0x080f3e1f
@@ -883,6 +884,8 @@ irqreturn_t vpu_mmu_irq_evtq_handler(struct vpu_device *vdev)
 
 	} while (evtq->prod != evtq->cons);
 
+	vpu_pm_schedule_recovery(vdev);
+
 	return IRQ_HANDLED;
 }
 
@@ -901,6 +904,7 @@ irqreturn_t vpu_mmu_irq_gerr_handler(struct vpu_device *vdev)
 
 	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, SFM, active)) {
 		vpu_err_ratelimited(vdev, "MMU has entered service failure mode\n");
+		vpu_pm_schedule_recovery(vdev);
 	}
 
 	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_ABT, active))
diff --git a/drivers/gpu/drm/vpu/vpu_pm.c b/drivers/gpu/drm/vpu/vpu_pm.c
new file mode 100644
index 000000000000..59bb2b42291b
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_pm.c
@@ -0,0 +1,353 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#include <linux/highmem.h>
+#include <linux/moduleparam.h>
+#include <linux/pci.h>
+#include <linux/pm_runtime.h>
+#include <linux/reboot.h>
+
+#include "vpu_boot_api.h"
+#include "vpu_drv.h"
+#include "vpu_hw.h"
+#include "vpu_fw.h"
+#include "vpu_ipc.h"
+#include "vpu_job.h"
+#include "vpu_mmu.h"
+#include "vpu_pm.h"
+
+static bool vpu_disable_recovery;
+module_param_named_unsafe(disable_recovery, vpu_disable_recovery, bool, 0644);
+MODULE_PARM_DESC(disable_recovery, "Disables recovery when VPU hang is detected");
+
+#define PM_RESCHEDULE_LIMIT     5
+
+static void vpu_pm_prepare_cold_boot(struct vpu_device *vdev)
+{
+	struct vpu_fw_info *fw = vdev->fw;
+
+	vpu_cmdq_reset_all_contexts(vdev);
+	vpu_fw_load(vdev);
+	fw->entry_point = fw->cold_boot_entry_point;
+}
+
+static void vpu_pm_prepare_warm_boot(struct vpu_device *vdev)
+{
+	struct vpu_fw_info *fw = vdev->fw;
+	struct vpu_boot_params *bp = fw->mem->kvaddr;
+
+	if (!bp->save_restore_ret_address) {
+		vpu_pm_prepare_cold_boot(vdev);
+		return;
+	}
+
+	vpu_dbg(FW_BOOT, "Save/restore entry point %llx", bp->save_restore_ret_address);
+	fw->entry_point = bp->save_restore_ret_address;
+}
+
+static int vpu_suspend(struct vpu_device *vdev)
+{
+	int ret;
+
+	lockdep_assert_held(&vdev->pm->lock);
+
+	ret = vpu_shutdown(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to shutdown VPU: %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int vpu_resume(struct vpu_device *vdev)
+{
+	int ret;
+
+	lockdep_assert_held(&vdev->pm->lock);
+
+retry:
+	ret = vpu_hw_power_up(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to power up HW: %d\n", ret);
+		return ret;
+	}
+
+	ret = vpu_mmu_enable(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to resume MMU: %d\n", ret);
+		vpu_hw_power_down(vdev);
+		return ret;
+	}
+
+	ret = vpu_boot(vdev);
+	if (ret) {
+		vpu_mmu_disable(vdev);
+		vpu_hw_power_down(vdev);
+		if (!vpu_fw_is_cold_boot(vdev)) {
+			vpu_warn(vdev, "Failed to resume the FW: %d. Retrying cold boot..\n", ret);
+			vpu_pm_prepare_cold_boot(vdev);
+			goto retry;
+		} else {
+			vpu_err(vdev, "Failed to resume the FW: %d\n", ret);
+		}
+	}
+
+	return ret;
+}
+
+static void vpu_pm_recovery_work(struct work_struct *work)
+{
+	struct vpu_pm_info *pm = container_of(work, struct vpu_pm_info, recovery_work);
+	struct vpu_device *vdev =  pm->vdev;
+	char *evt[2] = {"VPU_PM_EVENT=VPU_RECOVER", NULL};
+	int ret;
+
+	ret = pci_reset_function(to_pci_dev(vdev->drm.dev));
+	if (ret)
+		vpu_err(vdev, "Failed to reset VPU: %d\n", ret);
+
+	atomic_set(&pm->in_recovery, 0);
+	kobject_uevent_env(&vdev->drm.dev->kobj, KOBJ_CHANGE, evt);
+}
+
+void vpu_pm_schedule_recovery(struct vpu_device *vdev)
+{
+	struct vpu_pm_info *pm = vdev->pm;
+
+	if (vpu_disable_recovery) {
+		vpu_err(vdev, "Recovery not available when disable_recovery param is set\n");
+		return;
+	}
+
+	if (vpu_is_fpga(vdev)) {
+		vpu_err(vdev, "Recovery not available on FPGA\n");
+		return;
+	}
+
+	/* Schedule recovery if it's not in progress */
+	if (atomic_cmpxchg(&pm->in_recovery, 0, 1) == 0) {
+		vpu_hw_irq_disable(vdev);
+		queue_work(system_long_wq, &pm->recovery_work);
+	}
+}
+
+int vpu_pm_suspend_cb(struct device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct vpu_device *vdev = to_vpu_dev(drm);
+	int ret;
+
+	vpu_dbg(PM, "Suspend..\n");
+
+	mutex_lock(&vdev->pm->lock);
+
+	ret = vpu_suspend(vdev);
+	if (ret && vdev->pm->suspend_reschedule_counter) {
+		vpu_dbg(PM, "VPU failed to enter idle, rescheduling suspend, retries left %d\n",
+			vdev->pm->suspend_reschedule_counter);
+		pm_schedule_suspend(dev, vdev->timeout.reschedule_suspend);
+		vdev->pm->suspend_reschedule_counter--;
+		mutex_unlock(&vdev->pm->lock);
+		return -EBUSY;
+	} else if (!vdev->pm->suspend_reschedule_counter) {
+		vpu_warn(vdev, "VPU failed to enter idle, force suspend\n");
+		vpu_pm_prepare_cold_boot(vdev);
+	} else {
+		vpu_pm_prepare_warm_boot(vdev);
+	}
+
+	vdev->pm->suspend_reschedule_counter = PM_RESCHEDULE_LIMIT;
+
+	pci_save_state(to_pci_dev(dev));
+	pci_set_power_state(to_pci_dev(dev), PCI_D3hot);
+
+	mutex_unlock(&vdev->pm->lock);
+
+	vpu_dbg(PM, "Suspend done.\n");
+
+	return ret;
+}
+
+int vpu_pm_resume_cb(struct device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct vpu_device *vdev = to_vpu_dev(drm);
+	int ret;
+
+	vpu_dbg(PM, "Resume..\n");
+
+	mutex_lock(&vdev->pm->lock);
+
+	pci_set_power_state(to_pci_dev(dev), PCI_D0);
+	pci_restore_state(to_pci_dev(dev));
+
+	ret = vpu_resume(vdev);
+	if (ret)
+		vpu_err(vdev, "Failed to resume: %d\n", ret);
+
+	mutex_unlock(&vdev->pm->lock);
+
+	vpu_dbg(PM, "Resume done.\n");
+
+	return ret;
+}
+
+int vpu_pm_runtime_suspend_cb(struct device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct vpu_device *vdev = to_vpu_dev(drm);
+	int ret;
+
+	vpu_dbg(PM, "Runtime suspend..\n");
+
+	if (!vpu_hw_is_idle(vdev) && vdev->pm->suspend_reschedule_counter) {
+		vpu_dbg(PM, "VPU failed to enter idle, rescheduling suspend, retries left %d\n",
+			vdev->pm->suspend_reschedule_counter);
+		pm_schedule_suspend(dev, vdev->timeout.reschedule_suspend);
+		vdev->pm->suspend_reschedule_counter--;
+		return -EAGAIN;
+	}
+
+	mutex_lock(&vdev->pm->lock);
+
+	ret = vpu_suspend(vdev);
+	if (ret)
+		vpu_err(vdev, "Failed to set suspend VPU: %d\n", ret);
+
+	if (!vdev->pm->suspend_reschedule_counter) {
+		vpu_warn(vdev, "VPU failed to enter idle, force suspended.\n");
+		vpu_pm_prepare_cold_boot(vdev);
+	} else {
+		vpu_pm_prepare_warm_boot(vdev);
+	}
+
+	vdev->pm->suspend_reschedule_counter = PM_RESCHEDULE_LIMIT;
+	mutex_unlock(&vdev->pm->lock);
+
+	vpu_dbg(PM, "Runtime suspend done.\n");
+
+	return 0;
+}
+
+int vpu_pm_runtime_resume_cb(struct device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct vpu_device *vdev = to_vpu_dev(drm);
+	int ret;
+
+	vpu_dbg(PM, "Runtime resume..\n");
+
+	mutex_lock(&vdev->pm->lock);
+
+	ret = vpu_resume(vdev);
+	if (ret)
+		vpu_err(vdev, "Failed to set RESUME state: %d\n", ret);
+
+	mutex_unlock(&vdev->pm->lock);
+
+	vpu_dbg(PM, "Runtime resume done.\n");
+
+	return ret;
+}
+
+int vpu_rpm_get(struct vpu_device *vdev)
+{
+	int ret;
+
+	vpu_dbg(PM, "rpm_get count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
+
+	ret = pm_runtime_get_sync(vdev->drm.dev);
+	if (ret < 0) {
+		vpu_err(vdev, "Failed to resume operation: %d\n", ret);
+		pm_runtime_put_noidle(vdev->drm.dev);
+	} else {
+		vdev->pm->suspend_reschedule_counter = PM_RESCHEDULE_LIMIT;
+	}
+
+	return ret;
+}
+
+void vpu_rpm_put(struct vpu_device *vdev)
+{
+	vpu_dbg(PM, "rpm_put count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
+
+	pm_runtime_mark_last_busy(vdev->drm.dev);
+	pm_runtime_put_autosuspend(vdev->drm.dev);
+}
+
+void vpu_pm_reset_prepare_cb(struct pci_dev *pdev)
+{
+	struct vpu_device *vdev = pci_get_drvdata(pdev);
+
+	vpu_dbg(PM, "Pre-reset..\n");
+
+	mutex_lock(&vdev->pm->lock);
+
+	vpu_shutdown(vdev);
+	vpu_pm_prepare_cold_boot(vdev);
+	vpu_jobs_abort_all(vdev);
+
+	mutex_unlock(&vdev->pm->lock);
+
+	vpu_dbg(PM, "Pre-reset done.\n");
+}
+
+void vpu_pm_reset_done_cb(struct pci_dev *pdev)
+{
+	struct vpu_device *vdev = pci_get_drvdata(pdev);
+	int ret;
+
+	vpu_dbg(PM, "Post-reset..\n");
+
+	mutex_lock(&vdev->pm->lock);
+
+	ret = vpu_resume(vdev);
+	if (ret)
+		vpu_err(vdev, "Failed to set RESUME state: %d\n", ret);
+
+	mutex_unlock(&vdev->pm->lock);
+
+	vpu_dbg(PM, "Post-reset done.\n");
+}
+
+int vpu_pm_init(struct vpu_device *vdev)
+{
+	struct device *dev = vdev->drm.dev;
+	struct vpu_pm_info *pm = vdev->pm;
+
+	pm->vdev = vdev;
+	pm->suspend_reschedule_counter = PM_RESCHEDULE_LIMIT;
+
+	atomic_set(&pm->in_recovery, 0);
+	INIT_WORK(&pm->recovery_work, vpu_pm_recovery_work);
+	mutex_init(&pm->lock);
+
+	pm_runtime_use_autosuspend(dev);
+
+	if (vpu_disable_recovery)
+		pm_runtime_set_autosuspend_delay(dev, -1);
+	else if (vpu_is_silicon(vdev))
+		pm_runtime_set_autosuspend_delay(dev, 1000);
+	else
+		pm_runtime_set_autosuspend_delay(dev, 60000);
+
+	pm_runtime_set_active(dev);
+	pm_runtime_allow(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	vpu_dbg(PM, "Initial RPM count %d\n", atomic_read(&dev->power.usage_count));
+
+	return 0;
+}
+
+void vpu_pm_fini(struct vpu_device *vdev)
+{
+	pm_runtime_forbid(vdev->drm.dev);
+	pm_runtime_get_noresume(vdev->drm.dev);
+
+	vpu_dbg(PM, "Release RPM count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
+}
diff --git a/drivers/gpu/drm/vpu/vpu_pm.h b/drivers/gpu/drm/vpu/vpu_pm.h
new file mode 100644
index 000000000000..c1709225ae5c
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_pm.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#ifndef __VPU_PM_H__
+#define __VPU_PM_H__
+
+#include <linux/types.h>
+
+struct vpu_device;
+
+struct vpu_pm_info {
+	struct vpu_device *vdev;
+	struct mutex lock; /* Protects state transitions */
+	struct work_struct recovery_work;
+	atomic_t in_recovery;
+	bool is_warmboot;
+	u32 suspend_reschedule_counter;
+};
+
+int vpu_pm_init(struct vpu_device *vdev);
+void vpu_pm_fini(struct vpu_device *vdev);
+
+int vpu_pm_suspend_cb(struct device *dev);
+int vpu_pm_resume_cb(struct device *dev);
+int vpu_pm_runtime_suspend_cb(struct device *dev);
+int vpu_pm_runtime_resume_cb(struct device *dev);
+
+void vpu_pm_reset_prepare_cb(struct pci_dev *pdev);
+void vpu_pm_reset_done_cb(struct pci_dev *pdev);
+
+int vpu_rpm_get(struct vpu_device *vdev);
+void vpu_rpm_put(struct vpu_device *vdev);
+
+void vpu_pm_schedule_recovery(struct vpu_device *vdev);
+
+#endif /* __VPU_PM_H__ */
-- 
2.34.1

