Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AB63A8BCA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 00:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F226B6E452;
	Tue, 15 Jun 2021 22:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B336B6E432;
 Tue, 15 Jun 2021 22:26:08 +0000 (UTC)
IronPort-SDR: zxj4zmJ3myz8g1Orr4tyEPfjXBa7Gv3ZY/brvXRRZ3oV9gZoEgMtGPshi3InbbQfW3Qs5sOlnL
 hVVGG3HAP0Vw==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="186453775"
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="186453775"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 15:26:08 -0700
IronPort-SDR: 8oCN08xJOQCJ5bPJe/T6iJY0a4/I7N6C7v6QbQBi2cYLJKyBFPEfgJPdlv96L9F9kYNRX9JKBk
 sMyDdbK7OVFw==
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="553827668"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 15:26:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/8] drm/i915: Reset sched_engine.no_priolist immediately
 after dequeue
Date: Tue, 15 Jun 2021 15:43:53 -0700
Message-Id: <20210615224358.83627-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210615224358.83627-1-matthew.brost@intel.com>
References: <20210615224358.83627-1-matthew.brost@intel.com>
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

