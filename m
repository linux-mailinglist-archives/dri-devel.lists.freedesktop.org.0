Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F8342E073
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 19:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B896E845;
	Thu, 14 Oct 2021 17:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB3A6E845;
 Thu, 14 Oct 2021 17:49:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="225208228"
X-IronPort-AV: E=Sophos;i="5.85,373,1624345200"; d="scan'208";a="225208228"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 10:25:02 -0700
X-IronPort-AV: E=Sophos;i="5.85,373,1624345200"; d="scan'208";a="481360426"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 10:24:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <john.c.harrison@intel.com>
Subject: [PATCH 09/25] drm/i915/guc: Ensure GuC schedule operations do not
 operate on child contexts
Date: Thu, 14 Oct 2021 10:19:49 -0700
Message-Id: <20211014172005.27155-10-matthew.brost@intel.com>
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

In GuC parent-child contexts the parent context controls the scheduling,
ensure only the parent does the scheduling operations.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index d9f5be00e586..fbcf2dc2b2de 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -324,6 +324,12 @@ static inline void decr_context_committed_requests(struct intel_context *ce)
 	GEM_BUG_ON(ce->guc_state.number_committed_requests < 0);
 }
 
+static struct intel_context *
+request_to_scheduling_context(struct i915_request *rq)
+{
+	return intel_context_to_parent(rq->context);
+}
+
 static inline bool context_guc_id_invalid(struct intel_context *ce)
 {
 	return ce->guc_id.id == GUC_INVALID_LRC_ID;
@@ -1711,6 +1717,7 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
 
 	GEM_BUG_ON(guc_id == GUC_INVALID_LRC_ID);
 
+	GEM_BUG_ON(intel_context_is_child(ce));
 	trace_intel_context_sched_disable(ce);
 
 	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
@@ -1936,6 +1943,8 @@ static void guc_context_sched_disable(struct intel_context *ce)
 	intel_wakeref_t wakeref;
 	u16 guc_id;
 
+	GEM_BUG_ON(intel_context_is_child(ce));
+
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 
 	/*
@@ -2304,6 +2313,8 @@ static void guc_signal_context_fence(struct intel_context *ce)
 {
 	unsigned long flags;
 
+	GEM_BUG_ON(intel_context_is_child(ce));
+
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 	clr_context_wait_for_deregister_to_register(ce);
 	__guc_signal_context_fence(ce);
@@ -2334,7 +2345,7 @@ static void guc_context_init(struct intel_context *ce)
 
 static int guc_request_alloc(struct i915_request *rq)
 {
-	struct intel_context *ce = rq->context;
+	struct intel_context *ce = request_to_scheduling_context(rq);
 	struct intel_guc *guc = ce_to_guc(ce);
 	unsigned long flags;
 	int ret;
-- 
2.32.0

