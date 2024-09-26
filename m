Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B299879C3
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 21:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141D510EBCF;
	Thu, 26 Sep 2024 19:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k8SfAjUE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E707210E08A;
 Thu, 26 Sep 2024 19:52:11 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-71b00a97734so1192919b3a.1; 
 Thu, 26 Sep 2024 12:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727380331; x=1727985131; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2boR/MAZxOMOcOLaexaTOrvAmufg1KJH8ZtqOW93otY=;
 b=k8SfAjUENJW5v/wNxpHEOzyog/yqxIOG3KZzIqvQ55UVLPC/KQyLuBkmsdenK7rUkz
 VhOl3VgV4563utTgBpJrlN+62Ddcjizec4QcFFa1MOAfb45aEk+PxL9N+xqdtY/1zvaN
 iuy4IXGbC3cCIYoBxLn4fDpREHLiYB0dDIQc7xK/B5zjPz8j9/uUJIEmnzgSE2jrEuyf
 0dWTlVtK1J6WeXsJWueh8tb/d9TPAb9QfCNo2RYJOchas9Bp2BItujVrYO78tIvWuq9H
 2U/7EsESeta3HK7/fCUnA5fE0NgXcb7jZLcXHl8R/nPQSHCu3cZZJpfVZCedhEJiUIdm
 U4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727380331; x=1727985131;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2boR/MAZxOMOcOLaexaTOrvAmufg1KJH8ZtqOW93otY=;
 b=JIgrf/blNoOQjYA/8+yrRKTGWz4nGIgXeSzG6EDh709HVYSQqTYBagKcNnnJBiVs5U
 dmxlBkreoK2RgVZLLq0JIQi70lD7PD81j8Q0kOAPIZ6n6gxWyI2PMyJp7UfeBXDLKvKW
 wkhRkHoFcqF/PCT2E4Tin+CHCGhLs0g9cmLqbhZCYnP+c6rx4BaojMsafE4HUHorXtJr
 fm/x7A5HM69q2WrjuGC6mLTpoFxn+5SAzzflpvEnztdPstEoo/tureG1I6urIHFgk4np
 jjAyQCNr9ZjI5q+fMi4OKlR+VzfOsJsZkgzkFXZ8PnAE77LlHsHef7Q93IE4fKauJ5Kr
 3yjg==
X-Gm-Message-State: AOJu0YzaK5VwwtFcuouq16adY1kCKCCosOZDC8c9kDf9CptLJoj4RNnK
 lQ4wTkVoOhTRIspq4GpTlIn7znf2G2vK9QWAjbbyGbNFs9A7m8xZqSDTQg==
X-Google-Smtp-Source: AGHT+IHXD4NVVvmwpQW583+r6Op56I2A3DVsRxRoJfFYmFB6Wi1rxzA0Ag9AZ6U3fDRx0wcPISJcPQ==
X-Received: by 2002:a05:6a00:8c2:b0:710:bd4b:8b96 with SMTP id
 d2e1a72fcca58-71b26079af9mr1185111b3a.28.1727380330814; 
 Thu, 26 Sep 2024 12:52:10 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71b26529d61sm278585b3a.171.2024.09.26.12.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 12:52:10 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm/a6xx+: Insert a fence wait before SMMU table update
Date: Thu, 26 Sep 2024 12:52:06 -0700
Message-ID: <20240926195207.21369-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.1
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

The CP_SMMU_TABLE_UPDATE _should_ be waiting for idle, but on some
devices (x1-85, possibly others), it seems to pass that barrier while
there are still things in the event completion FIFO waiting to be
written back to memory.

Work around that by adding a fence wait before context switch.  The
CP_EVENT_WRITE that writes the fence is the last write from a submit,
so seeing this value hit memory is a reliable indication that it is
safe to proceed with the context switch.

v2: Only emit CP_WAIT_TIMESTAMP on a7xx, as it is not supported on a6xx.
    Conversely, I've not been able to reproduce this issue on a6xx, so
    hopefully it is limited to a7xx, or perhaps just certain a7xx
    devices.

Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/63
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4760f9469613..cdda8200d5a9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -186,9 +186,10 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
 }
 
 static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
-		struct msm_ringbuffer *ring, struct msm_file_private *ctx)
+		struct msm_ringbuffer *ring, struct msm_gem_submit *submit)
 {
 	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
+	struct msm_file_private *ctx = submit->queue->ctx;
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
 	u32 asid;
@@ -200,6 +201,15 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
 		return;
 
+	if (adreno_gpu->info->family >= ADRENO_7XX_GEN1) {
+		/* Wait for previous submit to complete before continuing: */
+		OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);
+		OUT_RING(ring, 0);
+		OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
+		OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
+		OUT_RING(ring, submit->seqno - 1);
+	}
+
 	if (!sysprof) {
 		if (!adreno_is_a7xx(adreno_gpu)) {
 			/* Turn off protected mode to write to special registers */
@@ -280,7 +290,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
-	a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
+	a6xx_set_pagetable(a6xx_gpu, ring, submit);
 
 	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
 		rbmemptr_stats(ring, index, cpcycles_start));
@@ -410,7 +420,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
 	OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
 
-	a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
+	a6xx_set_pagetable(a6xx_gpu, ring, submit);
 
 	/*
 	 * If preemption is enabled, then set the pseudo register for the save
-- 
2.46.1

