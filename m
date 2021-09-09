Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC25405B7B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 18:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDE66E8DA;
	Thu,  9 Sep 2021 16:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A886E8C9;
 Thu,  9 Sep 2021 16:52:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="218988857"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="218988857"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 09:52:53 -0700
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="649003830"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 09:52:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <john.c.harrison@intel.com>,
	<daniele.ceraolospurio@intel.com>
Subject: [PATCH 13/23] drm/i915/guc: Don't touch guc_state.sched_state without
 a lock
Date: Thu,  9 Sep 2021 09:47:34 -0700
Message-Id: <20210909164744.31249-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210909164744.31249-1-matthew.brost@intel.com>
References: <20210909164744.31249-1-matthew.brost@intel.com>
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

v2:
 (kernel test robo )
  - Add __maybe_unused to sched_state_is_init()

v3: rebase after the unused code path removal has been moved to an
earlier patch.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 22 ++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index e036a171ff17..ca73128d7b4d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -151,11 +151,23 @@ static inline void clr_context_registered(struct intel_context *ce)
 
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
@@ -166,7 +178,7 @@ context_wait_for_deregister_to_register(struct intel_context *ce)
 static inline void
 set_context_wait_for_deregister_to_register(struct intel_context *ce)
 {
-	/* Only should be called from guc_lrc_desc_pin() without lock */
+	lockdep_assert_held(&ce->guc_state.lock);
 	ce->guc_state.sched_state |=
 		SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
 }
@@ -607,9 +619,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 	bool pending_disable, pending_enable, deregister, destroyed, banned;
 
 	xa_for_each(&guc->context_lookup, index, ce) {
-		/* Flush context */
 		spin_lock_irqsave(&ce->guc_state.lock, flags);
-		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
 		/*
 		 * Once we are at this point submission_disabled() is guaranteed
@@ -625,6 +635,8 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 		banned = context_banned(ce);
 		init_sched_state(ce);
 
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
 		if (pending_enable || destroyed || deregister) {
 			decr_outstanding_submission_g2h(guc);
 			if (deregister)
@@ -1324,6 +1336,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	int ret = 0;
 
 	GEM_BUG_ON(!engine->mask);
+	GEM_BUG_ON(!sched_state_is_init(ce));
 
 	/*
 	 * Ensure LRC + CT vmas are is same region as write barrier is done
@@ -1352,7 +1365,6 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	desc->priority = ce->guc_prio;
 	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
 	guc_context_policy_init(engine, desc);
-	init_sched_state(ce);
 
 	/*
 	 * The context_lookup xarray is used to determine if the hardware
-- 
2.32.0

