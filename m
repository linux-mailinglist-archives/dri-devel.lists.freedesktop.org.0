Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CACAE9978
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 11:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EA410E8A3;
	Thu, 26 Jun 2025 09:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sD5qCayt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98ACE10E897;
 Thu, 26 Jun 2025 09:03:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D435EA50102;
 Thu, 26 Jun 2025 09:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9372FC4CEEB;
 Thu, 26 Jun 2025 09:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750928607;
 bh=S3JHmksvY8rkFLpju1G9DgL1dxkE0dccEaycj5QkxT4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=sD5qCayttBEC2LYm994neRO0kSFyDLEX2dNrk0ZvAwPUWm7xwYTb4vaK3V74963sp
 kURIsDbjwWJDokvLkqHBDgCvlZbGbnFZU1fEjuEiajcsj0mE8e2nef89ezscDZ+50B
 6qD0/KTvYy+kzPL1GmyTAQNkys2jw9uT/U91DOODl0mw3G3MC8KhaANPaCSrKqb8S3
 5ucotSeOGyXjo2pYYH1GCOJSNzmZfWMEt42YjKmhd25gxDkkD4nvqCsa8E07VRIKAw
 Nm9aC6Zcu0wi/eUgxNFiQFvWNKM+CPbtR5t+s/HAec2nUlktRleafCkBd+5X8KjxrT
 w5Kse6ovgU4xg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 26 Jun 2025 11:02:37 +0200
Subject: [PATCH v6 10/14] drm/msm/a6xx: Simplify min_acc_len calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-topic-ubwc_central-v6-10-c94fa9d12040@oss.qualcomm.com>
References: <20250626-topic-ubwc_central-v6-0-c94fa9d12040@oss.qualcomm.com>
In-Reply-To: <20250626-topic-ubwc_central-v6-0-c94fa9d12040@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928557; l=3209;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=fqy5mvOCxz2r6HQMGGHFm7SBPbvkgv6eghecLNuPiso=;
 b=C7koqnR5xBymeDp64YxyyFa8/uWP9pD9hV47SVNAdaIvB53JqCI0MSJM6J3kNgtdemP+oiiHi
 cPXuhe0EKbEBjcyI7thb3/R78xWjiJS3wk+Oge+mOHVP0kW4J3xp0IB
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

It's only necessary for some lower end parts.
Also rename it to min_acc_len_64b to denote that if set, the minimum
access length is 64 bits, 32b otherwise.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 53493f68ead2113143dab594bfedf492014d5aaa..e16ad298ba1c11ed5b4c70487bc09e23b2ed5cce 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -610,14 +610,12 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (IS_ERR(gpu->common_ubwc_cfg))
 		return PTR_ERR(gpu->common_ubwc_cfg);
 
-	gpu->ubwc_config.min_acc_len = 0;
 	gpu->ubwc_config.ubwc_swizzle = 0x6;
 	gpu->ubwc_config.macrotile_mode = 0;
 	gpu->ubwc_config.highest_bank_bit = 15;
 
 	if (adreno_is_a610(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 13;
-		gpu->ubwc_config.min_acc_len = 1;
 		gpu->ubwc_config.ubwc_swizzle = 0x7;
 	}
 
@@ -663,10 +661,8 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
-	if (adreno_is_a702(gpu)) {
+	if (adreno_is_a702(gpu))
 		gpu->ubwc_config.highest_bank_bit = 14;
-		gpu->ubwc_config.min_acc_len = 1;
-	}
 
 	return 0;
 }
@@ -686,6 +682,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & BIT(1));
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
+	bool min_acc_len_64b = false;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
@@ -693,22 +690,25 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
 		uavflagprd_inv = 2;
 
+	if (adreno_is_a610(adreno_gpu) || adreno_is_a702(adreno_gpu))
+		min_acc_len_64b = true;
+
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |
 		  rgb565_predicator << 11 |
 		  hbb_hi << 10 | amsbc << 4 |
-		  adreno_gpu->ubwc_config.min_acc_len << 3 |
+		  min_acc_len_64b << 3 |
 		  hbb_lo << 1 | ubwc_mode);
 
 	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL,
 		  level2_swizzling_dis << 6 | hbb_hi << 4 |
-		  adreno_gpu->ubwc_config.min_acc_len << 3 |
+		  min_acc_len_64b << 3 |
 		  hbb_lo << 1 | ubwc_mode);
 
 	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 | hbb_hi << 10 |
 		  uavflagprd_inv << 4 |
-		  adreno_gpu->ubwc_config.min_acc_len << 3 |
+		  min_acc_len_64b << 3 |
 		  hbb_lo << 1 | ubwc_mode);
 
 	if (adreno_is_a7xx(adreno_gpu))
@@ -716,7 +716,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 			  FIELD_PREP(GENMASK(8, 5), hbb_lo));
 
 	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
-		  adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo << 21);
+		  min_acc_len_64b << 23 | hbb_lo << 21);
 
 	gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
 		  adreno_gpu->ubwc_config.macrotile_mode);

-- 
2.50.0

