Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EF341E0FE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 20:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401D16EC42;
	Thu, 30 Sep 2021 18:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486A66E450;
 Thu, 30 Sep 2021 18:20:35 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id h1so1640349pfv.12;
 Thu, 30 Sep 2021 11:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gjZZ/ucXOWL7CIsLTW5U/ybZd+F2uJjp6RNFoIb1zYc=;
 b=IM4363ZIbg2YekiDwC2QFrRe/u/VVnOy6LGDPj2DxxC80vB/bOfCcCbiFuMFIWZ1VD
 egrxrxplwBr3BfS2iZtDxAXuQI+ZVZMTXW9vaKbwndqAUU6h59HYajlupBrbOFqhZyv1
 XN/caWJJGDoFsb/w/6/FvfWwMUXpFD7LwuNaMz9x5mZbnvQTjx8Uoy3BBTDmV/9AHsIq
 kppWrjC0Kx1w7witsYITJB69FqKzc6P19HJYyJkeTrX5Mx4Q0p6N6M212gjo0FqDyJgb
 giE9hSAnnqreGeV5AA+P1XmKRdceNwGXRpezVtyavpscF1IzHumjkfH9YJGkkjhTDwSk
 JI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gjZZ/ucXOWL7CIsLTW5U/ybZd+F2uJjp6RNFoIb1zYc=;
 b=rzGfNhAzT2Dq97YS5/oC+h6Jn1KCtEk2tEueKBmX2dIsghIrZmTae+zPxndEh61hiz
 3sz5RVWYK0gtaQXE469AJczQZatwM5NwjKqxeenw2dWZ0dB4lkXqVVU4859CrB58mO1n
 AFpAo2fIHVKURxRVLaxRtDO3Gdb/nqsrXn7T6RezHfAknA5vKH0dqyMaHIH8SU/lxHpN
 d6oknGEXbQseadGX79lIeR3ieFYwBsb/cupJnBU5p6bHBLJY2dmV46ZSkDJ9basC2GFK
 XEYVxxe/phdxKBwiaUAKyRqzkrMt8TnRlyy/tBeiNxR1eLwDGUTgYoNJn3i8ZDX8X1i+
 FNEQ==
X-Gm-Message-State: AOAM5301bH2/EQX3kX4iCGdex6I9N4HjvuzTLzQwyXw9a9WldeR7ykRa
 py0f5wnRPHfxawDvOT9U+r71tZtFfxU=
X-Google-Smtp-Source: ABdhPJyUCr7ygKUx86DaLgetw9p4qlMD/xpSRDWXB7zvz7jE7HLv8Cc6vDLV6GdHS5ZUTKVwxpoHVg==
X-Received: by 2002:a63:191a:: with SMTP id z26mr6084310pgl.373.1633026034126; 
 Thu, 30 Sep 2021 11:20:34 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 q18sm3629863pfh.170.2021.09.30.11.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 11:20:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Akhil P Oommen <akhilpo@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Yangtao Li <tiny.windzz@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: Track current ctx by seqno
Date: Thu, 30 Sep 2021 11:25:02 -0700
Message-Id: <20210930182506.1236811-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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

In theory a context can be destroyed and a new one allocated at the same
address, making the pointer comparision to detect when we don't need to
update the current pagetables invalid.  Instead assign a sequence number
to each context on creation, and use this for the check.

Fixes: 84c31ee16f90 ("drm/msm/a6xx: Add support for per-instance pagetables")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  6 +++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 11 ++++++++++-
 drivers/gpu/drm/msm/msm_drv.c         |  3 +++
 drivers/gpu/drm/msm/msm_drv.h         |  1 +
 4 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 5e1ae3df42ba..e0a8b2fd1ff0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -106,7 +106,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	u32 asid;
 	u64 memptr = rbmemptr(ring, ttbr0);
 
-	if (ctx == a6xx_gpu->cur_ctx)
+	if (ctx->seqno == a6xx_gpu->cur_ctx_seqno)
 		return;
 
 	if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
@@ -139,7 +139,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	OUT_PKT7(ring, CP_EVENT_WRITE, 1);
 	OUT_RING(ring, 0x31);
 
-	a6xx_gpu->cur_ctx = ctx;
+	a6xx_gpu->cur_ctx_seqno = ctx->seqno;
 }
 
 static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
@@ -1081,7 +1081,7 @@ static int hw_init(struct msm_gpu *gpu)
 	/* Always come up on rb 0 */
 	a6xx_gpu->cur_ring = gpu->rb[0];
 
-	a6xx_gpu->cur_ctx = NULL;
+	a6xx_gpu->cur_ctx_seqno = 0;
 
 	/* Enable the SQE_to start the CP engine */
 	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 0bc2d062f54a..8e5527c881b1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -19,7 +19,16 @@ struct a6xx_gpu {
 	uint64_t sqe_iova;
 
 	struct msm_ringbuffer *cur_ring;
-	struct msm_file_private *cur_ctx;
+
+	/**
+	 * cur_ctx_seqno:
+	 *
+	 * The ctx->seqno value of the context with current pgtables
+	 * installed.  Tracked by seqno rather than pointer value to
+	 * avoid dangling pointers, and cases where a ctx can be freed
+	 * and a new one created with the same address.
+	 */
+	int cur_ctx_seqno;
 
 	struct a6xx_gmu gmu;
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 624078b3adf2..30c1efc3d8a0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -711,6 +711,7 @@ static void load_gpu(struct drm_device *dev)
 
 static int context_init(struct drm_device *dev, struct drm_file *file)
 {
+	static atomic_t ident = ATOMIC_INIT(0);
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_file_private *ctx;
 
@@ -727,6 +728,8 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	ctx->aspace = msm_gpu_create_private_address_space(priv->gpu, current);
 	file->driver_priv = ctx;
 
+	ctx->seqno = atomic_inc_return(&ident);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index de062450add4..8633d0059a3e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -59,6 +59,7 @@ struct msm_file_private {
 	int queueid;
 	struct msm_gem_address_space *aspace;
 	struct kref ref;
+	int seqno;
 };
 
 enum msm_mdp_plane_property {
-- 
2.31.1

