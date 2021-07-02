Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3734A3BA52A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 23:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390BD89CF5;
	Fri,  2 Jul 2021 21:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533E589CF5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 21:38:30 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 o33-20020a05600c5121b02901e360c98c08so9921734wms.5
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 14:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r5UDpKih+Cz0Ip0RsQYJf4LObnNANTrq8DTJd3TzsDY=;
 b=cboccj9uK2nqIaGDjp7JjZjNm3xB97a/EjrI9FL0N30f2veooJDaN0dVKs9Zle+tkw
 IHELqLyQ+qYnYSr1/jlCowrfQCVao0x0E59chfLBBqxgnXP494ZxeJGlaCExWfkPNGnY
 NMRu7urjIGSchgBqEv+hyO7FQ4ZSu1/qnt9PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r5UDpKih+Cz0Ip0RsQYJf4LObnNANTrq8DTJd3TzsDY=;
 b=Pzwm2vYp0A6JlUPDJoQpBNgCc7uAq5VdLtepJUKu2Ks5QeFB/iRnFT/VFpBQAa0+6Q
 Ws2l2IfrE0l1W3N47wrzGVvMezAhRXBPCQ6dDqj7CJJS+lCS1qZcz4/7EUH4Ze10eZEq
 e95XFkecXKEM/fNtWmKVYW2npMhVpSuK/r3T/Q2Ogdt+CyCKNTyR5eS2XHRCQUZXQYjs
 ec1qt4uIDe09Avbp/xLWOdboQLJn+1G7GXjZWBWSIVDeoKxF01dpTy8cB6Sqk4607zsQ
 zmxMTLeFO9LCqLUxO4+dbf6VN4m58BYUsbW4yA6sCxHYXWvMWnc6jaqMTJaKl0y0XmNN
 9Tdg==
X-Gm-Message-State: AOAM530mbGw0GzB3MYRxPyTjJwUZNEl2QG9pQi4wIvNbCApeY+GsqA1F
 dPlTMJnvBRrFo98qeinKC995k8FM4vJv9A==
X-Google-Smtp-Source: ABdhPJxqVHbkBsJue9XqhmKx1HoLke8pCMRgf6iknh/A+rCrC0rFG4vwSxu5tAuee8bjh1mW1krKDQ==
X-Received: by 2002:a7b:c042:: with SMTP id u2mr409618wmc.86.1625261909076;
 Fri, 02 Jul 2021 14:38:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n19sm4007222wms.4.2021.07.02.14.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 14:38:28 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 08/11] drm/etnaviv: Use scheduler dependency handling
Date: Fri,  2 Jul 2021 23:38:12 +0200
Message-Id: <20210702213815.2249499-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
References: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, etnaviv@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need to pull the drm_sched_job_init much earlier, but that's very
minor surgery.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: etnaviv@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  5 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 32 +++++-----
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      | 61 +-------------------
 drivers/gpu/drm/etnaviv/etnaviv_sched.h      |  3 +-
 4 files changed, 20 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
index 98e60df882b6..63688e6e4580 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
@@ -80,9 +80,6 @@ struct etnaviv_gem_submit_bo {
 	u64 va;
 	struct etnaviv_gem_object *obj;
 	struct etnaviv_vram_mapping *mapping;
-	struct dma_fence *excl;
-	unsigned int nr_shared;
-	struct dma_fence **shared;
 };
 
 /* Created per submit-ioctl, to track bo's and cmdstream bufs, etc,
@@ -95,7 +92,7 @@ struct etnaviv_gem_submit {
 	struct etnaviv_file_private *ctx;
 	struct etnaviv_gpu *gpu;
 	struct etnaviv_iommu_context *mmu_context, *prev_mmu_context;
-	struct dma_fence *out_fence, *in_fence;
+	struct dma_fence *out_fence;
 	int out_fence_id;
 	struct list_head node; /* GPU active submit list */
 	struct etnaviv_cmdbuf cmdbuf;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 4dd7d9d541c0..92478a50a580 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -188,16 +188,10 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
 			continue;
 
-		if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
-			ret = dma_resv_get_fences(robj, &bo->excl,
-						  &bo->nr_shared,
-						  &bo->shared);
-			if (ret)
-				return ret;
-		} else {
-			bo->excl = dma_resv_get_excl_unlocked(robj);
-		}
-
+		ret = drm_sched_job_await_implicit(&submit->sched_job, &bo->obj->base,
+						   bo->flags & ETNA_SUBMIT_BO_WRITE);
+		if (ret)
+			return ret;
 	}
 
 	return ret;
@@ -403,8 +397,6 @@ static void submit_cleanup(struct kref *kref)
 
 	wake_up_all(&submit->gpu->fence_event);
 
-	if (submit->in_fence)
-		dma_fence_put(submit->in_fence);
 	if (submit->out_fence) {
 		/* first remove from IDR, so fence can not be found anymore */
 		mutex_lock(&submit->gpu->fence_lock);
@@ -537,6 +529,12 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 	submit->exec_state = args->exec_state;
 	submit->flags = args->flags;
 
+	ret = drm_sched_job_init(&submit->sched_job,
+				 &ctx->sched_entity[args->pipe],
+				 submit->ctx);
+	if (ret)
+		goto err_submit_objects;
+
 	ret = submit_lookup_objects(submit, file, bos, args->nr_bos);
 	if (ret)
 		goto err_submit_objects;
@@ -549,11 +547,15 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (args->flags & ETNA_SUBMIT_FENCE_FD_IN) {
-		submit->in_fence = sync_file_get_fence(args->fence_fd);
-		if (!submit->in_fence) {
+		struct dma_fence *in_fence = sync_file_get_fence(args->fence_fd);
+		if (!in_fence) {
 			ret = -EINVAL;
 			goto err_submit_objects;
 		}
+
+		ret = drm_sched_job_await_fence(&submit->sched_job, in_fence);
+		if (ret)
+			goto err_submit_objects;
 	}
 
 	ret = submit_pin_objects(submit);
@@ -579,7 +581,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret)
 		goto err_submit_objects;
 
-	ret = etnaviv_sched_push_job(&ctx->sched_entity[args->pipe], submit);
+	ret = etnaviv_sched_push_job(submit);
 	if (ret)
 		goto err_submit_objects;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 180bb633d5c5..c98d67320be3 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -17,58 +17,6 @@ module_param_named(job_hang_limit, etnaviv_job_hang_limit, int , 0444);
 static int etnaviv_hw_jobs_limit = 4;
 module_param_named(hw_job_limit, etnaviv_hw_jobs_limit, int , 0444);
 
-static struct dma_fence *
-etnaviv_sched_dependency(struct drm_sched_job *sched_job,
-			 struct drm_sched_entity *entity)
-{
-	struct etnaviv_gem_submit *submit = to_etnaviv_submit(sched_job);
-	struct dma_fence *fence;
-	int i;
-
-	if (unlikely(submit->in_fence)) {
-		fence = submit->in_fence;
-		submit->in_fence = NULL;
-
-		if (!dma_fence_is_signaled(fence))
-			return fence;
-
-		dma_fence_put(fence);
-	}
-
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
-		int j;
-
-		if (bo->excl) {
-			fence = bo->excl;
-			bo->excl = NULL;
-
-			if (!dma_fence_is_signaled(fence))
-				return fence;
-
-			dma_fence_put(fence);
-		}
-
-		for (j = 0; j < bo->nr_shared; j++) {
-			if (!bo->shared[j])
-				continue;
-
-			fence = bo->shared[j];
-			bo->shared[j] = NULL;
-
-			if (!dma_fence_is_signaled(fence))
-				return fence;
-
-			dma_fence_put(fence);
-		}
-		kfree(bo->shared);
-		bo->nr_shared = 0;
-		bo->shared = NULL;
-	}
-
-	return NULL;
-}
-
 static struct dma_fence *etnaviv_sched_run_job(struct drm_sched_job *sched_job)
 {
 	struct etnaviv_gem_submit *submit = to_etnaviv_submit(sched_job);
@@ -140,14 +88,12 @@ static void etnaviv_sched_free_job(struct drm_sched_job *sched_job)
 }
 
 static const struct drm_sched_backend_ops etnaviv_sched_ops = {
-	.dependency = etnaviv_sched_dependency,
 	.run_job = etnaviv_sched_run_job,
 	.timedout_job = etnaviv_sched_timedout_job,
 	.free_job = etnaviv_sched_free_job,
 };
 
-int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
-			   struct etnaviv_gem_submit *submit)
+int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit)
 {
 	int ret = 0;
 
@@ -158,11 +104,6 @@ int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
 	 */
 	mutex_lock(&submit->gpu->fence_lock);
 
-	ret = drm_sched_job_init(&submit->sched_job, sched_entity,
-				 submit->ctx);
-	if (ret)
-		goto out_unlock;
-
 	drm_sched_job_arm(&submit->sched_job);
 
 	submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.h b/drivers/gpu/drm/etnaviv/etnaviv_sched.h
index c0a6796e22c9..baebfa069afc 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.h
@@ -18,7 +18,6 @@ struct etnaviv_gem_submit *to_etnaviv_submit(struct drm_sched_job *sched_job)
 
 int etnaviv_sched_init(struct etnaviv_gpu *gpu);
 void etnaviv_sched_fini(struct etnaviv_gpu *gpu);
-int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
-			   struct etnaviv_gem_submit *submit);
+int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit);
 
 #endif /* __ETNAVIV_SCHED_H__ */
-- 
2.32.0.rc2

