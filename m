Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D1F3D02F9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337576E581;
	Tue, 20 Jul 2021 20:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FA66E4E3;
 Tue, 20 Jul 2021 20:40:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="209421888"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="209421888"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906088"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 29/42] drm/i915/guc: Implement BB boundary preemption for
 multi-lrc
Date: Tue, 20 Jul 2021 13:57:49 -0700
Message-Id: <20210720205802.39610-30-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210720205802.39610-1-matthew.brost@intel.com>
References: <20210720205802.39610-1-matthew.brost@intel.com>
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

For some users of multi-lrc, e.g. split frame, it isn't safe to preempt
mid BB. To safely enable preemption at the BB boundary, a handshake
between to parent and child is needed. This is implemented via custom
emit_bb_start & emit_fini_breadcrumb functions and enabled via by
default if a context is configured by set parallel extension.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       |   2 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 285 +++++++++++++++++-
 4 files changed, 289 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 7395894724f8..35f5d28c7465 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -639,7 +639,7 @@ void intel_context_bind_parent_child(struct intel_context *parent,
 	GEM_BUG_ON(intel_context_is_child(child));
 	GEM_BUG_ON(intel_context_is_parent(child));
 
-        parent->guc_number_children++;
+        child->guc_child_index = parent->guc_number_children++;
         list_add_tail(&child->guc_child_link,
 		      &parent->guc_child_list);
 	child->parent = parent;
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 5912eb291bad..4886e107c1f8 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -222,6 +222,9 @@ struct intel_context {
 	/* Number of children if parent */
 	u8 guc_number_children;
 
+	/* Child index if child */
+	u8 guc_child_index;
+
 	u8 parent_page; /* if set, page num reserved for parent context */
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 820cb6b5d2d0..11d64746dbf1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -181,7 +181,7 @@ struct guc_process_desc {
 	u32 wq_status;
 	u32 engine_presence;
 	u32 priority;
-	u32 reserved[30];
+	u32 reserved[36];
 } __packed;
 
 #define CONTEXT_REGISTRATION_FLAG_KMD	BIT(0)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index dde6aab1db85..b9c43ba823b4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -11,6 +11,7 @@
 #include "gt/intel_context.h"
 #include "gt/intel_engine_pm.h"
 #include "gt/intel_engine_heartbeat.h"
+#include "gt/intel_gpu_commands.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_irq.h"
 #include "gt/intel_gt_pm.h"
@@ -460,10 +461,14 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
 
 /*
  * When using multi-lrc submission an extra page in the context state is
- * reserved for the process descriptor and work queue.
+ * reserved for the process descriptor, work queue, and preempt BB boundary
+ * handshake between the parent + childlren contexts.
  *
  * The layout of this page is below:
  * 0						guc_process_desc
+ * + sizeof(struct guc_process_desc)		child go
+ * + CACHELINE_BYTES				child join ...
+ * + CACHELINE_BYTES ...
  * ...						unused
  * PAGE_SIZE / 2				work queue start
  * ...						work queue
@@ -2166,6 +2171,30 @@ static int deregister_context(struct intel_context *ce, u32 guc_id, bool loop)
 	return __guc_action_deregister_context(guc, guc_id, loop);
 }
 
+static inline void clear_children_join_go_memory(struct intel_context *ce)
+{
+	u32 *mem = (u32 *)(__get_process_desc(ce) + 1);
+	u8 i;
+
+	for (i = 0; i < ce->guc_number_children + 1; ++i)
+		mem[i * (CACHELINE_BYTES / sizeof(u32))] = 0;
+}
+
+static inline u32 get_children_go_value(struct intel_context *ce)
+{
+	u32 *mem = (u32 *)(__get_process_desc(ce) + 1);
+
+	return mem[0];
+}
+
+static inline u32 get_children_join_value(struct intel_context *ce,
+					  u8 child_index)
+{
+	u32 *mem = (u32 *)(__get_process_desc(ce) + 1);
+
+	return mem[(child_index + 1) * (CACHELINE_BYTES / sizeof(u32))];
+}
+
 static void guc_context_policy_init(struct intel_engine_cs *engine,
 				    struct guc_lrc_desc *desc)
 {
@@ -2361,6 +2390,8 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
 			guc_context_policy_init(engine, desc);
 		}
+
+		clear_children_join_go_memory(ce);
 	}
 
 	/*
@@ -3771,6 +3802,32 @@ static const struct intel_context_ops virtual_child_context_ops = {
 	.destroy = guc_child_context_destroy,
 };
 
+/*
+ * The below override of the breadcrumbs is enabled when the user configures a
+ * context for parallel submission (multi-lrc, parent-child).
+ *
+ * The overridden breadcrumbs implements an algorithm which allows the GuC to
+ * safely preempt all the hw contexts configured for parallel submission
+ * between each BB. The contract between the i915 and GuC is if the parent
+ * context can be preempted, all the children can be preempted, and the GuC will
+ * always try to preempt the parent before the children. A handshake between the
+ * parent / children breadcrumbs ensures the i915 holds up its end of the deal
+ * creating a window to preempt between each set of BBs.
+ */
+static int emit_bb_start_parent_bb_preempt_boundary(struct i915_request *rq,
+						    u64 offset, u32 len,
+						    const unsigned int flags);
+static int emit_bb_start_child_bb_preempt_boundary(struct i915_request *rq,
+						   u64 offset, u32 len,
+						   const unsigned int flags);
+static u32 *
+emit_fini_breadcrumb_parent_bb_preempt_boundary(struct i915_request *rq,
+						u32 *cs);
+static u32 *
+emit_fini_breadcrumb_child_bb_preempt_boundary(struct i915_request *rq,
+					       u32 *cs);
+
+
 static struct intel_context *
 guc_create_parallel(struct intel_engine_cs **engines,
 		    unsigned int num_siblings,
@@ -3814,6 +3871,20 @@ guc_create_parallel(struct intel_engine_cs **engines,
 	for_each_child(parent, ce)
 		ce->ops = &virtual_child_context_ops;
 
+	parent->engine->emit_bb_start =
+		emit_bb_start_parent_bb_preempt_boundary;
+	parent->engine->emit_fini_breadcrumb =
+		emit_fini_breadcrumb_parent_bb_preempt_boundary;
+	parent->engine->emit_fini_breadcrumb_dw =
+		12 + 4 * parent->guc_number_children;
+	for_each_child(parent, ce) {
+		ce->engine->emit_bb_start =
+			emit_bb_start_child_bb_preempt_boundary;
+		ce->engine->emit_fini_breadcrumb =
+			emit_fini_breadcrumb_child_bb_preempt_boundary;
+		ce->engine->emit_fini_breadcrumb_dw = 16;
+	}
+
 	kfree(siblings);
 	return parent;
 
@@ -4174,6 +4245,205 @@ void intel_guc_submission_init_early(struct intel_guc *guc)
 	guc->submission_selected = __guc_submission_selected(guc);
 }
 
+static inline u32 get_children_go_addr(struct intel_context *ce)
+{
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+
+	return i915_ggtt_offset(ce->state) +
+		__get_process_desc_offset(ce) +
+		sizeof(struct guc_process_desc);
+}
+
+static inline u32 get_children_join_addr(struct intel_context *ce,
+					 u8 child_index)
+{
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+
+	return get_children_go_addr(ce) + (child_index + 1) * CACHELINE_BYTES;
+}
+
+#define PARENT_GO_BB			1
+#define PARENT_GO_FINI_BREADCRUMB	0
+#define CHILD_GO_BB			1
+#define CHILD_GO_FINI_BREADCRUMB	0
+static int emit_bb_start_parent_bb_preempt_boundary(struct i915_request *rq,
+						    u64 offset, u32 len,
+						    const unsigned int flags)
+{
+	struct intel_context *ce = rq->context;
+	u32 *cs;
+	u8 i;
+
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+
+	cs = intel_ring_begin(rq, 10 + 4 * ce->guc_number_children);
+	if (IS_ERR(cs))
+		return PTR_ERR(cs);
+
+	/* Wait on chidlren */
+	for (i = 0; i < ce->guc_number_children; ++i) {
+		*cs++ = (MI_SEMAPHORE_WAIT |
+			 MI_SEMAPHORE_GLOBAL_GTT |
+			 MI_SEMAPHORE_POLL |
+			 MI_SEMAPHORE_SAD_EQ_SDD);
+		*cs++ = PARENT_GO_BB;
+		*cs++ = get_children_join_addr(ce, i);
+		*cs++ = 0;
+	}
+
+	/* Turn off preemption */
+	*cs++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
+	*cs++ = MI_NOOP;
+
+	/* Tell children go */
+	cs = gen8_emit_ggtt_write(cs,
+				  CHILD_GO_BB,
+				  get_children_go_addr(ce),
+				  0);
+
+	/* Jump to batch */
+	*cs++ = MI_BATCH_BUFFER_START_GEN8 |
+		(flags & I915_DISPATCH_SECURE ? 0 : BIT(8));
+	*cs++ = lower_32_bits(offset);
+	*cs++ = upper_32_bits(offset);
+	*cs++ = MI_NOOP;
+
+	intel_ring_advance(rq, cs);
+
+	return 0;
+}
+
+static int emit_bb_start_child_bb_preempt_boundary(struct i915_request *rq,
+						   u64 offset, u32 len,
+						   const unsigned int flags)
+{
+	struct intel_context *ce = rq->context;
+	u32 *cs;
+
+	GEM_BUG_ON(!intel_context_is_child(ce));
+
+	cs = intel_ring_begin(rq, 12);
+	if (IS_ERR(cs))
+		return PTR_ERR(cs);
+
+	/* Signal parent */
+	cs = gen8_emit_ggtt_write(cs,
+				  PARENT_GO_BB,
+				  get_children_join_addr(ce->parent,
+							 ce->guc_child_index),
+				  0);
+
+	/* Wait parent on for go */
+	*cs++ = (MI_SEMAPHORE_WAIT |
+		 MI_SEMAPHORE_GLOBAL_GTT |
+		 MI_SEMAPHORE_POLL |
+		 MI_SEMAPHORE_SAD_EQ_SDD);
+	*cs++ = CHILD_GO_BB;
+	*cs++ = get_children_go_addr(ce->parent);
+	*cs++ = 0;
+
+	/* Turn off preemption */
+	*cs++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
+
+	/* Jump to batch */
+	*cs++ = MI_BATCH_BUFFER_START_GEN8 |
+		(flags & I915_DISPATCH_SECURE ? 0 : BIT(8));
+	*cs++ = lower_32_bits(offset);
+	*cs++ = upper_32_bits(offset);
+
+	intel_ring_advance(rq, cs);
+
+	return 0;
+}
+
+static u32 *
+emit_fini_breadcrumb_parent_bb_preempt_boundary(struct i915_request *rq,
+						u32 *cs)
+{
+	struct intel_context *ce = rq->context;
+	u8 i;
+
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+
+	/* Wait on children */
+	for (i = 0; i < ce->guc_number_children; ++i) {
+		*cs++ = (MI_SEMAPHORE_WAIT |
+			 MI_SEMAPHORE_GLOBAL_GTT |
+			 MI_SEMAPHORE_POLL |
+			 MI_SEMAPHORE_SAD_EQ_SDD);
+		*cs++ = PARENT_GO_FINI_BREADCRUMB;
+		*cs++ = get_children_join_addr(ce, i);
+		*cs++ = 0;
+	}
+
+	/* Turn on preemption */
+	*cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
+	*cs++ = MI_NOOP;
+
+	/* Tell children go */
+	cs = gen8_emit_ggtt_write(cs,
+				  CHILD_GO_FINI_BREADCRUMB,
+				  get_children_go_addr(ce),
+				  0);
+
+	/* Emit fini breadcrumb */
+	cs = gen8_emit_ggtt_write(cs,
+				  rq->fence.seqno,
+				  i915_request_active_timeline(rq)->hwsp_offset,
+				  0);
+
+	/* User interrupt */
+	*cs++ = MI_USER_INTERRUPT;
+	*cs++ = MI_NOOP;
+
+	rq->tail = intel_ring_offset(rq, cs);
+
+	return cs;
+}
+
+static u32 *
+emit_fini_breadcrumb_child_bb_preempt_boundary(struct i915_request *rq,
+					       u32 *cs)
+{
+	struct intel_context *ce = rq->context;
+
+	GEM_BUG_ON(!intel_context_is_child(ce));
+
+	/* Turn on preemption */
+	*cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
+	*cs++ = MI_NOOP;
+
+	/* Signal parent */
+	cs = gen8_emit_ggtt_write(cs,
+				  PARENT_GO_FINI_BREADCRUMB,
+				  get_children_join_addr(ce->parent,
+							 ce->guc_child_index),
+				  0);
+
+	/* Wait parent on for go */
+	*cs++ = (MI_SEMAPHORE_WAIT |
+		 MI_SEMAPHORE_GLOBAL_GTT |
+		 MI_SEMAPHORE_POLL |
+		 MI_SEMAPHORE_SAD_EQ_SDD);
+	*cs++ = CHILD_GO_FINI_BREADCRUMB;
+	*cs++ = get_children_go_addr(ce->parent);
+	*cs++ = 0;
+
+	/* Emit fini breadcrumb */
+	cs = gen8_emit_ggtt_write(cs,
+				  rq->fence.seqno,
+				  i915_request_active_timeline(rq)->hwsp_offset,
+				  0);
+
+	/* User interrupt */
+	*cs++ = MI_USER_INTERRUPT;
+	*cs++ = MI_NOOP;
+
+	rq->tail = intel_ring_offset(rq, cs);
+
+	return cs;
+}
+
 static inline struct intel_context *
 g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
 {
@@ -4615,6 +4885,19 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
 			drm_printf(p, "\t\tWQI Status: %u\n\n",
 				   READ_ONCE(desc->wq_status));
 
+			drm_printf(p, "\t\tNumber Children: %u\n\n",
+				   ce->guc_number_children);
+			if (ce->engine->emit_bb_start ==
+			    emit_bb_start_parent_bb_preempt_boundary) {
+				u8 i;
+
+				drm_printf(p, "\t\tChildren Go: %u\n\n",
+					   get_children_go_value(ce));
+				for (i = 0; i < ce->guc_number_children; ++i)
+					drm_printf(p, "\t\tChildren Join: %u\n",
+						   get_children_join_value(ce, i));
+			}
+
 			for_each_child(ce, child)
 				guc_log_context(p, child);
 		}
-- 
2.28.0

