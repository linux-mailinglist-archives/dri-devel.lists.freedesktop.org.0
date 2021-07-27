Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC91B3D8107
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 23:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77256E9AD;
	Tue, 27 Jul 2021 21:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087886E8F5;
 Tue, 27 Jul 2021 21:13:22 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 a4-20020a17090aa504b0290176a0d2b67aso6713017pjq.2; 
 Tue, 27 Jul 2021 14:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6mvxUJ87sudxyMnXk+SNmSJl9hv8ghFMGniXKOiMPtw=;
 b=tG9WekqbBueWHLkIaofNI4gJul/Ff/LZEIIRon+7eeHH7dxCEXnE8PCmGkTPgTCzVo
 XtQvndCanVJ0+n1YwrTx2ZRjAXOFT6z0wzixrW5wRmIUVAyndD7jC7gv0zyafFFoB3f6
 BtcEZi5j8k2gPE6CGhMf7uHVd6x9baVvFrUpPUTNQkqIioU8QDm4bo4tRogTUtUxw2iQ
 ZvIgK8fHCbW0kyBozaOHpnklgpB85APCVzst8/8oxtV01jhc7V0EXaXh20jj6B+9cRYp
 OR4uI+ZdkJvEm9o2vAoD9K3UKsdCr5PmDzBrIfrlw/OFD+civsEkBq6PL3te8JUfpOX+
 WgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6mvxUJ87sudxyMnXk+SNmSJl9hv8ghFMGniXKOiMPtw=;
 b=V6qgyjtoy4wnZ124caHlNqVepoEIEjyRFv66n8H3r/bleQMdxip5KM6CkqbORA+qzs
 Xc1U2g7SjWAJC4w+p3sn4f0/h7JH+xUONFOUXL2RCa+e5+gZLDiRTNOTSzWU/VyGzaAB
 zrz93QedHiroHu7o7bfLRrLzN4Kkd8q+gi8OOuZm6+Fqda/Xk000aEVdDdODQgTN+8UM
 XJQlhVnuZVBfGl5gcb061Ww8X6sOeFvEAWKAyS+Tv/02DhHzbJXkseojlZzDIo8Al1FU
 KjcnJ5Fl+DM4DbPNkON/4gqkMCVEDsZcpwYSfR9VRNo+VZ3TjwVLNyc7LcPZEgICQG9p
 Ujfg==
X-Gm-Message-State: AOAM5329PN7AS8GDp+x6o7Yu4JuD0mx2VRYPDB9nKSinFVY1K2oQHOJf
 qLP2FC1wVkw+lWa6TjTy1RgPGkkHQx9Cdw==
X-Google-Smtp-Source: ABdhPJwlu23/8UGfbxmy7j094ac+mE1XH3PWlXuLAcE1QcDyqPajFuwNr8Z0PkkfDL+6yOJEOJ+Y0g==
X-Received: by 2002:a17:90a:e558:: with SMTP id
 ei24mr10926413pjb.97.1627420400775; 
 Tue, 27 Jul 2021 14:13:20 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 143sm4922203pfz.13.2021.07.27.14.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 14:13:19 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 5/4] drm/msm: Add deadline based boost support
Date: Tue, 27 Jul 2021 14:17:33 -0700
Message-Id: <20210727211733.2601469-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726233854.2453899-1-robdclark@gmail.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, Rob Clark <robdclark@chromium.org>,
 David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
This is a quick implementation of what I had in mind for driver side
of deadline boost.  For a couple games with bad gpu devfreq behavior
this boosts "Render quality" from ~35% to ~95%.  (The "Render quality"
metric in chrome://arc-overview-tracing is basically a measure of the
deviation in frame/commit time, so 100% would be a consistent fps
with no variantion.)  Not quite 100%, this is still a bit of a re-
active mechanism.

A similar result can be had by tuning devfreq to boost to max OPP at
a much lower threshold of busyness.  With the obvious downside that
you spend a lot of time running the GPU much faster than needed.

 drivers/gpu/drm/msm/msm_fence.c       | 76 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_fence.h       | 20 +++++++
 drivers/gpu/drm/msm/msm_gpu.h         |  1 +
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 20 +++++++
 4 files changed, 117 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index f2cece542c3f..67c2a96e1c85 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -8,6 +8,37 @@
 
 #include "msm_drv.h"
 #include "msm_fence.h"
+#include "msm_gpu.h"
+
+static inline bool fence_completed(struct msm_fence_context *fctx, uint32_t fence);
+
+static struct msm_gpu *fctx2gpu(struct msm_fence_context *fctx)
+{
+	struct msm_drm_private *priv = fctx->dev->dev_private;
+	return priv->gpu;
+}
+
+static enum hrtimer_restart deadline_timer(struct hrtimer *t)
+{
+	struct msm_fence_context *fctx = container_of(t,
+			struct msm_fence_context, deadline_timer);
+
+	kthread_queue_work(fctx2gpu(fctx)->worker, &fctx->deadline_work);
+
+	return HRTIMER_NORESTART;
+}
+
+static void deadline_work(struct kthread_work *work)
+{
+	struct msm_fence_context *fctx = container_of(work,
+			struct msm_fence_context, deadline_work);
+
+	/* If deadline fence has already passed, nothing to do: */
+	if (fence_completed(fctx, fctx->next_deadline_fence))
+		return;
+
+	msm_devfreq_boost(fctx2gpu(fctx), 2);
+}
 
 
 struct msm_fence_context *
@@ -26,6 +57,13 @@ msm_fence_context_alloc(struct drm_device *dev, volatile uint32_t *fenceptr,
 	fctx->fenceptr = fenceptr;
 	spin_lock_init(&fctx->spinlock);
 
+	hrtimer_init(&fctx->deadline_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
+	fctx->deadline_timer.function = deadline_timer;
+
+	kthread_init_work(&fctx->deadline_work, deadline_work);
+
+	fctx->next_deadline = ktime_get();
+
 	return fctx;
 }
 
@@ -49,6 +87,8 @@ void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
 {
 	spin_lock(&fctx->spinlock);
 	fctx->completed_fence = max(fence, fctx->completed_fence);
+	if (fence_completed(fctx, fctx->next_deadline_fence))
+		hrtimer_cancel(&fctx->deadline_timer);
 	spin_unlock(&fctx->spinlock);
 }
 
@@ -79,10 +119,46 @@ static bool msm_fence_signaled(struct dma_fence *fence)
 	return fence_completed(f->fctx, f->base.seqno);
 }
 
+static void msm_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
+{
+	struct msm_fence *f = to_msm_fence(fence);
+	struct msm_fence_context *fctx = f->fctx;
+	unsigned long flags;
+	ktime_t now;
+
+	spin_lock_irqsave(&fctx->spinlock, flags);
+	now = ktime_get();
+
+	if (ktime_after(now, fctx->next_deadline) ||
+			ktime_before(deadline, fctx->next_deadline)) {
+		fctx->next_deadline = deadline;
+		fctx->next_deadline_fence =
+			max(fctx->next_deadline_fence, (uint32_t)fence->seqno);
+
+		/*
+		 * Set timer to trigger boost 3ms before deadline, or
+		 * if we are already less than 3ms before the deadline
+		 * schedule boost work immediately.
+		 */
+		deadline = ktime_sub(deadline, ms_to_ktime(3));
+
+		if (ktime_after(now, deadline)) {
+			kthread_queue_work(fctx2gpu(fctx)->worker,
+					&fctx->deadline_work);
+		} else {
+			hrtimer_start(&fctx->deadline_timer, deadline,
+					HRTIMER_MODE_ABS);
+		}
+	}
+
+	spin_unlock_irqrestore(&fctx->spinlock, flags);
+}
+
 static const struct dma_fence_ops msm_fence_ops = {
 	.get_driver_name = msm_fence_get_driver_name,
 	.get_timeline_name = msm_fence_get_timeline_name,
 	.signaled = msm_fence_signaled,
+	.set_deadline = msm_fence_set_deadline,
 };
 
 struct dma_fence *
diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
index 4783db528bcc..d34e853c555a 100644
--- a/drivers/gpu/drm/msm/msm_fence.h
+++ b/drivers/gpu/drm/msm/msm_fence.h
@@ -50,6 +50,26 @@ struct msm_fence_context {
 	volatile uint32_t *fenceptr;
 
 	spinlock_t spinlock;
+
+	/*
+	 * TODO this doesn't really deal with multiple deadlines, like
+	 * if userspace got multiple frames ahead.. OTOH atomic updates
+	 * don't queue, so maybe that is ok
+	 */
+
+	/** next_deadline: Time of next deadline */
+	ktime_t next_deadline;
+
+	/**
+	 * next_deadline_fence:
+	 *
+	 * Fence value for next pending deadline.  The deadline timer is
+	 * canceled when this fence is signaled.
+	 */
+	uint32_t next_deadline_fence;
+
+	struct hrtimer deadline_timer;
+	struct kthread_work deadline_work;
 };
 
 struct msm_fence_context * msm_fence_context_alloc(struct drm_device *dev,
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 0e4b45bff2e6..e031c9b495ed 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -425,6 +425,7 @@ void msm_devfreq_init(struct msm_gpu *gpu);
 void msm_devfreq_cleanup(struct msm_gpu *gpu);
 void msm_devfreq_resume(struct msm_gpu *gpu);
 void msm_devfreq_suspend(struct msm_gpu *gpu);
+void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor);
 void msm_devfreq_active(struct msm_gpu *gpu);
 void msm_devfreq_idle(struct msm_gpu *gpu);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 0a1ee20296a2..8a8d7b9028a3 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -144,6 +144,26 @@ void msm_devfreq_suspend(struct msm_gpu *gpu)
 	devfreq_suspend_device(gpu->devfreq.devfreq);
 }
 
+void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
+{
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+	unsigned long freq;
+
+	/*
+	 * Hold devfreq lock to synchronize with get_dev_status()/
+	 * target() callbacks
+	 */
+	mutex_lock(&df->devfreq->lock);
+
+	freq = get_freq(gpu);
+
+	freq *= factor;
+
+	msm_devfreq_target(&gpu->pdev->dev, &freq, 0);
+
+	mutex_unlock(&df->devfreq->lock);
+}
+
 void msm_devfreq_active(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
-- 
2.31.1

