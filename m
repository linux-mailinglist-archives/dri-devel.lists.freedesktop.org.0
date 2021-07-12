Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEE53C6492
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 22:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298EB89E01;
	Mon, 12 Jul 2021 20:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7108A89DFC
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 20:02:09 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so9895wmb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 13:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hjNW4u1I0U0Q7toaCUK63SQ1n8cRfb0yAV1MC4gWi04=;
 b=Ub7acTvz5it9wh6mlGrQ2Gm7/AkOnHSs6P2CCkOJ4fAdTIRHb/jClr9cDK9Hbm+7lI
 BOUiAddhMBLH0lSEX9OpVE3C2xL+hyYRZ9K0DxYPF9XGdB1pGzhC1G5OsjYUAKaMtlN2
 7BKON3hkJ2xfA/syt+M+PNno5TItfM4Uv+rlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hjNW4u1I0U0Q7toaCUK63SQ1n8cRfb0yAV1MC4gWi04=;
 b=sS1bdUwmMk1InllRftkcxU5bqu2MIoEDkUKsybDUB9ZqHeYqrQkuA6JzGOw1xKzC1H
 TguTzzT4krGaSm0scL/8uSdOsIePiIVYex9NbyVoGjAlxUtQqa4mUZs4O6qtEiWDrzan
 bynOSUkR9MnExwtfwcjhciwmCIs3fzqxyiGabmXrDdms4o0NPjbhOLHeLFUo/DHCyMhK
 HKAedRdP3aWmd81S/b7Gk1paCJ+Fi8Iw2VERZbstNZqrvgzJS23FInsqiKFIfYXNHg+R
 0xpGL9Kpy/2EDHudRv+i8W0Wdg4p6PJI9cAJEUc1nzvGtZe0mInXLldQz+ySj85Hpjwe
 h2ow==
X-Gm-Message-State: AOAM5331qIPFSGoC0nFoeRQguL1gYvV0I/aFSb02Gha3DdkUlkjHn9zG
 XswGviaHSfKLDY4kXp1KpEFej7Klys4XHQ==
X-Google-Smtp-Source: ABdhPJwnxB9OHXzfE85elbmE2zi9ZFwYEKSux5tXKEpW2O5RpE0G1yT7ybgUD8r75v+T+r9w/QJIsg==
X-Received: by 2002:a05:600c:4101:: with SMTP id
 j1mr963258wmi.130.1626120128102; 
 Mon, 12 Jul 2021 13:02:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l14sm9858221wrs.22.2021.07.12.13.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 13:02:07 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 10/18] drm/etnaviv: Use scheduler dependency handling
Date: Mon, 12 Jul 2021 19:53:44 +0200
Message-Id: <20210712175352.802687-11-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 etnaviv@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need to pull the drm_sched_job_init much earlier, but that's very
minor surgery.

v2: Actually fix up cleanup paths by calling drm_sched_job_init, which
I wanted to to in the previous round (and did, for all other drivers).
Spotted by Lucas.

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
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 58 +++++++++---------
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      | 63 +-------------------
 drivers/gpu/drm/etnaviv/etnaviv_sched.h      |  3 +-
 4 files changed, 35 insertions(+), 94 deletions(-)

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
index 4dd7d9d541c0..5b97ce1299ad 100644
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
@@ -529,7 +521,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 	ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &submit->cmdbuf,
 				  ALIGN(args->stream_size, 8) + 8);
 	if (ret)
-		goto err_submit_objects;
+		goto err_submit_put;
 
 	submit->ctx = file->driver_priv;
 	etnaviv_iommu_context_get(submit->ctx->mmu);
@@ -537,51 +529,61 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 	submit->exec_state = args->exec_state;
 	submit->flags = args->flags;
 
+	ret = drm_sched_job_init(&submit->sched_job,
+				 &ctx->sched_entity[args->pipe],
+				 submit->ctx);
+	if (ret)
+		goto err_submit_put;
+
 	ret = submit_lookup_objects(submit, file, bos, args->nr_bos);
 	if (ret)
-		goto err_submit_objects;
+		goto err_submit_job;
 
 	if ((priv->mmu_global->version != ETNAVIV_IOMMU_V2) &&
 	    !etnaviv_cmd_validate_one(gpu, stream, args->stream_size / 4,
 				      relocs, args->nr_relocs)) {
 		ret = -EINVAL;
-		goto err_submit_objects;
+		goto err_submit_job;
 	}
 
 	if (args->flags & ETNA_SUBMIT_FENCE_FD_IN) {
-		submit->in_fence = sync_file_get_fence(args->fence_fd);
-		if (!submit->in_fence) {
+		struct dma_fence *in_fence = sync_file_get_fence(args->fence_fd);
+		if (!in_fence) {
 			ret = -EINVAL;
-			goto err_submit_objects;
+			goto err_submit_job;
 		}
+
+		ret = drm_sched_job_await_fence(&submit->sched_job, in_fence);
+		if (ret)
+			goto err_submit_job;
 	}
 
 	ret = submit_pin_objects(submit);
 	if (ret)
-		goto err_submit_objects;
+		goto err_submit_job;
 
 	ret = submit_reloc(submit, stream, args->stream_size / 4,
 			   relocs, args->nr_relocs);
 	if (ret)
-		goto err_submit_objects;
+		goto err_submit_job;
 
 	ret = submit_perfmon_validate(submit, args->exec_state, pmrs);
 	if (ret)
-		goto err_submit_objects;
+		goto err_submit_job;
 
 	memcpy(submit->cmdbuf.vaddr, stream, args->stream_size);
 
 	ret = submit_lock_objects(submit, &ticket);
 	if (ret)
-		goto err_submit_objects;
+		goto err_submit_job;
 
 	ret = submit_fence_sync(submit);
 	if (ret)
-		goto err_submit_objects;
+		goto err_submit_job;
 
-	ret = etnaviv_sched_push_job(&ctx->sched_entity[args->pipe], submit);
+	ret = etnaviv_sched_push_job(submit);
 	if (ret)
-		goto err_submit_objects;
+		goto err_submit_job;
 
 	submit_attach_object_fences(submit);
 
@@ -595,7 +597,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 		sync_file = sync_file_create(submit->out_fence);
 		if (!sync_file) {
 			ret = -ENOMEM;
-			goto err_submit_objects;
+			goto err_submit_job;
 		}
 		fd_install(out_fence_fd, sync_file->file);
 	}
@@ -603,7 +605,9 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 	args->fence_fd = out_fence_fd;
 	args->fence = submit->out_fence_id;
 
-err_submit_objects:
+err_submit_job:
+	drm_sched_job_cleanup(&submit->sched_job);
+err_submit_put:
 	etnaviv_submit_put(submit);
 
 err_submit_ww_acquire:
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 180bb633d5c5..2bbbd6ccc95e 100644
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
@@ -140,29 +88,22 @@ static void etnaviv_sched_free_job(struct drm_sched_job *sched_job)
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
 
 	/*
 	 * Hold the fence lock across the whole operation to avoid jobs being
 	 * pushed out of order with regard to their sched fence seqnos as
-	 * allocated in drm_sched_job_init.
+	 * allocated in drm_sched_job_arm.
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
2.32.0

