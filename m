Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40065AB0250
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F50C10E94A;
	Thu,  8 May 2025 18:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T442B2qu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063CF10E1AE;
 Thu,  8 May 2025 18:14:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 44B145C5F5F;
 Thu,  8 May 2025 18:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF22C4CEE7;
 Thu,  8 May 2025 18:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746728056;
 bh=8liazP8iiXn0BlZa9oKy5jgXneL3dwluFOB+c9XH1O0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=T442B2quCVUq4CtEWplge7TOiZlAwYluYMad1aRKOb7Jc2h0uklBS2dRkzgItLsc0
 wBS9CTEiFQA3CdIaBdX76AaGR+s0V23TuAIx9w0FHSxJvGxk0GZnYoA4B0fyOMka8N
 Onr20p7hy2Op0zK9puSVYcNgwv+eJUMbkHVpUHH9ZfeYmndwjkqVR+VtSGYF8uUTGK
 SZ7VobkoRZjXUAPH5VMwgdNuNz+x+vlmih5kdO9tvHi4eRhfP1E96lU5ZYLfogBKa2
 22YipNFzVTZDOTnUXVuvVmOIOB1lxdBfwuJMe7uhccKYN9TPhtlqZ7ytb0V5mgnWVK
 Ho0WFMc4rCcqw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 08 May 2025 20:12:43 +0200
Subject: [PATCH RFT 11/14] drm/msm/a6xx: Simplify min_acc_len calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-topic-ubwc_central-v1-11-035c4c5cbe50@oss.qualcomm.com>
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746728002; l=3052;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Fc7S/eINdi/4ICaiJAsRjbgdY8UoVxF5ddDPMtUvVpo=;
 b=uQOcNQjU5nXx0fn/fcfoVExyfyF6IkSbNpyrHnOT8eRnOwaxmAT2dyWJnkX+fE09Qc8dNF0A/
 Jz5ZC2PforqA3QNVs7J4kP3rWImDthxLtYxNushD7fWGCoFF0gO0haG
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

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index bee7e9685aa3ea282fb20ef479e4d243d28418f7..d297890dfba60c6110fb8571e1f46729390302ed 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -592,13 +592,11 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (IS_ERR(gpu->common_ubwc_cfg))
 		return -EINVAL;
 
-	gpu->ubwc_config.min_acc_len = 0;
 	gpu->ubwc_config.ubwc_swizzle = 0x6;
 	gpu->ubwc_config.highest_bank_bit = 2;
 
 	if (adreno_is_a610(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 0;
-		gpu->ubwc_config.min_acc_len = 1;
 		gpu->ubwc_config.ubwc_swizzle = 0x7;
 	}
 
@@ -635,10 +633,8 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (adreno_is_7c3(gpu))
 		gpu->ubwc_config.highest_bank_bit = 1;
 
-	if (adreno_is_a702(gpu)) {
+	if (adreno_is_a702(gpu))
 		gpu->ubwc_config.highest_bank_bit = 1;
-		gpu->ubwc_config.min_acc_len = 1;
-	}
 
 	return 0;
 }
@@ -647,6 +643,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	u8 uavflagprd_inv = adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu) ? 2 : 0;
+	bool min_acc_len_64b = adreno_is_a610(adreno_gpu) || adreno_is_a702(adreno_gpu);
 	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->common_ubwc_cfg;
 	bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
 	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & BIT(1));
@@ -660,18 +657,18 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
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
@@ -679,7 +676,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 			  FIELD_PREP(GENMASK(8, 5), hbb_lo));
 
 	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
-		  adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo << 21);
+		  min_acc_len_64b << 23 | hbb_lo << 21);
 
 	/* The reset value only needs altering in some cases */
 	if (adreno_is_a680(adreno_gpu) || adreno_is_a663(adreno_gpu))

-- 
2.49.0

