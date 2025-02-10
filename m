Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4248A2FE76
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 00:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1C510E403;
	Mon, 10 Feb 2025 23:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0/zxV9k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0CD10E404;
 Mon, 10 Feb 2025 23:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739230431; x=1770766431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MMfDOo5DjIX3gfbJX6BC6ZgkPTQ8H6tLdpxDUTRtyCM=;
 b=f0/zxV9kg3AEnQ/CoVRhy79i9BIzoHZv5vJW7uhWbvPVcjEY7w7QznHR
 ae+tzCGjuO0X1NFLj/3aaHmp3eZYbBAbSaUu6v5AczY4FTPAkCD1XwiOw
 4mXrDYlArgxfJX0cV1ALhAXhwnhVI93BALcFyY6AXN8iIIFb3sIyvt4GC
 IhyTjcmWHvPp2oyqFn1So7iWyZJ2jt2UE3IKSalaifuljZGtUNO5HHHv5
 ailSDeI0T0YeM9ogxPFHYGVh73Aj+YVyKZENmW+GsiA9/R9mvJ0xTL3nP
 MJTO4ucrMfTJGd8WyIufzB0HGZ30hDpnKZ1bWhZXslPBQUf9drmlF8Od5 A==;
X-CSE-ConnectionGUID: w88URCP7S7eZdxd8/LB1Og==
X-CSE-MsgGUID: proIM+amSMy2UeoKeF9mzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39853925"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39853925"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 15:33:50 -0800
X-CSE-ConnectionGUID: ByF0bRghSuCNcr4vBH3O8w==
X-CSE-MsgGUID: Ogv/R3ADSbKBshS14bnIuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117252441"
Received: from aalteres-desk1.fm.intel.com ([10.1.39.140])
 by orviesa003.jf.intel.com with ESMTP; 10 Feb 2025 15:32:55 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v7 1/6] drm/xe/guc: Rename __guc_capture_parsed_output
Date: Mon, 10 Feb 2025 15:32:49 -0800
Message-Id: <20250210233254.419587-2-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210233254.419587-1-alan.previn.teres.alexis@intel.com>
References: <20250210233254.419587-1-alan.previn.teres.alexis@intel.com>
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

Since '__guc_capture_parsed_output *' is a handle that
is retrieved, stored and relinquished by an entity
external to GuC (i.e. xe_devcoredump), lets rename it to
something formal without the'__' prefix and export it
via give a header file.

   v7: - Copyright header fix in xe_guc_capture_snapshot_types.h
       (Rodrigo)

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump_types.h     |  2 +-
 drivers/gpu/drm/xe/xe_guc_capture.c           | 83 ++++++-------------
 drivers/gpu/drm/xe/xe_guc_capture.h           |  2 +-
 .../drm/xe/xe_guc_capture_snapshot_types.h    | 53 ++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.c             |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |  5 --
 6 files changed, 81 insertions(+), 66 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h

diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 1a1d16a96b2d..c94ce21043a8 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -58,7 +58,7 @@ struct xe_devcoredump_snapshot {
 	 * this single-node tracker works because devcoredump will always only
 	 * produce one hw-engine capture per devcoredump event
 	 */
-	struct __guc_capture_parsed_output *matched_node;
+	struct xe_guc_capture_snapshot *matched_node;
 	/** @vm: Snapshot of VM state */
 	struct xe_vm_snapshot *vm;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index f6d523e4c5fe..e04c87739267 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -26,6 +26,7 @@
 #include "xe_guc_ads.h"
 #include "xe_guc_capture.h"
 #include "xe_guc_capture_types.h"
+#include "xe_guc_capture_snapshot_types.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_guc_log.h"
@@ -53,40 +54,6 @@ struct __guc_capture_bufstate {
 	u32 wr;
 };
 
-/*
- * struct __guc_capture_parsed_output - extracted error capture node
- *
- * A single unit of extracted error-capture output data grouped together
- * at an engine-instance level. We keep these nodes in a linked list.
- * See cachelist and outlist below.
- */
-struct __guc_capture_parsed_output {
-	/*
-	 * A single set of 3 capture lists: a global-list
-	 * an engine-class-list and an engine-instance list.
-	 * outlist in __guc_capture_parsed_output will keep
-	 * a linked list of these nodes that will eventually
-	 * be detached from outlist and attached into to
-	 * xe_codedump in response to a context reset
-	 */
-	struct list_head link;
-	bool is_partial;
-	u32 eng_class;
-	u32 eng_inst;
-	u32 guc_id;
-	u32 lrca;
-	u32 type;
-	bool locked;
-	enum xe_hw_engine_snapshot_source_id source;
-	struct gcap_reg_list_info {
-		u32 vfid;
-		u32 num_regs;
-		struct guc_mmio_reg *regs;
-	} reginfo[GUC_STATE_CAPTURE_TYPE_MAX];
-#define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_STATE_CAPTURE_TYPE_GLOBAL)
-#define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS)
-};
-
 /*
  * Define all device tables of GuC error capture register lists
  * NOTE:
@@ -287,7 +254,7 @@ struct xe_guc_state_capture {
 
 static void
 guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
-					   struct __guc_capture_parsed_output *node);
+					   struct xe_guc_capture_snapshot *node);
 
 static const struct __guc_mmio_reg_descr_group *
 guc_capture_get_device_reglist(struct xe_device *xe)
@@ -841,7 +808,7 @@ static void check_guc_capture_size(struct xe_guc *guc)
 }
 
 static void
-guc_capture_add_node_to_list(struct __guc_capture_parsed_output *node,
+guc_capture_add_node_to_list(struct xe_guc_capture_snapshot *node,
 			     struct list_head *list)
 {
 	list_add(&node->link, list);
@@ -849,7 +816,7 @@ guc_capture_add_node_to_list(struct __guc_capture_parsed_output *node,
 
 static void
 guc_capture_add_node_to_outlist(struct xe_guc_state_capture *gc,
-				struct __guc_capture_parsed_output *node)
+				struct xe_guc_capture_snapshot *node)
 {
 	guc_capture_remove_stale_matches_from_list(gc, node);
 	guc_capture_add_node_to_list(node, &gc->outlist);
@@ -857,14 +824,14 @@ guc_capture_add_node_to_outlist(struct xe_guc_state_capture *gc,
 
 static void
 guc_capture_add_node_to_cachelist(struct xe_guc_state_capture *gc,
-				  struct __guc_capture_parsed_output *node)
+				  struct xe_guc_capture_snapshot *node)
 {
 	guc_capture_add_node_to_list(node, &gc->cachelist);
 }
 
 static void
 guc_capture_free_outlist_node(struct xe_guc_state_capture *gc,
-			      struct __guc_capture_parsed_output *n)
+			      struct xe_guc_capture_snapshot *n)
 {
 	if (n) {
 		n->locked = 0;
@@ -876,9 +843,9 @@ guc_capture_free_outlist_node(struct xe_guc_state_capture *gc,
 
 static void
 guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
-					   struct __guc_capture_parsed_output *node)
+					   struct xe_guc_capture_snapshot *node)
 {
-	struct __guc_capture_parsed_output *n, *ntmp;
+	struct xe_guc_capture_snapshot *n, *ntmp;
 	int guc_id = node->guc_id;
 
 	list_for_each_entry_safe(n, ntmp, &gc->outlist, link) {
@@ -888,7 +855,7 @@ guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
 }
 
 static void
-guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *node)
+guc_capture_init_node(struct xe_guc *guc, struct xe_guc_capture_snapshot *node)
 {
 	struct guc_mmio_reg *tmp[GUC_STATE_CAPTURE_TYPE_MAX];
 	int i;
@@ -1067,13 +1034,13 @@ guc_capture_log_get_register(struct xe_guc *guc, struct __guc_capture_bufstate *
 	return 0;
 }
 
-static struct __guc_capture_parsed_output *
+static struct xe_guc_capture_snapshot *
 guc_capture_get_prealloc_node(struct xe_guc *guc)
 {
-	struct __guc_capture_parsed_output *found = NULL;
+	struct xe_guc_capture_snapshot *found = NULL;
 
 	if (!list_empty(&guc->capture->cachelist)) {
-		struct __guc_capture_parsed_output *n, *ntmp;
+		struct xe_guc_capture_snapshot *n, *ntmp;
 
 		/* get first avail node from the cache list */
 		list_for_each_entry_safe(n, ntmp, &guc->capture->cachelist, link) {
@@ -1081,7 +1048,7 @@ guc_capture_get_prealloc_node(struct xe_guc *guc)
 			break;
 		}
 	} else {
-		struct __guc_capture_parsed_output *n, *ntmp;
+		struct xe_guc_capture_snapshot *n, *ntmp;
 
 		/*
 		 * traverse reversed and steal back the oldest node already
@@ -1100,11 +1067,11 @@ guc_capture_get_prealloc_node(struct xe_guc *guc)
 	return found;
 }
 
-static struct __guc_capture_parsed_output *
-guc_capture_clone_node(struct xe_guc *guc, struct __guc_capture_parsed_output *original,
+static struct xe_guc_capture_snapshot *
+guc_capture_clone_node(struct xe_guc *guc, struct xe_guc_capture_snapshot *original,
 		       u32 keep_reglist_mask)
 {
-	struct __guc_capture_parsed_output *new;
+	struct xe_guc_capture_snapshot *new;
 	int i;
 
 	new = guc_capture_get_prealloc_node(guc);
@@ -1146,7 +1113,7 @@ guc_capture_extract_reglists(struct xe_guc *guc, struct __guc_capture_bufstate *
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct guc_state_capture_group_header_t ghdr = {0};
 	struct guc_state_capture_header_t hdr = {0};
-	struct __guc_capture_parsed_output *node = NULL;
+	struct xe_guc_capture_snapshot *node = NULL;
 	struct guc_mmio_reg *regs = NULL;
 	int i, numlists, numregs, ret = 0;
 	enum guc_state_capture_type datatype;
@@ -1439,11 +1406,11 @@ void xe_guc_capture_process(struct xe_guc *guc)
 		__guc_capture_process_output(guc);
 }
 
-static struct __guc_capture_parsed_output *
+static struct xe_guc_capture_snapshot *
 guc_capture_alloc_one_node(struct xe_guc *guc)
 {
 	struct drm_device *drm = guc_to_drm(guc);
-	struct __guc_capture_parsed_output *new;
+	struct xe_guc_capture_snapshot *new;
 	int i;
 
 	new = drmm_kzalloc(drm, sizeof(*new), GFP_KERNEL);
@@ -1468,7 +1435,7 @@ guc_capture_alloc_one_node(struct xe_guc *guc)
 static void
 __guc_capture_create_prealloc_nodes(struct xe_guc *guc)
 {
-	struct __guc_capture_parsed_output *node = NULL;
+	struct xe_guc_capture_snapshot *node = NULL;
 	int i;
 
 	for (i = 0; i < PREALLOC_NODES_MAX_COUNT; ++i) {
@@ -1583,7 +1550,7 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
 	struct xe_devcoredump *devcoredump = &xe->devcoredump;
 	enum guc_capture_list_class_type capture_class;
 	const struct __guc_mmio_reg_descr_group *list;
-	struct __guc_capture_parsed_output *new;
+	struct xe_guc_capture_snapshot *new;
 	enum guc_state_capture_type type;
 	u16 guc_id = 0;
 	u32 lrca = 0;
@@ -1849,7 +1816,7 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
  *
  * Returns: found guc-capture node ptr else NULL
  */
-struct __guc_capture_parsed_output *
+struct xe_guc_capture_snapshot *
 xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
 {
 	struct xe_hw_engine *hwe;
@@ -1878,7 +1845,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
 	}
 
 	if (guc_class <= GUC_LAST_ENGINE_CLASS) {
-		struct __guc_capture_parsed_output *n, *ntmp;
+		struct xe_guc_capture_snapshot *n, *ntmp;
 		struct xe_guc *guc =  &q->gt->uc.guc;
 		u16 guc_id = q->guc->id;
 		u32 lrca = xe_lrc_ggtt_addr(q->lrc[0]);
@@ -1931,7 +1898,7 @@ xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
 			coredump->snapshot.hwe[id] =
 				xe_hw_engine_snapshot_capture(hwe, q);
 		} else {
-			struct __guc_capture_parsed_output *new;
+			struct xe_guc_capture_snapshot *new;
 
 			new = xe_guc_capture_get_matching_and_lock(q);
 			if (new) {
@@ -1965,7 +1932,7 @@ void xe_guc_capture_put_matched_nodes(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_devcoredump *devcoredump = &xe->devcoredump;
-	struct __guc_capture_parsed_output *n = devcoredump->snapshot.matched_node;
+	struct xe_guc_capture_snapshot *n = devcoredump->snapshot.matched_node;
 
 	if (n) {
 		guc_capture_remove_stale_matches_from_list(guc->capture, n);
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index 20a078dc4b85..046989fba3b1 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -50,7 +50,7 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc);
 const struct __guc_mmio_reg_descr_group *
 xe_guc_capture_get_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
 				 enum guc_capture_list_class_type capture_class, bool is_ext);
-struct __guc_capture_parsed_output *xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q);
+struct xe_guc_capture_snapshot *xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q);
 void xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot);
 void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
 void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h b/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
new file mode 100644
index 000000000000..a5579e69da2e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_GUC_CAPTURE_SNAPSHOT_TYPES_H
+#define _XE_GUC_CAPTURE_SNAPSHOT_TYPES_H
+
+#include <linux/types.h>
+#include <abi/guc_capture_abi.h>
+
+struct guc_mmio_reg;
+
+enum xe_guc_capture_snapshot_source {
+	XE_ENGINE_CAPTURE_SOURCE_MANUAL,
+	XE_ENGINE_CAPTURE_SOURCE_GUC
+};
+
+/*
+ * struct xe_guc_capture_snapshot - extracted error capture node
+ *
+ * A single unit of extracted error-capture output data grouped together
+ * at an engine-instance level. We keep these nodes in a linked list.
+ * See cachelist and outlist below.
+ */
+struct xe_guc_capture_snapshot {
+	/*
+	 * A single set of 3 capture lists: a global-list
+	 * an engine-class-list and an engine-instance list.
+	 * outlist in xe_guc_state_capture will keep
+	 * a linked list of these nodes that will eventually
+	 * be detached from outlist and attached into to
+	 * xe_codedump in response to a context reset
+	 */
+	struct list_head link;
+	bool is_partial;
+	u32 eng_class;
+	u32 eng_inst;
+	u32 guc_id;
+	u32 lrca;
+	u32 type;
+	bool locked;
+	enum xe_guc_capture_snapshot_source source;
+	struct gcap_reg_list_info {
+		u32 vfid;
+		u32 num_regs;
+		struct guc_mmio_reg *regs;
+	} reginfo[GUC_STATE_CAPTURE_TYPE_MAX];
+#define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_STATE_CAPTURE_TYPE_GLOBAL)
+#define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS)
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index fc447751fe78..a99e3160724b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -843,7 +843,7 @@ struct xe_hw_engine_snapshot *
 xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
 {
 	struct xe_hw_engine_snapshot *snapshot;
-	struct __guc_capture_parsed_output *node;
+	struct xe_guc_capture_snapshot *node;
 
 	if (!xe_hw_engine_is_valid(hwe))
 		return NULL;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index e4191a7a2c31..de69e2628f2f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -152,11 +152,6 @@ struct xe_hw_engine {
 	struct xe_hw_engine_group *hw_engine_group;
 };
 
-enum xe_hw_engine_snapshot_source_id {
-	XE_ENGINE_CAPTURE_SOURCE_MANUAL,
-	XE_ENGINE_CAPTURE_SOURCE_GUC
-};
-
 /**
  * struct xe_hw_engine_snapshot - Hardware engine snapshot
  *
-- 
2.34.1

