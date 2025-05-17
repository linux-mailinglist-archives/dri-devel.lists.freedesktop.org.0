Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04ADABAB99
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 19:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3159310E2B3;
	Sat, 17 May 2025 17:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eQaH5UTL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F92410E2B3;
 Sat, 17 May 2025 17:33:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 05C694A69B;
 Sat, 17 May 2025 17:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489ECC4CEE3;
 Sat, 17 May 2025 17:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747503227;
 bh=pWo1sshO5qtwhAq7lClzQJnCihuy5mpdV1HNzw5fEtg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=eQaH5UTL6+VzKFztKjI8Hu2IYOO1iiUu5ukR3jLUnlFNM2HoK1gXBECOnanCQ5rYS
 LOGTltq2C6QvoJeXNm4YeankE6buHbCUoxF8j13gRF24HyNAA+3HHh8T/n2ON6W1fw
 lnyEtMvKqZ99MDaHCb6enUXX+7W46yfsO0mdvu6DcI3X/VAKxDAgrMCSlutaDobpPG
 4qaVDfp0TsT1lC8b5zYvAvAp40J3cvHLQyHGVuBShK/sTs5WfitANQCUaZEAImzjNp
 tmNuWaztWhfc084W8sSR3HsQBTUf0Ap/pyRj57Y+rMucbitM6yjd5rLGqMWiNEHe6z
 U2m4b2rxb62KQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 17 May 2025 19:32:47 +0200
Subject: [PATCH RFT v3 13/14] soc: qcom: ubwc: Fill in UBWC swizzle cfg for
 platforms that lack one
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-topic-ubwc_central-v3-13-3c8465565f86@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747503160; l=2845;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=9sHpdGhgOJN64BZs9OEBlUSTYlkbV18NJzetyyeaiJE=;
 b=ytGl4OPgNeDOsuLVgmzaf4zRu588NeB8IMgp2aMNVMy4ZSKHOohxFyl61NEvxiHa1MZOe+sHK
 FhywxDnRoc2DcjgI7w+IGV3drmzSZNcQJEb3PRlybrAIVvrmI9/n17v
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

The UBWC 1.0 case is easy - it must be all 3 enabled.
UBWC2.0 and 3.x require that level1 is removed, follow suit.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index fe874ccd8df6acb4fac65f7d261afb05861117c2..a4b730dac6c4aaa609d41b2782c9dc522387d8dd 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -15,12 +15,18 @@
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
+			UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
+			UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 
@@ -70,6 +76,8 @@ static const struct qcom_ubwc_cfg_data sc7280_data = {
 static const struct qcom_ubwc_cfg_data sc8180x_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 };
@@ -87,12 +95,16 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 static const struct qcom_ubwc_cfg_data sdm670_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 
@@ -118,6 +130,8 @@ static const struct qcom_ubwc_cfg_data sm6125_data = {
 static const struct qcom_ubwc_cfg_data sm6150_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
@@ -133,12 +147,16 @@ static const struct qcom_ubwc_cfg_data sm6350_data = {
 static const struct qcom_ubwc_cfg_data sm7150_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm8150_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 

-- 
2.49.0

