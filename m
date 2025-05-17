Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D121ABAB8E
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 19:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90C510E1AB;
	Sat, 17 May 2025 17:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YMwPOaOn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374C610E19C;
 Sat, 17 May 2025 17:33:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A49336154C;
 Sat, 17 May 2025 17:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513BBC4CEEA;
 Sat, 17 May 2025 17:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747503209;
 bh=fugo/v8jWA6/uhHKBTmZfj262KfkUmbxahykOY/EPRs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=YMwPOaOneSn8bH4WP03ZufGzSjQRlhawR1ZpuZctE+jL/Ij6YS/QJSbO/m/+pKm/e
 WANQGpMyDwE+wbiH/OZIejFx22KuowB4PwUkrhM8fbhnjq3XmlupAIj3MyY7YaIk/V
 U9xqKt8Y1AylMGAiHMgsifbF7wq48vE3/bbM2tzWGP6dhr2e4YJ+tFAorDCY+2nKiy
 SMCEDgFAE7eV/EoSj6M449U1ncggYaH4MoeUqmELTmC86fD0Zn/ROHDO6RMcgED2uY
 h2Um4y0J0xBsEyXvarycdDqCIYARTO8DlCrBuMBaGvIdBeW0pvkDfebDiy1fQrBjMZ
 RQGyxmJCliFVQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 17 May 2025 19:32:43 +0200
Subject: [PATCH RFT v3 09/14] drm/msm/a6xx: Resolve the meaning of
 rgb565_predicator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-topic-ubwc_central-v3-9-3c8465565f86@oss.qualcomm.com>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
In-Reply-To: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747503160; l=2442;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=D1E8ufQX/8vPneAFdMn0bYm6wltEVuG4wQEM7xSTDVw=;
 b=sooBIX1kfQkZrIp6S89PqABumtrJUqonElXYU8UlhRlnwloRVdNjIQZsx5pn+zZHtVPSGX1RM
 blGbJIxHu2ZBJcF7HRnFMTLJbrnCLGEGKZKqr98tMeavy9YxqG6O017
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
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

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

It's supposed to be on when the UBWC encoder version is >= 4.0.
Drop the per-GPU assignments.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a20b57e964d31adb22f0b79a5178b45f0f5ec5d5..32017e2730a9059a16ef551363660b72d7f991c8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -592,7 +592,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (IS_ERR(gpu->common_ubwc_cfg))
 		return PTR_ERR(gpu->common_ubwc_cfg);
 
-	gpu->ubwc_config.rgb565_predicator = 0;
 	gpu->ubwc_config.min_acc_len = 0;
 	gpu->ubwc_config.ubwc_swizzle = 0x6;
 	gpu->ubwc_config.macrotile_mode = 0;
@@ -619,7 +618,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 
 	if (adreno_is_a623(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 16;
-		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
@@ -633,13 +631,11 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	    adreno_is_a740_family(gpu)) {
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
 		gpu->ubwc_config.highest_bank_bit = 16;
-		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
 	if (adreno_is_a663(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 13;
-		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.macrotile_mode = 1;
 		gpu->ubwc_config.ubwc_swizzle = 0x4;
 	}
@@ -668,6 +664,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	 */
 	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
 	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & BIT(1));
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
@@ -680,7 +677,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |
-		  adreno_gpu->ubwc_config.rgb565_predicator << 11 |
+		  rgb565_predicator << 11 |
 		  hbb_hi << 10 | amsbc << 4 |
 		  adreno_gpu->ubwc_config.min_acc_len << 3 |
 		  hbb_lo << 1 | ubwc_mode);

-- 
2.49.0

