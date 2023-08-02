Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D93A76DABE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 00:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FD510E588;
	Wed,  2 Aug 2023 22:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82F710E584;
 Wed,  2 Aug 2023 22:22:42 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-68783004143so221982b3a.2; 
 Wed, 02 Aug 2023 15:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691014962; x=1691619762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XdybEnCEdXCCDRXI8XxrOexQ2ndgYZJ6uVUfLzgHn70=;
 b=J5+QU+vNyj6hgKCY2k+DFqN9z9EYwLrg/fuB0uKKhtZJ4lpFKNi3wqpJCxS71ankvb
 YX7DmNVhrEm7TP5OfJROh1U0WUbtb+Y0KOvq+Su+jFRJmfSkURRpe0+sQxxEcGw0n35r
 tMFWkjPgUEAaF36lsZNAVVM9ISvqvz4epcVg5tcZgsnrErlRyhgEu/xX6wLejDbD1ILn
 AA1iKWpQe05F6UX6M2J45WPWe3Ue7OJuOZpEEFkeKg+mYeEbqI5N9/jp6/02PJrTIKAf
 Lu7fZter3j4HkRKXLKwB2RPESf4h3j8z+5Fr/jn+lHHb+Ub6n/SXOQjf2TbilhaVATK7
 EPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691014962; x=1691619762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XdybEnCEdXCCDRXI8XxrOexQ2ndgYZJ6uVUfLzgHn70=;
 b=GTX1f80DqILqdIVARRkRjJ/HjH55N0eEvA2JKw5siwMcQ8JrMXOI/PRDo+463FngG3
 JH47ZAOKjErdlslQu/ZyseYGAFJ3CDICL66aJmul9kJTs2fUVqQKSevjSpOUNE8EiDbg
 eAO3d3sfY9n4Jkr0FREx41mAs1yDF4cuZSwCN6KjcevMDLolUqpaygOmOU1W6nF46113
 DEW/mprZ+d01JnTRM5K8Ip8nE+91NNsQgZGx4+DS4Y75nEz5XGDf5l5bOHMe3bgz2561
 sNFaXQxA5jlkhs74jhcvcjsHyotaopJInil9H3SiIsDi9Z9ljgjEhKRjWigcRC+TOdvL
 wJEg==
X-Gm-Message-State: ABy/qLY7txxF0aVA+C3qv6hyVP3pqHmH7ac3CQ17//B/uxx86W6I8WHO
 Va30f6422c/k4kZZC2GLUPMFFLvTdU4=
X-Google-Smtp-Source: APBJJlGjhSExvCFbHtGmr3GexlBgfaXoBhMCvnxdN6IesRHb/YI2aReDAfMw9cETn/i19jpUEL4LAg==
X-Received: by 2002:a05:6a20:1611:b0:12f:c0c1:d70 with SMTP id
 l17-20020a056a20161100b0012fc0c10d70mr18602242pzj.40.1691014961811; 
 Wed, 02 Aug 2023 15:22:41 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:33de:aac3:fe1d:788])
 by smtp.gmail.com with ESMTPSA id
 ey14-20020a056a0038ce00b00686bdff1d6fsm11304015pfb.77.2023.08.02.15.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 15:22:41 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/msm: Remove vma use tracking
Date: Wed,  2 Aug 2023 15:21:52 -0700
Message-ID: <20230802222158.11838-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802222158.11838-1-robdclark@gmail.com>
References: <20230802222158.11838-1-robdclark@gmail.com>
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
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This was not strictly necessary, as page unpinning (ie. shrinker) only
cares about the resv.  It did give us some extra sanity checking for
userspace controlled iova, and was useful to catch issues on kernel and
userspace side when enabling userspace iova.  But if userspace screws
this up, it just corrupts it's own gpu buffers and/or gets iova faults.
So we can just let userspace shoot it's own foot and drop the extra per-
buffer SUBMIT overhead.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c        |  9 +---
 drivers/gpu/drm/msm/msm_gem.h        | 12 +----
 drivers/gpu/drm/msm/msm_gem_submit.c | 14 ++----
 drivers/gpu/drm/msm/msm_gem_vma.c    | 67 +---------------------------
 drivers/gpu/drm/msm/msm_ringbuffer.c |  3 +-
 5 files changed, 9 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 1c81ff6115ac..ce1ed0f9ad2d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -607,9 +607,6 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	if (msm_gem_vma_inuse(vma))
-		return -EBUSY;
-
 	msm_gem_vma_purge(vma);
 	msm_gem_vma_close(vma);
 	del_vma(vma);
@@ -660,7 +657,6 @@ void msm_gem_unpin_iova(struct drm_gem_object *obj,
 	msm_gem_lock(obj);
 	vma = lookup_vma(obj, aspace);
 	if (!GEM_WARN_ON(!vma)) {
-		msm_gem_vma_unpin(vma);
 		msm_gem_unpin_locked(obj);
 	}
 	msm_gem_unlock(obj);
@@ -991,11 +987,10 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 			} else {
 				name = comm = NULL;
 			}
-			seq_printf(m, " [%s%s%s: aspace=%p, %08llx,%s,inuse=%d]",
+			seq_printf(m, " [%s%s%s: aspace=%p, %08llx,%s]",
 				name, comm ? ":" : "", comm ? comm : "",
 				vma->aspace, vma->iova,
-				vma->mapped ? "mapped" : "unmapped",
-				msm_gem_vma_inuse(vma));
+				vma->mapped ? "mapped" : "unmapped");
 			kfree(comm);
 		}
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 2ddd896aac68..8ddef5443140 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -59,24 +59,16 @@ struct msm_fence_context;
 
 struct msm_gem_vma {
 	struct drm_mm_node node;
-	spinlock_t lock;
 	uint64_t iova;
 	struct msm_gem_address_space *aspace;
 	struct list_head list;    /* node in msm_gem_object::vmas */
 	bool mapped;
-	int inuse;
-	uint32_t fence_mask;
-	uint32_t fence[MSM_GPU_MAX_RINGS];
-	struct msm_fence_context *fctx[MSM_GPU_MAX_RINGS];
 };
 
 struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_address_space *aspace);
 int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
 		u64 range_start, u64 range_end);
-bool msm_gem_vma_inuse(struct msm_gem_vma *vma);
 void msm_gem_vma_purge(struct msm_gem_vma *vma);
-void msm_gem_vma_unpin(struct msm_gem_vma *vma);
-void msm_gem_vma_unpin_fenced(struct msm_gem_vma *vma, struct msm_fence_context *fctx);
 int msm_gem_vma_map(struct msm_gem_vma *vma, int prot, struct sg_table *sgt, int size);
 void msm_gem_vma_close(struct msm_gem_vma *vma);
 
@@ -298,15 +290,13 @@ struct msm_gem_submit {
 /* make sure these don't conflict w/ MSM_SUBMIT_BO_x */
 #define BO_VALID	0x8000	/* is current addr in cmdstream correct/valid? */
 #define BO_LOCKED	0x4000	/* obj lock is held */
-#define BO_OBJ_PINNED	0x2000	/* obj (pages) is pinned and on active list */
-#define BO_VMA_PINNED	0x1000	/* vma (virtual address) is pinned */
+#define BO_PINNED	0x2000	/* obj (pages) is pinned and on active list */
 		uint32_t flags;
 		union {
 			struct drm_gem_object *obj;
 			uint32_t handle;
 		};
 		uint64_t iova;
-		struct msm_gem_vma *vma;
 	} bos[];
 };
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index b17561ebd518..5f90cc8e7b7f 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -261,10 +261,7 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 	 */
 	submit->bos[i].flags &= ~cleanup_flags;
 
-	if (flags & BO_VMA_PINNED)
-		msm_gem_vma_unpin(submit->bos[i].vma);
-
-	if (flags & BO_OBJ_PINNED)
+	if (flags & BO_PINNED)
 		msm_gem_unpin_locked(obj);
 
 	if (flags & BO_LOCKED)
@@ -273,7 +270,7 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 
 static void submit_unlock_unpin_bo(struct msm_gem_submit *submit, int i)
 {
-	unsigned cleanup_flags = BO_VMA_PINNED | BO_OBJ_PINNED | BO_LOCKED;
+	unsigned cleanup_flags = BO_PINNED | BO_LOCKED;
 	submit_cleanup_bo(submit, i, cleanup_flags);
 
 	if (!(submit->bos[i].flags & BO_VALID))
@@ -404,9 +401,6 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		if (ret)
 			break;
 
-		submit->bos[i].flags |= BO_VMA_PINNED;
-		submit->bos[i].vma = vma;
-
 		if (vma->iova == submit->bos[i].iova) {
 			submit->bos[i].flags |= BO_VALID;
 		} else {
@@ -420,7 +414,7 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 	mutex_lock(&priv->lru.lock);
 	for (i = 0; i < submit->nr_bos; i++) {
 		msm_gem_pin_obj_locked(submit->bos[i].obj);
-		submit->bos[i].flags |= BO_OBJ_PINNED;
+		submit->bos[i].flags |= BO_PINNED;
 	}
 	mutex_unlock(&priv->lru.lock);
 
@@ -547,7 +541,7 @@ static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 	unsigned i;
 
 	if (error)
-		cleanup_flags |= BO_VMA_PINNED | BO_OBJ_PINNED;
+		cleanup_flags |= BO_PINNED;
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 98287ed99960..11e842dda73c 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -38,41 +38,12 @@ msm_gem_address_space_get(struct msm_gem_address_space *aspace)
 	return aspace;
 }
 
-bool msm_gem_vma_inuse(struct msm_gem_vma *vma)
-{
-	bool ret = true;
-
-	spin_lock(&vma->lock);
-
-	if (vma->inuse > 0)
-		goto out;
-
-	while (vma->fence_mask) {
-		unsigned idx = ffs(vma->fence_mask) - 1;
-
-		if (!msm_fence_completed(vma->fctx[idx], vma->fence[idx]))
-			goto out;
-
-		vma->fence_mask &= ~BIT(idx);
-	}
-
-	ret = false;
-
-out:
-	spin_unlock(&vma->lock);
-
-	return ret;
-}
-
 /* Actually unmap memory for the vma */
 void msm_gem_vma_purge(struct msm_gem_vma *vma)
 {
 	struct msm_gem_address_space *aspace = vma->aspace;
 	unsigned size = vma->node.size;
 
-	/* Print a message if we try to purge a vma in use */
-	GEM_WARN_ON(msm_gem_vma_inuse(vma));
-
 	/* Don't do anything if the memory isn't mapped */
 	if (!vma->mapped)
 		return;
@@ -82,33 +53,6 @@ void msm_gem_vma_purge(struct msm_gem_vma *vma)
 	vma->mapped = false;
 }
 
-static void vma_unpin_locked(struct msm_gem_vma *vma)
-{
-	if (GEM_WARN_ON(!vma->inuse))
-		return;
-	if (!GEM_WARN_ON(!vma->iova))
-		vma->inuse--;
-}
-
-/* Remove reference counts for the mapping */
-void msm_gem_vma_unpin(struct msm_gem_vma *vma)
-{
-	spin_lock(&vma->lock);
-	vma_unpin_locked(vma);
-	spin_unlock(&vma->lock);
-}
-
-/* Replace pin reference with fence: */
-void msm_gem_vma_unpin_fenced(struct msm_gem_vma *vma, struct msm_fence_context *fctx)
-{
-	spin_lock(&vma->lock);
-	vma->fctx[fctx->index] = fctx;
-	vma->fence[fctx->index] = fctx->last_fence;
-	vma->fence_mask |= BIT(fctx->index);
-	vma_unpin_locked(vma);
-	spin_unlock(&vma->lock);
-}
-
 /* Map and pin vma: */
 int
 msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
@@ -120,11 +64,6 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 	if (GEM_WARN_ON(!vma->iova))
 		return -EINVAL;
 
-	/* Increase the usage counter */
-	spin_lock(&vma->lock);
-	vma->inuse++;
-	spin_unlock(&vma->lock);
-
 	if (vma->mapped)
 		return 0;
 
@@ -146,9 +85,6 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 
 	if (ret) {
 		vma->mapped = false;
-		spin_lock(&vma->lock);
-		vma->inuse--;
-		spin_unlock(&vma->lock);
 	}
 
 	return ret;
@@ -159,7 +95,7 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 {
 	struct msm_gem_address_space *aspace = vma->aspace;
 
-	GEM_WARN_ON(msm_gem_vma_inuse(vma) || vma->mapped);
+	GEM_WARN_ON(vma->mapped);
 
 	spin_lock(&aspace->lock);
 	if (vma->iova)
@@ -179,7 +115,6 @@ struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_address_space *aspace)
 	if (!vma)
 		return NULL;
 
-	spin_lock_init(&vma->lock);
 	vma->aspace = aspace;
 
 	return vma;
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 6fa427d2992e..7f5e0a961bba 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -26,9 +26,8 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
 
-		msm_gem_vma_unpin_fenced(submit->bos[i].vma, fctx);
 		msm_gem_unpin_active(obj);
-		submit->bos[i].flags &= ~(BO_VMA_PINNED | BO_OBJ_PINNED);
+		submit->bos[i].flags &= ~BO_PINNED;
 	}
 
 	mutex_unlock(&priv->lru.lock);
-- 
2.41.0

