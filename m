Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E6465A725
	for <lists+dri-devel@lfdr.de>; Sat, 31 Dec 2022 22:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9969410E119;
	Sat, 31 Dec 2022 21:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C6410E14E
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Dec 2022 21:50:27 +0000 (UTC)
Received: from localhost.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5C1D33ED10;
 Sat, 31 Dec 2022 22:50:25 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [RFC PATCH 1/7] drm/msm/dpu: Remove unused INTF0 interrupt mask from
 sm6115/qcm2290
Date: Sat, 31 Dec 2022 22:50:00 +0100
Message-Id: <20221231215006.211860-2-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221231215006.211860-1-marijn.suijten@somainline.org>
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Neither of these SoCs has INTF0, they only have a DSI interface on index
1.  Stop enabling an interrupt that can't fire.

Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on SM6115")
Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2196e205efa5..9814ad52cc04 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -90,6 +90,11 @@
 			 BIT(MDP_AD4_0_INTR) | \
 			 BIT(MDP_AD4_1_INTR))
 
+#define IRQ_QCM2290_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
+			 BIT(MDP_SSPP_TOP0_INTR2) | \
+			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+			 BIT(MDP_INTF1_INTR))
+
 #define IRQ_SC7180_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
 			 BIT(MDP_SSPP_TOP0_INTR2) | \
 			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
@@ -1884,7 +1889,7 @@ static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sm6115_perf_data,
-	.mdss_irqs = IRQ_SC7180_MASK,
+	.mdss_irqs = IRQ_QCM2290_MASK,
 };
 
 static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
@@ -2008,7 +2013,7 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.reg_dma_count = 1,
 	.dma_cfg = &sdm845_regdma,
 	.perf = &qcm2290_perf_data,
-	.mdss_irqs = IRQ_SC7180_MASK,
+	.mdss_irqs = IRQ_QCM2290_MASK,
 };
 
 static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
-- 
2.39.0

