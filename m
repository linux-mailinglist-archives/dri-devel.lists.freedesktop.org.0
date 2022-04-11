Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F454FC71A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 23:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A30D10E14C;
	Mon, 11 Apr 2022 21:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBFC10E14C;
 Mon, 11 Apr 2022 21:58:38 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id o5so3963584pjr.0;
 Mon, 11 Apr 2022 14:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xF2oun62LPfztg22YpP4gOo8KAfaTRYJa39N9xYIbqA=;
 b=J96jlRqhxwRpdqY1s9hXY8SU8gLXa1laTbMxoAJxvgLtkrJ1D+7ZqW60WhGbe7u+oZ
 DcR7PkWUMuQrUYcIzpDaoSE12yC0wlx7dvJGKNHI69mjrx1FOfz/v52mGViKy4HdEals
 FM6NdMRlgExcRPJOF2fw00gptjn4Ap43E2x3rCJtxDNOAPVpnOaiQKkvyRwHkMbFig36
 SP4x21fjNi0hPmnSAbm9oYwLt/d+2Mqo7ti409WHQV5+RDwt0NmwIxur0QpO7XL/yGeA
 wkEGMPY2jr5T6OdUmtISJIJD6Zv1eLW8r/oi7lu0ONBWbh+TdZcDDlKDjXmJ1XQEVId0
 eaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xF2oun62LPfztg22YpP4gOo8KAfaTRYJa39N9xYIbqA=;
 b=p1edATWHG+PzzuOyN97w6F2PCbBx3lt62KY/nDtL9lVlb9rVIOu3JIp3C2BKYew8OY
 bljV+boVVmSEHgbaTrK4Skb6Y5UBaHI1iPYBHh+tx93GpKLsZ9cNsXy4AbRZ/dEMkHNk
 O3GzWw7/L1YBW4W1yQEtYonF17IU83SdL9JhPh53UnVXqQvSWGfrxmo5Nd+Ty4Q37Spg
 CVvJWXBzJlqn1XxApnNuhhNWTG2EG33BUJ37wf+ejM8JA3b9B6vhFFNhtX0A3DM4/DDi
 q8Wrg4gWSXyMQuCEMLIVl62ww8DiJjDemPdygq0njyOs/6NAGJn4p9pHOFbPVNJOkrbV
 SHKg==
X-Gm-Message-State: AOAM531t1nTOKuYSSSxvru66M3xrbV6en2PW6JEob1+CTiH66/BT2Dso
 j17uRVGfB9plLWt02tmvWKbZSxmqi98=
X-Google-Smtp-Source: ABdhPJx6Bv6YKnJp4k/LaJWqRWt0aKalOyCVrpLWRyJzdVmSQQDC2I3MZBFsEentflGO08tAYOn3uw==
X-Received: by 2002:a17:902:7c0a:b0:156:87e0:846 with SMTP id
 x10-20020a1709027c0a00b0015687e00846mr34315780pll.8.1649714317772; 
 Mon, 11 Apr 2022 14:58:37 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 p9-20020aa79e89000000b00505fada20dfsm121373pfq.117.2022.04.11.14.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 14:58:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 09/10] drm/msm/gem: Add fenced vma unpin
Date: Mon, 11 Apr 2022 14:58:38 -0700
Message-Id: <20220411215849.297838-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411215849.297838-1-robdclark@gmail.com>
References: <20220411215849.297838-1-robdclark@gmail.com>
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
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

With userspace allocated iova (next patch), we can have a race condition
where userspace observes the fence completion and deletes the vma before
retire_submit() gets around to unpinning the vma.  To handle this, add a
fenced unpin which drops the refcount but tracks the fence, and update
msm_gem_vma_inuse() to check any previously unsignaled fences.

v2: Fix inuse underflow (duplicate unpin)
v3: Fix msm_job_run() vs submit_cleanup() race condition

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_fence.c      |  6 ++++--
 drivers/gpu/drm/msm/msm_fence.h      |  3 +++
 drivers/gpu/drm/msm/msm_gem.c        |  2 +-
 drivers/gpu/drm/msm/msm_gem.h        | 14 +++++++++++--
 drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++++-------
 drivers/gpu/drm/msm/msm_gem_vma.c    | 30 +++++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_ringbuffer.c | 13 +++++++++++-
 7 files changed, 66 insertions(+), 17 deletions(-)

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
index f98264cf130d..580b6eb95edd 100644
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
@@ -363,6 +368,11 @@ struct msm_gem_submit {
 		struct drm_msm_gem_submit_reloc *relocs;
 	} *cmd;  /* array of size nr_cmds */
 	struct {
+/* make sure these don't conflict w/ MSM_SUBMIT_BO_x */
+#define BO_VALID    0x8000   /* is current addr in cmdstream correct/valid? */
+#define BO_LOCKED   0x4000   /* obj lock is held */
+#define BO_ACTIVE   0x2000   /* active refcnt is held */
+#define BO_PINNED   0x1000   /* obj is pinned and on active list */
 		uint32_t flags;
 		union {
 			struct msm_gem_object *obj;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 91da05af40ee..23b68bc945f6 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -21,12 +21,6 @@
  * Cmdstream submission:
  */
 
-/* make sure these don't conflict w/ MSM_SUBMIT_BO_x */
-#define BO_VALID    0x8000   /* is current addr in cmdstream correct/valid? */
-#define BO_LOCKED   0x4000   /* obj lock is held */
-#define BO_ACTIVE   0x2000   /* active refcnt is held */
-#define BO_PINNED   0x1000   /* obj is pinned and on active list */
-
 static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		struct msm_gpu *gpu,
 		struct msm_gpu_submitqueue *queue, uint32_t nr_bos,
@@ -231,6 +225,13 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 	struct drm_gem_object *obj = &submit->bos[i].obj->base;
 	unsigned flags = submit->bos[i].flags & cleanup_flags;
 
+	/*
+	 * Clear flags bit before dropping lock, so that the msm_job_run()
+	 * path isn't racing with submit_cleanup() (ie. the read/modify/
+	 * write is protected by the obj lock in all paths)
+	 */
+	submit->bos[i].flags &= ~cleanup_flags;
+
 	if (flags & BO_PINNED)
 		msm_gem_unpin_vma_locked(obj, submit->bos[i].vma);
 
@@ -239,8 +240,6 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 
 	if (flags & BO_LOCKED)
 		dma_resv_unlock(obj->resv);
-
-	submit->bos[i].flags &= ~cleanup_flags;
 }
 
 static void submit_unlock_unpin_bo(struct msm_gem_submit *submit, int i)
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 4949899f1fc7..0cd6770faf41 100644
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
@@ -63,13 +76,24 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 }
 
 /* Remove reference counts for the mapping */
-void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma)
+void msm_gem_unpin_vma(struct msm_gem_vma *vma)
 {
+	if (GEM_WARN_ON(!vma->inuse))
+		return;
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
index 367a6aaa3a20..eb67fce5bc62 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -14,9 +14,20 @@ module_param(num_hw_submissions, uint, 0600);
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
+		submit->bos[i].flags &= ~BO_PINNED;
+		msm_gem_unlock(obj);
+	}
 
 	pm_runtime_get_sync(&gpu->pdev->dev);
 
-- 
2.35.1

