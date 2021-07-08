Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FAB3C1875
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 19:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097526E972;
	Thu,  8 Jul 2021 17:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B2F6E96D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 17:38:19 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 i2-20020a05600c3542b02902058529ea07so4544122wmq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 10:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dxGuluIgPsNrxWTD1ehru33Wm1+EqWPJ5Ymt3NUsZ5o=;
 b=etXMTCCZ4zk51yiDFV/XYRS1EBZFmcMZ2/QlNfxG6mNoDDVBPZp1FoiC3EAEW+aRdG
 QfmH4K05ycR9+Yxm0OdR197ZaP/f/Lkfz8fv5zqg/4+20sT7kWz5vind2v80gPHMUobR
 eyoySDUHx5L4OcwENXA37QOsLHCkjBmYj/4WE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dxGuluIgPsNrxWTD1ehru33Wm1+EqWPJ5Ymt3NUsZ5o=;
 b=e/b7pyvthLGlX6INaFtCVT5Lun87cCyFuEsSgsaAuAOAXLp2fKLwHbHhT0nsy63znU
 ROhhd7W7H6qkSTXmpATdsFT8nr/NC1AU4zXD0rj1aK0v3CYdKW+uSXTdLOv619jf00QX
 PvzpCHLAc7zvchfavXCWUF01zMxFpbyt+3Y443CaEGpXASPAUUxhAlecJB8gEUfAH8XH
 47tFxe7D130igFSXzhDPUj1khT1kU64unorvixMVLI0Pf33yP5A9Inl1lJGE41N+QNTY
 Yz8HB16XK+Mdet4fTwbJlQf44Cxa+krquoBvpCHOHFW5FNSZ1I+8auw9YTgNTdaIBIJg
 ++oQ==
X-Gm-Message-State: AOAM530V6ti4L6h1XUMf1bkQ7dqmvPGT1SvMEykPkXyopRta4t3/mf3t
 QyFdljvYtMELHMwe/mA7ukDvmGLUG1L+5g==
X-Google-Smtp-Source: ABdhPJwtSNECUSdCotf3mbOTSa7AcPifWBqpyWNzmS4M0yM1OOjQJhpG0hRjLqaNUVIe/Yim5AZnfw==
X-Received: by 2002:a1c:6a16:: with SMTP id f22mr34564169wmc.53.1625765898210; 
 Thu, 08 Jul 2021 10:38:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l4sm2521853wme.26.2021.07.08.10.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:38:17 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 10/20] drm/v3d: Use scheduler dependency handling
Date: Thu,  8 Jul 2021 19:37:44 +0200
Message-Id: <20210708173754.3877540-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
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
Cc: Melissa Wen <melissa.srw@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "Cc : Emma Anholt" <emma@anholt.net>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the prep work out of the way this isn't tricky anymore.

Aside: The chaining of the various jobs is a bit awkward, with the
possibility of failure in bad places. I think with the
drm_sched_job_init/arm split and maybe preloading the
job->dependencies xarray this should be fixable.

Cc: Melissa Wen <melissa.srw@gmail.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Cc: Emma Anholt <emma@anholt.net>
---
 drivers/gpu/drm/v3d/v3d_drv.h   |  5 -----
 drivers/gpu/drm/v3d/v3d_gem.c   | 25 ++++++++-----------------
 drivers/gpu/drm/v3d/v3d_sched.c | 29 +----------------------------
 3 files changed, 9 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 1d870261eaac..f80f4ff1f7aa 100644
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
index 5eccd3658938..42b07ffbea5e 100644
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
 
@@ -452,7 +445,6 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	if (ret < 0)
 		return ret;
 
-	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
 	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
 				 v3d_priv);
 	if (ret)
@@ -462,7 +454,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	if (ret == -EINVAL)
 		goto fail_job;
 
-	ret = drm_gem_fence_array_add(&job->deps, in_fence);
+	ret = drm_sched_job_await_fence(&job->base, in_fence);
 	if (ret)
 		goto fail_job;
 
@@ -472,7 +464,6 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 fail_job:
 	drm_sched_job_cleanup(&job->base);
 fail:
-	xa_destroy(&job->deps);
 	pm_runtime_put_autosuspend(v3d->drm.dev);
 	return ret;
 }
@@ -619,8 +610,8 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	if (bin) {
 		v3d_push_job(&bin->base);
 
-		ret = drm_gem_fence_array_add(&render->base.deps,
-					      dma_fence_get(bin->base.done_fence));
+		ret = drm_sched_job_await_fence(&render->base.base,
+						dma_fence_get(bin->base.done_fence));
 		if (ret)
 			goto fail_unreserve;
 	}
@@ -630,7 +621,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	if (clean_job) {
 		struct dma_fence *render_fence =
 			dma_fence_get(render->base.done_fence);
-		ret = drm_gem_fence_array_add(&clean_job->deps, render_fence);
+		ret = drm_sched_job_await_fence(&clean_job->base, render_fence);
 		if (ret)
 			goto fail_unreserve;
 		v3d_push_job(clean_job);
@@ -820,8 +811,8 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 	mutex_lock(&v3d->sched_lock);
 	v3d_push_job(&job->base);
 
-	ret = drm_gem_fence_array_add(&clean_job->deps,
-				      dma_fence_get(job->base.done_fence));
+	ret = drm_sched_job_await_fence(&clean_job->base,
+					dma_fence_get(job->base.done_fence));
 	if (ret)
 		goto fail_unreserve;
 
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 3f352d73af9c..f0de584f452c 100644
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
@@ -62,28 +62,6 @@ v3d_sched_job_free(struct drm_sched_job *sched_job)
 	v3d_job_cleanup(job);
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
@@ -356,35 +334,30 @@ v3d_csd_job_timedout(struct drm_sched_job *sched_job)
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

