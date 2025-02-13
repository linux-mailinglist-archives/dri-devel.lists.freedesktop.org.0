Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AF7A34EB1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 20:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5058310EB96;
	Thu, 13 Feb 2025 19:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S24iJQD/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A4B10EB8A;
 Thu, 13 Feb 2025 19:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739476301; x=1771012301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kh5uGgnHg7tTJNEMZkY2R9WbjLBFy6F1i/R/BcahmOo=;
 b=S24iJQD/+JHKtiLyyUavndpEZSdhlVs22aEDIV72HZ1sAkMkn5haAtDD
 HReXeUdIchOVoHdce44t+exI1XTfxFuxfF95Lew0qhbVn42XKd7xNjeZt
 IW3+c4JiH4qEn9ZT2hID48C+HtVA+fOLEB5wxwkGEmy9mJpiKfGmAxvan
 T5vK0X76JefgYgfXIpCZ+x4+bUoGxewDUZpHskLcCaYYe8VlllY7yrSiD
 L787mEl/RnwUMxlpLkNulqd8YbKV5dRP5KPzzeJ7Q1YC4Ko6fCQQsyncg
 EkDUzSfPKwuV5s/dPpDFApzUGf6hs/mRAsTBfdHMkrsL7hgPkd3Vc7chV A==;
X-CSE-ConnectionGUID: MFak7ZqVS5qdQMcc8coPEA==
X-CSE-MsgGUID: GEmXxN9aTP+UjkY/vGq7ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40354748"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40354748"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:51:40 -0800
X-CSE-ConnectionGUID: TNTpwYnUQYuxNQG30uEFhg==
X-CSE-MsgGUID: xW8ah/SJTke4tyalGP39VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117372217"
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
Subject: [PATCH v8 3/6] drm/xe/guc: Split engine state print between
 xe_hw_engine vs xe_guc_capture
Date: Thu, 13 Feb 2025 11:51:36 -0800
Message-Id: <20250213195139.3396082-4-alan.previn.teres.alexis@intel.com>
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

Relocate the xe_engine_snapshot_print function from xe_guc_capture.c
into xe_hw_engine.c but split out the GuC-Err-Capture register printing
portion out into a separate helper inside xe_guc_capture.c so that
we can have a clear separation between printing the general engine info
vs GuC-Err-Capture node's register list.

   v7: - Fix function name to respect "xe_hw_engine" name space. (Rodrigo)
       - Remove additional newline in engine dump (Jose Souza) +
         ensure changes didn't break mesa's aubinator tool (Rodrigo)

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c |  2 +-
 drivers/gpu/drm/xe/xe_guc_capture.c | 79 +++++++++++++----------------
 drivers/gpu/drm/xe/xe_guc_capture.h |  4 +-
 drivers/gpu/drm/xe/xe_hw_engine.c   | 29 ++++++++++-
 drivers/gpu/drm/xe/xe_hw_engine.h   |  1 +
 5 files changed, 67 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 006041997550..7a4610d2ea4f 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -128,7 +128,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	drm_puts(&p, "\n**** HW Engines ****\n");
 	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
 		if (ss->hwe[i])
-			xe_engine_snapshot_print(ss->hwe[i], &p);
+			xe_hw_engine_snapshot_print(ss->hwe[i], &p);
 
 	drm_puts(&p, "\n**** VM state ****\n");
 	xe_vm_snapshot_print(ss->vm, &p);
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 1f9d49f5a805..ac3134da3f19 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -917,9 +917,10 @@ guc_capture_init_node(struct xe_guc *guc, struct xe_guc_capture_snapshot *node)
  * --------------------
  *      --> xe_devcoredump_read->
  *             L--> xxx_snapshot_print
- *                    L--> xe_engine_snapshot_print
- *                         Print register lists values saved at
- *                         guc->capture->outlist
+ *                    L--> xe_hw_engine_print --> xe_hw_engine_snapshot_print
+ *                          L--> xe_guc_capture_snapshot_print
+ *                               Print register lists values saved in matching
+ *                               node from guc->capture->outlist
  *
  */
 
@@ -1658,22 +1659,16 @@ guc_capture_find_reg(struct gcap_reg_list_info *reginfo, u32 addr, u32 flags)
 }
 
 static void
-snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p,
-			     u32 type, const struct __guc_mmio_reg_descr_group *list)
+print_noderegs_by_list_order(struct xe_guc *guc, struct gcap_reg_list_info *reginfo,
+			     const struct __guc_mmio_reg_descr_group *list, struct drm_printer *p)
 {
-	struct xe_gt *gt = snapshot->hwe->gt;
-	struct xe_guc *guc = &gt->uc.guc;
-	struct gcap_reg_list_info *reginfo = NULL;
-	u32 i, last_value = 0;
+	u32 last_value, i;
 	bool is_ext, low32_ready = false;
 
 	if (!list || !list->list || list->num_regs == 0)
 		return;
 
-	XE_WARN_ON(!snapshot->matched_node);
-
 	is_ext = list == guc->capture->extlists;
-	reginfo = &snapshot->matched_node->reginfo[type];
 
 	/*
 	 * loop through descriptor first and find the register in the node
@@ -1743,8 +1738,8 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 
 				group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
 				instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, reg_desc->flags);
-				dss = xe_gt_mcr_steering_info_to_dss_id(gt, group, instance);
-
+				dss = xe_gt_mcr_steering_info_to_dss_id(guc_to_gt(guc), group,
+									instance);
 				drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname, dss, value);
 			} else {
 				drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
@@ -1763,13 +1758,18 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 }
 
 /**
- * xe_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
- * @snapshot: Xe HW Engine snapshot object.
+ * xe_guc_capture_snapshot_print - Print out a the contents of a provided Guc-Err-Capture node
+ * @guc : Target GuC for operation.
+ * @node: GuC Error Capture register dump node.
  * @p: drm_printer where it will be printed out.
  *
- * This function prints out a given Xe HW Engine snapshot object.
+ * This function prints out a register dump of a GuC-Err-Capture node that was retrieved
+ * earlier either by GuC-FW reporting or by manual capture depending on how the
+ * caller (typically xe_hw_engine_snapshot) was invoked and used.
  */
-void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
+
+void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_snapshot *node,
+				   struct drm_printer *p)
 {
 	const char *grptype[GUC_STATE_CAPTURE_GROUP_TYPE_MAX] = {
 		"full-capture",
@@ -1777,45 +1777,36 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
 	};
 	int type;
 	const struct __guc_mmio_reg_descr_group *list;
-	enum guc_capture_list_class_type capture_class;
 	struct xe_gt *gt;
 
-	if (!snapshot)
+	if (!guc)
 		return;
-
-	gt = snapshot->hwe->gt;
-
-	if (!snapshot->matched_node)
+	gt = guc_to_gt(guc);
+	if (!node) {
+		xe_gt_warn(gt, "GuC Capture printing without node!\n");
 		return;
+	}
+	if (!p) {
+		xe_gt_warn(gt, "GuC Capture printing without printer!\n");
+		return;
+	}
 
-	xe_gt_assert(gt, snapshot->hwe);
-
-	capture_class = xe_engine_class_to_guc_capture_class(snapshot->hwe->class);
-
-	drm_printf(p, "%s (physical), logical instance=%d\n",
-		   snapshot->name ? snapshot->name : "",
-		   snapshot->logical_instance);
 	drm_printf(p, "\tCapture_source: %s\n",
-		   snapshot->matched_node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
+		   node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
 		   "GuC" : "Manual");
-	drm_printf(p, "\tCoverage: %s\n", grptype[snapshot->matched_node->is_partial]);
-	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
-		   snapshot->forcewake.domain, snapshot->forcewake.ref);
-	drm_printf(p, "\tReserved: %s\n",
-		   str_yes_no(snapshot->kernel_reserved));
+	drm_printf(p, "\tCoverage: %s\n", grptype[node->is_partial]);
 
 	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
 		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
-							capture_class, false);
-		snapshot_print_by_list_order(snapshot, p, type, list);
+							node->eng_class, false);
+		print_noderegs_by_list_order(guc, &node->reginfo[type], list, p);
 	}
 
-	if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
+	if (node->eng_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
+		type = GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS;
 		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF,
-							GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
-							capture_class, true);
-		snapshot_print_by_list_order(snapshot, p, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
-					     list);
+							type, node->eng_class, true);
+		print_noderegs_by_list_order(guc, &node->reginfo[type], list, p);
 	}
 
 	drm_puts(p, "\n");
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index 8ac893c92f19..e67589ab4342 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -15,7 +15,6 @@
 struct xe_exec_queue;
 struct xe_guc;
 struct xe_hw_engine;
-struct xe_hw_engine_snapshot;
 
 static inline enum guc_capture_list_class_type xe_guc_class_to_capture_class(u16 class)
 {
@@ -55,7 +54,8 @@ struct xe_guc_capture_snapshot *
 xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q,
 				     enum xe_guc_capture_snapshot_source srctype);
 void xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queue *q);
-void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
+void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_snapshot *node,
+				   struct drm_printer *p);
 void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
 void xe_guc_capture_steered_list_init(struct xe_guc *guc);
 void xe_guc_capture_put_matched_nodes(struct xe_guc *guc, struct xe_guc_capture_snapshot *n);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 02871d319471..c980a5c84a8b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -907,6 +907,33 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
 	kfree(snapshot);
 }
 
+/**
+ * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
+ * @snapshot: Xe HW Engine snapshot object.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function prints out a given Xe HW Engine snapshot object.
+ */
+void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
+{
+	struct xe_gt *gt;
+
+	if (!snapshot)
+		return;
+
+	gt = snapshot->hwe->gt;
+
+	drm_printf(p, "%s (physical), logical instance=%d\n",
+		   snapshot->name ? snapshot->name : "",
+		   snapshot->logical_instance);
+	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
+		   snapshot->forcewake.domain, snapshot->forcewake.ref);
+	drm_printf(p, "\tReserved: %s\n",
+		   str_yes_no(snapshot->kernel_reserved));
+
+	xe_guc_capture_snapshot_print(&gt->uc.guc, snapshot->matched_node, p);
+}
+
 /**
  * xe_hw_engine_print - Xe HW Engine Print.
  * @hwe: Hardware Engine.
@@ -919,7 +946,7 @@ void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p)
 	struct xe_hw_engine_snapshot *snapshot;
 
 	snapshot = xe_hw_engine_snapshot_capture(hwe, NULL);
-	xe_engine_snapshot_print(snapshot, p);
+	xe_hw_engine_snapshot_print(snapshot, p);
 	xe_hw_engine_snapshot_free(snapshot);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 6b5f9fa2a594..069b32aa7423 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -58,6 +58,7 @@ u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
 struct xe_hw_engine_snapshot *
 xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q);
 void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
+void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
 void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
 void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
 
-- 
2.34.1

