Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E37542E05F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 19:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059566E888;
	Thu, 14 Oct 2021 17:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F2F6E1B7;
 Thu, 14 Oct 2021 17:47:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="291231644"
X-IronPort-AV: E=Sophos;i="5.85,373,1624345200"; d="scan'208";a="291231644"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 10:25:04 -0700
X-IronPort-AV: E=Sophos;i="5.85,373,1624345200"; d="scan'208";a="481360467"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 10:25:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <john.c.harrison@intel.com>
Subject: [PATCH 19/25] drm/i915/guc: Implement no mid batch preemption for
 multi-lrc
Date: Thu, 14 Oct 2021 10:19:59 -0700
Message-Id: <20211014172005.27155-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211014172005.27155-1-matthew.brost@intel.com>
References: <20211014172005.27155-1-matthew.brost@intel.com>
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
between parent and child is needed, syncing the set of BBs at the
beginning and end of each batch. This is implemented via custom
emit_bb_start & emit_fini_breadcrumb functions and enabled by default if
a context is configured by set parallel extension.

Lastly, this patch updates the process descriptor to the correct size as
the memory used in the handshake is directly after the process
descriptor.

v2:
 (John Harrison)
  - Fix a few comments wording
  - Add struture for parent page layout
v3:
 (John Harrison)
  - A structure for sync semaphore
  - Use offsetof to calc address
  - Update commit message
v4:
 (John Harrison)
  - Fix typos in comment explaining memory map of scratch page

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       |   2 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 333 +++++++++++++++++-
 4 files changed, 326 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 6aab60584ee5..5634d14052bc 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -570,7 +570,7 @@ void intel_context_bind_parent_child(struct intel_context *parent,
 	GEM_BUG_ON(intel_context_is_child(child));
 	GEM_BUG_ON(intel_context_is_parent(child));
 
-	parent->parallel.number_children++;
+	parent->parallel.child_index = parent->parallel.number_children++;
 	list_add_tail(&child->parallel.child_link,
 		      &parent->parallel.child_list);
 	child->parallel.parent = parent;
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 1d880303a7e4..95a5b94b4ece 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -250,6 +250,8 @@ struct intel_context {
 		struct i915_request *last_rq;
 		/** @number_children: number of children if parent */
 		u8 number_children;
+		/** @child_index: index into child_list if child */
+		u8 child_index;
 		/** @guc: GuC specific members for parallel submission */
 		struct {
 			/** @wqi_head: head pointer in work queue */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 18da67cfcd92..722933e26347 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -186,7 +186,7 @@ struct guc_process_desc {
 	u32 wq_status;
 	u32 engine_presence;
 	u32 priority;
-	u32 reserved[30];
+	u32 reserved[36];
 } __packed;
 
 #define CONTEXT_REGISTRATION_FLAG_KMD	BIT(0)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 57eb5f8bc8bb..50f0f4eba03b 100644
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
@@ -368,11 +369,16 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
 
 /*
  * When using multi-lrc submission a scratch memory area is reserved in the
- * parent's context state for the process descriptor and work queue. Currently
- * the scratch area is sized to a page.
+ * parent's context state for the process descriptor, work queue, and handshake
+ * between the parent + children contexts to insert safe preemption points
+ * between each of the BBs. Currently the scratch area is sized to a page.
  *
  * The layout of this scratch area is below:
  * 0						guc_process_desc
+ * + sizeof(struct guc_process_desc)		child go
+ * + CACHELINE_BYTES				child join[0]
+ * ...
+ * + CACHELINE_BYTES				child join[n - 1]
  * ...						unused
  * PARENT_SCRATCH_SIZE / 2			work queue start
  * ...						work queue
@@ -380,7 +386,25 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
  */
 #define WQ_SIZE			(PARENT_SCRATCH_SIZE / 2)
 #define WQ_OFFSET		(PARENT_SCRATCH_SIZE - WQ_SIZE)
-static u32 __get_process_desc_offset(struct intel_context *ce)
+
+struct sync_semaphore {
+	u32 semaphore;
+	u8 unused[CACHELINE_BYTES - sizeof(u32)];
+};
+
+struct parent_scratch {
+	struct guc_process_desc pdesc;
+
+	struct sync_semaphore go;
+	struct sync_semaphore join[MAX_ENGINE_INSTANCE + 1];
+
+	u8 unused[WQ_OFFSET - sizeof(struct guc_process_desc) -
+		sizeof(struct sync_semaphore) * (MAX_ENGINE_INSTANCE + 2)];
+
+	u32 wq[WQ_SIZE / sizeof(u32)];
+};
+
+static u32 __get_parent_scratch_offset(struct intel_context *ce)
 {
 	GEM_BUG_ON(!ce->parallel.guc.parent_page);
 
@@ -389,23 +413,36 @@ static u32 __get_process_desc_offset(struct intel_context *ce)
 
 static u32 __get_wq_offset(struct intel_context *ce)
 {
-	return __get_process_desc_offset(ce) + WQ_OFFSET;
+	BUILD_BUG_ON(offsetof(struct parent_scratch, wq) != WQ_OFFSET);
+
+	return __get_parent_scratch_offset(ce) + WQ_OFFSET;
 }
 
-static struct guc_process_desc *
-__get_process_desc(struct intel_context *ce)
+static struct parent_scratch *
+__get_parent_scratch(struct intel_context *ce)
 {
+	BUILD_BUG_ON(sizeof(struct parent_scratch) != PARENT_SCRATCH_SIZE);
+	BUILD_BUG_ON(sizeof(struct sync_semaphore) != CACHELINE_BYTES);
+
 	/*
 	 * Need to subtract LRC_STATE_OFFSET here as the
 	 * parallel.guc.parent_page is the offset into ce->state while
 	 * ce->lrc_reg_reg is ce->state + LRC_STATE_OFFSET.
 	 */
-	return (struct guc_process_desc *)
+	return (struct parent_scratch *)
 		(ce->lrc_reg_state +
-		 ((__get_process_desc_offset(ce) -
+		 ((__get_parent_scratch_offset(ce) -
 		   LRC_STATE_OFFSET) / sizeof(u32)));
 }
 
+static struct guc_process_desc *
+__get_process_desc(struct intel_context *ce)
+{
+	struct parent_scratch *ps = __get_parent_scratch(ce);
+
+	return &ps->pdesc;
+}
+
 static u32 *get_wq_pointer(struct guc_process_desc *desc,
 			   struct intel_context *ce,
 			   u32 wqi_size)
@@ -425,8 +462,7 @@ static u32 *get_wq_pointer(struct guc_process_desc *desc,
 	}
 #undef AVAILABLE_SPACE
 
-	return ((u32 *)__get_process_desc(ce)) +
-		((WQ_OFFSET + ce->parallel.guc.wqi_tail) / sizeof(u32));
+	return &__get_parent_scratch(ce)->wq[ce->parallel.guc.wqi_tail / sizeof(u32)];
 }
 
 static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
@@ -1827,6 +1863,27 @@ static int deregister_context(struct intel_context *ce, u32 guc_id)
 	return __guc_action_deregister_context(guc, guc_id);
 }
 
+static inline void clear_children_join_go_memory(struct intel_context *ce)
+{
+	struct parent_scratch *ps = __get_parent_scratch(ce);
+	int i;
+
+	ps->go.semaphore = 0;
+	for (i = 0; i < ce->parallel.number_children + 1; ++i)
+		ps->join[i].semaphore = 0;
+}
+
+static inline u32 get_children_go_value(struct intel_context *ce)
+{
+	return __get_parent_scratch(ce)->go.semaphore;
+}
+
+static inline u32 get_children_join_value(struct intel_context *ce,
+					  u8 child_index)
+{
+	return __get_parent_scratch(ce)->join[child_index].semaphore;
+}
+
 static void guc_context_policy_init(struct intel_engine_cs *engine,
 				    struct guc_lrc_desc *desc)
 {
@@ -1886,7 +1943,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 		ce->parallel.guc.wqi_head = 0;
 
 		desc->process_desc = i915_ggtt_offset(ce->state) +
-			__get_process_desc_offset(ce);
+			__get_parent_scratch_offset(ce);
 		desc->wq_addr = i915_ggtt_offset(ce->state) +
 			__get_wq_offset(ce);
 		desc->wq_size = WQ_SIZE;
@@ -1908,6 +1965,8 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
 			guc_context_policy_init(engine, desc);
 		}
+
+		clear_children_join_go_memory(ce);
 	}
 
 	/*
@@ -2974,6 +3033,31 @@ static const struct intel_context_ops virtual_child_context_ops = {
 	.get_sibling = guc_virtual_get_sibling,
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
+static int emit_bb_start_parent_no_preempt_mid_batch(struct i915_request *rq,
+						     u64 offset, u32 len,
+						     const unsigned int flags);
+static int emit_bb_start_child_no_preempt_mid_batch(struct i915_request *rq,
+						    u64 offset, u32 len,
+						    const unsigned int flags);
+static u32 *
+emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
+						 u32 *cs);
+static u32 *
+emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
+						u32 *cs);
+
 static struct intel_context *
 guc_create_parallel(struct intel_engine_cs **engines,
 		    unsigned int num_siblings,
@@ -3009,6 +3093,20 @@ guc_create_parallel(struct intel_engine_cs **engines,
 		}
 	}
 
+	parent->engine->emit_bb_start =
+		emit_bb_start_parent_no_preempt_mid_batch;
+	parent->engine->emit_fini_breadcrumb =
+		emit_fini_breadcrumb_parent_no_preempt_mid_batch;
+	parent->engine->emit_fini_breadcrumb_dw =
+		12 + 4 * parent->parallel.number_children;
+	for_each_child(parent, ce) {
+		ce->engine->emit_bb_start =
+			emit_bb_start_child_no_preempt_mid_batch;
+		ce->engine->emit_fini_breadcrumb =
+			emit_fini_breadcrumb_child_no_preempt_mid_batch;
+		ce->engine->emit_fini_breadcrumb_dw = 16;
+	}
+
 	kfree(siblings);
 	return parent;
 
@@ -3837,6 +3935,17 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
 			drm_printf(p, "\t\tWQI Status: %u\n\n",
 				   READ_ONCE(desc->wq_status));
 
+			if (ce->engine->emit_bb_start ==
+			    emit_bb_start_parent_no_preempt_mid_batch) {
+				u8 i;
+
+				drm_printf(p, "\t\tChildren Go: %u\n\n",
+					   get_children_go_value(ce));
+				for (i = 0; i < ce->parallel.number_children; ++i)
+					drm_printf(p, "\t\tChildren Join: %u\n",
+						   get_children_join_value(ce, i));
+			}
+
 			for_each_child(ce, child)
 				guc_log_context(p, child);
 		}
@@ -3844,6 +3953,208 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
 	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
 
+static inline u32 get_children_go_addr(struct intel_context *ce)
+{
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+
+	return i915_ggtt_offset(ce->state) +
+		__get_parent_scratch_offset(ce) +
+		offsetof(struct parent_scratch, go.semaphore);
+}
+
+static inline u32 get_children_join_addr(struct intel_context *ce,
+					 u8 child_index)
+{
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+
+	return i915_ggtt_offset(ce->state) +
+		__get_parent_scratch_offset(ce) +
+		offsetof(struct parent_scratch, join[child_index].semaphore);
+}
+
+#define PARENT_GO_BB			1
+#define PARENT_GO_FINI_BREADCRUMB	0
+#define CHILD_GO_BB			1
+#define CHILD_GO_FINI_BREADCRUMB	0
+static int emit_bb_start_parent_no_preempt_mid_batch(struct i915_request *rq,
+						     u64 offset, u32 len,
+						     const unsigned int flags)
+{
+	struct intel_context *ce = rq->context;
+	u32 *cs;
+	u8 i;
+
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+
+	cs = intel_ring_begin(rq, 10 + 4 * ce->parallel.number_children);
+	if (IS_ERR(cs))
+		return PTR_ERR(cs);
+
+	/* Wait on children */
+	for (i = 0; i < ce->parallel.number_children; ++i) {
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
+static int emit_bb_start_child_no_preempt_mid_batch(struct i915_request *rq,
+						    u64 offset, u32 len,
+						    const unsigned int flags)
+{
+	struct intel_context *ce = rq->context;
+	struct intel_context *parent = intel_context_to_parent(ce);
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
+				  get_children_join_addr(parent,
+							 ce->parallel.child_index),
+				  0);
+
+	/* Wait on parent for go */
+	*cs++ = (MI_SEMAPHORE_WAIT |
+		 MI_SEMAPHORE_GLOBAL_GTT |
+		 MI_SEMAPHORE_POLL |
+		 MI_SEMAPHORE_SAD_EQ_SDD);
+	*cs++ = CHILD_GO_BB;
+	*cs++ = get_children_go_addr(parent);
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
+emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
+						 u32 *cs)
+{
+	struct intel_context *ce = rq->context;
+	u8 i;
+
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+
+	/* Wait on children */
+	for (i = 0; i < ce->parallel.number_children; ++i) {
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
+emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq, u32 *cs)
+{
+	struct intel_context *ce = rq->context;
+	struct intel_context *parent = intel_context_to_parent(ce);
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
+				  get_children_join_addr(parent,
+							 ce->parallel.child_index),
+				  0);
+
+	/* Wait parent on for go */
+	*cs++ = (MI_SEMAPHORE_WAIT |
+		 MI_SEMAPHORE_GLOBAL_GTT |
+		 MI_SEMAPHORE_POLL |
+		 MI_SEMAPHORE_SAD_EQ_SDD);
+	*cs++ = CHILD_GO_FINI_BREADCRUMB;
+	*cs++ = get_children_go_addr(parent);
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
 static struct intel_context *
 guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
 		   unsigned long flags)
-- 
2.32.0

