Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 751A24EB65D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 01:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D13910F191;
	Tue, 29 Mar 2022 23:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FED710F184;
 Tue, 29 Mar 2022 23:00:44 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id z128so16030439pgz.2;
 Tue, 29 Mar 2022 16:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B/Mh53kPn0QTu3WUX/8jYKpAAkoPl5CFyIRM1My8ikk=;
 b=fFAO7swDmiGfUvTuB3hN4L9kUhXCK4PTZUDeKAqu+OKtalKcsl6mcFrfgTn1tnLFQp
 tXouSp7PEOYORU1oOFuqUssqTbaNhS7j0362UZWJY4xoT2UeRsZ9ls9bNR1un5t/Mbdw
 ssZZhlmqefZkTNpgmPlyyF4MwO6vw3U9OcPyW2UKR/0iv03OTvZw2OdQnhDmE86RrsMm
 GE4eXnNPO8oQscpkZG85U/s5tNvzNQ9EZAw8DUqlaHtAMAccsie0pZuDlw42sbpT8ftK
 j5VehmPspMt9NvqWUjHNLhaojmK0Ly7U1j2y21i/pTwMexAbqPu9x0J/2e5yS7dhl52r
 7WMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B/Mh53kPn0QTu3WUX/8jYKpAAkoPl5CFyIRM1My8ikk=;
 b=XYTXGxS52itErwluKIEGbLTScc3YW/dz9C/JrlewyNBx0zfTQ1dS1u0/6hw3olrw6R
 7vNBOkAE0b2+1dr/xEyXQfB4z1gtlfbdrRu9KTZaSPrIYlPsVLJyHlIoCVuQ5RKU0EUf
 +T8M+YXjRJaEsLBmc1uUF4tzJgBKy1+/KTwzgi0/uOxJhBiyq6X4u83pcNV/tqVD4rjP
 UvqAUycXFYh/BY/nEoato3odEI0aAXHL1AL9/BFHfbdOJruvcQAGU/b8NmZxu67jGrOp
 MpYD5kM/Fm35hfwxAKQvL/NnvMdam0QYbTA1KONv6tdlaqzITvVld4dTy+d5hT5IuE6N
 RjYQ==
X-Gm-Message-State: AOAM532uLnfnitTLXdex73Y8i08iLWAXpFPPRu5k1yU2UQGiYtOyYutP
 piTdXdxRHsrC+7c1SGZCRLQ3jsyNCNo=
X-Google-Smtp-Source: ABdhPJzsV2k9au12X4JbMwzEDzYwQ1z+YKVchT6fs6jsEsSw0ZQxsNbHK/PekhYbRbtOKABV4dxnMw==
X-Received: by 2002:a05:6a00:4107:b0:4fa:ac90:f299 with SMTP id
 bu7-20020a056a00410700b004faac90f299mr29785407pfb.58.1648594843139; 
 Tue, 29 Mar 2022 16:00:43 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a056a00245000b004f771b48736sm21246383pfj.194.2022.03.29.16.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 16:00:42 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/msm/gem: Add fenced vma unpin
Date: Tue, 29 Mar 2022 16:00:56 -0700
Message-Id: <20220329230105.601666-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329230105.601666-1-robdclark@gmail.com>
References: <20220329230105.601666-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

With userspace allocated iova (next patch), we can have a race condition
where userspace observes the fence completion and deletes the vma before
retire_submit() gets around to unpinning the vma.  To handle this, add a
fenced unpin which drops the refcount but tracks the fence, and update
msm_gem_vma_inuse() to check any previously unsignaled fences.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_fence.c      |  6 ++++--
 drivers/gpu/drm/msm/msm_fence.h      |  3 +++
 drivers/gpu/drm/msm/msm_gem.c        |  2 +-
 drivers/gpu/drm/msm/msm_gem.h        |  9 +++++++--
 drivers/gpu/drm/msm/msm_gem_vma.c    | 28 +++++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_ringbuffer.c | 12 +++++++++++-
 6 files changed, 51 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index f2cece542c3f..3df255402a33 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -15,6 +15,7 @@ msm_fence_context_alloc(struct drm_device *dev, volatile uint32_t *fenceptr,
 		const char *name)
 {
 	struct msm_fence_context *fctx;
+	static int index = 0;
 
 	fctx = kzalloc(sizeof(*fctx), GFP_KERNEL);
 	if (!fctx)
@@ -23,6 +24,7 @@ msm_fence_context_alloc(struct drm_device *dev, volatile uint32_t *fenceptr,
 	fctx->dev = dev;
 	strncpy(fctx->name, name, sizeof(fctx->name));
 	fctx->context = dma_fence_context_alloc(1);
+	fctx->index = index++;
 	fctx->fenceptr = fenceptr;
 	spin_lock_init(&fctx->spinlock);
 
@@ -34,7 +36,7 @@ void msm_fence_context_free(struct msm_fence_context *fctx)
 	kfree(fctx);
 }
 
-static inline bool fence_completed(struct msm_fence_context *fctx, uint32_t fence)
+bool msm_fence_completed(struct msm_fence_context *fctx, uint32_t fence)
 {
 	/*
 	 * Note: Check completed_fence first, as fenceptr is in a write-combine
@@ -76,7 +78,7 @@ static const char *msm_fence_get_timeline_name(struct dma_fence *fence)
 static bool msm_fence_signaled(struct dma_fence *fence)
 {
 	struct msm_fence *f = to_msm_fence(fence);
-	return fence_completed(f->fctx, f->base.seqno);
+	return msm_fence_completed(f->fctx, f->base.seqno);
 }
 
 static const struct dma_fence_ops msm_fence_ops = {
diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
index 17ee3822b423..7f1798c54cd1 100644
--- a/drivers/gpu/drm/msm/msm_fence.h
+++ b/drivers/gpu/drm/msm/msm_fence.h
@@ -21,6 +21,8 @@ struct msm_fence_context {
 	char name[32];
 	/** context: see dma_fence_context_alloc() */
 	unsigned context;
+	/** index: similar to context, but local to msm_fence_context's */
+	unsigned index;
 
 	/**
 	 * last_fence:
@@ -56,6 +58,7 @@ struct msm_fence_context * msm_fence_context_alloc(struct drm_device *dev,
 		volatile uint32_t *fenceptr, const char *name);
 void msm_fence_context_free(struct msm_fence_context *fctx);
 
+bool msm_fence_completed(struct msm_fence_context *fctx, uint32_t fence);
 void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence);
 
 struct dma_fence * msm_fence_alloc(struct msm_fence_context *fctx);
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index e8107a22c33a..bf4af17e2f1e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -445,7 +445,7 @@ void msm_gem_unpin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vm
 
 	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
-	msm_gem_unmap_vma(vma->aspace, vma);
+	msm_gem_unpin_vma(vma);
 
 	msm_obj->pin_count--;
 	GEM_WARN_ON(msm_obj->pin_count < 0);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index f98264cf130d..38d66e1248b1 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -49,6 +49,8 @@ struct msm_gem_address_space *
 msm_gem_address_space_create(struct msm_mmu *mmu, const char *name,
 		u64 va_start, u64 size);
 
+struct msm_fence_context;
+
 struct msm_gem_vma {
 	struct drm_mm_node node;
 	uint64_t iova;
@@ -56,6 +58,9 @@ struct msm_gem_vma {
 	struct list_head list;    /* node in msm_gem_object::vmas */
 	bool mapped;
 	int inuse;
+	uint32_t fence_mask;
+	uint32_t fence[MSM_GPU_MAX_RINGS];
+	struct msm_fence_context *fctx[MSM_GPU_MAX_RINGS];
 };
 
 int msm_gem_init_vma(struct msm_gem_address_space *aspace,
@@ -64,8 +69,8 @@ int msm_gem_init_vma(struct msm_gem_address_space *aspace,
 bool msm_gem_vma_inuse(struct msm_gem_vma *vma);
 void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma);
-void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma);
+void msm_gem_unpin_vma(struct msm_gem_vma *vma);
+void msm_gem_unpin_vma_fenced(struct msm_gem_vma *vma, struct msm_fence_context *fctx);
 int msm_gem_map_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma, int prot,
 		struct sg_table *sgt, int size);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 4949899f1fc7..6f9a402450f9 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -5,6 +5,7 @@
  */
 
 #include "msm_drv.h"
+#include "msm_fence.h"
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
@@ -39,7 +40,19 @@ msm_gem_address_space_get(struct msm_gem_address_space *aspace)
 
 bool msm_gem_vma_inuse(struct msm_gem_vma *vma)
 {
-	return !!vma->inuse;
+	if (vma->inuse > 0)
+		return true;
+
+	while (vma->fence_mask) {
+		unsigned idx = ffs(vma->fence_mask) - 1;
+
+		if (!msm_fence_completed(vma->fctx[idx], vma->fence[idx]))
+			return true;
+
+		vma->fence_mask &= ~BIT(idx);
+	}
+
+	return false;
 }
 
 /* Actually unmap memory for the vma */
@@ -63,13 +76,22 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 }
 
 /* Remove reference counts for the mapping */
-void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma)
+void msm_gem_unpin_vma(struct msm_gem_vma *vma)
 {
 	if (!GEM_WARN_ON(!vma->iova))
 		vma->inuse--;
 }
 
+/* Replace pin reference with fence: */
+void msm_gem_unpin_vma_fenced(struct msm_gem_vma *vma, struct msm_fence_context *fctx)
+{
+	vma->fctx[fctx->index] = fctx;
+	vma->fence[fctx->index] = fctx->last_fence;
+	vma->fence_mask |= BIT(fctx->index);
+	msm_gem_unpin_vma(vma);
+}
+
+/* Map and pin vma: */
 int
 msm_gem_map_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma, int prot,
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 3bbf574c3bdc..01f7e4b771ff 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -14,9 +14,19 @@ module_param(num_hw_submissions, uint, 0600);
 static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 {
 	struct msm_gem_submit *submit = to_msm_submit(job);
+	struct msm_fence_context *fctx = submit->ring->fctx;
 	struct msm_gpu *gpu = submit->gpu;
+	int i;
 
-	submit->hw_fence = msm_fence_alloc(submit->ring->fctx);
+	submit->hw_fence = msm_fence_alloc(fctx);
+
+	for (i = 0; i < submit->nr_bos; i++) {
+		struct drm_gem_object *obj = &submit->bos[i].obj->base;
+
+		msm_gem_lock(obj);
+		msm_gem_unpin_vma_fenced(submit->bos[i].vma, fctx);
+		msm_gem_unlock(obj);
+	}
 
 	pm_runtime_get_sync(&gpu->pdev->dev);
 
-- 
2.35.1

