Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C08EA20AD48
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 09:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567046EC28;
	Fri, 26 Jun 2020 07:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D826EB47
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 12:06:01 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g75so5284251wme.5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 05:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fQvzmSOhmBm69V2JWwIbn7+q13MxZEayg81lz2fTlqc=;
 b=dadEyqLxZO4yG6HmkhonoEqBi1eF15GLLwoYPmUJ2LoYOmgta4u2Axc6HfaFjHRsS8
 EXB1Y8bVeYSUi+uI7I6MeRCywSxjyteS4Bp7BdqIIrTcE2U1HpKC/cbaKP2wU54JKNXs
 tliEmOFSKQvvUDT+z5pd4gGq+HnPQ7+QhTy+huQ73RKWnpNSAi+hkmciJ9kX0fK/T6fL
 141t8CTaOHgEIUw25IxRsEBWsEKHFieaWYx4EPsm+rVHzO1PClcBlVLG0uI1ps0u9AMP
 n6+T0g/fEkDJ9kI3jEIWrmyfffX5kPR8ja5Vz/8yJFe/4SVRkI4nhmzHwqNwICps5y0I
 HlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fQvzmSOhmBm69V2JWwIbn7+q13MxZEayg81lz2fTlqc=;
 b=fhQLY0I3IVFg+eWlLZ4lTdwm2l5vXAdN76t1SyuAnDjP10gbUzgwJ45na4pOu1jj26
 nlzZegoSMhB+sbSY6V+bQo1H50/Jaub9d7mD/k6bHkVG3wy5cPl6RtzhCMRO0NGCH8Gd
 T0YrvFNEq2zjtmJJVyQIkYCkACfjSBUKvq0JWGm9iweDJ+vHggqrDPg/y8w3PqclBKgr
 5q8Ee29L6JjUeIBxIO5uqL/WSma3LI/nDG48xFhvJadFi4qJSwq72CvLeTzqC3JxS/Po
 vYdsUZyKtQ0McOHrBiiBImGcGL+MJiXp8gdWFEwa0o3VZXTzDYBfHqFYkAo7xwcUa0ED
 hVzA==
X-Gm-Message-State: AOAM531UmObZTFkQYtYcH5Z5WwpIhoUblVwynEeY8dPBiUGEqR3jV9qU
 faK9vmcRowddHqXcGltLUUXqgfMkPNj97D3V
X-Google-Smtp-Source: ABdhPJz3dvKV6m1KMoqlDqVL/KA4ZqJMFz1pe8vZD/xvxu9hVWYKRqJSkOXJeW1um7QPAAHOSI+0Og==
X-Received: by 2002:a05:600c:2253:: with SMTP id
 a19mr2904766wmm.136.1593086756425; 
 Thu, 25 Jun 2020 05:05:56 -0700 (PDT)
Received: from brihaspati.fritz.box (pd95677c2.dip0.t-ipconnect.de.
 [217.86.119.194])
 by smtp.gmail.com with ESMTPSA id 207sm13549304wme.13.2020.06.25.05.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 05:05:55 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/scheduler: improve job distribution with multiple
 queues
Date: Thu, 25 Jun 2020 14:07:23 +0200
Message-Id: <20200625120723.102314-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 26 Jun 2020 07:36:15 +0000
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
Cc: James.Zhu@amd.com, Nirmoy Das <nirmoy.das@amd.com>,
 christian.koenig@amd.com, changfeng.zhu@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch uses score to select a new drm scheduler for better
loadbalance between multiple drm schedulers instead of num_jobs.

Below are test results after running amdgpu_test for ~10 times.

Before this patch:

sched_name     num of many times it got schedule
=========      ==================================
sdma0          1463
sdma1          198
comp_1.0.1     280

After this patch:

sched_name     num of many times it got schedule
=========      ==================================
sdma0          925
sdma1          928
comp_1.0.1     177
comp_1.1.1     44
comp_1.2.1     43
comp_1.3.1     44

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c   | 14 ++++++++------
 include/drm/gpu_scheduler.h              |  6 +++---
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index c803e14eed91..146380118962 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -486,7 +486,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job,
 	bool first;
 
 	trace_drm_sched_job(sched_job, entity);
-	atomic_inc(&entity->rq->sched->num_jobs);
+	atomic_inc(&entity->rq->sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
 
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 8e731ed0d9d9..25a9e6911602 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -92,6 +92,7 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 	if (!list_empty(&entity->list))
 		return;
 	spin_lock(&rq->lock);
+	atomic_inc(&rq->sched->score);
 	list_add_tail(&entity->list, &rq->entities);
 	spin_unlock(&rq->lock);
 }
@@ -110,6 +111,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 	if (list_empty(&entity->list))
 		return;
 	spin_lock(&rq->lock);
+	atomic_dec(&rq->sched->score);
 	list_del_init(&entity->list);
 	if (rq->current_entity == entity)
 		rq->current_entity = NULL;
@@ -647,7 +649,7 @@ static void drm_sched_process_job(struct dma_fence *f, struct dma_fence_cb *cb)
 	struct drm_gpu_scheduler *sched = s_fence->sched;
 
 	atomic_dec(&sched->hw_rq_count);
-	atomic_dec(&sched->num_jobs);
+	atomic_dec(&sched->score);
 
 	trace_drm_sched_process_job(s_fence);
 
@@ -712,7 +714,7 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 {
 	struct drm_gpu_scheduler *sched, *picked_sched = NULL;
 	int i;
-	unsigned int min_jobs = UINT_MAX, num_jobs;
+	unsigned int min_score = UINT_MAX, num_score;
 
 	for (i = 0; i < num_sched_list; ++i) {
 		sched = sched_list[i];
@@ -723,9 +725,9 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 			continue;
 		}
 
-		num_jobs = atomic_read(&sched->num_jobs);
-		if (num_jobs < min_jobs) {
-			min_jobs = num_jobs;
+		num_score = atomic_read(&sched->score);
+		if (num_score < min_score) {
+			min_score = num_score;
 			picked_sched = sched;
 		}
 	}
@@ -860,7 +862,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	spin_lock_init(&sched->job_list_lock);
 	atomic_set(&sched->hw_rq_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
-	atomic_set(&sched->num_jobs, 0);
+	atomic_set(&sched->score, 0);
 	atomic64_set(&sched->job_id_count, 0);
 
 	/* Each scheduler will run on a seperate kernel thread */
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index a21b3b92135a..b9780ae9dd26 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -263,7 +263,7 @@ struct drm_sched_backend_ops {
  * @job_list_lock: lock to protect the ring_mirror_list.
  * @hang_limit: once the hangs by a job crosses this limit then it is marked
  *              guilty and it will be considered for scheduling further.
- * @num_jobs: the number of jobs in queue in the scheduler
+ * @score: score to help loadbalancer pick a idle sched
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
  *
@@ -284,8 +284,8 @@ struct drm_gpu_scheduler {
 	struct list_head		ring_mirror_list;
 	spinlock_t			job_list_lock;
 	int				hang_limit;
-	atomic_t                        num_jobs;
-	bool			ready;
+	atomic_t                        score;
+	bool				ready;
 	bool				free_guilty;
 };
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
