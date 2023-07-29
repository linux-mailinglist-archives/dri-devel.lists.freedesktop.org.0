Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C28E276829D
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 00:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6CC10E238;
	Sat, 29 Jul 2023 22:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE8910E234
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 22:27:18 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b9c55e0fbeso42493121fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 15:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690669636; x=1691274436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EnzyrkFL4lMdonbnk8Oi+28rkL+zjcT0UKuAISGu9Ok=;
 b=yOzpGlNc7r9yoEuri3oFALH+4qZeuzOHj9nfcUzG0QkWvO+1BjxmUbK2FpBNtPhKHg
 kdh7HbJzOtCUufYVHl/KBi3CC0OE2kEfP/92Lwz+H2OpsfxZXNyF8VtvYxa8OUhUEKZ0
 oiPrt6uKHrepM03qNdzt9iUCeTf5Tz+CJZzX1f331rYw0PbRleROp+evVGYk+XUbzjU8
 M2ah213BA7qSsEcAHEs/yK+b/2O2qTglohBAGIxEY4TmKXPRLhulHsg3HPOsCd1sbH4X
 lWLULMT2PQRlTF9WW1exIdi8GFRCUXVOaoJRan0xH6R7HXdUPqAFGHkRLsF7IDNAmfd0
 zHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690669636; x=1691274436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EnzyrkFL4lMdonbnk8Oi+28rkL+zjcT0UKuAISGu9Ok=;
 b=FWq/lT8z9FMsUKelETl1SQVw6HVuhw4mp95K+SY4jx5yhaAFjX/5tKdPuV7fhacdCx
 T+oF0rkWZR1g410N9dsBTXaUK+2j5LqmsvUUuE7+jvL5VcCdgfxLVmVa98UbH3c8LC6/
 C9lWMAp+s6CI9gXGBJqtR/5P1kw2DyOA82TYIOJg+ceW2NIGXvyPyGthtcUQyH5qvkm/
 et7itQfzzZ42BxYtMp/IsD7woKsYuv6vIsfcqGQ5jN86/DGLY1hBZUDPB9EnA9ch+vGw
 53dBTh48RxtOOmNZCn8d5hOmG47MpZCJNJ1CozLyDxjAut+gBeSQ6gpinvQ0q/DwcY4c
 +4dw==
X-Gm-Message-State: ABy/qLYEBpqMIMSXlAEXalCnqYSo9S7Pwymgbk0mGZyDZx5JKbQ5knRw
 n6ZCzFmwaHDBXJVoPAARgSchPw==
X-Google-Smtp-Source: APBJJlFlWmAM8HmuHbVCP+1bRsO7eA5Q5ahEkqFd+6snKAjILfZcOsho2huSCw28Kshrcqz8YUJJ1Q==
X-Received: by 2002:a2e:9803:0:b0:2b9:7168:da6a with SMTP id
 a3-20020a2e9803000000b002b97168da6amr4273573ljj.2.1690669636199; 
 Sat, 29 Jul 2023 15:27:16 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a2e9789000000b002b9ae051ea1sm1734737lji.113.2023.07.29.15.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 15:27:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 7/7] drm/msm/dpu: shift IRQ indices by 1
Date: Sun, 30 Jul 2023 01:27:08 +0300
Message-Id: <20230729222708.329265-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230729222708.329265-1-dmitry.baryshkov@linaro.org>
References: <20230729222708.329265-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  4 --
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  4 --
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  8 ----
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 10 -----
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  3 --
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  8 ----
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  3 --
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  1 -
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  3 --
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  1 -
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  1 -
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  8 ----
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  6 ---
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 13 -------
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 12 ------
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 12 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  9 +----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 14 +++----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 37 +++++++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  6 +--
 22 files changed, 38 insertions(+), 135 deletions(-)

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
index 126ad2707dba..b6ce46ab47ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -351,7 +351,7 @@ static int dpu_encoder_helper_wait_event_timeout(int32_t drm_id,
 		u32 irq_idx, struct dpu_encoder_wait_info *info);
 
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
-		int irq_idx,
+		unsigned int irq_idx,
 		void (*func)(void *arg),
 		struct dpu_encoder_wait_info *wait_info)
 {
@@ -1541,7 +1541,7 @@ void dpu_encoder_helper_trigger_start(struct dpu_encoder_phys *phys_enc)
 
 static int dpu_encoder_helper_wait_event_timeout(
 		int32_t drm_id,
-		u32 irq_idx,
+		unsigned int irq_idx,
 		struct dpu_encoder_wait_info *info)
 {
 	int rc = 0;
@@ -2545,8 +2545,6 @@ unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
 void dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
 			  struct dpu_enc_phys_init_params *p)
 {
-	int i;
-
 	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
 	phys_enc->hw_intf = p->hw_intf;
 	phys_enc->hw_wb = p->hw_wb;
@@ -2556,9 +2554,6 @@ void dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
 	phys_enc->enc_spinlock = p->enc_spinlock;
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 
-	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
-		phys_enc->irq[i] = -EINVAL;
-
 	atomic_set(&phys_enc->vblank_refcount, 0);
 	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
 	atomic_set(&phys_enc->pending_ctlstart_cnt, 0);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index f91661a69888..6f04c3d56e77 100644
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
 
@@ -364,7 +364,7 @@ void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
  * @Return: 0 or -ERROR
  */
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
-		int irq,
+		unsigned int irq,
 		void (*func)(void *arg),
 		struct dpu_encoder_wait_info *wait_info);
 
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
index 04e5b889c6d6..7d9b9f22cb57 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -201,13 +201,13 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 
 static inline bool dpu_core_irq_is_valid(int irq_idx)
 {
-	return irq_idx >= 0 && irq_idx < DPU_NUM_IRQS;
+	return irq_idx && irq_idx <= DPU_NUM_IRQS;
 }
 
 static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_hw_intr *intr,
-							       int irq_idx)
+							       unsigned int irq_idx)
 {
-	return &intr->irq_tbl[irq_idx];
+	return &intr->irq_tbl[irq_idx - 1];
 }
 
 /**
@@ -215,7 +215,7 @@ static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_hw_int
  * @dpu_kms:		Pointer to DPU's KMS structure
  * @irq_idx:		interrupt index
  */
-static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
+static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, unsigned int irq_idx)
 {
 	struct dpu_hw_intr_entry *irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
 
@@ -238,7 +238,7 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms)
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
 	int reg_idx;
-	int irq_idx;
+	unsigned int irq_idx;
 	u32 irq_status;
 	u32 enable_mask;
 	int bit;
@@ -294,7 +294,8 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms)
 	return IRQ_HANDLED;
 }
 
-static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
+static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr,
+					 unsigned int irq_idx)
 {
 	int reg_idx;
 	const struct dpu_intr_reg *reg;
@@ -349,7 +350,8 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 	return 0;
 }
 
-static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
+static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr,
+					  unsigned int irq_idx)
 {
 	int reg_idx;
 	const struct dpu_intr_reg *reg;
@@ -436,7 +438,8 @@ static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
 	wmb();
 }
 
-u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
+u32 dpu_core_irq_read(struct dpu_kms *dpu_kms,
+		      unsigned int irq_idx)
 {
 	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
 	int reg_idx;
@@ -500,7 +503,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 
 		intr->irq_mask |= BIT(MDP_INTFn_INTR(intf->id));
 
-		if (intf->intr_tear_rd_ptr != -1)
+		if (intf->intr_tear_rd_ptr)
 			intr->irq_mask |= BIT(DPU_IRQ_REG(intf->intr_tear_rd_ptr));
 	}
 
@@ -514,9 +517,10 @@ void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
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
@@ -563,7 +567,8 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 	return 0;
 }
 
-int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
+int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms,
+				     unsigned int irq_idx)
 {
 	struct dpu_hw_intr_entry *irq_entry;
 	unsigned long irq_flags;
@@ -606,7 +611,7 @@ static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 	int i, irq_count;
 	void *cb;
 
-	for (i = 0; i < DPU_NUM_IRQS; i++) {
+	for (i = 1; i <= DPU_NUM_IRQS; i++) {
 		spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
 		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
 		irq_count = atomic_read(&irq_entry->count);
@@ -642,7 +647,7 @@ void dpu_core_irq_preinstall(struct msm_kms *kms)
 	dpu_disable_all_irqs(dpu_kms);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
-	for (i = 0; i < DPU_NUM_IRQS; i++) {
+	for (i = 1; i <= DPU_NUM_IRQS; i++) {
 		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
 		atomic_set(&irq_entry->count, 0);
 	}
@@ -658,7 +663,7 @@ void dpu_core_irq_uninstall(struct msm_kms *kms)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	for (i = 0; i < DPU_NUM_IRQS; i++) {
+	for (i = 1; i <= DPU_NUM_IRQS; i++) {
 		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
 		if (irq_entry->cb)
 			DPU_ERROR("IRQ: [%d, %d] still enabled/registered\n",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 9df5d6e737a1..53a21ebc57e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -36,9 +36,9 @@ enum dpu_hw_intr_reg {
 
 #define MDP_INTFn_INTR(intf)	(MDP_INTF0_INTR + (intf - INTF_0))
 
-#define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
-#define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
-#define DPU_IRQ_BIT(irq_idx)	(irq_idx % 32)
+#define DPU_IRQ_IDX(reg_idx, offset)	(1 + reg_idx * 32 + offset)
+#define DPU_IRQ_REG(irq_idx)	((irq_idx - 1) / 32)
+#define DPU_IRQ_BIT(irq_idx)	((irq_idx - 1) % 32)
 
 #define DPU_NUM_IRQS		(MDP_INTR_MAX * 32)
 
-- 
2.39.2

