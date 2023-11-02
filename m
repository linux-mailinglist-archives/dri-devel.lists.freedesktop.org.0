Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 742C87DF0B4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 11:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4777C10E84B;
	Thu,  2 Nov 2023 10:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECA810E84E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698922567; x=1730458567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C+57oUr8ALmJfSLKmRpicOuodPYVt5Y9stnr5KzyCdg=;
 b=b0VRqSWxWR0SqvNirTyJ1eJfIrDUsxaWvtyvr0g3dPlVjJOvIyvqjfiv
 MVAYLOJdtfLK5em7FLsVDe7vlbGEK3gURTnKOxW+WXEqz53VamOfMI/vj
 SH4ItpM4bm6V7QupyzB/rMNzVCfptxhG/7n9CyAP6IvEyB9ZDyEpbYQcF
 jCC7sqzSG9RonL6N7YsVg29O/qpadEE+PJOQfseamlrlUhCC5fc2vdF88
 xQHm8md8fr9A/L0PlPyG4XEgO73GFQMv7YU16vE0tJnsWvG0NOTVExVlr
 tHUefEmjZxHHeIgRB1e6BOeF6nKlJ6VIxg03zs6h/6lvlu4VZ2xjBeISn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452988715"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="452988715"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 03:55:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="764875963"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="764875963"
Received: from stevenwo-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.233.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 03:55:50 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/sched: Rename drm_sched_run_job_queue_if_ready and
 clarify kerneldoc
Date: Thu,  2 Nov 2023 10:55:37 +0000
Message-Id: <20231102105538.391648-5-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231102105538.391648-1-tvrtko.ursulin@linux.intel.com>
References: <20231102105538.391648-1-tvrtko.ursulin@linux.intel.com>
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
 Luben Tuikov <luben.tuikov@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

"If ready" is not immediately clear what it means - is the scheduler
ready or something else? Drop the suffix, clarify kerneldoc, and employ
the same naming scheme as in drm_sched_run_free_queue:

 - drm_sched_run_job_queue   - enqueues if there is something to enqueue
                               *and* scheduler is ready (can queue)
 - __drm_sched_run_job_queue - low-level helper to simply queue the job

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index f9baca20b438..d5ddbce68fb7 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -256,10 +256,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 }
 
 /**
- * drm_sched_run_job_queue - enqueue run-job work
+ * __drm_sched_run_job_queue - enqueue run-job work
  * @sched: scheduler instance
  */
-static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
+static void __drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 {
 	if (!READ_ONCE(sched->pause_submit))
 		queue_work(sched->submit_wq, &sched->work_run_job);
@@ -928,7 +928,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
 {
 	if (drm_sched_can_queue(sched))
-		drm_sched_run_job_queue(sched);
+		__drm_sched_run_job_queue(sched);
 }
 
 /**
@@ -1041,13 +1041,13 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 EXPORT_SYMBOL(drm_sched_pick_best);
 
 /**
- * drm_sched_run_job_queue_if_ready - enqueue run-job work if ready
+ * drm_sched_run_job_queue - enqueue run-job work if there are ready entities
  * @sched: scheduler instance
  */
-static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
+static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 {
 	if (drm_sched_select_entity(sched))
-		drm_sched_run_job_queue(sched);
+		__drm_sched_run_job_queue(sched);
 }
 
 /**
@@ -1069,7 +1069,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
 		sched->ops->free_job(job);
 
 	drm_sched_run_free_queue(sched);
-	drm_sched_run_job_queue_if_ready(sched);
+	drm_sched_run_job_queue(sched);
 }
 
 /**
@@ -1126,7 +1126,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
 	}
 
 	wake_up(&sched->job_scheduled);
-	drm_sched_run_job_queue_if_ready(sched);
+	drm_sched_run_job_queue(sched);
 }
 
 /**
-- 
2.39.2

