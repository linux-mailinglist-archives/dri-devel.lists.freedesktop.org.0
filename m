Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426A83E36C4
	for <lists+dri-devel@lfdr.de>; Sat,  7 Aug 2021 20:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF8F89D8D;
	Sat,  7 Aug 2021 18:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8DD89D79;
 Sat,  7 Aug 2021 18:34:09 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 u5-20020a17090ae005b029017842fe8f82so13853633pjy.0; 
 Sat, 07 Aug 2021 11:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TpkeEXQhr2S4UyzNS56PH0wCmoq9BqqIoAycaUiRzLM=;
 b=nFd2fMokbd9p8iargG783kX4Fdc3opawLge05yqsJpyytoPGioS0VfKBIFUNIFUeIo
 WStvgIrCiYyjVS9upn2DrL6/K/QNRk6uEt8NB01Zm9wfAPOo9PBOsl9sWzQLF25oAnO1
 oi7GnTO50PD9RuVShI0ki9jrmq8EITBAzoS2zdNMAdVUuVnF28gsXy7H9fr1gT+1apsh
 Ttd/q/LV/WvOwcGVpuhM3L9+tVAulDlvs2swV6Iiv/IF+a9psWaJqOtEN2p8mJz3CaVX
 2f8HnU8s6LpkWGElM4R+3LWsKbofjPxrN+aymAWTCdpcIcSWney0k1oZRlMXna/efwuG
 5mUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TpkeEXQhr2S4UyzNS56PH0wCmoq9BqqIoAycaUiRzLM=;
 b=WjTOnZcmWPTBRDpMtKwEUwoyevVKOoFly/mVcMsp511SiiqHN5omfbZaNIffCH+cb1
 2kVO3QVlm/T3B6qTVqUIwkcUN3/sTOoS66dZnKF0RfIViUuB/q/23R2r7Qng10Gd/NVD
 luU0VTowhnjSnSwO+SUfyNbM8FHmnLHrPWEWyF8VF+WWrlKu+mkvEXQFu2l0IjkBk37R
 jpXHEGJf2spznQaNikq4s6kKjYrKraBjR/Tn1CSQlH+CSCAXSUIMakBIfhyxm0znGV+B
 JI8fxd+adGJyDdMFPILbi5hf0OHyyUikJ0cOpAiuruYrcg1yWnHCxCyIWgPiPZCOfkW2
 2AOg==
X-Gm-Message-State: AOAM531iVZhLvXgcWmBUvhXgThWTrkTkkznZLEtXjVj+FgL9iw6poXg+
 t/0D3NGOg7LaCfUPs/ooGIixBFuwZn1HUN6f
X-Google-Smtp-Source: ABdhPJzjHivm8ber6DP/cVUoRocOtcfm9KvbegEB9TbzOSCadQ7LKvQ0AnbAod1Q5gfjWKITUqSVfQ==
X-Received: by 2002:a63:d456:: with SMTP id i22mr454262pgj.421.1628361248105; 
 Sat, 07 Aug 2021 11:34:08 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 q18sm15307838pfj.178.2021.08.07.11.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 11:34:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK)
Subject: [PATCH v2 5/5] drm/msm: Add deadline based boost support
Date: Sat,  7 Aug 2021 11:37:59 -0700
Message-Id: <20210807183804.459850-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210807183804.459850-1-robdclark@gmail.com>
References: <20210807183804.459850-1-robdclark@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
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

