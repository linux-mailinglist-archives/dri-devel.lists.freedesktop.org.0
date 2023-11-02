Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F077DF0B5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 11:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD2C10E84D;
	Thu,  2 Nov 2023 10:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C6610E850
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698922567; x=1730458567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CiwVx0+ZhBOHujj2aScwnrAdX//+olBF8ZugsKuZjOM=;
 b=nNF/XrsKg8gSc90XpH0hS4Hp6z9P+PiLrgEIW8U3zoAPr0qlZuYS3vRp
 if9Gr73EUvCU+I2tBK0C7ul7Dkl6wZI84a4NXqouUwdjwwqnxm/eaxeaB
 ypST2BVmm9hT4ctnp0VURtGNk4v76KsyFD/ygTECTMaWH15HlbjhZypwm
 7RzyBucFq4+9AvYKdJzpb3qs9BvoL0wq+UKVjpHFOioAV3nJCING/pQKH
 0gC0OcAqYW4W5vePPaBqpxw+S/Iz4AiwE0+XEyNMvzKAY6GCQklfvkgJw
 R8rQBHdVTvZj+PrqVypdkMOWpggwaxXYNa3GcI7vqDi95KHoOPchhLW0T w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452988712"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="452988712"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 03:55:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="764875971"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="764875971"
Received: from stevenwo-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.233.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 03:55:52 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/sched: Drop suffix from drm_sched_wakeup_if_can_queue
Date: Thu,  2 Nov 2023 10:55:38 +0000
Message-Id: <20231102105538.391648-6-tvrtko.ursulin@linux.intel.com>
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

Because a) helper is exported to other parts of the scheduler and
b) there isn't a plain drm_sched_wakeup to begin with, I think we can
drop the suffix and by doing so separate the intimiate knowledge
between the scheduler components a bit better.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
 drivers/gpu/drm/scheduler/sched_main.c   | 4 ++--
 include/drm/gpu_scheduler.h              | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 409e4256f6e7..f1db63cc8198 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -370,7 +370,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 		container_of(cb, struct drm_sched_entity, cb);
 
 	drm_sched_entity_clear_dep(f, cb);
-	drm_sched_wakeup_if_can_queue(entity->rq->sched);
+	drm_sched_wakeup(entity->rq->sched);
 }
 
 /**
@@ -602,7 +602,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			drm_sched_rq_update_fifo(entity, submit_ts);
 
-		drm_sched_wakeup_if_can_queue(entity->rq->sched);
+		drm_sched_wakeup(entity->rq->sched);
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index d5ddbce68fb7..27843e37d9b7 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -920,12 +920,12 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
 }
 
 /**
- * drm_sched_wakeup_if_can_queue - Wake up the scheduler
+ * drm_sched_wakeup - Wake up the scheduler if it is ready to queue
  * @sched: scheduler instance
  *
  * Wake up the scheduler if we can queue jobs.
  */
-void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
+void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
 {
 	if (drm_sched_can_queue(sched))
 		__drm_sched_run_job_queue(sched);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index c1565694c0e9..43730f1ecbfd 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -558,7 +558,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 
 void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
-void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
+void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
 bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
-- 
2.39.2

