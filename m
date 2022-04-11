Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D854FC6FE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 23:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9AE89DB5;
	Mon, 11 Apr 2022 21:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B083389D81;
 Mon, 11 Apr 2022 21:58:19 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id r66so15358311pgr.3;
 Mon, 11 Apr 2022 14:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g43LRxOPnuHcbyfQfDVoT6M8d2laa4QFWkHWb/Yu4qg=;
 b=PB5sKGBvIUmeegWThyUJf73EvvjkYSx9tZFYN7Txp95EYCkPzkG5pOXDZ7W8/XSRNo
 TE2NneBX+IHbwVDn5fX8FHCZ20p8Su31PmpbsNDUt1qYnRl/s96y1UE4Dqv0WDzo5TzM
 BHO2nemuSlFQf4iMVT4J9P5Of/LSEzQWzo3j3yq82tHylOFlwWEvTqzwyIDl0ykQoUGD
 c0+xVPSWPmgK8vAQMoQKFRWmxQPjEMQe7GyVsSXgF68Z+A4Ny/2sd6p2TYlAWj9hsQQf
 3Q6funSeWWl/AQ2NdzylIff/WfTBHNQrn0XrAxHLygv2rX0S/NL24EQ3Cy7tpGlAUFJk
 oDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g43LRxOPnuHcbyfQfDVoT6M8d2laa4QFWkHWb/Yu4qg=;
 b=AOCzQAcR/0BSd9Wmye/LJccJZM2E2eBQPTJz+YlpPvxt3CMwlL1H1EUvcZq0LpcqzN
 DavikBIu0vKImxN5+/WG57A4XLsRxU1vthglpZZ/+a/Gc32Ej7Ix8ebphJScc7ME5h9M
 1iMRaM6Z0FUiFSsAreITPM9GynuGAQFLICktmGLX3R3UeLS/gfredc+vhF0HTtOF8hwG
 SMYSkPybE6L2o7LT8upDt7w42KDPZUND+NoZHq7IWHRCopgWy2KyvO/0IcSJ2pNJ0B1O
 juyn3QjNX6U4YySiaC3ccZpwJv0yCd+aplO3wnRnNLI52NXfg5uIb+JrHIPHydqNoGDM
 4LAw==
X-Gm-Message-State: AOAM533ru25NLaU8VH+0HmIYiXCZSrhpZvfre4Wd166kKl69pP2q/g6q
 c5Dfmr9qR1RIMXF1jS46OdvQp2cHOhs=
X-Google-Smtp-Source: ABdhPJxjLarUtDWzS6MqlaRQ3gZfrM37+RVIzPOCAUUsohxcrF52JT2WA7z7VuW4xPR4UnfuGGYgBQ==
X-Received: by 2002:a65:5583:0:b0:380:d91a:8270 with SMTP id
 j3-20020a655583000000b00380d91a8270mr28228373pgs.620.1649714298755; 
 Mon, 11 Apr 2022 14:58:18 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 16-20020a17090a005000b001c7511dc31esm427790pjb.41.2022.04.11.14.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 14:58:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 02/10] drm/msm/gpu: Drop duplicate fence counter
Date: Mon, 11 Apr 2022 14:58:31 -0700
Message-Id: <20220411215849.297838-3-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The ring seqno counter duplicates the fence-context last_fence counter.
They end up getting incremented in lock-step, on the same scheduler
thread, but the split just makes things less obvious.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 ++--
 drivers/gpu/drm/msm/msm_gpu.c           | 8 ++++----
 drivers/gpu/drm/msm/msm_gpu.h           | 2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h    | 1 -
 6 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 407f50a15faa..d31aa87c6c8d 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1235,7 +1235,7 @@ static void a5xx_fault_detect_irq(struct msm_gpu *gpu)
 		return;
 
 	DRM_DEV_ERROR(dev->dev, "gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
-		ring ? ring->id : -1, ring ? ring->seqno : 0,
+		ring ? ring->id : -1, ring ? ring->fctx->last_fence : 0,
 		gpu_read(gpu, REG_A5XX_RBBM_STATUS),
 		gpu_read(gpu, REG_A5XX_CP_RB_RPTR),
 		gpu_read(gpu, REG_A5XX_CP_RB_WPTR),
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 83c31b2ad865..17de46fc4bf2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1390,7 +1390,7 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 
 	DRM_DEV_ERROR(&gpu->pdev->dev,
 		"gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
-		ring ? ring->id : -1, ring ? ring->seqno : 0,
+		ring ? ring->id : -1, ring ? ring->fctx->last_fence : 0,
 		gpu_read(gpu, REG_A6XX_RBBM_STATUS),
 		gpu_read(gpu, REG_A6XX_CP_RB_RPTR),
 		gpu_read(gpu, REG_A6XX_CP_RB_WPTR),
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 45f2c6084aa7..6385ab06632f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -578,7 +578,7 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state)
 
 		state->ring[i].fence = gpu->rb[i]->memptrs->fence;
 		state->ring[i].iova = gpu->rb[i]->iova;
-		state->ring[i].seqno = gpu->rb[i]->seqno;
+		state->ring[i].seqno = gpu->rb[i]->fctx->last_fence;
 		state->ring[i].rptr = get_rptr(adreno_gpu, gpu->rb[i]);
 		state->ring[i].wptr = get_wptr(gpu->rb[i]);
 
@@ -828,7 +828,7 @@ void adreno_dump_info(struct msm_gpu *gpu)
 
 		printk("rb %d: fence:    %d/%d\n", i,
 			ring->memptrs->fence,
-			ring->seqno);
+			ring->fctx->last_fence);
 
 		printk("rptr:     %d\n", get_rptr(adreno_gpu, ring));
 		printk("rb wptr:  %d\n", get_wptr(ring));
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 747b89aa9d13..9480bdf875db 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -534,7 +534,7 @@ static void hangcheck_handler(struct timer_list *t)
 	if (fence != ring->hangcheck_fence) {
 		/* some progress has been made.. ya! */
 		ring->hangcheck_fence = fence;
-	} else if (fence_before(fence, ring->seqno)) {
+	} else if (fence_before(fence, ring->fctx->last_fence)) {
 		/* no progress and not done.. hung! */
 		ring->hangcheck_fence = fence;
 		DRM_DEV_ERROR(dev->dev, "%s: hangcheck detected gpu lockup rb %d!\n",
@@ -542,13 +542,13 @@ static void hangcheck_handler(struct timer_list *t)
 		DRM_DEV_ERROR(dev->dev, "%s:     completed fence: %u\n",
 				gpu->name, fence);
 		DRM_DEV_ERROR(dev->dev, "%s:     submitted fence: %u\n",
-				gpu->name, ring->seqno);
+				gpu->name, ring->fctx->last_fence);
 
 		kthread_queue_work(gpu->worker, &gpu->recover_work);
 	}
 
 	/* if still more pending work, reset the hangcheck timer: */
-	if (fence_after(ring->seqno, ring->hangcheck_fence))
+	if (fence_after(ring->fctx->last_fence, ring->hangcheck_fence))
 		hangcheck_timer_reset(gpu);
 
 	/* workaround for missing irq: */
@@ -770,7 +770,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	msm_gpu_hw_init(gpu);
 
-	submit->seqno = ++ring->seqno;
+	submit->seqno = submit->hw_fence->seqno;
 
 	msm_rd_dump_submit(priv->rd, submit, NULL);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 2c0203fd6ce3..e47a42b1244a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -291,7 +291,7 @@ static inline bool msm_gpu_active(struct msm_gpu *gpu)
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct msm_ringbuffer *ring = gpu->rb[i];
 
-		if (fence_after(ring->seqno, ring->memptrs->fence))
+		if (fence_after(ring->fctx->last_fence, ring->memptrs->fence))
 			return true;
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index d8c63df4e9ca..2a5045abe46e 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -59,7 +59,6 @@ struct msm_ringbuffer {
 	spinlock_t submit_lock;
 
 	uint64_t iova;
-	uint32_t seqno;
 	uint32_t hangcheck_fence;
 	struct msm_rbmemptrs *memptrs;
 	uint64_t memptrs_iova;
-- 
2.35.1

