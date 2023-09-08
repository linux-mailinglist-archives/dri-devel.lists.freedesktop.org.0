Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84867798F44
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 21:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41A310E138;
	Fri,  8 Sep 2023 19:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195CC10E138;
 Fri,  8 Sep 2023 19:31:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CD3C3B821E7;
 Fri,  8 Sep 2023 19:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1E3C433C7;
 Fri,  8 Sep 2023 19:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694201477;
 bh=SfVdZao8/lvmacCnZXsfaOMnq2FGvbw1vbpw+ZorL4g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i546ArwW0barsCTpuWIdShFrJnGqFavnz1OpG370tdC/gLnwb6Vg2OzID4Wpt51JE
 qkJLizdnjBnLBNM2PQeSEuBl+n3O4zCbHkwOMKoznhC93iL+r0gN2O0S6aKgXB0o+G
 1eWCr3kQqFMPmHrT+EfOa1lkJBY3U2cM5e18m3H4jzocTD5xz1WN3fFQ9/AhbdqQUy
 UBAVpPa/XKmmtL/ahyQxY3MtS0wsHP5BwOjyo0gMs2G2KyEN0q1Llk81yTAADna4DW
 DRJvjOJf64Dm+PZYLlS0IJqFeUnG1e1lyZNySwivlxPvggfg29pRE4jpnAPmb3ff11
 6QO5fmm5ldGJA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 24/36] drm/msm/adreno: Use quirk identify hw_apriv
Date: Fri,  8 Sep 2023 15:28:35 -0400
Message-Id: <20230908192848.3462476-24-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908192848.3462476-1-sashal@kernel.org>
References: <20230908192848.3462476-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.2
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 quic_akhilpo@quicinc.com, linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, joel@joelfernandes.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, swboyd@chromium.org,
 johan+linaro@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

[ Upstream commit 459f9e26e7d49f80f587d7592ccb78e00ab458e4 ]

Rather than just open coding a list of gpu-id matches.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Patchwork: https://patchwork.freedesktop.org/patch/549764/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 3 +--
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b3ada1e7b598b..77901af95b5a3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2491,8 +2491,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	/* Quirk data */
 	adreno_gpu->info = info;
 
-	if (adreno_is_a650(adreno_gpu) || adreno_is_a660_family(adreno_gpu))
-		adreno_gpu->base.hw_apriv = true;
+	adreno_gpu->base.hw_apriv = !!(info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu);
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index ce8d0b2475bf1..5751077c201eb 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -325,6 +325,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_1M + SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a650_zap.mdt",
 		.hwcg = a650_hwcg,
@@ -339,6 +340,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_1M + SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a660_zap.mdt",
 		.hwcg = a660_hwcg,
@@ -351,6 +353,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.hwcg = a660_hwcg,
 		.address_space_size = SZ_16G,
@@ -375,6 +378,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_4M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a690_zap.mdt",
 		.hwcg = a690_hwcg,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 845019891ad19..a925e04a2283c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -32,6 +32,7 @@ enum {
 #define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
 #define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
 #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
+#define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
 
 struct adreno_rev {
 	uint8_t  core;
-- 
2.40.1

