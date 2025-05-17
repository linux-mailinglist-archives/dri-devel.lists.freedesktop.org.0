Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C9BABAB7B
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 19:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5ED10E191;
	Sat, 17 May 2025 17:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i4Oe6hDj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE1D10E110;
 Sat, 17 May 2025 17:32:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E6430A4E00C;
 Sat, 17 May 2025 17:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFC0C4CEEA;
 Sat, 17 May 2025 17:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747503175;
 bh=8IiJ7TfHpgwzHF1zZolA7SKhmyykwTNJSFjEHGPviYQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=i4Oe6hDj1mrxtBWAVWhPh4j/AhDbXACXwDuqj85B0wu5BIrNqnkFl2UyQrIbu2FsR
 75n0PZRJ+L6VLUc76ArNfCk7c8rXMSz5NIP6thd6gZe7DsfWKQ43CmcauXN0OTT4hk
 5ZfUHwsSFMQjL9SFeT4TNS6DNitO+5oRH9DCypeBG7ee8dbAAnENHsjEgPXKsE9BGZ
 biKgfOAuv/RJA5idN/wTNFA5A47++fnUjK07XEpbWyMUhaXwAuHIgh/LIG96IwBBpj
 5vhnucPSQTJ6DCPnAkFAD9jaj/lq2IEAe3p6IfpQ40CUXGznavoVq44uW9768wxQw3
 xsNTcgDOqKS9w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 17 May 2025 19:32:36 +0200
Subject: [PATCH RFT v3 02/14] drm/msm: Offset MDSS HBB value by 13
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-topic-ubwc_central-v3-2-3c8465565f86@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747503160; l=7276;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=hLzGR3olZDh/aHeaHc3gE9Za/o8UapiYfK6HVRGZaEU=;
 b=o6ls/838znvdNaC82PWEbSmdZUZRBYyoT9IQmw7Jdi/SBAZCq6HCKrl1Eq5LgcaU9FnaOJz/j
 pCgjRsLiyn/DpB15WL6ed27gY5F5sBQR4kgfsOSeYS0iqrjnwOy3yMD
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

The Adreno part of the driver exposes this value to userspace, and the
SMEM data source also presents a x+13 value. Keep things coherent and
make the value uniform across them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 50 +++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 709979fcfab6062c0f316f7655823e888638bfea..2c9531217eca7ac2308c6d1fa78287363ca652f9 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -167,7 +167,7 @@ static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -182,7 +182,7 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (data->macrotile_mode)
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
@@ -200,7 +200,7 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -259,9 +259,9 @@ static const struct msm_mdss_data *msm_mdss_generate_mdp5_mdss_data(struct msm_m
 
 	if (hw_rev == MDSS_HW_MSM8996 ||
 	    hw_rev == MDSS_HW_MSM8998)
-		data->highest_bank_bit = 2;
+		data->highest_bank_bit = 15;
 	else
-		data->highest_bank_bit = 1;
+		data->highest_bank_bit = 14;
 
 	return data;
 }
@@ -572,13 +572,13 @@ static void mdss_remove(struct platform_device *pdev)
 static const struct msm_mdss_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
-	.highest_bank_bit = 2,
+	.highest_bank_bit = 15,
 	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data qcm2290_data = {
 	/* no UBWC */
-	.highest_bank_bit = 0x2,
+	.highest_bank_bit = 15,
 	.reg_bus_bw = 76800,
 };
 
@@ -587,7 +587,7 @@ static const struct msm_mdss_data sa8775p_data = {
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 4,
 	.ubwc_bank_spread = true,
-	.highest_bank_bit = 0,
+	.highest_bank_bit = 13,
 	.macrotile_mode = true,
 	.reg_bus_bw = 74000,
 };
@@ -597,7 +597,7 @@ static const struct msm_mdss_data sar2130p_data = {
 	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
-	.highest_bank_bit = 0,
+	.highest_bank_bit = 13,
 	.macrotile_mode = 1,
 	.reg_bus_bw = 74000,
 };
@@ -607,7 +607,7 @@ static const struct msm_mdss_data sc7180_data = {
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
-	.highest_bank_bit = 0x1,
+	.highest_bank_bit = 14,
 	.reg_bus_bw = 76800,
 };
 
@@ -616,7 +616,7 @@ static const struct msm_mdss_data sc7280_data = {
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
-	.highest_bank_bit = 1,
+	.highest_bank_bit = 14,
 	.macrotile_mode = true,
 	.reg_bus_bw = 74000,
 };
@@ -624,7 +624,7 @@ static const struct msm_mdss_data sc7280_data = {
 static const struct msm_mdss_data sc8180x_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
-	.highest_bank_bit = 3,
+	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 	.reg_bus_bw = 76800,
 };
@@ -634,7 +634,7 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
-	.highest_bank_bit = 3,
+	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 	.reg_bus_bw = 76800,
 };
@@ -642,14 +642,14 @@ static const struct msm_mdss_data sc8280xp_data = {
 static const struct msm_mdss_data sdm670_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
-	.highest_bank_bit = 1,
+	.highest_bank_bit = 14,
 	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
-	.highest_bank_bit = 2,
+	.highest_bank_bit = 15,
 	.reg_bus_bw = 76800,
 };
 
@@ -658,21 +658,21 @@ static const struct msm_mdss_data sm6350_data = {
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
-	.highest_bank_bit = 1,
+	.highest_bank_bit = 14,
 	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sm7150_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
-	.highest_bank_bit = 1,
+	.highest_bank_bit = 14,
 	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sm8150_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
-	.highest_bank_bit = 2,
+	.highest_bank_bit = 15,
 	.reg_bus_bw = 76800,
 };
 
@@ -681,7 +681,7 @@ static const struct msm_mdss_data sm6115_data = {
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 7,
 	.ubwc_bank_spread = true,
-	.highest_bank_bit = 0x1,
+	.highest_bank_bit = 14,
 	.reg_bus_bw = 76800,
 };
 
@@ -689,13 +689,13 @@ static const struct msm_mdss_data sm6125_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = 1,
-	.highest_bank_bit = 1,
+	.highest_bank_bit = 14,
 };
 
 static const struct msm_mdss_data sm6150_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
-	.highest_bank_bit = 1,
+	.highest_bank_bit = 14,
 	.reg_bus_bw = 76800,
 };
 
@@ -705,7 +705,7 @@ static const struct msm_mdss_data sm8250_data = {
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-	.highest_bank_bit = 3,
+	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 	.reg_bus_bw = 76800,
 };
@@ -716,7 +716,7 @@ static const struct msm_mdss_data sm8350_data = {
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-	.highest_bank_bit = 3,
+	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 	.reg_bus_bw = 74000,
 };
@@ -727,7 +727,7 @@ static const struct msm_mdss_data sm8550_data = {
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-	.highest_bank_bit = 3,
+	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 	.reg_bus_bw = 57000,
 };
@@ -738,7 +738,7 @@ static const struct msm_mdss_data x1e80100_data = {
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-	.highest_bank_bit = 3,
+	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 	/* TODO: Add reg_bus_bw with real value */
 };

-- 
2.49.0

