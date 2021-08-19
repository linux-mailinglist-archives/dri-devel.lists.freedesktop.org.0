Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F03F3F1346
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 08:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86B26E884;
	Thu, 19 Aug 2021 06:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4783D6E4B5;
 Thu, 19 Aug 2021 06:21:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="216220746"
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="216220746"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 23:21:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="511675166"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 23:21:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>
Subject: [PATCH 03/27] drm/i915/guc: Unwind context requests in reverse order
Date: Wed, 18 Aug 2021 23:16:15 -0700
Message-Id: <20210819061639.21051-4-matthew.brost@intel.com>
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

When unwinding requests on a reset context, if other requests in the
context are in the priority list the requests could be resubmitted out
of seqno order. Traverse the list of active requests in reverse and
append to the head of the priority list to fix this.

Fixes: eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC interface")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 32c414aa9009..9ca0ba4ea85a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -805,9 +805,9 @@ __unwind_incomplete_requests(struct intel_context *ce)
 
 	spin_lock_irqsave(&sched_engine->lock, flags);
 	spin_lock(&ce->guc_active.lock);
-	list_for_each_entry_safe(rq, rn,
-				 &ce->guc_active.requests,
-				 sched.link) {
+	list_for_each_entry_safe_reverse(rq, rn,
+					 &ce->guc_active.requests,
+					 sched.link) {
 		if (i915_request_completed(rq))
 			continue;
 
@@ -824,7 +824,7 @@ __unwind_incomplete_requests(struct intel_context *ce)
 		}
 		GEM_BUG_ON(i915_sched_engine_is_empty(sched_engine));
 
-		list_add_tail(&rq->sched.link, pl);
+		list_add(&rq->sched.link, pl);
 		set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
 
 		spin_lock(&ce->guc_active.lock);
-- 
2.32.0

