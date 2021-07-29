Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 853003D9DFA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 09:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6356EC9E;
	Thu, 29 Jul 2021 07:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7916EC95
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 07:03:33 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id c16so5505357wrp.13
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 00:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=P06/wDjljvLTcx1hkh+6VSS2u+Qmgh2zG3JkU3VuM3o=;
 b=RQlG2JN2cixyCnENA0RNSrhMF+N5O9W9x1kHPTFY/RHoYEXNN4qcQSw7nYwcvR8kJH
 zFqwmZR0E2spuWiJcbHYqUSjbCCFshI2AkCDXBFRSd+dBNZozzz3YLuZJROc43GtdjN6
 DRv1PmZN7YekdgNANrRoygvu6Snqjv6pn/9DLeZoaXW19vsRckJc071Y4S/a6kB9gpdW
 /yA+Dssr/hLwK91M78dfEQ2L+w2YkGmBVnsIu/47zc1eH3XYsQbUS1UYMjHmG6dC5L3b
 U7IsGT0LPwaVc3YFEJarvzUkkDSlGf98IreaxB5Zy3i+Ga5vmEE+vWwlyTqHBhE2bmSp
 pDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P06/wDjljvLTcx1hkh+6VSS2u+Qmgh2zG3JkU3VuM3o=;
 b=EueJ/JE81Ubz715veBdeE83guJVC1hMD0Mmrea0VjU5Qc932XPRbxUyPNq2oNx0D9d
 hkV5Z+3o2MS+AvaeQLCW31+RqajLOTFX/MmrCm4yZ2Qie81WV2FbrRTxLx4M5AJAWMGu
 t4fiasLaFty0gqOvuhUC/dbjEOsnqeefX6FbhQ89ZjT6YTnL4TgN7n/8kkAVLMVm6dz5
 cBvLGRPpi3evXpJw0MvX3JRNyw7+wfRHDBO2obctL6qj4VW51EGC4Wjboo5MadDdDO1V
 iNiQ+hVkS9OJI+9Fd1l3GjGV2yI9wcqruOoYW/H09OXtY70el5yENqrBcjxc8AEIyhnM
 vybg==
X-Gm-Message-State: AOAM5321NrRymNho2f7CXZs/R4FeMrIhnElbrTaWHVSwjF4sDXnlTbMZ
 FKKdVqukl7PsB9/Qgkph/GA=
X-Google-Smtp-Source: ABdhPJyy86twjvGmaQ0gMV2Px9gb/rPdfWDy5OE0mP1Q/unWj8BME/5PlqbCHnlb6m4njsx3qREmYw==
X-Received: by 2002:adf:ebc5:: with SMTP id v5mr3130106wrn.269.1627542212459; 
 Thu, 29 Jul 2021 00:03:32 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4e80:335d:252f:540b])
 by smtp.gmail.com with ESMTPSA id h14sm2177527wrp.55.2021.07.29.00.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 00:03:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, gustavo@padovan.org, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/3] dma-buf: nuke DMA_FENCE_TRACE macros
Date: Thu, 29 Jul 2021 09:03:29 +0200
Message-Id: <20210729070330.41443-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729070330.41443-1-christian.koenig@amd.com>
References: <20210729070330.41443-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only the DRM GPU scheduler, radeon and amdgpu where using them and they depend
on a non existing config option to actually emit some code.

Nuke them and clean up the dma_fence_signal* return value.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c               | 44 +++++------------------
 drivers/dma-buf/st-dma-fence.c            | 12 ++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 10 +-----
 drivers/gpu/drm/radeon/radeon_fence.c     | 24 +++----------
 drivers/gpu/drm/scheduler/sched_fence.c   | 18 ++--------
 include/linux/dma-fence.h                 | 32 +++--------------
 6 files changed, 23 insertions(+), 117 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index ce0f5eff575d..21cba0f74e69 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -350,12 +350,9 @@ void __dma_fence_might_wait(void)
  *
  * Unlike dma_fence_signal_timestamp(), this function must be called with
  * &dma_fence.lock held.
- *
- * Returns 0 on success and a negative error value when @fence has been
- * signalled already.
  */
-int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
-				      ktime_t timestamp)
+void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
+				       ktime_t timestamp)
 {
 	struct dma_fence_cb *cur, *tmp;
 	struct list_head cb_list;
@@ -364,7 +361,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 
 	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
 				      &fence->flags)))
-		return -EINVAL;
+		return;
 
 	/* Stash the cb_list before replacing it with the timestamp */
 	list_replace(&fence->cb_list, &cb_list);
@@ -377,8 +374,6 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 		INIT_LIST_HEAD(&cur->node);
 		cur->func(fence, cur);
 	}
-
-	return 0;
 }
 EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
 
@@ -393,23 +388,14 @@ EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
  * can only go from the unsignaled to the signaled state and not back, it will
  * only be effective the first time. Set the timestamp provided as the fence
  * signal timestamp.
- *
- * Returns 0 on success and a negative error value when @fence has been
- * signalled already.
  */
-int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp)
+void dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp)
 {
 	unsigned long flags;
-	int ret;
-
-	if (!fence)
-		return -EINVAL;
 
 	spin_lock_irqsave(fence->lock, flags);
-	ret = dma_fence_signal_timestamp_locked(fence, timestamp);
+	dma_fence_signal_timestamp_locked(fence, timestamp);
 	spin_unlock_irqrestore(fence->lock, flags);
-
-	return ret;
 }
 EXPORT_SYMBOL(dma_fence_signal_timestamp);
 
@@ -425,13 +411,10 @@ EXPORT_SYMBOL(dma_fence_signal_timestamp);
  *
  * Unlike dma_fence_signal(), this function must be called with &dma_fence.lock
  * held.
- *
- * Returns 0 on success and a negative error value when @fence has been
- * signalled already.
  */
-int dma_fence_signal_locked(struct dma_fence *fence)
+void dma_fence_signal_locked(struct dma_fence *fence)
 {
-	return dma_fence_signal_timestamp_locked(fence, ktime_get());
+	dma_fence_signal_timestamp_locked(fence, ktime_get());
 }
 EXPORT_SYMBOL(dma_fence_signal_locked);
 
@@ -444,28 +427,19 @@ EXPORT_SYMBOL(dma_fence_signal_locked);
  * dma_fence_add_callback(). Can be called multiple times, but since a fence
  * can only go from the unsignaled to the signaled state and not back, it will
  * only be effective the first time.
- *
- * Returns 0 on success and a negative error value when @fence has been
- * signalled already.
  */
-int dma_fence_signal(struct dma_fence *fence)
+void dma_fence_signal(struct dma_fence *fence)
 {
 	unsigned long flags;
-	int ret;
 	bool tmp;
 
-	if (!fence)
-		return -EINVAL;
-
 	tmp = dma_fence_begin_signalling();
 
 	spin_lock_irqsave(fence->lock, flags);
-	ret = dma_fence_signal_timestamp_locked(fence, ktime_get());
+	dma_fence_signal_timestamp_locked(fence, ktime_get());
 	spin_unlock_irqrestore(fence->lock, flags);
 
 	dma_fence_end_signalling(tmp);
-
-	return ret;
 }
 EXPORT_SYMBOL(dma_fence_signal);
 
diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index c8a12d7ad71a..e89001d8873f 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -122,21 +122,13 @@ static int test_signaling(void *arg)
 		goto err_free;
 	}
 
-	if (dma_fence_signal(f)) {
-		pr_err("Fence reported being already signaled\n");
-		goto err_free;
-	}
-
+	dma_fence_signal(f);
 	if (!dma_fence_is_signaled(f)) {
 		pr_err("Fence not reporting signaled\n");
 		goto err_free;
 	}
 
-	if (!dma_fence_signal(f)) {
-		pr_err("Fence reported not being already signaled\n");
-		goto err_free;
-	}
-
+	dma_fence_signal(f);
 	err = 0;
 err_free:
 	dma_fence_put(f);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index d4547d195173..397872779c31 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -246,7 +246,6 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
 	struct amdgpu_fence_driver *drv = &ring->fence_drv;
 	struct amdgpu_device *adev = ring->adev;
 	uint32_t seq, last_seq;
-	int r;
 
 	do {
 		last_seq = atomic_read(&ring->fence_drv.last_seq);
@@ -278,12 +277,7 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
 		if (!fence)
 			continue;
 
-		r = dma_fence_signal(fence);
-		if (!r)
-			DMA_FENCE_TRACE(fence, "signaled from irq context\n");
-		else
-			BUG();
-
+		dma_fence_signal(fence);
 		dma_fence_put(fence);
 		pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
@@ -673,8 +667,6 @@ static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
 	if (!timer_pending(&ring->fence_drv.fallback_timer))
 		amdgpu_fence_schedule_fallback(ring);
 
-	DMA_FENCE_TRACE(&fence->base, "armed on ring %i!\n", ring->idx);
-
 	return true;
 }
 
diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
index 18f2c2e0dfb3..3f351d222cbb 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -176,18 +176,11 @@ static int radeon_fence_check_signaled(wait_queue_entry_t *wait, unsigned mode,
 	 */
 	seq = atomic64_read(&fence->rdev->fence_drv[fence->ring].last_seq);
 	if (seq >= fence->seq) {
-		int ret = dma_fence_signal_locked(&fence->base);
-
-		if (!ret)
-			DMA_FENCE_TRACE(&fence->base, "signaled from irq context\n");
-		else
-			DMA_FENCE_TRACE(&fence->base, "was already signaled\n");
-
+		dma_fence_signal_locked(&fence->base);
 		radeon_irq_kms_sw_irq_put(fence->rdev, fence->ring);
 		__remove_wait_queue(&fence->rdev->fence_queue, &fence->fence_wake);
 		dma_fence_put(&fence->base);
-	} else
-		DMA_FENCE_TRACE(&fence->base, "pending\n");
+	}
 	return 0;
 }
 
@@ -422,8 +415,6 @@ static bool radeon_fence_enable_signaling(struct dma_fence *f)
 	fence->fence_wake.func = radeon_fence_check_signaled;
 	__add_wait_queue(&rdev->fence_queue, &fence->fence_wake);
 	dma_fence_get(f);
-
-	DMA_FENCE_TRACE(&fence->base, "armed on ring %i!\n", fence->ring);
 	return true;
 }
 
@@ -441,11 +432,7 @@ bool radeon_fence_signaled(struct radeon_fence *fence)
 		return true;
 
 	if (radeon_fence_seq_signaled(fence->rdev, fence->seq, fence->ring)) {
-		int ret;
-
-		ret = dma_fence_signal(&fence->base);
-		if (!ret)
-			DMA_FENCE_TRACE(&fence->base, "signaled from radeon_fence_signaled\n");
+		dma_fence_signal(&fence->base);
 		return true;
 	}
 	return false;
@@ -550,7 +537,6 @@ long radeon_fence_wait_timeout(struct radeon_fence *fence, bool intr, long timeo
 {
 	uint64_t seq[RADEON_NUM_RINGS] = {};
 	long r;
-	int r_sig;
 
 	/*
 	 * This function should not be called on !radeon fences.
@@ -567,9 +553,7 @@ long radeon_fence_wait_timeout(struct radeon_fence *fence, bool intr, long timeo
 		return r;
 	}
 
-	r_sig = dma_fence_signal(&fence->base);
-	if (!r_sig)
-		DMA_FENCE_TRACE(&fence->base, "signaled from fence_wait\n");
+	dma_fence_signal(&fence->base);
 	return r;
 }
 
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 69de2c76731f..3736746c47bd 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -50,26 +50,12 @@ static void __exit drm_sched_fence_slab_fini(void)
 
 void drm_sched_fence_scheduled(struct drm_sched_fence *fence)
 {
-	int ret = dma_fence_signal(&fence->scheduled);
-
-	if (!ret)
-		DMA_FENCE_TRACE(&fence->scheduled,
-				"signaled from irq context\n");
-	else
-		DMA_FENCE_TRACE(&fence->scheduled,
-				"was already signaled\n");
+	dma_fence_signal(&fence->scheduled);
 }
 
 void drm_sched_fence_finished(struct drm_sched_fence *fence)
 {
-	int ret = dma_fence_signal(&fence->finished);
-
-	if (!ret)
-		DMA_FENCE_TRACE(&fence->finished,
-				"signaled from irq context\n");
-	else
-		DMA_FENCE_TRACE(&fence->finished,
-				"was already signaled\n");
+	dma_fence_signal(&fence->finished);
 }
 
 static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 6ffb4b2c6371..027db23fd4e3 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -370,11 +370,11 @@ static inline void dma_fence_end_signalling(bool cookie) {}
 static inline void __dma_fence_might_wait(void) {}
 #endif
 
-int dma_fence_signal(struct dma_fence *fence);
-int dma_fence_signal_locked(struct dma_fence *fence);
-int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
-int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
-				      ktime_t timestamp);
+void dma_fence_signal(struct dma_fence *fence);
+void dma_fence_signal_locked(struct dma_fence *fence);
+void dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
+void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
+				       ktime_t timestamp);
 signed long dma_fence_default_wait(struct dma_fence *fence,
 				   bool intr, signed long timeout);
 int dma_fence_add_callback(struct dma_fence *fence,
@@ -590,26 +590,4 @@ struct dma_fence *dma_fence_get_stub(void);
 struct dma_fence *dma_fence_allocate_private_stub(void);
 u64 dma_fence_context_alloc(unsigned num);
 
-#define DMA_FENCE_TRACE(f, fmt, args...) \
-	do {								\
-		struct dma_fence *__ff = (f);				\
-		if (IS_ENABLED(CONFIG_DMA_FENCE_TRACE))			\
-			pr_info("f %llu#%llu: " fmt,			\
-				__ff->context, __ff->seqno, ##args);	\
-	} while (0)
-
-#define DMA_FENCE_WARN(f, fmt, args...) \
-	do {								\
-		struct dma_fence *__ff = (f);				\
-		pr_warn("f %llu#%llu: " fmt, __ff->context, __ff->seqno,\
-			 ##args);					\
-	} while (0)
-
-#define DMA_FENCE_ERR(f, fmt, args...) \
-	do {								\
-		struct dma_fence *__ff = (f);				\
-		pr_err("f %llu#%llu: " fmt, __ff->context, __ff->seqno,	\
-			##args);					\
-	} while (0)
-
 #endif /* __LINUX_DMA_FENCE_H */
-- 
2.25.1

