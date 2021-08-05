Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFB33E1329
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 12:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F23B6E9B7;
	Thu,  5 Aug 2021 10:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439356E808
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 10:47:22 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id g21so7725790edb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 03:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mS/2qj/YoP3wHNECb3bcIBaYcl6/9vObJYy6XAzcDBk=;
 b=H7+ENf7cckAeSO6IgwJq9X5NQNV1nTMewPXwGaE4OBSnx9kQleI+3gtyB4pgwi/Dzr
 d2ZjGKMq0cgXZTVAm2I/2L0BrnHZtRZnzmXJjSKhtOAI5VmFX2Tvy5tZDYMQ4GBS+T+j
 fjkgJOicSVxHonacPKcdnjoasONFveFgUij4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mS/2qj/YoP3wHNECb3bcIBaYcl6/9vObJYy6XAzcDBk=;
 b=Z414TUe8aiYPum+Pu3WdPXAsVUnYH6xy67OYwQpPlu5yVvNv/vjOcas5FLB93/RFoj
 FR2fG5nU+XcA8PySfyDeKBNXMsO6XMnU+pLFQS44iDuMeXZGnYa0E60QZcNly4w3TAHd
 QMhnjzN1wVdDSMXF++KfvxFyoZ04eTZx4yr2DvsneM3+KO6KSiw5u32VWaZkAmHO2wzG
 EwDWjQuhyPiqAkb15sULVLphqqV9xY5OpdjVqewzVCk/iENRdVzYQQIyk1wec0JHNtPf
 +4o9db47ZgcO1ybQI/K3StI8U/NFh6KJmn+5SNELvjiGAHROqzOms3QCXzcy1vSZUNi4
 D/OQ==
X-Gm-Message-State: AOAM532ynNfAdmzsghokBoJhJeuj+SFLC9oMhVosNahue58AEMItqEAA
 VgDDbaC/8m3eZbL/yu7dnjW6jxiMsldl8w==
X-Google-Smtp-Source: ABdhPJyQMdxQkAILO8juv3Ms70VbtTUKmxc6rvvhBmTSxFnYHFbYx8vRzHpfag+q1tf1oCbmC/96Qg==
X-Received: by 2002:a50:f1d8:: with SMTP id y24mr5636341edl.275.1628160440724; 
 Thu, 05 Aug 2021 03:47:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm1578809ejl.73.2021.08.05.03.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 03:47:20 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Melissa Wen <mwen@igalia.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <melissa.srw@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH v5 10/20] drm/v3d: Use scheduler dependency handling
Date: Thu,  5 Aug 2021 12:46:55 +0200
Message-Id: <20210805104705.862416-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the prep work out of the way this isn't tricky anymore.

Aside: The chaining of the various jobs is a bit awkward, with the
possibility of failure in bad places. I think with the
drm_sched_job_init/arm split and maybe preloading the
job->dependencies xarray this should be fixable.

v2: Rebase over renamed function names for adding dependencies.

Reviewed-by: Melissa Wen <mwen@igalia.com> (v1)
Acked-by: Emma Anholt <emma@anholt.net>
Cc: Melissa Wen <melissa.srw@gmail.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Emma Anholt <emma@anholt.net>
---
 drivers/gpu/drm/v3d/v3d_drv.h   |  5 -----
 drivers/gpu/drm/v3d/v3d_gem.c   | 26 +++++++++-----------------
 drivers/gpu/drm/v3d/v3d_sched.c | 29 +----------------------------
 3 files changed, 10 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index c1d433b4cf93..b900a050d5e2 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -234,11 +234,6 @@ struct v3d_job {
 	struct drm_gem_object **bo;
 	u32 bo_count;
 
-	/* Array of struct dma_fence * to block on before submitting this job.
-	 */
-	struct xarray deps;
-	unsigned long last_dep;
-
 	/* v3d fence to be signaled by IRQ handler when the job is complete. */
 	struct dma_fence *irq_fence;
 
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 42587248c54e..a3529809d547 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -259,8 +259,8 @@ v3d_lock_bo_reservations(struct v3d_job *job,
 		return ret;
 
 	for (i = 0; i < job->bo_count; i++) {
-		ret = drm_gem_fence_array_add_implicit(&job->deps,
-						       job->bo[i], true);
+		ret = drm_sched_job_add_implicit_dependencies(&job->base,
+							      job->bo[i], true);
 		if (ret) {
 			drm_gem_unlock_reservations(job->bo, job->bo_count,
 						    acquire_ctx);
@@ -356,8 +356,6 @@ static void
 v3d_job_free(struct kref *ref)
 {
 	struct v3d_job *job = container_of(ref, struct v3d_job, refcount);
-	unsigned long index;
-	struct dma_fence *fence;
 	int i;
 
 	for (i = 0; i < job->bo_count; i++) {
@@ -366,11 +364,6 @@ v3d_job_free(struct kref *ref)
 	}
 	kvfree(job->bo);
 
-	xa_for_each(&job->deps, index, fence) {
-		dma_fence_put(fence);
-	}
-	xa_destroy(&job->deps);
-
 	dma_fence_put(job->irq_fence);
 	dma_fence_put(job->done_fence);
 
@@ -457,7 +450,6 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	if (ret < 0)
 		return ret;
 
-	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
 	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
 				 v3d_priv);
 	if (ret)
@@ -467,7 +459,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	if (ret == -EINVAL)
 		goto fail_job;
 
-	ret = drm_gem_fence_array_add(&job->deps, in_fence);
+	ret = drm_sched_job_add_dependency(&job->base, in_fence);
 	if (ret)
 		goto fail_job;
 
@@ -477,7 +469,6 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 fail_job:
 	drm_sched_job_cleanup(&job->base);
 fail:
-	xa_destroy(&job->deps);
 	pm_runtime_put_autosuspend(v3d->drm.dev);
 	return ret;
 }
@@ -640,8 +631,8 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 		v3d_perfmon_get(bin->base.perfmon);
 		v3d_push_job(&bin->base);
 
-		ret = drm_gem_fence_array_add(&render->base.deps,
-					      dma_fence_get(bin->base.done_fence));
+		ret = drm_sched_job_add_dependency(&render->base.base,
+						   dma_fence_get(bin->base.done_fence));
 		if (ret)
 			goto fail_unreserve;
 	}
@@ -651,7 +642,8 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	if (clean_job) {
 		struct dma_fence *render_fence =
 			dma_fence_get(render->base.done_fence);
-		ret = drm_gem_fence_array_add(&clean_job->deps, render_fence);
+		ret = drm_sched_job_add_dependency(&clean_job->base,
+						   render_fence);
 		if (ret)
 			goto fail_unreserve;
 		clean_job->perfmon = render->base.perfmon;
@@ -853,8 +845,8 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 	mutex_lock(&v3d->sched_lock);
 	v3d_push_job(&job->base);
 
-	ret = drm_gem_fence_array_add(&clean_job->deps,
-				      dma_fence_get(job->base.done_fence));
+	ret = drm_sched_job_add_dependency(&clean_job->base,
+					   dma_fence_get(job->base.done_fence));
 	if (ret)
 		goto fail_unreserve;
 
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 7969797793d0..e0cb7d0697a7 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -13,7 +13,7 @@
  * jobs when bulk background jobs are queued up, we submit a new job
  * to the HW only when it has completed the last one, instead of
  * filling up the CT[01]Q FIFOs with jobs.  Similarly, we use
- * v3d_job_dependency() to manage the dependency between bin and
+ * drm_sched_job_add_dependency() to manage the dependency between bin and
  * render, instead of having the clients submit jobs using the HW's
  * semaphores to interlock between them.
  */
@@ -72,28 +72,6 @@ v3d_switch_perfmon(struct v3d_dev *v3d, struct v3d_job *job)
 		v3d_perfmon_start(v3d, job->perfmon);
 }
 
-/*
- * Returns the fences that the job depends on, one by one.
- *
- * If placed in the scheduler's .dependency method, the corresponding
- * .run_job won't be called until all of them have been signaled.
- */
-static struct dma_fence *
-v3d_job_dependency(struct drm_sched_job *sched_job,
-		   struct drm_sched_entity *s_entity)
-{
-	struct v3d_job *job = to_v3d_job(sched_job);
-
-	/* XXX: Wait on a fence for switching the GMP if necessary,
-	 * and then do so.
-	 */
-
-	if (!xa_empty(&job->deps))
-		return xa_erase(&job->deps, job->last_dep++);
-
-	return NULL;
-}
-
 static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
 {
 	struct v3d_bin_job *job = to_bin_job(sched_job);
@@ -372,35 +350,30 @@ v3d_csd_job_timedout(struct drm_sched_job *sched_job)
 }
 
 static const struct drm_sched_backend_ops v3d_bin_sched_ops = {
-	.dependency = v3d_job_dependency,
 	.run_job = v3d_bin_job_run,
 	.timedout_job = v3d_bin_job_timedout,
 	.free_job = v3d_sched_job_free,
 };
 
 static const struct drm_sched_backend_ops v3d_render_sched_ops = {
-	.dependency = v3d_job_dependency,
 	.run_job = v3d_render_job_run,
 	.timedout_job = v3d_render_job_timedout,
 	.free_job = v3d_sched_job_free,
 };
 
 static const struct drm_sched_backend_ops v3d_tfu_sched_ops = {
-	.dependency = v3d_job_dependency,
 	.run_job = v3d_tfu_job_run,
 	.timedout_job = v3d_generic_job_timedout,
 	.free_job = v3d_sched_job_free,
 };
 
 static const struct drm_sched_backend_ops v3d_csd_sched_ops = {
-	.dependency = v3d_job_dependency,
 	.run_job = v3d_csd_job_run,
 	.timedout_job = v3d_csd_job_timedout,
 	.free_job = v3d_sched_job_free
 };
 
 static const struct drm_sched_backend_ops v3d_cache_clean_sched_ops = {
-	.dependency = v3d_job_dependency,
 	.run_job = v3d_cache_clean_job_run,
 	.timedout_job = v3d_generic_job_timedout,
 	.free_job = v3d_sched_job_free
-- 
2.32.0

