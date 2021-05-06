Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7EC375AEA
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3510A6EDC8;
	Thu,  6 May 2021 18:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DB46ED20;
 Thu,  6 May 2021 18:57:13 +0000 (UTC)
IronPort-SDR: nzHdG5OCytkuWr19t4g3rrzhYlFskn1TNCK5boFQfVzLx38pYginzq6vdYVe2dOiLQ68Gstz87
 7YrJvKVvX0Cw==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531022"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531022"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
IronPort-SDR: t+J+NczgYa/j3nGZJGAfs1mRBSFzpEjGSyb1HpeCOSA9MNvVB8IT1bvSdxErLD8Rt9Vpj+WK57
 6pRmFNAAhoJQ==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583540"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 58/97] drm/i915: Add intel_context tracing
Date: Thu,  6 May 2021 12:14:12 -0700
Message-Id: <20210506191451.77768-59-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add intel_context tracing. These trace points are particular helpful
when debugging the GuC firmware and can be enabled via
CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS kernel config option.

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       |   6 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  14 ++
 drivers/gpu/drm/i915/i915_trace.h             | 148 +++++++++++++++++-
 3 files changed, 166 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 7f97753ab164..b24a1b7a3f88 100644
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
index 87ed00f272e7..a789994d6de7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -347,6 +347,7 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 
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
 
@@ -834,6 +837,8 @@ static int deregister_context(struct intel_context *ce, u32 guc_id)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
 
+	trace_intel_context_deregister(ce);
+
 	return __guc_action_deregister_context(guc, guc_id);
 }
 
@@ -908,6 +913,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce)
 	 * GuC before registering this context.
 	 */
 	if (context_registered) {
+		trace_intel_context_steal_guc_id(ce);
 		set_context_wait_for_deregister_to_register(ce);
 		intel_context_get(ce);
 
@@ -966,6 +972,7 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
 
 	GEM_BUG_ON(guc_id == GUC_INVALID_LRC_ID);
 
+	trace_intel_context_sched_disable(ce);
 	intel_context_get(ce);
 
 	guc_submission_busy_loop(guc, action, ARRAY_SIZE(action),
@@ -1122,6 +1129,9 @@ static void __guc_signal_context_fence(struct intel_context *ce)
 
 	lockdep_assert_held(&ce->guc_state.lock);
 
+	if (!list_empty(&ce->guc_state.fences))
+		trace_intel_context_fence_release(ce);
+
 	list_for_each_entry(rq, &ce->guc_state.fences, guc_fence_link)
 		i915_sw_fence_complete(&rq->submit);
 
@@ -1536,6 +1546,8 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 	if (unlikely(!ce))
 		return -EPROTO;
 
+	trace_intel_context_deregister_done(ce);
+
 	if (context_wait_for_deregister_to_register(ce)) {
 		struct intel_runtime_pm *runtime_pm =
 			&ce->engine->gt->i915->runtime_pm;
@@ -1587,6 +1599,8 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 		return -EPROTO;
 	}
 
+	trace_intel_context_sched_done(ce);
+
 	if (context_pending_enable(ce)) {
 		clr_context_pending_enable(ce);
 	} else if (context_pending_disable(ce)) {
diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index b02d04b6c8f6..97c2e83984ed 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -818,8 +818,8 @@ DECLARE_EVENT_CLASS(i915_request,
 );
 
 DEFINE_EVENT(i915_request, i915_request_add,
-	    TP_PROTO(struct i915_request *rq),
-	    TP_ARGS(rq)
+	     TP_PROTO(struct i915_request *rq),
+	     TP_ARGS(rq)
 );
 
 #if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS)
@@ -905,6 +905,90 @@ TRACE_EVENT(i915_request_out,
 			      __entry->ctx, __entry->seqno, __entry->completed)
 );
 
+DECLARE_EVENT_CLASS(intel_context,
+	    TP_PROTO(struct intel_context *ce),
+	    TP_ARGS(ce),
+
+	    TP_STRUCT__entry(
+			     __field(u32, guc_id)
+			     __field(int, pin_count)
+			     __field(u32, sched_state)
+			     __field(u32, guc_sched_state_no_lock)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->guc_id = ce->guc_id;
+			   __entry->pin_count = atomic_read(&ce->pin_count);
+			   __entry->sched_state = ce->guc_state.sched_state;
+			   __entry->guc_sched_state_no_lock =
+			   atomic_read(&ce->guc_sched_state_no_lock);
+			   ),
+
+	    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x,0x%x",
+		      __entry->guc_id, __entry->pin_count, __entry->sched_state,
+		      __entry->guc_sched_state_no_lock)
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
@@ -941,6 +1025,66 @@ static inline void
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

