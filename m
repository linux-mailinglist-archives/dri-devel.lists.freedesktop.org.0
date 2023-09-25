Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEF27AE272
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 01:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087CA10E33E;
	Mon, 25 Sep 2023 23:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4A510E33A;
 Mon, 25 Sep 2023 23:37:17 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-59f6e6b7600so41162547b3.3; 
 Mon, 25 Sep 2023 16:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695685036; x=1696289836; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O6nWSUNBP1XWMpRhY+LDTU8uhl3Be7TFNqb1cz+Ad8s=;
 b=ZnfKtYnlhmU7dXYnIrHdTKwaksBxyKBGGcSFjlxUvk+7ECh+DPD5sGr35ZwscfE4kX
 jaLUStASIEWxrcSNs68YMNOXjTZMMe1f1iwT8srZvpCFCiTv913AqBfgoKd4e5JeAs4E
 4lgz2SCkMbccksPZXnn4PUn7v+tfi9ZV5EY/LUxFTUQjsPNJ0Tah2YKZNtkUtj4mVvlZ
 d9dN5KppM0ZlKhGyWJjfUmBDZA8C4fsUtd8OeKJzWiZ2wboWwldOv1wVZBvGXAb9yDmC
 NclqnJNTR5R76Y8ZeKUrU+d13bNp18rgUlIRqSW2c8rKN/LMyuWYm1EGFQop2Q8i9nLT
 aUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695685036; x=1696289836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O6nWSUNBP1XWMpRhY+LDTU8uhl3Be7TFNqb1cz+Ad8s=;
 b=V6lSCOnQV7iLV3xu+ZcyV8MFQaNBxRNwQpGr52NP8txoKlxG937vcVgn6WXht/yaMw
 /EoYYUTr1YT+p6KLeRSI+t9HZWLc4AcjXbWRwrvubSY7GsHtnRNcR6AzVoQ5XXBRwy/o
 j2XwR1ur8YeN2G/0qjFACTqji8l5wT4XuswEcZYZROf0UBXmh//ALc2hAcK2H+5aa0Sp
 rFOihKwd4MwVnncQP0N+CyCVKNGcej61eTSx8vvJ0x1Ffgu6PRKCuAB2k2wsk9OMVtnK
 43LxRs/H7DQ3ALki0zf50SLiljcCd0Ises1dzVTJqG2teO6aL/N7It31AvQwhbjRPmhU
 hK1A==
X-Gm-Message-State: AOJu0Yzch+qByIFjUwsDZdOZ51y4j5Ez87t4VYsXjUYUsVjiTRkXYMw2
 XG3eVtzla/RjeskrLdrsO6M=
X-Google-Smtp-Source: AGHT+IERXSBhQA5tyr5Jv1w/eIUfSXwDhbPVFtsiUa8BboC3W2b2P6ASkeMrOiCW+3SDuonWy6+8Ag==
X-Received: by 2002:a05:690c:ece:b0:59f:535b:52a7 with SMTP id
 cs14-20020a05690c0ece00b0059f535b52a7mr8059703ywb.48.1695685036461; 
 Mon, 25 Sep 2023 16:37:16 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::efbe])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a819e12000000b00559f1cb8444sm2637794ywj.70.2023.09.25.16.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 16:37:16 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Liu Shixin <liushixin2@huawei.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 5/6] drm/msm/dpu: Add hw revision 4.1 (SDM670)
Date: Mon, 25 Sep 2023 19:26:32 -0400
Message-ID: <20230925232625.846666-14-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925232625.846666-9-mailingradian@gmail.com>
References: <20230925232625.846666-9-mailingradian@gmail.com>
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
Cc: Richard Acayan <mailingradian@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Snapdragon 670 uses similar clocks (with one frequency added) to the
Snapdragon 845 but reports DPU revision 4.1. Add support for this DPU
with configuration from the Pixel 3a downstream kernel.

Since revision 4.0 is SDM845, reuse some configuration from its catalog
entry.

Link: https://android.googlesource.com/kernel/msm/+/368478b0ae76566927a2769a2bf24dfe7f38bb78/arch/arm64/boot/dts/qcom/sdm670-sde.dtsi
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../msm/disp/dpu1/catalog/dpu_4_1_sdm670.h    | 105 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   6 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 4 files changed, 113 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
new file mode 100644
index 000000000000..eaccb16b5db9
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -0,0 +1,105 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023, Richard Acayan. All rights reserved.
+ */
+
+#ifndef _DPU_4_1_SDM670_H
+#define _DPU_4_1_SDM670_H
+
+static const struct dpu_mdp_cfg sdm670_mdp = {
+	.name = "top_0",
+	.base = 0x0, .len = 0x45c,
+	.features = BIT(DPU_MDP_AUDIO_SELECT),
+	.clk_ctrls = {
+		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0},
+		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0},
+		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8},
+		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8},
+		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8},
+	},
+};
+
+static const struct dpu_sspp_cfg sdm670_sspp[] = {
+	{
+		.name = "sspp_0", .id = SSPP_VIG0,
+		.base = 0x4000, .len = 0x1c8,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &sdm670_vig_sblk_0,
+		.xin_id = 0,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG0,
+	}, {
+		.name = "sspp_1", .id = SSPP_VIG1,
+		.base = 0x6000, .len = 0x1c8,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &sdm670_vig_sblk_1,
+		.xin_id = 4,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG0,
+	}, {
+		.name = "sspp_8", .id = SSPP_DMA0,
+		.base = 0x24000, .len = 0x1c8,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &sdm845_dma_sblk_0,
+		.xin_id = 1,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA0,
+	}, {
+		.name = "sspp_9", .id = SSPP_DMA1,
+		.base = 0x26000, .len = 0x1c8,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
+		.sblk = &sdm845_dma_sblk_1,
+		.xin_id = 5,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA1,
+	}, {
+		.name = "sspp_10", .id = SSPP_DMA2,
+		.base = 0x28000, .len = 0x1c8,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
+		.sblk = &sdm845_dma_sblk_2,
+		.xin_id = 9,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA2,
+	},
+};
+
+static struct dpu_dsc_cfg sdm670_dsc[] = {
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x140,
+	},
+	{
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x140,
+	},
+};
+
+static struct dpu_mdss_version sdm670_mdss_ver = {
+	.core_major_ver = 4,
+	.core_minor_ver = 1,
+};
+
+const struct dpu_mdss_cfg dpu_sdm670_cfg = {
+	.mdss_ver = &sdm670_mdss_ver,
+	.caps = &sdm845_dpu_caps,
+	.mdp = &sdm670_mdp,
+	.ctl_count = ARRAY_SIZE(sdm845_ctl),
+	.ctl = sdm845_ctl,
+	.sspp_count = ARRAY_SIZE(sdm670_sspp),
+	.sspp = sdm670_sspp,
+	.mixer_count = ARRAY_SIZE(sdm845_lm),
+	.mixer = sdm845_lm,
+	.pingpong_count = ARRAY_SIZE(sdm845_pp),
+	.pingpong = sdm845_pp,
+	.dsc_count = ARRAY_SIZE(sdm670_dsc),
+	.dsc = sdm670_dsc,
+	.intf_count = ARRAY_SIZE(sdm845_intf),
+	.intf = sdm845_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.perf = &sdm845_perf_data,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 713dfc079718..63b274ae032a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -313,6 +313,11 @@ static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
 	.rot_format_list = rotation_v2_formats,
 };
 
+static const struct dpu_sspp_sub_blks sdm670_vig_sblk_0 =
+				_VIG_SBLK(4, DPU_SSPP_SCALER_QSEED3);
+static const struct dpu_sspp_sub_blks sdm670_vig_sblk_1 =
+				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED3);
+
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
 				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED3);
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
@@ -655,6 +660,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 #include "catalog/dpu_3_0_msm8998.h"
 
 #include "catalog/dpu_4_0_sdm845.h"
+#include "catalog/dpu_4_1_sdm670.h"
 
 #include "catalog/dpu_5_0_sm8150.h"
 #include "catalog/dpu_5_1_sc8180x.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 6c9634209e9f..dae5a1555e44 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -831,6 +831,7 @@ struct dpu_mdss_cfg {
 
 extern const struct dpu_mdss_cfg dpu_msm8998_cfg;
 extern const struct dpu_mdss_cfg dpu_sdm845_cfg;
+extern const struct dpu_mdss_cfg dpu_sdm670_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8150_cfg;
 extern const struct dpu_mdss_cfg dpu_sc8180x_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8250_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aa6ba2cf4b84..0049fb1de1e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1362,6 +1362,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
 static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,msm8998-dpu", .data = &dpu_msm8998_cfg, },
 	{ .compatible = "qcom,qcm2290-dpu", .data = &dpu_qcm2290_cfg, },
+	{ .compatible = "qcom,sdm670-dpu", .data = &dpu_sdm670_cfg, },
 	{ .compatible = "qcom,sdm845-dpu", .data = &dpu_sdm845_cfg, },
 	{ .compatible = "qcom,sc7180-dpu", .data = &dpu_sc7180_cfg, },
 	{ .compatible = "qcom,sc7280-dpu", .data = &dpu_sc7280_cfg, },
-- 
2.42.0

