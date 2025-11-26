Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2CEC8A290
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B665D10E611;
	Wed, 26 Nov 2025 14:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="illbNwIV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC0910E617;
 Wed, 26 Nov 2025 14:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764166117; x=1795702117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FWTJdY5LAm9xjE5D0Il4ZbTYhrnwIcF+YjAQWpqYrSM=;
 b=illbNwIV/0Q8PMMSBszVjVVFLJBmzfkMjZJCVubJcxSbOclRi5UnkCu0
 +I95aV44bsj40QFvlB1vUjV/m0RCqwsBBOsjzwFIsJ+BUmHNDOGTXWMBJ
 WGQrWHWFwk94cUGdbReid0JHMykCfjIwuu4nSJWtJJ/wKJ3A1nemUZUeo
 EcxWuaNQvKwcXj5eN24YqUx3WuzH2DWddxWZfrJh5PMfkhRvSAxBwfJKY
 uy6YF3YZqcjfJ0t9GPng+5weCoROPlRo6AMPtCM9jpa9sZDklYUIIfqv6
 fxG50IfZsc8u08w8S3mfIxVEkOwpW+QEnB9soL7AYbspSQbtHwOsPfKsm A==;
X-CSE-ConnectionGUID: npjO+9fcTdm/eLcXY3PxzA==
X-CSE-MsgGUID: l7pS7T4JQmeYZH9lABQn4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66365913"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="66365913"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:08:37 -0800
X-CSE-ConnectionGUID: fOhCtBItQv6ZCUr8YDwGjQ==
X-CSE-MsgGUID: sdF3b5ehTjapOzsICcxEkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192740558"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:08:34 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, lukas@wunner.de,
 simona.vetter@ffwll.ch, airlied@gmail.com, lucas.demarchi@intel.com,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v2 2/4] drm/xe/xe_drm_ras: Add support for drm ras
Date: Wed, 26 Nov 2025 20:06:45 +0530
Message-ID: <20251126143652.2843242-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20251126143652.2843242-6-riana.tauro@intel.com>
References: <20251126143652.2843242-6-riana.tauro@intel.com>
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

Allocate correctable, nonfatal and fatal nodes per xe device.
Each node contains error classes, counters and respective
query counter functions.

Add basic functionality to create and register drm nodes.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/xe_device_types.h  |   4 +
 drivers/gpu/drm/xe/xe_drm_ras.c       | 221 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_ras.h       |  12 ++
 drivers/gpu/drm/xe/xe_drm_ras_types.h |  54 +++++++
 drivers/gpu/drm/xe/xe_hw_error.c      |  38 ++---
 include/uapi/drm/xe_drm.h             |   5 +
 7 files changed, 313 insertions(+), 22 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_drm_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_drm_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_drm_ras_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b848da79a4e1..7bc805b33e12 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -41,6 +41,7 @@ xe-y += xe_bb.o \
 	xe_device_sysfs.o \
 	xe_dma_buf.o \
 	xe_drm_client.o \
+	xe_drm_ras.o \
 	xe_eu_stall.o \
 	xe_exec.o \
 	xe_exec_queue.o \
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6ce3247d1bd8..69097e3b3995 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -13,6 +13,7 @@
 #include <drm/ttm/ttm_device.h>
 
 #include "xe_devcoredump_types.h"
+#include "xe_drm_ras_types.h"
 #include "xe_heci_gsc.h"
 #include "xe_late_bind_fw_types.h"
 #include "xe_lmtt_types.h"
@@ -353,6 +354,9 @@ struct xe_device {
 		bool oob_initialized;
 	} wa_active;
 
+	/** @ras: ras structure for device */
+	struct xe_drm_ras ras;
+
 	/** @survivability: survivability information for device */
 	struct xe_survivability survivability;
 
diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
new file mode 100644
index 000000000000..5320e845e9d5
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_drm_ras.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+#include <drm/drm_ras.h>
+#include <drm/xe_drm.h>
+
+#include "xe_device.h"
+#include "xe_drm_ras.h"
+
+#define ERR_INFO(index, _name) \
+	[index] = { .name = _name, .counter = 0 }
+
+static struct xe_drm_ras_counter error_info[] = {
+	ERR_INFO(DRM_XE_GENL_CORE_COMPUTE, "GT Error"),
+};
+
+static int hw_query_error_counter(struct xe_drm_ras_counter *info,
+				  u32 error_id, const char **name, u32 *val)
+{
+	*name = info[error_id].name;
+	*val =  info[error_id].counter;
+
+	return 0;
+}
+
+static int query_non_fatal_error_counters(struct drm_ras_node *ep,
+					  u32 error_id, const char **name,
+					  u32 *val)
+{
+	struct xe_device *xe = ep->priv;
+	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras_counter *info = ras->info[HARDWARE_ERROR_NONFATAL];
+
+	if (error_id >= ARRAY_SIZE(error_info))
+		return -EINVAL;
+
+	if (!error_info[error_id].name)
+		return -ENOENT;
+
+	return hw_query_error_counter(info, error_id, name, val);
+}
+
+static int query_fatal_error_counters(struct drm_ras_node *ep,
+				      u32 error_id, const char **name,
+				      u32 *val)
+{
+	struct xe_device *xe = ep->priv;
+	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras_counter *info = ras->info[HARDWARE_ERROR_FATAL];
+
+	if (error_id >= ARRAY_SIZE(error_info))
+		return -EINVAL;
+
+	if (!error_info[error_id].name)
+		return -ENOENT;
+
+	return hw_query_error_counter(info, error_id, name, val);
+}
+
+static int query_correctable_error_counters(struct drm_ras_node *ep,
+					    u32 error_id, const char **name,
+					    u32 *val)
+{
+	struct xe_device *xe = ep->priv;
+	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras_counter *info = ras->info[HARDWARE_ERROR_CORRECTABLE];
+
+	if (error_id >= ARRAY_SIZE(error_info))
+		return -EINVAL;
+
+	if (!error_info[error_id].name)
+		return -ENOENT;
+
+	return hw_query_error_counter(info, error_id, name, val);
+}
+
+static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe,
+							     int count,
+							     struct xe_drm_ras_counter *src)
+{
+	struct xe_drm_ras_counter *counter;
+
+	counter = drmm_kzalloc(&xe->drm, count * sizeof(struct xe_drm_ras_counter), GFP_KERNEL);
+	if (!counter)
+		return ERR_PTR(-ENOMEM);
+
+	memcpy(counter, src, count * sizeof(struct xe_drm_ras_counter));
+
+	return counter;
+}
+
+static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
+			      enum hardware_error hw_err)
+{
+	struct xe_drm_ras *ras = &xe->ras;
+	int count = 0, ret = 0;
+
+	count = ARRAY_SIZE(error_info);
+	node->error_counter_range.first = DRM_XE_GENL_CORE_COMPUTE;
+	node->error_counter_range.last = count - 1;
+
+	switch (hw_err) {
+	case HARDWARE_ERROR_CORRECTABLE:
+		ras->info[hw_err] = allocate_and_copy_counters(xe, count, error_info);
+		if (IS_ERR(ras->info[hw_err]))
+			return PTR_ERR(ras->info[hw_err]);
+		node->query_error_counter = query_correctable_error_counters;
+		break;
+	case HARDWARE_ERROR_NONFATAL:
+		ras->info[hw_err] = allocate_and_copy_counters(xe, count, error_info);
+		if (IS_ERR(ras->info[hw_err]))
+			return PTR_ERR(ras->info[hw_err]);
+		node->query_error_counter = query_non_fatal_error_counters;
+		break;
+	case HARDWARE_ERROR_FATAL:
+		ras->info[hw_err] = allocate_and_copy_counters(xe, count, error_info);
+		if (IS_ERR(ras->info[hw_err]))
+			return PTR_ERR(ras->info[hw_err]);
+		node->query_error_counter = query_fatal_error_counters;
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static int register_nodes(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct xe_drm_ras *ras = &xe->ras;
+	const char *device_name;
+	int i = 0, ret;
+
+	device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
+				pci_domain_nr(pdev->bus), pdev->bus->number,
+				PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
+
+	for (i = 0; i < HARDWARE_ERROR_MAX; i++) {
+		struct drm_ras_node *node = &ras->node[i];
+		const char *hw_err_str = hw_error_to_str(i);
+		const char *node_name;
+
+		node_name = kasprintf(GFP_KERNEL, "%s-errors", hw_err_str);
+
+		node->device_name = device_name;
+		node->node_name = node_name;
+		node->type = DRM_RAS_NODE_TYPE_ERROR_COUNTER;
+
+		ret = assign_node_params(xe, node, i);
+		if (ret) {
+			kfree(node->node_name);
+			return ret;
+		}
+
+		node->priv = xe;
+
+		ret = drm_ras_node_register(node);
+		if (ret) {
+			drm_err(&xe->drm, "Failed to register drm ras tile node\n");
+			kfree(node->node_name);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void xe_drm_ras_unregister_nodes(void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_drm_ras *ras = &xe->ras;
+	int i = 0;
+
+	for (i = 0; i < HARDWARE_ERROR_MAX; i++) {
+		struct drm_ras_node *node = &ras->node[i];
+
+		drm_ras_node_unregister(node);
+
+		kfree(node->node_name);
+		if (i == 0)
+			kfree(node->device_name);
+	}
+}
+
+/**
+ * xe_drm_ras_allocate_nodes - Allocate drm ras nodes
+ * @xe: xe device instance
+ *
+ * Allocate xe drm ras nodes for all errors in a tile
+ *
+ * Return: 0 on success, error code on failure
+ */
+int xe_drm_ras_allocate_nodes(struct xe_device *xe)
+{
+	struct drm_ras_node *node;
+	int err;
+
+	node = drmm_kzalloc(&xe->drm, HARDWARE_ERROR_MAX * sizeof(struct drm_ras_node), GFP_KERNEL);
+	if (!node)
+		return -ENOMEM;
+
+	xe->ras.node = node;
+
+	err = register_nodes(xe);
+	if (err) {
+		drm_err(&xe->drm, "Failed to register drm ras node\n");
+		return err;
+	}
+
+	err = devm_add_action_or_reset(xe->drm.dev, xe_drm_ras_unregister_nodes, xe);
+	if (err) {
+		drm_err(&xe->drm, "Failed to add action for xe drm_ras\n");
+		return err;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_drm_ras.h b/drivers/gpu/drm/xe/xe_drm_ras.h
new file mode 100644
index 000000000000..6272b5da4e6d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_drm_ras.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#ifndef XE_DRM_RAS_H_
+#define XE_DRM_RAS_H_
+
+struct xe_device;
+
+int xe_drm_ras_allocate_nodes(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
new file mode 100644
index 000000000000..452ff9a91510
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_DRM_RAS_TYPES_H_
+#define _XE_DRM_RAS_TYPES_H_
+
+#include <linux/limits.h>
+
+struct drm_ras_node;
+
+/* Error categories reported by hardware */
+enum hardware_error {
+	HARDWARE_ERROR_CORRECTABLE = 0,
+	HARDWARE_ERROR_NONFATAL = 1,
+	HARDWARE_ERROR_FATAL = 2,
+	HARDWARE_ERROR_MAX,
+};
+
+static inline const char *hw_error_to_str(const enum hardware_error hw_err)
+{
+	switch (hw_err) {
+	case HARDWARE_ERROR_CORRECTABLE:
+		return "correctable";
+	case HARDWARE_ERROR_NONFATAL:
+		return "nonfatal";
+	case HARDWARE_ERROR_FATAL:
+		return "fatal";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+struct xe_drm_ras_counter {
+	const char *name;
+	int counter;
+};
+
+/**
+ * struct xe_drm_ras - xe drm ras structure
+ *
+ * This structure has details of error counters
+ */
+struct xe_drm_ras {
+	/** @node: DRM RAS node */
+	struct drm_ras_node *node;
+
+	/** @info: info array for all types of errors */
+	struct xe_drm_ras_counter *info[HARDWARE_ERROR_MAX];
+
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 8c65291f36fc..2adc2e6540f6 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -10,6 +10,7 @@
 #include "regs/xe_irq_regs.h"
 
 #include "xe_device.h"
+#include "xe_drm_ras.h"
 #include "xe_hw_error.h"
 #include "xe_mmio.h"
 #include "xe_survivability_mode.h"
@@ -17,14 +18,6 @@
 #define  HEC_UNCORR_FW_ERR_BITS 4
 extern struct fault_attr inject_csc_hw_error;
 
-/* Error categories reported by hardware */
-enum hardware_error {
-	HARDWARE_ERROR_CORRECTABLE = 0,
-	HARDWARE_ERROR_NONFATAL = 1,
-	HARDWARE_ERROR_FATAL = 2,
-	HARDWARE_ERROR_MAX,
-};
-
 static const char * const hec_uncorrected_fw_errors[] = {
 	"Fatal",
 	"CSE Disabled",
@@ -32,20 +25,6 @@ static const char * const hec_uncorrected_fw_errors[] = {
 	"Data Corruption"
 };
 
-static const char *hw_error_to_str(const enum hardware_error hw_err)
-{
-	switch (hw_err) {
-	case HARDWARE_ERROR_CORRECTABLE:
-		return "CORRECTABLE";
-	case HARDWARE_ERROR_NONFATAL:
-		return "NONFATAL";
-	case HARDWARE_ERROR_FATAL:
-		return "FATAL";
-	default:
-		return "UNKNOWN";
-	}
-}
-
 static bool fault_inject_csc_hw_error(void)
 {
 	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
@@ -146,6 +125,20 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
 			hw_error_source_handler(tile, hw_err);
 }
 
+static int hw_error_info_init(struct xe_device *xe)
+{
+	int ret;
+
+	if (xe->info.platform != XE_PVC)
+		return 0;
+
+	ret = xe_drm_ras_allocate_nodes(xe);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /*
  * Process hardware errors during boot
  */
@@ -178,5 +171,6 @@ void xe_hw_error_init(struct xe_device *xe)
 
 	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
 
+	hw_error_info_init(xe);
 	process_hw_errors(xe);
 }
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 47853659a705..053cbe1aafbb 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -2273,6 +2273,11 @@ struct drm_xe_vm_query_mem_range_attr {
 
 };
 
+/**
+ * RAS Counters
+ */
+#define DRM_XE_GENL_CORE_COMPUTE	(1)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.47.1

