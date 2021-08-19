Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBD13F136B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 08:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CC46E961;
	Thu, 19 Aug 2021 06:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5166E51D;
 Thu, 19 Aug 2021 06:21:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="216220759"
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="216220759"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 23:21:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="511675177"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 23:21:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>
Subject: [PATCH 14/27] drm/i915/guc: Don't touch guc_state.sched_state without
 a lock
Date: Wed, 18 Aug 2021 23:16:26 -0700
Message-Id: <20210819061639.21051-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210819061639.21051-1-matthew.brost@intel.com>
References: <20210819061639.21051-1-matthew.brost@intel.com>
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

Before we did some clever tricks to not use the a lock when touching
guc_state.sched_state in certain cases. Don't do that, enforce the use
of the lock.

Part of this is removing a dead code path from guc_lrc_desc_pin where a
context could be deregistered when the aforementioned function was
called from the submission path. Remove this dead code and add a
GEM_BUG_ON if this path is ever attempted to be used.

v2:
 (kernel test robo )
  - Add __maybe_unused to sched_state_is_init()

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 58 ++++++++++---------
 1 file changed, 32 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 85f96d325048..fa87470ea576 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -150,11 +150,23 @@ static inline void clr_context_registered(struct intel_context *ce)
 #define SCHED_STATE_BLOCKED_MASK	(0xfff << SCHED_STATE_BLOCKED_SHIFT)
 static inline void init_sched_state(struct intel_context *ce)
 {
-	/* Only should be called from guc_lrc_desc_pin() */
+	lockdep_assert_held(&ce->guc_state.lock);
 	atomic_set(&ce->guc_sched_state_no_lock, 0);
 	ce->guc_state.sched_state &= SCHED_STATE_BLOCKED_MASK;
 }
 
+__maybe_unused
+static bool sched_state_is_init(struct intel_context *ce)
+{
+	/*
+	 * XXX: Kernel contexts can have SCHED_STATE_NO_LOCK_REGISTERED after
+	 * suspend.
+	 */
+	return !(atomic_read(&ce->guc_sched_state_no_lock) &
+		 ~SCHED_STATE_NO_LOCK_REGISTERED) &&
+		!(ce->guc_state.sched_state &= ~SCHED_STATE_BLOCKED_MASK);
+}
+
 static inline bool
 context_wait_for_deregister_to_register(struct intel_context *ce)
 {
@@ -165,7 +177,7 @@ context_wait_for_deregister_to_register(struct intel_context *ce)
 static inline void
 set_context_wait_for_deregister_to_register(struct intel_context *ce)
 {
-	/* Only should be called from guc_lrc_desc_pin() without lock */
+	lockdep_assert_held(&ce->guc_state.lock);
 	ce->guc_state.sched_state |=
 		SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
 }
@@ -605,9 +617,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 	bool pending_disable, pending_enable, deregister, destroyed, banned;
 
 	xa_for_each(&guc->context_lookup, index, ce) {
-		/* Flush context */
 		spin_lock_irqsave(&ce->guc_state.lock, flags);
-		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
 		/*
 		 * Once we are at this point submission_disabled() is guaranteed
@@ -623,6 +633,8 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 		banned = context_banned(ce);
 		init_sched_state(ce);
 
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
 		if (pending_enable || destroyed || deregister) {
 			decr_outstanding_submission_g2h(guc);
 			if (deregister)
@@ -1325,6 +1337,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	int ret = 0;
 
 	GEM_BUG_ON(!engine->mask);
+	GEM_BUG_ON(!sched_state_is_init(ce));
 
 	/*
 	 * Ensure LRC + CT vmas are is same region as write barrier is done
@@ -1353,7 +1366,6 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	desc->priority = ce->guc_prio;
 	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
 	guc_context_policy_init(engine, desc);
-	init_sched_state(ce);
 
 	/*
 	 * The context_lookup xarray is used to determine if the hardware
@@ -1364,26 +1376,23 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	 * registering this context.
 	 */
 	if (context_registered) {
+		bool disabled;
+		unsigned long flags;
+
 		trace_intel_context_steal_guc_id(ce);
-		if (!loop) {
+		GEM_BUG_ON(!loop);
+
+		/* Seal race with Reset */
+		spin_lock_irqsave(&ce->guc_state.lock, flags);
+		disabled = submission_disabled(guc);
+		if (likely(!disabled)) {
 			set_context_wait_for_deregister_to_register(ce);
 			intel_context_get(ce);
-		} else {
-			bool disabled;
-			unsigned long flags;
-
-			/* Seal race with Reset */
-			spin_lock_irqsave(&ce->guc_state.lock, flags);
-			disabled = submission_disabled(guc);
-			if (likely(!disabled)) {
-				set_context_wait_for_deregister_to_register(ce);
-				intel_context_get(ce);
-			}
-			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
-			if (unlikely(disabled)) {
-				reset_lrc_desc(guc, desc_idx);
-				return 0;	/* Will get registered later */
-			}
+		}
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+		if (unlikely(disabled)) {
+			reset_lrc_desc(guc, desc_idx);
+			return 0;	/* Will get registered later */
 		}
 
 		/*
@@ -1392,10 +1401,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 		 */
 		with_intel_runtime_pm(runtime_pm, wakeref)
 			ret = deregister_context(ce, ce->guc_id, loop);
-		if (unlikely(ret == -EBUSY)) {
-			clr_context_wait_for_deregister_to_register(ce);
-			intel_context_put(ce);
-		} else if (unlikely(ret == -ENODEV)) {
+		if (unlikely(ret == -ENODEV)) {
 			ret = 0;	/* Will get registered later */
 		}
 	} else {
-- 
2.32.0

