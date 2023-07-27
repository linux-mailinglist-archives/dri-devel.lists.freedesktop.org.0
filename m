Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FCC765511
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 15:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6229E10E585;
	Thu, 27 Jul 2023 13:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D7D10E586
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 13:32:00 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fe15bfb1adso1644603e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 06:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690464719; x=1691069519;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UPE4TBElDR4y39lTmG7JZpz2ESdKsKwdorqzx2sJXLk=;
 b=VjGQP1G8bE6Yo9Wis2AmqBqq+Ohbe9w47dUzYYg0XKyyTPx4ZNTouG0dcmMOf6iPbf
 /LSAUgAmtk+Mgn0w1jILRq5n3gFt5N7VDFznOwlzn1Pt+7SdILRrqGRka3cZTq7PVDt2
 KgmEGlJ7+3sZ71iJPJRpCcVAonL3y4KWYaY9/0A9TE6c8u9oqrtMXw7pmdlT2bcEdMYY
 JpH/tobBWXwE438coBX2BIJNQM6oEa0PENz+Jp5DKF9cPlVpMNkrHceiwVDJRdnoWhkv
 G8BvElLnQ36AfDSR/p46x5Pu4Gct7225SVQI2cgCxy2TrA3wMlPw1vXjrKjEfuk48Rwm
 FKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690464719; x=1691069519;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UPE4TBElDR4y39lTmG7JZpz2ESdKsKwdorqzx2sJXLk=;
 b=VFEvrRH+ekzkysTMvYWVRMLML+JfKOFkaiz8nU3vv0mCIkgxnZNa2gmvSD6wigIESY
 s7ERcbBVta5g4kaF1bKsmOKf4WgDFC7ZPbpn+Kwdo9fa7NY7tEaIBDC6APU8Fw0navCx
 9IeIC/Y0HJxWcZTsSNFxGzNKUO3AmvSBAHMOrk2V8oZcxUXpegh94scHOfq5Bhm9jDyK
 3zEQBPhRaQ5i5UyDKXxg1ZqGbMVWUyjpZjajhIzyTEGoABzGOPFpVWD8az/CKqY7Qiuw
 H38fGp+uKqf6XuNxKnfc1keB2niSndaO/6kk9nAEllTCILQTGQHU5bTHiqWrks8WdJ4a
 VxBg==
X-Gm-Message-State: ABy/qLaeVTL8SFMqYejmSM5yzNKC78XNmHpBfuCTK4PS8zKFPzAizfzL
 8aV4QzIx2cfyaxrtsvVCuLU9Ng==
X-Google-Smtp-Source: APBJJlEDmM1BSpqzVe6Y3lmlxHjlkfkJ6hm/eI5liACr3UamJt1tnyQaYCGWWKFEV6NcgMuafhg/oQ==
X-Received: by 2002:a19:771d:0:b0:4fe:1b7a:dfc9 with SMTP id
 s29-20020a19771d000000b004fe1b7adfc9mr592877lfc.64.1690464719265; 
 Thu, 27 Jul 2023 06:31:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a05651204c900b004f85628ec34sm313511lfq.33.2023.07.27.06.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 06:31:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 5/5] drm/msm/dpu: drop compatibility INTR defines
Date: Thu, 27 Jul 2023 16:31:54 +0300
Message-Id: <20230727133154.1421721-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727133154.1421721-1-dmitry.baryshkov@linaro.org>
References: <20230727133154.1421721-1-dmitry.baryshkov@linaro.org>
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
index f0b92c9e3b09..4a46c0900e04 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -39,19 +39,6 @@ enum dpu_hw_intr_reg {
 				   intf == INTF_2 ? MDP_INTF2_TEAR_INTR : \
 				   -1)
 
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

