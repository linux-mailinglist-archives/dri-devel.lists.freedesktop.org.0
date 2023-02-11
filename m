Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E112A69308F
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 12:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94D010E160;
	Sat, 11 Feb 2023 11:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959EF10E160
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 11:51:49 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id bt8so1504351edb.12
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 03:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/W1yN038JHBkZa936DvMVOCfu8R7n0uZaSVb3zgCCfI=;
 b=d4y2N5O4WC0XbfkuF+PWiYsvvT9dZHVpZUH2azWkndreplnqUor0ZJRp9cx20tGMi2
 IrK2iwoeDlP/OXKb8fK1NJxAL/+eHidzH8zo37Obi3nQBSCs68aG/F1REjY/Nv7064kg
 rICCOttEFo6lCktwcXLckWBbyXnjlakWN0S5K+zXovIQ2cUUsVO8t3Z1s4ZDwxcLjC50
 lw4AROrHcShlrQjwtYC6fg1MCjtZho5R9yNzv3g264c70xs5FmE4K65dsaG0wE5YDMrA
 4OY8vsLJvyr/+hiDw06weFXLwXFu7wdmIx5/TtbhxyCsimLtoGrfqzi8UjiKg+JxE6wk
 Tx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/W1yN038JHBkZa936DvMVOCfu8R7n0uZaSVb3zgCCfI=;
 b=KDvjEniyw+nOYwYjInRTNV8HCaBXpj0LIy3oUZxZl+6/nVSBiTuFdJ0REIq98iJ7QS
 rLFoORheCIlM72J/B7fBC9Bo7gNqm4GZg1IgV+REo8QKY0WINcNg93tNYuejqRZmBmv4
 AUKM3spOK/oa37J+DVPxN+5vbLraW5aAcrMvHbTyUUzgsRaSZtB+VQioN/bwyUNFz/vn
 B4LGJcPLnL7uc1de/xGFMbci7ZTZmsuzC73/OQpKLRTqJHhaFz0/NCF9ZajDL9ijjJZM
 0203S4efQj8iPk8xpD+BVzJoJfaC1mYZhjVCcC/sL7g2TexOSGnjrlu6QcuQ4uV5k7f1
 jCqw==
X-Gm-Message-State: AO0yUKWmLuMz7V9uO3LwjxRPpGX7aZRsiASE4AwKzwM3fgpzmHMpLQ95
 Qf/VuTI/jq24Q4eKRA7tSBA0aw==
X-Google-Smtp-Source: AK7set+745x9yS5kCdk9kzsGrxClr42QgJOO6KFpatlu4ZJbSdqeBoWMq5GU/3myVvmTAEjBrj/omQ==
X-Received: by 2002:a50:ccd8:0:b0:4ac:b838:a902 with SMTP id
 b24-20020a50ccd8000000b004acb838a902mr1160166edj.13.1676116308162; 
 Sat, 11 Feb 2023 03:51:48 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 r10-20020a50d68a000000b004aabb714230sm3636070edi.35.2023.02.11.03.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 03:51:47 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 02/10] drm/msm/dsi: Turn msm_dsi_config::io_start into a 2d
 array
Date: Sat, 11 Feb 2023 12:51:02 +0100
Message-Id: <20230211115110.1462920-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
References: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
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
DSI hosts (1 or 2, at least as of today) and the set of registers.
The regulator setup is the same, because the DSI hardware is the same,
regardless of the SoC it was implemented in.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 52 ++++++++++++++++++++++--------
 drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  5 ++-
 drivers/gpu/drm/msm/dsi/dsi_host.c |  2 +-
 3 files changed, 44 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 6d21f0b33411..068d45b3a8f0 100644
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
 	.num_dsi = 2,
 };
 
@@ -41,7 +43,9 @@ static const struct msm_dsi_config msm8974_apq8084_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(msm8974_apq8084_regulators),
 	.bus_clk_names = dsi_6g_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
-	.io_start = { 0xfd922800, 0xfd922b00 },
+	.io_start = {
+		{ 0xfd922800, 0xfd922b00 },
+	},
 	.num_dsi = 2,
 };
 
@@ -60,7 +64,9 @@ static const struct msm_dsi_config msm8916_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(msm8916_dsi_regulators),
 	.bus_clk_names = dsi_8916_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_8916_bus_clk_names),
-	.io_start = { 0x1a98000 },
+	.io_start = {
+		{ 0x1a98000 },
+	},
 	.num_dsi = 1,
 };
 
@@ -79,7 +85,9 @@ static const struct msm_dsi_config msm8976_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(msm8976_dsi_regulators),
 	.bus_clk_names = dsi_8976_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_8976_bus_clk_names),
-	.io_start = { 0x1a94000, 0x1a96000 },
+	.io_start = {
+		{ 0x1a94000, 0x1a96000 },
+	},
 	.num_dsi = 2,
 };
 
@@ -98,7 +106,9 @@ static const struct msm_dsi_config msm8994_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(msm8994_dsi_regulators),
 	.bus_clk_names = dsi_6g_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
-	.io_start = { 0xfd998000, 0xfd9a0000 },
+	.io_start = {
+		{ 0xfd998000, 0xfd9a0000 },
+	},
 	.num_dsi = 2,
 };
 
@@ -118,7 +128,9 @@ static const struct msm_dsi_config msm8996_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(msm8996_dsi_regulators),
 	.bus_clk_names = dsi_8996_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_8996_bus_clk_names),
-	.io_start = { 0x994000, 0x996000 },
+	.io_start = {
+		{ 0x994000, 0x996000 },
+	},
 	.num_dsi = 2,
 };
 
@@ -137,7 +149,9 @@ static const struct msm_dsi_config msm8998_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(msm8998_dsi_regulators),
 	.bus_clk_names = dsi_msm8998_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_msm8998_bus_clk_names),
-	.io_start = { 0xc994000, 0xc996000 },
+	.io_start = {
+		{ 0xc994000, 0xc996000 },
+	},
 	.num_dsi = 2,
 };
 
@@ -155,7 +169,9 @@ static const struct msm_dsi_config sdm660_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(sdm660_dsi_regulators),
 	.bus_clk_names = dsi_sdm660_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sdm660_bus_clk_names),
-	.io_start = { 0xc994000, 0xc996000 },
+	.io_start = {
+		{ 0xc994000, 0xc996000 },
+	},
 	.num_dsi = 2,
 };
 
@@ -177,7 +193,9 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(sdm845_dsi_regulators),
 	.bus_clk_names = dsi_sdm845_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
-	.io_start = { 0xae94000, 0xae96000 },
+	.io_start = {
+		{ 0xae94000, 0xae96000 },
+	},
 	.num_dsi = 2,
 };
 
@@ -191,7 +209,9 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(sm8550_dsi_regulators),
 	.bus_clk_names = dsi_sdm845_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
-	.io_start = { 0xae94000, 0xae96000 },
+	.io_start = {
+		{ 0xae94000, 0xae96000 },
+	},
 	.num_dsi = 2,
 };
 
@@ -205,7 +225,9 @@ static const struct msm_dsi_config sc7180_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(sc7180_dsi_regulators),
 	.bus_clk_names = dsi_sc7180_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
-	.io_start = { 0xae94000 },
+	.io_start = {
+		{ 0xae94000 },
+	},
 	.num_dsi = 1,
 };
 
@@ -223,7 +245,9 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(sc7280_dsi_regulators),
 	.bus_clk_names = dsi_sc7280_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
-	.io_start = { 0xae94000, 0xae96000 },
+	.io_start = {
+		{ 0xae94000, 0xae96000 },
+	},
 	.num_dsi = 2,
 };
 
@@ -241,7 +265,9 @@ static const struct msm_dsi_config qcm2290_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(qcm2290_dsi_cfg_regulators),
 	.bus_clk_names = dsi_qcm2290_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_qcm2290_bus_clk_names),
-	.io_start = { 0x5e94000 },
+	.io_start = {
+		{ 0x5e94000 },
+	},
 	.num_dsi = 1,
 };
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 44be4a88aa83..df9f09876ccb 100644
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
 	const int num_dsi;
 };
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 18fa30e1e858..22ba8726b0ea 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1869,7 +1869,7 @@ static int dsi_host_get_id(struct msm_dsi_host *msm_host)
 		return -EINVAL;
 
 	for (i = 0; i < cfg->num_dsi; i++) {
-		if (cfg->io_start[i] == res->start)
+		if (cfg->io_start[0][i] == res->start)
 			return i;
 	}
 
-- 
2.39.1

