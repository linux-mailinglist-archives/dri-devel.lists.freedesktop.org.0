Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FCB544F2B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 16:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5583B11A86D;
	Thu,  9 Jun 2022 14:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17622113EE9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 14:34:03 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 129so22019338pgc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 07:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G+wGSWx5rEpsgmi4hQGx7HlbHSxy52WR8UStPyNrzxo=;
 b=Mf5PqduKe8vF51h+9aatjv7dQZh61xwzCf3FP3+ZjcQysGr9xL6cg5cp3dRur46HOl
 oqnMHRfnjKRHek2s3UNpi3H+lwZgPXjoZ9bXkxt+/DsDSgneq0mkld9/10q3zdVUEw8n
 /BiAOaPAuAdyVhgyLtYYMWH6P21wI1PXuiwW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G+wGSWx5rEpsgmi4hQGx7HlbHSxy52WR8UStPyNrzxo=;
 b=2mT2s+Om8FpopxAsF890y/6jQ8I2Nim1ETKPdxceCfno39mjakMVzlVHlpDHfHhrlP
 T7WB/j0ik5sIgnlcqzOF3ZXTdlHx1p9B4SbM70tCS/YWNYXXPrdAVOWYbLzQ2WS7DUoe
 tqhyutdVIFIgzzvxaocsB0lL5odYkLQJtA5fujZPZpY0AvVVVh/n17xnMWz0KAU6zZYl
 mFfRaZ6MpGc0NCLG5+QMgHbK1dDOG01AhYN2guwJFAckgBW5kllL6X8xkqSQ2ZduDJ50
 EgB3FYYAj67fG5mXgN6bRGAk+mpXdOwU4I7QSpoUGLjEmtINdf9bFnl4POHRjbqgQ1Jl
 3Smw==
X-Gm-Message-State: AOAM531A6oC8LUhdTu3iPlgixE3acRF2H2WwdwNwqJtmlEf3s25LlrpN
 F2qePZTUyUWUat4CzXkOSD5o5w==
X-Google-Smtp-Source: ABdhPJy8SxaE59iJ2xQ/JffGvrDKCf2I2syIiyTxswm9wtZ4HWH2Kfbsudisov+hdfl6zmxEHFkyKg==
X-Received: by 2002:a63:f04e:0:b0:3ff:af9d:5387 with SMTP id
 s14-20020a63f04e000000b003ffaf9d5387mr3910816pgj.514.1654785242609; 
 Thu, 09 Jun 2022 07:34:02 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:4732:8bcf:1bc2:ec84])
 by smtp.gmail.com with ESMTPSA id
 g2-20020aa79f02000000b005185407eda5sm17420543pfr.44.2022.06.09.07.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 07:34:02 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Subject: [PATCH] drm/msm: Grab the GPU runtime in a6xx routines,
 not the GMU one
Date: Thu,  9 Jun 2022 07:33:33 -0700
Message-Id: <20220609073317.1.Ie846c5352bc307ee4248d7cab998ab3016b85d06@changeid>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
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
Cc: linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Yangtao Li <tiny.windzz@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Wang Qing <wangqing@vivo.com>,
 Eric Anholt <eric@anholt.net>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From testing on sc7180-trogdor devices, reading the GMU registers
needs the GMU clocks to be enabled. Those clocks get turned on in
a6xx_gmu_resume(). Confusingly enough, that function is called as a
result of the runtime_pm of the GPU "struct device", not the GMU
"struct device".

Let's grab a reference to the correct device. Incidentally, this makes
us match the a5xx routine more closely.

This is easily shown to fix crashes that happen if we change the GPU's
pm_runtime usage to not use autosuspend. It's also believed to fix
some long tail GPU crashes even with autosuspend.

NOTE: the crashes I've seen were fixed by _only_ fixing
a6xx_gpu_busy(). However, I believe that the same arguments should be
made to a6xx_gmu_set_freq() so I've changed that function too.

Fixes: eadf79286a4b ("drm/msm: Check for powered down HW in the devfreq callbacks")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 9f76f5b15759..b79ad2e0649c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -129,13 +129,13 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
 	 * This can get called from devfreq while the hardware is idle. Don't
 	 * bring up the power if it isn't already active
 	 */
-	if (pm_runtime_get_if_in_use(gmu->dev) == 0)
+	if (pm_runtime_get_if_in_use(&gpu->pdev->dev) == 0)
 		return;
 
 	if (!gmu->legacy) {
 		a6xx_hfi_set_freq(gmu, perf_index);
 		dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
-		pm_runtime_put(gmu->dev);
+		pm_runtime_put(&gpu->pdev->dev);
 		return;
 	}
 
@@ -159,7 +159,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
 		dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
 
 	dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
-	pm_runtime_put(gmu->dev);
+	pm_runtime_put(&gpu->pdev->dev);
 }
 
 unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 841e47a0b06b..87568d0b6ef8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1659,7 +1659,7 @@ static u64 a6xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
 	*out_sample_rate = 19200000;
 
 	/* Only read the gpu busy if the hardware is already active */
-	if (pm_runtime_get_if_in_use(a6xx_gpu->gmu.dev) == 0)
+	if (pm_runtime_get_if_in_use(&gpu->pdev->dev) == 0)
 		return 0;
 
 	busy_cycles = gmu_read64(&a6xx_gpu->gmu,
@@ -1667,7 +1667,7 @@ static u64 a6xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
 			REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H);
 
 
-	pm_runtime_put(a6xx_gpu->gmu.dev);
+	pm_runtime_put(&gpu->pdev->dev);
 
 	return busy_cycles;
 }
-- 
2.36.1.255.ge46751e96f-goog

