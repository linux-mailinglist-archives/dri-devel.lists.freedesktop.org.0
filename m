Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD466C1518
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6166C10E577;
	Mon, 20 Mar 2023 14:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F092F10E1F1;
 Mon, 20 Mar 2023 14:44:38 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 p3-20020a17090a74c300b0023f69bc7a68so8144865pjl.4; 
 Mon, 20 Mar 2023 07:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679323478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xALpMXlLTSMvOfS7mQNvHfzG9+8QM3cmx9b7Fz6Q2XU=;
 b=cxu8fcc47sheJUocs3NFK/ej2kra9Ypkl7pCx1H1P5vOekErq1/GNU3/ZBsh7fug/U
 LK5SzMY1CdLJhSlItGMRB+oN2kKcpG9ZezdZTN4n8Us/IaCGxAzVEcp9zoIzcbsHXM8l
 Qze0Vuq2K4bx7XB8PZONqv84P/6H9hG3kl7ovKb5I6Z0JnHdaUA2grKNAlEuYnpDmN+B
 Y9CLZCVJ6ye3i6QM7sDrald94pji9aWZ+2cy0EOHNDHwDIaL6b6wQ2WpqdFMnc1TBHeR
 qnuRIQoDVOVCXCBRpQ2sohXgh4ltYqi2IkT24bat3p9pR9f1dZscLLR8ov0SK99wX8qm
 HqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xALpMXlLTSMvOfS7mQNvHfzG9+8QM3cmx9b7Fz6Q2XU=;
 b=LzdM+cYyxa60Wuqe+WOJHO+q6ZIbzjB//W0jR9vqrG/6skuhVW8JXiCucY5NgMRkAB
 1PIbbtAHDUwSLHMKt5fRixEHu+dwb3LhWuwPY1lGTzQH2/KeqYwwt2MJdvHsReheDeoP
 4sk+IU/7Wn1iSLvqiD1j3OH/lRsCBvi4O+N2mOhNyTBfjaGU9QA4NBR/uFoHmqYexrVC
 +xySWEUsmsxcj9Woth9b1MwPV8T1fcgaO97LWZwYE/JIkNtwmG5BcnmO5ecsGUHT3nYZ
 7zUp6J42QoFxY/GJo1E8Wqpikc+9khNk4L9rISj9J2wDtTSXHhmnIxC0yong+U/DettQ
 elmQ==
X-Gm-Message-State: AO0yUKUS0jaWI416FOwAd0JTPsz4UfxdXJsc2CL79TPIC2I2qhx5Pv3V
 8X15MrnuQGd2X8P40G7a6lfmKlchfeA=
X-Google-Smtp-Source: AK7set/Og7pcuw4IzsENyS7Re6THWUo/30QuP9+MbL2JloNr5T9/L0e5eyWIxk080vd7BjvX4FSQ2A==
X-Received: by 2002:a05:6a20:7b05:b0:da:39a5:6e66 with SMTP id
 s5-20020a056a207b0500b000da39a56e66mr920491pzh.18.1679323478303; 
 Mon, 20 Mar 2023 07:44:38 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a63e50d000000b004fb26a80875sm6389111pgh.22.2023.03.20.07.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:44:37 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/23] drm/msm: Decouple vma tracking from obj lock
Date: Mon, 20 Mar 2023 07:43:26 -0700
Message-Id: <20230320144356.803762-5-robdclark@gmail.com>
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

We need to use the inuse count to track that a BO is pinned until
we have the hw_fence.  But we want to remove the obj lock from the
job_run() path as this could deadlock against reclaim/shrinker
(because it is blocking the hw_fence from eventually being signaled).
So split that tracking out into a per-vma lock with narrower scope.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h        |  1 +
 drivers/gpu/drm/msm/msm_gem_vma.c    | 44 ++++++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_ringbuffer.c |  2 +-
 3 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index d3219c523034..1929f09c5b0d 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -59,6 +59,7 @@ struct msm_fence_context;
 
 struct msm_gem_vma {
 	struct drm_mm_node node;
+	spinlock_t lock;
 	uint64_t iova;
 	struct msm_gem_address_space *aspace;
 	struct list_head list;    /* node in msm_gem_object::vmas */
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 2827679dc39a..98287ed99960 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -40,19 +40,28 @@ msm_gem_address_space_get(struct msm_gem_address_space *aspace)
 
 bool msm_gem_vma_inuse(struct msm_gem_vma *vma)
 {
+	bool ret = true;
+
+	spin_lock(&vma->lock);
+
 	if (vma->inuse > 0)
-		return true;
+		goto out;
 
 	while (vma->fence_mask) {
 		unsigned idx = ffs(vma->fence_mask) - 1;
 
 		if (!msm_fence_completed(vma->fctx[idx], vma->fence[idx]))
-			return true;
+			goto out;
 
 		vma->fence_mask &= ~BIT(idx);
 	}
 
-	return false;
+	ret = false;
+
+out:
+	spin_unlock(&vma->lock);
+
+	return ret;
 }
 
 /* Actually unmap memory for the vma */
@@ -73,8 +82,7 @@ void msm_gem_vma_purge(struct msm_gem_vma *vma)
 	vma->mapped = false;
 }
 
-/* Remove reference counts for the mapping */
-void msm_gem_vma_unpin(struct msm_gem_vma *vma)
+static void vma_unpin_locked(struct msm_gem_vma *vma)
 {
 	if (GEM_WARN_ON(!vma->inuse))
 		return;
@@ -82,13 +90,23 @@ void msm_gem_vma_unpin(struct msm_gem_vma *vma)
 		vma->inuse--;
 }
 
+/* Remove reference counts for the mapping */
+void msm_gem_vma_unpin(struct msm_gem_vma *vma)
+{
+	spin_lock(&vma->lock);
+	vma_unpin_locked(vma);
+	spin_unlock(&vma->lock);
+}
+
 /* Replace pin reference with fence: */
 void msm_gem_vma_unpin_fenced(struct msm_gem_vma *vma, struct msm_fence_context *fctx)
 {
+	spin_lock(&vma->lock);
 	vma->fctx[fctx->index] = fctx;
 	vma->fence[fctx->index] = fctx->last_fence;
 	vma->fence_mask |= BIT(fctx->index);
-	msm_gem_vma_unpin(vma);
+	vma_unpin_locked(vma);
+	spin_unlock(&vma->lock);
 }
 
 /* Map and pin vma: */
@@ -103,7 +121,9 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 		return -EINVAL;
 
 	/* Increase the usage counter */
+	spin_lock(&vma->lock);
 	vma->inuse++;
+	spin_unlock(&vma->lock);
 
 	if (vma->mapped)
 		return 0;
@@ -113,11 +133,22 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 	if (!aspace)
 		return 0;
 
+	/*
+	 * NOTE: iommu/io-pgtable can allocate pages, so we cannot hold
+	 * a lock across map/unmap which is also used in the job_run()
+	 * path, as this can cause deadlock in job_run() vs shrinker/
+	 * reclaim.
+	 *
+	 * Revisit this if we can come up with a scheme to pre-alloc pages
+	 * for the pgtable in map/unmap ops.
+	 */
 	ret = aspace->mmu->funcs->map(aspace->mmu, vma->iova, sgt, size, prot);
 
 	if (ret) {
 		vma->mapped = false;
+		spin_lock(&vma->lock);
 		vma->inuse--;
+		spin_unlock(&vma->lock);
 	}
 
 	return ret;
@@ -148,6 +179,7 @@ struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_address_space *aspace)
 	if (!vma)
 		return NULL;
 
+	spin_lock_init(&vma->lock);
 	vma->aspace = aspace;
 
 	return vma;
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 44a22b283730..31b4fbf96c36 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -23,8 +23,8 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 
-		msm_gem_lock(obj);
 		msm_gem_vma_unpin_fenced(submit->bos[i].vma, fctx);
+		msm_gem_lock(obj);
 		msm_gem_unpin_locked(obj);
 		msm_gem_unlock(obj);
 		submit->bos[i].flags &= ~(BO_VMA_PINNED | BO_OBJ_PINNED);
-- 
2.39.2

