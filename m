Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CFB4F6D33
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 23:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D7310E5FA;
	Wed,  6 Apr 2022 21:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642E210E08A;
 Wed,  6 Apr 2022 21:46:32 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 m12-20020a17090b068c00b001cabe30a98dso7063491pjz.4; 
 Wed, 06 Apr 2022 14:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g43LRxOPnuHcbyfQfDVoT6M8d2laa4QFWkHWb/Yu4qg=;
 b=cC++/7iikgLl+TlbToW62IbL+eLLrvQvapq1zNrxD5/+8s/GbJTo3cvVyLJQaVBi4L
 d6/BUYS7CVX33I69jsTcxOSjnUXstEUUrcpRYrgPC8OPYBTLXazETCclzSM1cNVKQSrj
 I4rUvPfMXV0AC+zxAyaPrqCXjq7i7KFu86DCHIs0+Hiww6vOtmix7P0zRMfLAKKb/8v4
 gD+SgXYsfw0XGzBT1BJtCgECQ1Dm57FMXqRMpeOxurvAXSdXQpraJ9iZuznvnRnDvZBH
 qp+/izm2cQfU6XtR4J17qBMpxpjRYuSi+pUZZyznLjvJ/Dn9UlEHmqQ1NV8t+iX8AyG+
 LzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g43LRxOPnuHcbyfQfDVoT6M8d2laa4QFWkHWb/Yu4qg=;
 b=BKn2C9oY1jKGOz1S9EZ9V3CmPt1NB0yeEA8ci6ATputz/YoRiIByKKPw7SFmBUy8HK
 fmwv47ujuKY+bLQ2eYER4EGZEv1/uAwfehBi7VxnAd+9ibL2njMNe+W41St7UFfLwxzO
 6VWusftq/OhvIcO//dAkb0eeIwE3yRrElOa9Tk6wksPlvKHr6FEn0AiXcxgLePx9kBUv
 N+AGzlfOI1x3CnRk9OTw4KAM6K0ABOE9+h0U2IKlDteSk2yQ5QJvOCEgHfLsPNpzWAKw
 J7whtqmc7+cwOM8QA1hlBq0TjDThoyzMEEa8Rut0bNy0R/QasGfsQ+ZvPsTAqzlJy9vE
 2K9Q==
X-Gm-Message-State: AOAM530LOB5HRT5PDu7t1TuYFNOSJE+FvNfir+GMX4+dGLtmXryBIUiT
 Q66pTq2PChU+ppjS1BZwzZE+diPnRoY=
X-Google-Smtp-Source: ABdhPJwS7xjVi2P9Nvb1pvAJY4RpS03oEFr6/hTLDnbpKf4JHfZ+vpuqNvAJneLCYK6QWR2bLkFdJQ==
X-Received: by 2002:a17:90a:3486:b0:1ca:c6a0:3f8f with SMTP id
 p6-20020a17090a348600b001cac6a03f8fmr12410889pjb.6.1649281591139; 
 Wed, 06 Apr 2022 14:46:31 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 f31-20020a17090a702200b001ca996866b5sm6514598pjk.12.2022.04.06.14.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 14:46:30 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 02/10] drm/msm/gpu: Drop duplicate fence counter
Date: Wed,  6 Apr 2022 14:46:18 -0700
Message-Id: <20220406214636.1156978-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406214636.1156978-1-robdclark@gmail.com>
References: <20220406214636.1156978-1-robdclark@gmail.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
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

