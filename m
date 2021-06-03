Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8BD39AC55
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 23:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9686EEAC;
	Thu,  3 Jun 2021 21:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBDA6EE92;
 Thu,  3 Jun 2021 21:09:38 +0000 (UTC)
IronPort-SDR: KfT46rm8qD4x2IH+nNU5SHO18Xg95iihU6n3pj/6DqePGSMyfDEEQXfC/S7r3PFkeqBRAfzJAZ
 LnQZgWgMTWcA==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="203966010"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="203966010"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 14:09:35 -0700
IronPort-SDR: e+EuLT9OU9QVgXl1XNHTxEgP2YVkLPWm5jAlSnVJ55JmvsJ52HXdQq7szK1WIXuHOa0F0LuaQk
 wqhaOam+xOlw==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="448015268"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 14:09:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/9] drm/i915: Add i915_sched_engine_reset_on_empty function
Date: Thu,  3 Jun 2021 14:27:16 -0700
Message-Id: <20210603212722.59719-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210603212722.59719-1-matthew.brost@intel.com>
References: <20210603212722.59719-1-matthew.brost@intel.com>
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
Cc: daniel.vetter@intel.com, daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather than touching schedule state in the generic PM code, reset the
priolist allocation when empty in the submission code. Add a wrapper
function to do this and update the backends to call it in the correct
place.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
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
index 2326a73af6d3..609753b5401a 100644
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
index 5d00f2e3c1de..f4a6fbfaf82e 100644
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

