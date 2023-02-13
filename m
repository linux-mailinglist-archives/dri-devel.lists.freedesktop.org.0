Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6157694558
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 13:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E89810E58E;
	Mon, 13 Feb 2023 12:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF9A10E592
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 12:10:28 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id sb24so7328338ejb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 04:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vNtO6TjtSJEcp8uPwtQuefcLvw6u6ONtxjs37g8Gm+4=;
 b=toYQaFXONrXRhcBi2/hw4dFUyhYBRB7y87GTU4Y3klK3WIh2/uojlLE5PuGh5xcMTo
 i4tnKd/9xLb6WIiHTyIVSfDnRmJp6YE/wtXaunfK2/hlmGOlKcJ2+D7LG4ZvuV8ilmk9
 3Bue5mpoKtVVoa8G0pnbWlKaxmTQZVMxOPJJTc4UxtNn27hpuHtphGJMZI8N1YQjCGC0
 EIMfxN3ypFRJMClIQ2Zfb9sckLN/A9nDfpSB4tFeiFAsfZUZF+chkCbH3N7rB7Ib6itM
 DAK8Uh31Rrf/AAEuPq/JAtje50o8BBtM8UA7qsrFLsl6AEBUpE1OyFB5HjQT6Eiv+OIv
 B18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vNtO6TjtSJEcp8uPwtQuefcLvw6u6ONtxjs37g8Gm+4=;
 b=4gjT1EU3ruc1RcylfXPHN8oyEwpvC/sDZLfbiSwVL/YGO2mac6y8YSb0jXY2ohJ/HU
 bKE7HZiuZ/Gix9lPv1+pgy0w/kWigDxCVAmBM2dsq70BTKecOYV0UPYT95YzzN6/mrkT
 RoY4Rtp911qz9rr7a7p7STtZtcWLHFsL66znHtswIP0kO1vjzSe4vgnlSPuvObRHjnMq
 WEiRN1hFRLdgCbGUZC++d42Cb3gek3yLR2pnmaYnNtQxJZaIRc+FriBzanwo9ntpn4j+
 f1Cg6TBWjcJ/R4Ew7+Zg3Plqk6p+YJ0Ri3SVqgarvvV9OGG4licp+XuqtONsuns5jfPx
 2R9A==
X-Gm-Message-State: AO0yUKXOp/TyT4nZVjLX/DqJ+Io25+qa9Nlz8eQ5AWjai/J1OAz5PNho
 qKuCJh0KjiCR42JIg5NWzxeKag==
X-Google-Smtp-Source: AK7set+2HZz0BOon+XsyYOSj4boCldns/BHsuJJeXI+oH2c45FDwpraOuwUwCHEGTa8c1INQ+1A1mg==
X-Received: by 2002:a17:907:6090:b0:8ae:3380:ff56 with SMTP id
 ht16-20020a170907609000b008ae3380ff56mr22903380ejc.63.1676290228220; 
 Mon, 13 Feb 2023 04:10:28 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 dt19-20020a170906b79300b0088ed7de4821sm6651586ejb.158.2023.02.13.04.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 04:10:27 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH v2 4/9] drm/msm/dsi: dsi_cfg: Deduplicate identical structs
Date: Mon, 13 Feb 2023 13:10:07 +0100
Message-Id: <20230213121012.1768296-5-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
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
 Loic Poulain <loic.poulain@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some structs were defined multiple times for no apparent reason.
Deduplicate them.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 77 +++++++++++--------------------
 1 file changed, 26 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 6c192963c100..d39521850018 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -47,41 +47,32 @@ static const struct msm_dsi_config msm8974_apq8084_dsi_cfg = {
 	},
 };
 
-static const char * const dsi_8916_bus_clk_names[] = {
+static const char * const dsi_v1_3_1_clk_names[] = {
 	"mdp_core", "iface", "bus",
 };
 
-static const struct regulator_bulk_data msm8916_dsi_regulators[] = {
+static const struct regulator_bulk_data dsi_v1_3_1_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 100000 },	/* 1.2 V */
 	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
 };
 
 static const struct msm_dsi_config msm8916_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.regulator_data = msm8916_dsi_regulators,
-	.num_regulators = ARRAY_SIZE(msm8916_dsi_regulators),
-	.bus_clk_names = dsi_8916_bus_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_8916_bus_clk_names),
+	.regulator_data = dsi_v1_3_1_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_v1_3_1_regulators),
+	.bus_clk_names = dsi_v1_3_1_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v1_3_1_clk_names),
 	.io_start = {
 		{ 0x1a98000 },
 	},
 };
 
-static const char * const dsi_8976_bus_clk_names[] = {
-	"mdp_core", "iface", "bus",
-};
-
-static const struct regulator_bulk_data msm8976_dsi_regulators[] = {
-	{ .supply = "vdda", .init_load_uA = 100000 },	/* 1.2 V */
-	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
-};
-
 static const struct msm_dsi_config msm8976_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.regulator_data = msm8976_dsi_regulators,
-	.num_regulators = ARRAY_SIZE(msm8976_dsi_regulators),
-	.bus_clk_names = dsi_8976_bus_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_8976_bus_clk_names),
+	.regulator_data = dsi_v1_3_1_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_v1_3_1_regulators),
+	.bus_clk_names = dsi_v1_3_1_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v1_3_1_clk_names),
 	.io_start = {
 		{ 0x1a94000, 0x1a96000 },
 	},
@@ -107,10 +98,6 @@ static const struct msm_dsi_config msm8994_dsi_cfg = {
 	},
 };
 
-static const char * const dsi_8996_bus_clk_names[] = {
-	"mdp_core", "iface", "bus", "core_mmss",
-};
-
 static const struct regulator_bulk_data msm8996_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 18160 },	/* 1.25 V */
 	{ .supply = "vcca", .init_load_uA = 17000 },	/* 0.925 V */
@@ -121,8 +108,8 @@ static const struct msm_dsi_config msm8996_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.regulator_data = msm8996_dsi_regulators,
 	.num_regulators = ARRAY_SIZE(msm8996_dsi_regulators),
-	.bus_clk_names = dsi_8996_bus_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_8996_bus_clk_names),
+	.bus_clk_names = dsi_6g_bus_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
 	.io_start = {
 		{ 0x994000, 0x996000 },
 	},
@@ -167,24 +154,20 @@ static const struct msm_dsi_config sdm660_dsi_cfg = {
 	},
 };
 
-static const char * const dsi_sdm845_bus_clk_names[] = {
+static const char * const dsi_v2_4_clk_names[] = {
 	"iface", "bus",
 };
 
-static const char * const dsi_sc7180_bus_clk_names[] = {
-	"iface", "bus",
-};
-
-static const struct regulator_bulk_data sdm845_dsi_regulators[] = {
+static const struct regulator_bulk_data dsi_v2_4_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
 };
 
 static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.regulator_data = sdm845_dsi_regulators,
-	.num_regulators = ARRAY_SIZE(sdm845_dsi_regulators),
-	.bus_clk_names = dsi_sdm845_bus_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
+	.regulator_data = dsi_v2_4_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
 	.io_start = {
 		{ 0xae94000, 0xae96000 },
 	},
@@ -198,32 +181,24 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.regulator_data = sm8550_dsi_regulators,
 	.num_regulators = ARRAY_SIZE(sm8550_dsi_regulators),
-	.bus_clk_names = dsi_sdm845_bus_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
 	.io_start = {
 		{ 0xae94000, 0xae96000 },
 	},
 };
 
-static const struct regulator_bulk_data sc7180_dsi_regulators[] = {
-	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
-};
-
 static const struct msm_dsi_config sc7180_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.regulator_data = sc7180_dsi_regulators,
-	.num_regulators = ARRAY_SIZE(sc7180_dsi_regulators),
-	.bus_clk_names = dsi_sc7180_bus_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
+	.regulator_data = dsi_v2_4_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
 	.io_start = {
 		{ 0xae94000 },
 	},
 };
 
-static const char * const dsi_sc7280_bus_clk_names[] = {
-	"iface", "bus",
-};
-
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
 };
@@ -232,8 +207,8 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.regulator_data = sc7280_dsi_regulators,
 	.num_regulators = ARRAY_SIZE(sc7280_dsi_regulators),
-	.bus_clk_names = dsi_sc7280_bus_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
 	.io_start = {
 		{ 0xae94000, 0xae96000 },
 	},
-- 
2.39.1

