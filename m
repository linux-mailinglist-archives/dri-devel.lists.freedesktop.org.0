Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCA36F1E59
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 20:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A95310EDAF;
	Fri, 28 Apr 2023 18:56:36 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFF110E16A;
 Fri, 28 Apr 2023 18:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682708192; x=1714244192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bqdgVLq7G2DwNNP1QAv/k6HtKAaaHuD3QOhl8p+gxZQ=;
 b=bv92VbPY0kSGjG86Qgu1LeV3TkdporWbEem5vwjI6gwEYkGQWrbhXnBb
 V9rLs5QWYL5YQpK/WG+PxAaVQtdRYacyRJUMzjHg1H1S+ys6GtIJYP4nt
 CEFw7iUTBuMDpAuuIdpJBnfG8+YRbyiBUvgsTl6Q33gmvMvc0jckbo7IK
 O2jRTcW1+s9YFvWVvLd3JSl0L6OOKhG3FgVzomgv9qS5iM/n3ZStz8Ddu
 GkAbODkMODybx/Hs3l9DsUySYv4b/1qlJET75+aTF07tXBuXbLltoAKt3
 TTfxYYUUgnmBnlkj40dALdbvHEnkoIPVZn7Yk2ZysWGNnxGKw3rLILG71 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="410934519"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="410934519"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 11:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="869291590"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="869291590"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga005.jf.intel.com with ESMTP; 28 Apr 2023 11:56:30 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 4/4] drm/i915/guc: Fix error capture for virtual engines
Date: Fri, 28 Apr 2023 11:56:36 -0700
Message-Id: <20230428185636.457407-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230428185636.457407-1-John.C.Harrison@Intel.com>
References: <20230428185636.457407-1-John.C.Harrison@Intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
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

v2: Fix null pointer deref on non-GuC platforms.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 31 ++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_capture.h    |  3 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 32 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_gpu_error.c         | 11 +++++--
 4 files changed, 70 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 729a8fcf20dda..1def0b6467c79 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -1540,6 +1540,36 @@ void intel_guc_capture_free_node(struct intel_engine_coredump *ee)
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
@@ -1555,6 +1585,7 @@ void intel_guc_capture_get_matching_node(struct intel_gt *gt,
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
index ee3e8352637f2..b93fe27b4eaae 100644
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
index f020c0086fbcd..7360046b99455 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -808,10 +808,15 @@ static void err_print_gt_engines(struct drm_i915_error_state_buf *m,
 	for (ee = gt->engine; ee; ee = ee->next) {
 		const struct i915_vma_coredump *vma;
 
-		if (ee->guc_capture_node)
-			intel_guc_capture_print_engine_node(m, ee);
-		else
+		if (gt->uc && gt->uc->guc.is_guc_capture) {
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

