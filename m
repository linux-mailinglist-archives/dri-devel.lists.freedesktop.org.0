Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D17DABAB84
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 19:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39F610E10E;
	Sat, 17 May 2025 17:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CK9vRRJN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC8110E19C;
 Sat, 17 May 2025 17:33:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BDEFE614BC;
 Sat, 17 May 2025 17:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27F9C4CEEF;
 Sat, 17 May 2025 17:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747503190;
 bh=Xmf3izPXtFZBDO2EQVsFlK8M75Yuvnk3Cf0Hs2KS2jM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CK9vRRJNjWZr6+HU+DWQ67oAgmbRUK7cqbTnBnWbdYTKgOwL1UXJliR9TTH+Z3vvO
 Q2W22qQmssV0NYfd7NYOuGJfgtNUmM6F0ojqJSi4Xut2nJPUocj+Oq1lyiMU/se6eG
 7Co+WHsRnEN42G0WB81JN1LHjO6kqYPYhw2Y96ZwRpppRvsWin0xOooTpgSZSINpDX
 GZcx9r4mY9sD7jUI70mYoa6XKXqnsAEXf24Sp/6OxoRaPGq0X5lyaGx6a79hXo7lB8
 fLPgTO2qKaEq8o4vWU95OHc9JB2eFpc5PA1nDI3Gy8My01xHqv4WFwLGOdcVb8kmC2
 c71nCCg0ZXy3g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 17 May 2025 19:32:39 +0200
Subject: [PATCH RFT v3 05/14] drm/msm/a6xx: Resolve the meaning of AMSBC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-topic-ubwc_central-v3-5-3c8465565f86@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747503160; l=3323;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=bUN2KQJG8thQHtgztpKDpU7Y9oy0bG689AC32qwvX9k=;
 b=tBPgCKDtdRwdPiP+X055zkofxwAUgOMxGpfW/9Qutdof71znpgpvckEb1fY9pNh8ca0BAhRO4
 F7wcQXrXKppCE4vafTkAx86Os9FzxOY2tRn0BX6jt9unA8COJO2DvUS
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

The bit must be set to 1 if the UBWC encoder version is >= 3.0, drop it
as a separate field.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4399e69bd5156c9d8c6a17213ae02ae03ddae529..7570ead904adfea13b22a63d57d55d7412abb4b8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -617,21 +617,16 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 
 	if (adreno_is_a621(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 13;
-		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 	}
 
 	if (adreno_is_a623(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 16;
-		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
-	if (adreno_is_a640_family(gpu))
-		gpu->ubwc_config.amsbc = 1;
-
 	if (adreno_is_a680(gpu))
 		gpu->ubwc_config.macrotile_mode = 1;
 
@@ -642,7 +637,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	    adreno_is_a740_family(gpu)) {
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
 		gpu->ubwc_config.highest_bank_bit = 16;
-		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
@@ -650,7 +644,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 
 	if (adreno_is_a663(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 13;
-		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
@@ -659,7 +652,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 
 	if (adreno_is_7c3(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 14;
-		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
 	}
@@ -675,6 +667,7 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->common_ubwc_cfg;
 	/*
 	 * We subtract 13 from the highest bank bit (13 is the minimum value
 	 * allowed by hw) and write the lowest two bits of the remaining value
@@ -682,6 +675,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	 */
 	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
 	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
@@ -690,7 +684,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |
 		  adreno_gpu->ubwc_config.rgb565_predicator << 11 |
-		  hbb_hi << 10 | adreno_gpu->ubwc_config.amsbc << 4 |
+		  hbb_hi << 10 | amsbc << 4 |
 		  adreno_gpu->ubwc_config.min_acc_len << 3 |
 		  hbb_lo << 1 | ubwc_mode);
 

-- 
2.49.0

