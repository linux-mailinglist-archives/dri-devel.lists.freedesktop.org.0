Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5A53CC623
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 22:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562F16EAD1;
	Sat, 17 Jul 2021 20:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4796EACF;
 Sat, 17 Jul 2021 20:25:39 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id a6so6968427pgw.3;
 Sat, 17 Jul 2021 13:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wiRodbDAvyp+PITk15CPXkHelQWBrQgQtG2wWNHtLRw=;
 b=Da81KF/GTkimKbJ4b2Ctqi0BiTD8UdkPi1ijshTyvqbLK+T3B4WdePnypLWw8srkRd
 4O1jieksQPnqapUF3srH3Do0iPMy7vmi9NzccAS22AzS1eRX74bz73yTRa6hVbp+U7Y9
 HYBgYndfM9X4+vhQVuFizwXZCOn+E06g/lgQusexIGnBrSBZXG5/NcBHUMSZqfeWx949
 Ku/OCGJVc95Il14TJL0BUKWopSmLOMqPCHoFqOg6aqKklCbBa5/sNI9I8D0XzW3nKC2o
 Y4uPgP0aVPwsdyrhTxwoZK8Y/qTO72Xd9VnowuXIZQqmOcbSCnp9IlPoQYznq0QcA8kb
 UzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wiRodbDAvyp+PITk15CPXkHelQWBrQgQtG2wWNHtLRw=;
 b=SjGxFqlLygIcEC+vRVItfT1dzsBLj/OFssNzDI6EnTg5XQpe+hmgf7yurMAbH9Rvek
 qPiLPTpwnTAgAGEoLXq6qjKqHOG6P0k9EnJD5LO7wEI7ACHzO4WpYQUX0XUluRozmQBZ
 LR0okU8HaOG4y/cJhHa3TO1cP4sp8d0/SMmSs24WJrI/94lBaMn9oYPABVgLHtGKcRJv
 7z0rkrUMmMqaYm48mTfQ4wjDq6ox/xDQ8qqxu3bDd0GtV6GKy63MOy5o6c3gVdbi6atg
 Ea0ML2HrPQ+GlQ1RO/vCvy1v/o8EZXWBci3uzH0+tNREnJm9aDKFJVu/m2edT46iH5IB
 5MWg==
X-Gm-Message-State: AOAM533oWNo4GqoAo1IjIXLZ94crmxiUQdjvZ0CRsoxAxCUuXBe4w/qI
 2DVOR0ZVGONz9S5MkWHk1An1yPfzRzTebg==
X-Google-Smtp-Source: ABdhPJxWeuhaVAqblgafdoMGMjbx31tcXDmqexDQeBdgBxtE+uYKbFn4fuf2D8QLZIFNWCxEY9ehCg==
X-Received: by 2002:a63:5446:: with SMTP id e6mr16548323pgm.73.1626553538561; 
 Sat, 17 Jul 2021 13:25:38 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 n4sm14668481pff.51.2021.07.17.13.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 13:25:37 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/11] drm/msm: Consolidate submit bo state
Date: Sat, 17 Jul 2021 13:29:08 -0700
Message-Id: <20210717202924.987514-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210717202924.987514-1-robdclark@gmail.com>
References: <20210717202924.987514-1-robdclark@gmail.com>
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
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Move all the locked/active/pinned state handling to msm_gem_submit.c.
In particular, for drm/scheduler, we'll need to do all this before
pushing the submit job to the scheduler.  But while we're at it we can
get rid of the dupicate pin and refcnt.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h        |  2 +
 drivers/gpu/drm/msm/msm_gem_submit.c | 92 ++++++++++++++++++++++------
 drivers/gpu/drm/msm/msm_gpu.c        | 42 +------------
 3 files changed, 75 insertions(+), 61 deletions(-)

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
index ea4b27916a15..fef5ba51f425 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -765,7 +765,6 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 	int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
 	volatile struct msm_gpu_submit_stats *stats;
 	u64 elapsed, clock = 0;
-	int i;
 
 	stats = &ring->memptrs->stats[index];
 	/* Convert 19.2Mhz alwayson ticks to nanoseconds for elapsed time */
@@ -781,15 +780,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
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
@@ -855,7 +846,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct drm_device *dev = gpu->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_ringbuffer *ring = submit->ring;
-	int i;
 
 	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
 
@@ -869,36 +859,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	update_sw_cntrs(gpu);
 
-	/*
-	 * Move everything to active list before pinning, so that pinning
-	 * does not trigger evicting anything else we need in same submit
-	 */
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = &submit->bos[i].obj->base;
-
-		/* submit takes a reference to the bo and iova until retired: */
-		drm_gem_object_get(obj);
-
-		msm_gem_active_get(obj, gpu);
-
-		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
-			dma_resv_add_excl_fence(obj->resv, submit->fence);
-		else if (submit->bos[i].flags & MSM_SUBMIT_BO_READ)
-			dma_resv_add_shared_fence(obj->resv, submit->fence);
-	}
-
-	/* Once we've made all the bo's we'll need active, then pin them: */
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = &submit->bos[i].obj->base;
-		uint64_t iova;
-		int ret;
-
-		ret = msm_gem_get_and_pin_iova_locked(obj, submit->aspace, &iova);
-		if (WARN_ON(ret)) {
-			pr_err("ret=%d\n", ret);
-		}
-	}
-
 	/*
 	 * ring->submits holds a ref to the submit, to deal with the case
 	 * that a submit completes before msm_ioctl_gem_submit() returns.
-- 
2.31.1

