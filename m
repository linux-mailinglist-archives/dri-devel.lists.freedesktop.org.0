Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CDD44B261
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 19:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE55289807;
	Tue,  9 Nov 2021 18:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EDA897E9;
 Tue,  9 Nov 2021 18:06:27 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id t21so22374562plr.6;
 Tue, 09 Nov 2021 10:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cktFVw3IlhlKgVgifoYJa4NlsrZ1sQ4P0m2OjOBVB5I=;
 b=exsJl9f6gLoctAGfQFWWrcta/+notjKRd+cGD+zwvAhkz0XRmb+KEVP1nl3brN+2xw
 G94C39l7/ItzibLPrA+O4k9p0In/PvhmFzl6u9GroGLDQt28S7VWo2Q/AUsI5Ka5Lcsu
 yyzXTe9bHiUapm5RWD4Ingvw6/BDOUTF/5joVflzuWIJvLvWCZrgBeB5V8rxPzupqkck
 WYQkJUYrxliVMh4RCmOAnAKt0AWhXpdhEljA+60Y5eaDJ+yVxmHbyDRfuDntlW/i3jDm
 VMBtzUNsljN9ogyrjFmYG+Y5JuTLAvaJHzxlhpB5DT4uh5wMF//mqUUdFhKkuDEA/2Os
 3wCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cktFVw3IlhlKgVgifoYJa4NlsrZ1sQ4P0m2OjOBVB5I=;
 b=JoDrSUJpjnV9sz0n2DePiSPNKoa52AcvZ7+ngutmPtXp4BfISZs0RsC9cSfjv6g/Ar
 2rpTKdCxEkqt2b/m7mu9S7OTfp7C9GciXAC7pnHrWgsy4ujFkwYZgtvDuJIDrg8b1gRW
 kwXDFh20MvCPB9e+6EeahqSZaRc+qVP2up72a180dD26FZBwajNwKtd6l3VhnkTGS/rv
 X4NxnS+Jvi5bGXLAHasYsDHlj3ZziWRKtiyU6WANDrrmeVjp2AjSVgNTxO2DaICmDDc+
 xhGZXr6E283RpdDpHUzIeFQMsH2/zbjPfMaaHaLVin+jjfenbAd+AyQuhLdO6nZKRgw9
 si5w==
X-Gm-Message-State: AOAM530YjODdsDDf+vB+NU7RQZ+dO3yJxvi+R2ZLMDZFGPzffRhIrX1Y
 xUu8tSDC+P1eMdtx/zpNxLfBle83mmc=
X-Google-Smtp-Source: ABdhPJwyGsjR2EsuBuFihB2hDG00yQtRSNMNv/WTs77ArI+SmlfZcP7DYnQWIBTj1R51NMVR4OCCqw==
X-Received: by 2002:a17:90a:df88:: with SMTP id
 p8mr9508500pjv.32.1636481186900; 
 Tue, 09 Nov 2021 10:06:26 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 w3sm17355868pfd.195.2021.11.09.10.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 10:06:25 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/msm: Drop priv->lastctx
Date: Tue,  9 Nov 2021 10:11:02 -0800
Message-Id: <20211109181117.591148-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109181117.591148-1-robdclark@gmail.com>
References: <20211109181117.591148-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

cur_ctx_seqno already does the same thing, but handles the edge cases
where a refcnt'd context can live after lastclose.  So let's not have
two ways to do the same thing.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c |  3 +--
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c |  3 +--
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c |  3 +--
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  8 +++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  9 +++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 10 ----------
 drivers/gpu/drm/msm/msm_drv.c         |  6 ------
 drivers/gpu/drm/msm/msm_drv.h         |  2 +-
 drivers/gpu/drm/msm/msm_gpu.c         |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h         | 11 +++++++++++
 10 files changed, 22 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index bdc989183c64..22e8295a5e2b 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -12,7 +12,6 @@ static bool a2xx_idle(struct msm_gpu *gpu);
 
 static void a2xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
-	struct msm_drm_private *priv = gpu->dev->dev_private;
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i;
 
@@ -23,7 +22,7 @@ static void a2xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
 			/* ignore if there has not been a ctx switch: */
-			if (priv->lastctx == submit->queue->ctx)
+			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 8fb847c174ff..2e481e2692ba 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -30,7 +30,6 @@ static bool a3xx_idle(struct msm_gpu *gpu);
 
 static void a3xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
-	struct msm_drm_private *priv = gpu->dev->dev_private;
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i;
 
@@ -41,7 +40,7 @@ static void a3xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
 			/* ignore if there has not been a ctx switch: */
-			if (priv->lastctx == submit->queue->ctx)
+			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index a96ee79cc5e0..c5524d6e8705 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -24,7 +24,6 @@ static bool a4xx_idle(struct msm_gpu *gpu);
 
 static void a4xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
-	struct msm_drm_private *priv = gpu->dev->dev_private;
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i;
 
@@ -35,7 +34,7 @@ static void a4xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
 			/* ignore if there has not been a ctx switch: */
-			if (priv->lastctx == submit->queue->ctx)
+			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 5e2750eb3810..6163990a4d09 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -65,7 +65,6 @@ void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
-	struct msm_drm_private *priv = gpu->dev->dev_private;
 	struct msm_ringbuffer *ring = submit->ring;
 	struct msm_gem_object *obj;
 	uint32_t *ptr, dwords;
@@ -76,7 +75,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
 		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			if (priv->lastctx == submit->queue->ctx)
+			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
@@ -126,12 +125,11 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
-	struct msm_drm_private *priv = gpu->dev->dev_private;
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
 	if (IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) && submit->in_rb) {
-		priv->lastctx = NULL;
+		gpu->cur_ctx_seqno = 0;
 		a5xx_submit_in_rb(gpu, submit);
 		return;
 	}
@@ -166,7 +164,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			if (priv->lastctx == submit->queue->ctx)
+			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 33da25b81615..3d2da81cb2c9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -106,7 +106,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	u32 asid;
 	u64 memptr = rbmemptr(ring, ttbr0);
 
-	if (ctx->seqno == a6xx_gpu->cur_ctx_seqno)
+	if (ctx->seqno == a6xx_gpu->base.base.cur_ctx_seqno)
 		return;
 
 	if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
@@ -138,14 +138,11 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 
 	OUT_PKT7(ring, CP_EVENT_WRITE, 1);
 	OUT_RING(ring, 0x31);
-
-	a6xx_gpu->cur_ctx_seqno = ctx->seqno;
 }
 
 static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
 	unsigned int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
-	struct msm_drm_private *priv = gpu->dev->dev_private;
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = submit->ring;
@@ -177,7 +174,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			if (priv->lastctx == submit->queue->ctx)
+			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
@@ -1081,7 +1078,7 @@ static int hw_init(struct msm_gpu *gpu)
 	/* Always come up on rb 0 */
 	a6xx_gpu->cur_ring = gpu->rb[0];
 
-	a6xx_gpu->cur_ctx_seqno = 0;
+	gpu->cur_ctx_seqno = 0;
 
 	/* Enable the SQE_to start the CP engine */
 	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 8e5527c881b1..86e0a7c3fe6d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -20,16 +20,6 @@ struct a6xx_gpu {
 
 	struct msm_ringbuffer *cur_ring;
 
-	/**
-	 * cur_ctx_seqno:
-	 *
-	 * The ctx->seqno value of the context with current pgtables
-	 * installed.  Tracked by seqno rather than pointer value to
-	 * avoid dangling pointers, and cases where a ctx can be freed
-	 * and a new one created with the same address.
-	 */
-	int cur_ctx_seqno;
-
 	struct a6xx_gmu gmu;
 
 	struct drm_gem_object *shadow_bo;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7936e8d498dd..73e827641024 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -752,14 +752,8 @@ static void context_close(struct msm_file_private *ctx)
 
 static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 {
-	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_file_private *ctx = file->driver_priv;
 
-	mutex_lock(&dev->struct_mutex);
-	if (ctx == priv->lastctx)
-		priv->lastctx = NULL;
-	mutex_unlock(&dev->struct_mutex);
-
 	context_close(ctx);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 69952b239384..2943c21d9aac 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -164,7 +164,7 @@ struct msm_drm_private {
 
 	/* when we have more than one 'msm_gpu' these need to be an array: */
 	struct msm_gpu *gpu;
-	struct msm_file_private *lastctx;
+
 	/* gpu is only set on open(), but we need this info earlier */
 	bool is_a2xx;
 	bool has_cached_coherent;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 2c46cd968ac4..3dfc58e6498f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -763,7 +763,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	mutex_unlock(&gpu->active_lock);
 
 	gpu->funcs->submit(gpu, submit);
-	priv->lastctx = submit->queue->ctx;
+	gpu->cur_ctx_seqno = submit->queue->ctx->seqno;
 
 	hangcheck_timer_reset(gpu);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 59870095ea41..623ee416c568 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -144,6 +144,17 @@ struct msm_gpu {
 	struct msm_ringbuffer *rb[MSM_GPU_MAX_RINGS];
 	int nr_rings;
 
+	/**
+	 * cur_ctx_seqno:
+	 *
+	 * The ctx->seqno value of the last context to submit rendering,
+	 * and the one with current pgtables installed (for generations
+	 * that support per-context pgtables).  Tracked by seqno rather
+	 * than pointer value to avoid dangling pointers, and cases where
+	 * a ctx can be freed and a new one created with the same address.
+	 */
+	int cur_ctx_seqno;
+
 	/*
 	 * List of GEM active objects on this gpu.  Protected by
 	 * msm_drm_private::mm_lock
-- 
2.31.1

