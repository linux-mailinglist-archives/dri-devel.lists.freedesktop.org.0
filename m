Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D83A211B6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 19:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC42010E6F3;
	Tue, 28 Jan 2025 18:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I74C9Zmc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7F810E1F1;
 Tue, 28 Jan 2025 18:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738089415; x=1769625415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yhn/9tJOw4/MTY4GQRUh3xQiROIKlsFe2euEiB6XpXA=;
 b=I74C9Zmcbk5ndihEQfrgb7Dm9bi1GBhVNb3Z23NrR2kpqKlzLAb+QX/I
 +egBH/W5reXkE4fxB7WRFUsyNbaUxeUGsY86aUGIoz53thz8tbiNZmW6N
 5siY8dOyN/0NvGnd/SmAIgCd/sTuj68YHCjQ/O7qrhYmDcmn9OPM69Uzj
 7hs5yAQ869WSgV2EIBEgosAsIgBPxhVWUEKgAyX4FFeQUnLRwAJRvDI9G
 y3XR8h/7Xhi4+C3TE2GEOWUtNZ3lQM7sYQSqfbFvrkc63/1bgNvwVrrJy
 Rc7mDBpGsyhvf2F2c/xYf41i6jJdqmtAFHL6ftXLyenMulXZqH+W6OfhT Q==;
X-CSE-ConnectionGUID: hxWEQpCvQiKE24S6tRPzSA==
X-CSE-MsgGUID: VkmvrAsjSfC494/t7ZihYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38288841"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38288841"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 10:36:55 -0800
X-CSE-ConnectionGUID: J6wBXs6hTriP377fTL8BKQ==
X-CSE-MsgGUID: dsDQdyMrSnizYsef6Bv9UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109735320"
Received: from aalteres-desk1.fm.intel.com ([10.1.39.140])
 by orviesa008.jf.intel.com with ESMTP; 28 Jan 2025 10:36:55 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v6 5/6] drm/xe/xe_hw_engine: Update hw_engine_snapshot_capture
 for debugfs
Date: Tue, 28 Jan 2025 10:36:51 -0800
Message-Id: <20250128183653.4027915-6-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128183653.4027915-1-alan.previn.teres.alexis@intel.com>
References: <20250128183653.4027915-1-alan.previn.teres.alexis@intel.com>
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

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h |  2 ++
 drivers/gpu/drm/xe/xe_hw_engine.c   | 15 +++++++++++++--
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 6f40aad7e212..92ea8cb681bb 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1583,6 +1583,32 @@ guc_capture_get_manual_snapshot(struct xe_guc *guc, struct xe_hw_engine *hwe)
 	return new;
 }
 
+/**
+ * xe_guc_capture_snapshot_store_and_get_manual_hwe - Generate and get manual engine register dump
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
+	new->source = XE_ENGINE_CAPTURE_SOURCE_MANUAL;
+
+	return new;
+}
+
 /**
  * xe_guc_capture_snapshot_store_manual_job - Generate and store a manual engine register dump
  * @guc: Target GuC for manual capture
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
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 40c1f9814177..94a1d5dd2030 100644
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
 
@@ -876,12 +878,21 @@ hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
 			xe_gt_dbg(hwe->gt, "No fw sourced GuC-Err-Capture for queue %s", q->name);
 			snapshot->matched_node = node;
 		} else if (node) {
-			xe_guc_capture_put_matched_nodes(&hwe->gt->uc.guc, node);
+			xe_guc_capture_put_matched_nodes(guc, node);
 		}
 		if (!snapshot->matched_node)
 			xe_gt_warn(hwe->gt, "Can't retrieve any GuC-Err-Capture node");
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

