Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 520497DF0B2
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 11:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F24710E851;
	Thu,  2 Nov 2023 10:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEB710E849
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 10:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698922564; x=1730458564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L7YxN43ujkMIHsa7scEZeI0ribADviT2fHP7/WYNDfQ=;
 b=PJUJ3MRJJmFWFH3oBfJ9ADVtD6l1XjlKK0OL/OWlVlwTbyyvuwZHTzzJ
 UVtpwdpc2HP7EuOV88rhIEwLQgiNP7rknSRANn3XvHC79xcKxTFTvx+f8
 NKKSQQ3k68qsDXUjPcmLqxZU1DMlcYq9uloUM3bpz7slSq22epkAcaZun
 2fl/XiQ4asZIgh8H9jwMyBMupoMg9tk6fTXvdDvIRBA4OadQjn7+w1p1q
 EI8vg0yWX3oAb8OVwCtqT5WxmGKSqZri4Gu4Rmbxvh787yWcYF6HbWwpy
 CvEpbenTbvVx3Gx9L2HdgTj80guidogMgCye93ceAy/NVW9oDBsy5UXNW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452988709"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="452988709"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 03:55:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="764875959"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="764875959"
Received: from stevenwo-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.233.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 03:55:49 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/sched: Rename drm_sched_free_job_queue to be more
 descriptive
Date: Thu,  2 Nov 2023 10:55:36 +0000
Message-Id: <20231102105538.391648-4-tvrtko.ursulin@linux.intel.com>
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

The current name makes it sound like helper will free a queue, while what
it does is it enqueues the free job worker.

Rename it to drm_sched_run_free_queue to align with existing
drm_sched_run_job_queue.

Despite that creating an illusion there are two queues, while in reality
there is only one, at least it creates a consistent naming for the two
enqueuing helpers.

At the same time simplify the "if done" helper by dropping the suffix and
adding a double underscore prefix to the one which just enqueues.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index e1658030613f..f9baca20b438 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -266,20 +266,20 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 }
 
 /**
- * drm_sched_free_job_queue - enqueue free-job work
+ * __drm_sched_run_free_queue - enqueue free-job work
  * @sched: scheduler instance
  */
-static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
+static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
 {
 	if (!READ_ONCE(sched->pause_submit))
 		queue_work(sched->submit_wq, &sched->work_free_job);
 }
 
 /**
- * drm_sched_free_job_queue_if_done - enqueue free-job work if ready
+ * drm_sched_run_free_queue - enqueue free-job work if ready
  * @sched: scheduler instance
  */
-static void drm_sched_free_job_queue_if_done(struct drm_gpu_scheduler *sched)
+static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_job *job;
 
@@ -287,7 +287,7 @@ static void drm_sched_free_job_queue_if_done(struct drm_gpu_scheduler *sched)
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
 	if (job && dma_fence_is_signaled(&job->s_fence->finished))
-		drm_sched_free_job_queue(sched);
+		__drm_sched_run_free_queue(sched);
 	spin_unlock(&sched->job_list_lock);
 }
 
@@ -310,7 +310,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 	dma_fence_get(&s_fence->finished);
 	drm_sched_fence_finished(s_fence, result);
 	dma_fence_put(&s_fence->finished);
-	drm_sched_free_job_queue(sched);
+	__drm_sched_run_free_queue(sched);
 }
 
 /**
@@ -1068,7 +1068,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
 	if (job)
 		sched->ops->free_job(job);
 
-	drm_sched_free_job_queue_if_done(sched);
+	drm_sched_run_free_queue(sched);
 	drm_sched_run_job_queue_if_ready(sched);
 }
 
-- 
2.39.2

