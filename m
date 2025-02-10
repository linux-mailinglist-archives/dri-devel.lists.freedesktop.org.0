Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7425A2FE79
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 00:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220DD10E408;
	Mon, 10 Feb 2025 23:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cInDsZYX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD0D10E405;
 Mon, 10 Feb 2025 23:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739230431; x=1770766431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iio9ZA201izQhGOQzBKWsmRhpt6ybQXaWLgMu6vD+8c=;
 b=cInDsZYXTQzcXwQveFO0B+ILccISyusa9eX+YexS6gi+W4xFBs8a5h4Q
 Af/ptuMAc1j3CKD/JdH8/cruCNtk2pr5UMnKVjelbn7W0OPoouwCYX19h
 qVssx4nNksnfKwtQAFJzn80txdhmJRAiHMfWUMnnTwZJwPJkb3ommPoGG
 Gpp6v4DemgkmKWF8SMsHeUP2w76Zw9PFzwPM8IOpdYrE6MjCl0/XczKZx
 1z4cjOA7EANO+9t1LKj9Ma6JJEX0Q+gBLyMjsUKI8No524Cc5N9K89l4n
 tx5iiQB4Lq6p1/vXIgdeJst2fYxSpCIElXDHXL/oksDCFVmU7RezpymXK Q==;
X-CSE-ConnectionGUID: fthFdhojTi2SLBctkJYaAQ==
X-CSE-MsgGUID: QGs8Z5NORK2KdpP2wXKtKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39853926"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39853926"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 15:33:50 -0800
X-CSE-ConnectionGUID: 3qkGrmZCTWCB11eEIgR1Dg==
X-CSE-MsgGUID: FMHY44aDSESfnvcmhd+KCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117252443"
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
Subject: [PATCH v7 2/6] drm/xe/guc: Don't store capture nodes in
 xe_devcoredump_snapshot
Date: Mon, 10 Feb 2025 15:32:50 -0800
Message-Id: <20250210233254.419587-3-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210233254.419587-1-alan.previn.teres.alexis@intel.com>
References: <20250210233254.419587-1-alan.previn.teres.alexis@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GuC-Err-Capture should not be storing register snapshot
nodes directly inside of the top level xe_devcoredump_snapshot
structure that it doesn't control. Furthermore, that is
is not right from a driver subsystem layering perspective.

Instead, when a matching GuC-Err-Capture register snapshot is
available, store it into xe_hw_engine_snapshot structure.

To ensure the manual snapshot can be retrieved and released
like the firmware reported snapshot nodes, replace xe_engine_manual_capture
xe_guc_capture_snapshot_store_manual_job (which generates
and stores the manual GuC-Err-Capture register snapshot
within its internal outlist).

   v7:- Use xe_gt_dbg instead of xe_gt_warn when neither GuC-sourced nor
        manual-sourced capture node is found during xe_hw_engine printing
        because this can be valid in some code-paths such as for
        gt-reset events. (John Harrison)

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       |   3 -
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   6 -
 drivers/gpu/drm/xe/xe_guc_capture.c       | 153 ++++++++++------------
 drivers/gpu/drm/xe/xe_guc_capture.h       |   9 +-
 drivers/gpu/drm/xe/xe_guc_submit.c        |  12 +-
 drivers/gpu/drm/xe/xe_hw_engine.c         |  34 +++--
 drivers/gpu/drm/xe/xe_hw_engine_types.h   |   8 ++
 7 files changed, 104 insertions(+), 121 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 39fe485d2085..006041997550 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -149,9 +149,6 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 	xe_guc_ct_snapshot_free(ss->guc.ct);
 	ss->guc.ct = NULL;
 
-	xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
-	ss->matched_node = NULL;
-
 	xe_guc_exec_queue_snapshot_free(ss->ge);
 	ss->ge = NULL;
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index c94ce21043a8..28486ed93314 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -53,12 +53,6 @@ struct xe_devcoredump_snapshot {
 	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
 	/** @job: Snapshot of job state */
 	struct xe_sched_job_snapshot *job;
-	/**
-	 * @matched_node: The matched capture node for timedout job
-	 * this single-node tracker works because devcoredump will always only
-	 * produce one hw-engine capture per devcoredump event
-	 */
-	struct xe_guc_capture_snapshot *matched_node;
 	/** @vm: Snapshot of VM state */
 	struct xe_vm_snapshot *vm;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index e04c87739267..f118e8dd0ecb 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1532,35 +1532,18 @@ read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_gro
 	}
 }
 
-/**
- * xe_engine_manual_capture - Take a manual engine snapshot from engine.
- * @hwe: Xe HW Engine.
- * @snapshot: The engine snapshot
- *
- * Take engine snapshot from engine read.
- *
- * Returns: None
- */
-void
-xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot)
+static struct xe_guc_capture_snapshot *
+guc_capture_get_manual_snapshot(struct xe_guc *guc, struct xe_hw_engine *hwe)
 {
-	struct xe_gt *gt = hwe->gt;
-	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_guc *guc = &gt->uc.guc;
-	struct xe_devcoredump *devcoredump = &xe->devcoredump;
+	struct xe_gt *gt = guc_to_gt(guc);
 	enum guc_capture_list_class_type capture_class;
 	const struct __guc_mmio_reg_descr_group *list;
 	struct xe_guc_capture_snapshot *new;
 	enum guc_state_capture_type type;
-	u16 guc_id = 0;
-	u32 lrca = 0;
-
-	if (IS_SRIOV_VF(xe))
-		return;
 
 	new = guc_capture_get_prealloc_node(guc);
 	if (!new)
-		return;
+		return NULL;
 
 	capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
 	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
@@ -1594,26 +1577,64 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
 		}
 	}
 
-	if (devcoredump && devcoredump->captured) {
-		struct xe_guc_submit_exec_queue_snapshot *ge = devcoredump->snapshot.ge;
+	new->eng_class = xe_engine_class_to_guc_class(hwe->class);
+	new->eng_inst = hwe->instance;
 
-		if (ge) {
-			guc_id = ge->guc.id;
-			if (ge->lrc[0])
-				lrca = ge->lrc[0]->context_desc;
-		}
+	return new;
+}
+
+/**
+ * xe_guc_capture_snapshot_store_manual_job - Generate and store a manual engine register dump
+ * @guc: Target GuC for manual capture
+ * @q: Associated xe_exec_queue to simulate a manual capture on its behalf.
+ *
+ * Generate a manual GuC-Error-Capture snapshot of engine instance + engine class registers
+ * for the engine of the given exec queue. Stores this node in internal outlist for future
+ * retrieval with the ability to match up against the same queue.
+ *
+ * Returns: None
+ */
+void
+xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queue *q)
+{
+	struct xe_guc_capture_snapshot *new;
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	/* we don't support GuC-Error-Capture, including manual captures on VFs */
+	if (IS_SRIOV_VF(guc_to_xe(guc)))
+		return;
+
+	if (!q) {
+		xe_gt_warn(gt, "Manual GuC Error capture requested with invalid job\n");
+		return;
 	}
 
-	new->eng_class = xe_engine_class_to_guc_class(hwe->class);
-	new->eng_inst = hwe->instance;
-	new->guc_id = guc_id;
-	new->lrca = lrca;
+	/* Find hwe for the queue */
+	for_each_hw_engine(hwe, gt, id) {
+		if (hwe != q->hwe)
+			continue;
+		break;
+	}
+	if (hwe != q->hwe) {
+		xe_gt_warn(gt, "Manual GuC Error capture failed to find matching engine\n");
+		return;
+	}
+
+	new = guc_capture_get_manual_snapshot(guc, hwe);
+	if (!new)
+		return;
+
+	new->guc_id = q->guc->id;
+	new->lrca = xe_lrc_ggtt_addr(q->lrc[0]);
 	new->is_partial = 0;
 	new->locked = 1;
 	new->source = XE_ENGINE_CAPTURE_SOURCE_MANUAL;
 
 	guc_capture_add_node_to_outlist(guc->capture, new);
-	devcoredump->snapshot.matched_node = new;
+
+	return;
 }
 
 static struct guc_mmio_reg *
@@ -1638,20 +1659,18 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 			     u32 type, const struct __guc_mmio_reg_descr_group *list)
 {
 	struct xe_gt *gt = snapshot->hwe->gt;
-	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_guc *guc = &gt->uc.guc;
-	struct xe_devcoredump *devcoredump = &xe->devcoredump;
-	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
 	struct gcap_reg_list_info *reginfo = NULL;
 	u32 i, last_value = 0;
 	bool is_ext, low32_ready = false;
 
 	if (!list || !list->list || list->num_regs == 0)
 		return;
-	XE_WARN_ON(!devcore_snapshot->matched_node);
+
+	XE_WARN_ON(!snapshot->matched_node);
 
 	is_ext = list == guc->capture->extlists;
-	reginfo = &devcore_snapshot->matched_node->reginfo[type];
+	reginfo = &snapshot->matched_node->reginfo[type];
 
 	/*
 	 * loop through descriptor first and find the register in the node
@@ -1756,21 +1775,14 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
 	int type;
 	const struct __guc_mmio_reg_descr_group *list;
 	enum guc_capture_list_class_type capture_class;
-
 	struct xe_gt *gt;
-	struct xe_device *xe;
-	struct xe_devcoredump *devcoredump;
-	struct xe_devcoredump_snapshot *devcore_snapshot;
 
 	if (!snapshot)
 		return;
 
 	gt = snapshot->hwe->gt;
-	xe = gt_to_xe(gt);
-	devcoredump = &xe->devcoredump;
-	devcore_snapshot = &devcoredump->snapshot;
 
-	if (!devcore_snapshot->matched_node)
+	if (!snapshot->matched_node)
 		return;
 
 	xe_gt_assert(gt, snapshot->hwe);
@@ -1781,9 +1793,9 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
 		   snapshot->name ? snapshot->name : "",
 		   snapshot->logical_instance);
 	drm_printf(p, "\tCapture_source: %s\n",
-		   devcore_snapshot->matched_node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
+		   snapshot->matched_node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
 		   "GuC" : "Manual");
-	drm_printf(p, "\tCoverage: %s\n", grptype[devcore_snapshot->matched_node->is_partial]);
+	drm_printf(p, "\tCoverage: %s\n", grptype[snapshot->matched_node->is_partial]);
 	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
 		   snapshot->forcewake.domain, snapshot->forcewake.ref);
 	drm_printf(p, "\tReserved: %s\n",
@@ -1809,6 +1821,7 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
 /**
  * xe_guc_capture_get_matching_and_lock - Matching GuC capture for the queue.
  * @q: The exec queue object
+ * @srctype: if the capture-node being searched was manual or from guc
  *
  * Search within the capture outlist for the queue, could be used for check if
  * GuC capture is ready for the queue.
@@ -1817,13 +1830,13 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
  * Returns: found guc-capture node ptr else NULL
  */
 struct xe_guc_capture_snapshot *
-xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
+xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q,
+				     enum xe_guc_capture_snapshot_source srctype)
 {
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	struct xe_device *xe;
 	u16 guc_class = GUC_LAST_ENGINE_CLASS + 1;
-	struct xe_devcoredump_snapshot *ss;
 
 	if (!q || !q->gt)
 		return NULL;
@@ -1832,10 +1845,6 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
 	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
 		return NULL;
 
-	ss = &xe->devcoredump.snapshot;
-	if (ss->matched_node && ss->matched_node->source == XE_ENGINE_CAPTURE_SOURCE_GUC)
-		return ss->matched_node;
-
 	/* Find hwe for the queue */
 	for_each_hw_engine(hwe, q->gt, id) {
 		if (hwe != q->hwe)
@@ -1858,7 +1867,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
 		list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
 			if (n->eng_class == guc_class && n->eng_inst == hwe->instance &&
 			    n->guc_id == guc_id && n->lrca == lrca &&
-			    n->source == XE_ENGINE_CAPTURE_SOURCE_GUC) {
+			    n->source == srctype) {
 				n->locked = 1;
 				return n;
 			}
@@ -1893,51 +1902,23 @@ xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
 			coredump->snapshot.hwe[id] = NULL;
 			continue;
 		}
-
-		if (!coredump->snapshot.hwe[id]) {
-			coredump->snapshot.hwe[id] =
-				xe_hw_engine_snapshot_capture(hwe, q);
-		} else {
-			struct xe_guc_capture_snapshot *new;
-
-			new = xe_guc_capture_get_matching_and_lock(q);
-			if (new) {
-				struct xe_guc *guc =  &q->gt->uc.guc;
-
-				/*
-				 * If we are in here, it means we found a fresh
-				 * GuC-err-capture node for this engine after
-				 * previously failing to find a match in the
-				 * early part of guc_exec_queue_timedout_job.
-				 * Thus we must free the manually captured node
-				 */
-				guc_capture_free_outlist_node(guc->capture,
-							      coredump->snapshot.matched_node);
-				coredump->snapshot.matched_node = new;
-			}
-		}
-
-		break;
+		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe, q);
 	}
 }
 
 /*
  * xe_guc_capture_put_matched_nodes - Cleanup matched nodes
  * @guc: The GuC object
+ * @n: the capture node we want to free (along with stale reports from GuC)
  *
  * Free matched node and all nodes with the equal guc_id from
  * GuC captured outlist
  */
-void xe_guc_capture_put_matched_nodes(struct xe_guc *guc)
+void xe_guc_capture_put_matched_nodes(struct xe_guc *guc, struct xe_guc_capture_snapshot *n)
 {
-	struct xe_device *xe = guc_to_xe(guc);
-	struct xe_devcoredump *devcoredump = &xe->devcoredump;
-	struct xe_guc_capture_snapshot *n = devcoredump->snapshot.matched_node;
-
 	if (n) {
 		guc_capture_remove_stale_matches_from_list(guc->capture, n);
 		guc_capture_free_outlist_node(guc->capture, n);
-		devcoredump->snapshot.matched_node = NULL;
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index 046989fba3b1..8ac893c92f19 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 #include "abi/guc_capture_abi.h"
 #include "xe_guc.h"
+#include "xe_guc_capture_snapshot_types.h"
 #include "xe_guc_fwif.h"
 
 struct xe_exec_queue;
@@ -50,12 +51,14 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc);
 const struct __guc_mmio_reg_descr_group *
 xe_guc_capture_get_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
 				 enum guc_capture_list_class_type capture_class, bool is_ext);
-struct xe_guc_capture_snapshot *xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q);
-void xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot);
+struct xe_guc_capture_snapshot *
+xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q,
+				     enum xe_guc_capture_snapshot_source srctype);
+void xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queue *q);
 void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
 void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
 void xe_guc_capture_steered_list_init(struct xe_guc *guc);
-void xe_guc_capture_put_matched_nodes(struct xe_guc *guc);
+void xe_guc_capture_put_matched_nodes(struct xe_guc *guc, struct xe_guc_capture_snapshot *n);
 int xe_guc_capture_init(struct xe_guc *guc);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 913c74d6e2ae..6e33081dd7b8 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -28,6 +28,7 @@
 #include "xe_gt_printk.h"
 #include "xe_guc.h"
 #include "xe_guc_capture.h"
+#include "xe_guc_capture_snapshot_types.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_guc_id_mgr.h"
@@ -1070,14 +1071,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * do manual capture first and decide later if we need to use it
 	 */
 	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
-	    !xe_guc_capture_get_matching_and_lock(q)) {
+	    !xe_guc_capture_get_matching_and_lock(q, XE_ENGINE_CAPTURE_SOURCE_GUC)) {
 		/* take force wake before engine register manual capture */
 		fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
 		if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
 			xe_gt_info(q->gt, "failed to get forcewake for coredump capture\n");
-
-		xe_engine_snapshot_capture_for_queue(q);
-
+		/*
+		 * Generate a manual capture. Below function will store it
+		 * in GuC Error Capture's internal link-list as if it came from GuC
+		 * but with a source-type == XE_ENGINE_CAPTURE_SOURCE_MANUAL
+		 */
+		xe_guc_capture_snapshot_store_manual_job(guc, q);
 		xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index a99e3160724b..02871d319471 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -25,6 +25,7 @@
 #include "xe_gt_mcr.h"
 #include "xe_gt_topology.h"
 #include "xe_guc_capture.h"
+#include "xe_guc_capture_snapshot_types.h"
 #include "xe_hw_engine_group.h"
 #include "xe_hw_fence.h"
 #include "xe_irq.h"
@@ -867,22 +868,22 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
 		return snapshot;
 
 	if (q) {
-		/* If got guc capture, set source to GuC */
-		node = xe_guc_capture_get_matching_and_lock(q);
-		if (node) {
-			struct xe_device *xe = gt_to_xe(hwe->gt);
-			struct xe_devcoredump *coredump = &xe->devcoredump;
-
-			coredump->snapshot.matched_node = node;
-			xe_gt_dbg(hwe->gt, "Found and locked GuC-err-capture node");
-			return snapshot;
+		/* First, retrieve the manual GuC-Error-Capture node if it exists */
+		node = xe_guc_capture_get_matching_and_lock(q, XE_ENGINE_CAPTURE_SOURCE_MANUAL);
+		/* Find preferred node type sourced from firmware if available */
+		snapshot->matched_node = xe_guc_capture_get_matching_and_lock(q, XE_ENGINE_CAPTURE_SOURCE_GUC);
+		if (!snapshot->matched_node) {
+			xe_gt_dbg(hwe->gt, "No fw sourced GuC-Err-Capture for queue %s", q->name);
+			snapshot->matched_node = node;
+		} else if (node) {
+			xe_gt_dbg(hwe->gt, "Found manual GuC-Err-Capture for queue %s", q->name);
+			xe_guc_capture_put_matched_nodes(&hwe->gt->uc.guc, node);
 		}
+		if (!snapshot->matched_node)
+			xe_gt_dbg(hwe->gt, "Can't retrieve any GuC-Err-Capture node for queue %s",
+				  q->name);
 	}
 
-	/* otherwise, do manual capture */
-	xe_engine_manual_capture(hwe, snapshot);
-	xe_gt_dbg(hwe->gt, "Proceeding with manual engine snapshot");
-
 	return snapshot;
 }
 
@@ -900,12 +901,7 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
 		return;
 
 	gt = snapshot->hwe->gt;
-	/*
-	 * xe_guc_capture_put_matched_nodes is called here and from
-	 * xe_devcoredump_snapshot_free, to cover the 2 calling paths
-	 * of hw_engines - debugfs and devcoredump free.
-	 */
-	xe_guc_capture_put_matched_nodes(&gt->uc.guc);
+	xe_guc_capture_put_matched_nodes(&gt->uc.guc, snapshot->matched_node);
 
 	kfree(snapshot->name);
 	kfree(snapshot);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index de69e2628f2f..de1f82c11bcf 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -152,6 +152,7 @@ struct xe_hw_engine {
 	struct xe_hw_engine_group *hw_engine_group;
 };
 
+struct xe_guc_capture_snapshot;
 /**
  * struct xe_hw_engine_snapshot - Hardware engine snapshot
  *
@@ -175,6 +176,13 @@ struct xe_hw_engine_snapshot {
 	u32 mmio_base;
 	/** @kernel_reserved: Engine reserved, can't be used by userspace */
 	bool kernel_reserved;
+	/**
+	 * @matched_node: GuC Capture snapshot:
+	 * The matched capture node for the timedout job
+	 * this single-node tracker works because devcoredump will always only
+	 * produce one hw-engine capture per devcoredump event
+	 */
+	struct xe_guc_capture_snapshot *matched_node;
 };
 
 #endif
-- 
2.34.1

