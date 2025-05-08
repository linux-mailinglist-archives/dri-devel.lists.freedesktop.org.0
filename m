Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5664AB024D
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1099C10E94E;
	Thu,  8 May 2025 18:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c81xgx+f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8246F10E953;
 Thu,  8 May 2025 18:14:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 61FCA44306;
 Thu,  8 May 2025 18:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BC7C4CEE7;
 Thu,  8 May 2025 18:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746728051;
 bh=P3CAccmQOpyaTriYllajUgj/8OsbOl7gbCPh5wyAPJM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=c81xgx+fiy6dgffAG6iBHvXCl4/CSxdEv/zztbSE+KxruEjqGk+v7YI2jBP/fMfYh
 EfLLpqyExuFypIznD0X3w89IlcSfa1YYGFJCGBrNH8pZiDI6QXpuXVs4UC0wdYkW3a
 4QeSf2pVBgTY87SXhAFKIv/mCnjyHVZVLcvJ+8b78I4CnJn6Odqx95v7nWlGUEX/Sy
 ArOgTtQimusvb2ij9BLu5ZErhVagw5hiVrQP5V4tgJjjkIDpiSvUQc/HoD1VlzFeSV
 cldQ6CtExlRNhVivLkDcJaKABtjGSwtZvv95qroyU11EgrbY3k9rMu8hINFqd3ae17
 KcQyXASdvZ+8A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 08 May 2025 20:12:42 +0200
Subject: [PATCH RFT 10/14] drm/msm/a6xx: Stop tracking macrotile_mode (again)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-topic-ubwc_central-v1-10-035c4c5cbe50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746728002; l=2664;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=fEi+/pRUWH3fcysAlmiv3GwevfiZcPYFy+z1RfmmQ+M=;
 b=7O9OisKq54zQDkxOW769oCsZ4KdFIAJ6o+e5RqglfIl8U7x05Dq/O6hs5KOCWJ728lr7YIASf
 MVTFttllawjAdBgfK6I4KGu0OaN8LkiUBvCdY6Ynzpiuh1GUMEu1b7P
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

SC8180X (A680) and SA8775P (A663) require a write to that register,
while other SKUs are fine with the default value. Don't overwrite it
needlessly, requiring the developer to read the value back from
hardware just to put it in the driver again, introducing much more room
for error.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 60f89a2d851a5c383fc14cce4c483f630132a9a6..bee7e9685aa3ea282fb20ef479e4d243d28418f7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -594,7 +594,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 
 	gpu->ubwc_config.min_acc_len = 0;
 	gpu->ubwc_config.ubwc_swizzle = 0x6;
-	gpu->ubwc_config.macrotile_mode = 0;
 	gpu->ubwc_config.highest_bank_bit = 2;
 
 	if (adreno_is_a610(gpu)) {
@@ -616,13 +615,8 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (adreno_is_a621(gpu))
 		gpu->ubwc_config.highest_bank_bit = 0;
 
-	if (adreno_is_a623(gpu)) {
+	if (adreno_is_a623(gpu))
 		gpu->ubwc_config.highest_bank_bit = 3;
-		gpu->ubwc_config.macrotile_mode = 1;
-	}
-
-	if (adreno_is_a680(gpu))
-		gpu->ubwc_config.macrotile_mode = 1;
 
 	if (adreno_is_a650(gpu) ||
 	    adreno_is_a660(gpu) ||
@@ -631,19 +625,15 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	    adreno_is_a740_family(gpu)) {
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
 		gpu->ubwc_config.highest_bank_bit = 3;
-		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
 	if (adreno_is_a663(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 0;
-		gpu->ubwc_config.macrotile_mode = 1;
 		gpu->ubwc_config.ubwc_swizzle = 0x4;
 	}
 
-	if (adreno_is_7c3(gpu)) {
+	if (adreno_is_7c3(gpu))
 		gpu->ubwc_config.highest_bank_bit = 1;
-		gpu->ubwc_config.macrotile_mode = 1;
-	}
 
 	if (adreno_is_a702(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 1;
@@ -691,8 +681,9 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
 		  adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo << 21);
 
-	gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
-		  adreno_gpu->ubwc_config.macrotile_mode);
+	/* The reset value only needs altering in some cases */
+	if (adreno_is_a680(adreno_gpu) || adreno_is_a663(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL, BIT(0));
 }
 
 static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)

-- 
2.49.0

