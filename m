Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3FE29303C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 23:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57EC6EABF;
	Mon, 19 Oct 2020 21:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D47A6EABF;
 Mon, 19 Oct 2020 21:09:39 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id b6so456565pju.1;
 Mon, 19 Oct 2020 14:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SE1E80KDOW1ueHqssI1/+p3sucJTyxDENWiwQHPE6Hk=;
 b=Bf2IlLjtw3jkiYaPlKL/KUIpTKDxqtoTrYyZePoq1NwV2Jv8ND2x+DK8gKtNifN6Sq
 AIpXK3ZYy4uGkxclxh1RVEFiCL+jPHQUCx6MQCXELxPPp/jT/NwAl1hw27GAGZti1rwZ
 4RWD8ImJo23JzcJ9QY/4QIKNR6B8oeAx12eV15vY9kX6V7t5Rvk6ykF37xO0+fhy5iJ2
 aofZza45YBVHGfTmT16ttDAE9Vs8Jd/GRdEC5qIG0BofZ9aSAdiUu64SfRaxU/l8zRmV
 20+0NurvIFRod4EZldG8vRUOCdeVFw/csMiZQFGrgBne9vtV/qF0tsTWWgRus8K7mGCS
 sjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SE1E80KDOW1ueHqssI1/+p3sucJTyxDENWiwQHPE6Hk=;
 b=pNbLgJv4Fm/fmHTk8XaOuSyjqG0Y4GRlVVoMaIAKniFGaGRYvLTz2u3i3J1Rs4cIL5
 J8yOPsbZGwOuHDCe3NgyUbQyL2tk1sCHWaXw9Y0uJatnN2q+2mM8981F2AwnemJmsKS8
 bNgeiM3ixbjNRVqaKNexOsJIlyKKkMZ5PBw5IGoP/3enpE1vQBh/QKsNnqh3g8bRO4zZ
 7Hxxz4cULJNBuGjhvEo+QYbjyHsrkLr6BzGKC78Mp8LrclRGLNPsE+A4MB5OUEMM8fWd
 46CDZi1vd5c9LAA4gMs5DUlF4v0He3s6bzb1XKDVwRyp6ifEZs9E1ubYl1+Zh550bCAv
 YJyQ==
X-Gm-Message-State: AOAM530RLd5HBD5lwhNpMzMipq1f7O20sAHnRheyayU+BuJz+/6hHfhY
 b35tG4+STA6K4djUCMy2nAAfGgIAXUD/Tw==
X-Google-Smtp-Source: ABdhPJxdphKEP7nCIqYVZV6d8xdLvP4zsruaGGmZkQeFeVDq0NSqATnDdZD1fail7lPhgRAvr64ZXg==
X-Received: by 2002:a17:902:7606:b029:d3:d2dd:2b3b with SMTP id
 k6-20020a1709027606b02900d3d2dd2b3bmr1743316pll.67.1603141777912; 
 Mon, 19 Oct 2020 14:09:37 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 198sm687463pfx.26.2020.10.19.14.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 14:09:37 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/msm/gpu: Convert retire/recover work to kthread_worker
Date: Mon, 19 Oct 2020 14:10:51 -0700
Message-Id: <20201019211101.143327-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019211101.143327-1-robdclark@gmail.com>
References: <20201019211101.143327-1-robdclark@gmail.com>
MIME-Version: 1.0
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
 <freedreno@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  3 +--
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c |  6 ++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  4 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 +--
 drivers/gpu/drm/msm/msm_gpu.c             | 30 +++++++++++++++--------
 drivers/gpu/drm/msm/msm_gpu.h             | 13 +++++++---
 6 files changed, 34 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 2befaf304f04..b0005ccd81c6 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1056,7 +1056,6 @@ static void a5xx_gpmu_err_irq(struct msm_gpu *gpu)
 static void a5xx_fault_detect_irq(struct msm_gpu *gpu)
 {
 	struct drm_device *dev = gpu->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
 
 	DRM_DEV_ERROR(dev->dev, "gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
@@ -1072,7 +1071,7 @@ static void a5xx_fault_detect_irq(struct msm_gpu *gpu)
 	/* Turn off the hangcheck timer to keep it from bothering us */
 	del_timer(&gpu->hangcheck_timer);
 
-	queue_work(priv->wq, &gpu->recover_work);
+	kthread_queue_work(gpu->worker, &gpu->recover_work);
 }
 
 #define RBBM_ERROR_MASK \
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index 183de1139eeb..42eaef7ad7c7 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -78,13 +78,12 @@ static void a5xx_preempt_timer(struct timer_list *t)
 	struct a5xx_gpu *a5xx_gpu = from_timer(a5xx_gpu, t, preempt_timer);
 	struct msm_gpu *gpu = &a5xx_gpu->base.base;
 	struct drm_device *dev = gpu->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 
 	if (!try_preempt_state(a5xx_gpu, PREEMPT_TRIGGERED, PREEMPT_FAULTED))
 		return;
 
 	DRM_DEV_ERROR(dev->dev, "%s: preemption timed out\n", gpu->name);
-	queue_work(priv->wq, &gpu->recover_work);
+	kthread_queue_work(gpu->worker, &gpu->recover_work);
 }
 
 /* Try to trigger a preemption switch */
@@ -162,7 +161,6 @@ void a5xx_preempt_irq(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
 	struct drm_device *dev = gpu->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 
 	if (!try_preempt_state(a5xx_gpu, PREEMPT_TRIGGERED, PREEMPT_PENDING))
 		return;
@@ -181,7 +179,7 @@ void a5xx_preempt_irq(struct msm_gpu *gpu)
 		set_preempt_state(a5xx_gpu, PREEMPT_FAULTED);
 		DRM_DEV_ERROR(dev->dev, "%s: Preemption failed to complete\n",
 			gpu->name);
-		queue_work(priv->wq, &gpu->recover_work);
+		kthread_queue_work(gpu->worker, &gpu->recover_work);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 491fee410daf..e6703ae98760 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -19,8 +19,6 @@ static void a6xx_gmu_fault(struct a6xx_gmu *gmu)
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct msm_gpu *gpu = &adreno_gpu->base;
-	struct drm_device *dev = gpu->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 
 	/* FIXME: add a banner here */
 	gmu->hung = true;
@@ -29,7 +27,7 @@ static void a6xx_gmu_fault(struct a6xx_gmu *gmu)
 	del_timer(&gpu->hangcheck_timer);
 
 	/* Queue the GPU handler because we need to treat this as a recovery */
-	queue_work(priv->wq, &gpu->recover_work);
+	kthread_queue_work(gpu->worker, &gpu->recover_work);
 }
 
 static irqreturn_t a6xx_gmu_irq(int irq, void *data)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 5dddb9163bd3..2f236aadfa9c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -965,8 +965,6 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	struct drm_device *dev = gpu->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
 
 	/*
@@ -989,7 +987,7 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 	/* Turn off the hangcheck timer to keep it from bothering us */
 	del_timer(&gpu->hangcheck_timer);
 
-	queue_work(priv->wq, &gpu->recover_work);
+	kthread_queue_work(gpu->worker, &gpu->recover_work);
 }
 
 static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 30ba3beaad0a..7f4a9466e424 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -448,7 +448,7 @@ find_submit(struct msm_ringbuffer *ring, uint32_t fence)
 
 static void retire_submits(struct msm_gpu *gpu);
 
-static void recover_worker(struct work_struct *work)
+static void recover_worker(struct kthread_work *work)
 {
 	struct msm_gpu *gpu = container_of(work, struct msm_gpu, recover_work);
 	struct drm_device *dev = gpu->dev;
@@ -560,7 +560,6 @@ static void hangcheck_handler(struct timer_list *t)
 {
 	struct msm_gpu *gpu = from_timer(gpu, t, hangcheck_timer);
 	struct drm_device *dev = gpu->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
 	uint32_t fence = ring->memptrs->fence;
 
@@ -577,7 +576,7 @@ static void hangcheck_handler(struct timer_list *t)
 		DRM_DEV_ERROR(dev->dev, "%s:     submitted fence: %u\n",
 				gpu->name, ring->seqno);
 
-		queue_work(priv->wq, &gpu->recover_work);
+		kthread_queue_work(gpu->worker, &gpu->recover_work);
 	}
 
 	/* if still more pending work, reset the hangcheck timer: */
@@ -585,7 +584,7 @@ static void hangcheck_handler(struct timer_list *t)
 		hangcheck_timer_reset(gpu);
 
 	/* workaround for missing irq: */
-	queue_work(priv->wq, &gpu->retire_work);
+	kthread_queue_work(gpu->worker, &gpu->retire_work);
 }
 
 /*
@@ -760,7 +759,7 @@ static void retire_submits(struct msm_gpu *gpu)
 	}
 }
 
-static void retire_worker(struct work_struct *work)
+static void retire_worker(struct kthread_work *work)
 {
 	struct msm_gpu *gpu = container_of(work, struct msm_gpu, retire_work);
 	int i;
@@ -774,8 +773,7 @@ static void retire_worker(struct work_struct *work)
 /* call from irq handler to schedule work to retire bo's */
 void msm_gpu_retire(struct msm_gpu *gpu)
 {
-	struct msm_drm_private *priv = gpu->dev->dev_private;
-	queue_work(priv->wq, &gpu->retire_work);
+	kthread_queue_work(gpu->worker, &gpu->retire_work);
 	update_sw_cntrs(gpu);
 }
 
@@ -901,10 +899,18 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	gpu->funcs = funcs;
 	gpu->name = name;
 
-	INIT_LIST_HEAD(&gpu->active_list);
-	INIT_WORK(&gpu->retire_work, retire_worker);
-	INIT_WORK(&gpu->recover_work, recover_worker);
+	gpu->worker = kthread_create_worker(0, "%s-worker", gpu->name);
+	if (IS_ERR(gpu->worker)) {
+		ret = PTR_ERR(gpu->worker);
+		gpu->worker = NULL;
+		goto fail;
+	}
 
+	sched_set_fifo_low(gpu->worker->task);
+
+	INIT_LIST_HEAD(&gpu->active_list);
+	kthread_init_work(&gpu->retire_work, retire_worker);
+	kthread_init_work(&gpu->recover_work, recover_worker);
 
 	timer_setup(&gpu->hangcheck_timer, hangcheck_handler, 0);
 
@@ -1037,4 +1043,8 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 		gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu);
 		msm_gem_address_space_put(gpu->aspace);
 	}
+
+	if (gpu->worker) {
+		kthread_destroy_worker(gpu->worker);
+	}
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 1806e87600c0..09938ae114ec 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -106,9 +106,6 @@ struct msm_gpu {
 	/* number of GPU hangs (for all contexts) */
 	int global_faults;
 
-	/* worker for handling active-list retiring: */
-	struct work_struct retire_work;
-
 	void __iomem *mmio;
 	int irq;
 
@@ -137,7 +134,15 @@ struct msm_gpu {
 #define DRM_MSM_HANGCHECK_PERIOD 500 /* in ms */
 #define DRM_MSM_HANGCHECK_JIFFIES msecs_to_jiffies(DRM_MSM_HANGCHECK_PERIOD)
 	struct timer_list hangcheck_timer;
-	struct work_struct recover_work;
+
+	/* work for handling GPU recovery: */
+	struct kthread_work recover_work;
+
+	/* work for handling active-list retiring: */
+	struct kthread_work retire_work;
+
+	/* worker for retire/recover: */
+	struct kthread_worker *worker;
 
 	struct drm_gem_object *memptrs_bo;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
