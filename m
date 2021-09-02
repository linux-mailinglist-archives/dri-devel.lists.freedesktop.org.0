Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C253FE6EF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 02:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4C96E44D;
	Thu,  2 Sep 2021 00:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22ABA6E42C;
 Thu,  2 Sep 2021 00:52:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="198468264"
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="198468264"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:52:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="646030231"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:52:54 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, John.C.Harrison@Intel.com,
 matthew.brost@intel.com
Subject: [PATCH v5 22/25] drm/i915/guc: Move GuC priority fields in context
 under guc_active
Date: Wed,  1 Sep 2021 17:50:19 -0700
Message-Id: <20210902005022.711767-23-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902005022.711767-1-daniele.ceraolospurio@intel.com>
References: <20210902005022.711767-1-daniele.ceraolospurio@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Move GuC management fields in context under guc_active struct as this is
where the lock that protects theses fields lives. Also only set guc_prio
field once during context init.

v2:
 (Daniele)
  - set CONTEXT_SET_INIT

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context_types.h | 12 ++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 69 +++++++++++--------
 drivers/gpu/drm/i915/i915_trace.h             |  2 +-
 3 files changed, 46 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 3a5d98e908f4..b56960a781da 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -112,6 +112,7 @@ struct intel_context {
 #define CONTEXT_FORCE_SINGLE_SUBMISSION	7
 #define CONTEXT_NOPREEMPT		8
 #define CONTEXT_LRCA_DIRTY		9
+#define CONTEXT_GUC_INIT		10
 
 	struct {
 		u64 timeout_us;
@@ -178,6 +179,11 @@ struct intel_context {
 		spinlock_t lock;
 		/** requests: active requests on this context */
 		struct list_head requests;
+		/*
+		 * GuC priority management
+		 */
+		u8 prio;
+		u32 prio_count[GUC_CLIENT_PRIORITY_NUM];
 	} guc_active;
 
 	/* GuC LRC descriptor ID */
@@ -191,12 +197,6 @@ struct intel_context {
 	 */
 	struct list_head guc_id_link;
 
-	/*
-	 * GuC priority management
-	 */
-	u8 guc_prio;
-	u32 guc_prio_count[GUC_CLIENT_PRIORITY_NUM];
-
 #ifdef CONFIG_DRM_I915_SELFTEST
 	/**
 	 * @drop_schedule_enable: Force drop of schedule enable G2H for selftest
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 440ddcaae627..7f8472ae3f19 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1368,8 +1368,6 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
 	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
 }
 
-static inline u8 map_i915_prio_to_guc_prio(int prio);
-
 static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 {
 	struct intel_engine_cs *engine = ce->engine;
@@ -1377,8 +1375,6 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	struct intel_guc *guc = &engine->gt->uc.guc;
 	u32 desc_idx = ce->guc_id;
 	struct guc_lrc_desc *desc;
-	const struct i915_gem_context *ctx;
-	int prio = I915_CONTEXT_DEFAULT_PRIORITY;
 	bool context_registered;
 	intel_wakeref_t wakeref;
 	int ret = 0;
@@ -1395,12 +1391,6 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 
 	context_registered = lrc_desc_registered(guc, desc_idx);
 
-	rcu_read_lock();
-	ctx = rcu_dereference(ce->gem_context);
-	if (ctx)
-		prio = ctx->sched.priority;
-	rcu_read_unlock();
-
 	reset_lrc_desc(guc, desc_idx);
 	set_lrc_desc_registered(guc, desc_idx, ce);
 
@@ -1409,8 +1399,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	desc->engine_submit_mask = adjust_engine_mask(engine->class,
 						      engine->mask);
 	desc->hw_context_desc = ce->lrc.lrca;
-	ce->guc_prio = map_i915_prio_to_guc_prio(prio);
-	desc->priority = ce->guc_prio;
+	desc->priority = ce->guc_active.prio;
 	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
 	guc_context_policy_init(engine, desc);
 
@@ -1805,10 +1794,10 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
 
 static void __guc_context_destroy(struct intel_context *ce)
 {
-	GEM_BUG_ON(ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_HIGH] ||
-		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
-		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
-		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
+	GEM_BUG_ON(ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_KMD_HIGH] ||
+		   ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
+		   ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
+		   ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
 	GEM_BUG_ON(ce->guc_state.number_committed_requests);
 
 	lrc_fini(ce);
@@ -1918,14 +1907,17 @@ static void guc_context_set_prio(struct intel_guc *guc,
 
 	GEM_BUG_ON(prio < GUC_CLIENT_PRIORITY_KMD_HIGH ||
 		   prio > GUC_CLIENT_PRIORITY_NORMAL);
+	lockdep_assert_held(&ce->guc_active.lock);
 
-	if (ce->guc_prio == prio || submission_disabled(guc) ||
-	    !context_registered(ce))
+	if (ce->guc_active.prio == prio || submission_disabled(guc) ||
+	    !context_registered(ce)) {
+		ce->guc_active.prio = prio;
 		return;
+	}
 
 	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
 
-	ce->guc_prio = prio;
+	ce->guc_active.prio = prio;
 	trace_intel_context_set_prio(ce);
 }
 
@@ -1945,24 +1937,24 @@ static inline void add_context_inflight_prio(struct intel_context *ce,
 					     u8 guc_prio)
 {
 	lockdep_assert_held(&ce->guc_active.lock);
-	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_prio_count));
+	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_active.prio_count));
 
-	++ce->guc_prio_count[guc_prio];
+	++ce->guc_active.prio_count[guc_prio];
 
 	/* Overflow protection */
-	GEM_WARN_ON(!ce->guc_prio_count[guc_prio]);
+	GEM_WARN_ON(!ce->guc_active.prio_count[guc_prio]);
 }
 
 static inline void sub_context_inflight_prio(struct intel_context *ce,
 					     u8 guc_prio)
 {
 	lockdep_assert_held(&ce->guc_active.lock);
-	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_prio_count));
+	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_active.prio_count));
 
 	/* Underflow protection */
-	GEM_WARN_ON(!ce->guc_prio_count[guc_prio]);
+	GEM_WARN_ON(!ce->guc_active.prio_count[guc_prio]);
 
-	--ce->guc_prio_count[guc_prio];
+	--ce->guc_active.prio_count[guc_prio];
 }
 
 static inline void update_context_prio(struct intel_context *ce)
@@ -1975,8 +1967,8 @@ static inline void update_context_prio(struct intel_context *ce)
 
 	lockdep_assert_held(&ce->guc_active.lock);
 
-	for (i = 0; i < ARRAY_SIZE(ce->guc_prio_count); ++i) {
-		if (ce->guc_prio_count[i]) {
+	for (i = 0; i < ARRAY_SIZE(ce->guc_active.prio_count); ++i) {
+		if (ce->guc_active.prio_count[i]) {
 			guc_context_set_prio(guc, ce, i);
 			break;
 		}
@@ -2118,6 +2110,21 @@ static bool context_needs_register(struct intel_context *ce, bool new_guc_id)
 		!submission_disabled(ce_to_guc(ce));
 }
 
+static void guc_context_init(struct intel_context *ce)
+{
+	const struct i915_gem_context *ctx;
+	int prio = I915_CONTEXT_DEFAULT_PRIORITY;
+
+	rcu_read_lock();
+	ctx = rcu_dereference(ce->gem_context);
+	if (ctx)
+		prio = ctx->sched.priority;
+	rcu_read_unlock();
+
+	ce->guc_active.prio = map_i915_prio_to_guc_prio(prio);
+	set_bit(CONTEXT_GUC_INIT, &ce->flags);
+}
+
 static int guc_request_alloc(struct i915_request *rq)
 {
 	struct intel_context *ce = rq->context;
@@ -2149,6 +2156,9 @@ static int guc_request_alloc(struct i915_request *rq)
 
 	rq->reserved_space -= GUC_REQUEST_SIZE;
 
+	if (unlikely(!test_bit(CONTEXT_GUC_INIT, &ce->flags)))
+		guc_context_init(ce);
+
 	/*
 	 * Call pin_guc_id here rather than in the pinning step as with
 	 * dma_resv, contexts can be repeatedly pinned / unpinned trashing the
@@ -3025,13 +3035,12 @@ static inline void guc_log_context_priority(struct drm_printer *p,
 {
 	int i;
 
-	drm_printf(p, "\t\tPriority: %d\n",
-		   ce->guc_prio);
+	drm_printf(p, "\t\tPriority: %d\n", ce->guc_active.prio);
 	drm_printf(p, "\t\tNumber Requests (lower index == higher priority)\n");
 	for (i = GUC_CLIENT_PRIORITY_KMD_HIGH;
 	     i < GUC_CLIENT_PRIORITY_NUM; ++i) {
 		drm_printf(p, "\t\tNumber requests in priority band[%d]: %d\n",
-			   i, ce->guc_prio_count[i]);
+			   i, ce->guc_active.prio_count[i]);
 	}
 	drm_printf(p, "\n");
 }
diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index 0a77eb2944b5..6f882e72ed11 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -910,7 +910,7 @@ DECLARE_EVENT_CLASS(intel_context,
 			   __entry->guc_id = ce->guc_id;
 			   __entry->pin_count = atomic_read(&ce->pin_count);
 			   __entry->sched_state = ce->guc_state.sched_state;
-			   __entry->guc_prio = ce->guc_prio;
+			   __entry->guc_prio = ce->guc_active.prio;
 			   ),
 
 		    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x, guc_prio=%u",
-- 
2.25.1

