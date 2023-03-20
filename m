Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFE26C151F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0012810E583;
	Mon, 20 Mar 2023 14:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1231410E1D7;
 Mon, 20 Mar 2023 14:44:37 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso16771825pjb.0; 
 Mon, 20 Mar 2023 07:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679323476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hf3gRKGEzXkyWVAG2dEyFqi1/XxKRGGVjOETTiZLoYA=;
 b=i7p9jOLfKKDLeTfpyYWy7C7cs5eDcLLglS6iEXPl+/oEKtAHSdTCq+sXrgoFVTgnBh
 yO/LJxxjlc4i4j4Gpfo7b5bV6E8IV+ozXRsE2nuOP72UKaer0gQmS0XjbLEukYy9sedX
 SaYoXVQRm1mKpUEp+Rp+oOHqLAUTRvy75LyJpqxPjX1E4yGI659Z5jbdr1AhUqIg8ZGY
 9m8+Ebx7hi28bYL7sY3q3N76MYvrrm0wctvT0G6ckOGnllmePPey2ZsBmbAkDYhbm9B/
 0R/LZDOxfzN895K5eve2Y/x4ONk1eKB6TlASR1TM531IYadPx91JYD3h7Mz0jK6kyCNF
 uJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hf3gRKGEzXkyWVAG2dEyFqi1/XxKRGGVjOETTiZLoYA=;
 b=XfYIPi/V11r7M/mNR71MdTsnqrRZPLV8bcQiFHTQe9RxKjguOiKrENIZnOuyzvIVGZ
 9Rh4vP6QoRjhtCNK2Jtb2qJqk5eRqL1w77j/eTesSZSRo8LbfTcRG6VqRNhEjkkRUnpo
 lVHh3kEWzPWUJwAPydfB2PqLeXWTDhFPCs3RdXh5+jfHeA6+JDSDzcCAZLDJHK6oUea1
 Ikr3lpElmTSFA+MTm1HW7Tm7Oxk48GTdQq5ZQyQSUoIK7LZQdCkEYfiXZhDZl7g2dLae
 m6tLSN9psr2FML31Vif/314HwgvQUzyBcVXA4QrgyBm1n4U1nN61ADiigBNcAfKv4ec4
 pVnw==
X-Gm-Message-State: AO0yUKVw/Sxo0aK9ikHkDP+tre4h88tyQIYLOWACRhVxUm9nQiE6Mz5S
 lK2+F+CXGdc1CjBZmFJXULPJI9bSNHM=
X-Google-Smtp-Source: AK7set98LfakjnQuCwWj87usLvTm+iSmEV2T6zF1D7b1lOmHRdqRxvvEGo8C9by30PXh5dsVOb6A1Q==
X-Received: by 2002:a17:903:28c3:b0:19e:ecaf:c4b4 with SMTP id
 kv3-20020a17090328c300b0019eecafc4b4mr14765234plb.4.1679323476396; 
 Mon, 20 Mar 2023 07:44:36 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a170902d0d400b0019c901b35ecsm6822551pln.106.2023.03.20.07.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:44:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/23] drm/msm/gem: Tidy up VMA API
Date: Mon, 20 Mar 2023 07:43:25 -0700
Message-Id: <20230320144356.803762-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320144356.803762-1-robdclark@gmail.com>
References: <20230320144356.803762-1-robdclark@gmail.com>
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Stop open coding VMA construction, which will be needed in the next
commit.  And since the VMA already has a ptr to the adress space, stop
passing that around everywhere.  (Also, an aspace always has an mmu so
we can drop a couple pointless NULL checks.)

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c        | 18 +++++-----
 drivers/gpu/drm/msm/msm_gem.h        | 18 ++++------
 drivers/gpu/drm/msm/msm_gem_submit.c |  2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c    | 51 ++++++++++++++++++----------
 drivers/gpu/drm/msm/msm_ringbuffer.c |  2 +-
 5 files changed, 51 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 1dee0d18abbb..6734aecf0703 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -309,12 +309,10 @@ static struct msm_gem_vma *add_vma(struct drm_gem_object *obj,
 
 	msm_gem_assert_locked(obj);
 
-	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
+	vma = msm_gem_vma_new(aspace);
 	if (!vma)
 		return ERR_PTR(-ENOMEM);
 
-	vma->aspace = aspace;
-
 	list_add_tail(&vma->list, &msm_obj->vmas);
 
 	return vma;
@@ -361,9 +359,9 @@ put_iova_spaces(struct drm_gem_object *obj, bool close)
 
 	list_for_each_entry(vma, &msm_obj->vmas, list) {
 		if (vma->aspace) {
-			msm_gem_purge_vma(vma->aspace, vma);
+			msm_gem_vma_purge(vma);
 			if (close)
-				msm_gem_close_vma(vma->aspace, vma);
+				msm_gem_vma_close(vma);
 		}
 	}
 }
@@ -399,7 +397,7 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 		if (IS_ERR(vma))
 			return vma;
 
-		ret = msm_gem_init_vma(aspace, vma, obj->size,
+		ret = msm_gem_vma_init(vma, obj->size,
 			range_start, range_end);
 		if (ret) {
 			del_vma(vma);
@@ -437,7 +435,7 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma)
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
-	ret = msm_gem_map_vma(vma->aspace, vma, prot, msm_obj->sgt, obj->size);
+	ret = msm_gem_vma_map(vma, prot, msm_obj->sgt, obj->size);
 	if (ret)
 		msm_gem_unpin_locked(obj);
 
@@ -539,8 +537,8 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (msm_gem_vma_inuse(vma))
 		return -EBUSY;
 
-	msm_gem_purge_vma(vma->aspace, vma);
-	msm_gem_close_vma(vma->aspace, vma);
+	msm_gem_vma_purge(vma);
+	msm_gem_vma_close(vma);
 	del_vma(vma);
 
 	return 0;
@@ -589,7 +587,7 @@ void msm_gem_unpin_iova(struct drm_gem_object *obj,
 	msm_gem_lock(obj);
 	vma = lookup_vma(obj, aspace);
 	if (!GEM_WARN_ON(!vma)) {
-		msm_gem_unpin_vma(vma);
+		msm_gem_vma_unpin(vma);
 		msm_gem_unpin_locked(obj);
 	}
 	msm_gem_unlock(obj);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c4844cf3a585..d3219c523034 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -69,19 +69,15 @@ struct msm_gem_vma {
 	struct msm_fence_context *fctx[MSM_GPU_MAX_RINGS];
 };
 
-int msm_gem_init_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma, int size,
+struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_address_space *aspace);
+int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
 		u64 range_start, u64 range_end);
 bool msm_gem_vma_inuse(struct msm_gem_vma *vma);
-void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma);
-void msm_gem_unpin_vma(struct msm_gem_vma *vma);
-void msm_gem_unpin_vma_fenced(struct msm_gem_vma *vma, struct msm_fence_context *fctx);
-int msm_gem_map_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma, int prot,
-		struct sg_table *sgt, int size);
-void msm_gem_close_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma);
+void msm_gem_vma_purge(struct msm_gem_vma *vma);
+void msm_gem_vma_unpin(struct msm_gem_vma *vma);
+void msm_gem_vma_unpin_fenced(struct msm_gem_vma *vma, struct msm_fence_context *fctx);
+int msm_gem_vma_map(struct msm_gem_vma *vma, int prot, struct sg_table *sgt, int size);
+void msm_gem_vma_close(struct msm_gem_vma *vma);
 
 struct msm_gem_object {
 	struct drm_gem_object base;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 2570c018b0cb..1d8e7c2a8024 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -249,7 +249,7 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 	submit->bos[i].flags &= ~cleanup_flags;
 
 	if (flags & BO_VMA_PINNED)
-		msm_gem_unpin_vma(submit->bos[i].vma);
+		msm_gem_vma_unpin(submit->bos[i].vma);
 
 	if (flags & BO_OBJ_PINNED)
 		msm_gem_unpin_locked(obj);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index c471aebcdbab..2827679dc39a 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -56,9 +56,9 @@ bool msm_gem_vma_inuse(struct msm_gem_vma *vma)
 }
 
 /* Actually unmap memory for the vma */
-void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma)
+void msm_gem_vma_purge(struct msm_gem_vma *vma)
 {
+	struct msm_gem_address_space *aspace = vma->aspace;
 	unsigned size = vma->node.size;
 
 	/* Print a message if we try to purge a vma in use */
@@ -68,14 +68,13 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 	if (!vma->mapped)
 		return;
 
-	if (aspace->mmu)
-		aspace->mmu->funcs->unmap(aspace->mmu, vma->iova, size);
+	aspace->mmu->funcs->unmap(aspace->mmu, vma->iova, size);
 
 	vma->mapped = false;
 }
 
 /* Remove reference counts for the mapping */
-void msm_gem_unpin_vma(struct msm_gem_vma *vma)
+void msm_gem_vma_unpin(struct msm_gem_vma *vma)
 {
 	if (GEM_WARN_ON(!vma->inuse))
 		return;
@@ -84,21 +83,21 @@ void msm_gem_unpin_vma(struct msm_gem_vma *vma)
 }
 
 /* Replace pin reference with fence: */
-void msm_gem_unpin_vma_fenced(struct msm_gem_vma *vma, struct msm_fence_context *fctx)
+void msm_gem_vma_unpin_fenced(struct msm_gem_vma *vma, struct msm_fence_context *fctx)
 {
 	vma->fctx[fctx->index] = fctx;
 	vma->fence[fctx->index] = fctx->last_fence;
 	vma->fence_mask |= BIT(fctx->index);
-	msm_gem_unpin_vma(vma);
+	msm_gem_vma_unpin(vma);
 }
 
 /* Map and pin vma: */
 int
-msm_gem_map_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma, int prot,
+msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 		struct sg_table *sgt, int size)
 {
-	int ret = 0;
+	struct msm_gem_address_space *aspace = vma->aspace;
+	int ret;
 
 	if (GEM_WARN_ON(!vma->iova))
 		return -EINVAL;
@@ -111,9 +110,10 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
 
 	vma->mapped = true;
 
-	if (aspace && aspace->mmu)
-		ret = aspace->mmu->funcs->map(aspace->mmu, vma->iova, sgt,
-				size, prot);
+	if (!aspace)
+		return 0;
+
+	ret = aspace->mmu->funcs->map(aspace->mmu, vma->iova, sgt, size, prot);
 
 	if (ret) {
 		vma->mapped = false;
@@ -124,9 +124,10 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
 }
 
 /* Close an iova.  Warn if it is still in use */
-void msm_gem_close_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma)
+void msm_gem_vma_close(struct msm_gem_vma *vma)
 {
+	struct msm_gem_address_space *aspace = vma->aspace;
+
 	GEM_WARN_ON(msm_gem_vma_inuse(vma) || vma->mapped);
 
 	spin_lock(&aspace->lock);
@@ -139,13 +140,29 @@ void msm_gem_close_vma(struct msm_gem_address_space *aspace,
 	msm_gem_address_space_put(aspace);
 }
 
+struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_address_space *aspace)
+{
+	struct msm_gem_vma *vma;
+
+	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
+	if (!vma)
+		return NULL;
+
+	vma->aspace = aspace;
+
+	return vma;
+}
+
 /* Initialize a new vma and allocate an iova for it */
-int msm_gem_init_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma, int size,
+int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
 		u64 range_start, u64 range_end)
 {
+	struct msm_gem_address_space *aspace = vma->aspace;
 	int ret;
 
+	if (GEM_WARN_ON(!aspace))
+		return -EINVAL;
+
 	if (GEM_WARN_ON(vma->iova))
 		return -EBUSY;
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index a80447c8764e..44a22b283730 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -24,7 +24,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 
 		msm_gem_lock(obj);
-		msm_gem_unpin_vma_fenced(submit->bos[i].vma, fctx);
+		msm_gem_vma_unpin_fenced(submit->bos[i].vma, fctx);
 		msm_gem_unpin_locked(obj);
 		msm_gem_unlock(obj);
 		submit->bos[i].flags &= ~(BO_VMA_PINNED | BO_OBJ_PINNED);
-- 
2.39.2

