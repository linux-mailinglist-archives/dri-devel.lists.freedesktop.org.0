Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 310F06B5F0E
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 18:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C429110E29B;
	Sat, 11 Mar 2023 17:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD5C10E29F;
 Sat, 11 Mar 2023 17:35:23 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id x11so8765584pln.12;
 Sat, 11 Mar 2023 09:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678556122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TnIxfCw144yfXhUrE1m8cICNvDN0xmW/oT+E2UQNkiY=;
 b=mwbGIJuu+qFmtrd5lIyJUqzeXolhOvlnAYrl6saT8EzOKoJwwD7OwpP4jeAs4vCtiW
 BP9HAuYM6bDU2cAuiZ70j2vZpn8KPBmbls+KdHFvh8FNC7Zxm3ylP6oo9rbuyB2AE3vR
 I2OWJnH3wnXmQLeorbY/C2Xg8ho/471e96o7kIVCkzjWfJrTdcwKlIHRLB7HBg1R8mmX
 IiJONtEM8rZSzFAmdQtZnKHIWJqZlob8Zclz79OUxeNJWyOrPKdvcj93evphzMr8bW4O
 MqxVrZeQ8RHBgtFbP2qoGFf++77XPXrXNByvjjwPzY8oVXOU7+QJ3bTRN0d170dhNhLu
 etjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678556122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TnIxfCw144yfXhUrE1m8cICNvDN0xmW/oT+E2UQNkiY=;
 b=OQgU59IDABIiCxeACnPGokKGITyJwutUfOYkHu7eYxz3SI2wQEwm6o9FfE4TDSlRpx
 i7ZuVFYP8XylpXQzgKZaKnC+tLVjOQhk3XV9/oI5eCEzM4TVUMKx03Q/mZJuXT2YqmKT
 sAil7OEXo5Oa6DYPlT47p/VoBfZE5dQ1uU8OMQ9eOnrDBimGAnUyVUkwU1etm9bN2ydR
 48RJxS9Mbnl+CTVYnpmQ/7B7DpSrBKCE8Ws4Eu6aXELlCdMzvthitH55nbxIaz7yWydP
 18RQivyL8GaW0ebmvEW72DFxHTDj60YLCC+I+vvVuKhz8Ysc/78f42OXkaghr9w32hm3
 7y9Q==
X-Gm-Message-State: AO0yUKV+Vp7CxCuykijryOO/revNjR7EkgCTfLl12VwZL+mACrvSC6Lz
 NZw96Tb+n2uTUnEFOKvaBZQiwGyOxsc=
X-Google-Smtp-Source: AK7set/ix6MrtzZsH++pe1KrHnjRQ1RKUNEqnAjgGsLIgXlSDEBp5+edn21q7QAJmH83Ry1c7qcuYw==
X-Received: by 2002:a17:90b:38c2:b0:23a:333c:6ba6 with SMTP id
 nn2-20020a17090b38c200b0023a333c6ba6mr28706914pjb.16.1678556122634; 
 Sat, 11 Mar 2023 09:35:22 -0800 (PST)
Received: from localhost ([2601:1c0:5080:d9fa:9b45:95de:f47d:f85e])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a170902b94200b0019c90f8c831sm1771790pls.242.2023.03.11.09.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 09:35:21 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm: Embed the hw_fence in msm_gem_submit
Date: Sat, 11 Mar 2023 09:35:12 -0800
Message-Id: <20230311173513.1080397-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230311173513.1080397-1-robdclark@gmail.com>
References: <20230311173513.1080397-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Avoid allocating memory in job_run() by embedding the fence in the
submit object.  Since msm gpu fences are always 1:1 with msm_gem_submit
we can just use the fence's refcnt to track the submit.  And since we
can get the fence ctx from the submit we can just drop the msm_fence
struct altogether.  This uses the new dma_fence_init_noref() to deal
with the fact that the fence's refcnt is initialized when the submit is
created, long before job_run().

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Note that this applies on top of https://patchwork.freedesktop.org/series/93035/
out of convenience for myself, but I can re-work it to go before
depending on the order that things land.

 drivers/gpu/drm/msm/msm_fence.c      | 45 +++++++++++-----------------
 drivers/gpu/drm/msm/msm_fence.h      |  2 +-
 drivers/gpu/drm/msm/msm_gem.h        | 10 +++----
 drivers/gpu/drm/msm/msm_gem_submit.c |  8 ++---
 drivers/gpu/drm/msm/msm_gpu.c        |  4 +--
 drivers/gpu/drm/msm/msm_ringbuffer.c |  4 +--
 6 files changed, 31 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index 51b461f32103..51f9f1f0cb66 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -103,14 +103,9 @@ void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
 	spin_unlock_irqrestore(&fctx->spinlock, flags);
 }
 
-struct msm_fence {
-	struct dma_fence base;
-	struct msm_fence_context *fctx;
-};
-
-static inline struct msm_fence *to_msm_fence(struct dma_fence *fence)
+static inline struct msm_gem_submit *fence_to_submit(struct dma_fence *fence)
 {
-	return container_of(fence, struct msm_fence, base);
+	return container_of(fence, struct msm_gem_submit, hw_fence);
 }
 
 static const char *msm_fence_get_driver_name(struct dma_fence *fence)
@@ -120,20 +115,20 @@ static const char *msm_fence_get_driver_name(struct dma_fence *fence)
 
 static const char *msm_fence_get_timeline_name(struct dma_fence *fence)
 {
-	struct msm_fence *f = to_msm_fence(fence);
-	return f->fctx->name;
+	struct msm_gem_submit *submit = fence_to_submit(fence);
+	return submit->ring->fctx->name;
 }
 
 static bool msm_fence_signaled(struct dma_fence *fence)
 {
-	struct msm_fence *f = to_msm_fence(fence);
-	return msm_fence_completed(f->fctx, f->base.seqno);
+	struct msm_gem_submit *submit = fence_to_submit(fence);
+	return msm_fence_completed(submit->ring->fctx, fence->seqno);
 }
 
 static void msm_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
 {
-	struct msm_fence *f = to_msm_fence(fence);
-	struct msm_fence_context *fctx = f->fctx;
+	struct msm_gem_submit *submit = fence_to_submit(fence);
+	struct msm_fence_context *fctx = submit->ring->fctx;
 	unsigned long flags;
 	ktime_t now;
 
@@ -165,26 +160,22 @@ static void msm_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
 	spin_unlock_irqrestore(&fctx->spinlock, flags);
 }
 
+static void msm_fence_release(struct dma_fence *fence)
+{
+	__msm_gem_submit_destroy(fence_to_submit(fence));
+}
+
 static const struct dma_fence_ops msm_fence_ops = {
 	.get_driver_name = msm_fence_get_driver_name,
 	.get_timeline_name = msm_fence_get_timeline_name,
 	.signaled = msm_fence_signaled,
 	.set_deadline = msm_fence_set_deadline,
+	.release = msm_fence_release,
 };
 
-struct dma_fence *
-msm_fence_alloc(struct msm_fence_context *fctx)
+void
+msm_fence_init(struct msm_fence_context *fctx, struct dma_fence *f)
 {
-	struct msm_fence *f;
-
-	f = kzalloc(sizeof(*f), GFP_KERNEL);
-	if (!f)
-		return ERR_PTR(-ENOMEM);
-
-	f->fctx = fctx;
-
-	dma_fence_init(&f->base, &msm_fence_ops, &fctx->spinlock,
-		       fctx->context, ++fctx->last_fence);
-
-	return &f->base;
+	dma_fence_init_noref(f, &msm_fence_ops, &fctx->spinlock,
+			     fctx->context, ++fctx->last_fence);
 }
diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
index cdaebfb94f5c..8fca37e9773b 100644
--- a/drivers/gpu/drm/msm/msm_fence.h
+++ b/drivers/gpu/drm/msm/msm_fence.h
@@ -81,7 +81,7 @@ void msm_fence_context_free(struct msm_fence_context *fctx);
 bool msm_fence_completed(struct msm_fence_context *fctx, uint32_t fence);
 void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence);
 
-struct dma_fence * msm_fence_alloc(struct msm_fence_context *fctx);
+void msm_fence_init(struct msm_fence_context *fctx, struct dma_fence *f);
 
 static inline bool
 fence_before(uint32_t a, uint32_t b)
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c4844cf3a585..e06afed99d5b 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -259,10 +259,10 @@ struct msm_gem_submit {
 	struct ww_acquire_ctx ticket;
 	uint32_t seqno;		/* Sequence number of the submit on the ring */
 
-	/* Hw fence, which is created when the scheduler executes the job, and
+	/* Hw fence, which is initialized when the scheduler executes the job, and
 	 * is signaled when the hw finishes (via seqno write from cmdstream)
 	 */
-	struct dma_fence *hw_fence;
+	struct dma_fence hw_fence;
 
 	/* Userspace visible fence, which is signaled by the scheduler after
 	 * the hw_fence is signaled.
@@ -309,16 +309,16 @@ static inline struct msm_gem_submit *to_msm_submit(struct drm_sched_job *job)
 	return container_of(job, struct msm_gem_submit, base);
 }
 
-void __msm_gem_submit_destroy(struct kref *kref);
+void __msm_gem_submit_destroy(struct msm_gem_submit *submit);
 
 static inline void msm_gem_submit_get(struct msm_gem_submit *submit)
 {
-	kref_get(&submit->ref);
+	dma_fence_get(&submit->hw_fence);
 }
 
 static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
 {
-	kref_put(&submit->ref, __msm_gem_submit_destroy);
+	dma_fence_put(&submit->hw_fence);
 }
 
 void msm_submit_retire(struct msm_gem_submit *submit);
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index be4bf77103cd..522c8c82e827 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -47,7 +47,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
-	kref_init(&submit->ref);
+	kref_init(&submit->hw_fence.refcount);
 	submit->dev = dev;
 	submit->aspace = queue->ctx->aspace;
 	submit->gpu = gpu;
@@ -65,10 +65,9 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	return submit;
 }
 
-void __msm_gem_submit_destroy(struct kref *kref)
+/* Called when the hw_fence is destroyed: */
+void __msm_gem_submit_destroy(struct msm_gem_submit *submit)
 {
-	struct msm_gem_submit *submit =
-			container_of(kref, struct msm_gem_submit, ref);
 	unsigned i;
 
 	if (submit->fence_id) {
@@ -78,7 +77,6 @@ void __msm_gem_submit_destroy(struct kref *kref)
 	}
 
 	dma_fence_put(submit->user_fence);
-	dma_fence_put(submit->hw_fence);
 
 	put_pid(submit->pid);
 	msm_submitqueue_put(submit->queue);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 380249500325..a82d11dd5fcf 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -716,7 +716,7 @@ static void retire_submits(struct msm_gpu *gpu)
 			 * been signalled, then later submits are not signalled
 			 * either, so we are also done.
 			 */
-			if (submit && dma_fence_is_signaled(submit->hw_fence)) {
+			if (submit && dma_fence_is_signaled(&submit->hw_fence)) {
 				retire_submit(gpu, ring, submit);
 			} else {
 				break;
@@ -760,7 +760,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	msm_gpu_hw_init(gpu);
 
-	submit->seqno = submit->hw_fence->seqno;
+	submit->seqno = submit->hw_fence.seqno;
 
 	msm_rd_dump_submit(priv->rd, submit, NULL);
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 57a8e9564540..5c54befa2427 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -18,7 +18,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	struct msm_gpu *gpu = submit->gpu;
 	int i;
 
-	submit->hw_fence = msm_fence_alloc(fctx);
+	msm_fence_init(fctx, &submit->hw_fence);
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
@@ -37,7 +37,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 
 	mutex_unlock(&gpu->lock);
 
-	return dma_fence_get(submit->hw_fence);
+	return dma_fence_get(&submit->hw_fence);
 }
 
 static void msm_job_free(struct drm_sched_job *job)
-- 
2.39.2

