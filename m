Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130534F39B7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 16:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6F810E764;
	Tue,  5 Apr 2022 14:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A9B10E91C;
 Tue,  5 Apr 2022 14:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649170457; x=1680706457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BH6rhIiByOXzo9zRMRtLAntr271Y6ajSjCNhzEAAA0E=;
 b=DXZgyNB61179BRKy4WbHRGbMoSZNImjnLb5d9yRGVx19gXP+NxrYbBlc
 8zHFDr3ZJe8/s9g1oJPVAOzCZocRFCbZ9r8u30imWha/IiDUde6v0+wXT
 0Zew5oYb3+pXW660jdAubmoVyb0dYPQacm/cPA4YVUc8TCP9QeH1OO22O
 PeHG6odsexXGODTi7om6KwHAujCVWxamMi/++Z4BlO0cvilSrycYxIJMs
 de7xewsBM8v7R7j6eZDBB5xm6caSkICA+bOwwlhOFIMGWOxTb2ukRY7Qw
 hAjx6sD7k1cGWSB0QJOf/hH5/S/kb0gUNYT1k17Sma2Qg8LFq04taWKL/ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="241353395"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="241353395"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:54:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="608470336"
Received: from pmulcahy-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.235.32])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:54:15 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915: Make some recently added vfuncs use full
 scheduling attribute
Date: Tue,  5 Apr 2022 15:53:43 +0100
Message-Id: <20220405145345.3284084-2-tvrtko.ursulin@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Code added in 71ed60112d5d ("drm/i915: Add kick_backend function to
i915_sched_engine") and ee242ca704d3 ("drm/i915/guc: Implement GuC
priority management") introduced some scheduling related vfuncs which
take integer request priority as argument.

Make them instead take struct i915_sched_attr which is the type
encapsulating this information. This better aligns with the codebase
and enables transparently extending the internal data passed along
the scheduling call chains.

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
index f8749c433b7c..8b04c6e4c006 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3273,11 +3273,13 @@ static bool can_preempt(struct intel_engine_cs *engine)
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
index e1612c393781..2d5193a9a1d3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3520,9 +3520,10 @@ static void guc_init_breadcrumbs(struct intel_engine_cs *engine)
 }
 
 static void guc_bump_inflight_request_prio(struct i915_request *rq,
-					   int prio)
+					   const struct i915_sched_attr *attr)
 {
 	struct intel_context *ce = request_to_scheduling_context(rq);
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
2.32.0

