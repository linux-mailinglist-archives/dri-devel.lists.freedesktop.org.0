Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB063ED824
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 15:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6D989F89;
	Mon, 16 Aug 2021 13:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D3889E50;
 Mon, 16 Aug 2021 13:57:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="279607081"
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="279607081"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 06:56:59 -0700
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="441091184"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 06:56:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>
Subject: [PATCH 17/22] drm/i915/guc: Move guc_blocked fence to struct guc_state
Date: Mon, 16 Aug 2021 06:51:34 -0700
Message-Id: <20210816135139.10060-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816135139.10060-1-matthew.brost@intel.com>
References: <20210816135139.10060-1-matthew.brost@intel.com>
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

Move guc_blocked fence to struct guc_state as the lock which protects
the fence lives there.

s/ce->guc_blocked/ce->guc_state.blocked_fence/g

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c        |  5 +++--
 drivers/gpu/drm/i915/gt/intel_context_types.h  |  5 ++---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c  | 18 +++++++++---------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 745e84c72c90..0e48939ec85f 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -405,8 +405,9 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 	 * Initialize fence to be complete as this is expected to be complete
 	 * unless there is a pending schedule disable outstanding.
 	 */
-	i915_sw_fence_init(&ce->guc_blocked, sw_fence_dummy_notify);
-	i915_sw_fence_commit(&ce->guc_blocked);
+	i915_sw_fence_init(&ce->guc_state.blocked_fence,
+			   sw_fence_dummy_notify);
+	i915_sw_fence_commit(&ce->guc_state.blocked_fence);
 
 	i915_active_init(&ce->active,
 			 __intel_context_active, __intel_context_retire, 0);
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 3a73f3117873..c06171ee8792 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -167,6 +167,8 @@ struct intel_context {
 		 * fence related to GuC submission
 		 */
 		struct list_head fences;
+		/* GuC context blocked fence */
+		struct i915_sw_fence blocked_fence;
 	} guc_state;
 
 	struct {
@@ -190,9 +192,6 @@ struct intel_context {
 	 */
 	struct list_head guc_id_link;
 
-	/* GuC context blocked fence */
-	struct i915_sw_fence guc_blocked;
-
 	/*
 	 * GuC priority management
 	 */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9ae4633aa7cb..7aa16371908a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1482,24 +1482,24 @@ static void guc_blocked_fence_complete(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 
-	if (!i915_sw_fence_done(&ce->guc_blocked))
-		i915_sw_fence_complete(&ce->guc_blocked);
+	if (!i915_sw_fence_done(&ce->guc_state.blocked_fence))
+		i915_sw_fence_complete(&ce->guc_state.blocked_fence);
 }
 
 static void guc_blocked_fence_reinit(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
-	GEM_BUG_ON(!i915_sw_fence_done(&ce->guc_blocked));
+	GEM_BUG_ON(!i915_sw_fence_done(&ce->guc_state.blocked_fence));
 
 	/*
 	 * This fence is always complete unless a pending schedule disable is
 	 * outstanding. We arm the fence here and complete it when we receive
 	 * the pending schedule disable complete message.
 	 */
-	i915_sw_fence_fini(&ce->guc_blocked);
-	i915_sw_fence_reinit(&ce->guc_blocked);
-	i915_sw_fence_await(&ce->guc_blocked);
-	i915_sw_fence_commit(&ce->guc_blocked);
+	i915_sw_fence_fini(&ce->guc_state.blocked_fence);
+	i915_sw_fence_reinit(&ce->guc_state.blocked_fence);
+	i915_sw_fence_await(&ce->guc_state.blocked_fence);
+	i915_sw_fence_commit(&ce->guc_state.blocked_fence);
 }
 
 static u16 prep_context_pending_disable(struct intel_context *ce)
@@ -1539,7 +1539,7 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
 		if (enabled)
 			clr_context_enabled(ce);
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
-		return &ce->guc_blocked;
+		return &ce->guc_state.blocked_fence;
 	}
 
 	/*
@@ -1555,7 +1555,7 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
 	with_intel_runtime_pm(runtime_pm, wakeref)
 		__guc_context_sched_disable(guc, ce, guc_id);
 
-	return &ce->guc_blocked;
+	return &ce->guc_state.blocked_fence;
 }
 
 static void guc_context_unblock(struct intel_context *ce)
-- 
2.32.0

