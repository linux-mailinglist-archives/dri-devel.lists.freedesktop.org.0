Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C46375B10
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 21:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33E76ED64;
	Thu,  6 May 2021 18:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7977B6ED12;
 Thu,  6 May 2021 18:57:13 +0000 (UTC)
IronPort-SDR: gtuGl1/+8LP3IK36DdTRJlGDO+OlQzuxDhSvsOSUBwobLeQcYlt0VWlFEtek6/cGdrr6yBkR3A
 rZ3simZj1VDQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198195448"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="198195448"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:12 -0700
IronPort-SDR: N/HErizDbEjWYoOWv+0Ab/q2Qz4A9pJeyfKVuxnZx6brGziO/bGKzXSC5y1ZBEBHJc9cBOBpYn
 QxJs53rNI90w==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583496"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 45/97] drm/i915/guc: Add bypass tasklet submission path to
 GuC
Date: Thu,  6 May 2021 12:13:59 -0700
Message-Id: <20210506191451.77768-46-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bypass tasklet submission path to GuC. The tasklet is only used if H2G
channel has backpresure.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 37 +++++++++++++++----
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 0955a8b00ee8..2fd83562c1d1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -171,6 +171,12 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
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
@@ -214,8 +220,7 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
 	}
 done:
 	if (submit) {
-		last->context->lrc_reg_state[CTX_RING_TAIL] =
-			intel_ring_set_tail(last->ring, last->tail);
+		guc_set_lrc_tail(last);
 resubmit:
 		/*
 		 * We only check for -EBUSY here even though it is possible for
@@ -499,20 +504,36 @@ static inline void queue_request(struct i915_sched_engine *sched_engine,
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
-	i915_sched_engine_hi_kick(sched_engine);
+	if (guc->stalled_request || !i915_sched_engine_is_empty(sched_engine))
+		queue_request(sched_engine, rq, rq_prio(rq));
+	else if (guc_bypass_tasklet_submit(guc, rq) == -EBUSY)
+		i915_sched_engine_hi_kick(sched_engine);
 
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
-- 
2.28.0

