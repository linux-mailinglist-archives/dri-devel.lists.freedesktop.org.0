Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B94CD034D7
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 15:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875C910E74E;
	Thu,  8 Jan 2026 14:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RcrLmkq9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6331E10E74E;
 Thu,  8 Jan 2026 14:22:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CE13560131;
 Thu,  8 Jan 2026 14:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE79C19422;
 Thu,  8 Jan 2026 14:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767882138;
 bh=uDuRuz6holk0p1W5KjXd7ziv9LHNLbMpJvwufQS0xJI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=RcrLmkq93kQ22yZ9KL0tLoCY85RZ5mb861YZWHp9bN/RkkydVX3ta9OkLr98YILsv
 3elplbb62imu+1070aJRrAZxJhTiQp/2HFLzo8Fq32P4haBvIE8sNakstXPoBrQVvE
 wvsqWdfUcYnOtl9+bjPN7zgyQ/Z3rIgZcnUNu/97/dKSR1x3+vKKo7zDe/MG352YLM
 eh5mPiQzXY91FJv+ZIaHb7x5K//xv5me5mfxBHkLFnVFxfwILllRGiThqOS3Lc8Pgy
 M6Lv3olL+rYlZ+EMX+lWOKWZcQVJdkg6FuRMhammC/Dw4GLqafKJrwWMpltXbAR+qk
 IRE6ajaoclBiw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 08 Jan 2026 15:21:51 +0100
Subject: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
In-Reply-To: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767882123; l=9485;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=PNGfZ45coN1C/o+QL9ZexnumgXEWcaMR9QTIU53QLLI=;
 b=HIkBEggRFxaEVDk+SXDG8YmOReIY+FoLieMqX0aAIL8ImBlyKUPBmw/dPNneUFtXWfUt/K7zG
 8MsZqEIwSnYC/kv+n417iT/cgfrOMgDr2dua/tB9KaQu43py9AxKaF4
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

To make sure the correct settings for a given DRAM configuration get
applied, attempt to retrieve that data from SMEM (which happens to be
what the BSP kernel does, albeit with through convoluted means of the
bootloader altering the DT with this data).

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

---
I'm not sure about this approach - perhaps a global variable storing
the selected config, which would then be non-const would be better?
---
 drivers/soc/qcom/ubwc_config.c | 69 ++++++++++++++++++++++++++----------------
 1 file changed, 43 insertions(+), 26 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1c25aaf55e52..21bb444dc27c 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -11,12 +11,13 @@
 #include <linux/platform_device.h>
 
 #include <linux/soc/qcom/ubwc.h>
+#include <linux/soc/qcom/smem.h>
 
-static const struct qcom_ubwc_cfg_data no_ubwc_data = {
+static struct qcom_ubwc_cfg_data no_ubwc_data = {
 	/* no UBWC, no HBB */
 };
 
-static const struct qcom_ubwc_cfg_data kaanapali_data = {
+static struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
 	.ubwc_dec_version = UBWC_6_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -26,7 +27,7 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data msm8937_data = {
+static struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
@@ -35,7 +36,7 @@ static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data msm8998_data = {
+static struct qcom_ubwc_cfg_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
@@ -44,12 +45,12 @@ static const struct qcom_ubwc_cfg_data msm8998_data = {
 	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data qcm2290_data = {
+static struct qcom_ubwc_cfg_data qcm2290_data = {
 	/* no UBWC */
 	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data sa8775p_data = {
+static struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
@@ -58,7 +59,7 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data sar2130p_data = {
+static struct qcom_ubwc_cfg_data sar2130p_data = {
 	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
 	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -68,7 +69,7 @@ static const struct qcom_ubwc_cfg_data sar2130p_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data sc7180_data = {
+static struct qcom_ubwc_cfg_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -77,7 +78,7 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sc7280_data = {
+static struct qcom_ubwc_cfg_data sc7280_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -87,7 +88,7 @@ static const struct qcom_ubwc_cfg_data sc7280_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data sc8180x_data = {
+static struct qcom_ubwc_cfg_data sc8180x_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -96,7 +97,7 @@ static const struct qcom_ubwc_cfg_data sc8180x_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data sc8280xp_data = {
+static struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -106,7 +107,7 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data sdm670_data = {
+static struct qcom_ubwc_cfg_data sdm670_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -114,7 +115,7 @@ static const struct qcom_ubwc_cfg_data sdm670_data = {
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sdm845_data = {
+static struct qcom_ubwc_cfg_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -122,7 +123,7 @@ static const struct qcom_ubwc_cfg_data sdm845_data = {
 	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data sm6115_data = {
+static struct qcom_ubwc_cfg_data sm6115_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
@@ -132,7 +133,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sm6125_data = {
+static struct qcom_ubwc_cfg_data sm6125_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
@@ -141,7 +142,7 @@ static const struct qcom_ubwc_cfg_data sm6125_data = {
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sm6150_data = {
+static struct qcom_ubwc_cfg_data sm6150_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -149,7 +150,7 @@ static const struct qcom_ubwc_cfg_data sm6150_data = {
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sm6350_data = {
+static struct qcom_ubwc_cfg_data sm6350_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -158,7 +159,7 @@ static const struct qcom_ubwc_cfg_data sm6350_data = {
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sm7150_data = {
+static struct qcom_ubwc_cfg_data sm7150_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -166,7 +167,7 @@ static const struct qcom_ubwc_cfg_data sm7150_data = {
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sm8150_data = {
+static struct qcom_ubwc_cfg_data sm8150_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -174,7 +175,7 @@ static const struct qcom_ubwc_cfg_data sm8150_data = {
 	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data sm8250_data = {
+static struct qcom_ubwc_cfg_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -185,7 +186,7 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data sm8350_data = {
+static struct qcom_ubwc_cfg_data sm8350_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -196,7 +197,7 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data sm8550_data = {
+static struct qcom_ubwc_cfg_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -207,7 +208,7 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data sm8750_data = {
+static struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_enc_version = UBWC_5_0,
 	.ubwc_dec_version = UBWC_5_0,
 	.ubwc_swizzle = 6,
@@ -217,7 +218,7 @@ static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data x1e80100_data = {
+static struct qcom_ubwc_cfg_data x1e80100_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -301,14 +302,30 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 
 const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
 {
-	const struct qcom_ubwc_cfg_data *data;
+	struct qcom_ubwc_cfg_data *data;
+	int hbb;
 
-	data = of_machine_get_match_data(qcom_ubwc_configs);
+	if (!qcom_smem_is_available())
+		return ERR_PTR(-EPROBE_DEFER);
+
+	/* Discard the const qualifier, but still return a const pointer to consumers */
+	data = (struct qcom_ubwc_cfg_data *)of_machine_get_match_data(qcom_ubwc_configs);
 	if (!data) {
 		pr_err("Couldn't find UBWC config data for this platform!\n");
 		return ERR_PTR(-EINVAL);
 	}
 
+	hbb = qcom_smem_dram_get_hbb();
+	if (hbb == -ENODATA) {
+		/* Lack of HBB data is OK - it was only introduced later */
+		return data;
+	} else if (hbb < 0) {
+		pr_err("Couldn't get HBB data from SMEM: %d\n", hbb);
+		return ERR_PTR(hbb);
+	}
+
+	data->highest_bank_bit = hbb;
+
 	return data;
 }
 EXPORT_SYMBOL_GPL(qcom_ubwc_config_get_data);

-- 
2.52.0

