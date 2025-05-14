Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDDFAB6F23
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 17:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFE410E26D;
	Wed, 14 May 2025 15:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ElU4asIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC1410E685;
 Wed, 14 May 2025 15:11:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A79DC5C6152;
 Wed, 14 May 2025 15:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C917C4CEED;
 Wed, 14 May 2025 15:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747235491;
 bh=lYaGbx2VnhKo6X1FOzUp2xQ+2GU2i23LpGCoC5C4kvc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ElU4asIK+UlcAY92/OP+e+k/onI8Yc6Sq/L67ku79gQjmLa4X1K4gZKOvkzLBaTv7
 4QiToBm6pFxab/mIiIhVQeB2YCQWu80p69d6yVLX6BIItvUagj+4gEoYTbphTQJ/vq
 GdtHsocGnQZ+U6HDXzGnlKsd1ZEji3HZDTXrl0b6u6ZggLGyKOgOrswCy3ERNez3U5
 TQbEvNfSar7m02/Ullv8ldZBovB6A/Xs+68VtucJ0tVXjRYwyJ2+7ogNlwonW9p0QM
 GSRC/qClehn/JlPSiU21iL/Vzj9ik/b0m1vyK/AK52r+CEjCDonV1TcqGXYh2tEn4w
 pd4luwIR3eEbw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 May 2025 17:10:29 +0200
Subject: [PATCH RFT v2 09/15] drm/msm/a6xx: Resolve the meaning of
 rgb565_predicator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topic-ubwc_central-v2-9-09ecbc0a05ce@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
In-Reply-To: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747235442; l=2420;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=KZjR/7FrP0LxsKBAjVMSyj1wk57rB6G7FY5USnkv3Fo=;
 b=uuZH1DYC8mMMmIZd3P98pZwOKmEq+5w0uwBHBF28oCPZEqw8iYi0YABLqV49qYIocPTWxhSgX
 SQPXosRN98SAd40muE3IkqEeACapM7lafLzES7dHAxugWQmGDixuXBS
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
index 0a08837ab01b724489baeb217cc49779ddcdf146..5ee5f8dc90fe0d1647ce07b7dbcadc6ca2ecd416 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -592,7 +592,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (IS_ERR(gpu->common_ubwc_cfg))
 		return -EINVAL;
 
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
@@ -669,6 +665,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	 */
 	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
 	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & BIT(1));
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
@@ -677,7 +674,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |
-		  adreno_gpu->ubwc_config.rgb565_predicator << 11 |
+		  rgb565_predicator << 11 |
 		  hbb_hi << 10 | amsbc << 4 |
 		  adreno_gpu->ubwc_config.min_acc_len << 3 |
 		  hbb_lo << 1 | ubwc_mode);

-- 
2.49.0

