Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9BF72D597
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 02:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3566E10E2DD;
	Tue, 13 Jun 2023 00:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDEC10E2DF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 00:12:42 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f62cf9755eso5840002e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 17:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686615160; x=1689207160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oRVBObMQTmVt8I11EuaS6oqnf+s1jmU4aRKHB813oDU=;
 b=tQ0n8CPqN4N1iXZNWAp5/Ytmpx5HBc00hRSBt30CQNbGccKu0LmQVJdSg4+2keb0Tg
 AriDZPyibGAPrPUJPdtYoOO8v2Upp7YoLZdF2ZJ+EtpKLn/ctSWZQi6mfyNkY/yB0v6b
 csOTFMOVX8IwrdGQ4AaphM6dJ2iJFmlJNWQF+sHkhp61dZybsdFPpdzU1qnn6EuRNF6T
 SM7hsY/jYQOVg2wpLsXdq1eKj1rCRJ1scoshaaP/olaizShvCI55LqS1ODQclDFBE01U
 0cun1xKF9dZhfdEG1//R7vDnVAPfFGXcyQsJ5VyrvcgI7/TqydnVJgnB9og4Pq67+47B
 5K+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686615160; x=1689207160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oRVBObMQTmVt8I11EuaS6oqnf+s1jmU4aRKHB813oDU=;
 b=kM0odLxhyt1NfAfZA6dUqr4jnp9fVgu3nJUiHuMTwwu+UMsf7RGkaF0dw5gMHC34WG
 lpVq2SEgAe1zotZZcT32r3LopM+s7yvQU9rhYXiKiwz01yzKD1S38HxQGxLQY2DbxG5g
 kTz/o65bz6Pq++OVeS0uwKVKKV7jZhG4DY+//sUJRVo7fj8QwjyQBF9/6I8rcbRm6oMT
 nvVJ+rD8fkBbVAprTY01Ni1WWlSHQOflTfNNiUXVX57JVjLtxkJTtFqK5jfM+zs1SqI9
 HLJeUiMQmvryFrqPsg6oRYqMnHmtL4+kA7daEe/k3NeAgROw7vMCyj6OLNaHMxkUWzFb
 to+g==
X-Gm-Message-State: AC+VfDzNlCd1YseWkOHBjVtCAd/0+ER/lje/2oUffAPzPd2CqnwcW5t6
 gyDwjioWbFNYWFxlgI026aT3zA==
X-Google-Smtp-Source: ACHHUZ7zQ63qzQh6a2sE722MxbBTLl2SAMOdWpZNSsCVM7N4n3mEo+OY9jX562XRV1GRHPKV9Vp3qA==
X-Received: by 2002:a19:3807:0:b0:4ef:f11c:f5b0 with SMTP id
 f7-20020a193807000000b004eff11cf5b0mr4757205lfa.54.1686615160116; 
 Mon, 12 Jun 2023 17:12:40 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 h10-20020ac2596a000000b004efd3c2b746sm1586027lfp.162.2023.06.12.17.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 17:12:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 20/22] drm/msm/dpu: inline INTF_BLK and INTF_BLK_DSI_TE
 macros
Date: Tue, 13 Jun 2023 03:12:37 +0300
Message-Id: <20230613001239.3426881-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>v2-0018*>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>v2-0018*>
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

To simplify making changes to the hardware block definitions, expand
corresponding macros. This way making all the changes are more obvious
and visible in the source files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  52 ++++++--
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  53 ++++++--
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  55 ++++++--
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  82 +++++++++---
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  55 ++++++--
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  28 +++-
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  15 ++-
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  28 +++-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  15 ++-
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  15 ++-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  55 ++++++--
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  41 ++++--
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 120 +++++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  55 ++++++--
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  55 ++++++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  30 -----
 16 files changed, 545 insertions(+), 209 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index a71a6cd532c0..d78cedd35c01 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -243,18 +243,46 @@ static const struct dpu_dspp_cfg msm8998_dspp[] = {
 };
 
 static const struct dpu_intf_cfg msm8998_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 21, INTF_SDM845_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_0, 21, INTF_SDM845_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
-	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_1, 21, INTF_SDM845_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_HDMI, 0, 21, INTF_SDM845_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x6a000, .len = 0x280,
+		.features = INTF_SDM845_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 21,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x280,
+		.features = INTF_SDM845_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 21,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x6b000, .len = 0x280,
+		.features = INTF_SDM845_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 21,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x6b800, .len = 0x280,
+		.features = INTF_SDM845_MASK,
+		.type = INTF_HDMI,
+		.prog_fetch_lines_worst_case = 21,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_perf_cfg msm8998_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index e1bdc0cc45cd..de26f469ebb1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -257,18 +257,47 @@ static const struct dpu_dsc_cfg sdm845_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sdm845_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SDM845_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SDM845_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
-	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SDM845_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SDM845_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x6a000, .len = 0x280,
+		.features = INTF_SDM845_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x280,
+		.features = INTF_SDM845_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x6b000, .len = 0x280,
+		.features = INTF_SDM845_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x6b800, .len = 0x280,
+		.features = INTF_SDM845_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_perf_cfg sdm845_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 5f20272cd5aa..c8c702e4f045 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -306,20 +306,47 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm8150_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x6a000, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x2bc,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x6b000, .len = 0x2bc,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x6b800, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_perf_cfg sm8150_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 7439f0279a3c..11bf4cec0f95 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -313,27 +313,69 @@ static const struct dpu_dsc_cfg sc8180x_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sc8180x_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x6a000, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x2bc,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x6b000, .len = 0x2bc,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
+	},
 	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 999, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
-	INTF_BLK("intf_4", INTF_4, 0x6c000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21)),
-	INTF_BLK("intf_5", INTF_5, 0x6c800, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
+	{
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x6b800, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = 999,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_4", .id = INTF_4,
+		.base = 0x6c000, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_5", .id = INTF_5,
+		.base = 0x6c800, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_2,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_perf_cfg sc8180x_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 60e71cbc5e27..bf35b5bf0cd1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -306,20 +306,47 @@ static const struct dpu_dsc_cfg sm8250_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm8250_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x6a000, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x2c0,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x6b000, .len = 0x2c0,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x6b800, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_wb_cfg sm8250_wb[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 904c758a60df..0f59e372cf3e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -138,13 +138,27 @@ static const struct dpu_pingpong_cfg sc7180_pp[] = {
 };
 
 static const struct dpu_intf_cfg sc7180_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x6a000, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x2c0,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	},
 };
 
 static const struct dpu_wb_cfg sc7180_wb[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 4236cd7317a1..f01eac27f405 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -94,10 +94,17 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
 };
 
 static const struct dpu_intf_cfg sm6115_intf[] = {
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
+	{
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x2c0,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	},
 };
 
 static const struct dpu_perf_cfg sm6115_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index d09ee048dab1..abce624e7d33 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -155,13 +155,27 @@ static const struct dpu_dsc_cfg sm6350_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm6350_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 35, INTF_SC7180_MASK,
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 35, INTF_SC7180_MASK,
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x6a000, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = 0,
+		.prog_fetch_lines_worst_case = 35,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x2c0,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = 0,
+		.prog_fetch_lines_worst_case = 35,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	},
 };
 
 static const struct dpu_perf_cfg sm6350_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index c6bf487e131b..cb486bea6628 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -91,10 +91,17 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 };
 
 static const struct dpu_intf_cfg qcm2290_intf[] = {
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
+	{
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x2c0,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	},
 };
 
 static const struct dpu_perf_cfg qcm2290_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index c5bf22d14d1b..6864ac4bb3ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -104,10 +104,17 @@ static const struct dpu_dsc_cfg sm6375_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm6375_intf[] = {
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
+	{
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x2c0,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = 0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	},
 };
 
 static const struct dpu_perf_cfg sm6375_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 108e35cbcd90..d5191a663ae1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -313,20 +313,47 @@ static const struct dpu_dsc_cfg sm8350_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm8350_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
-	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x34000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x35000, .len = 0x2c4,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x36000, .len = 0x2c4,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x37000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_perf_cfg sm8350_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index fcccb9849563..cddceb8d5705 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -191,16 +191,37 @@ static const struct dpu_dsc_cfg sc7280_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sc7280_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
-	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x34000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x35000, .len = 0x2c4,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
+	}, {
+		.name = "intf_5", .id = INTF_5,
+		.base = 0x39000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_perf_cfg sc7280_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 062b17dedec7..9f94cc6369dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -328,35 +328,97 @@ static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
 
 /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
 static const struct dpu_intf_cfg sc8280xp_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
-	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
-	INTF_BLK("intf_4", INTF_4, 0x38000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21)),
-	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_3, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
-	INTF_BLK("intf_6", INTF_6, 0x3a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17)),
-	INTF_BLK("intf_7", INTF_7, 0x3b000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 19)),
-	INTF_BLK("intf_8", INTF_8, 0x3c000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x34000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x35000, .len = 0x300,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x36000, .len = 0x300,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x37000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_NONE,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_4", .id = INTF_4,
+		.base = 0x38000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_5", .id = INTF_5,
+		.base = 0x39000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_3,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_6", .id = INTF_6,
+		.base = 0x3a000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_2,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_7", .id = INTF_7,
+		.base = 0x3b000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_NONE,
+		.controller_id = MSM_DP_CONTROLLER_2,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 19),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_8", .id = INTF_8,
+		.base = 0x3c000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_NONE,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_perf_cfg sc8280xp_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index d92af1410c3e..517629c4a168 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -337,20 +337,47 @@ static const struct dpu_dsc_cfg sm8450_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm8450_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
-	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x34000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x35000, .len = 0x300,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x36000, .len = 0x300,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x37000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_perf_cfg sm8450_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 32ffb9a9cfc7..ed1d1d4092e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -351,20 +351,47 @@ static const struct dpu_dsc_cfg sm8550_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm8550_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
-	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x34000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x35000, .len = 0x300,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x36000, .len = 0x300,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x37000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+		.intr_tear_rd_ptr = -1,
+	},
 };
 
 static const struct dpu_perf_cfg sm8550_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index d2bca1ec0e63..6acd34e61aca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -463,36 +463,6 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
 	.ctl = {.base = 0xF80, .len = 0x10},
 };
 
-/*************************************************************
- * INTF sub blocks config
- *************************************************************/
-#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _underrun, _vsync) \
-	{\
-	.name = _name, .id = _id, \
-	.base = _base, .len = _len, \
-	.features = _features, \
-	.type = _type, \
-	.controller_id = _ctrl_id, \
-	.prog_fetch_lines_worst_case = _progfetch, \
-	.intr_underrun = _underrun, \
-	.intr_vsync = _vsync, \
-	.intr_tear_rd_ptr = -1, \
-	}
-
-/* DSI Interface sub-block with TEAR registers (since DPU 5.0.0) */
-#define INTF_BLK_DSI_TE(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _underrun, _vsync, _tear_rd_ptr) \
-	{\
-	.name = _name, .id = _id, \
-	.base = _base, .len = _len, \
-	.features = _features, \
-	.type = _type, \
-	.controller_id = _ctrl_id, \
-	.prog_fetch_lines_worst_case = _progfetch, \
-	.intr_underrun = _underrun, \
-	.intr_vsync = _vsync, \
-	.intr_tear_rd_ptr = _tear_rd_ptr, \
-	}
-
 /*************************************************************
  * VBIF sub blocks config
  *************************************************************/
-- 
2.39.2

