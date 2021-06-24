Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7073B30BE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFE66EBA8;
	Thu, 24 Jun 2021 14:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35296EB9C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:00:39 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id f15so6791986wro.8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 07:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yA5hS9MK3qvVWE7RqPb6C+y3gsZ51KrUZME4lo6gw+s=;
 b=fiY24WtuK08MCRsSCnrRShqgaZFXBk9Zh1jXcFF0WJl8nu8D/sYDlpaXNh/pBXOdRm
 66bs6SvNqTXxyEaeyw18fG/F4PCTD1b2KhO/SapwNgYLGaeQPMeID0yUj5+E7/SS3Y+N
 N71mB5hs+zHNIxQkNVU8eajCezhpWUhUElOFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yA5hS9MK3qvVWE7RqPb6C+y3gsZ51KrUZME4lo6gw+s=;
 b=iRZ3PlUVUJSHh+1PAHFHP+hXoIVLi+RX+6VTGNlGASLolCO7p0ioJnAzthu4sZ/R7d
 +iSNkClwrYaTFLB5bEH3ghjE2LzAz5fl7/yDPFs3UvcnMQFZxzWVIJ6acqJCiKAu3iK5
 VIPbWO7SG7XpfHhghYdLqiHK2B2vBpvVH487DAdjCSooIMt9YDegNz2JWZMsZgg+0bhb
 wWpMxuAhST9YIx2RGhElUyookq4EG/eGN31hKXpxKFIAKj2l0yBXQ62RNRchNV7CxO4D
 WSxWJxOqQ87jAzGRLNM5Lc9kCrYY36pimqGD1/++mq4CtHlA5Gfc3C+9P1gSSGSQ/3gY
 cWzA==
X-Gm-Message-State: AOAM531dlf6yx9V6dNT6ziK55XT4o7LADocL7kmfwRNxgcAGEE2US3pM
 Woyr3kRhU8UVF9bvxjqpZSbFQ5/DBGx0qg==
X-Google-Smtp-Source: ABdhPJy3ZYn61i+bkE7ie515iLSpyBUQPrbzrIWsnICGOMfg+0hNEIaAlT83QvI+nko2fS/H4wjGbA==
X-Received: by 2002:a5d:5388:: with SMTP id d8mr4527807wrv.423.1624543238404; 
 Thu, 24 Jun 2021 07:00:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm3600167wrd.25.2021.06.24.07.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:00:38 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/11] drm/v3d: Use scheduler dependency handling
Date: Thu, 24 Jun 2021 16:00:21 +0200
Message-Id: <20210624140025.438303-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the prep work out of the way this isn't tricky anymore.

Aside: The chaining of the various jobs is a bit awkward, with the
possibility of failure in bad places. I think with the
drm_sched_job_init/arm split and maybe preloading the
job->dependencies xarray this should be fixable.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h   |  5 -----
 drivers/gpu/drm/v3d/v3d_gem.c   | 25 ++++++++-----------------
 drivers/gpu/drm/v3d/v3d_sched.c | 29 +----------------------------
 3 files changed, 9 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 8a390738d65b..73559eb368a7 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -192,11 +192,6 @@ struct v3d_job {
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
index 40302c77e667..c54684f8b877 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -257,8 +257,8 @@ v3d_lock_bo_reservations(struct v3d_job *job,
 		return ret;
 
 	for (i = 0; i < job->bo_count; i++) {
-		ret = drm_gem_fence_array_add_implicit(&job->deps,
-						       job->bo[i], true);
+		ret = drm_sched_job_await_implicit(&job->base,
+						   job->bo[i], true);
 		if (ret) {
 			drm_gem_unlock_reservations(job->bo, job->bo_count,
 						    acquire_ctx);
@@ -354,8 +354,6 @@ static void
 v3d_job_free(struct kref *ref)
 {
 	struct v3d_job *job = container_of(ref, struct v3d_job, refcount);
-	unsigned long index;
-	struct dma_fence *fence;
 	int i;
 
 	for (i = 0; i < job->bo_count; i++) {
@@ -364,11 +362,6 @@ v3d_job_free(struct kref *ref)
 	}
 	kvfree(job->bo);
 
-	xa_for_each(&job->deps, index, fence) {
-		dma_fence_put(fence);
-	}
-	xa_destroy(&job->deps);
-
 	dma_fence_put(job->irq_fence);
 	dma_fence_put(job->done_fence);
 
@@ -446,7 +439,6 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	if (ret < 0)
 		return ret;
 
-	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
 	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
 				 v3d_priv);
 	if (ret)
@@ -456,7 +448,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	if (ret == -EINVAL)
 		goto fail;
 
-	ret = drm_gem_fence_array_add(&job->deps, in_fence);
+	ret = drm_sched_job_await_fence(&job->base, in_fence);
 	if (ret)
 		goto fail;
 
@@ -464,7 +456,6 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 
 	return 0;
 fail:
-	xa_destroy(&job->deps);
 	pm_runtime_put_autosuspend(v3d->drm.dev);
 	return ret;
 }
@@ -609,8 +600,8 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	if (bin) {
 		v3d_push_job(&bin->base);
 
-		ret = drm_gem_fence_array_add(&render->base.deps,
-					      dma_fence_get(bin->base.done_fence));
+		ret = drm_sched_job_await_fence(&render->base.base,
+						dma_fence_get(bin->base.done_fence));
 		if (ret)
 			goto fail_unreserve;
 	}
@@ -620,7 +611,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	if (clean_job) {
 		struct dma_fence *render_fence =
 			dma_fence_get(render->base.done_fence);
-		ret = drm_gem_fence_array_add(&clean_job->deps, render_fence);
+		ret = drm_sched_job_await_fence(&clean_job->base, render_fence);
 		if (ret)
 			goto fail_unreserve;
 		v3d_push_job(clean_job);
@@ -810,8 +801,8 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 	mutex_lock(&v3d->sched_lock);
 	v3d_push_job(&job->base);
 
-	ret = drm_gem_fence_array_add(&clean_job->deps,
-				      dma_fence_get(job->base.done_fence));
+	ret = drm_sched_job_await_fence(&clean_job->base,
+					dma_fence_get(job->base.done_fence));
 	if (ret)
 		goto fail_unreserve;
 
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 8992480c88fa..3af6a09764c7 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -13,7 +13,7 @@
  * jobs when bulk background jobs are queued up, we submit a new job
  * to the HW only when it has completed the last one, instead of
  * filling up the CT[01]Q FIFOs with jobs.  Similarly, we use
- * v3d_job_dependency() to manage the dependency between bin and
+ * drm_sched_job_await_fence() to manage the dependency between bin and
  * render, instead of having the clients submit jobs using the HW's
  * semaphores to interlock between them.
  */
@@ -63,28 +63,6 @@ v3d_job_free(struct drm_sched_job *sched_job)
 	v3d_job_put(job);
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
@@ -357,35 +335,30 @@ v3d_csd_job_timedout(struct drm_sched_job *sched_job)
 }
 
 static const struct drm_sched_backend_ops v3d_bin_sched_ops = {
-	.dependency = v3d_job_dependency,
 	.run_job = v3d_bin_job_run,
 	.timedout_job = v3d_bin_job_timedout,
 	.free_job = v3d_job_free,
 };
 
 static const struct drm_sched_backend_ops v3d_render_sched_ops = {
-	.dependency = v3d_job_dependency,
 	.run_job = v3d_render_job_run,
 	.timedout_job = v3d_render_job_timedout,
 	.free_job = v3d_job_free,
 };
 
 static const struct drm_sched_backend_ops v3d_tfu_sched_ops = {
-	.dependency = v3d_job_dependency,
 	.run_job = v3d_tfu_job_run,
 	.timedout_job = v3d_generic_job_timedout,
 	.free_job = v3d_job_free,
 };
 
 static const struct drm_sched_backend_ops v3d_csd_sched_ops = {
-	.dependency = v3d_job_dependency,
 	.run_job = v3d_csd_job_run,
 	.timedout_job = v3d_csd_job_timedout,
 	.free_job = v3d_job_free
 };
 
 static const struct drm_sched_backend_ops v3d_cache_clean_sched_ops = {
-	.dependency = v3d_job_dependency,
 	.run_job = v3d_cache_clean_job_run,
 	.timedout_job = v3d_generic_job_timedout,
 	.free_job = v3d_job_free
-- 
2.32.0.rc2

