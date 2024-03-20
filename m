Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E70388101D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 11:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B65510F70F;
	Wed, 20 Mar 2024 10:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXFnpia/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C50610F70F;
 Wed, 20 Mar 2024 10:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710931312; x=1742467312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Op0XQFEU30cTrEWC4GrscVCGCcH4KQdf0NhhqAE2Vg=;
 b=kXFnpia/LVDDAw7koGJe65Kt4eV38Ef+6B1qgY3aRDl7jsU/q5gzGXqp
 c8piHU2Fjm68QKZNtMZAwvAFWehq540x3b9WnNPt7+qQkEHpgHA/KGb4A
 rNiEAp5fiVSXGXyYFqknwZCV4zHZ2DnwJ9vWqe2C6xROcvDnibUnwRi65
 IYnfbqu+ZQKBIwIxVi8tDRFXw+61/WdOTgNwdGNx8Gk324J2R5jYhkj42
 MyWvDUXsSRBuMiHwfMKbu0nrj7YknZNuxP0v7u5BpVRdidhV7h1fDyhIV
 SubUZGg7ZQMDiiPnyGrCBaTBvpnmDXmfKhlLYPbe+0fTGxO7oXQfKfX0V w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="9663674"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="9663674"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 03:41:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; d="scan'208";a="18855176"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 03:41:50 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [RFC 2/2] drm/xe/FLR: Support PCIe FLR
Date: Wed, 20 Mar 2024 16:14:26 +0530
Message-Id: <20240320104426.1592959-3-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240320104426.1592959-1-aravind.iddamsetty@linux.intel.com>
References: <20240320104426.1592959-1-aravind.iddamsetty@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

PCI subsystem provides callbacks to inform the driver about a request to
do function level reset by user, initiated by writing to sysfs entry
/sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
without the need to do unbind and rebind as the driver needs to
reinitialize the device afresh post FLR.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  3 +
 drivers/gpu/drm/xe/xe_gt.c           | 31 ++++++---
 drivers/gpu/drm/xe/xe_gt.h           |  1 +
 drivers/gpu/drm/xe/xe_pci.c          | 53 ++++++++++++++--
 drivers/gpu/drm/xe/xe_pci.h          |  6 +-
 drivers/gpu/drm/xe/xe_pci_err.c      | 94 ++++++++++++++++++++++++++++
 7 files changed, 174 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3c3e67885559..1447712fec65 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -114,6 +114,7 @@ xe-y += xe_bb.o \
 	xe_module.o \
 	xe_pat.o \
 	xe_pci.o \
+	xe_pci_err.o \
 	xe_pcode.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9785eef2e5a4..e9b8c7cbb428 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -455,6 +455,9 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+	/** @pci_state: PCI state of device */
+	struct pci_saved_state *pci_state;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 85408e7a932b..437874a9a5a0 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -629,6 +629,26 @@ static int do_gt_restart(struct xe_gt *gt)
 	return 0;
 }
 
+/* Idle the GT */
+int xe_idle_gt(struct xe_gt *gt)
+{
+	int err;
+
+	xe_gt_sanitize(gt);
+
+	xe_uc_gucrc_disable(&gt->uc);
+	xe_uc_stop_prepare(&gt->uc);
+	xe_gt_pagefault_reset(gt);
+
+	err = xe_uc_stop(&gt->uc);
+	if (err)
+		return err;
+
+	xe_gt_tlb_invalidation_reset(gt);
+
+	return err;
+}
+
 static int gt_reset(struct xe_gt *gt)
 {
 	int err;
@@ -645,21 +665,12 @@ static int gt_reset(struct xe_gt *gt)
 	}
 
 	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_gt_sanitize(gt);
 
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
 
-	xe_uc_gucrc_disable(&gt->uc);
-	xe_uc_stop_prepare(&gt->uc);
-	xe_gt_pagefault_reset(gt);
-
-	err = xe_uc_stop(&gt->uc);
-	if (err)
-		goto err_out;
-
-	xe_gt_tlb_invalidation_reset(gt);
+	xe_idle_gt(gt);
 
 	err = do_gt_reset(gt);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index ed6ea8057e35..77df919199cc 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -43,6 +43,7 @@ int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 void xe_gt_remove(struct xe_gt *gt);
+int xe_idle_gt(struct xe_gt *gt);
 
 /**
  * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c401d4890386..fcd2a7f66f7b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -383,6 +383,41 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
 
 #undef INTEL_VGA_DEVICE
 
+static bool xe_save_pci_state(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+
+	if (pci_save_state(pdev))
+		return false;
+
+	kfree(xe->pci_state);
+
+	xe->pci_state = pci_store_saved_state(pdev);
+
+	if (!xe->pci_state) {
+		drm_err(&xe->drm, "Failed to store PCI saved state\n");
+		return false;
+	}
+
+	return true;
+}
+
+void xe_load_pci_state(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+	int ret;
+
+	if (!xe->pci_state)
+		return;
+
+	ret = pci_load_saved_state(pdev, xe->pci_state);
+	if (!ret) {
+		pci_restore_state(pdev);
+	} else {
+		drm_warn(&xe->drm, "Failed to load PCI state err:%d\n", ret);
+	}
+}
+
 /* is device_id present in comma separated list of ids */
 static bool device_id_in_list(u16 device_id, const char *devices, bool negative)
 {
@@ -688,10 +723,12 @@ static void xe_pci_remove(struct pci_dev *pdev)
 
 	xe_device_remove(xe);
 	xe_pm_runtime_fini(xe);
+
+	kfree(xe->pci_state);
 	pci_set_drvdata(pdev, NULL);
 }
 
-static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
+int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	const struct xe_device_desc *desc = (const void *)ent->driver_data;
 	const struct xe_subplatform_desc *subplatform_desc;
@@ -786,6 +823,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
 		str_yes_no(xe->d3cold.capable));
 
+	if (xe_save_pci_state(pdev))
+		pci_restore_state(pdev);
+
 	return 0;
 }
 
@@ -833,7 +873,7 @@ static int xe_pci_suspend(struct device *dev)
 	 */
 	d3cold_toggle(pdev, D3COLD_ENABLE);
 
-	pci_save_state(pdev);
+	xe_save_pci_state(pdev);
 	pci_disable_device(pdev);
 
 	return 0;
@@ -857,6 +897,8 @@ static int xe_pci_resume(struct device *dev)
 
 	pci_set_master(pdev);
 
+	xe_load_pci_state(pdev);
+
 	err = xe_pm_resume(pdev_to_xe_device(pdev));
 	if (err)
 		return err;
@@ -874,7 +916,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	if (err)
 		return err;
 
-	pci_save_state(pdev);
+	xe_save_pci_state(pdev);
 
 	if (xe->d3cold.allowed) {
 		d3cold_toggle(pdev, D3COLD_ENABLE);
@@ -899,7 +941,7 @@ static int xe_pci_runtime_resume(struct device *dev)
 	if (err)
 		return err;
 
-	pci_restore_state(pdev);
+	xe_load_pci_state(pdev);
 
 	if (xe->d3cold.allowed) {
 		err = pci_enable_device(pdev);
@@ -928,6 +970,8 @@ static const struct dev_pm_ops xe_pm_ops = {
 };
 #endif
 
+extern const struct pci_error_handlers xe_pci_err_handlers;
+
 static struct pci_driver xe_pci_driver = {
 	.name = DRIVER_NAME,
 	.id_table = pciidlist,
@@ -937,6 +981,7 @@ static struct pci_driver xe_pci_driver = {
 #ifdef CONFIG_PM_SLEEP
 	.driver.pm = &xe_pm_ops,
 #endif
+	.err_handler = &xe_pci_err_handlers,
 };
 
 int xe_register_pci_driver(void)
diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
index 611c1209b14c..9faf5380a09e 100644
--- a/drivers/gpu/drm/xe/xe_pci.h
+++ b/drivers/gpu/drm/xe/xe_pci.h
@@ -6,7 +6,11 @@
 #ifndef _XE_PCI_H_
 #define _XE_PCI_H_
 
+struct pci_dev;
+struct pci_device_id;
+
 int xe_register_pci_driver(void);
 void xe_unregister_pci_driver(void);
-
+void xe_load_pci_state(struct pci_dev *pdev);
+int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
new file mode 100644
index 000000000000..ecc467a9c3af
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_err.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/pci.h>
+#include <drm/drm_drv.h>
+
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_gt_printk.h"
+#include "xe_pci.h"
+#include "xe_pm.h"
+
+/**
+ * xe_pci_reset_prepare - Called when user issued a function level reset
+ * via /sys/bus/pci/devices/.../reset.
+ * @pdev: PCI device struct
+ */
+static void xe_pci_reset_prepare(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+	struct xe_gt *gt;
+	int id, err;
+
+	pci_warn(pdev, "preparing for PCIe FLR reset\n");
+
+	drm_warn(&xe->drm, "removing device access to userspace\n");
+	drm_dev_unplug(&xe->drm);
+
+	xe_pm_runtime_get(xe);
+	/* idle the GTs */
+	for_each_gt(gt, xe, id) {
+		err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+		if (err)
+			goto reset;
+		err = xe_idle_gt(gt);
+		if (err) {
+			xe_gt_err(gt, "failed to idle gt (%pe)\n", ERR_PTR(err));
+			goto reset;
+		}
+
+		err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+		XE_WARN_ON(err);
+	}
+	xe_pm_runtime_put(xe);
+
+reset:
+	pci_disable_device(pdev);
+}
+
+/**
+ * xe_pci_reset_done - Called when function level reset is done.
+ * @pdev: PCI device struct
+ */
+static void xe_pci_reset_done(struct pci_dev *pdev)
+{
+	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
+	struct xe_device *xe = pci_get_drvdata(pdev);
+
+	dev_info(&pdev->dev,
+		 "PCI device went through FLR, reenabling the device\n");
+
+	if (pci_enable_device(pdev)) {
+		dev_err(&pdev->dev,
+			"Cannot re-enable PCI device after reset\n");
+		return;
+	}
+	pci_set_master(pdev);
+	xe_load_pci_state(pdev);
+
+	/*
+	 * We want to completely clean the driver and even destroy
+	 * the xe private data and reinitialize afresh similar to
+	 * probe
+	 */
+	pdev->driver->remove(pdev);
+	if (pci_dev_msi_enabled(pdev))
+		pci_free_irq_vectors(pdev);
+
+	devm_drm_release_action(&xe->drm);
+	pci_disable_device(pdev);
+
+	/*
+	 * if this fails the driver might be in a stale state, only option is
+	 * to unbind and rebind
+	 */
+	xe_pci_probe(pdev, ent);
+}
+
+const struct pci_error_handlers xe_pci_err_handlers = {
+	.reset_prepare = xe_pci_reset_prepare,
+	.reset_done = xe_pci_reset_done,
+};
-- 
2.25.1

