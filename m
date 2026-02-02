Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GW5FqVAgGlJ5QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 07:13:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F3EC88EE
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 07:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0531710E264;
	Mon,  2 Feb 2026 06:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdKkiQL4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4CD10E228;
 Mon,  2 Feb 2026 06:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770012834; x=1801548834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b2MQbZNxnuhoUIV7NbMvRnITw+Vo6e5akD4TWQyi4mg=;
 b=bdKkiQL4gOtm9JcjbEDx/4xPOdStWVKNr9LB+fDXtDEZyU8M1+LlJBvs
 lHPEDgIIIhsA2IPsxsffESpgdhGLBABUYZhrmj43i+rvOzO8kWpQNz9oq
 dh3HQZwAtWcphlSBRR5xS8GAkdFlIOdFpwEGfYQI2QokjV4OP0fTN+Ovn
 hhJx+aJFCteBBiwpiOoBr5zPXYPatWu+1DNQAvmeQrYj52QprEWpx6buW
 /0HgYm7nsLkSXup9oTdq+S59htohFIA6QiJO8DB7NS7Siechd50sPpWnR
 K/0O+SqYYE2vIwFB2zyjosiTNtfpeInwXj1KSBgV4Ii2es32w59JFKtW2 Q==;
X-CSE-ConnectionGUID: 9mpLOAO9TQCTnjglrccbwg==
X-CSE-MsgGUID: VrKBDacyR1+Ly2+3BUaYNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71250439"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="71250439"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 22:13:54 -0800
X-CSE-ConnectionGUID: 1Lx1M2niRIOgzUxD40coiw==
X-CSE-MsgGUID: dqU/j0tQRLyPkozu3MKSsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209720004"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 22:13:50 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v5 2/5] drm/xe/xe_drm_ras: Add support for XE DRM RAS
Date: Mon,  2 Feb 2026 12:13:58 +0530
Message-ID: <20260202064356.286243-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260202064356.286243-7-riana.tauro@intel.com>
References: <20260202064356.286243-7-riana.tauro@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,ffwll.ch,gmail.com];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: C5F3EC88EE
X-Rspamd-Action: no action

Allocate correctable, uncorrectable nodes for every xe device
Each node contains error component, counters and respective
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

$ sudo ynl --family drm_ras  --dump get-error-counters --json '{"node-id":1}'
[{'error-id': 1, 'error-name': 'core-compute', 'error-value': 0},
 {'error-id': 2, 'error-name': 'soc-internal', 'error-value': 0}]

Query Error counter:

$ sudo ynl --family drm_ras --do query-error-counter  --json '{"node-id":1, "error-id":2}'
{'error-id': 2, 'error-name': 'soc-internal', 'error-value': 0}

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

v4: change UAPI enums
    split patches
    make drm_kcalloc robust
    fix function names and memory leak (Raag)
    add null pointer check for device_name
    start loop counter from 1
---
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/xe_device_types.h  |   4 +
 drivers/gpu/drm/xe/xe_drm_ras.c       | 184 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_ras.h       |  15 +++
 drivers/gpu/drm/xe/xe_drm_ras_types.h |  40 ++++++
 include/uapi/drm/xe_drm.h             |  79 +++++++++++
 6 files changed, 323 insertions(+)
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
index 000000000000..ec057bc82fbb
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_drm_ras.c
@@ -0,0 +1,184 @@
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
+static const char * const errors[] = DRM_XE_RAS_ERROR_COMPONENT_NAMES;
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
+	counter = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_COMP_MAX,
+			       sizeof(*counter), GFP_KERNEL);
+	if (!counter)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = DRM_XE_RAS_ERR_COMP_CORE_COMPUTE; i < DRM_XE_RAS_ERR_COMP_MAX; i++) {
+		if (!errors[i])
+			continue;
+
+		counter[i].name = errors[i];
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
+static void cleanup_node_param(struct drm_ras_node *node)
+{
+	if (node && node->device_name) {
+		kfree(node->device_name);
+		node->device_name = NULL;
+	}
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
+			cleanup_node_param(node);
+			return ret;
+		}
+
+		ret = drm_ras_node_register(node);
+		if (ret) {
+			cleanup_node_param(node);
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
+	int i;
+
+	for_each_error_severity(i) {
+		struct drm_ras_node *node = &ras->node[i];
+
+		drm_ras_node_unregister(node);
+		cleanup_node_param(node);
+	}
+}
+
+/**
+ * xe_drm_ras_allocate_nodes() - Allocate DRM RAS nodes
+ * @xe: xe device instance
+ *
+ * Allocate and register DRM RAS nodes per device
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int xe_drm_ras_allocate_nodes(struct xe_device *xe)
+{
+	struct xe_drm_ras *ras = &xe->ras;
+	struct drm_ras_node *node;
+	int err;
+
+	node = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_SEV_MAX, sizeof(*node),
+			    GFP_KERNEL);
+	if (!node)
+		return -ENOMEM;
+
+	ras->node = node;
+
+	err = register_nodes(xe);
+	if (err) {
+		drm_err(&xe->drm, "Failed to register DRM RAS node\n");
+		return err;
+	}
+
+	err = devm_add_action_or_reset(xe->drm.dev, xe_drm_ras_unregister_nodes, xe);
+	if (err) {
+		drm_err(&xe->drm, "Failed to add action for Xe DRM RAS\n");
+		return err;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_drm_ras.h b/drivers/gpu/drm/xe/xe_drm_ras.h
new file mode 100644
index 000000000000..d5206c04c274
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
+int xe_drm_ras_allocate_nodes(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
new file mode 100644
index 000000000000..0ac4ae324f37
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
+#include <drm/xe_drm.h>
+#include <linux/atomic.h>
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
index 077e66a682e2..765bafd63ca1 100644
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

