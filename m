Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F0C962B37
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD5E10E571;
	Wed, 28 Aug 2024 15:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eL4JVlZs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4381810E56E;
 Wed, 28 Aug 2024 15:07:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8F1E9A41648;
 Wed, 28 Aug 2024 15:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9CCC4CECB;
 Wed, 28 Aug 2024 15:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724857649;
 bh=KzCV689rRHj9LTg/b6rrYCx7sCt+nSxr+RJmwcuxtlw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=eL4JVlZs+xnXJzFZJPl2ctO0iGzMSa1PtOBVrROwbuMBk8IRynYeovRNi4e8O3otE
 t4RpcFOEDLep5RYn1oL3ppCKuGd96+K2kyLhnyqmVenAh8fykXBDWsT6gEP5uE14Mc
 fR+dpPmaFMZhSyF9DJNJgrymolBqLtLvrTJ6rIQC5wFhfY6FOpno3Gp0cEH8qO295n
 HnT9caG5T3VdBLIlCzRkVE62NvR1qH+nRbKDX1yGg7FJX7rBb/fLslxB4Q/Ir5/Ad8
 diqHiAKtEXdffRSr2t/n0VDGtREgPwxVyiHPALkhME9+aj0z5Jjg3Jr2XgwzUx5+DP
 3r5tVxfohmCdg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 28 Aug 2024 17:06:58 +0200
Subject: [PATCH v2 5/6] drm/msm/a6xx: Set GMU CGC properties on a6xx too
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-topic-a621-v2-5-1882c6b57432@kernel.org>
References: <20240828-topic-a621-v2-0-1882c6b57432@kernel.org>
In-Reply-To: <20240828-topic-a621-v2-0-1882c6b57432@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724857626; l=3400;
 i=konradybcio@kernel.org; s=20230215; h=from:subject:message-id;
 bh=nN1jIdmgpJFQCKZJ2uyox0t9bNkXH+G8RpT+oJBTlJQ=;
 b=Zm/qGzoLNLIItno0Ae/hVTOEfKCnrnDl7lvXipzVsVPrU/nsK8wN8IZSoKMufOJCFNJgE5oQY
 8GzIVsU06quDxfmeGHbGhJO83y+C0rVNt7gmYFu4ptbSYcTNjiEUfIp
X-Developer-Key: i=konradybcio@kernel.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

From: Konrad Dybcio <konrad.dybcio@linaro.org>

This was apparently never done before.. Program the expected values.

This also gets rid of sneakily setting that register through the HWCG
reg list on A690.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  1 -
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 18 ++++++++++--------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  8 +++++++-
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 6cd73abd95d4..deee0b686962 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -448,7 +448,6 @@ static const struct adreno_reglist a690_hwcg[] = {
 	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
 	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
 	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
-	{REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL, 0x20200},
 	{REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL, 0x10111},
 	{REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL, 0x5555},
 	{}
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 871452daa189..33a319f7d200 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -402,6 +402,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	const struct adreno_reglist *reg;
 	unsigned int i;
+	u32 cgc_delay, cgc_hyst;
 	u32 val, clock_cntl_on;
 
 	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
@@ -416,14 +417,15 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	else
 		clock_cntl_on = 0x8aa8aa82;
 
-	if (adreno_is_a7xx(adreno_gpu)) {
-		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
-			  state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
-		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
-			  state ? 0x10111 : 0);
-		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,
-			  state ? 0x5555 : 0);
-	}
+	cgc_delay = adreno_is_a615_family(adreno_gpu) ? 0x111 : 0x10111;
+	cgc_hyst = adreno_is_a615_family(adreno_gpu) ? 0x555 : 0x5555;
+
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
+			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
+			state ? cgc_delay : 0);
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,
+			state ? cgc_hyst : 0);
 
 	if (!adreno_gpu->info->a6xx->hwcg) {
 		gpu_write(gpu, REG_A7XX_RBBM_CLOCK_CNTL_GLOBAL, 1);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1ab523a163a0..26972b2cc896 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -433,7 +433,13 @@ static inline int adreno_is_a610_family(const struct adreno_gpu *gpu)
 	return adreno_is_a610(gpu) || adreno_is_a702(gpu);
 }
 
-/* check for a615, a616, a618, a619 or any a630 derivatives */
+/* TODO: 615/616 */
+static inline int adreno_is_a615_family(const struct adreno_gpu *gpu)
+{
+	return adreno_is_a618(gpu) ||
+	       adreno_is_a619(gpu);
+}
+
 static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)
 {
 	if (WARN_ON_ONCE(!gpu->info))

-- 
2.46.0

