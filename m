Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABE43D02FE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5EB6E595;
	Tue, 20 Jul 2021 20:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAC76E517;
 Tue, 20 Jul 2021 20:40:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="209421886"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="209421886"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906082"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 23/42] drm/i915/guc: Implement multi-lrc submission
Date: Tue, 20 Jul 2021 13:57:43 -0700
Message-Id: <20210720205802.39610-24-matthew.brost@intel.com>
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

Implement multi-lrc submission via a single workqueue entry and single
H2G. The workqueue entry contains an updated tail value for each
request, of all the contexts in the multi-lrc submission, and updates
these values simultaneously. As such, the tasklet and bypass path have
been updated to coalesce requests into a single submission.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   6 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 224 ++++++++++++++++--
 drivers/gpu/drm/i915/i915_request.h           |   8 +
 3 files changed, 222 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 86fb90a4bcfa..820cb6b5d2d0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -64,12 +64,14 @@
 #define   WQ_TYPE_PSEUDO		(0x2 << WQ_TYPE_SHIFT)
 #define   WQ_TYPE_INORDER		(0x3 << WQ_TYPE_SHIFT)
 #define   WQ_TYPE_NOOP			(0x4 << WQ_TYPE_SHIFT)
-#define WQ_TARGET_SHIFT			10
+#define   WQ_TYPE_MULTI_LRC		(0x5 << WQ_TYPE_SHIFT)
+#define WQ_TARGET_SHIFT			8
 #define WQ_LEN_SHIFT			16
 #define WQ_NO_WCFLUSH_WAIT		(1 << 27)
 #define WQ_PRESENT_WORKLOAD		(1 << 28)
 
-#define WQ_RING_TAIL_SHIFT		20
+#define WQ_GUC_ID_SHIFT			0
+#define WQ_RING_TAIL_SHIFT		18
 #define WQ_RING_TAIL_MAX		0x7FF	/* 2^11 QWords */
 #define WQ_RING_TAIL_MASK		(WQ_RING_TAIL_MAX << WQ_RING_TAIL_SHIFT)
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 429473b4d46c..29a7616d3bcf 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -490,6 +490,29 @@ __get_process_desc(struct intel_context *ce)
 		   LRC_STATE_OFFSET) / sizeof(u32)));
 }
 
+static inline u32 *get_wq_pointer(struct guc_process_desc *desc,
+				  struct intel_context *ce,
+				  u32 wqi_size)
+{
+	/*
+	 * Check for space in work queue. Caching a value of head pointer in
+	 * intel_context structure in order reduce the number accesses to shared
+	 * GPU memory which may be across a PCIe bus.
+	 */
+#define AVAILABLE_SPACE	\
+	CIRC_SPACE(ce->guc_wqi_tail, ce->guc_wqi_head, GUC_WQ_SIZE)
+	if (AVAILABLE_SPACE < wqi_size) {
+		ce->guc_wqi_head = READ_ONCE(desc->head);
+
+		if (AVAILABLE_SPACE < wqi_size)
+			return NULL;
+	}
+#undef AVAILABLE_SPACE
+
+	return ((u32 *)__get_process_desc(ce)) +
+		((WQ_OFFSET + ce->guc_wqi_tail) / sizeof(u32));
+}
+
 static u32 __get_lrc_desc_offset(struct intel_guc *guc, int index)
 {
 	GEM_BUG_ON(index >= guc->lrcd_reg.max_idx);
@@ -640,7 +663,7 @@ static inline bool request_has_no_guc_id(struct i915_request *rq)
 static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 {
 	int err = 0;
-	struct intel_context *ce = rq->context;
+	struct intel_context *ce = request_to_scheduling_context(rq);
 	u32 action[3];
 	int len = 0;
 	u32 g2h_len_dw = 0;
@@ -690,6 +713,18 @@ static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 		trace_intel_context_sched_enable(ce);
 		atomic_inc(&guc->outstanding_submission_g2h);
 		set_context_enabled(ce);
+
+		/*
+		 * Without multi-lrc KMD does the submission step (moving the
+		 * lrc tail) so enabling scheduling is sufficient to submit the
+		 * context. This isn't the case in multi-lrc submission as the
+		 * GuC needs to move the tails, hence the need for another H2G
+		 * to submit a multi-lrc context after enabling scheduling.
+		 */
+		if (intel_context_is_parent(ce)) {
+			action[0] = INTEL_GUC_ACTION_SCHED_CONTEXT;
+			err = intel_guc_send_nb(guc, action, len - 1, 0);
+		}
 	} else if (!enabled) {
 		clr_context_pending_enable(ce);
 		intel_context_put(ce);
@@ -764,7 +799,6 @@ static int tasklet_register_context(struct guc_submit_engine *gse,
 	return ret;
 }
 
-
 static inline void guc_set_lrc_tail(struct i915_request *rq)
 {
 	rq->context->lrc_reg_state[CTX_RING_TAIL] =
@@ -776,6 +810,131 @@ static inline int rq_prio(const struct i915_request *rq)
 	return rq->sched.attr.priority;
 }
 
+static inline bool is_multi_lrc_rq(struct i915_request *rq)
+{
+	return intel_context_is_child(rq->context) ||
+		intel_context_is_parent(rq->context);
+}
+
+/*
+ * Multi-lrc requests are not submitted to the GuC until all requests in
+ * the set are ready. With the exception of the last request in the set,
+ * submitting a multi-lrc request is therefore just a status update on
+ * the driver-side and can be safely merged with other requests. When the
+ * last multi-lrc request in a set is detected, we break out of the
+ * submission loop and submit the whole set, thus we never attempt to
+ * merge that one with othe requests.
+ */
+static inline bool can_merge_rq(struct i915_request *rq,
+				struct i915_request *last)
+{
+	return is_multi_lrc_rq(last) || rq->context == last->context;
+}
+
+static inline u32 wq_space_until_wrap(struct intel_context *ce)
+{
+	return (GUC_WQ_SIZE - ce->guc_wqi_tail);
+}
+
+static inline void write_wqi(struct guc_process_desc *desc,
+			     struct intel_context *ce,
+			     u32 wqi_size)
+{
+	ce->guc_wqi_tail = (ce->guc_wqi_tail + wqi_size) & (GUC_WQ_SIZE - 1);
+	WRITE_ONCE(desc->tail, ce->guc_wqi_tail);
+}
+
+static inline int guc_wq_noop_append(struct intel_context *ce)
+{
+	struct guc_process_desc *desc = __get_process_desc(ce);
+	u32 *wqi = get_wq_pointer(desc, ce, wq_space_until_wrap(ce));
+
+	if (!wqi)
+		return -EBUSY;
+
+	*wqi = WQ_TYPE_NOOP |
+		((wq_space_until_wrap(ce) / sizeof(u32) - 1) << WQ_LEN_SHIFT);
+	ce->guc_wqi_tail = 0;
+
+	return 0;
+}
+
+static int __guc_wq_item_append(struct i915_request *rq)
+{
+	struct intel_context *ce = request_to_scheduling_context(rq);
+	struct intel_context *child;
+	struct guc_process_desc *desc = __get_process_desc(ce);
+	unsigned int wqi_size = (ce->guc_number_children + 4) *
+		sizeof(u32);
+	u32 *wqi;
+	int ret;
+
+	/* Ensure context is in correct state updating work queue */
+	GEM_BUG_ON(ce->guc_num_rq_submit_no_id);
+	GEM_BUG_ON(request_has_no_guc_id(rq));
+	GEM_BUG_ON(!atomic_read(&ce->guc_id_ref));
+	GEM_BUG_ON(context_guc_id_invalid(ce));
+	GEM_BUG_ON(context_pending_disable(ce));
+	GEM_BUG_ON(context_wait_for_deregister_to_register(ce));
+
+	/* Insert NOOP if this work queue item will wrap the tail pointer. */
+	if (wqi_size > wq_space_until_wrap(ce)) {
+		ret = guc_wq_noop_append(ce);
+		if (ret)
+			return ret;
+	}
+
+	wqi = get_wq_pointer(desc, ce, wqi_size);
+	if (!wqi)
+		return -EBUSY;
+
+	*wqi++ = WQ_TYPE_MULTI_LRC |
+		((wqi_size / sizeof(u32) - 1) << WQ_LEN_SHIFT);
+	*wqi++ = ce->lrc.lrca;
+	*wqi++ = (ce->guc_id << WQ_GUC_ID_SHIFT) |
+		 ((ce->ring->tail / sizeof(u64)) << WQ_RING_TAIL_SHIFT);
+	*wqi++ = 0;	/* fence_id */
+	for_each_child(ce, child)
+		*wqi++ = child->ring->tail / sizeof(u64);
+
+	write_wqi(desc, ce, wqi_size);
+
+	return 0;
+}
+
+static int gse_wq_item_append(struct guc_submit_engine *gse,
+			      struct i915_request *rq)
+{
+	struct intel_context *ce = request_to_scheduling_context(rq);
+	int ret = 0;
+
+	if (likely(!intel_context_is_banned(ce))) {
+		ret = __guc_wq_item_append(rq);
+
+		if (unlikely(ret == -EBUSY)) {
+			gse->stalled_rq = rq;
+			gse->submission_stall_reason = STALL_MOVE_LRC_TAIL;
+		}
+	}
+
+	return ret;
+}
+
+static inline bool multi_lrc_submit(struct i915_request *rq)
+{
+	struct intel_context *ce = request_to_scheduling_context(rq);
+	intel_ring_set_tail(rq->ring, rq->tail);
+
+	/*
+	 * We expect the front end (execbuf IOCTL) to set this flag on the last
+	 * request generated from a multi-BB submission. This indicates to the
+	 * backend (GuC interface) that we should submit this context thus
+	 * submitting all the requests generated in parallel.
+	 */
+	return test_bit(I915_FENCE_FLAG_SUBMIT_PARALLEL, &rq->fence.flags) ||
+		intel_context_is_banned(ce);
+}
+
 static void kick_retire_wq(struct guc_submit_engine *gse)
 {
 	queue_work(system_unbound_wq, &gse->retire_worker);
@@ -819,7 +978,7 @@ static int gse_dequeue_one_context(struct guc_submit_engine *gse)
 			struct i915_request *rq, *rn;
 
 			priolist_for_each_request_consume(rq, rn, p) {
-				if (last && rq->context != last->context)
+				if (last && !can_merge_rq(rq, last))
 					goto done;
 
 				list_del_init(&rq->sched.link);
@@ -828,7 +987,22 @@ static int gse_dequeue_one_context(struct guc_submit_engine *gse)
 
 				trace_i915_request_in(rq, 0);
 				last = rq;
-				submit = true;
+
+				if (is_multi_lrc_rq(rq)) {
+					/*
+					 * We need to coalesce all multi-lrc
+					 * requests in a relationship into a
+					 * single H2G. We are guaranteed that
+					 * all of these requests will be
+					 * submitted sequentially.
+					 */
+					if (multi_lrc_submit(rq)) {
+						submit = true;
+						goto done;
+					}
+				} else {
+					submit = true;
+				}
 			}
 
 			rb_erase_cached(&p->node, &sched_engine->queue);
@@ -838,7 +1012,7 @@ static int gse_dequeue_one_context(struct guc_submit_engine *gse)
 
 done:
 	if (submit) {
-		struct intel_context *ce = last->context;
+		struct intel_context *ce = request_to_scheduling_context(last);
 
 		if (ce->guc_num_rq_submit_no_id) {
 			ret = tasklet_pin_guc_id(gse, last);
@@ -860,7 +1034,17 @@ static int gse_dequeue_one_context(struct guc_submit_engine *gse)
 		}
 
 move_lrc_tail:
-		guc_set_lrc_tail(last);
+		if (is_multi_lrc_rq(last)) {
+			ret = gse_wq_item_append(gse, last);
+			if (ret == -EBUSY)
+				goto schedule_tasklet;
+			else if (ret != 0) {
+				GEM_WARN_ON(ret);	/* Unexpected */
+				goto deadlk;
+			}
+		} else {
+			guc_set_lrc_tail(last);
+		}
 
 add_request:
 		ret = gse_add_request(gse, last);
@@ -1565,14 +1749,22 @@ static bool need_tasklet(struct guc_submit_engine *gse, struct intel_context *ce
 static int gse_bypass_tasklet_submit(struct guc_submit_engine *gse,
 				     struct i915_request *rq)
 {
-	int ret;
+	int ret = 0;
 
 	__i915_request_submit(rq);
 
 	trace_i915_request_in(rq, 0);
 
-	guc_set_lrc_tail(rq);
-	ret = gse_add_request(gse, rq);
+	if (is_multi_lrc_rq(rq)) {
+		if (multi_lrc_submit(rq)) {
+			ret = gse_wq_item_append(gse, rq);
+			if (!ret)
+				ret = gse_add_request(gse, rq);
+		}
+	} else {
+		guc_set_lrc_tail(rq);
+		ret = gse_add_request(gse, rq);
+	}
 
 	if (unlikely(ret == -EPIPE))
 		disable_submission(gse->sched_engine.private_data);
@@ -1589,7 +1781,7 @@ static void guc_submit_request(struct i915_request *rq)
 	/* Will be called from irq-context when using foreign fences. */
 	spin_lock_irqsave(&sched_engine->lock, flags);
 
-	if (need_tasklet(gse, rq->context))
+	if (need_tasklet(gse, request_to_scheduling_context(rq)))
 		queue_request(sched_engine, rq, rq_prio(rq));
 	else if (gse_bypass_tasklet_submit(gse, rq) == -EBUSY)
 		kick_tasklet(gse);
@@ -2957,9 +3149,10 @@ static inline bool new_guc_prio_higher(u8 old_guc_prio, u8 new_guc_prio)
 
 static void add_to_context(struct i915_request *rq)
 {
-	struct intel_context *ce = rq->context;
+	struct intel_context *ce = request_to_scheduling_context(rq);
 	u8 new_guc_prio = map_i915_prio_to_guc_prio(rq_prio(rq));
 
+	GEM_BUG_ON(intel_context_is_child(ce));
 	GEM_BUG_ON(rq->guc_prio == GUC_PRIO_FINI);
 
 	spin_lock(&ce->guc_active.lock);
@@ -2993,7 +3186,9 @@ static void guc_prio_fini(struct i915_request *rq, struct intel_context *ce)
 
 static void remove_from_context(struct i915_request *rq)
 {
-	struct intel_context *ce = rq->context;
+	struct intel_context *ce = request_to_scheduling_context(rq);
+
+	GEM_BUG_ON(intel_context_is_child(ce));
 
 	spin_lock_irq(&ce->guc_active.lock);
 
@@ -3197,7 +3392,8 @@ static int tasklet_pin_guc_id(struct guc_submit_engine *gse,
 	GEM_BUG_ON(gse->total_num_rq_with_no_guc_id < 0);
 
 	list_for_each_entry_reverse(rq, &ce->guc_active.requests, sched.link)
-		if (request_has_no_guc_id(rq)) {
+		if (request_has_no_guc_id(rq) &&
+		    request_to_scheduling_context(rq) == ce) {
 			--ce->guc_num_rq_submit_no_id;
 			clear_bit(I915_FENCE_FLAG_GUC_ID_NOT_PINNED,
 				  &rq->fence.flags);
@@ -3517,7 +3713,7 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
 
 static void guc_retire_inflight_request_prio(struct i915_request *rq)
 {
-	struct intel_context *ce = rq->context;
+	struct intel_context *ce = request_to_scheduling_context(rq);
 
 	spin_lock(&ce->guc_active.lock);
 	guc_prio_fini(rq, ce);
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 5f304fd02071..ad3ec638d28b 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -145,6 +145,14 @@ enum {
 	 * tasklet that the guc_id isn't pinned.
 	 */
 	I915_FENCE_FLAG_GUC_ID_NOT_PINNED,
+
+	/*
+	 * I915_FENCE_FLAG_SUBMIT_PARALLEL - request with a context in a
+	 * parent-child relationship (parallel submission, multi-lrc) should
+	 * trigger a submission to the GuC rather than just moving the context
+	 * tail.
+	 */
+	I915_FENCE_FLAG_SUBMIT_PARALLEL,
 };
 
 /**
-- 
2.28.0

