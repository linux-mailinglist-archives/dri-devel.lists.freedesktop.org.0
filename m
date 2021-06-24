Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049843B3817
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 22:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358496ECD0;
	Thu, 24 Jun 2021 20:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02536ECD0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 20:45:07 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j2so8082444wrs.12
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 13:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0tSdxJn7cbMK7RGm6YWyvtxZzFU4vmDS539YThZxDaY=;
 b=DMS34yxzDWAj+IJ8P4/PCKU1XKNqf2/SSnLZ6T+Byu4DUK/O4GuOUpIgSG3ZSRKi4J
 Af0Cu+NgwnsOwLMQj8X0bS/zNqRJon5OHec/g6M9uEefF3kuCS/jLKb5oyehSNePexdt
 CmZwrUzX+DnUoItoP73k6t62mDrQ1dasffoK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0tSdxJn7cbMK7RGm6YWyvtxZzFU4vmDS539YThZxDaY=;
 b=S1/g2aho8u7nWT2QiBIAupJ7Lvd1XDZh07aH2K16bgdRFnjeeXSDakaqJWmcSVImRw
 IuxDEJU/3ysCiswd62bqLTusnK/kQ4SWMMwAwQn2k8fcWVx1G9aQJLWmyoibItR0YAfg
 779CsT18K3riQwR7kfngET5rf2pQfws07AWYb2Drj9AEeMJfPCfRWPhwBBM+6Hko7zN1
 gNPPFHnKAJfxsnH6ssY844JJfzzzpysi8c4+mxn+O4jmdrGghiA94H/cdD8+wtjioHoq
 vVLX5r3MVGuPVRVw31NtzZ/5bMqIHi2iYpUHuxv0MDBhM45CvFApXaUWItA1JRxJtAW+
 VKyQ==
X-Gm-Message-State: AOAM533wBrqWLMd22RQvGI/fKzw1bf3ynj6D62+yh1wXOKu1TJUC1vQs
 VRyBpsP2xC3QNhgarL5aatjQ4y1LBaQfAA==
X-Google-Smtp-Source: ABdhPJwyKalK2+weiYAHw6Gkj5z4zKDFqRJbggn9zLqEDMPOFun4C1YXfOwhOZwN8oElRKnW3snPqw==
X-Received: by 2002:a5d:4dd2:: with SMTP id f18mr6670611wru.86.1624567506408; 
 Thu, 24 Jun 2021 13:45:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 12sm7599689wme.28.2021.06.24.13.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 13:45:05 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/v3d: Move drm_sched_job_init to v3d_job_init
Date: Thu, 24 Jun 2021 22:45:00 +0200
Message-Id: <20210624204500.612710-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210624140025.438303-7-daniel.vetter@ffwll.ch>
References: <20210624140025.438303-7-daniel.vetter@ffwll.ch>
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

Prep work for using the scheduler dependency handling. We need to call
drm_sched_job_init earlier so we can use the new drm_sched_job_await*
functions for dependency handling here.

v2: Slightly better commit message and rebase to include the
drm_sched_job_arm() call (Emma).

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Emma Anholt <emma@anholt.net>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 64 +++++++++++------------------------
 1 file changed, 20 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 69ac20e11b09..d1028ccf6dd5 100644
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
@@ -464,17 +469,9 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
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
@@ -483,8 +480,6 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
 	kref_get(&job->refcount);
 
 	drm_sched_entity_push_job(&job->base);
-
-	return 0;
 }
 
 static void
@@ -530,7 +525,6 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 		    struct drm_file *file_priv)
 {
 	struct v3d_dev *v3d = to_v3d_dev(dev);
-	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
 	struct drm_v3d_submit_cl *args = data;
 	struct v3d_bin_job *bin = NULL;
 	struct v3d_render_job *render;
@@ -556,7 +550,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	INIT_LIST_HEAD(&render->unref_list);
 
 	ret = v3d_job_init(v3d, file_priv, &render->base,
-			   v3d_render_job_free, args->in_sync_rcl);
+			   v3d_render_job_free, args->in_sync_rcl, V3D_RENDER);
 	if (ret) {
 		kfree(render);
 		return ret;
@@ -570,7 +564,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 		}
 
 		ret = v3d_job_init(v3d, file_priv, &bin->base,
-				   v3d_job_free, args->in_sync_bcl);
+				   v3d_job_free, args->in_sync_bcl, V3D_BIN);
 		if (ret) {
 			v3d_job_put(&render->base);
 			kfree(bin);
@@ -592,7 +586,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 			goto fail;
 		}
 
-		ret = v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0);
+		ret = v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0, V3D_CACHE_CLEAN);
 		if (ret) {
 			kfree(clean_job);
 			clean_job = NULL;
@@ -615,9 +609,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 
 	mutex_lock(&v3d->sched_lock);
 	if (bin) {
-		ret = v3d_push_job(v3d_priv, &bin->base, V3D_BIN);
-		if (ret)
-			goto fail_unreserve;
+		v3d_push_job(&bin->base);
 
 		ret = drm_gem_fence_array_add(&render->base.deps,
 					      dma_fence_get(bin->base.done_fence));
@@ -625,9 +617,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 			goto fail_unreserve;
 	}
 
-	ret = v3d_push_job(v3d_priv, &render->base, V3D_RENDER);
-	if (ret)
-		goto fail_unreserve;
+	v3d_push_job(&render->base);
 
 	if (clean_job) {
 		struct dma_fence *render_fence =
@@ -635,9 +625,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 		ret = drm_gem_fence_array_add(&clean_job->deps, render_fence);
 		if (ret)
 			goto fail_unreserve;
-		ret = v3d_push_job(v3d_priv, clean_job, V3D_CACHE_CLEAN);
-		if (ret)
-			goto fail_unreserve;
+		v3d_push_job(clean_job);
 	}
 
 	mutex_unlock(&v3d->sched_lock);
@@ -684,7 +672,6 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file_priv)
 {
 	struct v3d_dev *v3d = to_v3d_dev(dev);
-	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
 	struct drm_v3d_submit_tfu *args = data;
 	struct v3d_tfu_job *job;
 	struct ww_acquire_ctx acquire_ctx;
@@ -697,7 +684,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 		return -ENOMEM;
 
 	ret = v3d_job_init(v3d, file_priv, &job->base,
-			   v3d_job_free, args->in_sync);
+			   v3d_job_free, args->in_sync, V3D_TFU);
 	if (ret) {
 		kfree(job);
 		return ret;
@@ -741,9 +728,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 		goto fail;
 
 	mutex_lock(&v3d->sched_lock);
-	ret = v3d_push_job(v3d_priv, &job->base, V3D_TFU);
-	if (ret)
-		goto fail_unreserve;
+	v3d_push_job(&job->base);
 	mutex_unlock(&v3d->sched_lock);
 
 	v3d_attach_fences_and_unlock_reservation(file_priv,
@@ -755,10 +740,6 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 
 	return 0;
 
-fail_unreserve:
-	mutex_unlock(&v3d->sched_lock);
-	drm_gem_unlock_reservations(job->base.bo, job->base.bo_count,
-				    &acquire_ctx);
 fail:
 	v3d_job_put(&job->base);
 
@@ -779,7 +760,6 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file_priv)
 {
 	struct v3d_dev *v3d = to_v3d_dev(dev);
-	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
 	struct drm_v3d_submit_csd *args = data;
 	struct v3d_csd_job *job;
 	struct v3d_job *clean_job;
@@ -798,7 +778,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 		return -ENOMEM;
 
 	ret = v3d_job_init(v3d, file_priv, &job->base,
-			   v3d_job_free, args->in_sync);
+			   v3d_job_free, args->in_sync, V3D_CSD);
 	if (ret) {
 		kfree(job);
 		return ret;
@@ -811,7 +791,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 		return -ENOMEM;
 	}
 
-	ret = v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0);
+	ret = v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0, V3D_CACHE_CLEAN);
 	if (ret) {
 		v3d_job_put(&job->base);
 		kfree(clean_job);
@@ -830,18 +810,14 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
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

