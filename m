Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C0F7277E3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 08:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37E610E032;
	Thu,  8 Jun 2023 06:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74CC10E032
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 06:56:01 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2ABDB6606F12;
 Thu,  8 Jun 2023 07:55:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686207359;
 bh=Lr/xDLOUROi4MEpGwY0a5/DOYOE5Eft9M9lrp7zHlT8=;
 h=From:To:Cc:Subject:Date:From;
 b=fBqTLrfJ+6lTXHSh9m9fdJuYVaZdCoDiCMugo2rTmmsFTT6GjM/rOF4q1VMxrxb0c
 bImeA342OO62yhMZl/tSWTJ8m7n5l0pX6tvcnOBcMmMMbOWh62qg2fk415yAWQ4iba
 QnyybPusdipaV7CJF71wAoDlN7jIPhsbW1zdRYmaWHYQPVfqBjCYZSOiGXpzQASV/W
 pyOooqGrjoKtbXdyo4+vYrL6j8ZVBtSuqJhzZlPYzSJyeN4bA1K+wRiEEYmXwD5PgR
 98XErSsODOdgnKt1iOun7jY9xZIAjqJ9rew+cBGNW+Xcx2DouzdvWeiVwuuB+SasNy
 +i861HosSIzew==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/sched: Wait for the currently popped dependency in
 kill_jobs_cb()
Date: Thu,  8 Jun 2023 08:55:51 +0200
Message-Id: <20230608065551.676490-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Luben Tuikov <luben.tuikov@amd.com>, Sarah Walker <sarah.walker@imgtec.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If I understand correctly, drm_sched_entity_kill_jobs_cb() is supposed
to wait on all the external dependencies (those added to
drm_sched_job::dependencies) before signaling the job finished fence.
This is done this way to prevent jobs depending on these canceled jobs
from considering the resources they want to access as ready, when
they're actually still used by other components, thus leading to
potential data corruptions.

The problem is, the kill_jobs logic is omitting the last fence popped
from the dependencies array that was waited upon before
drm_sched_entity_kill() was called (drm_sched_entity::dependency field),
so we're basically waiting for all dependencies except one.

This is an attempt at fixing that, but also an opportunity to make sure
I understood the drm_sched_entity_kill(), because I'm not 100% sure if
skipping this currently popped dependency was intentional or not. I can't
see a good reason why we'd want to skip that one, but I might be missing
something.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Sarah Walker <sarah.walker@imgtec.com>
Cc: Donald Robson <donald.robson@imgtec.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
---
Stumbled across this issue while working on native dependency support
with Donald (which will be posted soon). Flagged as RFC, because I'm
not sure this is legit, and also not sure we want to fix it this way.
I tried re-using drm_sched_entity::dependency, but it's a bit of a mess
because of the asynchronousity of the wait, and the fact we use
drm_sched_entity::dependency to know if we have a clear_dep()
callback registered, so we can easily reset it without removing the
callback.
---
 drivers/gpu/drm/scheduler/sched_entity.c | 40 ++++++++++++++++++------
 drivers/gpu/drm/scheduler/sched_main.c   |  3 ++
 include/drm/gpu_scheduler.h              | 12 +++++++
 3 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 68e807ae136a..3821f9adf7bd 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -176,20 +176,35 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 {
 	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
 						 finish_cb);
-	int r;
 
 	dma_fence_put(f);
 
-	/* Wait for all dependencies to avoid data corruptions */
-	while (!xa_empty(&job->dependencies)) {
-		f = xa_erase(&job->dependencies, job->last_dependency++);
-		r = dma_fence_add_callback(f, &job->finish_cb,
-					   drm_sched_entity_kill_jobs_cb);
-		if (!r)
+	/* Wait for all remaining dependencies to avoid data corruptions.
+	 *
+	 * We first check the last dependency popped from job->dependencies,
+	 * and then walk job->dependencies.
+	 *
+	 * Note that we don't wait on the last fence returned by
+	 * drm_gpu_scheduler_ops::prepare_job(), nor do we call
+	 * drm_gpu_scheduler_ops::prepare_job() to empty the list of potential
+	 * internal dependencies the driver might want to wait on before
+	 * scheduling the job. We simply assume skipping internal dependencies
+	 * can't cause data corruption on resources passed to the job.
+	 */
+	do {
+		f = job->cur_dep;
+
+		if (!xa_empty(&job->dependencies))
+			job->cur_dep = xa_erase(&job->dependencies, job->last_dependency++);
+		else
+			job->cur_dep = NULL;
+
+		if (f &&
+		    !dma_fence_add_callback(f, &job->finish_cb, drm_sched_entity_kill_jobs_cb))
 			return;
 
 		dma_fence_put(f);
-	}
+	} while (job->cur_dep);
 
 	INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
 	schedule_work(&job->work);
@@ -415,8 +430,13 @@ static struct dma_fence *
 drm_sched_job_dependency(struct drm_sched_job *job,
 			 struct drm_sched_entity *entity)
 {
-	if (!xa_empty(&job->dependencies))
-		return xa_erase(&job->dependencies, job->last_dependency++);
+	dma_fence_put(job->cur_dep);
+	job->cur_dep = NULL;
+
+	if (!xa_empty(&job->dependencies)) {
+		job->cur_dep = xa_erase(&job->dependencies, job->last_dependency++);
+		return dma_fence_get(job->cur_dep);
+	}
 
 	if (job->sched->ops->prepare_job)
 		return job->sched->ops->prepare_job(job, entity);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 394010a60821..70ab60e5760c 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -839,6 +839,9 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
 
 	job->s_fence = NULL;
 
+	if (WARN_ON(job->cur_dep))
+		dma_fence_put(job->cur_dep);
+
 	xa_for_each(&job->dependencies, index, fence) {
 		dma_fence_put(fence);
 	}
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index e95b4837e5a3..8e8e3decdc80 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -366,6 +366,18 @@ struct drm_sched_job {
 	/** @last_dependency: tracks @dependencies as they signal */
 	unsigned long			last_dependency;
 
+	/*
+	 * @cur_dep:
+	 *
+	 * Last dependency popped from @dependencies. Dependencies returned by
+	 * drm_gpu_scheculer_ops::prepare_job() are not recorded here.
+	 *
+	 * We need to keep track of the last dependencies popped from
+	 * @dependencies so we can wait on the already popped dependency when
+	 * drm_sched_entity_kill_jobs_cb() is called.
+	 */
+	struct dma_fence		*cur_dep;
+
 	/**
 	 * @submit_ts:
 	 *
-- 
2.40.1

