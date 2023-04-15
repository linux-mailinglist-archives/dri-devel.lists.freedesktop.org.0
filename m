Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF816E2DE6
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 02:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF9510E1F3;
	Sat, 15 Apr 2023 00:27:29 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E19410E1CF;
 Sat, 15 Apr 2023 00:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681518446; x=1713054446;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5u3r4vjy2sdD+B5g977vV2X0y+c41FWwCIWeFiGn8Qc=;
 b=ZnP9EGpQdmPfAizTWGsudq9TGRUBIfYJBJI17MStAtZ43vulY9ku4YkU
 aHccziEvOyywsCKhxdCJeHg5LSYgOtatYoZUmQhhX8qR0SQ3WM/tXRrNV
 qpAf5fYDfv+05JYEBMJrOK4zcWNm6DWF7PyvxXpAaSTMyCvafhDzPb2qp
 +Magcl5yeZTYd0BU05yC2poF8jtw0pSh790bE+PJE5x3DRA3FNFJIkWOn
 8WONxmaeZkxvocrCzfmbxApcvsM03RnOHyUhUHEUPUJo0Idx7FHEdP4r2
 VIev7ebRSZ8v2wzlWoF//bBbMOuTyOCwT8LznRnEUT00EkhzTmWM/3m4Z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="328754789"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="328754789"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 17:27:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="754632438"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="754632438"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga008.fm.intel.com with ESMTP; 14 Apr 2023 17:27:24 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Fix error capture for virtual engines
Date: Fri, 14 Apr 2023 17:27:10 -0700
Message-Id: <20230415002710.3971019-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

GuC based register dumps in error capture logs were basically broken
for virtual engines. This can be seen in igt@gem_exec_balancer@hang:
  [IGT] gem_exec_balancer: starting subtest hang
  [drm] GPU HANG: ecode 12:4:e1524110, in gem_exec_balanc [6388]
  [drm] GT0: GUC: No register capture node found for 0x1005 / 0xFEDC311D
  [drm] GPU HANG: ecode 12:4:00000000, in gem_exec_balanc [6388]
  [IGT] gem_exec_balancer: exiting, ret=0

The test causes a hang on both engines of a virtual engine context.
The engine instance zero hang gets a valid error capture but the
non-instance-zero hang does not.

Fix that by scanning through the list of pending register captures
when a hang notification for a virtual engine is received. That way,
the hang can be assigned to the correct physical engine prior to
starting the error capture process. So later on, when the error capture
handler tries to find the engine register list, it looks for one on
the correct engine.

Also, sneak in a missing blank line before a comment in the node
search code.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 31 ++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_capture.h    |  3 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 32 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_gpu_error.c         | 11 +++++--
 4 files changed, 70 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index cf49188db6a6e..fc6964abb517e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -1593,6 +1593,36 @@ void intel_guc_capture_free_node(struct intel_engine_coredump *ee)
 	ee->guc_capture_node = NULL;
 }
 
+bool intel_guc_capture_is_matching_engine(struct intel_gt *gt,
+					  struct intel_context *ce,
+					  struct intel_engine_cs *engine)
+{
+	struct __guc_capture_parsed_output *n;
+	struct intel_guc *guc;
+
+	if (!gt || !ce || !engine)
+		return false;
+
+	guc = &gt->uc.guc;
+	if (!guc->capture)
+		return false;
+
+	/*
+	 * Look for a matching GuC reported error capture node from
+	 * the internal output link-list based on lrca, guc-id and engine
+	 * identification.
+	 */
+	list_for_each_entry(n, &guc->capture->outlist, link) {
+		if (n->eng_inst == GUC_ID_TO_ENGINE_INSTANCE(engine->guc_id) &&
+		    n->eng_class == GUC_ID_TO_ENGINE_CLASS(engine->guc_id) &&
+		    n->guc_id == ce->guc_id.id &&
+		    (n->lrca & CTX_GTT_ADDRESS_MASK) == (ce->lrc.lrca & CTX_GTT_ADDRESS_MASK))
+			return true;
+	}
+
+	return false;
+}
+
 void intel_guc_capture_get_matching_node(struct intel_gt *gt,
 					 struct intel_engine_coredump *ee,
 					 struct intel_context *ce)
@@ -1608,6 +1638,7 @@ void intel_guc_capture_get_matching_node(struct intel_gt *gt,
 		return;
 
 	GEM_BUG_ON(ee->guc_capture_node);
+
 	/*
 	 * Look for a matching GuC reported error capture node from
 	 * the internal output link-list based on lrca, guc-id and engine
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h
index fbd3713c7832d..302256d45431d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h
@@ -11,6 +11,7 @@
 struct drm_i915_error_state_buf;
 struct guc_gt_system_info;
 struct intel_engine_coredump;
+struct intel_engine_cs;
 struct intel_context;
 struct intel_gt;
 struct intel_guc;
@@ -20,6 +21,8 @@ int intel_guc_capture_print_engine_node(struct drm_i915_error_state_buf *m,
 					const struct intel_engine_coredump *ee);
 void intel_guc_capture_get_matching_node(struct intel_gt *gt, struct intel_engine_coredump *ee,
 					 struct intel_context *ce);
+bool intel_guc_capture_is_matching_engine(struct intel_gt *gt, struct intel_context *ce,
+					  struct intel_engine_cs *engine);
 void intel_guc_capture_process(struct intel_guc *guc);
 int intel_guc_capture_getlist(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
 			      void **outptr);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 88e881b100cf0..86096ffde2190 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4697,13 +4697,37 @@ static void capture_error_state(struct intel_guc *guc,
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct drm_i915_private *i915 = gt->i915;
-	struct intel_engine_cs *engine = __context_to_physical_engine(ce);
 	intel_wakeref_t wakeref;
+	intel_engine_mask_t engine_mask;
+
+	if (intel_engine_is_virtual(ce->engine)) {
+		struct intel_engine_cs *e;
+		intel_engine_mask_t tmp, virtual_mask = ce->engine->mask;
+
+		engine_mask = 0;
+		for_each_engine_masked(e, ce->engine->gt, virtual_mask, tmp) {
+			bool match = intel_guc_capture_is_matching_engine(gt, ce, e);
+
+			if (match) {
+				intel_engine_set_hung_context(e, ce);
+				engine_mask |= e->mask;
+				atomic_inc(&i915->gpu_error.reset_engine_count[e->uabi_class]);
+			}
+		}
+
+		if (!engine_mask) {
+			guc_warn(guc, "No matching physical engine capture for virtual engine context 0x%04X / %s",
+				 ce->guc_id.id, ce->engine->name);
+			engine_mask = ~0U;
+		}
+	} else {
+		intel_engine_set_hung_context(ce->engine, ce);
+		engine_mask = ce->engine->mask;
+		atomic_inc(&i915->gpu_error.reset_engine_count[ce->engine->uabi_class]);
+	}
 
-	intel_engine_set_hung_context(engine, ce);
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
-		i915_capture_error_state(gt, engine->mask, CORE_DUMP_FLAG_IS_GUC_CAPTURE);
-	atomic_inc(&i915->gpu_error.reset_engine_count[engine->uabi_class]);
+		i915_capture_error_state(gt, engine_mask, CORE_DUMP_FLAG_IS_GUC_CAPTURE);
 }
 
 static void guc_context_replay(struct intel_context *ce)
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index f020c0086fbcd..f879ed70c256d 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -808,10 +808,15 @@ static void err_print_gt_engines(struct drm_i915_error_state_buf *m,
 	for (ee = gt->engine; ee; ee = ee->next) {
 		const struct i915_vma_coredump *vma;
 
-		if (ee->guc_capture_node)
-			intel_guc_capture_print_engine_node(m, ee);
-		else
+		if (gt->uc->guc.is_guc_capture) {
+			if (ee->guc_capture_node)
+				intel_guc_capture_print_engine_node(m, ee);
+			else
+				err_printf(m, "  Missing GuC capture node for %s\n",
+					   ee->engine->name);
+		} else {
 			error_print_engine(m, ee);
+		}
 
 		err_printf(m, "  hung: %u\n", ee->hung);
 		err_printf(m, "  engine reset count: %u\n", ee->reset_count);
-- 
2.39.1

