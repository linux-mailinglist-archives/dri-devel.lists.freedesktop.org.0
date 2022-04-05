Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D664F39B5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 16:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0C310E72F;
	Tue,  5 Apr 2022 14:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA01D10E8F2;
 Tue,  5 Apr 2022 14:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649170458; x=1680706458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2xzqcSyvNHIAd+n8MJRx9N+efbj28lVr9ccNI2LFD+M=;
 b=U5Nc0kBoTP741cdmoW4UYXMm9rsoHG+9BFe8B7VwLGZxVjw1ILyQz+GL
 jNpM33EetjpSDeAnhYFjmb2Lp1rIoHn9vOWR/d40MJ58eWUdTayO7Y2VE
 CuMsMyoGha5lv2pzurBLpdaWB2g/t2aGA3UnS4LzDOPvYnutmGxjACuoY
 l6A5DnhGY7WaA5kV/Bqh4iaKzenksF9ElaoTfcbNtOBAMo7u0yfAOYkvt
 iiGeJnAhw3Tn7RHHoLZm4y9ZCrIsbq6i56APjDj7ksCRgfKm5lzmM0NC/
 v5uiU9W489/ln8tAVULHRQEaw28UJWd7l6RUA1hbdcGcPsH0pjbmnkwJe Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="241353403"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="241353403"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:54:18 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="608470339"
Received: from pmulcahy-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.235.32])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:54:17 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915: Inherit process nice for context scheduling
 priority
Date: Tue,  5 Apr 2022 15:53:44 +0100
Message-Id: <20220405145345.3284084-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220405145345.3284084-1-tvrtko.ursulin@linux.intel.com>
References: <20220405145345.3284084-1-tvrtko.ursulin@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Introduce the concept of context nice value which matches the process
nice.

We do this by extending the struct i915_sched_attr and add a helper
(i915_sched_attr_priority) to be used to convert to effective priority
when used by backend code and for priority sorting.

Context nice is then inherited from the process which creates the GEM
context and utilised secondary to context priority, but only when the
latter has been left at the default setting in order to avoid disturbing
any application made choices of low and high (batch processing and maybe
latency sensitive compositing). In this case nice value adjusts the
effective priority in the narrow band of -19 to +20 around
I915_CONTEXT_DEFAULT_PRIORITY.

This means that userspace using the context priority uapi directly has a
wider range of possible adjustments (in practice that only applies to
execlists platforms - with GuC there are only three priority buckets), but
in all cases nice adjustment has the expected effect: positive nice
lowering the scheduling priority and negative nice raising it.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  6 +++++-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  2 +-
 drivers/gpu/drm/i915/i915_request.c                |  2 +-
 drivers/gpu/drm/i915/i915_request.h                |  5 +++++
 drivers/gpu/drm/i915/i915_scheduler.c              | 12 ++++++++----
 drivers/gpu/drm/i915/i915_scheduler.h              | 14 ++++++++++++++
 drivers/gpu/drm/i915/i915_scheduler_types.h        |  8 ++++++++
 8 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index ab4c5ab28e4d..1d772cc87ae6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -294,6 +294,7 @@ proto_context_create(struct drm_i915_private *i915, unsigned int flags)
 	if (i915->params.enable_hangcheck)
 		pc->user_flags |= BIT(UCONTEXT_PERSISTENCE);
 	pc->sched.priority = I915_PRIORITY_NORMAL;
+	pc->sched.nice = task_nice(current);
 
 	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
 		if (!HAS_EXECLISTS(i915)) {
@@ -914,8 +915,11 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
 
 	case I915_CONTEXT_PARAM_PRIORITY:
 		ret = validate_priority(fpriv->dev_priv, args);
-		if (!ret)
+		if (!ret) {
 			pc->sched.priority = args->value;
+			if (args->value == I915_CONTEXT_DEFAULT_PRIORITY)
+				pc->sched.nice = task_nice(current);
+		}
 		break;
 
 	case I915_CONTEXT_PARAM_SSEU:
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 8b04c6e4c006..eb035cd73bc5 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -254,7 +254,7 @@ static struct i915_priolist *to_priolist(struct rb_node *rb)
 
 static int rq_prio(const struct i915_request *rq)
 {
-	return READ_ONCE(rq->sched.attr.priority);
+	return i915_request_priority(rq);
 }
 
 static int effective_prio(const struct i915_request *rq)
@@ -3278,8 +3278,8 @@ static void kick_execlists(const struct i915_request *rq,
 {
 	struct intel_engine_cs *engine = rq->engine;
 	struct i915_sched_engine *sched_engine = engine->sched_engine;
+	const int prio = i915_sched_attr_priority(attr);
 	const struct i915_request *inflight;
-	const int prio = attr->priority;
 
 	/*
 	 * We only need to kick the tasklet once for the high priority
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 2d5193a9a1d3..a60118461750 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3523,7 +3523,7 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
 					   const struct i915_sched_attr *attr)
 {
 	struct intel_context *ce = request_to_scheduling_context(rq);
-	const int prio = attr->priority;
+	const int prio = i915_sched_attr_priority(attr);
 	u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
 
 	/* Short circuit function */
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 582770360ad1..960bfd517ff7 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -2093,7 +2093,7 @@ static int print_sched_attr(const struct i915_sched_attr *attr,
 		return x;
 
 	x += snprintf(buf + x, len - x,
-		      " prio=%d", attr->priority);
+		      " prio=%d nice=%d", attr->priority, attr->nice);
 
 	return x;
 }
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 28b1f9db5487..57648206bdc6 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -439,6 +439,11 @@ long i915_request_wait(struct i915_request *rq,
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
2.32.0

