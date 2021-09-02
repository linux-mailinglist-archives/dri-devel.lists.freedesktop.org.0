Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 541F33FE6D7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 02:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A113A6E423;
	Thu,  2 Sep 2021 00:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7416E42D;
 Thu,  2 Sep 2021 00:52:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="218923578"
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="218923578"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:52:45 -0700
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="646030179"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:52:45 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, John.C.Harrison@Intel.com,
 matthew.brost@intel.com
Subject: [PATCH v5 09/25] drm/i915/guc: Don't enable scheduling on a banned
 context, guc_id invalid, not registered
Date: Wed,  1 Sep 2021 17:50:06 -0700
Message-Id: <20210902005022.711767-10-daniele.ceraolospurio@intel.com>
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

When unblocking a context, do not enable scheduling if the context is
banned, guc_id invalid, or not registered.

v2:
 (Daniele)
  - Add helper for unblock

Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: <stable@vger.kernel.org>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index bd401a5be87c..f5bee833ee7d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -148,6 +148,7 @@ static inline void clr_context_registered(struct intel_context *ce)
 #define SCHED_STATE_BLOCKED_SHIFT			4
 #define SCHED_STATE_BLOCKED		BIT(SCHED_STATE_BLOCKED_SHIFT)
 #define SCHED_STATE_BLOCKED_MASK	(0xfff << SCHED_STATE_BLOCKED_SHIFT)
+
 static inline void init_sched_state(struct intel_context *ce)
 {
 	/* Only should be called from guc_lrc_desc_pin() */
@@ -1563,6 +1564,23 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
 	return &ce->guc_blocked;
 }
 
+#define SCHED_STATE_MULTI_BLOCKED_MASK \
+	(SCHED_STATE_BLOCKED_MASK & ~SCHED_STATE_BLOCKED)
+#define SCHED_STATE_NO_UNBLOCK \
+	(SCHED_STATE_MULTI_BLOCKED_MASK | \
+	 SCHED_STATE_PENDING_DISABLE | \
+	 SCHED_STATE_BANNED)
+
+static bool context_cant_unblock(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+
+	return (ce->guc_state.sched_state & SCHED_STATE_NO_UNBLOCK) ||
+		context_guc_id_invalid(ce) ||
+		!lrc_desc_registered(ce_to_guc(ce), ce->guc_id) ||
+		!intel_context_is_pinned(ce);
+}
+
 static void guc_context_unblock(struct intel_context *ce)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
@@ -1577,9 +1595,7 @@ static void guc_context_unblock(struct intel_context *ce)
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 
 	if (unlikely(submission_disabled(guc) ||
-		     !intel_context_is_pinned(ce) ||
-		     context_pending_disable(ce) ||
-		     context_blocked(ce) > 1)) {
+		     context_cant_unblock(ce))) {
 		enable = false;
 	} else {
 		enable = true;
-- 
2.25.1

