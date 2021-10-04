Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEAC42124C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 17:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B266EA20;
	Mon,  4 Oct 2021 15:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0416EA1E;
 Mon,  4 Oct 2021 15:07:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="222904910"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="222904910"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 07:37:23 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="622303721"
Received: from shearne-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.208.122])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 07:37:21 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: [RFC 7/8] drm/i915: Inherit process nice for context scheduling
 priority
Date: Mon,  4 Oct 2021 15:36:49 +0100
Message-Id: <20211004143650.699120-8-tvrtko.ursulin@linux.intel.com>
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

Introduce the concept of context nice value which matches the process
nice.

We do this by extending the struct i915_sched_attr and add a helper
(i915_sched_attr_priority) to be used to convert to effective priority
when used by backend code and for priority sorting.

Context nice is then inherited from the process which creates the GEM
context and utilised secondary to context priority, only when the latter
has been left at the default setting, in order to avoid disturbing any
application made choices of low and high (batch processing and maybe
latency sensitive compositing). In those cases nice value adjusts the
effective priority in the narrow band of -19 to +20 around
I915_CONTEXT_DEFAULT_PRIORITY.

This means that in theory userspace using the context priority uapi
directly has a wider range of possible adjustments (thought to be
beneficial), but in practice that only applies to execlists platforms.
With GuC there are only three priority buckets (less than zero is low
priority, zero is normal and greater than zero is high) which therefore
interact as expected with the nice adjustment. It makes the question of
should the nice be a sub-range of GEM priorities, or stretched across the
whole, a moot one.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  1 +
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  2 +-
 drivers/gpu/drm/i915/i915_request.c                |  2 +-
 drivers/gpu/drm/i915/i915_request.h                |  5 +++++
 drivers/gpu/drm/i915/i915_scheduler.c              | 12 ++++++++----
 drivers/gpu/drm/i915/i915_scheduler.h              | 14 ++++++++++++++
 drivers/gpu/drm/i915/i915_scheduler_types.h        |  8 ++++++++
 8 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 8d4d687ab1d0..fed0733cb652 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -257,6 +257,7 @@ proto_context_create(struct drm_i915_private *i915, unsigned int flags)
 	if (i915->params.enable_hangcheck)
 		pc->user_flags |= BIT(UCONTEXT_PERSISTENCE);
 	pc->sched.priority = I915_PRIORITY_NORMAL;
+	pc->sched.nice = task_nice(current);
 
 	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
 		if (!HAS_EXECLISTS(i915)) {
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index e91d803a6453..1a02c65823a7 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -250,7 +250,7 @@ static struct i915_priolist *to_priolist(struct rb_node *rb)
 
 static int rq_prio(const struct i915_request *rq)
 {
-	return READ_ONCE(rq->sched.attr.priority);
+	return i915_request_priority(rq);
 }
 
 static int effective_prio(const struct i915_request *rq)
@@ -3221,8 +3221,8 @@ static void kick_execlists(const struct i915_request *rq,
 {
 	struct intel_engine_cs *engine = rq->engine;
 	struct i915_sched_engine *sched_engine = engine->sched_engine;
+	const int prio = i915_sched_attr_priority(attr);
 	const struct i915_request *inflight;
-	const int prio = attr->priority;
 
 	/*
 	 * We only need to kick the tasklet once for the high priority
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b5883a4365ca..f258607685a2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2417,7 +2417,7 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
 					   const struct i915_sched_attr *attr)
 {
 	struct intel_context *ce = rq->context;
-	const int prio = attr->priority;
+	const int prio = i915_sched_attr_priority(attr);
 	u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
 
 	/* Short circuit function */
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 79da5eca60af..a8c6f3a64895 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1930,7 +1930,7 @@ static int print_sched_attr(const struct i915_sched_attr *attr,
 		return x;
 
 	x += snprintf(buf + x, len - x,
-		      " prio=%d", attr->priority);
+		      " prio=%d nice=%d", attr->priority, attr->nice);
 
 	return x;
 }
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 7bd9ed20623e..c2c4c344837e 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -399,6 +399,11 @@ long i915_request_wait(struct i915_request *rq,
 #define I915_WAIT_PRIORITY	BIT(1) /* small priority bump for the request */
 #define I915_WAIT_ALL		BIT(2) /* used by i915_gem_object_wait() */
 
+static inline int i915_request_priority(const struct i915_request *rq)
+{
+	return i915_sched_attr_priority(&rq->sched.attr);
+}
+
 void i915_request_show(struct drm_printer *m,
 		       const struct i915_request *rq,
 		       const char *prefix,
diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index 534bab99fcdc..e75793e36454 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -155,7 +155,9 @@ lock_sched_engine(struct i915_sched_node *node,
 static void __i915_schedule(struct i915_sched_node *node,
 			    const struct i915_sched_attr *attr)
 {
-	const int prio = max(attr->priority, node->attr.priority);
+	const int prio =
+		max(i915_sched_attr_priority(attr),
+		    i915_sched_attr_priority(&node->attr));
 	struct i915_sched_engine *sched_engine;
 	struct i915_dependency *dep, *p;
 	struct i915_dependency stack;
@@ -209,7 +211,7 @@ static void __i915_schedule(struct i915_sched_node *node,
 			if (node_signaled(p->signaler))
 				continue;
 
-			if (prio > READ_ONCE(p->signaler->attr.priority))
+			if (prio > i915_sched_attr_priority(&p->signaler->attr))
 				list_move_tail(&p->dfs_link, &dfs);
 		}
 	}
@@ -247,7 +249,8 @@ static void __i915_schedule(struct i915_sched_node *node,
 		lockdep_assert_held(&sched_engine->lock);
 
 		/* Recheck after acquiring the engine->timeline.lock */
-		if (prio <= node->attr.priority || node_signaled(node))
+		if (prio <= i915_sched_attr_priority(&node->attr) ||
+		    node_signaled(node))
 			continue;
 
 		GEM_BUG_ON(node_to_request(node)->engine->sched_engine !=
@@ -257,7 +260,7 @@ static void __i915_schedule(struct i915_sched_node *node,
 		if (sched_engine->bump_inflight_request_prio)
 			sched_engine->bump_inflight_request_prio(from, attr);
 
-		WRITE_ONCE(node->attr.priority, prio);
+		WRITE_ONCE(node->attr, *attr);
 
 		/*
 		 * Once the request is ready, it will be placed into the
@@ -305,6 +308,7 @@ void i915_sched_node_init(struct i915_sched_node *node)
 void i915_sched_node_reinit(struct i915_sched_node *node)
 {
 	node->attr.priority = I915_PRIORITY_INVALID;
+	node->attr.nice = 0;
 	node->semaphores = 0;
 	node->flags = 0;
 
diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915/i915_scheduler.h
index 0b9b86af6c7f..75ccc9f55d14 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.h
+++ b/drivers/gpu/drm/i915/i915_scheduler.h
@@ -38,6 +38,20 @@ void i915_sched_node_fini(struct i915_sched_node *node);
 void i915_schedule(struct i915_request *request,
 		   const struct i915_sched_attr *attr);
 
+static inline int i915_sched_attr_priority(const struct i915_sched_attr *attr)
+{
+	int prio = attr->priority;
+
+	/*
+	 * Only allow I915_CONTEXT_DEFAULT_PRIORITY to be affected by the
+	 * nice setting.
+	 */
+	if (!prio)
+		prio = -attr->nice;
+
+	return prio;
+}
+
 struct list_head *
 i915_sched_lookup_priolist(struct i915_sched_engine *sched_engine, int prio);
 
diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
index 24b9ac1c2ce2..159237aa7609 100644
--- a/drivers/gpu/drm/i915/i915_scheduler_types.h
+++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
@@ -29,6 +29,14 @@ struct i915_sched_attr {
 	 * The &drm_i915_private.kernel_context is assigned the lowest priority.
 	 */
 	int priority;
+
+	/**
+	 * @nice: context nice level
+	 *
+	 * Nice level follows the CPU scheduler nice value as set for the
+	 * process owning the GPU context.
+	 */
+	int nice;
 };
 
 /*
-- 
2.30.2

