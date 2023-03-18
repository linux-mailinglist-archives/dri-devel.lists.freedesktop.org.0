Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDB76BFA72
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 14:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A9210E124;
	Sat, 18 Mar 2023 13:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ABC10E0E2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 13:42:58 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id z5so7778342ljc.8
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 06:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679146978;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6mz7dhLEVkKzAk8Lkvywe3WYisGA69PWt7jvCUOITN8=;
 b=l5RxrNP+TtC35jL5wSHwWEmzYcpTKYJiVNeU7phV2VuXQ+JNCMp9q4UexzZrpDwU5R
 KnrjB8DZn/kONTNEpVXtXYcwFz3d2zUNaW/F1cq5hnQ4btoQ3FjYLYzF9nqeyFxo6Mx2
 pPaLMOroe7P5/SolQ1DbJ24fU1cgAR8nMdI3FgG2fh7th0mxOKOr0Jm2Qmgo6q+S7ZmQ
 JB8em81q1zC6hvGehieWV5a9f7SGlQWuSg4hhxa2nwjEw+zRbmirvKE0dDaDOYsx3LIw
 Dj6iwzbceiOypEbHT7yT650y2SVD1MCjPdksuRsOXJX/tXKH8XOvO9d1nJL76CDaHXR3
 zqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679146978;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6mz7dhLEVkKzAk8Lkvywe3WYisGA69PWt7jvCUOITN8=;
 b=di9XMMmJeFRg6PyYbAEhMOr9LaOc1HFQtw1f8ptLBpV8ghvQFdak7b1Mlx6w9GGQPe
 UxVQoKmNWBvgKBjnQgf73NugI9wVtHIgOV2ihtKEa4jEKlPJGmf6yY55jS46MLvy+F3Z
 DwKiJdkwIA5vS85Y6lRqWyQRBmb6RCOiUGSVqaPMmEopybubGy6Yakjr0w/GKHMoP+2T
 DDxMuO4QFMFyedhSB2EeS1o3NJ9UVdZPGITvG9gHROmBJYfMLDHHFj+gH4hZMvEUAo8f
 Vk2BgtOveK86ONFpgjGo8icSYhCBrcUvZsUsU3QyjkEOKvstYNaoz3zyI653XXIfYnv5
 lRHg==
X-Gm-Message-State: AO0yUKXvKhDvzBZDYQohDozl9wL7BaLhN2+7jcoiwPbu7XC1EyPMS+of
 nQ7AS27CbwJ6gJwkgP8zORNLAQ==
X-Google-Smtp-Source: AK7set+3ky8feSimwcyJYoz0JQtH30GI5/oKt9cI4GAhN/+7l/YvRPkVCQFCVdPKvMYTcjfF1jNvaA==
X-Received: by 2002:a2e:9255:0:b0:299:f770:db5e with SMTP id
 v21-20020a2e9255000000b00299f770db5emr2373447ljg.16.1679146977879; 
 Sat, 18 Mar 2023 06:42:57 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a2e9d82000000b0029a0b50a34asm888367ljj.36.2023.03.18.06.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 06:42:57 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 18 Mar 2023 14:42:49 +0100
Subject: [PATCH v6 3/9] drm/msm/dsi: Fix DSI index detection when version
 clash occurs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v6-3-70e13b1214fa@linaro.org>
References: <20230307-topic-dsi_qcm-v6-0-70e13b1214fa@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v6-0-70e13b1214fa@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1679146971; l=8216;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=b+otjvnFVNWNHQbPO9HD+5KH7xMK3hiBo7WDBK4sSP4=;
 b=MfZ/bvuF4tdu+wbKKRHHAtd41nx3udsJRMbHkWH2gfTniRqLXaDQHSqqfteGWRp+h1YUTjF/qq6r
 JTxxWCUfCNm02easWL3yM/g3WG9mmiNRWC9jK8SbyOk64nVlBdiJ
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

