Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD5276563B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BEC10E59B;
	Thu, 27 Jul 2023 14:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1474310E5A6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 14:45:51 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fe1489ced6so1860311e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690469149; x=1691073949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8bYdl5KO0mcXnWax9jXxtCfyWjeeAJPJsi/VIzVkVic=;
 b=itfDaqs7HG1PvaneA77u3yxpFVEjzr+x2nD+NNTolNZO4r6bTy8w1sRJnmh708/L2T
 llL1RNsyPmJcu3vfHJuvzpyjofXlfrAFMKww1+3EH2KSzq44GAWBkBUsDUx6A/toJ/SE
 +SIoFVc8PDafN1csvaD0lvhhqAM1QNhK3+5IHf5fbDl4jGkM1iFD4z3C41rV7cPrV5fs
 YKPlVGPBqG4s2kqEn3yvzmjf3oiXYa8/6dSwaiMjqSHqUS0O01S7M8h5trEKFYdS2buu
 /InT2Pf8RG8f6HdE+BW1+VSs0YEAXSd2tdRiX9mQgUZRyQsVjbacSatBuyhxdhpg3N4U
 PL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690469149; x=1691073949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8bYdl5KO0mcXnWax9jXxtCfyWjeeAJPJsi/VIzVkVic=;
 b=PtAl05/ObbWnjAPZjFAsOwm+rn5JJNePXux7v1IQBv27MZ0l3SgAH5Mhgcetesi55D
 +Ur7BYJZ9lFi79BFnfa+Z1MzqxROpNdT7FEuqLewDNQcYfLXV9cm5Y1d1hjHXHJyYLkQ
 iC+XODt/EZszOQz2cqRp0HUyaS9l6DSt8HOmm4fGi17/S90LJlyM/2/X7HB4xz+VOz6U
 fqWOKQPgT1S29wJaJ9bXqcIItjDyAT1TFIDO137LTQ/VYnUNA+esYnlGb0SY4Gc8ibaJ
 +5223xSzK69BfiIggqlThl14oNBjH0hnoN3eXlNSZ2AYvQWMsasxQ0GlmgaCkFUiK2Px
 MdgA==
X-Gm-Message-State: ABy/qLbNlsteOvxH2wFcacwJU/vbwspW65ZS+RKUVaC6FJsfs3OJj9K9
 AXG6D9jBirFq5QvlpTM9RfwMzw==
X-Google-Smtp-Source: APBJJlFXEKX6qD4sbH0evYtdKpRyhUlBnu9uQ1+tvFs6f71CfsKWz0gpYrTqKLCPzzu2NculrvIDjw==
X-Received: by 2002:a19:e612:0:b0:4f8:752f:3722 with SMTP id
 d18-20020a19e612000000b004f8752f3722mr1465424lfh.5.1690469149402; 
 Thu, 27 Jul 2023 07:45:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d28-20020ac2545c000000b004fb86662871sm334110lfn.233.2023.07.27.07.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 07:45:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 5/5] drm/msm/dpu: drop compatibility INTR defines
Date: Thu, 27 Jul 2023 17:45:43 +0300
Message-Id: <20230727144543.1483630-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
References: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While reworking interrupts masks, it was easier to keep old
MDP_INTFn_7xxx_INTR and MDP_INTFn_7xxx_TEAR_INTR symbols. Now it is time
to drop them and use unified symbol names.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  2 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h    |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h  |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h   | 13 -------------
 6 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 90efde5e9da5..941b585bd56f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -329,7 +329,7 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x2c4,
@@ -339,7 +339,7 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 0a5dcec343fc..b18bb7ce2f94 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -210,7 +210,7 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x39000, .len = 0x280,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 7b1395f9e710..b08096f0d50b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -344,7 +344,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
@@ -354,7 +354,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 4999f3d8f2e2..9e0ad71c12a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -352,7 +352,7 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
@@ -362,7 +362,7 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 401c6c2da367..2a19e4c0af1a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -366,7 +366,7 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
@@ -376,7 +376,7 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 6e0d0188edc6..dab761e54863 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -36,19 +36,6 @@ enum dpu_hw_intr_reg {
 
 #define MDP_INTFn_INTR(intf)	(MDP_INTF0_INTR + (intf - INTF_0))
 
-/* compatibility */
-#define MDP_INTF0_7xxx_INTR MDP_INTF0_INTR
-#define MDP_INTF1_7xxx_INTR MDP_INTF1_INTR
-#define MDP_INTF2_7xxx_INTR MDP_INTF2_INTR
-#define MDP_INTF3_7xxx_INTR MDP_INTF3_INTR
-#define MDP_INTF4_7xxx_INTR MDP_INTF4_INTR
-#define MDP_INTF5_7xxx_INTR MDP_INTF5_INTR
-#define MDP_INTF6_7xxx_INTR MDP_INTF6_INTR
-#define MDP_INTF7_7xxx_INTR MDP_INTF7_INTR
-#define MDP_INTF8_7xxx_INTR MDP_INTF8_INTR
-#define MDP_INTF1_7xxx_TEAR_INTR MDP_INTF1_TEAR_INTR
-#define MDP_INTF2_7xxx_TEAR_INTR MDP_INTF2_TEAR_INTR
-
 #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
 
 /**
-- 
2.39.2

