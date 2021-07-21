Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C82B3D1941
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 23:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B20F6EA42;
	Wed, 21 Jul 2021 21:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350EC6EA07;
 Wed, 21 Jul 2021 21:33:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="209620429"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="209620429"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 14:33:14 -0700
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="470296699"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 14:33:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 18/18] drm/i915: Add intel_context tracing
Date: Wed, 21 Jul 2021 14:51:01 -0700
Message-Id: <20210721215101.139794-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210721215101.139794-1-matthew.brost@intel.com>
References: <20210721215101.139794-1-matthew.brost@intel.com>
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

Add intel_context tracing. These trace points are particular helpful
when debugging the GuC firmware and can be enabled via
CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS kernel config option.

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       |   6 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  14 ++
 drivers/gpu/drm/i915/i915_trace.h             | 145 ++++++++++++++++++
 3 files changed, 165 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 91349d071e0e..251ff7eea22d 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -8,6 +8,7 @@
 
 #include "i915_drv.h"
 #include "i915_globals.h"
+#include "i915_trace.h"
 
 #include "intel_context.h"
 #include "intel_engine.h"
@@ -28,6 +29,7 @@ static void rcu_context_free(struct rcu_head *rcu)
 {
 	struct intel_context *ce = container_of(rcu, typeof(*ce), rcu);
 
+	trace_intel_context_free(ce);
 	kmem_cache_free(global.slab_ce, ce);
 }
 
@@ -46,6 +48,7 @@ intel_context_create(struct intel_engine_cs *engine)
 		return ERR_PTR(-ENOMEM);
 
 	intel_context_init(ce, engine);
+	trace_intel_context_create(ce);
 	return ce;
 }
 
@@ -268,6 +271,8 @@ int __intel_context_do_pin_ww(struct intel_context *ce,
 
 	GEM_BUG_ON(!intel_context_is_pinned(ce)); /* no overflow! */
 
+	trace_intel_context_do_pin(ce);
+
 err_unlock:
 	mutex_unlock(&ce->pin_mutex);
 err_post_unpin:
@@ -323,6 +328,7 @@ void __intel_context_do_unpin(struct intel_context *ce, int sub)
 	 */
 	intel_context_get(ce);
 	intel_context_active_release(ce);
+	trace_intel_context_do_unpin(ce);
 	intel_context_put(ce);
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index d47a8358c831..26aadad10b12 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -344,6 +344,7 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 
 	err = intel_guc_send_nb(guc, action, len, g2h_len_dw);
 	if (!enabled && !err) {
+		trace_intel_context_sched_enable(ce);
 		atomic_inc(&guc->outstanding_submission_g2h);
 		set_context_enabled(ce);
 	} else if (!enabled) {
@@ -815,6 +816,8 @@ static int register_context(struct intel_context *ce)
 	u32 offset = intel_guc_ggtt_offset(guc, guc->lrc_desc_pool) +
 		ce->guc_id * sizeof(struct guc_lrc_desc);
 
+	trace_intel_context_register(ce);
+
 	return __guc_action_register_context(guc, ce->guc_id, offset);
 }
 
@@ -835,6 +838,8 @@ static int deregister_context(struct intel_context *ce, u32 guc_id)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
 
+	trace_intel_context_deregister(ce);
+
 	return __guc_action_deregister_context(guc, guc_id);
 }
 
@@ -908,6 +913,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce)
 	 * registering this context.
 	 */
 	if (context_registered) {
+		trace_intel_context_steal_guc_id(ce);
 		set_context_wait_for_deregister_to_register(ce);
 		intel_context_get(ce);
 
@@ -971,6 +977,7 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
 
 	GEM_BUG_ON(guc_id == GUC_INVALID_LRC_ID);
 
+	trace_intel_context_sched_disable(ce);
 	intel_context_get(ce);
 
 	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
@@ -1133,6 +1140,9 @@ static void __guc_signal_context_fence(struct intel_context *ce)
 
 	lockdep_assert_held(&ce->guc_state.lock);
 
+	if (!list_empty(&ce->guc_state.fences))
+		trace_intel_context_fence_release(ce);
+
 	list_for_each_entry(rq, &ce->guc_state.fences, guc_fence_link)
 		i915_sw_fence_complete(&rq->submit);
 
@@ -1538,6 +1548,8 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 	if (unlikely(!ce))
 		return -EPROTO;
 
+	trace_intel_context_deregister_done(ce);
+
 	if (context_wait_for_deregister_to_register(ce)) {
 		struct intel_runtime_pm *runtime_pm =
 			&ce->engine->gt->i915->runtime_pm;
@@ -1589,6 +1601,8 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 		return -EPROTO;
 	}
 
+	trace_intel_context_sched_done(ce);
+
 	if (context_pending_enable(ce)) {
 		clr_context_pending_enable(ce);
 	} else if (context_pending_disable(ce)) {
diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index 478f5427531d..68b70626c3e2 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -895,6 +895,91 @@ TRACE_EVENT(i915_request_out,
 			      __entry->ctx, __entry->seqno, __entry->completed)
 );
 
+DECLARE_EVENT_CLASS(intel_context,
+		    TP_PROTO(struct intel_context *ce),
+		    TP_ARGS(ce),
+
+		    TP_STRUCT__entry(
+			     __field(u32, guc_id)
+			     __field(int, pin_count)
+			     __field(u32, sched_state)
+			     __field(u32, guc_sched_state_no_lock)
+			     ),
+
+		    TP_fast_assign(
+			   __entry->guc_id = ce->guc_id;
+			   __entry->pin_count = atomic_read(&ce->pin_count);
+			   __entry->sched_state = ce->guc_state.sched_state;
+			   __entry->guc_sched_state_no_lock =
+			   atomic_read(&ce->guc_sched_state_no_lock);
+			   ),
+
+		    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x,0x%x",
+			      __entry->guc_id, __entry->pin_count,
+			      __entry->sched_state,
+			      __entry->guc_sched_state_no_lock)
+);
+
+DEFINE_EVENT(intel_context, intel_context_register,
+	     TP_PROTO(struct intel_context *ce),
+	     TP_ARGS(ce)
+);
+
+DEFINE_EVENT(intel_context, intel_context_deregister,
+	     TP_PROTO(struct intel_context *ce),
+	     TP_ARGS(ce)
+);
+
+DEFINE_EVENT(intel_context, intel_context_deregister_done,
+	     TP_PROTO(struct intel_context *ce),
+	     TP_ARGS(ce)
+);
+
+DEFINE_EVENT(intel_context, intel_context_sched_enable,
+	     TP_PROTO(struct intel_context *ce),
+	     TP_ARGS(ce)
+);
+
+DEFINE_EVENT(intel_context, intel_context_sched_disable,
+	     TP_PROTO(struct intel_context *ce),
+	     TP_ARGS(ce)
+);
+
+DEFINE_EVENT(intel_context, intel_context_sched_done,
+	     TP_PROTO(struct intel_context *ce),
+	     TP_ARGS(ce)
+);
+
+DEFINE_EVENT(intel_context, intel_context_create,
+	     TP_PROTO(struct intel_context *ce),
+	     TP_ARGS(ce)
+);
+
+DEFINE_EVENT(intel_context, intel_context_fence_release,
+	     TP_PROTO(struct intel_context *ce),
+	     TP_ARGS(ce)
+);
+
+DEFINE_EVENT(intel_context, intel_context_free,
+	     TP_PROTO(struct intel_context *ce),
+	     TP_ARGS(ce)
+);
+
+DEFINE_EVENT(intel_context, intel_context_steal_guc_id,
+	     TP_PROTO(struct intel_context *ce),
+	     TP_ARGS(ce)
+);
+
+DEFINE_EVENT(intel_context, intel_context_do_pin,
+	     TP_PROTO(struct intel_context *ce),
+	     TP_ARGS(ce)
+);
+
+DEFINE_EVENT(intel_context, intel_context_do_unpin,
+	     TP_PROTO(struct intel_context *ce),
+	     TP_ARGS(ce)
+);
+
 #else
 #if !defined(TRACE_HEADER_MULTI_READ)
 static inline void
@@ -921,6 +1006,66 @@ static inline void
 trace_i915_request_out(struct i915_request *rq)
 {
 }
+
+static inline void
+trace_intel_context_register(struct intel_context *ce)
+{
+}
+
+static inline void
+trace_intel_context_deregister(struct intel_context *ce)
+{
+}
+
+static inline void
+trace_intel_context_deregister_done(struct intel_context *ce)
+{
+}
+
+static inline void
+trace_intel_context_sched_enable(struct intel_context *ce)
+{
+}
+
+static inline void
+trace_intel_context_sched_disable(struct intel_context *ce)
+{
+}
+
+static inline void
+trace_intel_context_sched_done(struct intel_context *ce)
+{
+}
+
+static inline void
+trace_intel_context_create(struct intel_context *ce)
+{
+}
+
+static inline void
+trace_intel_context_fence_release(struct intel_context *ce)
+{
+}
+
+static inline void
+trace_intel_context_free(struct intel_context *ce)
+{
+}
+
+static inline void
+trace_intel_context_steal_guc_id(struct intel_context *ce)
+{
+}
+
+static inline void
+trace_intel_context_do_pin(struct intel_context *ce)
+{
+}
+
+static inline void
+trace_intel_context_do_unpin(struct intel_context *ce)
+{
+}
 #endif
 #endif
 
-- 
2.28.0

