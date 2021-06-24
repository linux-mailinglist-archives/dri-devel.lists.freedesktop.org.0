Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DD23B30AC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525416EB97;
	Thu, 24 Jun 2021 14:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5976EB9E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:00:38 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id e22so6817948wrc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 07:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TaY8I8PQKe+ae2ytXcmHUgJ+unUJZgLDx20FzO6F5G4=;
 b=cYY9u8yaTce0gHBfd2m1c79aucx/1603P6Gt4t95V8Wpm1SPeACTZOm4/Dhb8jeAQp
 VDBNIMAR8bnalaHeprkq0I11DJTH4zNw6JJ/aon+iigFjueSdG7Q4ceJWcqXIqKXanB/
 NufInT3KKKHOeosun0zWNePQUDpF/hz2zMhQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TaY8I8PQKe+ae2ytXcmHUgJ+unUJZgLDx20FzO6F5G4=;
 b=bSWmfnMig0DsMHa0t+49ocbrXUhcWLYvvSbAXWdeZenLaQEf3mTP9nQVTHzzL7/s6w
 9RThfIslxFcUUYB0wv2btWhhxaVBCEnnEpqzFVM0j+jj4OQdPkMxKv7DGrC5PP72FCLR
 Ubu6XwPh67zrVa85RxEWy8xByApRhsN6xkfcHcmTdl3IfA1j5UvkQBuWoEOTDWC9VHpk
 FBY6s6YlXHBWJrZQF37qVva6m1IYoV1M9r2xjfMnqX/86ONlMYBoAMKZohUhHgoWyd9V
 VWuEFnz3w+v2SRGaZ0vt+dpvJ8JqWAKgqWm1MzyMb/eIzazW0yFmLf8Ozskrm1PIGpAU
 MWsA==
X-Gm-Message-State: AOAM530cFo6z5X54FPAu+PPl21UzMv4ijGi+gc76YVjAOBMTK0iFOl7b
 tVrmHqEcMxo68rlHiRXiB8XYFcMx27/LTA==
X-Google-Smtp-Source: ABdhPJyAn3gTYqk8o2fLv12VCuGikOqkTLI66UtYn7soLjqNJU17IRH8Sg92dPdiZOxv+vltgQD3AQ==
X-Received: by 2002:a5d:5910:: with SMTP id v16mr4852853wrd.154.1624543237676; 
 Thu, 24 Jun 2021 07:00:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm3600167wrd.25.2021.06.24.07.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:00:36 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/11] drm/v3d: Move drm_sched_job_init to v3d_job_init
Date: Thu, 24 Jun 2021 16:00:20 +0200
Message-Id: <20210624140025.438303-7-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prep work for using the scheduler dependency handling.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Emma Anholt <emma@anholt.net>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 64 +++++++++++------------------------
 1 file changed, 20 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index ac608eb9b594..40302c77e667 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -433,9 +433,10 @@ v3d_wait_bo_ioctl(struct drm_device *dev, void *data,
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
@@ -446,6 +447,10 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 		return ret;
 
 	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
+	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
+				 v3d_priv);
+	if (ret)
+		goto fail;
 
 	ret = drm_syncobj_find_fence(file_priv, in_sync, 0, 0, &in_fence);
 	if (ret == -EINVAL)
@@ -464,25 +469,15 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
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
 	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
 
 	/* put by scheduler job completion */
 	kref_get(&job->refcount);
 
 	drm_sched_entity_push_job(&job->base);
-
-	return 0;
 }
 
 static void
@@ -528,7 +523,6 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 		    struct drm_file *file_priv)
 {
 	struct v3d_dev *v3d = to_v3d_dev(dev);
-	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
 	struct drm_v3d_submit_cl *args = data;
 	struct v3d_bin_job *bin = NULL;
 	struct v3d_render_job *render;
@@ -554,7 +548,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	INIT_LIST_HEAD(&render->unref_list);
 
 	ret = v3d_job_init(v3d, file_priv, &render->base,
-			   v3d_render_job_free, args->in_sync_rcl);
+			   v3d_render_job_free, args->in_sync_rcl, V3D_RENDER);
 	if (ret) {
 		kfree(render);
 		return ret;
@@ -568,7 +562,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 		}
 
 		ret = v3d_job_init(v3d, file_priv, &bin->base,
-				   v3d_job_free, args->in_sync_bcl);
+				   v3d_job_free, args->in_sync_bcl, V3D_BIN);
 		if (ret) {
 			v3d_job_put(&render->base);
 			kfree(bin);
@@ -590,7 +584,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 			goto fail;
 		}
 
-		ret = v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0);
+		ret = v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0, V3D_CACHE_CLEAN);
 		if (ret) {
 			kfree(clean_job);
 			clean_job = NULL;
@@ -613,9 +607,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 
 	mutex_lock(&v3d->sched_lock);
 	if (bin) {
-		ret = v3d_push_job(v3d_priv, &bin->base, V3D_BIN);
-		if (ret)
-			goto fail_unreserve;
+		v3d_push_job(&bin->base);
 
 		ret = drm_gem_fence_array_add(&render->base.deps,
 					      dma_fence_get(bin->base.done_fence));
@@ -623,9 +615,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 			goto fail_unreserve;
 	}
 
-	ret = v3d_push_job(v3d_priv, &render->base, V3D_RENDER);
-	if (ret)
-		goto fail_unreserve;
+	v3d_push_job(&render->base);
 
 	if (clean_job) {
 		struct dma_fence *render_fence =
@@ -633,9 +623,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 		ret = drm_gem_fence_array_add(&clean_job->deps, render_fence);
 		if (ret)
 			goto fail_unreserve;
-		ret = v3d_push_job(v3d_priv, clean_job, V3D_CACHE_CLEAN);
-		if (ret)
-			goto fail_unreserve;
+		v3d_push_job(clean_job);
 	}
 
 	mutex_unlock(&v3d->sched_lock);
@@ -682,7 +670,6 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file_priv)
 {
 	struct v3d_dev *v3d = to_v3d_dev(dev);
-	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
 	struct drm_v3d_submit_tfu *args = data;
 	struct v3d_tfu_job *job;
 	struct ww_acquire_ctx acquire_ctx;
@@ -695,7 +682,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 		return -ENOMEM;
 
 	ret = v3d_job_init(v3d, file_priv, &job->base,
-			   v3d_job_free, args->in_sync);
+			   v3d_job_free, args->in_sync, V3D_TFU);
 	if (ret) {
 		kfree(job);
 		return ret;
@@ -739,9 +726,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 		goto fail;
 
 	mutex_lock(&v3d->sched_lock);
-	ret = v3d_push_job(v3d_priv, &job->base, V3D_TFU);
-	if (ret)
-		goto fail_unreserve;
+	v3d_push_job(&job->base);
 	mutex_unlock(&v3d->sched_lock);
 
 	v3d_attach_fences_and_unlock_reservation(file_priv,
@@ -753,10 +738,6 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 
 	return 0;
 
-fail_unreserve:
-	mutex_unlock(&v3d->sched_lock);
-	drm_gem_unlock_reservations(job->base.bo, job->base.bo_count,
-				    &acquire_ctx);
 fail:
 	v3d_job_put(&job->base);
 
@@ -777,7 +758,6 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file_priv)
 {
 	struct v3d_dev *v3d = to_v3d_dev(dev);
-	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
 	struct drm_v3d_submit_csd *args = data;
 	struct v3d_csd_job *job;
 	struct v3d_job *clean_job;
@@ -796,7 +776,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 		return -ENOMEM;
 
 	ret = v3d_job_init(v3d, file_priv, &job->base,
-			   v3d_job_free, args->in_sync);
+			   v3d_job_free, args->in_sync, V3D_CSD);
 	if (ret) {
 		kfree(job);
 		return ret;
@@ -809,7 +789,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 		return -ENOMEM;
 	}
 
-	ret = v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0);
+	ret = v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0, V3D_CACHE_CLEAN);
 	if (ret) {
 		v3d_job_put(&job->base);
 		kfree(clean_job);
@@ -828,18 +808,14 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
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
-- 
2.32.0.rc2

