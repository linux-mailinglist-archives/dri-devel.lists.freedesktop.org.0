Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 692224211DB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 16:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA226EA14;
	Mon,  4 Oct 2021 14:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793896EA0C;
 Mon,  4 Oct 2021 14:45:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="248714013"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="248714013"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 07:37:23 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="622303705"
Received: from shearne-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.208.122])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 07:37:19 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [RFC 6/8] drm/i915: Make some recently added vfuncs use full
 scheduling attribute
Date: Mon,  4 Oct 2021 15:36:48 +0100
Message-Id: <20211004143650.699120-7-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004143650.699120-1-tvrtko.ursulin@linux.intel.com>
References: <20211004143650.699120-1-tvrtko.ursulin@linux.intel.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Code added in 71ed60112d5d ("drm/i915: Add kick_backend function to
i915_sched_engine") and ee242ca704d3 ("drm/i915/guc: Implement GuC
priority management") introduced some scheduling related vfuncs which
take integer request priority as argument.

Make them instead take struct i915_sched_attr, which is the type
encapsulating this information, so it probably aligns with the design
better. It definitely enables extending the set of scheduling attributes.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 4 +++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c    | 3 ++-
 drivers/gpu/drm/i915/i915_scheduler.c                | 4 ++--
 drivers/gpu/drm/i915/i915_scheduler_types.h          | 4 ++--
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 7147fe80919e..e91d803a6453 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3216,11 +3216,13 @@ static bool can_preempt(struct intel_engine_cs *engine)
 	return engine->class != RENDER_CLASS;
 }
 
-static void kick_execlists(const struct i915_request *rq, int prio)
+static void kick_execlists(const struct i915_request *rq,
+			   const struct i915_sched_attr *attr)
 {
 	struct intel_engine_cs *engine = rq->engine;
 	struct i915_sched_engine *sched_engine = engine->sched_engine;
 	const struct i915_request *inflight;
+	const int prio = attr->priority;
 
 	/*
 	 * We only need to kick the tasklet once for the high priority
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index ba0de35f6323..b5883a4365ca 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2414,9 +2414,10 @@ static void guc_init_breadcrumbs(struct intel_engine_cs *engine)
 }
 
 static void guc_bump_inflight_request_prio(struct i915_request *rq,
-					   int prio)
+					   const struct i915_sched_attr *attr)
 {
 	struct intel_context *ce = rq->context;
+	const int prio = attr->priority;
 	u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
 
 	/* Short circuit function */
diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index 762127dd56c5..534bab99fcdc 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -255,7 +255,7 @@ static void __i915_schedule(struct i915_sched_node *node,
 
 		/* Must be called before changing the nodes priority */
 		if (sched_engine->bump_inflight_request_prio)
-			sched_engine->bump_inflight_request_prio(from, prio);
+			sched_engine->bump_inflight_request_prio(from, attr);
 
 		WRITE_ONCE(node->attr.priority, prio);
 
@@ -280,7 +280,7 @@ static void __i915_schedule(struct i915_sched_node *node,
 
 		/* Defer (tasklet) submission until after all of our updates. */
 		if (sched_engine->kick_backend)
-			sched_engine->kick_backend(node_to_request(node), prio);
+			sched_engine->kick_backend(node_to_request(node), attr);
 	}
 
 	spin_unlock(&sched_engine->lock);
diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
index b0a1b58c7893..24b9ac1c2ce2 100644
--- a/drivers/gpu/drm/i915/i915_scheduler_types.h
+++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
@@ -177,13 +177,13 @@ struct i915_sched_engine {
 	 * @kick_backend: kick backend after a request's priority has changed
 	 */
 	void	(*kick_backend)(const struct i915_request *rq,
-				int prio);
+				const struct i915_sched_attr *attr);
 
 	/**
 	 * @bump_inflight_request_prio: update priority of an inflight request
 	 */
 	void	(*bump_inflight_request_prio)(struct i915_request *rq,
-					      int prio);
+					      const struct i915_sched_attr *attr);
 
 	/**
 	 * @retire_inflight_request_prio: indicate request is retired to
-- 
2.30.2

