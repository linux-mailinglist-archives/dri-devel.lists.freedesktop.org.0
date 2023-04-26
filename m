Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2796EFD67
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 00:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3652710EA68;
	Wed, 26 Apr 2023 22:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814D010EA4C;
 Wed, 26 Apr 2023 22:37:33 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7B373201EE;
 Thu, 27 Apr 2023 00:37:31 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 27 Apr 2023 00:37:33 +0200
Subject: [PATCH v4 19/22] drm/msm/dpu: Add TEAR-READ-pointer interrupt to
 INTF block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-dpu-intf-te-v4-19-27ce1a5ab5c6@somainline.org>
References: <20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org>
In-Reply-To: <20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Adam Skladowski <a39.skl@gmail.com>, Loic Poulain <loic.poulain@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All SoCs since DPU 5.0.0 have the tear interrupt registers moved out of
the PINGPONG block and into the INTF block.  The new interrupts are
described in dpu_hw_interrupts.c, now wire them up in individual SoC
catalog files by setting the intr_tear_rd_ptr to the IRQ index spcified
in the offset table and enabling this set of DPU interrupts via the
mdss_irqs bitmask.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 12 ++++++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 12 ++++++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 12 ++++++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  8 +++++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  8 +++++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  8 +++++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 12 ++++++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  6 ++++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 12 ++++++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 13 ++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 15 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 ++
 13 files changed, 92 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index e9c1c624ee950..544e65a690c5b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -165,12 +165,14 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
-	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
 	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
@@ -236,7 +238,9 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
 		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
 		     BIT(MDP_INTF0_INTR) | \
 		     BIT(MDP_INTF1_INTR) | \
+		     BIT(MDP_INTF1_TEAR_INTR) | \
 		     BIT(MDP_INTF2_INTR) | \
+		     BIT(MDP_INTF2_TEAR_INTR) | \
 		     BIT(MDP_INTF3_INTR) | \
 		     BIT(MDP_AD4_0_INTR) | \
 		     BIT(MDP_AD4_1_INTR),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index d096d90fd227b..0f758860dec7f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -146,12 +146,14 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
-	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
 	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
 	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 999, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -218,7 +220,9 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
 		     BIT(MDP_INTF0_INTR) | \
 		     BIT(MDP_INTF1_INTR) | \
+		     BIT(MDP_INTF1_TEAR_INTR) | \
 		     BIT(MDP_INTF2_INTR) | \
+		     BIT(MDP_INTF2_TEAR_INTR) | \
 		     BIT(MDP_INTF3_INTR) | \
 		     BIT(MDP_INTF4_INTR) | \
 		     BIT(MDP_INTF5_INTR) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 7cc82de95a1e9..041dce7833d9e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -166,12 +166,14 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
-	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2c0, INTF_DSI, 1, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2c0, INTF_DSI, 1, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
 	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
@@ -244,7 +246,9 @@ const struct dpu_mdss_cfg dpu_sm8250_cfg = {
 		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
 		     BIT(MDP_INTF0_INTR) | \
 		     BIT(MDP_INTF1_INTR) | \
+		     BIT(MDP_INTF1_TEAR_INTR) | \
 		     BIT(MDP_INTF2_INTR) | \
+		     BIT(MDP_INTF2_TEAR_INTR) | \
 		     BIT(MDP_INTF3_INTR) | \
 		     BIT(MDP_INTF4_INTR),
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index de0894f7a594f..0554f85c9c50f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -88,9 +88,10 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
 };
 
 static const struct dpu_wb_cfg sc7180_wb[] = {
@@ -154,7 +155,8 @@ const struct dpu_mdss_cfg dpu_sc7180_cfg = {
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
 		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
 		     BIT(MDP_INTF0_INTR) | \
-		     BIT(MDP_INTF1_INTR),
+		     BIT(MDP_INTF1_INTR) | \
+		     BIT(MDP_INTF1_TEAR_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 88a0d6119ad50..5509ceb5d55bd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -67,9 +67,10 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
 
 static const struct dpu_intf_cfg sm6115_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
 };
 
 static const struct dpu_perf_cfg sm6115_perf_data = {
@@ -124,7 +125,8 @@ const struct dpu_mdss_cfg dpu_sm6115_cfg = {
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
 		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF1_INTR),
+		     BIT(MDP_INTF1_INTR) | \
+		     BIT(MDP_INTF1_TEAR_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index cd6f4048f286b..22b8a173d2142 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -64,9 +64,10 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 
 static const struct dpu_intf_cfg qcm2290_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
 };
 
 static const struct dpu_perf_cfg qcm2290_perf_data = {
@@ -114,7 +115,8 @@ const struct dpu_mdss_cfg dpu_qcm2290_cfg = {
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
 		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF1_INTR),
+		     BIT(MDP_INTF1_INTR) | \
+		     BIT(MDP_INTF1_TEAR_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 5b5834fc02063..07aaf7b50e708 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -157,12 +157,14 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
-	INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
 	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
@@ -227,7 +229,9 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
 		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
 		     BIT(MDP_INTF0_7xxx_INTR) | \
 		     BIT(MDP_INTF1_7xxx_INTR) | \
+		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
 		     BIT(MDP_INTF2_7xxx_INTR) | \
+		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
 		     BIT(MDP_INTF3_7xxx_INTR),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 2e04438a9cbc1..56467137a1b93 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -97,9 +97,10 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
 	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
@@ -158,6 +159,7 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
 		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
 		     BIT(MDP_INTF0_7xxx_INTR) | \
 		     BIT(MDP_INTF1_7xxx_INTR) | \
+		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
 		     BIT(MDP_INTF5_7xxx_INTR),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index e9841a278b8cf..808aacdddc28d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -146,12 +146,14 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
-	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
 	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
@@ -228,7 +230,9 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
 		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
 		     BIT(MDP_INTF0_7xxx_INTR) | \
 		     BIT(MDP_INTF1_7xxx_INTR) | \
+		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
 		     BIT(MDP_INTF2_7xxx_INTR) | \
+		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
 		     BIT(MDP_INTF3_7xxx_INTR) | \
 		     BIT(MDP_INTF4_7xxx_INTR) | \
 		     BIT(MDP_INTF5_7xxx_INTR) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 8a21b4946e2ef..6ecdc2c8d4552 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -165,12 +165,14 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
-	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
 	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
@@ -235,7 +237,9 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
 		     BIT(MDP_INTF0_7xxx_INTR) | \
 		     BIT(MDP_INTF1_7xxx_INTR) | \
+		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
 		     BIT(MDP_INTF2_7xxx_INTR) | \
+		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
 		     BIT(MDP_INTF3_7xxx_INTR),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 55c72419964d1..497b34c035eff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -169,13 +169,14 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	/* TODO TE sub-blocks for intf1 & intf2 */
-	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
-	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
 	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
@@ -240,7 +241,9 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
 		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
 		     BIT(MDP_INTF0_7xxx_INTR) | \
 		     BIT(MDP_INTF1_7xxx_INTR) | \
+		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
 		     BIT(MDP_INTF2_7xxx_INTR) | \
+		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
 		     BIT(MDP_INTF3_7xxx_INTR),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 49244eb05a176..9daeaccc4f526 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -550,6 +550,21 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.prog_fetch_lines_worst_case = _progfetch, \
 	.intr_underrun = _underrun, \
 	.intr_vsync = _vsync, \
+	.intr_tear_rd_ptr = -1, \
+	}
+
+/* DSI Interface sub-block with TEAR registers (since DPU 5.0.0) */
+#define INTF_BLK_DSI_TE(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _underrun, _vsync, _tear_rd_ptr) \
+	{\
+	.name = _name, .id = _id, \
+	.base = _base, .len = _len, \
+	.features = _features, \
+	.type = _type, \
+	.controller_id = _ctrl_id, \
+	.prog_fetch_lines_worst_case = _progfetch, \
+	.intr_underrun = _underrun, \
+	.intr_vsync = _vsync, \
+	.intr_tear_rd_ptr = _tear_rd_ptr, \
 	}
 
 /*************************************************************
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 599e177b89dd2..e9237321df77a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -631,6 +631,7 @@ struct dpu_dsc_cfg {
  * @prog_fetch_lines_worst_case	Worst case latency num lines needed to prefetch
  * @intr_underrun:	index for INTF underrun interrupt
  * @intr_vsync:	        index for INTF VSYNC interrupt
+ * @intr_tear_rd_ptr:  Index for INTF TEAR_RD_PTR interrupt
  */
 struct dpu_intf_cfg  {
 	DPU_HW_BLK_INFO;
@@ -639,6 +640,7 @@ struct dpu_intf_cfg  {
 	u32 prog_fetch_lines_worst_case;
 	s32 intr_underrun;
 	s32 intr_vsync;
+	s32 intr_tear_rd_ptr;
 };
 
 /**

-- 
2.40.1

