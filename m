Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AFD7219C9
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 22:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBAD10E0EC;
	Sun,  4 Jun 2023 20:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E8910E0EC
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 20:35:39 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f3b5881734so5076682e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 13:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685910938; x=1688502938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l7TtdrNZcx4KwLpw6/k/hT+39rIWAJkjoj+QCNqH8jg=;
 b=ec1+m1ALTadKe3j4jxgCpo6+c06B+mg+XjRvkUZOkph6hrPnC7b/VA8LCO8cRE67rD
 cSP+N5eb4XTij2ULDlXkBUqwPOQ587qfNSWvb8cCrVPGYbshRKBWGjyelLMSOn/GWuJE
 zWRmH0ir53+CiXuJ+ii6OjgQ6MONeIDOXaHkmdta34Pbcq2uPPVZv7AEoo1dkfS5cx/g
 vT7AUEPPe097ughgVqu7Y5yQW/miv5lBP7YymQVIO+p+ci3cRfXpFv3STr68jy0Jh1bL
 5MBauRTpqpj1eLapZ+52RvczYXTKKWkgD/nlZmbCWBq2s5wrLRmgnzDIdaXsypkqJUVr
 ocDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685910938; x=1688502938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l7TtdrNZcx4KwLpw6/k/hT+39rIWAJkjoj+QCNqH8jg=;
 b=RMbzmoaFRGbW6ySyN57mUgVXaMzAYiawxpqTSNjpBx7xsy4S87WA6uCOX/RpZ+80v3
 Cy/TLXAX2Nle94ykJqL+LVFU+vnu5u/V8VTxQSSBv9CF8VPubwDQgjW3vdYERiL1tHrh
 tG53yT6PpxL8/Y7BJGnAR5mvp0IHPP09gN4HOav8JYwuLvXjvh3GnP2wDGvc0DcfrHdI
 oXBfSD4Rj+nlk3Mx79THRfXTrE9Z4IIGehb5/Cfcg4vqrFgERM1ctgWojy5zllYQY/xf
 zC1YDALKERAOW+54PoezO6N9wz0WwWenATLRjcOA8Yfor+JuHVzEWhs79uOeCiYTIuMH
 4xeg==
X-Gm-Message-State: AC+VfDxZJGGsA0iBBoGpX6WGvUSbuTH1S2JM3G/Tx0wDBdFsPYc6xFS4
 uVqvCQMU1cimntpavRhIpu7TWA==
X-Google-Smtp-Source: ACHHUZ61rQJoTQD5a1TuD3xNFI+OF97BZ0MpWYhlTAVAFs0bVElYj+VhsyD01RanmShkBkFAY6zOLQ==
X-Received: by 2002:ac2:5473:0:b0:4f6:1805:6080 with SMTP id
 e19-20020ac25473000000b004f618056080mr1949354lfn.4.1685910938577; 
 Sun, 04 Jun 2023 13:35:38 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 13:35:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 04/22] drm/msm/dpu: always use MSM_DP/DSI_CONTROLLER_n
Date: Sun,  4 Jun 2023 23:35:14 +0300
Message-Id: <20230604203532.1094249-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
References: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
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

In several catalog entries we did not use existing MSM_DP_CONTROLLER_n
constants. Fill them in. Also use freshly defined MSM_DSI_CONTROLLER_n
for DSI interfaces.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 4 ++--
 13 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 3c732a0360c7..70a795f56fc9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -134,13 +134,13 @@ static const struct dpu_dspp_cfg msm8998_dspp[] = {
 };
 
 static const struct dpu_intf_cfg msm8998_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 21, INTF_SDM845_MASK,
+	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 21, INTF_SDM845_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 21, INTF_SDM845_MASK,
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_0, 21, INTF_SDM845_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
-	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 21, INTF_SDM845_MASK,
+	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_1, 21, INTF_SDM845_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
 	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_HDMI, 0, 21, INTF_SDM845_MASK,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 36ea1af10894..1d377f717a08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -132,16 +132,16 @@ static const struct dpu_dsc_cfg sdm845_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sdm845_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SDM845_MASK,
+	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SDM845_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 24, INTF_SDM845_MASK,
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SDM845_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
-	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 24, INTF_SDM845_MASK,
+	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SDM845_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SDM845_MASK,
+	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SDM845_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index d9a3432d4c13..db9fc5fadca8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -156,18 +156,18 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm8150_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
 			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SC7180_MASK,
+	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 60e82356f2f0..85d42b7d21ed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -160,11 +160,11 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
 			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index c308e9797dc6..8bdbd24fe0ba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -157,18 +157,18 @@ static const struct dpu_dsc_cfg sm8250_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm8250_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2c0, INTF_DSI, 1, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
 			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SC7180_MASK,
+	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index d92ce1fc8b9f..4ec6929aeca5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -90,7 +90,7 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index ba115770d3b2..102b6fa9dbed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -65,7 +65,7 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
 };
 
 static const struct dpu_intf_cfg sm6115_intf[] = {
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 8363df17509e..e476b8d51018 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -62,7 +62,7 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 };
 
 static const struct dpu_intf_cfg qcm2290_intf[] = {
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index e1c7d3b77d2f..01baa927a6cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -151,11 +151,11 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
 			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 79310d5f158c..6be5cce5ac7c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -107,7 +107,7 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 33ce23cf729a..9dc7d7a221f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -147,11 +147,11 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
 			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 47a719449798..6735deddbbf5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -157,11 +157,11 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
 			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 8c08c856d38c..46cd8bb6d17e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -161,11 +161,11 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
 			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
-- 
2.39.2

