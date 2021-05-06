Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C20375B0D
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDA86EDC2;
	Thu,  6 May 2021 18:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCCD6ED14;
 Thu,  6 May 2021 18:57:13 +0000 (UTC)
IronPort-SDR: iH6zIqIwyvqNCIR40PFcu7PPryheynF7vqOZUD7F5N9CWWdY/K4nPpXEAsUdn9MeZzf5Bzn6Jg
 CnOuxuCH8ndg==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531015"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531015"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:12 -0700
IronPort-SDR: 9xklbKi5tFlLEmeWQM+zNQg8j9Yq8VNT+cRvZh5uRJS5kFaWTEZCW6RvatoVk74YnyT/UTxZlV
 c3J/5vzyWkNg==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583507"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 48/97] drm/i915/guc: Defer context unpin until scheduling
 is disabled
Date: Thu,  6 May 2021 12:14:02 -0700
Message-Id: <20210506191451.77768-49-matthew.brost@intel.com>
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

With GuC scheduling, it isn't safe to unpin a context while scheduling
is enabled for that context as the GuC may touch some of the pinned
state (e.g. LRC). To ensure scheduling isn't enabled when an unpin is
done, a call back is added to intel_context_unpin when pin count == 1
to disable scheduling for that context. When the response CTB is
received it is safe to do the final unpin.

Future patches may add a heuristic / delay to schedule the disable
call back to avoid thrashing on schedule enable / disable.

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       |   4 +-
 drivers/gpu/drm/i915/gt/intel_context.h       |  21 ++-
 drivers/gpu/drm/i915/gt/intel_context_types.h |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |   6 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 145 +++++++++++++++++-
 6 files changed, 176 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index f750c826e19d..1499b8aace2a 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -306,9 +306,9 @@ int __intel_context_do_pin(struct intel_context *ce)
 	return err;
 }
 
-void intel_context_unpin(struct intel_context *ce)
+void __intel_context_do_unpin(struct intel_context *ce, int sub)
 {
-	if (!atomic_dec_and_test(&ce->pin_count))
+	if (!atomic_sub_and_test(sub, &ce->pin_count))
 		return;
 
 	CE_TRACE(ce, "unpin\n");
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index f83a73a2b39f..92ecbab8c1cd 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -113,7 +113,26 @@ static inline void __intel_context_pin(struct intel_context *ce)
 	atomic_inc(&ce->pin_count);
 }
 
-void intel_context_unpin(struct intel_context *ce);
+void __intel_context_do_unpin(struct intel_context *ce, int sub);
+
+static inline void intel_context_sched_disable_unpin(struct intel_context *ce)
+{
+	__intel_context_do_unpin(ce, 2);
+}
+
+static inline void intel_context_unpin(struct intel_context *ce)
+{
+	if (!ce->ops->sched_disable) {
+		__intel_context_do_unpin(ce, 1);
+	} else {
+		while (!atomic_add_unless(&ce->pin_count, -1, 1)) {
+			if (atomic_cmpxchg(&ce->pin_count, 1, 2) == 1) {
+				ce->ops->sched_disable(ce);
+				break;
+			}
+		}
+	}
+}
 
 void intel_context_enter_engine(struct intel_context *ce);
 void intel_context_exit_engine(struct intel_context *ce);
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index beafe55a9101..e7af6a2368f8 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -43,6 +43,8 @@ struct intel_context_ops {
 	void (*enter)(struct intel_context *ce);
 	void (*exit)(struct intel_context *ce);
 
+	void (*sched_disable)(struct intel_context *ce);
+
 	void (*reset)(struct intel_context *ce);
 	void (*destroy)(struct kref *kref);
 };
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 85ff32bfd074..55f02dd1598d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -237,6 +237,8 @@ int intel_guc_reset_engine(struct intel_guc *guc,
 
 int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 					  const u32 *msg, u32 len);
+int intel_guc_sched_done_process_msg(struct intel_guc *guc,
+				     const u32 *msg, u32 len);
 
 void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 51c5efdf543a..8e48bf260eab 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -900,6 +900,12 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 			CT_ERROR(ct, "deregister context failed %x %*ph\n",
 				  action, 4 * len, payload);
 		break;
+	case INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
+		ret = intel_guc_sched_done_process_msg(guc, payload, len);
+		if (unlikely(ret))
+			CT_ERROR(ct, "schedule context failed %x %*ph\n",
+				  action, 4 * len, payload);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b4c439025a5f..2afc49caf462 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -69,6 +69,7 @@
  * context, to be executing simultaneously.
  */
 #define SCHED_STATE_NO_LOCK_ENABLED			BIT(0)
+#define SCHED_STATE_NO_LOCK_PENDING_ENABLE		BIT(1)
 static inline bool context_enabled(struct intel_context *ce)
 {
 	return (atomic_read(&ce->guc_sched_state_no_lock) &
@@ -86,6 +87,24 @@ static inline void clr_context_enabled(struct intel_context *ce)
 		   &ce->guc_sched_state_no_lock);
 }
 
+static inline bool context_pending_enable(struct intel_context *ce)
+{
+	return (atomic_read(&ce->guc_sched_state_no_lock) &
+		SCHED_STATE_NO_LOCK_PENDING_ENABLE);
+}
+
+static inline void set_context_pending_enable(struct intel_context *ce)
+{
+	atomic_or(SCHED_STATE_NO_LOCK_PENDING_ENABLE,
+		  &ce->guc_sched_state_no_lock);
+}
+
+static inline void clr_context_pending_enable(struct intel_context *ce)
+{
+	atomic_and((u32)~SCHED_STATE_NO_LOCK_PENDING_ENABLE,
+		   &ce->guc_sched_state_no_lock);
+}
+
 /*
  * Below is a set of functions which control the GuC scheduling state which
  * require a lock, aside from the special case where the functions are called
@@ -94,6 +113,7 @@ static inline void clr_context_enabled(struct intel_context *ce)
  */
 #define SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER	BIT(0)
 #define SCHED_STATE_DESTROYED				BIT(1)
+#define SCHED_STATE_PENDING_DISABLE			BIT(2)
 static inline void init_sched_state(struct intel_context *ce)
 {
 	/* Only should be called from guc_lrc_desc_pin() */
@@ -138,6 +158,24 @@ set_context_destroyed(struct intel_context *ce)
 	ce->guc_state.sched_state |= SCHED_STATE_DESTROYED;
 }
 
+static inline bool context_pending_disable(struct intel_context *ce)
+{
+	return (ce->guc_state.sched_state & SCHED_STATE_PENDING_DISABLE);
+}
+
+static inline void set_context_pending_disable(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state |= SCHED_STATE_PENDING_DISABLE;
+}
+
+static inline void clr_context_pending_disable(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state =
+		(ce->guc_state.sched_state & ~SCHED_STATE_PENDING_DISABLE);
+}
+
 static inline bool context_guc_id_invalid(struct intel_context *ce)
 {
 	return (ce->guc_id == GUC_INVALID_LRC_ID);
@@ -230,6 +268,8 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
 		action[len++] = ce->guc_id;
 		action[len++] = GUC_CONTEXT_ENABLE;
+		set_context_pending_enable(ce);
+		intel_context_get(ce);
 	} else {
 		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT;
 		action[len++] = ce->guc_id;
@@ -237,8 +277,12 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 
 	err = intel_guc_send_nb(guc, action, len);
 
-	if (!enabled && !err)
+	if (!enabled && !err) {
 		set_context_enabled(ce);
+	} else if (!enabled) {
+		clr_context_pending_enable(ce);
+		intel_context_put(ce);
+	}
 
 	return err;
 }
@@ -834,6 +878,60 @@ static void guc_context_post_unpin(struct intel_context *ce)
 	lrc_post_unpin(ce);
 }
 
+static void __guc_context_sched_disable(struct intel_guc *guc,
+					struct intel_context *ce,
+					u16 guc_id)
+{
+	u32 action[] = {
+		INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET,
+		guc_id,	/* ce->guc_id not stable */
+		GUC_CONTEXT_DISABLE
+	};
+
+	GEM_BUG_ON(guc_id == GUC_INVALID_LRC_ID);
+
+	intel_context_get(ce);
+
+	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), true);
+}
+
+static u16 prep_context_pending_disable(struct intel_context *ce)
+{
+	set_context_pending_disable(ce);
+	clr_context_enabled(ce);
+
+	return ce->guc_id;
+}
+
+static void guc_context_sched_disable(struct intel_context *ce)
+{
+	struct intel_guc *guc = ce_to_guc(ce);
+	struct intel_runtime_pm *runtime_pm = &ce->engine->gt->i915->runtime_pm;
+	unsigned long flags;
+	u16 guc_id;
+	intel_wakeref_t wakeref;
+
+	if (context_guc_id_invalid(ce) ||
+	    !lrc_desc_registered(guc, ce->guc_id)) {
+		clr_context_enabled(ce);
+		goto unpin;
+	}
+
+	if (!context_enabled(ce))
+		goto unpin;
+
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	guc_id = prep_context_pending_disable(ce);
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
+	with_intel_runtime_pm(runtime_pm, wakeref)
+		__guc_context_sched_disable(guc, ce, guc_id);
+
+	return;
+unpin:
+	intel_context_sched_disable_unpin(ce);
+}
+
 static inline void guc_lrc_desc_unpin(struct intel_context *ce)
 {
 	struct intel_engine_cs *engine = ce->engine;
@@ -842,6 +940,7 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
 
 	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id));
 	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id));
+	GEM_BUG_ON(context_enabled(ce));
 
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 	set_context_destroyed(ce);
@@ -923,6 +1022,8 @@ static const struct intel_context_ops guc_context_ops = {
 	.enter = intel_context_enter_engine,
 	.exit = intel_context_exit_engine,
 
+	.sched_disable = guc_context_sched_disable,
+
 	.reset = lrc_reset,
 	.destroy = guc_context_destroy,
 };
@@ -1356,3 +1457,45 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 
 	return 0;
 }
+
+int intel_guc_sched_done_process_msg(struct intel_guc *guc,
+				     const u32 *msg,
+				     u32 len)
+{
+	struct intel_context *ce;
+	unsigned long flags;
+	u32 desc_idx = msg[0];
+
+	if (unlikely(len < 2)) {
+		drm_dbg(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
+		return -EPROTO;
+	}
+
+	ce = g2h_context_lookup(guc, desc_idx);
+	if (unlikely(!ce))
+		return -EPROTO;
+
+	if (unlikely(context_destroyed(ce) ||
+		     (!context_pending_enable(ce) &&
+		     !context_pending_disable(ce)))) {
+		drm_dbg(&guc_to_gt(guc)->i915->drm,
+			"Bad context sched_state 0x%x, 0x%x, desc_idx %u",
+			atomic_read(&ce->guc_sched_state_no_lock),
+			ce->guc_state.sched_state, desc_idx);
+		return -EPROTO;
+	}
+
+	if (context_pending_enable(ce)) {
+		clr_context_pending_enable(ce);
+	} else if (context_pending_disable(ce)) {
+		intel_context_sched_disable_unpin(ce);
+
+		spin_lock_irqsave(&ce->guc_state.lock, flags);
+		clr_context_pending_disable(ce);
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+	}
+
+	intel_context_put(ce);
+
+	return 0;
+}
-- 
2.28.0

