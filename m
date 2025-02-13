Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0544A34EB0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 20:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5460310EB95;
	Thu, 13 Feb 2025 19:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mxUw58c+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618B810EB88;
 Thu, 13 Feb 2025 19:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739476301; x=1771012301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+NO0b0muPhplHkRCwarGBSbooNg18Pk8HMsQIZuiP1c=;
 b=mxUw58c+/ufDJyqP/Q0KXIv7SUCFe+xLkgGyhnpn1A4durHNRY0dsTQv
 lzOkj78Jfp/ZHbWdPtJe6eb82uCGCUkTndXqcsSB+gZ2mWls8QESRZX23
 LxNKeugSnaCHY75HBeuiUrdmiMlb3RpH1x/njU2jRmvRDjuthgix/UDtQ
 B95IkSQAnGMfbRRVhVLqqgGGOVjD/uhvsrxsD5VRLOeANdQCwIpuKSsP1
 yi79jq9HQHH3af5/BvJaGtYKn5WzGLDyE0m/4znHW56b8L1JJ2hxatJxp
 TVIjx2QSGt1dtQ8ex9FrIOLqUEd/FLQqbJALM7LJAJKiAX4XGPaQica4L A==;
X-CSE-ConnectionGUID: FS1Mm50xR/qSshac/eGGdQ==
X-CSE-MsgGUID: 9XEDGbdLRhG1dR58pdYhiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40354749"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40354749"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:51:40 -0800
X-CSE-ConnectionGUID: zYjI3UZkSb+J0r4+GtMGzQ==
X-CSE-MsgGUID: N806ZgfQTxS3p8laBX72aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117372220"
Received: from aalteres-desk1.fm.intel.com ([10.1.39.140])
 by fmviesa003.fm.intel.com with ESMTP; 13 Feb 2025 11:51:40 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v8 4/6] drm/xe/guc: Move xe_hw_engine_snapshot creation back
 to xe_hw_engine.c
Date: Thu, 13 Feb 2025 11:51:37 -0800
Message-Id: <20250213195139.3396082-5-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213195139.3396082-1-alan.previn.teres.alexis@intel.com>
References: <20250213195139.3396082-1-alan.previn.teres.alexis@intel.com>
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
Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>
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
index ac3134da3f19..c57b13afcfd9 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1870,36 +1870,6 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q,
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

