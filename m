Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4873A0117
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 21:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1467B6EABC;
	Tue,  8 Jun 2021 19:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5B06E0AD;
 Tue,  8 Jun 2021 19:00:17 +0000 (UTC)
IronPort-SDR: J71AfCzpaxkKRhCbqyDufP9JXcMYl3C6mq41UflNKGVcUJO1SwZJkjl5uuxkio4M5IyzqrrUcV
 mwtP6ROnr0JQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="266067582"
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; d="scan'208";a="266067582"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 12:00:05 -0700
IronPort-SDR: 6mKoaJ6yiH2+b7x9m6cAWYGr0Il/GuLunEbZc1cLyFh6h4j7Mgy54oOzNyA2d1WHRnfZySbfsO
 2uSRSs0ccH5w==
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; d="scan'208";a="485391325"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 12:00:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/8] drm/i915: Reset sched_engine.no_priolist immediately
 after dequeue
Date: Tue,  8 Jun 2021 12:17:49 -0700
Message-Id: <20210608191754.127059-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210608191754.127059-1-matthew.brost@intel.com>
References: <20210608191754.127059-1-matthew.brost@intel.com>
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
Cc: jason.ekstrand@intel.com, daniele.ceraolospurio@intel.com,
 john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather than touching schedule state in the generic PM code, reset the
priolist allocation when empty in the submission code. Add a wrapper
function to do this and update the backends to call it in the correct
place.

v3:
 (Jason Ekstrand)
  Update patch commit message with a better description

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gt/intel_engine_pm.c            | 2 --
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c    | 2 ++
 drivers/gpu/drm/i915/i915_scheduler.h                | 7 +++++++
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index b6a00dd72808..1f07ac4e0672 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -280,8 +280,6 @@ static int __engine_park(struct intel_wakeref *wf)
 	if (engine->park)
 		engine->park(engine);
 
-	engine->sched_engine->no_priolist = false;
-
 	/* While gt calls i915_vma_parked(), we have to break the lock cycle */
 	intel_gt_pm_put_async(engine->gt);
 	return 0;
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index e36b0e81876a..47a43aafa39f 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -1553,6 +1553,7 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
 	 * interrupt for secondary ports).
 	 */
 	sched_engine->queue_priority_hint = queue_prio(sched_engine);
+	i915_sched_engine_reset_on_empty(sched_engine);
 	spin_unlock(&engine->active.lock);
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index d65a7665b38e..9887a514a4d5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -263,6 +263,8 @@ static void guc_submission_tasklet(struct tasklet_struct *t)
 
 	__guc_dequeue(engine);
 
+	i915_sched_engine_reset_on_empty(engine->sched_engine);
+
 	spin_unlock_irqrestore(&engine->active.lock, flags);
 }
 
diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915/i915_scheduler.h
index 5bec7b3b8456..713c38c99de9 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.h
+++ b/drivers/gpu/drm/i915/i915_scheduler.h
@@ -72,6 +72,13 @@ i915_sched_engine_is_empty(struct i915_sched_engine *sched_engine)
 	return RB_EMPTY_ROOT(&sched_engine->queue.rb_root);
 }
 
+static inline void
+i915_sched_engine_reset_on_empty(struct i915_sched_engine *sched_engine)
+{
+	if (i915_sched_engine_is_empty(sched_engine))
+		sched_engine->no_priolist = false;
+}
+
 void i915_request_show_with_schedule(struct drm_printer *m,
 				     const struct i915_request *rq,
 				     const char *prefix,
-- 
2.28.0

