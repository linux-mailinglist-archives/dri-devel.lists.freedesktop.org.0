Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FD878FB6B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 11:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A205A10E75A;
	Fri,  1 Sep 2023 09:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD5010E75A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 09:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693561807; x=1725097807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uTiA4ck+6Eq1Y637OFGlhjLPWJW6SEV07+8UAg4BUTg=;
 b=HPwzCN8n30Y7LOivoNHO4/3BlX9vXmTeTet5XngvtgKHGaZcbGPKHmWP
 aPxjyrARtAF6eWCGaKcS1MgUBuE88fkyV+PLmklEBRaKm9IYn9jiklUW9
 YtX/n7rq1HvZROikRY2z1UYdGjOqlA/WeMWLuzXJXnhyhVHPRbGfEEw4q
 o035wkatwq/Gp2W094jXIeu+yr3oyz0OnwAlMtBhwdyV1x2rw3OfmKDXn
 pVYTGToz5tOLleVt3yBU4VvSFAEB7j0XJdfcYk1/nJIOxxtHTH8DwSDXE
 JPcqDBoJaGOL0m4LU5Saq4zblTmkHeXnMiYicU4ffIDBjj/BMevFJleFQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361206885"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="361206885"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 02:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070679933"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="1070679933"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 02:50:05 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 02/11] accel/ivpu: Remove duplicated error messages
Date: Fri,  1 Sep 2023 11:49:48 +0200
Message-Id: <20230901094957.168898-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230901094957.168898-1-stanislaw.gruszka@linux.intel.com>
References: <20230901094957.168898-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reduce the number of error messages per single failure in
ivpu_dev_init() and ivpu_probe().

Most error messages are already printed by functions called
from ivpu_dev_init(). Add missed error prints in ivpu_ipc_init()
and ivpu_mmu_context_init().

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c         | 52 +++++++--------------------
 drivers/accel/ivpu/ivpu_ipc.c         | 13 ++++---
 drivers/accel/ivpu/ivpu_mmu_context.c |  4 ++-
 3 files changed, 25 insertions(+), 44 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index ba79f397c9e8..4b344ab614f6 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -518,78 +518,54 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	lockdep_set_class(&vdev->submitted_jobs_xa.xa_lock, &submitted_jobs_xa_lock_class_key);
 
 	ret = ivpu_pci_init(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize PCI device: %d\n", ret);
+	if (ret)
 		goto err_xa_destroy;
-	}
 
 	ret = ivpu_irq_init(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize IRQs: %d\n", ret);
+	if (ret)
 		goto err_xa_destroy;
-	}
 
 	/* Init basic HW info based on buttress registers which are accessible before power up */
 	ret = ivpu_hw_info_init(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize HW info: %d\n", ret);
+	if (ret)
 		goto err_xa_destroy;
-	}
 
 	/* Power up early so the rest of init code can access VPU registers */
 	ret = ivpu_hw_power_up(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to power up HW: %d\n", ret);
+	if (ret)
 		goto err_xa_destroy;
-	}
 
 	ret = ivpu_mmu_global_context_init(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize global MMU context: %d\n", ret);
+	if (ret)
 		goto err_power_down;
-	}
 
 	ret = ivpu_mmu_init(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize MMU device: %d\n", ret);
+	if (ret)
 		goto err_mmu_gctx_fini;
-	}
 
 	ret = ivpu_fw_init(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize firmware: %d\n", ret);
+	if (ret)
 		goto err_mmu_gctx_fini;
-	}
 
 	ret = ivpu_ipc_init(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize IPC: %d\n", ret);
+	if (ret)
 		goto err_fw_fini;
-	}
 
 	ret = ivpu_pm_init(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize PM: %d\n", ret);
+	if (ret)
 		goto err_ipc_fini;
-	}
 
 	ret = ivpu_job_done_thread_init(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize job done thread: %d\n", ret);
+	if (ret)
 		goto err_ipc_fini;
-	}
 
 	ret = ivpu_fw_load(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to load firmware: %d\n", ret);
+	if (ret)
 		goto err_job_done_thread_fini;
-	}
 
 	ret = ivpu_boot(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to boot: %d\n", ret);
+	if (ret)
 		goto err_job_done_thread_fini;
-	}
 
 	ivpu_pm_enable(vdev);
 
@@ -651,10 +627,8 @@ static int ivpu_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	pci_set_drvdata(pdev, vdev);
 
 	ret = ivpu_dev_init(vdev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to initialize VPU device: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	ret = drm_dev_register(&vdev->drm, 0);
 	if (ret) {
diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index fa0af59e39ab..6b2e9dbb284a 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -426,15 +426,20 @@ int ivpu_ipc_irq_handler(struct ivpu_device *vdev)
 int ivpu_ipc_init(struct ivpu_device *vdev)
 {
 	struct ivpu_ipc_info *ipc = vdev->ipc;
-	int ret = -ENOMEM;
+	int ret;
 
 	ipc->mem_tx = ivpu_bo_alloc_internal(vdev, 0, SZ_16K, DRM_IVPU_BO_WC);
-	if (!ipc->mem_tx)
-		return ret;
+	if (!ipc->mem_tx) {
+		ivpu_err(vdev, "Failed to allocate mem_tx\n");
+		return -ENOMEM;
+	}
 
 	ipc->mem_rx = ivpu_bo_alloc_internal(vdev, 0, SZ_16K, DRM_IVPU_BO_WC);
-	if (!ipc->mem_rx)
+	if (!ipc->mem_rx) {
+		ivpu_err(vdev, "Failed to allocate mem_rx\n");
+		ret = -ENOMEM;
 		goto err_free_tx;
+	}
 
 	ipc->mm_tx = devm_gen_pool_create(vdev->drm.dev, __ffs(IVPU_IPC_ALIGNMENT),
 					  -1, "TX_IPC_JSM");
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index 1d2e554e2c4a..8914e34fb54f 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -427,8 +427,10 @@ ivpu_mmu_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u3
 	INIT_LIST_HEAD(&ctx->bo_list);
 
 	ret = ivpu_mmu_pgtable_init(vdev, &ctx->pgtable);
-	if (ret)
+	if (ret) {
+		ivpu_err(vdev, "Failed to initialize pgtable for ctx %u: %d\n", context_id, ret);
 		return ret;
+	}
 
 	if (!context_id) {
 		start = vdev->hw->ranges.global.start;
-- 
2.25.1

