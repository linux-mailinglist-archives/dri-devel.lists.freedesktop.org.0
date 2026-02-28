Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB2XGlGbommo4QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 08:37:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 185F01C1269
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 08:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D8710E224;
	Sat, 28 Feb 2026 07:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhrlSm/j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F54210E225;
 Sat, 28 Feb 2026 07:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772264269; x=1803800269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ge9VCVWo5FYtLsFd4EEvM4M+QVBrtkEg/rwmmHoaVQc=;
 b=BhrlSm/jOXKDk+QewIjMD/gt7IASx3lE501UwxsMVFwmsgMatFGLD8IG
 sHlGgJz6XA6l0BclUDY/2Unqb2lfVctYHlSqzwd4Qrs2pcWckCE5ZpIID
 2rKXCU1+UoCRBk9GqzVbtoX6Z8wqipUo/YciXDjHepAj/9QzfBiiCH3PZ
 6JBuhZ4O7aTFVzqL8io0CAir3WzjQO+4HwdL2bs5gM1DyPi3u37RIcIVK
 7nz1+XlIeMpSWrykgu28y1g7X/uEUmZ7aAlSQMyP8lUo2iK8OEAowRQPh
 Mmm2PzwKBAQ4kHJewzm/CeTvSkegGdmsp+5H4S/oomB/+U6E3oqIcMn0Q w==;
X-CSE-ConnectionGUID: S/Enxki+R4a/lVXVGocX7Q==
X-CSE-MsgGUID: oisjpVA3Qy6zTtEh1cTflg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73048434"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="73048434"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 23:37:49 -0800
X-CSE-ConnectionGUID: SO5TmrYwRZ+/Skm4neGNGQ==
X-CSE-MsgGUID: bFhG8P/8QKymb9pMIK+8uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="214466015"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 23:37:44 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, anvesh.bakwad@intel.com,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v9 2/5] drm/xe/xe_drm_ras: Add support for XE DRM RAS
Date: Sat, 28 Feb 2026 13:38:26 +0530
Message-ID: <20260228080858.3063532-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260228080858.3063532-7-riana.tauro@intel.com>
References: <20260228080858.3063532-7-riana.tauro@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,ffwll.ch,gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 185F01C1269
X-Rspamd-Action: no action

Allocate correctable, uncorrectable nodes for every xe device. Each node
contains error component, counters and respective query counter functions.

Add basic functionality to create and register drm nodes.

Below operations can be performed using Generic netlink DRM RAS interface:

1) List Nodes:

    $ sudo ynl --family drm_ras --dump list-nodes
    [{'device-name': '0000:03:00.0',
      'node-id': 0,
      'node-name': 'correctable-errors',
      'node-type': 'error-counter'},
     {'device-name': '0000:03:00.0',
      'node-id': 1,
      'node-name': 'uncorrectable-errors',
      'node-type': 'error-counter'}]

2) Get Error counters:

    $ sudo ynl --family drm_ras --dump get-error-counter --json '{"node-id":0}'
    [{'error-id': 1, 'error-name': 'core-compute', 'error-value': 0},
    {'error-id': 2, 'error-name': 'soc-internal', 'error-value': 0}]

3) Get specific Error counter:

    $ sudo ynl --family drm_ras --do get-error-counter --json '{"node-id":0, "error-id":1}'
    {'error-id': 1, 'error-name': 'core-compute', 'error-value': 0}

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Add ID's and names as uAPI (Rodrigo)
    Add documentation
    Modify commit message

v3: remove 'error' from counters
    use drmm_kcalloc
    add a for_each for severity
    differentitate error classes and severity in uapi (Raag)
    Use correctable and uncorrectable in uapi (Pratik / Aravind)

v4: change UAPI enums
    split patches
    make drm_kcalloc robust
    fix function names and memory leak (Raag)
    add null pointer check for device_name
    start loop counter from 1

v5: reorder linux includes
    rename to error_components
    use drmm_action for de-registeration
    rename xe_drm_ras_allocate_nodes to xe_drm_ras_init
    free info if DRM RAS registeration fails (Raag)

v6: cleanup node parameters in LIFO order
    print errors for failures (Raag)
---
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/xe_device_types.h  |   4 +
 drivers/gpu/drm/xe/xe_drm_ras.c       | 186 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_ras.h       |  15 +++
 drivers/gpu/drm/xe/xe_drm_ras_types.h |  40 ++++++
 include/uapi/drm/xe_drm.h             |  79 +++++++++++
 6 files changed, 325 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_drm_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_drm_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_drm_ras_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index ff778fb2d4ff..f63fdf80055a 100644
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
index 8f3ef836541e..666ca2374f70 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -13,6 +13,7 @@
 #include <drm/ttm/ttm_device.h>
 
 #include "xe_devcoredump_types.h"
+#include "xe_drm_ras_types.h"
 #include "xe_heci_gsc.h"
 #include "xe_late_bind_fw_types.h"
 #include "xe_oa_types.h"
@@ -507,6 +508,9 @@ struct xe_device {
 	/** @pmu: performance monitoring unit */
 	struct xe_pmu pmu;
 
+	/** @ras: RAS structure for device */
+	struct xe_drm_ras ras;
+
 	/** @i2c: I2C host controller */
 	struct xe_i2c *i2c;
 
diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
new file mode 100644
index 000000000000..e07dc23a155e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_drm_ras.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/bitmap.h>
+
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
+#include <drm/drm_ras.h>
+
+#include "xe_device_types.h"
+#include "xe_drm_ras.h"
+
+static const char * const error_components[] = DRM_XE_RAS_ERROR_COMPONENT_NAMES;
+static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
+
+static int hw_query_error_counter(struct xe_drm_ras_counter *info,
+				  u32 error_id, const char **name, u32 *val)
+{
+	if (!info || !info[error_id].name)
+		return -ENOENT;
+
+	*name = info[error_id].name;
+	*val = atomic_read(&info[error_id].counter);
+
+	return 0;
+}
+
+static int query_uncorrectable_error_counter(struct drm_ras_node *ep, u32 error_id,
+					     const char **name, u32 *val)
+{
+	struct xe_device *xe = ep->priv;
+	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE];
+
+	return hw_query_error_counter(info, error_id, name, val);
+}
+
+static int query_correctable_error_counter(struct drm_ras_node *ep, u32 error_id,
+					   const char **name, u32 *val)
+{
+	struct xe_device *xe = ep->priv;
+	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
+
+	return hw_query_error_counter(info, error_id, name, val);
+}
+
+static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe)
+{
+	struct xe_drm_ras_counter *counter;
+	int i;
+
+	counter = kcalloc(DRM_XE_RAS_ERR_COMP_MAX, sizeof(*counter), GFP_KERNEL);
+	if (!counter)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = DRM_XE_RAS_ERR_COMP_CORE_COMPUTE; i < DRM_XE_RAS_ERR_COMP_MAX; i++) {
+		if (!error_components[i])
+			continue;
+
+		counter[i].name = error_components[i];
+		atomic_set(&counter[i].counter, 0);
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
+	if (!device_name)
+		return -ENOMEM;
+
+	node->device_name = device_name;
+	node->node_name = error_severity[severity];
+	node->type = DRM_RAS_NODE_TYPE_ERROR_COUNTER;
+	node->error_counter_range.first = DRM_XE_RAS_ERR_COMP_CORE_COMPUTE;
+	node->error_counter_range.last = DRM_XE_RAS_ERR_COMP_MAX - 1;
+	node->priv = xe;
+
+	ras->info[severity] = allocate_and_copy_counters(xe);
+	if (IS_ERR(ras->info[severity]))
+		return PTR_ERR(ras->info[severity]);
+
+	if (severity == DRM_XE_RAS_ERR_SEV_CORRECTABLE)
+		node->query_error_counter = query_correctable_error_counter;
+	else
+		node->query_error_counter = query_uncorrectable_error_counter;
+
+	return 0;
+}
+
+static void cleanup_node_param(struct xe_drm_ras *ras, const enum drm_xe_ras_error_severity severity)
+{
+	struct drm_ras_node *node = &ras->node[severity];
+
+	kfree(ras->info[severity]);
+	ras->info[severity] = NULL;
+
+	kfree(node->device_name);
+	node->device_name = NULL;
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
+		if (ret) {
+			cleanup_node_param(ras, i);
+			return ret;
+		}
+
+		ret = drm_ras_node_register(node);
+		if (ret) {
+			cleanup_node_param(ras, i);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void xe_drm_ras_unregister_nodes(struct drm_device *device, void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_drm_ras *ras = &xe->ras;
+	int i;
+
+	for_each_error_severity(i) {
+		struct drm_ras_node *node = &ras->node[i];
+
+		drm_ras_node_unregister(node);
+		cleanup_node_param(ras, i);
+	}
+}
+
+/**
+ * xe_drm_ras_init() - Initialize DRM RAS
+ * @xe: xe device instance
+ *
+ * Allocate and register DRM RAS nodes per device
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int xe_drm_ras_init(struct xe_device *xe)
+{
+	struct xe_drm_ras *ras = &xe->ras;
+	struct drm_ras_node *node;
+	int err;
+
+	node = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_SEV_MAX, sizeof(*node), GFP_KERNEL);
+	if (!node)
+		return -ENOMEM;
+
+	ras->node = node;
+
+	err = register_nodes(xe);
+	if (err) {
+		drm_err(&xe->drm, "Failed to register DRM RAS nodes (%pe)\n", ERR_PTR(err));
+		return err;
+	}
+
+	err = drmm_add_action_or_reset(&xe->drm, xe_drm_ras_unregister_nodes, xe);
+	if (err) {
+		drm_err(&xe->drm, "Failed to add action for Xe DRM RAS (%pe)\n", ERR_PTR(err));
+		return err;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_drm_ras.h b/drivers/gpu/drm/xe/xe_drm_ras.h
new file mode 100644
index 000000000000..5cc8f0124411
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
+	for (i = 0; i < DRM_XE_RAS_ERR_SEV_MAX; i++)
+
+int xe_drm_ras_init(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
new file mode 100644
index 000000000000..7acc5e7377b2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_DRM_RAS_TYPES_H_
+#define _XE_DRM_RAS_TYPES_H_
+
+#include <linux/atomic.h>
+#include <drm/xe_drm.h>
+
+struct drm_ras_node;
+
+/**
+ * struct xe_drm_ras_counter - XE RAS counter
+ *
+ * This structure contains error component and counter information
+ */
+struct xe_drm_ras_counter {
+	/** @name: error component name */
+	const char *name;
+
+	/** @counter: count of error */
+	atomic_t counter;
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
+	struct xe_drm_ras_counter *info[DRM_XE_RAS_ERR_SEV_MAX];
+};
+
+#endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ef2565048bdf..b0264c32ceb2 100644
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
+ * an error-name. enum drm_xe_ras_error_component defines the error-id, while
+ * DRM_XE_RAS_ERROR_COMPONENT_NAMES maps error-id to error-name.
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
+ *	static const char *errors[] = DRM_XE_RAS_ERROR_COMPONENT_NAMES;
+ *
+ */
+
+/**
+ * enum drm_xe_ras_error_severity - DRM RAS error severity.
+ */
+enum drm_xe_ras_error_severity {
+	/** @DRM_XE_RAS_ERR_SEV_CORRECTABLE: Correctable Error */
+	DRM_XE_RAS_ERR_SEV_CORRECTABLE = 0,
+	/** @DRM_XE_RAS_ERR_SEV_UNCORRECTABLE: Uncorrectable Error */
+	DRM_XE_RAS_ERR_SEV_UNCORRECTABLE,
+	/** @DRM_XE_RAS_ERR_SEV_MAX: Max severity */
+	DRM_XE_RAS_ERR_SEV_MAX /* non-ABI */
+};
+
+/**
+ * enum drm_xe_ras_error_component - DRM RAS error component.
+ */
+enum drm_xe_ras_error_component {
+	/** @DRM_XE_RAS_ERR_COMP_CORE_COMPUTE: Core Compute Error */
+	DRM_XE_RAS_ERR_COMP_CORE_COMPUTE = 1,
+	/** @DRM_XE_RAS_ERR_COMP_SOC_INTERNAL: SoC Internal Error */
+	DRM_XE_RAS_ERR_COMP_SOC_INTERNAL,
+	/** @DRM_XE_RAS_ERR_COMP_MAX: Max Error */
+	DRM_XE_RAS_ERR_COMP_MAX	/* non-ABI */
+};
+
+/*
+ * Error severity to name mapping.
+ */
+#define DRM_XE_RAS_ERROR_SEVERITY_NAMES {				\
+	[DRM_XE_RAS_ERR_SEV_CORRECTABLE] = "correctable-errors",	\
+	[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE] = "uncorrectable-errors",	\
+}
+
+/*
+ * Error component to name mapping.
+ */
+#define DRM_XE_RAS_ERROR_COMPONENT_NAMES {				\
+	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE] = "core-compute",		\
+	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal"		\
+}
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.47.1

