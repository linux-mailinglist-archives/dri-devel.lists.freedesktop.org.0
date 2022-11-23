Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D286636BF0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 22:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A35410E62E;
	Wed, 23 Nov 2022 21:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0AC10E248
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 21:04:08 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id b3so29934859lfv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 13:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JzVHcmxorROJCIoZd11bHlIHsRKO6twZzQN8g754tbQ=;
 b=nFaNPBxwoQUeOP54oU2tx6S9FR7YelHx27WEFXWu2cHhEid2Uc+Dxs1Im0f0A6qLhl
 sKMtqk5GecHvGjBexFvK7oDz0oJlu9pORO9xa2unYAwyIWmz4jx867vEtVRRrHXIKqp4
 UFwdlz7HyN1R8H2RXlgA/SyW51ZAEtWcwqY6sewz9ldQiCIEFhfYAJZhhneaWCuffTAZ
 v4p5zJyGML4Khdam1NG0nQ04lI2x2jyb5Ctj6MiGtlJ2vDiNPhHWQQMZy/c++No860es
 aVMUM+QSyII+z7hIvIToiHE19Xz+4wAhxYdtBCMlu/2pEeqAjljFICejlxajxaMU6CRI
 mZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JzVHcmxorROJCIoZd11bHlIHsRKO6twZzQN8g754tbQ=;
 b=DnmvgifeVGMya397Sg2pTiVw+z0KB3I+kTsWVS3UoLPqYwqZFHytYthm2hlty2Efso
 0AI4p9t3nCeT9HVOy5m/ugGl9X5yoG0PWaYIjG6X2XAP6zJenJhHpn8cpxEL4vUdETCk
 qDYwV0n2/1xw6bf/OvOmUDylaH6HUpx5VgNCVXgCESOmVSH2VqU8xGyoNNDgRrjpmY4v
 9JrYhHjR/czOF42uHGttjNqK1Uy//5GojgxfqQl/gc3GOjzzkQ736SUQ9QBEm6wiKAWC
 hJv2oHR0/EssuX/EGOL6we+RUq80YmLM3MP9DBGy6ukPQk1aV+sJN8ROURuRw3RuibnO
 BqAg==
X-Gm-Message-State: ANoB5pl58nvgcesg8VqV6mK49/wf8PeH2V+pBQoU8Xqje7fxqCzjoJ/I
 9OboNHdvdpfqSIDN/7cQte4C1Q==
X-Google-Smtp-Source: AA0mqf5fNdtYcM2Pbvb4S8ZwzG7JXBqqwswezEyq8ghCbfoDfxeZv/69Kd5jc2D14MVJ5Qc0yrfZIw==
X-Received: by 2002:a19:6b0b:0:b0:4a2:44dc:b70c with SMTP id
 d11-20020a196b0b000000b004a244dcb70cmr9183696lfa.360.1669237448428; 
 Wed, 23 Nov 2022 13:04:08 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c3-20020ac25f63000000b004b177293a8dsm3009913lfc.210.2022.11.23.13.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 13:04:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v5 05/10] drm/msm/dsi/phy: rework register setting for 7nm PHY
Date: Wed, 23 Nov 2022 23:03:58 +0200
Message-Id: <20221123210403.3593366-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
References: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation to adding the sm8350 and sm8450 PHYs support, rearrange
register values calculations in dsi_7nm_phy_enable(). This change bears
no functional changes itself, it is merely a preparation for the next
patch.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 26 +++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 9e7fa7d88ead..0b780f9d3d0a 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -858,23 +858,34 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	/* Alter PHY configurations if data rate less than 1.5GHZ*/
 	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
 
+	if (phy->cphy_mode) {
+		vreg_ctrl_0 = 0x51;
+		vreg_ctrl_1 = 0x55;
+		glbl_pemph_ctrl_0 = 0x11;
+		lane_ctrl0 = 0x17;
+	} else {
+		vreg_ctrl_1 = 0x5c;
+		glbl_pemph_ctrl_0 = 0x00;
+		lane_ctrl0 = 0x1f;
+	}
+
 	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
-		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
 		if (phy->cphy_mode) {
 			glbl_rescode_top_ctrl = 0x00;
 			glbl_rescode_bot_ctrl = 0x3c;
 		} else {
+			vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
 			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
 			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
 		}
 		glbl_str_swi_cal_sel_ctrl = 0x00;
 		glbl_hstx_str_ctrl_0 = 0x88;
 	} else {
-		vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
 		if (phy->cphy_mode) {
 			glbl_str_swi_cal_sel_ctrl = 0x03;
 			glbl_hstx_str_ctrl_0 = 0x66;
 		} else {
+			vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
 			glbl_str_swi_cal_sel_ctrl = less_than_1500_mhz ? 0x03 : 0x00;
 			glbl_hstx_str_ctrl_0 = less_than_1500_mhz ? 0x66 : 0x88;
 		}
@@ -882,17 +893,6 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 		glbl_rescode_bot_ctrl = 0x3c;
 	}
 
-	if (phy->cphy_mode) {
-		vreg_ctrl_0 = 0x51;
-		vreg_ctrl_1 = 0x55;
-		glbl_pemph_ctrl_0 = 0x11;
-		lane_ctrl0 = 0x17;
-	} else {
-		vreg_ctrl_1 = 0x5c;
-		glbl_pemph_ctrl_0 = 0x00;
-		lane_ctrl0 = 0x1f;
-	}
-
 	/* de-assert digital and pll power down */
 	data = BIT(6) | BIT(5);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, data);
-- 
2.35.1

