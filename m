Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFB7A2FE7A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 00:33:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31D410E61C;
	Mon, 10 Feb 2025 23:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aaMdhTO8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0A510E403;
 Mon, 10 Feb 2025 23:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739230431; x=1770766431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2RumWdHn/8GZD+qSh8dyC/k/It/2PQQP7D5g/a0WJTI=;
 b=aaMdhTO8xbWyjFjAZVzlYMBxptYRA9zAYRzsEfnnlu394QP4kYr9b3eH
 BGNi5+vGK5nURVOgMH6kceAqqPU8S0u8FBAjcyW69LSGdtI87gpMVir3f
 s5DMSBjXyHepIS1wFEvkVQx9vo5OqQM7lwUfD+bWARQsHSWYstIXf5Clc
 tnIG3LsahpHePYjnS7YkWq7aYqLVbuEz3IcViLmf+qQ1UkoFW0dc50G1u
 mqjHh6qEdq54VievZ4LJ74KRxhOTTnL1r2ucyLmB9layNcnxd24/Ljxbu
 heHNmPmbE0EUH41fyRpOyhHhrmFH1O23qz8PVnb4bW2ujke5ejDgYDZPV w==;
X-CSE-ConnectionGUID: wWGIjgbcTki1f05VgpWXbQ==
X-CSE-MsgGUID: emxMTfYxTbOwukKCZ0T3cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39853929"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39853929"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 15:33:50 -0800
X-CSE-ConnectionGUID: 99w9tKPbTAydfs7UDvJYjA==
X-CSE-MsgGUID: GypkhfeYSFGjhoqX/sVVnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117252451"
Received: from aalteres-desk1.fm.intel.com ([10.1.39.140])
 by orviesa003.jf.intel.com with ESMTP; 10 Feb 2025 15:32:57 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v7 5/6] drm/xe/xe_hw_engine: Update xe_hw_engine capture for
 debugfs/gt_reset
Date: Mon, 10 Feb 2025 15:32:53 -0800
Message-Id: <20250210233254.419587-6-alan.previn.teres.alexis@intel.com>
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

xe_hw_engine_print is called by debugfs to do an immediate raw
dump of the engine registers. It depends on hw_engine_snapshot_capture
that assumes a prior capture with a matching job is ready for printing.
However, for the debugfs case, there is no prior job so ensure
hw_engine_snapshot_capture can also invoke GuC-Err-Capture for
an immediate jobless snapshot.

Additionally, because there are valid cases where raw-jobless
register dumps + printings are done such as gt-reset events,
let's differentiate manual captures that were attached to a
job vs late manual raw captures that are jobless.

   v7:- Fix mismatch func name vs comment (kernel robot)
      - Differentiate between early manual captures that have a
        job association vs raw manual captures that may not have
        a job association like in gt-reset events. (John Harrison).

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c           | 37 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_capture.h           |  2 +
 .../drm/xe/xe_guc_capture_snapshot_types.h    |  6 ++-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             | 17 +++++++--
 5 files changed, 55 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index ff16bed86b77..746d3b21b18b 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1584,6 +1584,32 @@ guc_capture_get_manual_snapshot(struct xe_guc *guc, struct xe_hw_engine *hwe)
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
@@ -1631,7 +1657,7 @@ xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queu
 	new->lrca = xe_lrc_ggtt_addr(q->lrc[0]);
 	new->is_partial = 0;
 	new->locked = 1;
-	new->source = XE_ENGINE_CAPTURE_SOURCE_MANUAL;
+	new->source = XE_ENGINE_CAPTURE_SOURCE_MANUAL_JOB;
 
 	guc_capture_add_node_to_outlist(guc->capture, new);
 
@@ -1772,6 +1798,11 @@ void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_sna
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
@@ -1788,9 +1819,7 @@ void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_sna
 		return;
 	}
 
-	drm_printf(p, "\tCapture_source: %s\n",
-		   node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
-		   "GuC" : "Manual");
+	drm_printf(p, "\tCapture_source: %s\n", srctype[node->source]);
 	drm_printf(p, "\tCoverage: %s\n", grptype[node->is_partial]);
 
 	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index 77ee35a3f205..5df4b5579d2b 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -54,6 +54,8 @@ struct xe_guc_capture_snapshot *
 xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q,
 				     enum xe_guc_capture_snapshot_source srctype);
 void xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queue *q);
+struct xe_guc_capture_snapshot *
+xe_guc_capture_snapshot_manual_hwe(struct xe_guc *guc, struct xe_hw_engine *hwe);
 void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_snapshot *node,
 				   struct drm_printer *p);
 void xe_guc_capture_steered_list_init(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h b/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
index a5579e69da2e..43f1cf046732 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
@@ -12,7 +12,11 @@
 struct guc_mmio_reg;
 
 enum xe_guc_capture_snapshot_source {
-	XE_ENGINE_CAPTURE_SOURCE_MANUAL,
+	/* KMD captured engine registers when job timeout is detected */
+	XE_ENGINE_CAPTURE_SOURCE_MANUAL_JOB,
+	/* KMD captured raw engine registers without any job association */
+	XE_ENGINE_CAPTURE_SOURCE_MANUAL_RAW,
+	/* GUC-FW captured engine registers before workload was killed */
 	XE_ENGINE_CAPTURE_SOURCE_GUC
 };
 
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

