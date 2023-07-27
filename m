Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 074E27656D1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 17:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F13510E5AD;
	Thu, 27 Jul 2023 15:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111D3892E4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:05:04 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so4917056a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690470302; x=1691075102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+ol/s+8qQLO4qXP3HuB8Xi7ZkFM9tJMYqx5hs27Fuc=;
 b=TNEOm10csmHgb89eA2Gb3U4qgHM4SvIDYR/x8WCepV/ljB/wkBZc43QPrI0IHC2yQ0
 mc0u9oNy1LFTQgvqv0zj+b26Ji6PdaY8G6Mqg20QMqzM9B0Oq0uiW5up2NPxJ+1dezug
 C3g8nHa7XFQE9Fx2nFLfM6G990vFJSMwAexJpK3Q+zbuaNDNJJV4pOhejoc5ETiUrmyf
 aEoQ/OSGafnfoz2jlKisrvJWUov6dLr7EvAzC+RUvUH1HSgcSMHm/Z4H1FwOPsxoQj4I
 5uVjCvpe1h1x2Q36hPLWkSLOUZjAmNXtkrBddXp+i9XjlJ76dtreRRzjjwYwSi1eEgDm
 JdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690470302; x=1691075102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6+ol/s+8qQLO4qXP3HuB8Xi7ZkFM9tJMYqx5hs27Fuc=;
 b=i0H6OmGJ/JhRWPAnr9KxZt2BuZrzRW0DUHMTGl956qFj49M0KosdW7iomDgEXDouFv
 taeMd+B168H+dfF0rJwwdkWv3aylBXnRa2vSJUVJZp7HICFAktLXaTavo0TfBEYNslIr
 /n5iM0EwVoja07G8q4VKSnU7TKb+twDNdius3XCAtWWQTd8PETERcVP/w6aroI/obMb7
 RBu/U0XuipMtvmd7NGVzGcNRjmefKqWanlFBOt6aCpnunHUYB8IlSHHFgTEWbz2Sg7DX
 Kd3/lR+gxJBPswWJkJB3YLWmkBJiLmFi1K0lid63bOegGWJ+HB4284FU4f3Dkn0lkeAi
 e/CQ==
X-Gm-Message-State: ABy/qLZj11MTvJw1dxBQ1UTsmCPBeBXGRg2rLX3vxMXfUctUgv+RMRDt
 DCM83A2VUkoyvr5pCQshs/JOGg==
X-Google-Smtp-Source: APBJJlH614IE56AGB1yNtaH2/qRrh51GUaQ0B9lsdTAlIfifMwhk0qDQ3HCc6hSYrj9J2OmEcWKbYA==
X-Received: by 2002:a17:907:c0f:b0:99b:56d4:82bb with SMTP id
 ga15-20020a1709070c0f00b0099b56d482bbmr3363496ejc.6.1690470301867; 
 Thu, 27 Jul 2023 08:05:01 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 jp21-20020a170906f75500b00992e94bcfabsm857195ejb.167.2023.07.27.08.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 08:05:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 4/4] drm/msm/dpu: shift IRQ indices by 1
Date: Thu, 27 Jul 2023 18:04:55 +0300
Message-Id: <20230727150455.1489575-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
References: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
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

In order to simplify IRQ declarations, shift IRQ indices by 1. This
makes 0 the 'no IRQ' value. Thanks to this change, we do no longer have
to explicitly set the 'no interrupt' fields in catalog structures.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  4 --
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  4 --
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  8 ---
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 10 ----
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  3 --
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  8 ---
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  3 --
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  1 -
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  3 --
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  1 -
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  1 -
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  8 ---
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  6 ---
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 13 -----
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 12 -----
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 12 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 14 +++---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 49 +++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  6 +--
 22 files changed, 39 insertions(+), 137 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 92530aec3bdc..b99bb323ec37 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -249,7 +249,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x280,
@@ -258,7 +257,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x280,
@@ -267,7 +265,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
@@ -275,7 +272,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 3034c1b6ed90..ed30ea033da5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -265,7 +265,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x280,
@@ -274,7 +273,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x280,
@@ -283,7 +281,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
@@ -292,7 +289,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 3745c150540e..846f8b851f24 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -225,7 +225,6 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
@@ -233,7 +232,6 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
@@ -241,7 +239,6 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
@@ -249,7 +246,6 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x72000, .len = 0xd4,
@@ -257,7 +253,6 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x72800, .len = 0xd4,
@@ -265,7 +260,6 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-		.intr_rdptr = -1,
 	},
 };
 
@@ -312,7 +306,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2bc,
@@ -342,7 +335,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 6291568bef03..508a98549eef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -224,7 +224,6 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
@@ -232,7 +231,6 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
@@ -240,7 +238,6 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
@@ -248,7 +245,6 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x72000, .len = 0xd4,
@@ -256,7 +252,6 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x72800, .len = 0xd4,
@@ -264,7 +259,6 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-		.intr_rdptr = -1,
 	},
 };
 
@@ -319,7 +313,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2bc,
@@ -351,7 +344,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x6c000, .len = 0x280,
@@ -361,7 +353,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x6c800, .len = 0x280,
@@ -371,7 +362,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index e922668aea1a..ff1a7e1349bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -135,7 +135,6 @@ static const struct dpu_pingpong_cfg sm6125_pp[] = {
 		.merge_3d = 0,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
@@ -143,7 +142,6 @@ static const struct dpu_pingpong_cfg sm6125_pp[] = {
 		.merge_3d = 0,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	},
 };
 
@@ -157,7 +155,6 @@ static const struct dpu_intf_cfg sm6125_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 9751b39ae371..5319c5773a3c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -225,7 +225,6 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
@@ -233,7 +232,6 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
@@ -241,7 +239,6 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
@@ -249,7 +246,6 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x72000, .len = 0xd4,
@@ -257,7 +253,6 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x72800, .len = 0xd4,
@@ -265,7 +260,6 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-		.intr_rdptr = -1,
 	},
 };
 
@@ -312,7 +306,6 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
@@ -342,7 +335,6 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index a9464b856f42..8d1e6081afa0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -125,7 +125,6 @@ static const struct dpu_pingpong_cfg sc7180_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
@@ -133,7 +132,6 @@ static const struct dpu_pingpong_cfg sc7180_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	},
 };
 
@@ -147,7 +145,6 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index ae7cd965c0b9..e37fbd3094b5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -89,7 +89,6 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index a13305cad7cd..00bf16c5fc9e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -134,7 +134,6 @@ static struct dpu_pingpong_cfg sm6350_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
@@ -142,7 +141,6 @@ static struct dpu_pingpong_cfg sm6350_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	},
 };
 
@@ -164,7 +162,6 @@ static const struct dpu_intf_cfg sm6350_intf[] = {
 		.prog_fetch_lines_worst_case = 35,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index bb297c3ef81a..bb0dfe69821f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -86,7 +86,6 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 014a56e585b7..3ce1ac62e56d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -91,7 +91,6 @@ static const struct dpu_pingpong_cfg sm6375_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 941b585bd56f..7d775f749d59 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -223,7 +223,6 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
@@ -231,7 +230,6 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
@@ -239,7 +237,6 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
@@ -247,7 +244,6 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
@@ -255,7 +251,6 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
@@ -263,7 +258,6 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-		.intr_rdptr = -1,
 	},
 };
 
@@ -319,7 +313,6 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x2c4,
@@ -349,7 +342,6 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index b18bb7ce2f94..65784db3854e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -137,7 +137,6 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
@@ -145,7 +144,6 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
@@ -153,7 +151,6 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
@@ -161,7 +158,6 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-		.intr_rdptr = -1,
 	},
 };
 
@@ -200,7 +196,6 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x2c4,
@@ -220,7 +215,6 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index b08096f0d50b..b50c46400ed4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -227,7 +227,6 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
@@ -235,7 +234,6 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
@@ -243,7 +241,6 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
@@ -251,7 +248,6 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
@@ -259,7 +255,6 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
@@ -267,7 +262,6 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-		.intr_rdptr = -1,
 	},
 };
 
@@ -334,7 +328,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
@@ -364,7 +357,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x38000, .len = 0x280,
@@ -374,7 +366,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x39000, .len = 0x280,
@@ -384,7 +375,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3a000, .len = 0x280,
@@ -394,7 +384,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
@@ -404,7 +393,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 19),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
@@ -414,7 +402,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 9e0ad71c12a8..d33d571dd6ab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -227,7 +227,6 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
@@ -235,7 +234,6 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
@@ -243,7 +241,6 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
@@ -251,7 +248,6 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
@@ -259,7 +255,6 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
@@ -267,23 +262,18 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_6", .id = PINGPONG_6,
 		.base = 0x65800, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
-		.intr_done = -1,
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_7", .id = PINGPONG_7,
 		.base = 0x65c00, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
-		.intr_done = -1,
-		.intr_rdptr = -1,
 	},
 };
 
@@ -342,7 +332,6 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
@@ -372,7 +361,6 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 2a19e4c0af1a..29ac8db14272 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -241,7 +241,6 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
@@ -249,7 +248,6 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
@@ -257,7 +255,6 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
@@ -265,7 +262,6 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
@@ -273,7 +269,6 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
@@ -281,23 +276,18 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_6", .id = PINGPONG_6,
 		.base = 0x66000, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
-		.intr_done = -1,
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_7", .id = PINGPONG_7,
 		.base = 0x66400, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
-		.intr_done = -1,
-		.intr_rdptr = -1,
 	},
 };
 
@@ -356,7 +346,6 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
@@ -386,7 +375,6 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
index ba06312cbb16..7c286bafb948 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
@@ -37,7 +37,7 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms);
  */
 u32 dpu_core_irq_read(
 		struct dpu_kms *dpu_kms,
-		int irq_idx);
+		unsigned int irq_idx);
 
 /**
  * dpu_core_irq_register_callback - For registering callback function on IRQ
@@ -52,7 +52,7 @@ u32 dpu_core_irq_read(
  */
 int dpu_core_irq_register_callback(
 		struct dpu_kms *dpu_kms,
-		int irq_idx,
+		unsigned int irq_idx,
 		void (*irq_cb)(void *arg),
 		void *irq_arg);
 
@@ -67,7 +67,7 @@ int dpu_core_irq_register_callback(
  */
 int dpu_core_irq_unregister_callback(
 		struct dpu_kms *dpu_kms,
-		int irq_idx);
+		unsigned int irq_idx);
 
 /**
  * dpu_debugfs_core_irq_init - register core irq debugfs
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 051447a3620c..8ccfeb002b5f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2555,7 +2555,7 @@ void dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 
 	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
-		phys_enc->irq[i] = -EINVAL;
+		phys_enc->irq[i] = 0;
 
 	atomic_set(&phys_enc->vblank_refcount, 0);
 	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index f91661a69888..e203f3775ed3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -193,7 +193,7 @@ struct dpu_encoder_phys {
 	atomic_t pending_ctlstart_cnt;
 	atomic_t pending_kickoff_cnt;
 	wait_queue_head_t pending_kickoff_wq;
-	int irq[INTR_IDX_MAX];
+	unsigned int irq[INTR_IDX_MAX];
 	bool has_intf_te;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c72ed0e35dce..945b88c5ab58 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -524,7 +524,7 @@ struct dpu_ubwc_cfg {
  */
 struct dpu_ctl_cfg {
 	DPU_HW_BLK_INFO;
-	s32 intr_start;
+	unsigned int intr_start;
 };
 
 /**
@@ -587,8 +587,8 @@ struct dpu_dspp_cfg  {
 struct dpu_pingpong_cfg  {
 	DPU_HW_BLK_INFO;
 	u32 merge_3d;
-	s32 intr_done;
-	s32 intr_rdptr;
+	unsigned int intr_done;
+	unsigned int intr_rdptr;
 	const struct dpu_pingpong_sub_blks *sblk;
 };
 
@@ -635,9 +635,9 @@ struct dpu_intf_cfg  {
 	u32 type;   /* interface type*/
 	u32 controller_id;
 	u32 prog_fetch_lines_worst_case;
-	s32 intr_underrun;
-	s32 intr_vsync;
-	s32 intr_tear_rd_ptr;
+	unsigned int intr_underrun;
+	unsigned int intr_vsync;
+	unsigned int intr_tear_rd_ptr;
 };
 
 /**
@@ -656,7 +656,7 @@ struct dpu_wb_cfg {
 	u8 vbif_idx;
 	u32 maxlinewidth;
 	u32 xin_id;
-	s32 intr_wb_done;
+	unsigned int intr_wb_done;
 	const u32 *format_list;
 	u32 num_formats;
 	enum dpu_clk_ctrl_type clk_ctrl;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index ede7161ae904..47f6912ac39e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -200,7 +200,7 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 #define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_OFFSET(irq_idx)))
 
 static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_kms *dpu_kms,
-							       int irq_idx)
+							       unsigned int irq_idx)
 {
 	return &dpu_kms->hw_intr->irq_tbl[irq_idx];
 }
@@ -210,7 +210,7 @@ static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_kms *d
  * @dpu_kms:		Pointer to DPU's KMS structure
  * @irq_idx:		interrupt index
  */
-static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
+static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, unsigned int irq_idx)
 {
 	struct dpu_hw_intr_entry *irq_entry = dpu_core_irq_get_entry(dpu_kms, irq_idx);
 
@@ -232,7 +232,7 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms)
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
 	int reg_idx;
-	int irq_idx;
+	unsigned int irq_idx;
 	u32 irq_status;
 	u32 enable_mask;
 	int bit;
@@ -288,7 +288,8 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms)
 	return IRQ_HANDLED;
 }
 
-static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
+static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr,
+					 unsigned int irq_idx)
 {
 	int reg_idx;
 	const struct dpu_intr_reg *reg;
@@ -298,7 +299,7 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 	if (!intr)
 		return -EINVAL;
 
-	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
+	if (!irq_idx || irq_idx > intr->total_irqs) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -341,7 +342,8 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 	return 0;
 }
 
-static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
+static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr,
+					  unsigned int irq_idx)
 {
 	int reg_idx;
 	const struct dpu_intr_reg *reg;
@@ -351,7 +353,7 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 	if (!intr)
 		return -EINVAL;
 
-	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
+	if (!irq_idx || irq_idx > intr->total_irqs) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -426,7 +428,8 @@ static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
 	wmb();
 }
 
-u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
+u32 dpu_core_irq_read(struct dpu_kms *dpu_kms,
+		      unsigned int irq_idx)
 {
 	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
 	int reg_idx;
@@ -436,13 +439,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
 	if (!intr)
 		return 0;
 
-	if (irq_idx < 0) {
-		DPU_ERROR("[%pS] invalid irq_idx=%d\n",
-				__builtin_return_address(0), irq_idx);
-		return 0;
-	}
-
-	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
+	if (!irq_idx || irq_idx > intr->total_irqs) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return 0;
 	}
@@ -499,7 +496,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 
 		intr->irq_mask |= BIT(MDP_INTFn_INTR(intf->id));
 
-		if (intf->intr_tear_rd_ptr != -1)
+		if (intf->intr_tear_rd_ptr)
 			intr->irq_mask |= BIT(DPU_IRQ_REG(intf->intr_tear_rd_ptr));
 	}
 
@@ -513,9 +510,10 @@ void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
 	kfree(intr);
 }
 
-int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
-		void (*irq_cb)(void *arg),
-		void *irq_arg)
+int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms,
+				   unsigned int irq_idx,
+				   void (*irq_cb)(void *arg),
+				   void *irq_arg)
 {
 	struct dpu_hw_intr_entry *irq_entry;
 	unsigned long irq_flags;
@@ -526,7 +524,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 		return -EINVAL;
 	}
 
-	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
+	if (!irq_idx || irq_idx > dpu_kms->hw_intr->total_irqs) {
 		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -559,13 +557,14 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 	return 0;
 }
 
-int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
+int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms,
+				     unsigned int irq_idx)
 {
 	struct dpu_hw_intr_entry *irq_entry;
 	unsigned long irq_flags;
 	int ret;
 
-	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
+	if (!irq_idx || irq_idx > dpu_kms->hw_intr->total_irqs) {
 		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -600,7 +599,7 @@ static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 	int i, irq_count;
 	void *cb;
 
-	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
+	for (i = 1; i <= dpu_kms->hw_intr->total_irqs; i++) {
 		spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
 		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
 		irq_count = atomic_read(&irq_entry->count);
@@ -635,7 +634,7 @@ void dpu_core_irq_preinstall(struct msm_kms *kms)
 	dpu_disable_all_irqs(dpu_kms);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
-	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
+	for (i = 1; i <= dpu_kms->hw_intr->total_irqs; i++) {
 		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
 		atomic_set(&irq_entry->count, 0);
 	}
@@ -651,7 +650,7 @@ void dpu_core_irq_uninstall(struct msm_kms *kms)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
+	for (i = 1; i <= dpu_kms->hw_intr->total_irqs; i++) {
 		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
 		if (irq_entry->cb)
 			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 59bde8ab50c8..41a020fd1288 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -36,9 +36,9 @@ enum dpu_hw_intr_reg {
 
 #define MDP_INTFn_INTR(intf)	(MDP_INTF0_INTR + (intf - INTF_0))
 
-#define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
-#define DPU_IRQ_REG(irq_idx)		((irq_idx) / 32)
-#define DPU_IRQ_OFFSET(irq_idx)		((irq_idx) % 32)
+#define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset + 1)
+#define DPU_IRQ_REG(irq_idx)		((irq_idx - 1) / 32)
+#define DPU_IRQ_OFFSET(irq_idx)		((irq_idx - 1) % 32)
 
 struct dpu_hw_intr_entry {
 	void (*cb)(void *arg);
-- 
2.39.2

