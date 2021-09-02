Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 684963FE6C3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 02:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D716E40F;
	Thu,  2 Sep 2021 00:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0993F6E40B;
 Thu,  2 Sep 2021 00:52:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="198468239"
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="198468239"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:52:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="646030155"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:52:40 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, John.C.Harrison@Intel.com,
 matthew.brost@intel.com
Subject: [PATCH v5 03/25] drm/i915/guc: Unwind context requests in reverse
 order
Date: Wed,  1 Sep 2021 17:50:00 -0700
Message-Id: <20210902005022.711767-4-daniele.ceraolospurio@intel.com>
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

When unwinding requests on a reset context, if other requests in the
context are in the priority list the requests could be resubmitted out
of seqno order. Traverse the list of active requests in reverse and
append to the head of the priority list to fix this.

Fixes: eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC interface")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index aff5dd247a88..0c1e6b465fba 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -806,9 +806,9 @@ __unwind_incomplete_requests(struct intel_context *ce)
 
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
 
@@ -825,7 +825,7 @@ __unwind_incomplete_requests(struct intel_context *ce)
 		}
 		GEM_BUG_ON(i915_sched_engine_is_empty(sched_engine));
 
-		list_add_tail(&rq->sched.link, pl);
+		list_add(&rq->sched.link, pl);
 		set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
 
 		spin_lock(&ce->guc_active.lock);
-- 
2.25.1

