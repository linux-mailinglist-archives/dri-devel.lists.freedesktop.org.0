Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E1DA34EAC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 20:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D08C10EB8D;
	Thu, 13 Feb 2025 19:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UhXJPiHG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EDF10EB8B;
 Thu, 13 Feb 2025 19:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739476301; x=1771012301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NaNHoDYf+et9DXLM7xLDnK5Agqg5rqH2SPnPKVPC1qo=;
 b=UhXJPiHGL9W4kdrIyeST+xeKtMwMcAI6naG0eWqcOSEfzIPGiuXvG8vI
 ZvPS6Es/OIw7o9+zDNEERfQyjKEaC4GJBIL4Cu7AakGWrKXPefNQkWZTY
 mFIqncNqbbj87t7dw3eY60hRCAmH8LlAev6IiLQAZv1ekdGDUuVe9uiiS
 v6+k7EkGatr4mBiO5i5y1SXLsGgnNytEdIQS1kDsgkc/OEKz3VHdMMR3h
 G+BoMvpraKMfLdSGetjyixeROuZUfM18eCl3vu3DgwIeIWEx+r49Dpj5i
 hoVICTs9l96hr6JXsxseKe3QEaXsjlZXfR2r/38Mzv9VgY8upVvQfy6K/ g==;
X-CSE-ConnectionGUID: ym33JccOQSi64Yfg/1ex7A==
X-CSE-MsgGUID: HmJgfnaWRQG5gKEuMvZyWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40354750"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40354750"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:51:41 -0800
X-CSE-ConnectionGUID: LCDlmrxuQ96sUgLN/uNKXw==
X-CSE-MsgGUID: k5fTFdJRS4uK4t5yop9YLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117372224"
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
Subject: [PATCH v8 5/6] drm/xe/xe_hw_engine: Update xe_hw_engine capture for
 debugfs/gt_reset
Date: Thu, 13 Feb 2025 11:51:38 -0800
Message-Id: <20250213195139.3396082-6-alan.previn.teres.alexis@intel.com>
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

The xe_hw_engine_print function is called indirectly debugfs
or gt-resets to do an immediate raw dump of the engine registers.
That function relies on the function 'hw_engine_snapshot_capture'
which in turn assumes a prior capture (guc or manual) with a
matching job is ready for printing.

However, for the debugfs or gt-reset cases, there is no prior job
so ensure hw_engine_snapshot_capture can also invoke GuC-Err-Capture
for an immediate jobless snapshot.

Additionally, because these jobless events have very different
use-case events and callstack flows let's differentiate manual
captures that were attached to a job vs late, raw jobless ones.

   v8:- Rename the enum xe_guc_capture_snapshot_source to
        xe_engine_capture_source to match the defines
        (Matthew Brost/John Harrison).
      - Minor patch header comment improvement. (Alan Previn)
   v7:- Fix mismatch func name vs comment (kernel robot)
      - Differentiate between early manual captures that have a
        job association vs raw manual captures that may not have
        a job association like in gt-reset events. (John Harrison).

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c           | 39 ++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_capture.h           |  4 +-
 .../drm/xe/xe_guc_capture_snapshot_types.h    | 10 +++--
 drivers/gpu/drm/xe/xe_guc_submit.c            |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             | 17 ++++++--
 5 files changed, 59 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index c57b13afcfd9..4ab71dfa7a20 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1587,6 +1587,32 @@ guc_capture_get_manual_snapshot(struct xe_guc *guc, struct xe_hw_engine *hwe)
 	return new;
 }
 
+/**
+ * xe_guc_capture_snapshot_manual_hwe - Generate and get manual engine register dump
+ * @guc: Target GuC for manual capture
+ * @hwe: The engine instance to capture from
+ *
+ * Generate a manual GuC-Error-Capture snapshot of engine instance + engine class registers
+ * without any queue association. This capture node is not stored in outlist or cachelist,
+ * Returns: New capture node and caller must "put"
+ */
+struct xe_guc_capture_snapshot *
+xe_guc_capture_snapshot_manual_hwe(struct xe_guc *guc, struct xe_hw_engine *hwe)
+{
+	struct xe_guc_capture_snapshot *new;
+
+	new = guc_capture_get_manual_snapshot(guc, hwe);
+	if (!new)
+		return NULL;
+
+	new->guc_id = 0;
+	new->lrca = 0;
+	new->is_partial = 0;
+	new->source = XE_ENGINE_CAPTURE_SOURCE_MANUAL_RAW;
+
+	return new;
+}
+
 /**
  * xe_guc_capture_snapshot_store_manual_job - Generate and store a manual engine register dump
  * @guc: Target GuC for manual capture
@@ -1634,7 +1660,7 @@ xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queu
 	new->lrca = xe_lrc_ggtt_addr(q->lrc[0]);
 	new->is_partial = 0;
 	new->locked = 1;
-	new->source = XE_ENGINE_CAPTURE_SOURCE_MANUAL;
+	new->source = XE_ENGINE_CAPTURE_SOURCE_MANUAL_JOB;
 
 	guc_capture_add_node_to_outlist(guc->capture, new);
 
@@ -1775,6 +1801,11 @@ void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_sna
 		"full-capture",
 		"partial-capture"
 	};
+	const char *srctype[XE_ENGINE_CAPTURE_SOURCE_GUC + 1] = {
+		"Manual-Job",
+		"Manual-Raw",
+		"GuC"
+	};
 	int type;
 	const struct __guc_mmio_reg_descr_group *list;
 	struct xe_gt *gt;
@@ -1791,9 +1822,7 @@ void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_sna
 		return;
 	}
 
-	drm_printf(p, "\tCapture_source: %s\n",
-		   node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
-		   "GuC" : "Manual");
+	drm_printf(p, "\tCapture_source: %s\n", srctype[node->source]);
 	drm_printf(p, "\tCoverage: %s\n", grptype[node->is_partial]);
 
 	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
@@ -1825,7 +1854,7 @@ void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_sna
  */
 struct xe_guc_capture_snapshot *
 xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q,
-				     enum xe_guc_capture_snapshot_source srctype)
+				     enum xe_engine_capture_source srctype)
 {
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index 77ee35a3f205..ef7b9bace4ac 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -52,8 +52,10 @@ xe_guc_capture_get_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
 				 enum guc_capture_list_class_type capture_class, bool is_ext);
 struct xe_guc_capture_snapshot *
 xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q,
-				     enum xe_guc_capture_snapshot_source srctype);
+				     enum xe_engine_capture_source srctype);
 void xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queue *q);
+struct xe_guc_capture_snapshot *
+xe_guc_capture_snapshot_manual_hwe(struct xe_guc *guc, struct xe_hw_engine *hwe);
 void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_snapshot *node,
 				   struct drm_printer *p);
 void xe_guc_capture_steered_list_init(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h b/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
index a5579e69da2e..422470aa25a1 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
@@ -11,8 +11,12 @@
 
 struct guc_mmio_reg;
 
-enum xe_guc_capture_snapshot_source {
-	XE_ENGINE_CAPTURE_SOURCE_MANUAL,
+enum xe_engine_capture_source {
+	/* KMD captured engine registers when job timeout is detected */
+	XE_ENGINE_CAPTURE_SOURCE_MANUAL_JOB,
+	/* KMD captured raw engine registers without any job association */
+	XE_ENGINE_CAPTURE_SOURCE_MANUAL_RAW,
+	/* GUC-FW captured engine registers before workload was killed */
 	XE_ENGINE_CAPTURE_SOURCE_GUC
 };
 
@@ -40,7 +44,7 @@ struct xe_guc_capture_snapshot {
 	u32 lrca;
 	u32 type;
 	bool locked;
-	enum xe_guc_capture_snapshot_source source;
+	enum xe_engine_capture_source source;
 	struct gcap_reg_list_info {
 		u32 vfid;
 		u32 num_regs;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 6e33081dd7b8..4d7530e8bf63 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1079,7 +1079,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		/*
 		 * Generate a manual capture. Below function will store it
 		 * in GuC Error Capture's internal link-list as if it came from GuC
-		 * but with a source-type == XE_ENGINE_CAPTURE_SOURCE_MANUAL
+		 * but with a source-type == XE_ENGINE_CAPTURE_SOURCE_MANUAL_JOB
 		 */
 		xe_guc_capture_snapshot_store_manual_job(guc, q);
 		xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index fef01d2086a8..d0ed0639ae08 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -832,7 +832,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 /**
  * hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
  * @hwe: Xe HW Engine.
- * @q: The exec queue object.
+ * @q: The exec queue object. (can be NULL for debugfs engine-register dump)
  *
  * This can be printed out in a later stage like during dev_coredump
  * analysis.
@@ -845,9 +845,11 @@ hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
 {
 	struct xe_hw_engine_snapshot *snapshot;
 	struct xe_guc_capture_snapshot *node;
+	struct xe_guc *guc;
 
 	if (!xe_hw_engine_is_valid(hwe))
 		return NULL;
+	guc = &hwe->gt->uc.guc;
 
 	snapshot = kzalloc(sizeof(*snapshot), GFP_ATOMIC);
 
@@ -869,7 +871,7 @@ hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
 
 	if (q) {
 		/* First, retrieve the manual GuC-Error-Capture node if it exists */
-		node = xe_guc_capture_get_matching_and_lock(q, XE_ENGINE_CAPTURE_SOURCE_MANUAL);
+		node = xe_guc_capture_get_matching_and_lock(q, XE_ENGINE_CAPTURE_SOURCE_MANUAL_JOB);
 		/* Find preferred node type sourced from firmware if available */
 		snapshot->matched_node = xe_guc_capture_get_matching_and_lock(q, XE_ENGINE_CAPTURE_SOURCE_GUC);
 		if (!snapshot->matched_node) {
@@ -877,13 +879,22 @@ hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
 			snapshot->matched_node = node;
 		} else if (node) {
 			xe_gt_dbg(hwe->gt, "Found manual GuC-Err-Capture for queue %s", q->name);
-			xe_guc_capture_put_matched_nodes(&hwe->gt->uc.guc, node);
+			xe_guc_capture_put_matched_nodes(guc, node);
 		}
 		if (!snapshot->matched_node)
 			xe_gt_dbg(hwe->gt, "Can't retrieve any GuC-Err-Capture node for queue %s",
 				  q->name);
 	}
 
+	if (!snapshot->matched_node) {
+		/*
+		 * Fallback path - do an immediate jobless manual engine capture.
+		 * This will happen when debugfs is triggered to force an engine dump.
+		 */
+		snapshot->matched_node = xe_guc_capture_snapshot_manual_hwe(guc, hwe);
+		xe_gt_dbg(hwe->gt, "Fallback to jobless-manual-err-capture node");
+	}
+
 	return snapshot;
 }
 
-- 
2.34.1

