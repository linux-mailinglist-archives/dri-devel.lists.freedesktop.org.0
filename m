Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE79498319
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 16:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8884710EB2C;
	Mon, 24 Jan 2022 15:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF9010E820;
 Mon, 24 Jan 2022 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643036867; x=1674572867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uWF8racyBQiCPZWcoEqZ5/KkqctftsowIadMFWSBWg0=;
 b=Zze1jvMOnsf7fg5imJwfkDSgBQc9r2QQINi93CH3lDhJ+/cki3HSbuii
 sMDMHfDMGwWp4YHG+xUTu9Amfx092xqjMeB+wsY8Ul726EBmX+m583nC+
 TXk/JZx7oTLSv3pBfXdKbNvUK7Bl1FcDTvdU2NUW+cC9/3GgJjZxlbEwc
 1IQrW//I5HQYZ3Mx2kJExS4HPo4VEdxdw+1T6SUpv5ps09wT2yP83Dw56
 rO66telqqfRniTFS1p3cwpkv2SyXa7QwB7JaX9Sw1hsdu23F4pAkV+1Wr
 PBCW7k1qkyTLd11zVIODJZLtN3ZixIgtP1WIOxO64Tr/pepqYYInyXb6Y Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="246282840"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="246282840"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 07:07:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="532104895"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 07:07:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/i915/guc: Cancel requests immediately
Date: Mon, 24 Jan 2022 07:01:55 -0800
Message-Id: <20220124150157.15758-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124150157.15758-1-matthew.brost@intel.com>
References: <20220124150157.15758-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 tvrtko.ursulin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change the preemption timeout to the smallest possible value (1 us) when
disabling scheduling to cancel a request and restore it after
cancellation. This not only cancels the request as fast as possible, it
fixes a bug where the preemption timeout is 0 which results in the
schedule disable hanging forever.

Reported-by: Jani Saarinen <jani.saarinen@intel.com>
Fixes: 62eaf0ae217d4 ("drm/i915/guc: Support request cancellation")
Link: https://gitlab.freedesktop.org/drm/intel/-/issues/4960
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context_types.h |  5 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 46 +++++++++++--------
 2 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 30cd81ad8911a..730998823dbea 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -198,6 +198,11 @@ struct intel_context {
 		 * each priority bucket
 		 */
 		u32 prio_count[GUC_CLIENT_PRIORITY_NUM];
+		/**
+		 * @preemption_timeout: preemption timeout of the context, used
+		 * to restore this value after request cancellation
+		 */
+		u32 preemption_timeout;
 	} guc_state;
 
 	struct {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 3918f1be114fa..966947c450253 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2147,7 +2147,8 @@ static inline u32 get_children_join_value(struct intel_context *ce,
 	return __get_parent_scratch(ce)->join[child_index].semaphore;
 }
 
-static void guc_context_policy_init(struct intel_engine_cs *engine,
+static void guc_context_policy_init(struct intel_context *ce,
+				    struct intel_engine_cs *engine,
 				    struct guc_lrc_desc *desc)
 {
 	desc->policy_flags = 0;
@@ -2157,7 +2158,8 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
 
 	/* NB: For both of these, zero means disabled. */
 	desc->execution_quantum = engine->props.timeslice_duration_ms * 1000;
-	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
+	ce->guc_state.preemption_timeout = engine->props.preempt_timeout_ms * 1000;
+	desc->preemption_timeout = ce->guc_state.preemption_timeout;
 }
 
 static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
@@ -2193,7 +2195,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	desc->hw_context_desc = ce->lrc.lrca;
 	desc->priority = ce->guc_state.prio;
 	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
-	guc_context_policy_init(engine, desc);
+	guc_context_policy_init(ce, engine, desc);
 
 	/*
 	 * If context is a parent, we need to register a process descriptor
@@ -2226,7 +2228,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 			desc->hw_context_desc = child->lrc.lrca;
 			desc->priority = ce->guc_state.prio;
 			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
-			guc_context_policy_init(engine, desc);
+			guc_context_policy_init(child, engine, desc);
 		}
 
 		clear_children_join_go_memory(ce);
@@ -2409,6 +2411,19 @@ static u16 prep_context_pending_disable(struct intel_context *ce)
 	return ce->guc_id.id;
 }
 
+static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
+						 u16 guc_id,
+						 u32 preemption_timeout)
+{
+	u32 action[] = {
+		INTEL_GUC_ACTION_SET_CONTEXT_PREEMPTION_TIMEOUT,
+		guc_id,
+		preemption_timeout
+	};
+
+	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
+}
+
 static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
@@ -2442,8 +2457,10 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
 
 	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
-	with_intel_runtime_pm(runtime_pm, wakeref)
+	with_intel_runtime_pm(runtime_pm, wakeref) {
+		__guc_context_set_preemption_timeout(guc, guc_id, 1);
 		__guc_context_sched_disable(guc, ce, guc_id);
+	}
 
 	return &ce->guc_state.blocked;
 }
@@ -2492,8 +2509,10 @@ static void guc_context_unblock(struct intel_context *ce)
 
 	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
-	if (enable) {
-		with_intel_runtime_pm(runtime_pm, wakeref)
+	with_intel_runtime_pm(runtime_pm, wakeref) {
+		__guc_context_set_preemption_timeout(guc, ce->guc_id.id,
+						     ce->guc_state.preemption_timeout);
+		if (enable)
 			__guc_context_sched_enable(guc, ce);
 	}
 }
@@ -2521,19 +2540,6 @@ static void guc_context_cancel_request(struct intel_context *ce,
 	}
 }
 
-static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
-						 u16 guc_id,
-						 u32 preemption_timeout)
-{
-	u32 action[] = {
-		INTEL_GUC_ACTION_SET_CONTEXT_PREEMPTION_TIMEOUT,
-		guc_id,
-		preemption_timeout
-	};
-
-	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
-}
-
 static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
-- 
2.34.1

