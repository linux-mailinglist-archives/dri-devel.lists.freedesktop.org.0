Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E23A2FE7C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 00:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9968C10E620;
	Mon, 10 Feb 2025 23:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sla7jzGS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2640310E404;
 Mon, 10 Feb 2025 23:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739230431; x=1770766431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rwYgG0T6DElxG6wrsTZqZ220cZ7tNTMJPTttHIyCl9c=;
 b=Sla7jzGS/2Fju6xKbK5os6LPxVAgtieFSR4d4XhMXN77tNPaLl7kuIYd
 qoRD6WuU0CtNBcId+RbTbJEYULAaixvVlrMoUTbc0nG5oLJ1/momV9sEV
 nNG4/w7tiJLfg6W2hx6YORxa5FoqoPVNDGQgXyoVBOVkFOMAYMCxONUms
 YKtF0iKU5gOuMIf6PdTbzDgsPGJaoMkckaZukO/oHlUqbyuTQbJqDL4Jq
 /C9Q/jXxyZQdz4JeQUV6wO+rXlYIrAbXJLATynlAfHQnYeFcYCLMfMboW
 SGCtngCQB7jcmFvdlSmjfO2/+6usYxX+a2hWJGSE4Y0GJMLqPB2aZ9npm A==;
X-CSE-ConnectionGUID: ruVAmBVuRxKz0r9ckJBy+w==
X-CSE-MsgGUID: qlkQGEpiTBSyWdJEUAB3nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39853928"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39853928"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 15:33:50 -0800
X-CSE-ConnectionGUID: 55KH3+ozR5i8WnRqL9BfQQ==
X-CSE-MsgGUID: NwHZdIDyRLqhI10eU1FKSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117252449"
Received: from aalteres-desk1.fm.intel.com ([10.1.39.140])
 by orviesa003.jf.intel.com with ESMTP; 10 Feb 2025 15:32:56 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v7 4/6] drm/xe/guc: Move xe_hw_engine_snapshot creation back
 to xe_hw_engine.c
Date: Mon, 10 Feb 2025 15:32:52 -0800
Message-Id: <20250210233254.419587-5-alan.previn.teres.alexis@intel.com>
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

xe_devcoredump calls xe_engine_snapshot_capture_for_queue() to allocate
and populate the xe_hw_engine_snapshot structure. Move that function
back into xe_hw_engine.c since it doesn't make sense for
GuC-Err-Capture to allocate a structure it doesn't own.

   v7: Rename function to respect "xe_hw_engine" namespace (Rodrigo)

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c |  2 +-
 drivers/gpu/drm/xe/xe_guc_capture.c | 30 -----------------------
 drivers/gpu/drm/xe/xe_guc_capture.h |  1 -
 drivers/gpu/drm/xe/xe_hw_engine.c   | 38 ++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_hw_engine.h   |  3 +--
 5 files changed, 36 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 7a4610d2ea4f..6cbb4fce8ef2 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -311,7 +311,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 		ss->job = xe_sched_job_snapshot_capture(job);
 	ss->vm = xe_vm_snapshot_capture(q->vm);
 
-	xe_engine_snapshot_capture_for_queue(q);
+	xe_hw_engine_snapshot_capture_for_queue(q);
 
 	queue_work(system_unbound_wq, &ss->work);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 76c20ff97864..ff16bed86b77 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1867,36 +1867,6 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q,
 	return NULL;
 }
 
-/**
- * xe_engine_snapshot_capture_for_queue - Take snapshot of associated engine
- * @q: The exec queue object
- *
- * Take snapshot of associated HW Engine
- *
- * Returns: None.
- */
-void
-xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
-{
-	struct xe_device *xe = gt_to_xe(q->gt);
-	struct xe_devcoredump *coredump = &xe->devcoredump;
-	struct xe_hw_engine *hwe;
-	enum xe_hw_engine_id id;
-	u32 adj_logical_mask = q->logical_mask;
-
-	if (IS_SRIOV_VF(xe))
-		return;
-
-	for_each_hw_engine(hwe, q->gt, id) {
-		if (hwe->class != q->hwe->class ||
-		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
-			coredump->snapshot.hwe[id] = NULL;
-			continue;
-		}
-		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe, q);
-	}
-}
-
 /*
  * xe_guc_capture_put_matched_nodes - Cleanup matched nodes
  * @guc: The GuC object
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index e67589ab4342..77ee35a3f205 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -56,7 +56,6 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q,
 void xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queue *q);
 void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_snapshot *node,
 				   struct drm_printer *p);
-void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
 void xe_guc_capture_steered_list_init(struct xe_guc *guc);
 void xe_guc_capture_put_matched_nodes(struct xe_guc *guc, struct xe_guc_capture_snapshot *n);
 int xe_guc_capture_init(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index c980a5c84a8b..fef01d2086a8 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -830,7 +830,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 }
 
 /**
- * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
+ * hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
  * @hwe: Xe HW Engine.
  * @q: The exec queue object.
  *
@@ -840,8 +840,8 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
  * Returns: a Xe HW Engine snapshot object that must be freed by the
  * caller, using `xe_hw_engine_snapshot_free`.
  */
-struct xe_hw_engine_snapshot *
-xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
+static struct xe_hw_engine_snapshot *
+hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
 {
 	struct xe_hw_engine_snapshot *snapshot;
 	struct xe_guc_capture_snapshot *node;
@@ -887,6 +887,36 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
 	return snapshot;
 }
 
+/**
+ * xe_hw_engine_snapshot_capture_for_queue - Take snapshot of associated engine
+ * @q: The exec queue object
+ *
+ * Take snapshot of associated HW Engine
+ *
+ * Returns: None.
+ */
+void
+xe_hw_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
+{
+	struct xe_device *xe = gt_to_xe(q->gt);
+	struct xe_devcoredump *coredump = &xe->devcoredump;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	u32 adj_logical_mask = q->logical_mask;
+
+	if (IS_SRIOV_VF(xe))
+		return;
+
+	for_each_hw_engine(hwe, q->gt, id) {
+		if (hwe->class != q->hwe->class ||
+		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
+			coredump->snapshot.hwe[id] = NULL;
+			continue;
+		}
+		coredump->snapshot.hwe[id] = hw_engine_snapshot_capture(hwe, q);
+	}
+}
+
 /**
  * xe_hw_engine_snapshot_free - Free all allocated objects for a given snapshot.
  * @snapshot: Xe HW Engine snapshot object.
@@ -945,7 +975,7 @@ void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p)
 {
 	struct xe_hw_engine_snapshot *snapshot;
 
-	snapshot = xe_hw_engine_snapshot_capture(hwe, NULL);
+	snapshot = hw_engine_snapshot_capture(hwe, NULL);
 	xe_hw_engine_snapshot_print(snapshot, p);
 	xe_hw_engine_snapshot_free(snapshot);
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 069b32aa7423..74f6ea0c8d3e 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -55,8 +55,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
 void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
 u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
 				enum xe_engine_class engine_class);
-struct xe_hw_engine_snapshot *
-xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q);
+void xe_hw_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
 void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
 void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
 void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
-- 
2.34.1

