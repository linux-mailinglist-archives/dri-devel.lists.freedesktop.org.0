Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9471F5FEADC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 10:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D145F10EAB1;
	Fri, 14 Oct 2022 08:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E360110EAA3;
 Fri, 14 Oct 2022 08:46:59 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id d26so8996349ejc.8;
 Fri, 14 Oct 2022 01:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rQxy6nbDotJnlK+IooeBXNO752BTs05QG+n3YOkgzec=;
 b=NbnhKK3Adssv96/DD/RkeI9x3XI7LQCXvigqzvTGnxe7S1ykQ837PMn3feOpr8rvVn
 llGy+ZyaLFxzVhB/6hqszHx/1XoYaI5aJuBINt97rPjEhSpZYD55LF14Nl2db67fmSTr
 ifarisbRMnukZSpYGrCAG/AYPsZ98pYG5F00P8ScLHfljriNGh/Swj2XWWhKpFXd9vPN
 IQFs51l2R2KSZjlYrMZsY6NQLz+BK3qF5RT7CEIVLo1it/QzhapF8ww/KGaR1fjma15f
 EUBFit0cCk2WfNGJb6xI9TGjAcwXUs7jU/YptN7hDPS0uH2hxGD3Ga2ntDgP+odJ3IWw
 YCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rQxy6nbDotJnlK+IooeBXNO752BTs05QG+n3YOkgzec=;
 b=MRbvBlcZf4IQwhA7WVJe3On98HBKeI66DGOJQrgijLGu3z+b6J+6hlmyyUA3EGgm1o
 7waa3tSD/ybGtiZumn1bkuoS5KA1FTzy2pFxC1Bb32+MAjQPTtLoWAjMgXkN6/z6t0Mm
 I4pqpQlvZKwTluu1NvlaWvMd1I7TJa+hlvZq63KWlM5EIr4JwZRkI3RP+7KedDdoWoK1
 dUCKmmt30bkpXCGtDl7FKP6Hcws17mBUa1ZSOTpTA3J0988YLJRqr+NVyfVVGSP/T4FO
 YQPFo6Z7uIy8hsA0XwOSmaKfEO9pAzTXAgYBoYRo4hUchgkIaQp8q4k5jHq+hu8tSEsT
 wBdA==
X-Gm-Message-State: ACrzQf1xyOtN7SIGXksuOHCQem8Or4Qk7PYTqEDItn7oiO0muVLbNMtp
 qvBCziD6c7AAiOSyrfL/lE0=
X-Google-Smtp-Source: AMsMyM7cyyb1ihK+Pw4DRcoRpKIZEUJASQcgmn/zqYPupuBQr4KdHf0U19XJ7xrpparYxdkvz7LJJA==
X-Received: by 2002:a17:907:2da6:b0:78d:3cf1:9132 with SMTP id
 gt38-20020a1709072da600b0078d3cf19132mr2758160ejc.299.1665737217723; 
 Fri, 14 Oct 2022 01:46:57 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 r26-20020aa7d59a000000b00457618d3409sm1379124edq.68.2022.10.14.01.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:46:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 12/13] drm/scheduler: rework entity flush, kill and fini
Date: Fri, 14 Oct 2022 10:46:40 +0200
Message-Id: <20221014084641.128280-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014084641.128280-1-christian.koenig@amd.com>
References: <20221014084641.128280-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This was buggy because when we had to wait for entities which were
killed as well we would just deadlock.

Instead move all the dependency handling into the callbacks so that
will all happen asynchronously.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 197 +++++++++++------------
 1 file changed, 92 insertions(+), 105 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 243ff384cde8..54ac37cd5017 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -139,6 +139,74 @@ bool drm_sched_entity_is_ready(struct drm_sched_entity *entity)
 	return true;
 }
 
+static void drm_sched_entity_kill_jobs_irq_work(struct irq_work *wrk)
+{
+	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
+
+	drm_sched_fence_scheduled(job->s_fence);
+	drm_sched_fence_finished(job->s_fence);
+	WARN_ON(job->s_fence->parent);
+	job->sched->ops->free_job(job);
+}
+
+/* Signal the scheduler finished fence when the entity in question is killed. */
+static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
+					  struct dma_fence_cb *cb)
+{
+	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
+						 finish_cb);
+	int r;
+
+	dma_fence_put(f);
+
+	/* Wait for all dependencies to avoid data corruptions */
+	while (!xa_empty(&job->dependencies)) {
+		f = xa_erase(&job->dependencies, job->last_dependency++);
+		r = dma_fence_add_callback(f, &job->finish_cb,
+					   drm_sched_entity_kill_jobs_cb);
+		if (!r)
+			return;
+
+		dma_fence_put(f);
+	}
+
+	init_irq_work(&job->work, drm_sched_entity_kill_jobs_irq_work);
+	irq_work_queue(&job->work);
+}
+
+/* Remove the entity from the scheduler and kill all pending jobs */
+static void drm_sched_entity_kill(struct drm_sched_entity *entity)
+{
+	struct drm_sched_job *job;
+	struct dma_fence *prev;
+
+	if (!entity->rq)
+		return;
+
+	spin_lock(&entity->rq_lock);
+	entity->stopped = true;
+	drm_sched_rq_remove_entity(entity->rq, entity);
+	spin_unlock(&entity->rq_lock);
+
+	/* Make sure this entity is not used by the scheduler at the moment */
+	wait_for_completion(&entity->entity_idle);
+
+	prev = dma_fence_get(entity->last_scheduled);
+	while ((job = to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
+		struct drm_sched_fence *s_fence = job->s_fence;
+
+		dma_fence_set_error(&s_fence->finished, -ESRCH);
+
+		dma_fence_get(&s_fence->finished);
+		if (!prev || dma_fence_add_callback(prev, &job->finish_cb,
+					   drm_sched_entity_kill_jobs_cb))
+			drm_sched_entity_kill_jobs_cb(NULL, &job->finish_cb);
+
+		prev = &s_fence->finished;
+	}
+	dma_fence_put(prev);
+}
+
 /**
  * drm_sched_entity_flush - Flush a context entity
  *
@@ -179,91 +247,13 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
 	/* For killed process disable any more IBs enqueue right now */
 	last_user = cmpxchg(&entity->last_user, current->group_leader, NULL);
 	if ((!last_user || last_user == current->group_leader) &&
-	    (current->flags & PF_EXITING) && (current->exit_code == SIGKILL)) {
-		spin_lock(&entity->rq_lock);
-		entity->stopped = true;
-		drm_sched_rq_remove_entity(entity->rq, entity);
-		spin_unlock(&entity->rq_lock);
-	}
+	    (current->flags & PF_EXITING) && (current->exit_code == SIGKILL))
+		drm_sched_entity_kill(entity);
 
 	return ret;
 }
 EXPORT_SYMBOL(drm_sched_entity_flush);
 
-static void drm_sched_entity_kill_jobs_irq_work(struct irq_work *wrk)
-{
-	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
-
-	drm_sched_fence_finished(job->s_fence);
-	WARN_ON(job->s_fence->parent);
-	job->sched->ops->free_job(job);
-}
-
-
-/* Signal the scheduler finished fence when the entity in question is killed. */
-static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
-					  struct dma_fence_cb *cb)
-{
-	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
-						 finish_cb);
-
-	dma_fence_put(f);
-	init_irq_work(&job->work, drm_sched_entity_kill_jobs_irq_work);
-	irq_work_queue(&job->work);
-}
-
-static struct dma_fence *
-drm_sched_job_dependency(struct drm_sched_job *job,
-			 struct drm_sched_entity *entity)
-{
-	if (!xa_empty(&job->dependencies))
-		return xa_erase(&job->dependencies, job->last_dependency++);
-
-	if (job->sched->ops->dependency)
-		return job->sched->ops->dependency(job, entity);
-
-	return NULL;
-}
-
-static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
-{
-	struct drm_sched_job *job;
-	struct dma_fence *f;
-	int r;
-
-	while ((job = to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
-		struct drm_sched_fence *s_fence = job->s_fence;
-
-		/* Wait for all dependencies to avoid data corruptions */
-		while ((f = drm_sched_job_dependency(job, entity))) {
-			dma_fence_wait(f, false);
-			dma_fence_put(f);
-		}
-
-		drm_sched_fence_scheduled(s_fence);
-		dma_fence_set_error(&s_fence->finished, -ESRCH);
-
-		/*
-		 * When pipe is hanged by older entity, new entity might
-		 * not even have chance to submit it's first job to HW
-		 * and so entity->last_scheduled will remain NULL
-		 */
-		if (!entity->last_scheduled) {
-			drm_sched_entity_kill_jobs_cb(NULL, &job->finish_cb);
-			continue;
-		}
-
-		dma_fence_get(entity->last_scheduled);
-		r = dma_fence_add_callback(entity->last_scheduled,
-					   &job->finish_cb,
-					   drm_sched_entity_kill_jobs_cb);
-		if (r == -ENOENT)
-			drm_sched_entity_kill_jobs_cb(NULL, &job->finish_cb);
-		else if (r)
-			DRM_ERROR("fence add callback failed (%d)\n", r);
-	}
-}
-
 /**
  * drm_sched_entity_fini - Destroy a context entity
  *
@@ -277,33 +267,17 @@ static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
  */
 void drm_sched_entity_fini(struct drm_sched_entity *entity)
 {
-	struct drm_gpu_scheduler *sched = NULL;
-
-	if (entity->rq) {
-		sched = entity->rq->sched;
-		drm_sched_rq_remove_entity(entity->rq, entity);
-	}
-
-	/* Consumption of existing IBs wasn't completed. Forcefully
-	 * remove them here.
+	/*
+	 * If consumption of existing IBs wasn't completed. Forcefully remove
+	 * them here. Also makes sure that the scheduler won't touch this entity
+	 * any more.
 	 */
-	if (spsc_queue_count(&entity->job_queue)) {
-		if (sched) {
-			/*
-			 * Wait for thread to idle to make sure it isn't processing
-			 * this entity.
-			 */
-			wait_for_completion(&entity->entity_idle);
-
-		}
-		if (entity->dependency) {
-			dma_fence_remove_callback(entity->dependency,
-						  &entity->cb);
-			dma_fence_put(entity->dependency);
-			entity->dependency = NULL;
-		}
+	drm_sched_entity_kill(entity);
 
-		drm_sched_entity_kill_jobs(entity);
+	if (entity->dependency) {
+		dma_fence_remove_callback(entity->dependency, &entity->cb);
+		dma_fence_put(entity->dependency);
+		entity->dependency = NULL;
 	}
 
 	dma_fence_put(entity->last_scheduled);
@@ -416,6 +390,19 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
 	return false;
 }
 
+static struct dma_fence *
+drm_sched_job_dependency(struct drm_sched_job *job,
+			 struct drm_sched_entity *entity)
+{
+	if (!xa_empty(&job->dependencies))
+		return xa_erase(&job->dependencies, job->last_dependency++);
+
+	if (job->sched->ops->dependency)
+		return job->sched->ops->dependency(job, entity);
+
+	return NULL;
+}
+
 struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 {
 	struct drm_sched_job *sched_job;
-- 
2.25.1

