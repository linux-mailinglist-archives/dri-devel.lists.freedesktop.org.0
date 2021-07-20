Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A42F3D047C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 00:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CBE6E5D5;
	Tue, 20 Jul 2021 22:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6456E591;
 Tue, 20 Jul 2021 22:21:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="211056150"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="211056150"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 15:21:32 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="500940110"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 15:21:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/18] drm/i915/guc: Add bypass tasklet submission path to GuC
Date: Tue, 20 Jul 2021 15:39:08 -0700
Message-Id: <20210720223921.56160-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210720223921.56160-1-matthew.brost@intel.com>
References: <20210720223921.56160-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bypass tasklet submission path to GuC. The tasklet is only used if H2G
channel has backpresure.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 37 +++++++++++++++----
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index ca0717166a27..53b4a5eb4a85 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -172,6 +172,12 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 	return err;
 }
 
+static inline void guc_set_lrc_tail(struct i915_request *rq)
+{
+	rq->context->lrc_reg_state[CTX_RING_TAIL] =
+		intel_ring_set_tail(rq->ring, rq->tail);
+}
+
 static inline int rq_prio(const struct i915_request *rq)
 {
 	return rq->sched.attr.priority;
@@ -215,8 +221,7 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
 	}
 done:
 	if (submit) {
-		last->context->lrc_reg_state[CTX_RING_TAIL] =
-			intel_ring_set_tail(last->ring, last->tail);
+		guc_set_lrc_tail(last);
 resubmit:
 		/*
 		 * We only check for -EBUSY here even though it is possible for
@@ -496,20 +501,36 @@ static inline void queue_request(struct i915_sched_engine *sched_engine,
 	set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
 }
 
+static int guc_bypass_tasklet_submit(struct intel_guc *guc,
+				     struct i915_request *rq)
+{
+	int ret;
+
+	__i915_request_submit(rq);
+
+	trace_i915_request_in(rq, 0);
+
+	guc_set_lrc_tail(rq);
+	ret = guc_add_request(guc, rq);
+	if (ret == -EBUSY)
+		guc->stalled_request = rq;
+
+	return ret;
+}
+
 static void guc_submit_request(struct i915_request *rq)
 {
 	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
+	struct intel_guc *guc = &rq->engine->gt->uc.guc;
 	unsigned long flags;
 
 	/* Will be called from irq-context when using foreign fences. */
 	spin_lock_irqsave(&sched_engine->lock, flags);
 
-	queue_request(sched_engine, rq, rq_prio(rq));
-
-	GEM_BUG_ON(i915_sched_engine_is_empty(sched_engine));
-	GEM_BUG_ON(list_empty(&rq->sched.link));
-
-	tasklet_hi_schedule(&sched_engine->tasklet);
+	if (guc->stalled_request || !i915_sched_engine_is_empty(sched_engine))
+		queue_request(sched_engine, rq, rq_prio(rq));
+	else if (guc_bypass_tasklet_submit(guc, rq) == -EBUSY)
+		tasklet_hi_schedule(&sched_engine->tasklet);
 
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
-- 
2.28.0

