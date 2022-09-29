Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A57C5EF64E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BB810EA69;
	Thu, 29 Sep 2022 13:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935B210E61A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:21:51 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id e18so1962322edj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 06:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Lq6BZ19kUCUE1aUy9YM2O6iHP4QpAXtpXwt0YPQeXr0=;
 b=Nq8YryI+7O4A6Yb0yB4vTqq3YWIgr4g7I1WYzEykw0/Y37vJ93kZ7qqGg6hevA3YuF
 0UW3Ym4bBAiLP78mbCWNIqsVkZS4MrzBpLJ+WSdfKJaVTzgeyIs5INHHBySJNlR7lPIV
 PtONF3sY4IKs/cERRvNikoq6iRWC87ZL/FAQkekfEqXCfoKyfOWl4Feq7Im4Z6x5jR9g
 FBCtLAHurTex+x1on+oDsQgOn4gk0rBf1J2mFFKTxlpXEecKBMt45xi4u+KDG8kbnlsn
 hrBUV0M8f3+x4nUk+cCDTRJfanWy/DuN3OPVyuwW6E9LQfA1OwY96lM1KirZgOznPjOd
 KueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Lq6BZ19kUCUE1aUy9YM2O6iHP4QpAXtpXwt0YPQeXr0=;
 b=3Fg2j6Etg/aYVr2uQmx+k/v0Ywf7aLZ1juubBH4xZ9RGsIcaZTwNvXf7bS4WYy3kc/
 0OObzIlCCYYbwMdlwUmSxbvw9So9JIA+D8A//shL8jLn0O9heuSDxsjy30+hM/aYcnrZ
 a9nd7Fr6tFyMlyst5Fk/1ib0j2KTWbZYBbMahMTWiB2AycC601oZI74QrrAGpPNw6P6m
 t5b+Z3hfj6nye9jVxpuoXJHOmf93+9sIaKFAINzmzA2nD8N0SxVvZ2SKGwMzDDQhxw89
 6RbRcR/uROI7ULmS0gnDpe1VR4ruo2UYsm17/OVITuXx+dViIkC4xmGVZt9ABIWXWuN6
 oiUQ==
X-Gm-Message-State: ACrzQf0Si1C+nR3J8BS8LXV7qqIDgl9mK75VcwffvD+wZMpplaerXpnX
 TGNxFQ4P3X43if3piH0pw59BcIxmj64=
X-Google-Smtp-Source: AMsMyM6OSZs3ELptMi3CJjFiIbH/8bRulkR+I/e03gowbamMBlqjSA7Oe5fgvdBq67R4s0SMWjX8ig==
X-Received: by 2002:a05:6402:5190:b0:44f:2924:78f4 with SMTP id
 q16-20020a056402519000b0044f292478f4mr3324804edd.217.1664457709935; 
 Thu, 29 Sep 2022 06:21:49 -0700 (PDT)
Received: from able.fritz.box (p4fc20ebf.dip0.t-ipconnect.de. [79.194.14.191])
 by smtp.gmail.com with ESMTPSA id
 gx6-20020a1709068a4600b007836d075152sm3983807ejc.187.2022.09.29.06.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 06:21:49 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/13] drm/scheduler: rework entity flush, kill and fini
Date: Thu, 29 Sep 2022 15:21:35 +0200
Message-Id: <20220929132136.1715-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929132136.1715-1-christian.koenig@amd.com>
References: <20220929132136.1715-1-christian.koenig@amd.com>
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
Cc: shansheng.wang@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 luben.tuikov@amd.com, WenChieh.Chien@amd.com
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
index 1bb1437a8fed..1d448e376811 100644
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
@@ -415,6 +389,19 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
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

