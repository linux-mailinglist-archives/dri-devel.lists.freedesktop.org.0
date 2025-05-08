Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED481AB023F
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DC610E944;
	Thu,  8 May 2025 18:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wa1puvwD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4F410E947;
 Thu,  8 May 2025 18:13:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ADE0CA4E141;
 Thu,  8 May 2025 18:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3AB7C4CEEE;
 Thu,  8 May 2025 18:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746728028;
 bh=2n7Xb2GJXoTNjWVaIHHp40CW/ySKabjkTPPfcRdF8Bo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Wa1puvwDmCcCVzB2Q7vCb9WwMlWHqsSEuRptmbcyVSDOG64qBwKV/w/wRKnPahAog
 YobzLJGDsJ8lDpKsqu6z6/x0p2soWZ4xGrPfV+eSOgRMlOo1fd7PYeV+/c18HxXvew
 EhdABdbS+7O3FFyXrQAf0IJ3VGJ5Ta9mtXdbBHmw5wP7jGD2qBkR0JfWhwezSr10aH
 XJMdsrSbocJ+xKvL0n2lNKOK/ZWuNvysLGBj2Del3RON8WKjmS2UHGZQxDtZrJ36QT
 AFkb8O5rBVn3SvVoQBdl/+PQrNdv+eWwkWgokO+V69OkhZeIkNnYOOLIjDnEcsy/q/
 W3VsXdiaag/xg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 08 May 2025 20:12:37 +0200
Subject: [PATCH RFT 05/14] drm/msm/a6xx: Resolve the meaning of AMSBC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-topic-ubwc_central-v1-5-035c4c5cbe50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746728002; l=3021;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=lOOhIGMEMtxwXLn8PJZj5/WHTRWR+s+rfoTJ83oqth0=;
 b=BvSt6fXsK771Xd7IXiSXaieaVN4W8J7zyUFJ7ELrDpEtPQXG/z8WZoKKlFyrGrtiG7vAZCyKP
 0BlH8exCmp4CcuzaAVXNOfAy8gNQ0T5JBVQyhtgSzFQuLRah+Z3w1wT
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
index 89eb725f0950f3679d6214366cfbd22d5bcf4bc7..5fe0e8e72930320282a856e1ff77994865360854 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -617,21 +617,16 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 
 	if (adreno_is_a621(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 0;
-		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 	}
 
 	if (adreno_is_a623(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 3;
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
 		gpu->ubwc_config.highest_bank_bit = 3;
-		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
@@ -650,7 +644,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 
 	if (adreno_is_a663(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 0;
-		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
@@ -659,7 +652,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 
 	if (adreno_is_7c3(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 1;
-		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
 	}
@@ -675,7 +667,9 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->common_ubwc_cfg;
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit;
+	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
 	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
@@ -684,7 +678,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |
 		  adreno_gpu->ubwc_config.rgb565_predicator << 11 |
-		  hbb_hi << 10 | adreno_gpu->ubwc_config.amsbc << 4 |
+		  hbb_hi << 10 | amsbc << 4 |
 		  adreno_gpu->ubwc_config.min_acc_len << 3 |
 		  hbb_lo << 1 | ubwc_mode);
 

-- 
2.49.0

