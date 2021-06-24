Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CA83B27C0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 08:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016236EA26;
	Thu, 24 Jun 2021 06:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AB16E9F3;
 Thu, 24 Jun 2021 06:47:29 +0000 (UTC)
IronPort-SDR: l4KHTO8SLTmPW0hbNOd6D6V7SrVDwGKsZSN0WQEXbo1lfzY0gOUIy4STnk7G8gvMn2mkVOpUSy
 Z6Y6y4y1W52Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207346751"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="207346751"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:25 -0700
IronPort-SDR: CU3yz/P530lfiPFp+uNm6vANlu2uis1+LWARx7lP646iyWwAPhIZyv6T/pyZkft7bp9Oq/cxwF
 4otdMa3DJsTw==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="556390899"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/47] drm/i915/guc: Add bypass tasklet submission path to GuC
Date: Thu, 24 Jun 2021 00:04:41 -0700
Message-Id: <20210624070516.21893-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210624070516.21893-1-matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
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
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 37 +++++++++++++++----
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index ee933efbf0ff..38aff83ee9fa 100644
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

