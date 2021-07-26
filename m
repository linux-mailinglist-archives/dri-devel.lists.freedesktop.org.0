Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABE83D5C5A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 16:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D306FA99;
	Mon, 26 Jul 2021 14:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D816EC27;
 Mon, 26 Jul 2021 14:56:49 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id n10so12034629plf.4;
 Mon, 26 Jul 2021 07:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rnP/gkcL5lHTpvD1psUDDCzdJhpjhd83ZXQCggS2n0o=;
 b=YGxBHCncLsETFRbU+qTbM8JfECEBgbvAtRcLyRo9+0qkAj7wHah2FToX9uTUvQJaEM
 PaGgDOf3B3F/2CxoaEsQPY4qWqle5Ekg/4zoPa2rdFt5XQ9Duex5B/4ecZT8KRJ7uRPN
 cU/WtId/RZyOW0tgg3qn+yGv2dUIGBDKk+10VHYraZ5RdWX6aF8YUB4k7cLZQUfKiBJ0
 gRX1Tjwh8pYWrCNRtNL+zqBN1uX8eT+ZWCM4LN08jNXnY2P9tFg20CR8hR9C9gS4anXh
 kYsHP927WPbEKJTRIKui6zkItHRTWCRtmi6SiYpH5b/VYmZvTLZrdlBffQCGNCvNEvXq
 3PmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rnP/gkcL5lHTpvD1psUDDCzdJhpjhd83ZXQCggS2n0o=;
 b=VtDP/RjT4rnDrEHjfa9u/NVyTxE5DPvp2hrfc/kWyUmcsC4weJNAnlEWgnrGSKgDeX
 SM0J8xrYXSwy6U+5x+JzfCRgoYtkZYRRIkYm15tGE9D4zGIwqTmhOsn8YiYy5+d2os4e
 PxBVVSsJ0DY40r+g9nLgnl2vzCX+6xO/UZmdMmecoUuoNuVTx48Y+kWqG6u1h2w/tzks
 Ky2l4Eqc5rsOBkSQdKUWxB1dndcvLP9o/p3DKdqpA82dLk+PlxrJ3gYrf02nQINexTsv
 d1cYo1FUrs3sDLQI3BnTZh/IjKeAmFgnKTKRSz8s6aTTDCaNSxJC/yVDefT9z09vALsS
 yktw==
X-Gm-Message-State: AOAM531lq13dOYlumEQjMzms9fRYdA9syMDn3HcB6plfjGk9+PrmcgUQ
 xM5VA1NQPHwEEv/KV2B7yyLn/4a5Jeo3xg==
X-Google-Smtp-Source: ABdhPJxEejnXRK8kJeqZkTymDjicJb1JnBke1f6bW2uDBbVFDcEppw+sLhQsbyffaEWfGz0JmPf1Vw==
X-Received: by 2002:a62:61c3:0:b029:35b:cb61:d2c3 with SMTP id
 v186-20020a6261c30000b029035bcb61d2c3mr18691483pfb.62.1627311408266; 
 Mon, 26 Jul 2021 07:56:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id m2sm22795561pja.52.2021.07.26.07.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:56:47 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/12] drm/msm: Consolidate submit bo state
Date: Mon, 26 Jul 2021 08:00:20 -0700
Message-Id: <20210726150038.2187631-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726150038.2187631-1-robdclark@gmail.com>
References: <20210726150038.2187631-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Move all the locked/active/pinned state handling to msm_gem_submit.c.
In particular, for drm/scheduler, we'll need to do all this before
pushing the submit job to the scheduler.  But while we're at it we can
get rid of the dupicate pin and refcnt.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.h        |  2 +
 drivers/gpu/drm/msm/msm_gem_submit.c | 92 ++++++++++++++++++++++------
 drivers/gpu/drm/msm/msm_gpu.c        | 29 +--------
 3 files changed, 75 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 71ccf87a646b..da3af702a6c8 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -361,6 +361,8 @@ static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
 	kref_put(&submit->ref, __msm_gem_submit_destroy);
 }
 
+void msm_submit_retire(struct msm_gem_submit *submit);
+
 /* helper to determine of a buffer in submit should be dumped, used for both
  * devcoredump and debugfs cmdstream dumping:
  */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 8abd743adfb0..4f02fa3c78f9 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -23,8 +23,8 @@
 
 /* make sure these don't conflict w/ MSM_SUBMIT_BO_x */
 #define BO_VALID    0x8000   /* is current addr in cmdstream correct/valid? */
-#define BO_LOCKED   0x4000
-#define BO_PINNED   0x2000
+#define BO_LOCKED   0x4000   /* obj lock is held */
+#define BO_PINNED   0x2000   /* obj is pinned and on active list */
 
 static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		struct msm_gpu *gpu,
@@ -220,21 +220,33 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 	return ret;
 }
 
-static void submit_unlock_unpin_bo(struct msm_gem_submit *submit,
-		int i, bool backoff)
+/* Unwind bo state, according to cleanup_flags.  In the success case, only
+ * the lock is dropped at the end of the submit (and active/pin ref is dropped
+ * later when the submit is retired).
+ */
+static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
+		unsigned cleanup_flags)
 {
-	struct msm_gem_object *msm_obj = submit->bos[i].obj;
+	struct drm_gem_object *obj = &submit->bos[i].obj->base;
+	unsigned flags = submit->bos[i].flags & cleanup_flags;
 
-	if (submit->bos[i].flags & BO_PINNED)
-		msm_gem_unpin_iova_locked(&msm_obj->base, submit->aspace);
+	if (flags & BO_PINNED) {
+		msm_gem_unpin_iova_locked(obj, submit->aspace);
+		msm_gem_active_put(obj);
+	}
 
-	if (submit->bos[i].flags & BO_LOCKED)
-		dma_resv_unlock(msm_obj->base.resv);
+	if (flags & BO_LOCKED)
+		dma_resv_unlock(obj->resv);
 
-	if (backoff && !(submit->bos[i].flags & BO_VALID))
-		submit->bos[i].iova = 0;
+	submit->bos[i].flags &= ~cleanup_flags;
+}
 
-	submit->bos[i].flags &= ~(BO_LOCKED | BO_PINNED);
+static void submit_unlock_unpin_bo(struct msm_gem_submit *submit, int i)
+{
+	submit_cleanup_bo(submit, i, BO_PINNED | BO_LOCKED);
+
+	if (!(submit->bos[i].flags & BO_VALID))
+		submit->bos[i].iova = 0;
 }
 
 /* This is where we make sure all the bo's are reserved and pin'd: */
@@ -266,10 +278,10 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 
 fail:
 	for (; i >= 0; i--)
-		submit_unlock_unpin_bo(submit, i, true);
+		submit_unlock_unpin_bo(submit, i);
 
 	if (slow_locked > 0)
-		submit_unlock_unpin_bo(submit, slow_locked, true);
+		submit_unlock_unpin_bo(submit, slow_locked);
 
 	if (ret == -EDEADLK) {
 		struct msm_gem_object *msm_obj = submit->bos[contended].obj;
@@ -325,16 +337,18 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 	submit->valid = true;
 
 	for (i = 0; i < submit->nr_bos; i++) {
-		struct msm_gem_object *msm_obj = submit->bos[i].obj;
+		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 		uint64_t iova;
 
 		/* if locking succeeded, pin bo: */
-		ret = msm_gem_get_and_pin_iova_locked(&msm_obj->base,
+		ret = msm_gem_get_and_pin_iova_locked(obj,
 				submit->aspace, &iova);
 
 		if (ret)
 			break;
 
+		msm_gem_active_get(obj, submit->gpu);
+
 		submit->bos[i].flags |= BO_PINNED;
 
 		if (iova == submit->bos[i].iova) {
@@ -350,6 +364,20 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 	return ret;
 }
 
+static void submit_attach_object_fences(struct msm_gem_submit *submit)
+{
+	int i;
+
+	for (i = 0; i < submit->nr_bos; i++) {
+		struct drm_gem_object *obj = &submit->bos[i].obj->base;
+
+		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
+			dma_resv_add_excl_fence(obj->resv, submit->fence);
+		else if (submit->bos[i].flags & MSM_SUBMIT_BO_READ)
+			dma_resv_add_shared_fence(obj->resv, submit->fence);
+	}
+}
+
 static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
 		struct msm_gem_object **obj, uint64_t *iova, bool *valid)
 {
@@ -444,18 +472,40 @@ static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_object *ob
 	return ret;
 }
 
-static void submit_cleanup(struct msm_gem_submit *submit)
+/* Cleanup submit at end of ioctl.  In the error case, this also drops
+ * references, unpins, and drops active refcnt.  In the non-error case,
+ * this is done when the submit is retired.
+ */
+static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 {
+	unsigned cleanup_flags = BO_LOCKED;
 	unsigned i;
 
+	if (error)
+		cleanup_flags |= BO_PINNED;
+
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct msm_gem_object *msm_obj = submit->bos[i].obj;
-		submit_unlock_unpin_bo(submit, i, false);
+		submit_cleanup_bo(submit, i, cleanup_flags);
 		list_del_init(&msm_obj->submit_entry);
-		drm_gem_object_put(&msm_obj->base);
+		if (error)
+			drm_gem_object_put(&msm_obj->base);
 	}
 }
 
+void msm_submit_retire(struct msm_gem_submit *submit)
+{
+	int i;
+
+	for (i = 0; i < submit->nr_bos; i++) {
+		struct drm_gem_object *obj = &submit->bos[i].obj->base;
+
+		msm_gem_lock(obj);
+		submit_cleanup_bo(submit, i, BO_PINNED);
+		msm_gem_unlock(obj);
+		drm_gem_object_put(obj);
+	}
+}
 
 struct msm_submit_post_dep {
 	struct drm_syncobj *syncobj;
@@ -832,6 +882,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		args->fence_fd = out_fence_fd;
 	}
 
+	submit_attach_object_fences(submit);
+
 	msm_gpu_submit(gpu, submit);
 
 	args->fence = submit->fence->seqno;
@@ -844,7 +896,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 out:
 	pm_runtime_put(&gpu->pdev->dev);
 out_pre_pm:
-	submit_cleanup(submit);
+	submit_cleanup(submit, !!ret);
 	if (has_ww_ticket)
 		ww_acquire_fini(&submit->ticket);
 	msm_gem_submit_put(submit);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index a0589666b1a3..5bfc4d24a956 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -647,7 +647,6 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 	volatile struct msm_gpu_submit_stats *stats;
 	u64 elapsed, clock = 0;
 	unsigned long flags;
-	int i;
 
 	stats = &ring->memptrs->stats[index];
 	/* Convert 19.2Mhz alwayson ticks to nanoseconds for elapsed time */
@@ -663,15 +662,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 	trace_msm_gpu_submit_retired(submit, elapsed, clock,
 		stats->alwayson_start, stats->alwayson_end);
 
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = &submit->bos[i].obj->base;
-
-		msm_gem_lock(obj);
-		msm_gem_active_put(obj);
-		msm_gem_unpin_iova_locked(obj, submit->aspace);
-		msm_gem_unlock(obj);
-		drm_gem_object_put(obj);
-	}
+	msm_submit_retire(submit);
 
 	pm_runtime_mark_last_busy(&gpu->pdev->dev);
 	pm_runtime_put_autosuspend(&gpu->pdev->dev);
@@ -748,7 +739,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned long flags;
-	int i;
 
 	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
 
@@ -762,23 +752,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	update_sw_cntrs(gpu);
 
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct msm_gem_object *msm_obj = submit->bos[i].obj;
-		struct drm_gem_object *drm_obj = &msm_obj->base;
-		uint64_t iova;
-
-		/* submit takes a reference to the bo and iova until retired: */
-		drm_gem_object_get(&msm_obj->base);
-		msm_gem_get_and_pin_iova_locked(&msm_obj->base, submit->aspace, &iova);
-
-		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
-			dma_resv_add_excl_fence(drm_obj->resv, submit->fence);
-		else if (submit->bos[i].flags & MSM_SUBMIT_BO_READ)
-			dma_resv_add_shared_fence(drm_obj->resv, submit->fence);
-
-		msm_gem_active_get(drm_obj, gpu);
-	}
-
 	/*
 	 * ring->submits holds a ref to the submit, to deal with the case
 	 * that a submit completes before msm_ioctl_gem_submit() returns.
-- 
2.31.1

