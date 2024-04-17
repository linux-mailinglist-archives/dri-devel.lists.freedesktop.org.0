Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A769C8A7E75
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 10:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB421132DF;
	Wed, 17 Apr 2024 08:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NpgbPfCm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32021132DC;
 Wed, 17 Apr 2024 08:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713343164; x=1744879164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cWFZknpjXl6vb4XTKwA+o7P+tYEc0ClqDQapFyduSqI=;
 b=NpgbPfCmtk0BfTPKF7NimTxMIZGpNIkG3TOXRp4mF2NqQLwD9DukB1k2
 UrqfNRYZ/uih3REri0plIO8FNgogy67che8n7keFjLy6OAmqhA5Qyzrxf
 RW4ks8WKAGpNDH1t+535r83oMdCC8I5wqkVDu15KEBtsnf5zr5mfqcO4c
 aHeJROItDapNslZ8qOXhfVfstOjdEoCSbOw5J5ef5Qvhir5oCK7hF6cPl
 Qz8beD828yHBgTzn/vNprgs+dkfcwpYeMw5XGF4EMAhohJVFnanpRGp8y
 7LjlHHzOdSROdaatKXNXIs4TRK2Ej/DzPffTOKc1pPLdCVX4bOfvlyLbo g==;
X-CSE-ConnectionGUID: +UNmAhEBS5Wbdy6RbUnkAA==
X-CSE-MsgGUID: eiVN8JNmRr2tfxEYDsEn0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12660901"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="12660901"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 01:39:23 -0700
X-CSE-ConnectionGUID: +OVjRz6JQBGxkVfgE611jg==
X-CSE-MsgGUID: hnIaNvQ2RCyuuYAeMNeUvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="27338940"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 01:39:19 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, mripard@kernel.org,
 tzimmermann@suse.de, rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 4/4] drm/xe/FLR: Support PCIe FLR
Date: Wed, 17 Apr 2024 14:11:45 +0530
Message-Id: <20240417084145.242480-5-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240417084145.242480-1-aravind.iddamsetty@linux.intel.com>
References: <20240417084145.242480-1-aravind.iddamsetty@linux.intel.com>
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

v2:
1. separate out gt idle and pci save/restore to a separate patch (Lucas)
2. Fixed the warnings seen around xe_guc_submit_stop, xe_guc_puc_fini

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  3 +
 drivers/gpu/drm/xe/xe_guc_pc.c       |  4 ++
 drivers/gpu/drm/xe/xe_pci.c          |  9 ++-
 drivers/gpu/drm/xe/xe_pci.h          |  2 +
 drivers/gpu/drm/xe/xe_pci_err.c      | 93 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_err.h      | 13 ++++
 7 files changed, 124 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
 create mode 100644 drivers/gpu/drm/xe/xe_pci_err.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 522bffa5c4e1..9686ea181ad1 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -117,6 +117,7 @@ xe-y += xe_bb.o \
 	xe_module.o \
 	xe_pat.o \
 	xe_pci.o \
+	xe_pci_err.o \
 	xe_pcode.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0a66555229e9..8c749b378a92 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -465,6 +465,9 @@ struct xe_device {
 	/** @pci_state: PCI state of device */
 	struct pci_saved_state *pci_state;
 
+	/** @pci_device_is_reset: device went through PCIe FLR */
+	bool pci_device_is_reset;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 521ae24f2314..6108a4dfa05f 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -902,6 +902,10 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
 		return;
 	}
 
+	/* We already have done this before going through a reset, so skip here */
+	if (xe->pci_device_is_reset)
+		return;
+
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index f9957cd16356..d986ae7fc7f7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -23,6 +23,7 @@
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_pci_err.h"
 #include "xe_pci_types.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
@@ -736,7 +737,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
 	pci_set_drvdata(pdev, NULL);
 }
 
-static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
+int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	const struct xe_device_desc *desc = (const void *)ent->driver_data;
 	const struct xe_subplatform_desc *subplatform_desc;
@@ -976,6 +977,11 @@ static const struct dev_pm_ops xe_pm_ops = {
 };
 #endif
 
+const struct pci_error_handlers xe_pci_err_handlers = {
+	.reset_prepare = xe_pci_reset_prepare,
+	.reset_done = xe_pci_reset_done,
+};
+
 static struct pci_driver xe_pci_driver = {
 	.name = DRIVER_NAME,
 	.id_table = pciidlist,
@@ -985,6 +991,7 @@ static struct pci_driver xe_pci_driver = {
 #ifdef CONFIG_PM_SLEEP
 	.driver.pm = &xe_pm_ops,
 #endif
+	.err_handler = &xe_pci_err_handlers,
 };
 
 int xe_register_pci_driver(void)
diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
index 73b90a430d1f..9faf5380a09e 100644
--- a/drivers/gpu/drm/xe/xe_pci.h
+++ b/drivers/gpu/drm/xe/xe_pci.h
@@ -7,8 +7,10 @@
 #define _XE_PCI_H_
 
 struct pci_dev;
+struct pci_device_id;
 
 int xe_register_pci_driver(void);
 void xe_unregister_pci_driver(void);
 void xe_load_pci_state(struct pci_dev *pdev);
+int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
new file mode 100644
index 000000000000..81c440e08fbc
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_err.c
@@ -0,0 +1,93 @@
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
+#include "xe_pci_err.h"
+#include "xe_pm.h"
+#include "xe_uc.h"
+
+/**
+ * xe_pci_reset_prepare - Called when user issued a PCIe reset
+ * via /sys/bus/pci/devices/.../reset.
+ * @pdev: PCI device struct
+ */
+void xe_pci_reset_prepare(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+	struct xe_gt *gt;
+	int id, err;
+
+	pci_warn(pdev, "preparing for PCIe reset\n");
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
+		xe_uc_reset_prepare(&gt->uc);
+		err = xe_gt_idle(gt);
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
+ * xe_pci_reset_done - Called when PCIe reset is done.
+ * @pdev: PCI device struct
+ */
+void xe_pci_reset_done(struct pci_dev *pdev)
+{
+	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
+	struct xe_device *xe = pci_get_drvdata(pdev);
+
+	dev_info(&pdev->dev,
+		 "device went through PCIe reset, reenabling the device\n");
+
+	if (pci_enable_device(pdev)) {
+		dev_err(&pdev->dev,
+			"Cannot re-enable PCI device after reset\n");
+		return;
+	}
+	pci_set_master(pdev);
+	xe_load_pci_state(pdev);
+
+	xe->pci_device_is_reset = true;
+	/*
+	 * We want to completely clean the driver and even destroy
+	 * the xe private data and reinitialize afresh similar to
+	 * probe
+	 */
+	pdev->driver->remove(pdev);
+	if (pci_dev_msi_enabled(pdev))
+		pci_free_irq_vectors(pdev);
+
+	devm_drm_dev_release_action(&xe->drm);
+	pci_disable_device(pdev);
+
+	/*
+	 * if this fails the driver might be in a stale state, only option is
+	 * to unbind and rebind
+	 */
+	xe_pci_probe(pdev, ent);
+}
diff --git a/drivers/gpu/drm/xe/xe_pci_err.h b/drivers/gpu/drm/xe/xe_pci_err.h
new file mode 100644
index 000000000000..95a4c8ce9cf1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_err.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_PCI_ERR_H_
+#define _XE_PCI_ERR_H_
+
+struct pci_dev;
+
+void xe_pci_reset_prepare(struct pci_dev *pdev);
+void xe_pci_reset_done(struct pci_dev *pdev);
+#endif
-- 
2.25.1

