Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E75D5E5F43
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 12:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2249910EA92;
	Thu, 22 Sep 2022 10:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8165610EA92
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 10:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663841000; x=1695377000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EZCRpVSKQVyP6bnIV9RwsgEVokwE2S1VUGA5FNaOYco=;
 b=UkZ0OzKHQa6USVZULsI8S+q0WS/pcmMn5fW4PnL3Rr+HJG/vvyYGRi6/
 TO785VoxgHcredBjjS8DHEHS1pGa0OndETZ0+zWUvDSOuR1I9Ma57ZQSX
 2F4i6R0aMTW+O1N5Krxwvm6HAPLYsUoHH+wUpyZpjUtJHaGfsxOKTZ1q8
 518wzEEVG2RsRRWlZ6PE5Z7hJlyrDAarzmdezC5bPexV/vpcl5aalYtkJ
 0HsZujqfpel9i5Tbla123X4zbITGJZh6lHYMbS26zyTIIz3er03UvD19f
 O3frby0gG2KCfMiEqtNCRhj+X3Bpb36/g2zb88dN9gBNwcmlSn+klqTeb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="298972716"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="298972716"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 03:03:20 -0700
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="745324619"
Received: from jlawryno-desktop.igk.intel.com ([172.22.229.64])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 03:03:17 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v3 7/7] drm/ivpu: Add PM support
Date: Thu, 22 Sep 2022 12:02:52 +0200
Message-Id: <20220922100252.84264-8-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922100252.84264-1-jacek.lawrynowicz@linux.intel.com>
References: <20220922100252.84264-1-jacek.lawrynowicz@linux.intel.com>
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
 drivers/gpu/drm/ivpu/Makefile      |   3 +-
 drivers/gpu/drm/ivpu/ivpu_drv.c    |  34 ++-
 drivers/gpu/drm/ivpu/ivpu_drv.h    |   2 +
 drivers/gpu/drm/ivpu/ivpu_fw.c     |   4 +
 drivers/gpu/drm/ivpu/ivpu_hw_mtl.c |  16 +-
 drivers/gpu/drm/ivpu/ivpu_ipc.c    |  11 +-
 drivers/gpu/drm/ivpu/ivpu_job.c    |  14 +-
 drivers/gpu/drm/ivpu/ivpu_mmu.c    |   7 +-
 drivers/gpu/drm/ivpu/ivpu_pm.c     | 352 +++++++++++++++++++++++++++++
 drivers/gpu/drm/ivpu/ivpu_pm.h     |  38 ++++
 10 files changed, 475 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_pm.c
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_pm.h

diff --git a/drivers/gpu/drm/ivpu/Makefile b/drivers/gpu/drm/ivpu/Makefile
index e87d8182c5c7..c17e4a25f751 100644
--- a/drivers/gpu/drm/ivpu/Makefile
+++ b/drivers/gpu/drm/ivpu/Makefile
@@ -10,6 +10,7 @@ intel_vpu-y := \
 	ivpu_job.o \
 	ivpu_jsm_msg.o \
 	ivpu_mmu.o \
-	ivpu_mmu_context.o
+	ivpu_mmu_context.o \
+	ivpu_pm.o
 
 obj-$(CONFIG_DRM_IVPU) += intel_vpu.o
diff --git a/drivers/gpu/drm/ivpu/ivpu_drv.c b/drivers/gpu/drm/ivpu/ivpu_drv.c
index 51e1f124139a..c31ce1bbc5be 100644
--- a/drivers/gpu/drm/ivpu/ivpu_drv.c
+++ b/drivers/gpu/drm/ivpu/ivpu_drv.c
@@ -23,6 +23,7 @@
 #include "ivpu_jsm_msg.h"
 #include "ivpu_mmu.h"
 #include "ivpu_mmu_context.h"
+#include "ivpu_pm.h"
 
 #ifndef DRIVER_VERSION_STR
 #define DRIVER_VERSION_STR __stringify(DRM_IVPU_DRIVER_MAJOR) "." \
@@ -80,9 +81,11 @@ static void file_priv_release(struct kref *ref)
 	ivpu_dbg(FILE, "file_priv release: ctx %u\n", file_priv->ctx.id);
 
 	if (file_priv->ctx.id) {
+		ivpu_rpm_get(vdev);
 		ivpu_cmdq_release_all(file_priv);
 		ivpu_bo_remove_all_bos_from_context(&file_priv->ctx);
 		ivpu_mmu_user_context_fini(file_priv);
+		ivpu_rpm_put(vdev);
 	}
 
 	kfree(file_priv);
@@ -273,6 +276,7 @@ static int ivpu_wait_for_ready(struct ivpu_device *vdev)
 
 int ivpu_boot(struct ivpu_device *vdev)
 {
+	struct ivpu_pm_info *pm = vdev->pm;
 	int ret;
 
 	/* Update boot params located at first 4KB of FW memory */
@@ -290,6 +294,7 @@ int ivpu_boot(struct ivpu_device *vdev)
 		return ret;
 	}
 
+	atomic_set(&pm->in_recovery, 0);
 	ivpu_hw_irq_clear(vdev);
 	ivpu_hw_irq_enable(vdev);
 	ivpu_ipc_enable(vdev);
@@ -427,6 +432,10 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	if (!vdev->ipc)
 		return -ENOMEM;
 
+	vdev->pm = devm_kzalloc(vdev->drm.dev, sizeof(*vdev->pm), GFP_KERNEL);
+	if (!vdev->pm)
+		return -ENOMEM;
+
 	vdev->hw->ops = &ivpu_hw_mtl_ops;
 	vdev->platform = IVPU_PLATFORM_INVALID;
 
@@ -485,10 +494,16 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 		goto err_fw_fini;
 	}
 
+	ret = ivpu_pm_init(vdev);
+	if (ret) {
+		ivpu_err(vdev, "Failed to initialize PM: %d\n", ret);
+		goto err_ipc_fini;
+	}
+
 	ret = ivpu_job_done_thread_init(vdev);
 	if (ret) {
 		ivpu_err(vdev, "Failed to initialize job done thread: %d\n", ret);
-		goto err_ipc_fini;
+		goto err_pm_fini;
 	}
 
 	ret = ivpu_fw_load(vdev);
@@ -507,6 +522,8 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 
 err_job_done_thread_fini:
 	ivpu_job_done_thread_fini(vdev);
+err_pm_fini:
+	ivpu_pm_fini(vdev);
 err_ipc_fini:
 	ivpu_ipc_fini(vdev);
 err_fw_fini:
@@ -529,6 +546,7 @@ static void ivpu_dev_fini(struct ivpu_device *vdev)
 	ivpu_shutdown(vdev);
 
 	ivpu_job_done_thread_fini(vdev);
+	ivpu_pm_fini(vdev);
 	ivpu_ipc_fini(vdev);
 	ivpu_fw_fini(vdev);
 	ivpu_mmu_fini(vdev);
@@ -583,11 +601,25 @@ static void ivpu_remove(struct pci_dev *pdev)
 	ivpu_dev_fini(vdev);
 }
 
+static const struct dev_pm_ops ivpu_drv_pci_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(ivpu_pm_suspend_cb, ivpu_pm_resume_cb)
+	SET_RUNTIME_PM_OPS(ivpu_pm_runtime_suspend_cb, ivpu_pm_runtime_resume_cb, NULL)
+};
+
+static const struct pci_error_handlers ivpu_drv_pci_err = {
+	.reset_prepare = ivpu_pm_reset_prepare_cb,
+	.reset_done = ivpu_pm_reset_done_cb,
+};
+
 static struct pci_driver ivpu_pci_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = ivpu_pci_ids,
 	.probe = ivpu_probe,
 	.remove = ivpu_remove,
+	.driver = {
+		.pm = &ivpu_drv_pci_pm,
+	},
+	.err_handler = &ivpu_drv_pci_err,
 };
 
 static __init int ivpu_init(void)
diff --git a/drivers/gpu/drm/ivpu/ivpu_drv.h b/drivers/gpu/drm/ivpu/ivpu_drv.h
index 59544b3efec8..57f87e0a62c8 100644
--- a/drivers/gpu/drm/ivpu/ivpu_drv.h
+++ b/drivers/gpu/drm/ivpu/ivpu_drv.h
@@ -75,6 +75,7 @@ struct ivpu_hw_info;
 struct ivpu_mmu_info;
 struct ivpu_fw_info;
 struct ivpu_ipc_info;
+struct ivpu_pm_info;
 
 struct ivpu_device {
 	struct drm_device drm; /* Must be first */
@@ -88,6 +89,7 @@ struct ivpu_device {
 	struct ivpu_mmu_info *mmu;
 	struct ivpu_fw_info *fw;
 	struct ivpu_ipc_info *ipc;
+	struct ivpu_pm_info *pm;
 
 	struct ivpu_mmu_context gctx;
 	struct xarray context_xa;
diff --git a/drivers/gpu/drm/ivpu/ivpu_fw.c b/drivers/gpu/drm/ivpu/ivpu_fw.c
index d55f13f2daed..0b94c616ad7e 100644
--- a/drivers/gpu/drm/ivpu/ivpu_fw.c
+++ b/drivers/gpu/drm/ivpu/ivpu_fw.c
@@ -14,6 +14,7 @@
 #include "ivpu_gem.h"
 #include "ivpu_hw.h"
 #include "ivpu_ipc.h"
+#include "ivpu_pm.h"
 
 #define FW_MAX_NAMES		3
 #define FW_GLOBAL_MEM_START	(2ull * SZ_1G)
@@ -367,9 +368,12 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	/* In case of warm boot we only have to reset the entrypoint addr */
 	if (!ivpu_fw_is_cold_boot(vdev)) {
 		boot_params->save_restore_ret_address = 0;
+		vdev->pm->is_warmboot = true;
 		return;
 	}
 
+	vdev->pm->is_warmboot = false;
+
 	boot_params->magic = VPU_BOOT_PARAMS_MAGIC;
 	boot_params->vpu_id = to_pci_dev(vdev->drm.dev)->bus->number;
 	boot_params->frequency = ivpu_hw_reg_pll_freq_get(vdev);
diff --git a/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c b/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c
index e20bd839290b..c2334e626fb0 100644
--- a/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c
+++ b/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c
@@ -10,6 +10,7 @@
 #include "ivpu_hw.h"
 #include "ivpu_ipc.h"
 #include "ivpu_mmu.h"
+#include "ivpu_pm.h"
 
 #define TILE_FUSE_ENABLE_BOTH	     0x0
 #define TILE_FUSE_ENABLE_UPPER	     0x1
@@ -916,6 +917,8 @@ static irqreturn_t ivpu_hw_mtl_irq_wdt_nce_handler(struct ivpu_device *vdev)
 {
 	ivpu_err_ratelimited(vdev, "WDT NCE irq\n");
 
+	ivpu_pm_schedule_recovery(vdev);
+
 	return IRQ_HANDLED;
 }
 
@@ -924,6 +927,7 @@ static irqreturn_t ivpu_hw_mtl_irq_wdt_mss_handler(struct ivpu_device *vdev)
 	ivpu_err_ratelimited(vdev, "WDT MSS irq\n");
 
 	ivpu_hw_wdt_disable(vdev);
+	ivpu_pm_schedule_recovery(vdev);
 
 	return IRQ_HANDLED;
 }
@@ -932,6 +936,8 @@ static irqreturn_t ivpu_hw_mtl_irq_noc_firewall_handler(struct ivpu_device *vdev
 {
 	ivpu_err_ratelimited(vdev, "NOC Firewall irq\n");
 
+	ivpu_pm_schedule_recovery(vdev);
+
 	return IRQ_HANDLED;
 }
 
@@ -970,6 +976,7 @@ static irqreturn_t ivpu_hw_mtl_irqv_handler(struct ivpu_device *vdev, int irq)
 /* Handler for IRQs from Buttress core (irqB) */
 static irqreturn_t ivpu_hw_mtl_irqb_handler(struct ivpu_device *vdev, int irq)
 {
+	bool schedule_recovery = false;
 	u32 status = REGB_RD32(MTL_BUTTRESS_INTERRUPT_STAT) & BUTTRESS_IRQ_MASK;
 
 	REGB_WR32(MTL_BUTTRESS_INTERRUPT_STAT, status);
@@ -980,19 +987,25 @@ static irqreturn_t ivpu_hw_mtl_irqb_handler(struct ivpu_device *vdev, int irq)
 	if (REG_TEST_FLD(MTL_BUTTRESS_INTERRUPT_STAT, ATS_ERR, status)) {
 		ivpu_dbg(IRQ, "ATS_ERR 0x%016llx", REGB_RD64(MTL_BUTTRESS_ATS_ERR_LOG_0));
 		REGB_WR32(MTL_BUTTRESS_ATS_ERR_CLEAR, 0x1);
+		schedule_recovery = true;
 	}
 
 	if (REG_TEST_FLD(MTL_BUTTRESS_INTERRUPT_STAT, UFI_ERR, status)) {
 		ivpu_dbg(IRQ, "UFI_ERR 0x%08x", REGB_RD32(MTL_BUTTRESS_UFI_ERR_LOG));
 		REGB_WR32(MTL_BUTTRESS_UFI_ERR_CLEAR, 0x1);
+		schedule_recovery = true;
 	}
 
+	if (schedule_recovery)
+		ivpu_pm_schedule_recovery(vdev);
+
 	return IRQ_HANDLED;
 }
 
 static irqreturn_t ivpu_hw_mtl_irq_handler(int irq, void *ptr)
 {
 	struct ivpu_device *vdev = ptr;
+	struct ivpu_pm_info *pm = vdev->pm;
 	irqreturn_t ret_irqv;
 	irqreturn_t ret_irqb;
 
@@ -1001,7 +1014,8 @@ static irqreturn_t ivpu_hw_mtl_irq_handler(int irq, void *ptr)
 	ret_irqv = ivpu_hw_mtl_irqv_handler(vdev, irq);
 	ret_irqb = ivpu_hw_mtl_irqb_handler(vdev, irq);
 
-	ivpu_hw_mtl_irq_enable(vdev);
+	if (!atomic_read(&pm->in_recovery))
+		ivpu_hw_mtl_irq_enable(vdev);
 
 	return ret_irqv & ret_irqb;
 }
diff --git a/drivers/gpu/drm/ivpu/ivpu_ipc.c b/drivers/gpu/drm/ivpu/ivpu_ipc.c
index 9eac5d25f3ea..90aef3356a20 100644
--- a/drivers/gpu/drm/ivpu/ivpu_ipc.c
+++ b/drivers/gpu/drm/ivpu/ivpu_ipc.c
@@ -14,6 +14,7 @@
 #include "ivpu_hw_reg_io.h"
 #include "ivpu_ipc.h"
 #include "ivpu_jsm_msg.h"
+#include "ivpu_pm.h"
 
 #define IPC_MAX_RX_MSG	128
 #define IS_KTHREAD()	(get_current()->flags & PF_KTHREAD)
@@ -264,6 +265,10 @@ ivpu_ipc_send_receive_internal(struct ivpu_device *vdev, struct vpu_jsm_msg *req
 	struct ivpu_ipc_consumer cons;
 	int ret;
 
+	ret = ivpu_rpm_get(vdev);
+	if (ret < 0)
+		return ret;
+
 	ivpu_ipc_consumer_add(vdev, &cons, channel);
 
 	ret = ivpu_ipc_send(vdev, &cons, req);
@@ -286,6 +291,8 @@ ivpu_ipc_send_receive_internal(struct ivpu_device *vdev, struct vpu_jsm_msg *req
 
 consumer_del:
 	ivpu_ipc_consumer_del(vdev, &cons);
+	ivpu_rpm_put(vdev);
+
 	return ret;
 }
 
@@ -305,8 +312,10 @@ int ivpu_ipc_send_receive(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
 
 	ret = ivpu_ipc_send_receive_internal(vdev, &hb_req, VPU_JSM_MSG_QUERY_ENGINE_HB_DONE,
 					     &hb_resp, VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
-	if (ret)
+	if (ret) {
 		ivpu_hw_diagnose_tdr(vdev);
+		ivpu_pm_schedule_recovery(vdev);
+	}
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/ivpu/ivpu_job.c b/drivers/gpu/drm/ivpu/ivpu_job.c
index 07241f4a87bd..a8540934cbd2 100644
--- a/drivers/gpu/drm/ivpu/ivpu_job.c
+++ b/drivers/gpu/drm/ivpu/ivpu_job.c
@@ -17,6 +17,7 @@
 #include "ivpu_ipc.h"
 #include "ivpu_job.h"
 #include "ivpu_jsm_msg.h"
+#include "ivpu_pm.h"
 
 #define CMD_BUF_IDX	    0
 #define JOB_ID_JOB_MASK	    GENMASK(7, 0)
@@ -264,6 +265,9 @@ static void job_release(struct kref *ref)
 
 	ivpu_dbg(KREF, "Job released: id %u\n", job->job_id);
 	kfree(job);
+
+	/* Allow the VPU to get suspended, must be called after ivpu_file_priv_put() */
+	ivpu_rpm_put(vdev);
 }
 
 static void job_put(struct ivpu_job *job)
@@ -280,11 +284,16 @@ ivpu_create_job(struct ivpu_file_priv *file_priv, u32 engine_idx, u32 bo_count)
 	struct ivpu_device *vdev = file_priv->vdev;
 	struct ivpu_job *job;
 	size_t buf_size;
+	int ret;
+
+	ret = ivpu_rpm_get(vdev);
+	if (ret < 0)
+		return NULL;
 
 	buf_size = sizeof(*job) + bo_count * sizeof(struct ivpu_bo *);
 	job = kzalloc(buf_size, GFP_KERNEL);
 	if (!job)
-		return NULL;
+		goto err_rpm_put;
 
 	kref_init(&job->ref);
 
@@ -305,6 +314,8 @@ ivpu_create_job(struct ivpu_file_priv *file_priv, u32 engine_idx, u32 bo_count)
 
 err_free_job:
 	kfree(job);
+err_rpm_put:
+	ivpu_rpm_put(vdev);
 	return NULL;
 }
 
@@ -580,6 +591,7 @@ static int ivpu_job_done_thread(void *arg)
 			if (jobs_submitted && !xa_empty(&vdev->submitted_jobs_xa)) {
 				ivpu_err(vdev, "TDR detected, timeout %d ms", timeout);
 				ivpu_hw_diagnose_tdr(vdev);
+				ivpu_pm_schedule_recovery(vdev);
 			}
 		}
 	}
diff --git a/drivers/gpu/drm/ivpu/ivpu_mmu.c b/drivers/gpu/drm/ivpu/ivpu_mmu.c
index b9f225a83c45..13887fea8bca 100644
--- a/drivers/gpu/drm/ivpu/ivpu_mmu.c
+++ b/drivers/gpu/drm/ivpu/ivpu_mmu.c
@@ -11,6 +11,7 @@
 #include "ivpu_hw_reg_io.h"
 #include "ivpu_mmu.h"
 #include "ivpu_mmu_context.h"
+#include "ivpu_pm.h"
 
 #define IVPU_MMU_IDR0_REF		0x080f3e0f
 #define IVPU_MMU_IDR0_REF_SIMICS	0x080f3e1f
@@ -827,6 +828,8 @@ irqreturn_t ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev)
 
 	} while (evtq->prod != evtq->cons);
 
+	ivpu_pm_schedule_recovery(vdev);
+
 	return IRQ_HANDLED;
 }
 
@@ -843,8 +846,10 @@ irqreturn_t ivpu_mmu_irq_gerr_handler(struct ivpu_device *vdev)
 	if (!(active & IVPU_MMU_GERROR_ERR_MASK))
 		return IRQ_NONE;
 
-	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, SFM, active))
+	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, SFM, active)) {
 		ivpu_err_ratelimited(vdev, "MMU has entered service failure mode\n");
+		ivpu_pm_schedule_recovery(vdev);
+	}
 
 	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_ABT, active))
 		ivpu_warn_ratelimited(vdev, "MMU MSI ABT write aborted\n");
diff --git a/drivers/gpu/drm/ivpu/ivpu_pm.c b/drivers/gpu/drm/ivpu/ivpu_pm.c
new file mode 100644
index 000000000000..2e5e9843b1c5
--- /dev/null
+++ b/drivers/gpu/drm/ivpu/ivpu_pm.c
@@ -0,0 +1,352 @@
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
+#include "ivpu_drv.h"
+#include "ivpu_hw.h"
+#include "ivpu_fw.h"
+#include "ivpu_ipc.h"
+#include "ivpu_job.h"
+#include "ivpu_mmu.h"
+#include "ivpu_pm.h"
+
+static bool ivpu_disable_recovery;
+module_param_named_unsafe(disable_recovery, ivpu_disable_recovery, bool, 0644);
+MODULE_PARM_DESC(disable_recovery, "Disables recovery when VPU hang is detected");
+
+#define PM_RESCHEDULE_LIMIT     5
+
+static void ivpu_pm_prepare_cold_boot(struct ivpu_device *vdev)
+{
+	struct ivpu_fw_info *fw = vdev->fw;
+
+	ivpu_cmdq_reset_all_contexts(vdev);
+	ivpu_fw_load(vdev);
+	fw->entry_point = fw->cold_boot_entry_point;
+}
+
+static void ivpu_pm_prepare_warm_boot(struct ivpu_device *vdev)
+{
+	struct ivpu_fw_info *fw = vdev->fw;
+	struct vpu_boot_params *bp = fw->mem->kvaddr;
+
+	if (!bp->save_restore_ret_address) {
+		ivpu_pm_prepare_cold_boot(vdev);
+		return;
+	}
+
+	ivpu_dbg(FW_BOOT, "Save/restore entry point %llx", bp->save_restore_ret_address);
+	fw->entry_point = bp->save_restore_ret_address;
+}
+
+static int ivpu_suspend(struct ivpu_device *vdev)
+{
+	int ret;
+
+	lockdep_assert_held(&vdev->pm->lock);
+
+	ret = ivpu_shutdown(vdev);
+	if (ret) {
+		ivpu_err(vdev, "Failed to shutdown VPU: %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int ivpu_resume(struct ivpu_device *vdev)
+{
+	int ret;
+
+	lockdep_assert_held(&vdev->pm->lock);
+
+retry:
+	ret = ivpu_hw_power_up(vdev);
+	if (ret) {
+		ivpu_err(vdev, "Failed to power up HW: %d\n", ret);
+		return ret;
+	}
+
+	ret = ivpu_mmu_enable(vdev);
+	if (ret) {
+		ivpu_err(vdev, "Failed to resume MMU: %d\n", ret);
+		ivpu_hw_power_down(vdev);
+		return ret;
+	}
+
+	ret = ivpu_boot(vdev);
+	if (ret) {
+		ivpu_mmu_disable(vdev);
+		ivpu_hw_power_down(vdev);
+		if (!ivpu_fw_is_cold_boot(vdev)) {
+			ivpu_warn(vdev, "Failed to resume the FW: %d. Retrying cold boot..\n", ret);
+			ivpu_pm_prepare_cold_boot(vdev);
+			goto retry;
+		} else {
+			ivpu_err(vdev, "Failed to resume the FW: %d\n", ret);
+		}
+	}
+
+	return ret;
+}
+
+static void ivpu_pm_recovery_work(struct work_struct *work)
+{
+	struct ivpu_pm_info *pm = container_of(work, struct ivpu_pm_info, recovery_work);
+	struct ivpu_device *vdev =  pm->vdev;
+	char *evt[2] = {"IVPU_PM_EVENT=IVPU_RECOVER", NULL};
+	int ret;
+
+	ret = pci_reset_function(to_pci_dev(vdev->drm.dev));
+	if (ret)
+		ivpu_err(vdev, "Failed to reset VPU: %d\n", ret);
+
+	kobject_uevent_env(&vdev->drm.dev->kobj, KOBJ_CHANGE, evt);
+}
+
+void ivpu_pm_schedule_recovery(struct ivpu_device *vdev)
+{
+	struct ivpu_pm_info *pm = vdev->pm;
+
+	if (ivpu_disable_recovery) {
+		ivpu_err(vdev, "Recovery not available when disable_recovery param is set\n");
+		return;
+	}
+
+	if (ivpu_is_fpga(vdev)) {
+		ivpu_err(vdev, "Recovery not available on FPGA\n");
+		return;
+	}
+
+	/* Schedule recovery if it's not in progress */
+	if (atomic_cmpxchg(&pm->in_recovery, 0, 1) == 0) {
+		ivpu_hw_irq_disable(vdev);
+		queue_work(system_long_wq, &pm->recovery_work);
+	}
+}
+
+int ivpu_pm_suspend_cb(struct device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct ivpu_device *vdev = to_ivpu_device(drm);
+	int ret;
+
+	ivpu_dbg(PM, "Suspend..\n");
+
+	mutex_lock(&vdev->pm->lock);
+
+	ret = ivpu_suspend(vdev);
+	if (ret && vdev->pm->suspend_reschedule_counter) {
+		ivpu_dbg(PM, "VPU failed to enter idle, rescheduling suspend, retries left %d\n",
+			 vdev->pm->suspend_reschedule_counter);
+		pm_schedule_suspend(dev, vdev->timeout.reschedule_suspend);
+		vdev->pm->suspend_reschedule_counter--;
+		mutex_unlock(&vdev->pm->lock);
+		return -EBUSY;
+	} else if (!vdev->pm->suspend_reschedule_counter) {
+		ivpu_warn(vdev, "VPU failed to enter idle, force suspend\n");
+		ivpu_pm_prepare_cold_boot(vdev);
+	} else {
+		ivpu_pm_prepare_warm_boot(vdev);
+	}
+
+	vdev->pm->suspend_reschedule_counter = PM_RESCHEDULE_LIMIT;
+
+	pci_save_state(to_pci_dev(dev));
+	pci_set_power_state(to_pci_dev(dev), PCI_D3hot);
+
+	mutex_unlock(&vdev->pm->lock);
+
+	ivpu_dbg(PM, "Suspend done.\n");
+
+	return ret;
+}
+
+int ivpu_pm_resume_cb(struct device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct ivpu_device *vdev = to_ivpu_device(drm);
+	int ret;
+
+	ivpu_dbg(PM, "Resume..\n");
+
+	mutex_lock(&vdev->pm->lock);
+
+	pci_set_power_state(to_pci_dev(dev), PCI_D0);
+	pci_restore_state(to_pci_dev(dev));
+
+	ret = ivpu_resume(vdev);
+	if (ret)
+		ivpu_err(vdev, "Failed to resume: %d\n", ret);
+
+	mutex_unlock(&vdev->pm->lock);
+
+	ivpu_dbg(PM, "Resume done.\n");
+
+	return ret;
+}
+
+int ivpu_pm_runtime_suspend_cb(struct device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct ivpu_device *vdev = to_ivpu_device(drm);
+	int ret;
+
+	ivpu_dbg(PM, "Runtime suspend..\n");
+
+	if (!ivpu_hw_is_idle(vdev) && vdev->pm->suspend_reschedule_counter) {
+		ivpu_dbg(PM, "VPU failed to enter idle, rescheduling suspend, retries left %d\n",
+			 vdev->pm->suspend_reschedule_counter);
+		pm_schedule_suspend(dev, vdev->timeout.reschedule_suspend);
+		vdev->pm->suspend_reschedule_counter--;
+		return -EAGAIN;
+	}
+
+	mutex_lock(&vdev->pm->lock);
+
+	ret = ivpu_suspend(vdev);
+	if (ret)
+		ivpu_err(vdev, "Failed to set suspend VPU: %d\n", ret);
+
+	if (!vdev->pm->suspend_reschedule_counter) {
+		ivpu_warn(vdev, "VPU failed to enter idle, force suspended.\n");
+		ivpu_pm_prepare_cold_boot(vdev);
+	} else {
+		ivpu_pm_prepare_warm_boot(vdev);
+	}
+
+	vdev->pm->suspend_reschedule_counter = PM_RESCHEDULE_LIMIT;
+	mutex_unlock(&vdev->pm->lock);
+
+	ivpu_dbg(PM, "Runtime suspend done.\n");
+
+	return 0;
+}
+
+int ivpu_pm_runtime_resume_cb(struct device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct ivpu_device *vdev = to_ivpu_device(drm);
+	int ret;
+
+	ivpu_dbg(PM, "Runtime resume..\n");
+
+	mutex_lock(&vdev->pm->lock);
+
+	ret = ivpu_resume(vdev);
+	if (ret)
+		ivpu_err(vdev, "Failed to set RESUME state: %d\n", ret);
+
+	mutex_unlock(&vdev->pm->lock);
+
+	ivpu_dbg(PM, "Runtime resume done.\n");
+
+	return ret;
+}
+
+int ivpu_rpm_get(struct ivpu_device *vdev)
+{
+	int ret;
+
+	ivpu_dbg(PM, "rpm_get count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
+
+	ret = pm_runtime_get_sync(vdev->drm.dev);
+	if (ret < 0) {
+		ivpu_err(vdev, "Failed to resume operation: %d\n", ret);
+		pm_runtime_put_noidle(vdev->drm.dev);
+	} else {
+		vdev->pm->suspend_reschedule_counter = PM_RESCHEDULE_LIMIT;
+	}
+
+	return ret;
+}
+
+void ivpu_rpm_put(struct ivpu_device *vdev)
+{
+	ivpu_dbg(PM, "rpm_put count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
+
+	pm_runtime_mark_last_busy(vdev->drm.dev);
+	pm_runtime_put_autosuspend(vdev->drm.dev);
+}
+
+void ivpu_pm_reset_prepare_cb(struct pci_dev *pdev)
+{
+	struct ivpu_device *vdev = pci_get_drvdata(pdev);
+
+	ivpu_dbg(PM, "Pre-reset..\n");
+
+	mutex_lock(&vdev->pm->lock);
+
+	ivpu_shutdown(vdev);
+	ivpu_pm_prepare_cold_boot(vdev);
+	ivpu_jobs_abort_all(vdev);
+
+	mutex_unlock(&vdev->pm->lock);
+
+	ivpu_dbg(PM, "Pre-reset done.\n");
+}
+
+void ivpu_pm_reset_done_cb(struct pci_dev *pdev)
+{
+	struct ivpu_device *vdev = pci_get_drvdata(pdev);
+	int ret;
+
+	ivpu_dbg(PM, "Post-reset..\n");
+
+	mutex_lock(&vdev->pm->lock);
+
+	ret = ivpu_resume(vdev);
+	if (ret)
+		ivpu_err(vdev, "Failed to set RESUME state: %d\n", ret);
+
+	mutex_unlock(&vdev->pm->lock);
+
+	ivpu_dbg(PM, "Post-reset done.\n");
+}
+
+int ivpu_pm_init(struct ivpu_device *vdev)
+{
+	struct device *dev = vdev->drm.dev;
+	struct ivpu_pm_info *pm = vdev->pm;
+
+	pm->vdev = vdev;
+	pm->suspend_reschedule_counter = PM_RESCHEDULE_LIMIT;
+
+	atomic_set(&pm->in_recovery, 0);
+	INIT_WORK(&pm->recovery_work, ivpu_pm_recovery_work);
+	mutex_init(&pm->lock);
+
+	pm_runtime_use_autosuspend(dev);
+
+	if (ivpu_disable_recovery)
+		pm_runtime_set_autosuspend_delay(dev, -1);
+	else if (ivpu_is_silicon(vdev))
+		pm_runtime_set_autosuspend_delay(dev, 1000);
+	else
+		pm_runtime_set_autosuspend_delay(dev, 60000);
+
+	pm_runtime_set_active(dev);
+	pm_runtime_allow(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	ivpu_dbg(PM, "Initial RPM count %d\n", atomic_read(&dev->power.usage_count));
+
+	return 0;
+}
+
+void ivpu_pm_fini(struct ivpu_device *vdev)
+{
+	pm_runtime_forbid(vdev->drm.dev);
+	pm_runtime_get_noresume(vdev->drm.dev);
+
+	ivpu_dbg(PM, "Release RPM count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
+}
diff --git a/drivers/gpu/drm/ivpu/ivpu_pm.h b/drivers/gpu/drm/ivpu/ivpu_pm.h
new file mode 100644
index 000000000000..9a1ea659b21d
--- /dev/null
+++ b/drivers/gpu/drm/ivpu/ivpu_pm.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#ifndef __IVPU_PM_H__
+#define __IVPU_PM_H__
+
+#include <linux/types.h>
+
+struct ivpu_device;
+
+struct ivpu_pm_info {
+	struct ivpu_device *vdev;
+	struct mutex lock; /* Protects state transitions */
+	struct work_struct recovery_work;
+	atomic_t in_recovery;
+	bool is_warmboot;
+	u32 suspend_reschedule_counter;
+};
+
+int ivpu_pm_init(struct ivpu_device *vdev);
+void ivpu_pm_fini(struct ivpu_device *vdev);
+
+int ivpu_pm_suspend_cb(struct device *dev);
+int ivpu_pm_resume_cb(struct device *dev);
+int ivpu_pm_runtime_suspend_cb(struct device *dev);
+int ivpu_pm_runtime_resume_cb(struct device *dev);
+
+void ivpu_pm_reset_prepare_cb(struct pci_dev *pdev);
+void ivpu_pm_reset_done_cb(struct pci_dev *pdev);
+
+int ivpu_rpm_get(struct ivpu_device *vdev);
+void ivpu_rpm_put(struct ivpu_device *vdev);
+
+void ivpu_pm_schedule_recovery(struct ivpu_device *vdev);
+
+#endif /* __IVPU_PM_H__ */
-- 
2.34.1

