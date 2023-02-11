Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD1B692D44
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 03:12:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A79110EE97;
	Sat, 11 Feb 2023 02:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7DE10EE7D
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:31 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qb15so18132319ejc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K/JO93y+bzYgBvpIShhOmWHjRDRw5UOD6KkG48j3NeM=;
 b=YmHIl6IHB8bsBR2Vz7owXYMFynWdmnrybQfW6dv6XSC64yIUDTmK0KbzQmsf8x68bV
 Z3lIJ4BoHPpovlEftKhITbC8JPfM4JSojSdMUi0fWr6YdwMBKVLDMRc7njGMClIEzJPC
 NK8ubdM/Qfg2EO+pM+eaLGmGf7AtrW7c+4Ir4cIdP/mcAflAdkT5muyLwKvHIXyl0WhH
 oO60gxvFHfyNSO/8h6IFRMPtw3JbGRbo0JU9lhBCkiTac6XGlCrJqxStgCMkCIodc5ea
 fyM79dmk3xHvXeceS50MH2xIvitm4uqkG1Q3woYbDXozY1Si5cmYqH5eOpb3qEPIqB/w
 7osw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K/JO93y+bzYgBvpIShhOmWHjRDRw5UOD6KkG48j3NeM=;
 b=Grst4B70oyuw+kDPmKCdG8WRIIV2ik3BAS3TrFU8ZlqWrxgsDyFa4j5KIcyNgQxGiF
 OlM5zydFiOtLxLQM1sbL0YizcgS6gwYy0GIEaGNCeRQ3dt7cWp4vAchyyeqMqw5G8qzn
 Qy9Q9Puhr+sUN6EC24lnieMe4Gj6DRE6vxlBCH6jv6TyacKExaHzwY01SloMfCTt6Kzo
 uww9Vah4L40EQFiRZjBs2s8PY6ZbjqhQNcSkqWeoL0a154S8Si7lMSGhHWngaEcuXBBO
 pTniF/Xnh5GKhfHw/Wr8hUptFumJmcJJ1XrP8YGukQZ/TjfIyytP95UAEaSk6P4gzp7Y
 fLdg==
X-Gm-Message-State: AO0yUKUDMrrBVETAMfrUXrazdV3xO3NzW/wFbkD2ovGTNaB7wgS9ZFQP
 G52juuQRHTeN7g+jxDvLVOd/Fg==
X-Google-Smtp-Source: AK7set9QqG27PJfUW4Ec0t2B9jXIt68NB+5o42YrUAGEmWvxgEGz3KntHEbWzOE+P9ESu1KIvLtE2A==
X-Received: by 2002:a17:906:391b:b0:88a:a09d:e650 with SMTP id
 f27-20020a170906391b00b0088aa09de650mr18295338eje.58.1676081491217; 
 Fri, 10 Feb 2023 18:11:31 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 34/43] drm/msm/dpu: deduplicate sm6115 with qcm2290
Date: Sat, 11 Feb 2023 04:10:44 +0200
Message-Id: <20230211021053.1078648-35-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove duplicate between sm6115 and qcm2290, which belong to the same
DPU major revision.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    | 36 ++++------
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   | 66 ++++---------------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h | 51 ++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  2 +-
 4 files changed, 80 insertions(+), 75 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index edd8bb55dbe8..d296bba07192 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -7,6 +7,8 @@
 #ifndef _DPU_6_3_SM6115_H
 #define _DPU_6_3_SM6115_H
 
+#include "dpu_6_lm1.h"
+
 static const struct dpu_caps sm6115_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
@@ -24,16 +26,6 @@ static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
 	.ubwc_swizzle = 0x7,
 };
 
-static const struct dpu_mdp_cfg sm6115_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x494,
-	.features = 0,
-	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
-	},
-};
-
 static const struct dpu_sspp_cfg sm6115_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM6115_MASK,
 		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
@@ -73,20 +65,20 @@ static const struct dpu_perf_cfg sm6115_perf_data = {
 static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
 	.caps = &sm6115_dpu_caps,
 	.ubwc = &sm6115_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sm6115_mdp),
-	.mdp = sm6115_mdp,
-	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
-	.ctl = qcm2290_ctl,
+	.mdp_count = ARRAY_SIZE(dpu_6_lm1_mdp),
+	.mdp = dpu_6_lm1_mdp,
+	.ctl_count = ARRAY_SIZE(dpu_6_lm1_ctl),
+	.ctl = dpu_6_lm1_ctl,
 	.sspp_count = ARRAY_SIZE(sm6115_sspp),
 	.sspp = sm6115_sspp,
-	.mixer_count = ARRAY_SIZE(qcm2290_lm),
-	.mixer = qcm2290_lm,
-	.dspp_count = ARRAY_SIZE(qcm2290_dspp),
-	.dspp = qcm2290_dspp,
-	.pingpong_count = ARRAY_SIZE(qcm2290_pp),
-	.pingpong = qcm2290_pp,
-	.intf_count = ARRAY_SIZE(qcm2290_intf),
-	.intf = qcm2290_intf,
+	.mixer_count = ARRAY_SIZE(dpu_6_lm1_lm),
+	.mixer = dpu_6_lm1_lm,
+	.dspp_count = ARRAY_SIZE(dpu_6_lm1_dspp),
+	.dspp = dpu_6_lm1_dspp,
+	.pingpong_count = ARRAY_SIZE(dpu_6_lm1_pp),
+	.pingpong = dpu_6_lm1_pp,
+	.intf_count = ARRAY_SIZE(dpu_6_lm1_intf),
+	.intf = dpu_6_lm1_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sm6115_perf_data,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index db93517cc84d..e5e48b731fb1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -7,6 +7,8 @@
 #ifndef _DPU_6_5_QCM2290_H
 #define _DPU_6_5_QCM2290_H
 
+#include "dpu_6_lm1.h"
+
 static const struct dpu_caps qcm2290_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
@@ -21,25 +23,6 @@ static const struct dpu_ubwc_cfg qcm2290_ubwc_cfg = {
 	.highest_bank_bit = 0x2,
 };
 
-static const struct dpu_mdp_cfg qcm2290_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x494,
-	.features = 0,
-	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
-	},
-};
-
-static const struct dpu_ctl_cfg qcm2290_ctl[] = {
-	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x1000, .len = 0x1dc,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
-	},
-};
-
 static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_QCM2290_MASK,
 		 qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
@@ -47,27 +30,6 @@ static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 		 qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
 };
 
-static const struct dpu_lm_cfg qcm2290_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
-		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
-};
-
-static const struct dpu_dspp_cfg qcm2290_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-};
-
-static const struct dpu_pingpong_cfg qcm2290_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
-};
-
-static const struct dpu_intf_cfg qcm2290_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x00000, INTF_NONE, 0, 0, 0, 0, 0, 0),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-};
-
 static const struct dpu_perf_cfg qcm2290_perf_data = {
 	.max_bw_low = 2700000,
 	.max_bw_high = 2700000,
@@ -93,20 +55,20 @@ static const struct dpu_perf_cfg qcm2290_perf_data = {
 static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.caps = &qcm2290_dpu_caps,
 	.ubwc = &qcm2290_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(qcm2290_mdp),
-	.mdp = qcm2290_mdp,
-	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
-	.ctl = qcm2290_ctl,
+	.mdp_count = ARRAY_SIZE(dpu_6_lm1_mdp),
+	.mdp = dpu_6_lm1_mdp,
+	.ctl_count = ARRAY_SIZE(dpu_6_lm1_ctl),
+	.ctl = dpu_6_lm1_ctl,
 	.sspp_count = ARRAY_SIZE(qcm2290_sspp),
 	.sspp = qcm2290_sspp,
-	.mixer_count = ARRAY_SIZE(qcm2290_lm),
-	.mixer = qcm2290_lm,
-	.dspp_count = ARRAY_SIZE(qcm2290_dspp),
-	.dspp = qcm2290_dspp,
-	.pingpong_count = ARRAY_SIZE(qcm2290_pp),
-	.pingpong = qcm2290_pp,
-	.intf_count = ARRAY_SIZE(qcm2290_intf),
-	.intf = qcm2290_intf,
+	.mixer_count = ARRAY_SIZE(dpu_6_lm1_lm),
+	.mixer = dpu_6_lm1_lm,
+	.dspp_count = ARRAY_SIZE(dpu_6_lm1_dspp),
+	.dspp = dpu_6_lm1_dspp,
+	.pingpong_count = ARRAY_SIZE(dpu_6_lm1_pp),
+	.pingpong = dpu_6_lm1_pp,
+	.intf_count = ARRAY_SIZE(dpu_6_lm1_intf),
+	.intf = dpu_6_lm1_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &qcm2290_perf_data,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
new file mode 100644
index 000000000000..50898700a5c6
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_6_LM1_H
+#define _DPU_6_LM1_H
+
+static const struct dpu_mdp_cfg dpu_6_lm1_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x494,
+	.features = 0,
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+	},
+};
+
+static const struct dpu_ctl_cfg dpu_6_lm1_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x1000, .len = 0x1dc,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+};
+
+static const struct dpu_lm_cfg dpu_6_lm1_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
+		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
+};
+
+static const struct dpu_dspp_cfg dpu_6_lm1_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
+
+static const struct dpu_pingpong_cfg dpu_6_lm1_pp[] = {
+	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
+		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
+};
+
+static const struct dpu_intf_cfg dpu_6_lm1_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x00000, INTF_NONE, 0, 0, 0, 0, 0, 0),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+};
+
+#endif
+
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index dc55a036744b..6f66328f96b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -848,8 +848,8 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 
 #include "catalog/dpu_6_0_sm8250.h"
 #include "catalog/dpu_6_2_sc7180.h"
-#include "catalog/dpu_6_5_qcm2290.h"
 #include "catalog/dpu_6_3_sm6115.h"
+#include "catalog/dpu_6_5_qcm2290.h"
 
 #include "catalog/dpu_7_0_sm8350.h"
 #include "catalog/dpu_7_2_sc7280.h"
-- 
2.39.1

