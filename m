Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D4E7B5EA4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 03:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD7210E258;
	Tue,  3 Oct 2023 01:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B0D10E24F;
 Tue,  3 Oct 2023 01:21:50 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-7742be66bd3so32325385a.3; 
 Mon, 02 Oct 2023 18:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696296110; x=1696900910; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9szRCpl0zDd5PZDPWIW0Lozwr+HbyIBZUxTAriHwdbY=;
 b=nkH50m97A72pSnpcUVp62XbvHNXwcLnJin172+XTeYfkMHDpiigm5FHkiievTET7TA
 H1obol2lF7Il6Kf5xMHdMcvFzTNlvzAX30OqLslmfLFzhasIIgmnZ3CcxHG6E1zLkM4L
 z/mXbjkapaF8J9Bt/1J2Zhnr9EMrzDaeTvxZWFIVi3G6dhCkQT3bqi/wndXVh5mbsFSo
 d46BjWCHhsv+8itz0Ih1bBqZFVp3lyySzHuy4XltZPd+9YdqkgC9tNxhHjM0CyO+HgkV
 jypnazpDoD8VeOV6QUCKsIta9n48PVpZa2Br4HoQof217WWZ8NEqJ3nbDy8LLD1fpQy9
 s8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696296110; x=1696900910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9szRCpl0zDd5PZDPWIW0Lozwr+HbyIBZUxTAriHwdbY=;
 b=HNkihf6LWgpTjSFyR2Cq/z8qyIo6N6XS93WuJyzmgbyopsro5j4yYrU/FRSnVWUswr
 UhL57zABwGrCgRUNlCf9S0xhCET9/gU/5vtJiTLN44U3VYCdcpu/+LQPinlxvvTh5uv7
 3sFygQDwwUvRrvTD5c+ZVF8FRDJirSVEGoMISdFimG6rMJSRzdJf7v/WTBkX+75DEHyu
 6N3kNYSRh74wGn354k5eV0T4FDXpCoFABCI3SAKwc1oMRJJpnhUPF0PKjcGdT3D2s7xa
 4GjPymjxlherGkXq6YXIjogx+aWfWKzZ5B10tVWLiQTaqNk8g93RSkn6iUDQznXRBLnC
 qezw==
X-Gm-Message-State: AOJu0YyN9yByYEcBGtKpUaEtFSXuinInrjO9BVgrYsElk+JC0gdDG6Og
 JMdVuixCqFSwoyPHliDnumA=
X-Google-Smtp-Source: AGHT+IF+Ej44iYR1xBElAjuqgP0aBqPKt5YYLZ9lO6IxYM7oFdlbzogJRYQ8fumzydsIahWS4/wIIw==
X-Received: by 2002:a05:620a:23a:b0:76d:a8a8:edab with SMTP id
 u26-20020a05620a023a00b0076da8a8edabmr12858469qkm.75.1696296110030; 
 Mon, 02 Oct 2023 18:21:50 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::efbe])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05620a070d00b007756f60bcacsm48939qkc.79.2023.10.02.18.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 18:21:49 -0700 (PDT)
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
Subject: [PATCH v2 5/6] drm/msm/dpu: Add hw revision 4.1 (SDM670)
Date: Mon,  2 Oct 2023 21:21:26 -0400
Message-ID: <20231003012119.857198-14-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231003012119.857198-9-mailingradian@gmail.com>
References: <20231003012119.857198-9-mailingradian@gmail.com>
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
 .../msm/disp/dpu1/catalog/dpu_4_1_sdm670.h    | 104 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   6 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 4 files changed, 112 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
new file mode 100644
index 000000000000..01a9aec1c956
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -0,0 +1,104 @@
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
+		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
+		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
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
+static const struct dpu_dsc_cfg sdm670_dsc[] = {
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x140,
+	}, {
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x140,
+	},
+};
+
+static const struct dpu_mdss_version sdm670_mdss_ver = {
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

