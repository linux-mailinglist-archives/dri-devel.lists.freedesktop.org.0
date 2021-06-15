Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC413A8A53
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 22:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9946B6E4A1;
	Tue, 15 Jun 2021 20:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CEA6E484;
 Tue, 15 Jun 2021 20:41:14 +0000 (UTC)
IronPort-SDR: MhDiDgBhzyJsws7WebBqC1RU41MCQ5y0t/WDb0n3FoReweqCWKF8WEaMhWhD59BObngnScd3sC
 Ytxd4S5squgA==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="267213981"
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="267213981"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 13:41:13 -0700
IronPort-SDR: PJVlvyBZKBsLlv7PAUzipU0ghrBZBJ/s3DdBodvSpLiK4+ntDiOB3FepDt3NDgoZ0lTdmgsDzB
 PND45EwYbN6Q==
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="484603198"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 13:41:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/8] drm/i915: Add i915_sched_engine_is_empty function
Date: Tue, 15 Jun 2021 13:58:54 -0700
Message-Id: <20210615205900.26578-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210615205900.26578-1-matthew.brost@intel.com>
References: <20210615205900.26578-1-matthew.brost@intel.com>
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
 Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add wrapper function around RB tree to determine if i915_sched_engine is
empty.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c            | 2 +-
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 6 +++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c    | 2 +-
 drivers/gpu/drm/i915/i915_scheduler.h                | 6 ++++++
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 49d44c3ac055..75a773cd4e24 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1289,7 +1289,7 @@ bool intel_engine_is_idle(struct intel_engine_cs *engine)
 	intel_engine_flush_submission(engine);
 
 	/* ELSP is empty, but there are ready requests? E.g. after reset */
-	if (!RB_EMPTY_ROOT(&engine->sched_engine->queue.rb_root))
+	if (!i915_sched_engine_is_empty(engine->sched_engine))
 		return false;
 
 	/* Ring stopped? */
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 4f759559a792..e36b0e81876a 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -384,7 +384,7 @@ __unwind_incomplete_requests(struct intel_engine_cs *engine)
 			prio = rq_prio(rq);
 			pl = i915_sched_lookup_priolist(engine, prio);
 		}
-		GEM_BUG_ON(RB_EMPTY_ROOT(&engine->sched_engine->queue.rb_root));
+		GEM_BUG_ON(i915_sched_engine_is_empty(engine->sched_engine));
 
 		list_move(&rq->sched.link, pl);
 		set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
@@ -1139,7 +1139,7 @@ static bool needs_timeslice(const struct intel_engine_cs *engine,
 	}
 
 	/* Otherwise, ELSP[0] is by itself, but may be waiting in the queue */
-	if (!RB_EMPTY_ROOT(&engine->sched_engine->queue.rb_root)) {
+	if (!i915_sched_engine_is_empty(engine->sched_engine)) {
 		ENGINE_TRACE(engine, "timeslice required for queue\n");
 		return true;
 	}
@@ -2487,7 +2487,7 @@ static void execlists_submit_request(struct i915_request *request)
 	} else {
 		queue_request(engine, request);
 
-		GEM_BUG_ON(RB_EMPTY_ROOT(&engine->sched_engine->queue.rb_root));
+		GEM_BUG_ON(i915_sched_engine_is_empty(engine->sched_engine));
 		GEM_BUG_ON(list_empty(&request->sched.link));
 
 		if (submit_queue(engine, request))
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 5c5f33f40055..d65a7665b38e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -515,7 +515,7 @@ static void guc_submit_request(struct i915_request *rq)
 
 	queue_request(engine, rq, rq_prio(rq));
 
-	GEM_BUG_ON(RB_EMPTY_ROOT(&engine->sched_engine->queue.rb_root));
+	GEM_BUG_ON(i915_sched_engine_is_empty(engine->sched_engine));
 	GEM_BUG_ON(list_empty(&rq->sched.link));
 
 	tasklet_hi_schedule(&engine->execlists.tasklet);
diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915/i915_scheduler.h
index 91a04e34cac5..5bec7b3b8456 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.h
+++ b/drivers/gpu/drm/i915/i915_scheduler.h
@@ -66,6 +66,12 @@ i915_sched_engine_put(struct i915_sched_engine *sched_engine)
 	kref_put(&sched_engine->ref, i915_sched_engine_free);
 }
 
+static inline bool
+i915_sched_engine_is_empty(struct i915_sched_engine *sched_engine)
+{
+	return RB_EMPTY_ROOT(&sched_engine->queue.rb_root);
+}
+
 void i915_request_show_with_schedule(struct drm_printer *m,
 				     const struct i915_request *rq,
 				     const char *prefix,
-- 
2.28.0

