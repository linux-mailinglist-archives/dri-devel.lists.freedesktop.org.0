Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B47413C648E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 22:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FBD89DB4;
	Mon, 12 Jul 2021 20:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F8489DD2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 20:02:05 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso826381wmj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 13:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+0jQYIsm5Js9C1AjIzuq6eeQkARdEqcH+X7YWC5aMAo=;
 b=MsFUEyt0amcc/5aIeCGjA5X/fPAGcaemhqCDWttlOgkKliOGhW78Tq/JrwN1yyHXyN
 xO3HSYozDNVLo3wHCOBM+srpZiAJ95kKxjMkwcx6eT88UKpGsQiB40ztQ1UP9WywAvqd
 87Us5mW8uNip8VWCpwxwt3adVeFljxAcLfA10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+0jQYIsm5Js9C1AjIzuq6eeQkARdEqcH+X7YWC5aMAo=;
 b=ngTFHMaBBSHH/bgeNy+wocAubntNmb974mVh2P7yigmy7wYC2I39puRbm5t7NbaUzB
 CYfzOyr8GZa6O3LI4D6M7XB3SSxHOGy1YhyI4j7sTAzArbQlTklS1mDT2ZtiNbWEpSMF
 LaICekAo1sPUMDP/a55U90f642vPyi2n2aLorfpoKrrO8lIRH6VMFWZFs78dVAmLBJTV
 vd4cY4rmsu2N9VQJ8ZlgI+E4RxqXrVAdu/ZAjEYWK09vVyHkFOBEWOi7TLKwFDsrGVOZ
 ppFOPtb4dHd0X3XJyGehhqpgQC9HnGGgoroD/N7ngQ0Qdf0wNxGkrggj2xWcC3h6O/sw
 VeLg==
X-Gm-Message-State: AOAM532bHfUHTjDZTcAjSProQWw74gg+jPjUmQBW5kJJCNQVAu3mMVNX
 G2mJnUOmkh3w2MtMvoaIjpNnXknCi+1XeA==
X-Google-Smtp-Source: ABdhPJwUIaG4n4vquSxoVNtBJZqvn2Eps/h+0H0QVUubGzscK0wRQ39PS7+zWCKH5y//LRTwjbeEQQ==
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr16790644wmq.153.1626120124338; 
 Mon, 12 Jul 2021 13:02:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l14sm9858221wrs.22.2021.07.12.13.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 13:02:03 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 06/18] drm/panfrost: use scheduler dependency tracking
Date: Mon, 12 Jul 2021 19:53:40 +0200
Message-Id: <20210712175352.802687-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, linaro-mm-sig@lists.linaro.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just deletes some code that's now more shared.

Note that thanks to the split into drm_sched_job_init/arm we can now
easily pull the _init() part from under the submission lock way ahead
where we're adding the sync file in-fences as dependencies.

v2: Correctly clean up the partially set up job, now that job_init()
and job_arm() are apart (Emma).

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 16 ++++++++---
 drivers/gpu/drm/panfrost/panfrost_job.c | 37 +++----------------------
 drivers/gpu/drm/panfrost/panfrost_job.h |  5 +---
 3 files changed, 17 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 1ffaef5ec5ff..9f53bea07d61 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -218,7 +218,7 @@ panfrost_copy_in_sync(struct drm_device *dev,
 		if (ret)
 			goto fail;
 
-		ret = drm_gem_fence_array_add(&job->deps, fence);
+		ret = drm_sched_job_await_fence(&job->base, fence);
 
 		if (ret)
 			goto fail;
@@ -236,7 +236,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 	struct drm_panfrost_submit *args = data;
 	struct drm_syncobj *sync_out = NULL;
 	struct panfrost_job *job;
-	int ret = 0;
+	int ret = 0, slot;
 
 	if (!args->jc)
 		return -EINVAL;
@@ -258,14 +258,20 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 
 	kref_init(&job->refcount);
 
-	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
-
 	job->pfdev = pfdev;
 	job->jc = args->jc;
 	job->requirements = args->requirements;
 	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
 	job->file_priv = file->driver_priv;
 
+	slot = panfrost_job_get_slot(job);
+
+	ret = drm_sched_job_init(&job->base,
+				 &job->file_priv->sched_entity[slot],
+				 NULL);
+	if (ret)
+		goto fail_job_put;
+
 	ret = panfrost_copy_in_sync(dev, file, args, job);
 	if (ret)
 		goto fail_job;
@@ -283,6 +289,8 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 		drm_syncobj_replace_fence(sync_out, job->render_done_fence);
 
 fail_job:
+	drm_sched_job_cleanup(&job->base);
+fail_job_put:
 	panfrost_job_put(job);
 fail_out_sync:
 	if (sync_out)
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 4bc962763e1f..86c843d8822e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -102,7 +102,7 @@ static struct dma_fence *panfrost_fence_create(struct panfrost_device *pfdev, in
 	return &fence->base;
 }
 
-static int panfrost_job_get_slot(struct panfrost_job *job)
+int panfrost_job_get_slot(struct panfrost_job *job)
 {
 	/* JS0: fragment jobs.
 	 * JS1: vertex/tiler jobs
@@ -242,13 +242,13 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 
 static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
 					  int bo_count,
-					  struct xarray *deps)
+					  struct drm_sched_job *job)
 {
 	int i, ret;
 
 	for (i = 0; i < bo_count; i++) {
 		/* panfrost always uses write mode in its current uapi */
-		ret = drm_gem_fence_array_add_implicit(deps, bos[i], true);
+		ret = drm_sched_job_await_implicit(job, bos[i], true);
 		if (ret)
 			return ret;
 	}
@@ -269,31 +269,21 @@ static void panfrost_attach_object_fences(struct drm_gem_object **bos,
 int panfrost_job_push(struct panfrost_job *job)
 {
 	struct panfrost_device *pfdev = job->pfdev;
-	int slot = panfrost_job_get_slot(job);
-	struct drm_sched_entity *entity = &job->file_priv->sched_entity[slot];
 	struct ww_acquire_ctx acquire_ctx;
 	int ret = 0;
 
-
 	ret = drm_gem_lock_reservations(job->bos, job->bo_count,
 					    &acquire_ctx);
 	if (ret)
 		return ret;
 
 	mutex_lock(&pfdev->sched_lock);
-
-	ret = drm_sched_job_init(&job->base, entity, NULL);
-	if (ret) {
-		mutex_unlock(&pfdev->sched_lock);
-		goto unlock;
-	}
-
 	drm_sched_job_arm(&job->base);
 
 	job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
 
 	ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
-					     &job->deps);
+					     &job->base);
 	if (ret) {
 		mutex_unlock(&pfdev->sched_lock);
 		goto unlock;
@@ -318,15 +308,8 @@ static void panfrost_job_cleanup(struct kref *ref)
 {
 	struct panfrost_job *job = container_of(ref, struct panfrost_job,
 						refcount);
-	struct dma_fence *fence;
-	unsigned long index;
 	unsigned int i;
 
-	xa_for_each(&job->deps, index, fence) {
-		dma_fence_put(fence);
-	}
-	xa_destroy(&job->deps);
-
 	dma_fence_put(job->done_fence);
 	dma_fence_put(job->render_done_fence);
 
@@ -365,17 +348,6 @@ static void panfrost_job_free(struct drm_sched_job *sched_job)
 	panfrost_job_put(job);
 }
 
-static struct dma_fence *panfrost_job_dependency(struct drm_sched_job *sched_job,
-						 struct drm_sched_entity *s_entity)
-{
-	struct panfrost_job *job = to_panfrost_job(sched_job);
-
-	if (!xa_empty(&job->deps))
-		return xa_erase(&job->deps, job->last_dep++);
-
-	return NULL;
-}
-
 static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
 {
 	struct panfrost_job *job = to_panfrost_job(sched_job);
@@ -765,7 +737,6 @@ static void panfrost_reset_work(struct work_struct *work)
 }
 
 static const struct drm_sched_backend_ops panfrost_sched_ops = {
-	.dependency = panfrost_job_dependency,
 	.run_job = panfrost_job_run,
 	.timedout_job = panfrost_job_timedout,
 	.free_job = panfrost_job_free
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index 82306a03b57e..77e6d0e6f612 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -19,10 +19,6 @@ struct panfrost_job {
 	struct panfrost_device *pfdev;
 	struct panfrost_file_priv *file_priv;
 
-	/* Contains both explicit and implicit fences */
-	struct xarray deps;
-	unsigned long last_dep;
-
 	/* Fence to be signaled by IRQ handler when the job is complete. */
 	struct dma_fence *done_fence;
 
@@ -42,6 +38,7 @@ int panfrost_job_init(struct panfrost_device *pfdev);
 void panfrost_job_fini(struct panfrost_device *pfdev);
 int panfrost_job_open(struct panfrost_file_priv *panfrost_priv);
 void panfrost_job_close(struct panfrost_file_priv *panfrost_priv);
+int panfrost_job_get_slot(struct panfrost_job *job);
 int panfrost_job_push(struct panfrost_job *job);
 void panfrost_job_put(struct panfrost_job *job);
 void panfrost_job_enable_interrupts(struct panfrost_device *pfdev);
-- 
2.32.0

