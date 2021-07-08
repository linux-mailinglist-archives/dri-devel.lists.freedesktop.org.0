Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E60E3C1871
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 19:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AA86E96F;
	Thu,  8 Jul 2021 17:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD026E969
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 17:38:18 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso4549489wmj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 10:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lLEpaaIeWrrcnbM6as1GBSMCuKQAEtjxJwifI/VOOvE=;
 b=km4hwkKfIpyhsHrDbIiKBP542FAkaPvwePaZLHvbO7LE6UR0wJNzveEjl+3/iHg8Pp
 71BC3sv6FP3WoIyd+VRi8XnTDyplZKOoMyi1GBo5YHdQ7OdDhPq3SSNGWnC9zpkg+uBC
 NML7c5/hDtR2EB4OVT5heyedegjHaRyJX4KlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lLEpaaIeWrrcnbM6as1GBSMCuKQAEtjxJwifI/VOOvE=;
 b=rdttuuqGUZ6YZa0nNlIyMHgjW6uD3MYcEbXdtFvi8YakA6ab6McLBnttIudU92yMp0
 SMKpz5pqBY3SlumCxz88X6QzFp1S7G0mq3quRjXG9w2g3zBeFOsmdtGbC56iw/YFUigT
 W9ohuf/pDUx6QpNtLnSGutt2aJBKAu5J9olNchMWeZjTIlDTz1aoW+C2iSrDCrUOvGxi
 vbtvfzOrCo/isH2/esHaX0/bIQ8OiF4ym36GOg8FGxYnF/GawMUSDyQ6a9PC6bW7qnRT
 WizzhOGMYD49fUD7hereUrbBjoLD8eDWo/+gB4KKJ6W6cZmH1uJUphVDXr88zYc49/VI
 5K6w==
X-Gm-Message-State: AOAM5316W2BVlCDzmukdERIdSMqAB/T5pS3L0WZzeOQmG0rLTIScLJgg
 ouXksdxhcJloydW5655QOo4FN+8JWelBKQ==
X-Google-Smtp-Source: ABdhPJy/MXuaj/o+o87UbcvESh0fwhUiPc8kJGChmoERuDQzfxZLpiCUJs6ZNFYAeJIExVYv6lrRfA==
X-Received: by 2002:a05:600c:4ecc:: with SMTP id
 g12mr1126480wmq.176.1625765897247; 
 Thu, 08 Jul 2021 10:38:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l4sm2521853wme.26.2021.07.08.10.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:38:16 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 09/20] drm/v3d: Move drm_sched_job_init to v3d_job_init
Date: Thu,  8 Jul 2021 19:37:43 +0200
Message-Id: <20210708173754.3877540-10-daniel.vetter@ffwll.ch>
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
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prep work for using the scheduler dependency handling. We need to call
drm_sched_job_init earlier so we can use the new drm_sched_job_await*
functions for dependency handling here.

v2: Slightly better commit message and rebase to include the
drm_sched_job_arm() call (Emma).

v3: Cleanup jobs under construction correctly (Emma)

Cc: Melissa Wen <melissa.srw@gmail.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Emma Anholt <emma@anholt.net>
---
 drivers/gpu/drm/v3d/v3d_drv.h   |  1 +
 drivers/gpu/drm/v3d/v3d_gem.c   | 88 ++++++++++++++-------------------
 drivers/gpu/drm/v3d/v3d_sched.c | 15 +++---
 3 files changed, 44 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 8a390738d65b..1d870261eaac 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -332,6 +332,7 @@ int v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 			 struct drm_file *file_priv);
 int v3d_wait_bo_ioctl(struct drm_device *dev, void *data,
 		      struct drm_file *file_priv);
+void v3d_job_cleanup(struct v3d_job *job);
 void v3d_job_put(struct v3d_job *job);
 void v3d_reset(struct v3d_dev *v3d);
 void v3d_invalidate_caches(struct v3d_dev *v3d);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 69ac20e11b09..5eccd3658938 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -392,6 +392,12 @@ v3d_render_job_free(struct kref *ref)
 	v3d_job_free(ref);
 }
 
+void v3d_job_cleanup(struct v3d_job *job)
+{
+	drm_sched_job_cleanup(&job->base);
+	v3d_job_put(job);
+}
+
 void v3d_job_put(struct v3d_job *job)
 {
 	kref_put(&job->refcount, job->free);
@@ -433,9 +439,10 @@ v3d_wait_bo_ioctl(struct drm_device *dev, void *data,
 static int
 v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	     struct v3d_job *job, void (*free)(struct kref *ref),
-	     u32 in_sync)
+	     u32 in_sync, enum v3d_queue queue)
 {
 	struct dma_fence *in_fence = NULL;
+	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
 	int ret;
 
 	job->v3d = v3d;
@@ -446,35 +453,33 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 		return ret;
 
 	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
+	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
+				 v3d_priv);
+	if (ret)
+		goto fail;
 
 	ret = drm_syncobj_find_fence(file_priv, in_sync, 0, 0, &in_fence);
 	if (ret == -EINVAL)
-		goto fail;
+		goto fail_job;
 
 	ret = drm_gem_fence_array_add(&job->deps, in_fence);
 	if (ret)
-		goto fail;
+		goto fail_job;
 
 	kref_init(&job->refcount);
 
 	return 0;
+fail_job:
+	drm_sched_job_cleanup(&job->base);
 fail:
 	xa_destroy(&job->deps);
 	pm_runtime_put_autosuspend(v3d->drm.dev);
 	return ret;
 }
 
-static int
-v3d_push_job(struct v3d_file_priv *v3d_priv,
-	     struct v3d_job *job, enum v3d_queue queue)
+static void
+v3d_push_job(struct v3d_job *job)
 {
-	int ret;
-
-	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
-				 v3d_priv);
-	if (ret)
-		return ret;
-
 	drm_sched_job_arm(&job->base);
 
 	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
@@ -483,8 +488,6 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
 	kref_get(&job->refcount);
 
 	drm_sched_entity_push_job(&job->base);
-
-	return 0;
 }
 
 static void
@@ -530,7 +533,6 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 		    struct drm_file *file_priv)
 {
 	struct v3d_dev *v3d = to_v3d_dev(dev);
-	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
 	struct drm_v3d_submit_cl *args = data;
 	struct v3d_bin_job *bin = NULL;
 	struct v3d_render_job *render;
@@ -556,7 +558,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	INIT_LIST_HEAD(&render->unref_list);
 
 	ret = v3d_job_init(v3d, file_priv, &render->base,
-			   v3d_render_job_free, args->in_sync_rcl);
+			   v3d_render_job_free, args->in_sync_rcl, V3D_RENDER);
 	if (ret) {
 		kfree(render);
 		return ret;
@@ -570,7 +572,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 		}
 
 		ret = v3d_job_init(v3d, file_priv, &bin->base,
-				   v3d_job_free, args->in_sync_bcl);
+				   v3d_job_free, args->in_sync_bcl, V3D_BIN);
 		if (ret) {
 			v3d_job_put(&render->base);
 			kfree(bin);
@@ -592,7 +594,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 			goto fail;
 		}
 
-		ret = v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0);
+		ret = v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0, V3D_CACHE_CLEAN);
 		if (ret) {
 			kfree(clean_job);
 			clean_job = NULL;
@@ -615,9 +617,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 
 	mutex_lock(&v3d->sched_lock);
 	if (bin) {
-		ret = v3d_push_job(v3d_priv, &bin->base, V3D_BIN);
-		if (ret)
-			goto fail_unreserve;
+		v3d_push_job(&bin->base);
 
 		ret = drm_gem_fence_array_add(&render->base.deps,
 					      dma_fence_get(bin->base.done_fence));
@@ -625,9 +625,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 			goto fail_unreserve;
 	}
 
-	ret = v3d_push_job(v3d_priv, &render->base, V3D_RENDER);
-	if (ret)
-		goto fail_unreserve;
+	v3d_push_job(&render->base);
 
 	if (clean_job) {
 		struct dma_fence *render_fence =
@@ -635,9 +633,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 		ret = drm_gem_fence_array_add(&clean_job->deps, render_fence);
 		if (ret)
 			goto fail_unreserve;
-		ret = v3d_push_job(v3d_priv, clean_job, V3D_CACHE_CLEAN);
-		if (ret)
-			goto fail_unreserve;
+		v3d_push_job(clean_job);
 	}
 
 	mutex_unlock(&v3d->sched_lock);
@@ -662,10 +658,10 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 				    last_job->bo_count, &acquire_ctx);
 fail:
 	if (bin)
-		v3d_job_put(&bin->base);
-	v3d_job_put(&render->base);
+		v3d_job_cleanup(&bin->base);
+	v3d_job_cleanup(&render->base);
 	if (clean_job)
-		v3d_job_put(clean_job);
+		v3d_job_cleanup(clean_job);
 
 	return ret;
 }
@@ -684,7 +680,6 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file_priv)
 {
 	struct v3d_dev *v3d = to_v3d_dev(dev);
-	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
 	struct drm_v3d_submit_tfu *args = data;
 	struct v3d_tfu_job *job;
 	struct ww_acquire_ctx acquire_ctx;
@@ -697,7 +692,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 		return -ENOMEM;
 
 	ret = v3d_job_init(v3d, file_priv, &job->base,
-			   v3d_job_free, args->in_sync);
+			   v3d_job_free, args->in_sync, V3D_TFU);
 	if (ret) {
 		kfree(job);
 		return ret;
@@ -741,9 +736,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 		goto fail;
 
 	mutex_lock(&v3d->sched_lock);
-	ret = v3d_push_job(v3d_priv, &job->base, V3D_TFU);
-	if (ret)
-		goto fail_unreserve;
+	v3d_push_job(&job->base);
 	mutex_unlock(&v3d->sched_lock);
 
 	v3d_attach_fences_and_unlock_reservation(file_priv,
@@ -755,12 +748,8 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 
 	return 0;
 
-fail_unreserve:
-	mutex_unlock(&v3d->sched_lock);
-	drm_gem_unlock_reservations(job->base.bo, job->base.bo_count,
-				    &acquire_ctx);
 fail:
-	v3d_job_put(&job->base);
+	v3d_job_cleanup(&job->base);
 
 	return ret;
 }
@@ -779,7 +768,6 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file_priv)
 {
 	struct v3d_dev *v3d = to_v3d_dev(dev);
-	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
 	struct drm_v3d_submit_csd *args = data;
 	struct v3d_csd_job *job;
 	struct v3d_job *clean_job;
@@ -798,7 +786,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 		return -ENOMEM;
 
 	ret = v3d_job_init(v3d, file_priv, &job->base,
-			   v3d_job_free, args->in_sync);
+			   v3d_job_free, args->in_sync, V3D_CSD);
 	if (ret) {
 		kfree(job);
 		return ret;
@@ -811,7 +799,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 		return -ENOMEM;
 	}
 
-	ret = v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0);
+	ret = v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0, V3D_CACHE_CLEAN);
 	if (ret) {
 		v3d_job_put(&job->base);
 		kfree(clean_job);
@@ -830,18 +818,14 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 		goto fail;
 
 	mutex_lock(&v3d->sched_lock);
-	ret = v3d_push_job(v3d_priv, &job->base, V3D_CSD);
-	if (ret)
-		goto fail_unreserve;
+	v3d_push_job(&job->base);
 
 	ret = drm_gem_fence_array_add(&clean_job->deps,
 				      dma_fence_get(job->base.done_fence));
 	if (ret)
 		goto fail_unreserve;
 
-	ret = v3d_push_job(v3d_priv, clean_job, V3D_CACHE_CLEAN);
-	if (ret)
-		goto fail_unreserve;
+	v3d_push_job(clean_job);
 	mutex_unlock(&v3d->sched_lock);
 
 	v3d_attach_fences_and_unlock_reservation(file_priv,
@@ -860,8 +844,8 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 	drm_gem_unlock_reservations(clean_job->bo, clean_job->bo_count,
 				    &acquire_ctx);
 fail:
-	v3d_job_put(&job->base);
-	v3d_job_put(clean_job);
+	v3d_job_cleanup(&job->base);
+	v3d_job_cleanup(clean_job);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index a39bdd5cfc4f..3f352d73af9c 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -55,12 +55,11 @@ to_csd_job(struct drm_sched_job *sched_job)
 }
 
 static void
-v3d_job_free(struct drm_sched_job *sched_job)
+v3d_sched_job_free(struct drm_sched_job *sched_job)
 {
 	struct v3d_job *job = to_v3d_job(sched_job);
 
-	drm_sched_job_cleanup(sched_job);
-	v3d_job_put(job);
+	v3d_job_cleanup(job);
 }
 
 /*
@@ -360,35 +359,35 @@ static const struct drm_sched_backend_ops v3d_bin_sched_ops = {
 	.dependency = v3d_job_dependency,
 	.run_job = v3d_bin_job_run,
 	.timedout_job = v3d_bin_job_timedout,
-	.free_job = v3d_job_free,
+	.free_job = v3d_sched_job_free,
 };
 
 static const struct drm_sched_backend_ops v3d_render_sched_ops = {
 	.dependency = v3d_job_dependency,
 	.run_job = v3d_render_job_run,
 	.timedout_job = v3d_render_job_timedout,
-	.free_job = v3d_job_free,
+	.free_job = v3d_sched_job_free,
 };
 
 static const struct drm_sched_backend_ops v3d_tfu_sched_ops = {
 	.dependency = v3d_job_dependency,
 	.run_job = v3d_tfu_job_run,
 	.timedout_job = v3d_generic_job_timedout,
-	.free_job = v3d_job_free,
+	.free_job = v3d_sched_job_free,
 };
 
 static const struct drm_sched_backend_ops v3d_csd_sched_ops = {
 	.dependency = v3d_job_dependency,
 	.run_job = v3d_csd_job_run,
 	.timedout_job = v3d_csd_job_timedout,
-	.free_job = v3d_job_free
+	.free_job = v3d_sched_job_free
 };
 
 static const struct drm_sched_backend_ops v3d_cache_clean_sched_ops = {
 	.dependency = v3d_job_dependency,
 	.run_job = v3d_cache_clean_job_run,
 	.timedout_job = v3d_generic_job_timedout,
-	.free_job = v3d_job_free
+	.free_job = v3d_sched_job_free
 };
 
 int
-- 
2.32.0

