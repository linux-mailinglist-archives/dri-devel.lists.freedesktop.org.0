Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8CF45CF3C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 22:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2E46EDE4;
	Wed, 24 Nov 2021 21:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF386EDE4;
 Wed, 24 Nov 2021 21:37:27 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id y8so2952835plg.1;
 Wed, 24 Nov 2021 13:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=czChcqf/rxB4kimdnpI9dF/QE+KTJ3jjbEBkb1K2GAo=;
 b=mDJoZcTxtlALueM3kotZUVp8k+AxPu6c+s02GN3ieQ45puheKUbcQ+lFNDNtozddQi
 jfzehP7hHasy0v6kPF+Np0AAKFsyMOjYTGxUQsQDD4RaSi2vFui0fS8aG/KKtFwUb4yL
 MMfxNeLTBDoRh8GvAbXO0WdE773xKeYFNc9Mu48LOTQSq5rHJjHyz53mRxRFGYcc/nCy
 aJ92utFLUswT4HgFDXEV1ddUns4dc99EKONHOui+4yetQkFzcShCAKHapXB09eGI5Aqn
 hxwOnpVdj+vdsZhl9I5QcoDFXfDK5aOnfUBk+WJgf+A8PLFN5fAF0Kv7Y+PrIxahIb6H
 kZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=czChcqf/rxB4kimdnpI9dF/QE+KTJ3jjbEBkb1K2GAo=;
 b=50MYoEFAX0tp2VzVL1e83Sr6cTFaRnBhCsN/oLPebwMxC9iw1XuL3rqSijvHNZj+LJ
 1WsrkgrREAOd2pjggceqGHgrk7XXggXs/o4eVYfF/kqVkkEuipHECGAmMgndHOZJecaw
 FgsyQaz9HvXL9vK04DFEIusPpX1JKtGhC+cWw3Uze3Fq4jZlZ2PycO3cRJYl8XndV/Fu
 W7bKqAljxZ5m7VdNsWDfQ8k+nlzm/5US1sgUFm0Thw7MIhM+z1O1kjRA2m2A+CIlQeuX
 X2263CFslSGR211bxUH+kTzNzdXoBIW+1rCMQBTu0e74WKhlvpzJcK44mbpsI5zkrODm
 lLIw==
X-Gm-Message-State: AOAM531C6j4Fy8VLPUpig9LT8H4Xhvf8Dvz0jX5rJ0xFrx2zn8rwnVlU
 pQFFi9irM6Df1utuQKjkeH7xckVfyBM=
X-Google-Smtp-Source: ABdhPJwJ0NpH8HpJZ7gegyvEYtGCYsD8uWHIH4g2Jw0js2r7vdkutX5FOS9zsjiXf747nDZrNa5jCg==
X-Received: by 2002:a17:902:d2cd:b0:141:fbe2:b658 with SMTP id
 n13-20020a170902d2cd00b00141fbe2b658mr22927678plc.49.1637789846668; 
 Wed, 24 Nov 2021 13:37:26 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 h13sm481311pgg.16.2021.11.24.13.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 13:37:25 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] drm/msm/gpu: Make a6xx_get_gmu_log() more generic
Date: Wed, 24 Nov 2021 13:41:32 -0800
Message-Id: <20211124214151.1427022-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124214151.1427022-1-robdclark@gmail.com>
References: <20211124214151.1427022-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Turn it into a thing we can use to snapshot other GMU buffers.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 34 +++++++++------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index f1b1a9bffb37..1de103f29d25 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -802,28 +802,24 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 		&a6xx_state->gmu_registers[2], false);
 }
 
-static void a6xx_get_gmu_log(struct msm_gpu *gpu,
-		struct a6xx_gpu_state *a6xx_state)
+static struct msm_gpu_state_bo *a6xx_snapshot_gmu_bo(
+		struct a6xx_gpu_state *a6xx_state, struct a6xx_gmu_bo *bo)
 {
-	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
-	struct msm_gpu_state_bo *gmu_log;
+	struct msm_gpu_state_bo *snapshot;
 
-	gmu_log = state_kcalloc(a6xx_state,
-		1, sizeof(*a6xx_state->gmu_log));
-	if (!gmu_log)
-		return;
+	snapshot = state_kcalloc(a6xx_state, 1, sizeof(*snapshot));
+	if (!snapshot)
+		return NULL;
 
-	gmu_log->iova = gmu->log.iova;
-	gmu_log->size = gmu->log.size;
-	gmu_log->data = kvzalloc(gmu_log->size, GFP_KERNEL);
-	if (!gmu_log->data)
-		return;
+	snapshot->iova = bo->iova;
+	snapshot->size = bo->size;
+	snapshot->data = kvzalloc(snapshot->size, GFP_KERNEL);
+	if (!snapshot->data)
+		return NULL;
 
-	memcpy(gmu_log->data, gmu->log.virt, gmu->log.size);
+	memcpy(snapshot->data, bo->virt, bo->size);
 
-	a6xx_state->gmu_log = gmu_log;
+	return snapshot;
 }
 
 #define A6XX_GBIF_REGLIST_SIZE   1
@@ -963,7 +959,7 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 
 	a6xx_get_gmu_registers(gpu, a6xx_state);
 
-	a6xx_get_gmu_log(gpu, a6xx_state);
+	a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
 
 	/* If GX isn't on the rest of the data isn't going to be accessible */
 	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
@@ -1006,7 +1002,7 @@ static void a6xx_gpu_state_destroy(struct kref *kref)
 	struct a6xx_gpu_state *a6xx_state = container_of(state,
 			struct a6xx_gpu_state, base);
 
-	if (a6xx_state->gmu_log && a6xx_state->gmu_log->data)
+	if (a6xx_state->gmu_log)
 		kvfree(a6xx_state->gmu_log->data);
 
 	list_for_each_entry_safe(obj, tmp, &a6xx_state->objs, node)
-- 
2.33.1

