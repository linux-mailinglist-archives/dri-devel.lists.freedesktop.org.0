Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEC1CA6A09
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 09:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079F110EA35;
	Fri,  5 Dec 2025 08:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KtKSaRnw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A0410EA32;
 Fri,  5 Dec 2025 08:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764922273; x=1796458273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zuf6ezcxIWbj24T1vmRFadRqhefUW0bgF3eP6Sk7Jw0=;
 b=KtKSaRnwc28zjBrQHghrxETqhy/Q7Yv0dhSN2V1I0nFalQFMxDFnERUk
 N1ScaRnkBk7nLa1P3Oaspk37CEEPY0xoMOMe1yuyKE6ss0QIgJh3uZlfA
 /cqGCctmWriK/I28docr0BHqXcgjeaoJvPa8DXGfNoQG1XzSjrtg96+N1
 G/HRMXJ2uoHhLPQhBTSoBRHqQT3vY46BeTfaRvWjXpJ+4sykKvm0U/ZYG
 Z+3S24sJrVXjAr1nZcwA8oXFU20TAH+4Qi17Fb9sHbJzY8QpaGyCayYBe
 YTm0TC2v/SdvBeWbiJ2G3rYg3XiXfZJYZ57pGNeVg6k51AKTwSTUUrous Q==;
X-CSE-ConnectionGUID: d1fckYORRjWK7tx4STC19w==
X-CSE-MsgGUID: wW37DdaQTiqr8jAgxPiMiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77571998"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="77571998"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 00:11:13 -0800
X-CSE-ConnectionGUID: 6gnJBuOORpOT8/TM68krrA==
X-CSE-MsgGUID: RIatvd1TQ1aCMA1CxgY7+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="225890162"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 00:11:09 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, lukas@wunner.de,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v3 2/4] drm/xe/xe_drm_ras: Add support for drm ras
Date: Fri,  5 Dec 2025 14:09:34 +0530
Message-ID: <20251205083934.3602030-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20251205083934.3602030-6-riana.tauro@intel.com>
References: <20251205083934.3602030-6-riana.tauro@intel.com>
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
Below operations can be performed using Generic netlink DRM RAS interface

List Nodes:

$ sudo ynl --family drm_ras  --dump list-nodes
[{'device-name': '0000:03:00.0',
  'node-id': 0,
  'node-name': 'correctable-errors',
  'node-type': 'error-counter'},
 {'device-name': '0000:03:00.0',
  'node-id': 1,
  'node-name': 'nonfatal-errors',
  'node-type': 'error-counter'},
 {'device-name': '0000:03:00.0',
  'node-id': 2,
  'node-name': 'fatal-errors',
  'node-type': 'error-counter'}]

Get Error counters:

$ sudo ynl --family drm_ras  --dump get-error-counters --json '{"node-id":1}'
[{'error-id': 1, 'error-name': 'Core Compute Error', 'error-value': 0},
 {'error-id': 2, 'error-name': 'SOC Internal Error', 'error-value': 0}]

Query Error counter:

$ sudo ynl --family drm_ras --do query-error-counter  --json '{"node-id":1, "error-id":1}'
{'error-id': 1, 'error-name': 'Core Compute Error', 'error-value': 0}

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: Add ID's and names as uAPI (Rodrigo)
    Add documentation
    Modify commit message
---
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/xe_device_types.h  |   4 +
 drivers/gpu/drm/xe/xe_drm_ras.c       | 199 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_ras.h       |  12 ++
 drivers/gpu/drm/xe/xe_drm_ras_types.h |  40 ++++++
 drivers/gpu/drm/xe/xe_hw_error.c      |  64 ++++-----
 include/uapi/drm/xe_drm.h             |  82 +++++++++++
 7 files changed, 368 insertions(+), 34 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_drm_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_drm_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_drm_ras_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a7e13a676f7d..bc417ef19280 100644
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
index 9de73353223f..d6ea275700e1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -13,6 +13,7 @@
 #include <drm/ttm/ttm_device.h>
 
 #include "xe_devcoredump_types.h"
+#include "xe_drm_ras_types.h"
 #include "xe_heci_gsc.h"
 #include "xe_late_bind_fw_types.h"
 #include "xe_lmtt_types.h"
@@ -361,6 +362,9 @@ struct xe_device {
 		bool oob_initialized;
 	} wa_active;
 
+	/** @ras: ras structure for device */
+	struct xe_drm_ras ras;
+
 	/** @survivability: survivability information for device */
 	struct xe_survivability survivability;
 
diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
new file mode 100644
index 000000000000..764b14b1edf8
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_drm_ras.c
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+#include <drm/drm_ras.h>
+#include <linux/bitmap.h>
+
+#include "xe_device.h"
+#include "xe_drm_ras.h"
+
+static const char * const errors[] = DRM_XE_RAS_ERROR_CLASS_NAMES;
+static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
+
+static int hw_query_error_counter(struct xe_drm_ras_counter *info,
+				  u32 error_id, const char **name, u32 *val)
+{
+	if (error_id >= DRM_XE_RAS_ERROR_CLASS_MAX)
+		return -EINVAL;
+
+	if (!info[error_id].name)
+		return -ENOENT;
+
+	*name = info[error_id].name;
+	*val = atomic64_read(&info[error_id].counter);
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
+	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERROR_NONFATAL];
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
+	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERROR_FATAL];
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
+	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERROR_CORRECTABLE];
+
+	return hw_query_error_counter(info, error_id, name, val);
+}
+
+static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe,
+							     int count)
+{
+	struct xe_drm_ras_counter *counter;
+	int i;
+
+	counter = drmm_kzalloc(&xe->drm, count * sizeof(struct xe_drm_ras_counter), GFP_KERNEL);
+	if (!counter)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < count; i++) {
+		if (!errors[i])
+			continue;
+
+		counter[i].name = errors[i];
+		atomic64_set(&counter[i].counter, 0);
+	}
+
+	return counter;
+}
+
+static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
+			      const enum drm_xe_ras_error_severity severity)
+{
+	struct xe_drm_ras *ras = &xe->ras;
+	int count = 0, ret = 0;
+
+	count = DRM_XE_RAS_ERROR_CLASS_MAX;
+	node->error_counter_range.first = DRM_XE_RAS_ERROR_CORE_COMPUTE;
+	node->error_counter_range.last = DRM_XE_RAS_ERROR_CLASS_MAX - 1;
+
+	ras->info[severity] = allocate_and_copy_counters(xe, count);
+	if (IS_ERR(ras->info[severity]))
+		return PTR_ERR(ras->info[severity]);
+
+	switch (severity) {
+	case DRM_XE_RAS_ERROR_CORRECTABLE:
+		node->query_error_counter = query_correctable_error_counters;
+		break;
+	case DRM_XE_RAS_ERROR_NONFATAL:
+		node->query_error_counter = query_non_fatal_error_counters;
+		break;
+	case DRM_XE_RAS_ERROR_FATAL:
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
+	for (i = 0; i < DRM_XE_RAS_ERROR_SEVERITY_MAX; i++) {
+		struct drm_ras_node *node = &ras->node[i];
+
+		node->device_name = device_name;
+		node->node_name = error_severity[i];
+		node->type = DRM_RAS_NODE_TYPE_ERROR_COUNTER;
+		node->priv = xe;
+
+		ret = assign_node_params(xe, node, i);
+		if (ret)
+			return ret;
+
+		ret = drm_ras_node_register(node);
+		if (ret) {
+			drm_err(&xe->drm, "Failed to register drm ras tile node\n");
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
+	for (i = 0; i < DRM_XE_RAS_ERROR_SEVERITY_MAX; i++) {
+		struct drm_ras_node *node = &ras->node[i];
+
+		drm_ras_node_unregister(node);
+
+		if (i == 0)
+			kfree(node->device_name);
+	}
+}
+
+/**
+ * xe_drm_ras_allocate_nodes - Allocate drm ras nodes
+ * @xe: xe device instance
+ *
+ * Allocate xe drm ras nodes for all error severities per device
+ *
+ * Return: 0 on success, error code on failure
+ */
+int xe_drm_ras_allocate_nodes(struct xe_device *xe)
+{
+	struct xe_drm_ras *ras = &xe->ras;
+	struct drm_ras_node *node;
+	int err;
+
+	node = drmm_kzalloc(&xe->drm, DRM_XE_RAS_ERROR_SEVERITY_MAX * sizeof(struct drm_ras_node),
+			    GFP_KERNEL);
+	if (!node)
+		return -ENOMEM;
+
+	ras->node = node;
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
index 000000000000..409d6fa54a23
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_DRM_RAS_TYPES_H_
+#define _XE_DRM_RAS_TYPES_H_
+
+#include <drm/xe_drm.h>
+#include <linux/atomic.h>
+
+struct drm_ras_node;
+
+/**
+ * struct xe_drm_ras_counter - xe ras counter
+ *
+ * This structure contains error class and counter information
+ */
+struct xe_drm_ras_counter {
+	/** @name: error class name */
+	const char *name;
+	/** @counter: count of error */
+	atomic64_t counter;
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
+	struct xe_drm_ras_counter *info[DRM_XE_RAS_ERROR_SEVERITY_MAX];
+
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 8c65291f36fc..d63078d00b56 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -10,20 +10,14 @@
 #include "regs/xe_irq_regs.h"
 
 #include "xe_device.h"
+#include "xe_drm_ras.h"
 #include "xe_hw_error.h"
 #include "xe_mmio.h"
 #include "xe_survivability_mode.h"
 
 #define  HEC_UNCORR_FW_ERR_BITS 4
 extern struct fault_attr inject_csc_hw_error;
-
-/* Error categories reported by hardware */
-enum hardware_error {
-	HARDWARE_ERROR_CORRECTABLE = 0,
-	HARDWARE_ERROR_NONFATAL = 1,
-	HARDWARE_ERROR_FATAL = 2,
-	HARDWARE_ERROR_MAX,
-};
+static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
 
 static const char * const hec_uncorrected_fw_errors[] = {
 	"Fatal",
@@ -32,20 +26,6 @@ static const char * const hec_uncorrected_fw_errors[] = {
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
@@ -62,9 +42,10 @@ static void csc_hw_error_work(struct work_struct *work)
 		drm_err(&xe->drm, "Failed to enable runtime survivability mode\n");
 }
 
-static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
+static void csc_hw_error_handler(struct xe_tile *tile,
+				 const enum drm_xe_ras_error_severity severity)
 {
-	const char *hw_err_str = hw_error_to_str(hw_err);
+	const char *severity_str = error_severity[severity];
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_mmio *mmio = &tile->mmio;
 	u32 base, err_bit, err_src;
@@ -78,7 +59,7 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 	err_src = xe_mmio_read32(mmio, HEC_UNCORR_ERR_STATUS(base));
 	if (!err_src) {
 		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported HEC_ERR_STATUS_%s blank\n",
-				    tile->id, hw_err_str);
+				    tile->id, severity_str);
 		return;
 	}
 
@@ -87,7 +68,7 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 		for_each_set_bit(err_bit, &fw_err, HEC_UNCORR_FW_ERR_BITS) {
 			drm_err_ratelimited(&xe->drm, HW_ERR
 					    "%s: HEC Uncorrected FW %s error reported, bit[%d] is set\n",
-					     hw_err_str, hec_uncorrected_fw_errors[err_bit],
+					     severity_str, hec_uncorrected_fw_errors[err_bit],
 					     err_bit);
 
 			schedule_work(&tile->csc_hw_error_work);
@@ -97,9 +78,9 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 	xe_mmio_write32(mmio, HEC_UNCORR_ERR_STATUS(base), err_src);
 }
 
-static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
+static void hw_error_source_handler(struct xe_tile *tile, enum drm_xe_ras_error_severity severity)
 {
-	const char *hw_err_str = hw_error_to_str(hw_err);
+	const char *severity_str = error_severity[severity];
 	struct xe_device *xe = tile_to_xe(tile);
 	unsigned long flags;
 	u32 err_src;
@@ -108,17 +89,17 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 		return;
 
 	spin_lock_irqsave(&xe->irq.lock, flags);
-	err_src = xe_mmio_read32(&tile->mmio, DEV_ERR_STAT_REG(hw_err));
+	err_src = xe_mmio_read32(&tile->mmio, DEV_ERR_STAT_REG(severity));
 	if (!err_src) {
 		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported DEV_ERR_STAT_%s blank!\n",
-				    tile->id, hw_err_str);
+				    tile->id, severity_str);
 		goto unlock;
 	}
 
 	if (err_src & XE_CSC_ERROR)
-		csc_hw_error_handler(tile, hw_err);
+		csc_hw_error_handler(tile, severity);
 
-	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
+	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(severity), err_src);
 
 unlock:
 	spin_unlock_irqrestore(&xe->irq.lock, flags);
@@ -136,16 +117,30 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
  */
 void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
 {
-	enum hardware_error hw_err;
+	u32 hw_err;
 
 	if (fault_inject_csc_hw_error())
 		schedule_work(&tile->csc_hw_error_work);
 
-	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
+	for (hw_err = 0; hw_err < DRM_XE_RAS_ERROR_SEVERITY_MAX; hw_err++)
 		if (master_ctl & ERROR_IRQ(hw_err))
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
@@ -178,5 +173,6 @@ void xe_hw_error_init(struct xe_device *xe)
 
 	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
 
+	hw_error_info_init(xe);
 	process_hw_errors(xe);
 }
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0d99bb0cd20a..3f6c38908b70 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -2294,6 +2294,88 @@ struct drm_xe_vm_query_mem_range_attr {
 
 };
 
+/**
+ * DOC: Xe DRM RAS
+ *
+ * The enums and strings defined below map to the attributes of the DRM RAS Netlink Interface.
+ * Refer to Documentation/netlink/specs/drm_ras.yaml for complete interface specification.
+ *
+ * Node Registration
+ * =================
+ *
+ * The driver registers DRM RAS nodes for each error severity level.
+ * enum drm_xe_ras_error_severity defines the node-id, while DRM_XE_RAS_ERROR_SEVERITY_NAMES maps
+ * node-id to node-name.
+ *
+ * Error Classification
+ * ====================
+ *
+ * Each node contains a list of error counters. Each error is identified by a error-id and
+ * an error-name. enum drm_xe_ras_error_class defines the error-id, while
+ * DRM_XE_RAS_ERROR_CLASS_NAMES maps error-id to error-name.
+ *
+ * User Interface
+ * ==============
+ *
+ * To retrieve error values of a error counter, userspace applications should
+ * follow the below steps:
+ *
+ * 1. Use command LIST_NODES to enumerate all available nodes
+ * 2. Select node by node-id or node-name
+ * 3. Use command GET_ERROR_COUNTERS to list errors of specific node
+ * 4. Query specific error values using either error-id or error-name
+ *
+ * .. code-block:: C
+ *
+ *	// Lookup tables for ID-to-name resolution
+ *	static const char *nodes[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
+ *	static const char *errors[] = DRM_XE_RAS_ERROR_CLASS_NAMES;
+ *
+ */
+
+/**
+ * enum drm_xe_ras_error_severity - Supported drm ras error severity.
+ */
+enum drm_xe_ras_error_severity {
+	/** @DRM_XE_RAS_ERROR_CORRECTABLE: Correctable Error */
+	DRM_XE_RAS_ERROR_CORRECTABLE = 0,
+	/** @DRM_XE_RAS_ERROR_NONFATAL: Non fatal Error */
+	DRM_XE_RAS_ERROR_NONFATAL,
+	/** @DRM_XE_RAS_ERROR_FATAL: Fatal error */
+	DRM_XE_RAS_ERROR_FATAL,
+	/** @DRM_XE_RAS_ERROR_SEVERITY_MAX: Max severity */
+	DRM_XE_RAS_ERROR_SEVERITY_MAX, /* non-ABI */
+};
+
+/**
+ * enum drm_xe_ras_error_class - Supported drm ras error classes.
+ */
+enum drm_xe_ras_error_class {
+	/** @DRM_XE_RAS_ERROR_CORE_COMPUTE: GT and Media Error */
+	DRM_XE_RAS_ERROR_CORE_COMPUTE = 1,
+	/** @DRM_XE_RAS_ERROR_SOC_INTERNAL: SOC Error */
+	DRM_XE_RAS_ERROR_SOC_INTERNAL,
+	/** @DRM_XE_RAS_ERROR_CLASS_MAX: Max Error */
+	DRM_XE_RAS_ERROR_CLASS_MAX,	/* non-ABI */
+};
+
+/*
+ * Error severity to name mapping.
+ */
+#define DRM_XE_RAS_ERROR_SEVERITY_NAMES {				\
+	[DRM_XE_RAS_ERROR_CORRECTABLE] = "correctable-errors",		\
+	[DRM_XE_RAS_ERROR_NONFATAL] = "nonfatal-errors",		\
+	[DRM_XE_RAS_ERROR_FATAL] = "fatal-errors",			\
+}
+
+/*
+ * Error class to name mapping.
+ */
+#define DRM_XE_RAS_ERROR_CLASS_NAMES {					\
+	[DRM_XE_RAS_ERROR_CORE_COMPUTE] =  "Core Compute Error",	\
+	[DRM_XE_RAS_ERROR_SOC_INTERNAL] =  "SOC Internal Error",	\
+}
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.47.1

