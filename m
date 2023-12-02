Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7604F801F2D
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 23:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E1E10E22F;
	Sat,  2 Dec 2023 22:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592C410E238
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 22:42:53 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50be4f03b06so994311e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 14:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701556971; x=1702161771; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F60WGVzSyw8ZAyBBSZRfJ8j084J+A5mcN0DSUk2L02s=;
 b=mwdsXSqB4jaly5pAiED7/zoXi/+0BQ7Ip6C+KPYPokSCKm6NWf+uU3w4b43SbR03Ib
 XB4dDqxKfcP0w9iKd0CAoAvBTXEWQeEeGmSpJTIAf20MVPq0PlF82T3w52ceqILE8wdK
 VsqqxU3p/KQf5icVd+FdIsDvePhPwztSfu94/FRh4dCwTr9XHYpMEHNG/lDGDxeFTay1
 wREOiJqOISxqwNZ2zDUB1l5Lr+4aa6dKcmP7LNCyER/3XfCprr4ZGRjRD5D3vLrtHops
 YJwYQM3sgK0QTSaxwOGaKpjb8+3C0WyHA7qT56/2sXTBSpw2dZL4UdabULMu1vhznOCj
 vVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701556971; x=1702161771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F60WGVzSyw8ZAyBBSZRfJ8j084J+A5mcN0DSUk2L02s=;
 b=gsNu7r4gT++w74tAxAKHGY1qe5RbqDznji5YzSsm5k7tA5gu5UfmK8kuENh996acQb
 k29mHc6alfEnfh3fhWkOeF4U4M/356Q6KXAgascx+pSqshl3qoooYxIlQ/fZQiR91Oj0
 H1O+rpDOT0aNj3eIATuXQZfu3sowDBFt3BWXnJT4xCeNTXoj/voGMs+71Twbiow+puaH
 HXpa2FXRPB8oMw46iMqK3xk7XOOOg6Rdo6PawqZTQ7XMSvdt81u6qsd3ORncmWw1oaHD
 CALD0CU+FMwQe04LkIMxh5NjhPwl7M1PZRRBShuKAINjFocwE8yvx0q7s2017mtdlcFe
 0s6w==
X-Gm-Message-State: AOJu0YzBpzZnzL83EXhH3eSDLCcM+xBXsRoJ7/K6m9AuOSJl5Wko7C9a
 dy3mb57xV4pWl6pDOq2UL1678Q==
X-Google-Smtp-Source: AGHT+IH3k5kN0DMHoRKb0i348vqgiuzpUSRHtY5AZJwhNYCx+JKo+PTwlB3/BShhwQbvIzoD66pnWA==
X-Received: by 2002:ac2:47f2:0:b0:50b:d764:2904 with SMTP id
 b18-20020ac247f2000000b0050bd7642904mr1214606lfp.156.1701556971486; 
 Sat, 02 Dec 2023 14:42:51 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a056512051400b0050bed700f5esm187015lfb.91.2023.12.02.14.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 14:42:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 4/4] drm/msm/mdss: Handle the reg bus ICC path
Date: Sun,  3 Dec 2023 01:42:47 +0300
Message-Id: <20231202224247.1282567-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
References: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
another path that needs to be handled to ensure MDSS functions properly,
namely the "reg bus", a.k.a the CPU-MDSS interconnect.

Gating that path may have a variety of effects, from none to otherwise
inexplicable DSI timeouts.

Provide a way for MDSS driver to vote on this bus.

A note regarding vote values. Newer platforms have corresponding
bandwidth values in the vendor DT files. For the older platforms there
was a static vote in the mdss_mdp and rotator drivers. I choose to be
conservative here and choose this value as a default.

Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 49 +++++++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_mdss.h |  1 +
 2 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index eeca281e9d6d..18b07619d6fc 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -28,6 +28,8 @@
 
 #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
 
+#define DEFAULT_REG_BW	153600 /* Used in mdss fbdev driver */
+
 struct msm_mdss {
 	struct device *dev;
 
@@ -42,6 +44,7 @@ struct msm_mdss {
 	const struct msm_mdss_data *mdss_data;
 	struct icc_path *mdp_path[2];
 	u32 num_mdp_paths;
+	struct icc_path *reg_bus_path;
 };
 
 static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
@@ -49,6 +52,7 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 {
 	struct icc_path *path0;
 	struct icc_path *path1;
+	struct icc_path *reg_bus_path;
 
 	path0 = devm_of_icc_get(dev, "mdp0-mem");
 	if (IS_ERR_OR_NULL(path0))
@@ -63,6 +67,10 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 		msm_mdss->num_mdp_paths++;
 	}
 
+	reg_bus_path = of_icc_get(dev, "cpu-cfg");
+	if (!IS_ERR_OR_NULL(reg_bus_path))
+		msm_mdss->reg_bus_path = reg_bus_path;
+
 	return 0;
 }
 
@@ -229,6 +237,13 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
 		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(MIN_IB_BW));
 
+	if (msm_mdss->mdss_data && msm_mdss->mdss_data->reg_bus_bw)
+		icc_set_bw(msm_mdss->reg_bus_path, 0,
+			   msm_mdss->mdss_data->reg_bus_bw);
+	else
+		icc_set_bw(msm_mdss->reg_bus_path, 0,
+			   DEFAULT_REG_BW);
+
 	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
 		dev_err(msm_mdss->dev, "clock enable failed, ret:%d\n", ret);
@@ -286,6 +301,9 @@ static int msm_mdss_disable(struct msm_mdss *msm_mdss)
 	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
 		icc_set_bw(msm_mdss->mdp_path[i], 0, 0);
 
+	if (msm_mdss->reg_bus_path)
+		icc_set_bw(msm_mdss->reg_bus_path, 0, 0);
+
 	return 0;
 }
 
@@ -372,6 +390,8 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 	if (!msm_mdss)
 		return ERR_PTR(-ENOMEM);
 
+	msm_mdss->mdss_data = of_device_get_match_data(&pdev->dev);
+
 	msm_mdss->mmio = devm_platform_ioremap_resource_byname(pdev, is_mdp5 ? "mdss_phys" : "mdss");
 	if (IS_ERR(msm_mdss->mmio))
 		return ERR_CAST(msm_mdss->mmio);
@@ -462,8 +482,6 @@ static int mdss_probe(struct platform_device *pdev)
 	if (IS_ERR(mdss))
 		return PTR_ERR(mdss);
 
-	mdss->mdss_data = of_device_get_match_data(&pdev->dev);
-
 	platform_set_drvdata(pdev, mdss);
 
 	/*
@@ -495,11 +513,13 @@ static const struct msm_mdss_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
 	.highest_bank_bit = 2,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data qcm2290_data = {
 	/* no UBWC */
 	.highest_bank_bit = 0x2,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sc7180_data = {
@@ -507,6 +527,7 @@ static const struct msm_mdss_data sc7180_data = {
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_static = 0x1e,
 	.highest_bank_bit = 0x3,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sc7280_data = {
@@ -516,6 +537,7 @@ static const struct msm_mdss_data sc7280_data = {
 	.ubwc_static = 1,
 	.highest_bank_bit = 1,
 	.macrotile_mode = 1,
+	.reg_bus_bw = 74000,
 };
 
 static const struct msm_mdss_data sc8180x_data = {
@@ -523,6 +545,7 @@ static const struct msm_mdss_data sc8180x_data = {
 	.ubwc_dec_version = UBWC_3_0,
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sc8280xp_data = {
@@ -532,12 +555,14 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.ubwc_static = 1,
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.highest_bank_bit = 2,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sm6350_data = {
@@ -546,12 +571,14 @@ static const struct msm_mdss_data sm6350_data = {
 	.ubwc_swizzle = 6,
 	.ubwc_static = 0x1e,
 	.highest_bank_bit = 1,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sm8150_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.highest_bank_bit = 2,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sm6115_data = {
@@ -560,6 +587,7 @@ static const struct msm_mdss_data sm6115_data = {
 	.ubwc_swizzle = 7,
 	.ubwc_static = 0x11f,
 	.highest_bank_bit = 0x1,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sm6125_data = {
@@ -577,6 +605,18 @@ static const struct msm_mdss_data sm8250_data = {
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
+	.reg_bus_bw = 76800,
+};
+
+static const struct msm_mdss_data sm8350_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 1,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = 1,
+	.reg_bus_bw = 74000,
 };
 
 static const struct msm_mdss_data sm8550_data = {
@@ -587,6 +627,7 @@ static const struct msm_mdss_data sm8550_data = {
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
+	.reg_bus_bw = 57000,
 };
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
@@ -603,8 +644,8 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm6375-mdss", .data = &sm6350_data },
 	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
 	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
-	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },
-	{ .compatible = "qcom,sm8450-mdss", .data = &sm8250_data },
+	{ .compatible = "qcom,sm8350-mdss", .data = &sm8350_data },
+	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
 	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
 	{}
 };
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
index 02bbab42adbc..3afef4b1786d 100644
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -14,6 +14,7 @@ struct msm_mdss_data {
 	u32 ubwc_static;
 	u32 highest_bank_bit;
 	u32 macrotile_mode;
+	u32 reg_bus_bw;
 };
 
 #define UBWC_1_0 0x10000000
-- 
2.39.2

