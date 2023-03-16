Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2191A6BC9E7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 09:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0972010EC6C;
	Thu, 16 Mar 2023 08:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E7A10EA4C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 08:51:15 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id b13so846556ljf.6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 01:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678956675;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6mz7dhLEVkKzAk8Lkvywe3WYisGA69PWt7jvCUOITN8=;
 b=DDPaJtHjcKpwFgphAHT7tW3YyX/ZBZFs4Kfd67iuNJukELpZtr1GakaX95MMe2hU+C
 MJGmgh1of7xVfJv/Lms4bnw93C/LwMOS9I2SH768wi7fOcwsngjxP/1AePDbgBeATAnc
 xUyoPUu8BcDvx4DYTZszrlhHsiIFh0XejBvuLq0TkdEYeFTwSt53y3g0f2QLDrtKTrKw
 5LQornKEDn/SIK7JKDi9ThjgpZ1r9PRN2rMEFYQynLHr7crxITBT7TLUL6EOkLO7JKns
 BV4JfqXr0dV96PRYElzqil3YSbwyDdt8gzjyx50rGEwdOfkot6BWZuWD+jwJyCCWPNAT
 ZCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678956675;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6mz7dhLEVkKzAk8Lkvywe3WYisGA69PWt7jvCUOITN8=;
 b=oTWumy3hhllCa7ZfSV8v4EEUxfrSSqYcDGX6U1pxzRr0K3S8I1c8kvTMfeSzpLAVKx
 UKGh7MaFyxFjcVlXHmeNXFxOpe5MceojwTaPLKXd4b79xI81LF4lxw9C8QQm7lUpjS3E
 3Fzv8pKl8GpmaqF9E2kY+pQ9GKmFTkgWaUAFt04Q7RtazlPa7NO+BprqdRelvN8eEtVZ
 LV2y/0jv+VxfBaiPBW69cbBeRMjmRK3FbQTITyVXrf8qJ++9lG0Gf3G/mJxeKSmnIdGu
 zwY3lQLT2B6f0J+rMNoue1wPv7ROk5TD68zWtMj8eddskzrI3TF9zWP7LuTC+vZM+OtV
 SWtw==
X-Gm-Message-State: AO0yUKWDc7WyrgEN8cO5X2gBlgv/Nk6G1mNgV0np7ndkYgLvZFEI+pzk
 zJhUgS6YBEncIJba4IMedSMUOw==
X-Google-Smtp-Source: AK7set8vkS0/WTMiuDNm5CkepqrjuOp/Ku/zc1qtlVzt/yUlysd+xxS5s/J7UWC2d8eolWAWI73Iug==
X-Received: by 2002:a05:651c:2228:b0:299:67d8:9f7a with SMTP id
 y40-20020a05651c222800b0029967d89f7amr752102ljq.5.1678956675474; 
 Thu, 16 Mar 2023 01:51:15 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a2e730b000000b002991baef49bsm251566ljc.12.2023.03.16.01.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:51:15 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 16 Mar 2023 09:51:09 +0100
Subject: [PATCH v5 03/10] drm/msm/dsi: Fix DSI index detection when version
 clash occurs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v5-3-9d4235b77f4f@linaro.org>
References: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678956668; l=8216;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=b+otjvnFVNWNHQbPO9HD+5KH7xMK3hiBo7WDBK4sSP4=;
 b=zcYTSWk9trCd7D8dSdCu9WiEcEvyemZhiibqk3qRm4btFIPGbbejZOnG5Dr/fOBmtZqtARwLme+v
 cmwIntkeAoYq0GWtjSdwnKc1oX/DsFhNqMjEa8wFIVy+o6n4EpoQ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, we allow for MAX_DSI entries in io_start to facilitate for
MAX_DSI number of DSI hosts at different addresses. The configuration
is matched against the DSI CTRL hardware revision read back from the
component. We need a way to resolve situations where multiple SoCs
with different register maps may use the same version of DSI CTRL. In
preparation to do so, make msm_dsi_config a 2d array where each entry
represents a set of configurations adequate for a given SoC.

This is totally fine to do, as the only differentiating factors
between same-version-different-SoCs configurations are the number of
DSI hosts (1 or 2, at least as of today) and the set of base registers.
The regulator setup is the same, because the DSI hardware is the same,
regardless of the SoC it was implemented in.

In addition to that, update the matching logic such that it will loop
over VARIANTS_MAX variants, making sure they are all taken into account.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 52 ++++++++++++++++++++++++++++----------
 drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  5 +++-
 drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++----
 3 files changed, 48 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 4515f52b407a..6c192963c100 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -21,7 +21,9 @@ static const struct msm_dsi_config apq8064_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(apq8064_dsi_regulators),
 	.bus_clk_names = dsi_v2_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_v2_bus_clk_names),
-	.io_start = { 0x4700000, 0x5800000 },
+	.io_start = {
+		{ 0x4700000, 0x5800000 },
+	},
 };
 
 static const char * const dsi_6g_bus_clk_names[] = {
@@ -40,7 +42,9 @@ static const struct msm_dsi_config msm8974_apq8084_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(msm8974_apq8084_regulators),
 	.bus_clk_names = dsi_6g_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
-	.io_start = { 0xfd922800, 0xfd922b00 },
+	.io_start = {
+		{ 0xfd922800, 0xfd922b00 },
+	},
 };
 
 static const char * const dsi_8916_bus_clk_names[] = {
@@ -58,7 +62,9 @@ static const struct msm_dsi_config msm8916_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(msm8916_dsi_regulators),
 	.bus_clk_names = dsi_8916_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_8916_bus_clk_names),
-	.io_start = { 0x1a98000 },
+	.io_start = {
+		{ 0x1a98000 },
+	},
 };
 
 static const char * const dsi_8976_bus_clk_names[] = {
@@ -76,7 +82,9 @@ static const struct msm_dsi_config msm8976_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(msm8976_dsi_regulators),
 	.bus_clk_names = dsi_8976_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_8976_bus_clk_names),
-	.io_start = { 0x1a94000, 0x1a96000 },
+	.io_start = {
+		{ 0x1a94000, 0x1a96000 },
+	},
 };
 
 static const struct regulator_bulk_data msm8994_dsi_regulators[] = {
@@ -94,7 +102,9 @@ static const struct msm_dsi_config msm8994_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(msm8994_dsi_regulators),
 	.bus_clk_names = dsi_6g_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
-	.io_start = { 0xfd998000, 0xfd9a0000 },
+	.io_start = {
+		{ 0xfd998000, 0xfd9a0000 },
+	},
 };
 
 static const char * const dsi_8996_bus_clk_names[] = {
@@ -113,7 +123,9 @@ static const struct msm_dsi_config msm8996_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(msm8996_dsi_regulators),
 	.bus_clk_names = dsi_8996_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_8996_bus_clk_names),
-	.io_start = { 0x994000, 0x996000 },
+	.io_start = {
+		{ 0x994000, 0x996000 },
+	},
 };
 
 static const char * const dsi_msm8998_bus_clk_names[] = {
@@ -131,7 +143,9 @@ static const struct msm_dsi_config msm8998_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(msm8998_dsi_regulators),
 	.bus_clk_names = dsi_msm8998_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_msm8998_bus_clk_names),
-	.io_start = { 0xc994000, 0xc996000 },
+	.io_start = {
+		{ 0xc994000, 0xc996000 },
+	},
 };
 
 static const char * const dsi_sdm660_bus_clk_names[] = {
@@ -148,7 +162,9 @@ static const struct msm_dsi_config sdm660_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(sdm660_dsi_regulators),
 	.bus_clk_names = dsi_sdm660_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sdm660_bus_clk_names),
-	.io_start = { 0xc994000, 0xc996000 },
+	.io_start = {
+		{ 0xc994000, 0xc996000 },
+	},
 };
 
 static const char * const dsi_sdm845_bus_clk_names[] = {
@@ -169,7 +185,9 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(sdm845_dsi_regulators),
 	.bus_clk_names = dsi_sdm845_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
-	.io_start = { 0xae94000, 0xae96000 },
+	.io_start = {
+		{ 0xae94000, 0xae96000 },
+	},
 };
 
 static const struct regulator_bulk_data sm8550_dsi_regulators[] = {
@@ -182,7 +200,9 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(sm8550_dsi_regulators),
 	.bus_clk_names = dsi_sdm845_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
-	.io_start = { 0xae94000, 0xae96000 },
+	.io_start = {
+		{ 0xae94000, 0xae96000 },
+	},
 };
 
 static const struct regulator_bulk_data sc7180_dsi_regulators[] = {
@@ -195,7 +215,9 @@ static const struct msm_dsi_config sc7180_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(sc7180_dsi_regulators),
 	.bus_clk_names = dsi_sc7180_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
-	.io_start = { 0xae94000 },
+	.io_start = {
+		{ 0xae94000 },
+	},
 };
 
 static const char * const dsi_sc7280_bus_clk_names[] = {
@@ -212,7 +234,9 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(sc7280_dsi_regulators),
 	.bus_clk_names = dsi_sc7280_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
-	.io_start = { 0xae94000, 0xae96000 },
+	.io_start = {
+		{ 0xae94000, 0xae96000 },
+	},
 };
 
 static const char * const dsi_qcm2290_bus_clk_names[] = {
@@ -229,7 +253,9 @@ static const struct msm_dsi_config qcm2290_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(qcm2290_dsi_cfg_regulators),
 	.bus_clk_names = dsi_qcm2290_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_qcm2290_bus_clk_names),
-	.io_start = { 0x5e94000 },
+	.io_start = {
+		{ 0x5e94000 },
+	},
 };
 
 static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 6b6b16c5fd25..8772a3631ac1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -32,13 +32,16 @@
 
 #define DSI_6G_REG_SHIFT	4
 
+/* Maximum number of configurations matched against the same hw revision */
+#define VARIANTS_MAX			2
+
 struct msm_dsi_config {
 	u32 io_offset;
 	const struct regulator_bulk_data *regulator_data;
 	int num_regulators;
 	const char * const *bus_clk_names;
 	const int num_bus_clks;
-	const resource_size_t io_start[DSI_MAX];
+	const resource_size_t io_start[VARIANTS_MAX][DSI_MAX];
 };
 
 struct msm_dsi_host_cfg_ops {
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 9021f0d65515..9cfb9e91bfea 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1862,16 +1862,16 @@ static int dsi_host_get_id(struct msm_dsi_host *msm_host)
 	struct platform_device *pdev = msm_host->pdev;
 	const struct msm_dsi_config *cfg = msm_host->cfg_hnd->cfg;
 	struct resource *res;
-	int i;
+	int i, j;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dsi_ctrl");
 	if (!res)
 		return -EINVAL;
 
-	for (i = 0; i < DSI_MAX; i++) {
-		if (cfg->io_start[i] == res->start)
-			return i;
-	}
+	for (i = 0; i < VARIANTS_MAX; i++)
+		for (j = 0; j < DSI_MAX; j++)
+			if (cfg->io_start[i][j] == res->start)
+				return j;
 
 	return -EINVAL;
 }

-- 
2.39.2

