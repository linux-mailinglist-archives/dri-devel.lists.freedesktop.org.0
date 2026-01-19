Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CC5D39CE2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 04:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF6310E336;
	Mon, 19 Jan 2026 03:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q53bHzTJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E2E10E335;
 Mon, 19 Jan 2026 03:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768793410; x=1800329410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P8WJPJ/waRXWn1SjE6D2Yr/qMqdKR2gdx3KbBeVlPHg=;
 b=Q53bHzTJJajV0RO9xnzJI/3Kug7/+Twfklo8QPbJOKnnibNaCPbibyXv
 aOMgrVuVfQW1Rlp8Ri0K9Ic0lQVwATQgo9JC65mtuIyDmEVf7EXPiPOWp
 8oMUKCGIGi52qqOJIRHvuVJWx3qoyKu4q78tV7nwHVpGEKOP6t+FkuRgS
 0MkkTnonXc58JSM40v33223M6golm0cvpOuYOTwsswLAEIOT7oAkEyKh2
 BpnRRtkydM/pCZnoWCPxEip1XEyZiJeCTxj7mbgPOSSJo+fgi5LdCSWj5
 yM3RRSS9Fp3IBqOxcGpkY/+Im5PL/xK6wiJTTGGnbSCPagIFd4DFclx+x A==;
X-CSE-ConnectionGUID: kl+vruNAQ+65u5s8ACXsgQ==
X-CSE-MsgGUID: buYFYyMmRKm8ibXiaf9r3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70050109"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="70050109"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 19:30:10 -0800
X-CSE-ConnectionGUID: lxq8hBteRg2VRin4uUlfdw==
X-CSE-MsgGUID: wpFTg9wJQYymEth6YtCs8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="243323960"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 19:30:07 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v4 2/4] drm/xe/xe_drm_ras: Add support for drm ras
Date: Mon, 19 Jan 2026 09:30:24 +0530
Message-ID: <20260119040023.2821518-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260119040023.2821518-6-riana.tauro@intel.com>
References: <20260119040023.2821518-6-riana.tauro@intel.com>
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

Allocate correctable, uncorrectable nodes for every xe device
Each node contains error classes, counters and respective
query counter functions.

Add basic functionality to create and register drm nodes.
Below operations can be performed using Generic netlink DRM RAS interface

List Nodes:

$ sudo ynl --family drm_ras --dump list-nodes
[{'device-name': '0000:03:00.0',
  'node-id': 0,
  'node-name': 'correctable-errors',
  'node-type': 'error-counter'},
 {'device-name': '0000:03:00.0',
  'node-id': 1,
  'node-name': 'uncorrectable-errors',
  'node-type': 'error-counter'}]

Get Error counters:

$ sudo ynl --family drm_ras  --dump get-error-counters --json '{"node-id":0}'
[{'error-id': 1, 'error-name': 'GT', 'error-value': 0},
 {'error-id': 2, 'error-name': 'SoC', 'error-value': 0}]

Query Error counter:

$ sudo ynl --family drm_ras --do query-error-counter  --json '{"node-id":0, "error-id":1}'
{'error-id': 1, 'error-name': 'GT', 'error-value': 0}

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: Add ID's and names as uAPI (Rodrigo)
    Add documentation
    Modify commit message

v3: remove 'error' from counters
    use drmm_kcalloc
    add a for_each for severity
    differentitate error classes and severity in uapi
    Use GT instead of Core Compute(Raag)
    Use correctable and uncorrectable in uapi (Pratik / Aravind)
---
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/xe_device_types.h  |   4 +
 drivers/gpu/drm/xe/xe_drm_ras.c       | 176 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_ras.h       |  15 +++
 drivers/gpu/drm/xe/xe_drm_ras_types.h |  49 +++++++
 drivers/gpu/drm/xe/xe_hw_error.c      |  63 ++++-----
 include/uapi/drm/xe_drm.h             |  79 ++++++++++++
 7 files changed, 358 insertions(+), 29 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_drm_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_drm_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_drm_ras_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b39cbb756232..b25564649492 100644
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
index 34feef79fa4e..2e863fcb2f08 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -13,6 +13,7 @@
 #include <drm/ttm/ttm_device.h>
 
 #include "xe_devcoredump_types.h"
+#include "xe_drm_ras_types.h"
 #include "xe_heci_gsc.h"
 #include "xe_late_bind_fw_types.h"
 #include "xe_lmtt_types.h"
@@ -674,6 +675,9 @@ struct xe_device {
 	/** @pmu: performance monitoring unit */
 	struct xe_pmu pmu;
 
+	/** @ras: RAS structure for device */
+	struct xe_drm_ras ras;
+
 	/** @i2c: I2C host controller */
 	struct xe_i2c *i2c;
 
diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
new file mode 100644
index 000000000000..a665f53ac191
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_drm_ras.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
+#include <drm/drm_ras.h>
+#include <linux/bitmap.h>
+
+#include "xe_device_types.h"
+#include "xe_drm_ras.h"
+
+static const char * const errors[] = DRM_XE_RAS_ERROR_CLASS_NAMES;
+static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
+
+static int hw_query_error_counter(struct xe_drm_ras_counter *info,
+				  u32 error_id, const char **name, u32 *val)
+{
+	if (error_id < DRM_XE_RAS_ERROR_CLASS_GT || error_id >= DRM_XE_RAS_ERROR_CLASS_MAX)
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
+static int query_uncorrectable_error_counters(struct drm_ras_node *ep,
+					      u32 error_id, const char **name,
+					      u32 *val)
+{
+	struct xe_device *xe = ep->priv;
+	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE];
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
+	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERROR_SEVERITY_CORRECTABLE];
+
+	return hw_query_error_counter(info, error_id, name, val);
+}
+
+static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe)
+{
+	struct xe_drm_ras_counter *counter;
+	int i;
+
+	counter = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERROR_CLASS_MAX,
+			       sizeof(struct xe_drm_ras_counter), GFP_KERNEL);
+	if (!counter)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < DRM_XE_RAS_ERROR_CLASS_MAX; i++) {
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
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct xe_drm_ras *ras = &xe->ras;
+	const char *device_name;
+
+	device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
+				pci_domain_nr(pdev->bus), pdev->bus->number,
+				PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
+
+	node->device_name = device_name;
+	node->node_name = error_severity[severity];
+	node->type = DRM_RAS_NODE_TYPE_ERROR_COUNTER;
+	node->error_counter_range.first = DRM_XE_RAS_ERROR_CLASS_GT;
+	node->error_counter_range.last = DRM_XE_RAS_ERROR_CLASS_MAX - 1;
+	node->priv = xe;
+
+	ras->info[severity] = allocate_and_copy_counters(xe);
+	if (IS_ERR(ras->info[severity]))
+		return PTR_ERR(ras->info[severity]);
+
+	if (severity == DRM_XE_RAS_ERROR_SEVERITY_CORRECTABLE)
+		node->query_error_counter = query_correctable_error_counters;
+	else
+		node->query_error_counter = query_uncorrectable_error_counters;
+
+	return 0;
+}
+
+static int register_nodes(struct xe_device *xe)
+{
+	struct xe_drm_ras *ras = &xe->ras;
+	int i;
+
+	for_each_error_severity(i) {
+		struct drm_ras_node *node = &ras->node[i];
+		int ret;
+
+		ret = assign_node_params(xe, node, i);
+		if (ret)
+			return ret;
+
+		ret = drm_ras_node_register(node);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void xe_drm_ras_unregister_nodes(void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_drm_ras *ras = &xe->ras;
+	int i;
+
+	for_each_error_severity(i) {
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
+ * xe_drm_ras_allocate_nodes - Allocate DRM RAS nodes
+ * @xe: xe device instance
+ *
+ * Allocate and register DRM RAS nodes per device
+ *
+ * Return: 0 on success, error code on failure
+ */
+int xe_drm_ras_allocate_nodes(struct xe_device *xe)
+{
+	struct xe_drm_ras *ras = &xe->ras;
+	struct drm_ras_node *node;
+	int err;
+
+	node = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERROR_SEVERITY_MAX, sizeof(struct drm_ras_node),
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
index 000000000000..2d714342e4e5
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_drm_ras.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+#ifndef XE_DRM_RAS_H_
+#define XE_DRM_RAS_H_
+
+struct xe_device;
+
+#define for_each_error_severity(i)	\
+	for (i = 0; i < DRM_XE_RAS_ERROR_SEVERITY_MAX; i++)
+
+int xe_drm_ras_allocate_nodes(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
new file mode 100644
index 000000000000..528c708e57da
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
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
+/* Error categories reported by hardware */
+enum hardware_error {
+	HARDWARE_ERROR_CORRECTABLE = 0,
+	HARDWARE_ERROR_NONFATAL = 1,
+	HARDWARE_ERROR_FATAL = 2,
+	HARDWARE_ERROR_MAX,
+};
+
+/**
+ * struct xe_drm_ras_counter - XE RAS counter
+ *
+ * This structure contains error class and counter information
+ */
+struct xe_drm_ras_counter {
+	/** @name: error class name */
+	const char *name;
+
+	/** @counter: count of error */
+	atomic64_t counter;
+};
+
+/**
+ * struct xe_drm_ras - XE DRM RAS structure
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
index 8c65291f36fc..b42495d3015a 100644
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
@@ -32,23 +26,17 @@ static const char * const hec_uncorrected_fw_errors[] = {
 	"Data Corruption"
 };
 
-static const char *hw_error_to_str(const enum hardware_error hw_err)
+static bool fault_inject_csc_hw_error(void)
 {
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
+	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
 }
 
-static bool fault_inject_csc_hw_error(void)
+static enum drm_xe_ras_error_severity hw_err_to_severity(enum hardware_error hw_err)
 {
-	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
+	if (hw_err == HARDWARE_ERROR_CORRECTABLE)
+		return DRM_XE_RAS_ERROR_SEVERITY_CORRECTABLE;
+
+	return DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE;
 }
 
 static void csc_hw_error_work(struct work_struct *work)
@@ -64,7 +52,8 @@ static void csc_hw_error_work(struct work_struct *work)
 
 static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
-	const char *hw_err_str = hw_error_to_str(hw_err);
+	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
+	const char *severity_str = error_severity[severity];
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_mmio *mmio = &tile->mmio;
 	u32 base, err_bit, err_src;
@@ -77,8 +66,8 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 	lockdep_assert_held(&xe->irq.lock);
 	err_src = xe_mmio_read32(mmio, HEC_UNCORR_ERR_STATUS(base));
 	if (!err_src) {
-		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported HEC_ERR_STATUS_%s blank\n",
-				    tile->id, hw_err_str);
+		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported %s HEC_ERR_STATUS register blank\n",
+				    tile->id, severity_str);
 		return;
 	}
 
@@ -86,8 +75,8 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 		fw_err = xe_mmio_read32(mmio, HEC_UNCORR_FW_ERR_DW0(base));
 		for_each_set_bit(err_bit, &fw_err, HEC_UNCORR_FW_ERR_BITS) {
 			drm_err_ratelimited(&xe->drm, HW_ERR
-					    "%s: HEC Uncorrected FW %s error reported, bit[%d] is set\n",
-					     hw_err_str, hec_uncorrected_fw_errors[err_bit],
+					    "HEC FW %s error reported, bit[%d] is set\n",
+					     hec_uncorrected_fw_errors[err_bit],
 					     err_bit);
 
 			schedule_work(&tile->csc_hw_error_work);
@@ -99,7 +88,8 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 
 static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
-	const char *hw_err_str = hw_error_to_str(hw_err);
+	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
+	const char *severity_str = error_severity[severity];
 	struct xe_device *xe = tile_to_xe(tile);
 	unsigned long flags;
 	u32 err_src;
@@ -110,8 +100,8 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 	spin_lock_irqsave(&xe->irq.lock, flags);
 	err_src = xe_mmio_read32(&tile->mmio, DEV_ERR_STAT_REG(hw_err));
 	if (!err_src) {
-		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported DEV_ERR_STAT_%s blank!\n",
-				    tile->id, hw_err_str);
+		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported %s DEV_ERR_STAT register blank!\n",
+				    tile->id, severity_str);
 		goto unlock;
 	}
 
@@ -146,6 +136,20 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
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
@@ -178,5 +182,6 @@ void xe_hw_error_init(struct xe_device *xe)
 
 	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
 
+	hw_error_info_init(xe);
 	process_hw_errors(xe);
 }
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 077e66a682e2..5a08d46f29a7 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -2357,6 +2357,85 @@ struct drm_xe_exec_queue_set_property {
 	__u64 reserved[2];
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
+ * enum drm_xe_ras_error_severity - DRM RAS error severity.
+ */
+enum drm_xe_ras_error_severity {
+	/** @DRM_XE_RAS_ERROR_SEVERITY_CORRECTABLE: Correctable Error */
+	DRM_XE_RAS_ERROR_SEVERITY_CORRECTABLE = 0,
+	/** @DRM_XE_RAS_ERROR_UNCORRECTABLE: Uncorrectable Error */
+	DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE,
+	/** @DRM_XE_RAS_ERROR_SEVERITY_MAX: Max severity */
+	DRM_XE_RAS_ERROR_SEVERITY_MAX /* non-ABI */
+};
+
+/**
+ * enum drm_xe_ras_error_class - DRM RAS error classes.
+ */
+enum drm_xe_ras_error_class {
+	/** @DRM_XE_RAS_ERROR_CLASS_GT: GT Error */
+	DRM_XE_RAS_ERROR_CLASS_GT = 1,
+	/** @DRM_XE_RAS_ERROR_CLASS_SOC: SoC Error */
+	DRM_XE_RAS_ERROR_CLASS_SOC,
+	/** @DRM_XE_RAS_ERROR_CLASS_MAX: Max Error */
+	DRM_XE_RAS_ERROR_CLASS_MAX	/* non-ABI */
+};
+
+/*
+ * Error severity to name mapping.
+ */
+#define DRM_XE_RAS_ERROR_SEVERITY_NAMES {					\
+	[DRM_XE_RAS_ERROR_SEVERITY_CORRECTABLE] = "correctable-errors",		\
+	[DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE] = "uncorrectable-errors",	\
+}
+
+/*
+ * Error class to name mapping.
+ */
+#define DRM_XE_RAS_ERROR_CLASS_NAMES {					\
+	[DRM_XE_RAS_ERROR_CLASS_GT] = "GT",				\
+	[DRM_XE_RAS_ERROR_CLASS_SOC] = "SoC"				\
+}
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.47.1

