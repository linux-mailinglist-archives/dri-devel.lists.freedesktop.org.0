Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4393738904
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 17:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7923B10E4B6;
	Wed, 21 Jun 2023 15:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD60610E4B5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 15:27:28 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b4826ba943so45216521fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 08:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687361247; x=1689953247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9/23tT0yJ4hRHUR7E3FSZzQwm4+dob7HrAkXw2r+SVI=;
 b=TiyWkJOQW276iGgjzLyItP/GieijlhELxLLAwAjpgKg3tOTv1UAmtuAqILHscVpH2U
 FT+Nbig0RMUECZrdIhFNp/tHDunbD7ej2qFkcGkFK4aQ4ZtlYZnR/kFziOKBlUzCSbFh
 KzUT6AROAwmYDmcoA4wnWrRpgHtWefkuGRj4UDYpWbhJVZ64v3nEEMAJC0PtGj94gVpf
 V2qYw5Fil1LpdVHj30Xt5R/bV6aTO3C4RU2ebbCpdQhrQ4ugn10pI6O/HgfeW0ZDS8zp
 5pSFiFRrzci9feipGGPbIh2dvdYDI9ap2T5f7rk9IWZQPaMS36ruIpmqWB1iw4k0/6es
 czUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687361247; x=1689953247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9/23tT0yJ4hRHUR7E3FSZzQwm4+dob7HrAkXw2r+SVI=;
 b=M1jy6PiHzQbJ8qeBtnnCgj+U924pJsuGyjpO3C4hr+3lHYXNWffY1dLdIfgCMg+rJ2
 yq71cFiCLEM5U1CDMOIuAHhfk0MW7aO3KHOXnmyyYNKjW6hirXn118urM6YRwF7O73Xv
 c+IaF26ymcTe1C3l+vRVmT6Y5qp3TuPnSsBd6vGznspPdLly04zLnpbOZkXHuDTkgVKO
 uFB6wgmPRDz94wpQjUMgUg5RW3h4s8nNCFf+Qtvis/y1kzdkEWBtpiTdSujIsGPr/Xkn
 04KSrLjo3MpeUvxFp3lVyYkP15qZ4e75nRM/Vqu3MxhyX3Z/2OCBDnK65go7/bX+mg4k
 a2xA==
X-Gm-Message-State: AC+VfDwQzjLcHhaUFU/nO6WucA7GWJGgj/dFvWf57kWxHNAcD27o+7wb
 NsWZ9zgipvHYpL6vyH9WZMYu2Q==
X-Google-Smtp-Source: ACHHUZ72hIn4aeSFb0O6gT1d+CC0NWFzuemjxpX+m0wnQ+EnBMslfDVLGcxqnpDkATJOTgSH76TNuw==
X-Received: by 2002:a2e:3c0b:0:b0:2b4:7d67:787f with SMTP id
 j11-20020a2e3c0b000000b002b47d67787fmr5881421lja.32.1687361246943; 
 Wed, 21 Jun 2023 08:27:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a2e9b4b000000b002ad5f774579sm926408ljj.96.2023.06.21.08.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 08:27:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH 6/7] phy: qcom: qmp-combo: drop qmp_v6_dp_aux_init()
Date: Wed, 21 Jun 2023 18:27:18 +0300
Message-Id: <20230621152719.1025801-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621152719.1025801-1-dmitry.baryshkov@linaro.org>
References: <20230621152719.1025801-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only difference between qmp_v6_dp_aux_init() and
qmp_v4_dp_aux_init() is the address of COM_BIAS_EN_CLKBUFLR_EN register.
Move it to register layout and drop the duplicate function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 44 +++++++----------------
 1 file changed, 12 insertions(+), 32 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 80a5bebf86a2..ab6cfa02ecf9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -110,6 +110,7 @@ enum qphy_reg_layout {
 	QPHY_COM_RESETSM_CNTRL,
 	QPHY_COM_C_READY_STATUS,
 	QPHY_COM_CMN_STATUS,
+	QPHY_COM_BIAS_EN_CLKBUFLR_EN,
 
 	QPHY_DP_PHY_STATUS,
 
@@ -134,6 +135,7 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V3_COM_RESETSM_CNTRL,
 	[QPHY_COM_C_READY_STATUS]	= QSERDES_V3_COM_C_READY_STATUS,
 	[QPHY_COM_CMN_STATUS]		= QSERDES_V3_COM_CMN_STATUS,
+	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN,
 
 	[QPHY_DP_PHY_STATUS]		= QSERDES_V3_DP_PHY_STATUS,
 
@@ -157,6 +159,7 @@ static const unsigned int qmp_v45_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V4_COM_RESETSM_CNTRL,
 	[QPHY_COM_C_READY_STATUS]	= QSERDES_V4_COM_C_READY_STATUS,
 	[QPHY_COM_CMN_STATUS]		= QSERDES_V4_COM_CMN_STATUS,
+	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN,
 
 	[QPHY_DP_PHY_STATUS]		= QSERDES_V4_DP_PHY_STATUS,
 
@@ -180,6 +183,7 @@ static const unsigned int qmp_v5_5nm_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V5_COM_RESETSM_CNTRL,
 	[QPHY_COM_C_READY_STATUS]	= QSERDES_V5_COM_C_READY_STATUS,
 	[QPHY_COM_CMN_STATUS]		= QSERDES_V5_COM_CMN_STATUS,
+	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V5_COM_BIAS_EN_CLKBUFLR_EN,
 
 	[QPHY_DP_PHY_STATUS]		= QSERDES_V5_DP_PHY_STATUS,
 
@@ -203,6 +207,7 @@ static const unsigned int qmp_v6_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V6_COM_RESETSM_CNTRL,
 	[QPHY_COM_C_READY_STATUS]	= QSERDES_V6_COM_C_READY_STATUS,
 	[QPHY_COM_CMN_STATUS]		= QSERDES_V6_COM_CMN_STATUS,
+	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V6_COM_PLL_BIAS_EN_CLK_BUFLR_EN,
 
 	[QPHY_DP_PHY_STATUS]		= QSERDES_V6_DP_PHY_STATUS,
 
@@ -1433,8 +1438,6 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp);
 static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp);
 static int qmp_v4_calibrate_dp_phy(struct qmp_combo *qmp);
 
-static void qmp_v6_dp_aux_init(struct qmp_combo *qmp);
-
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
 {
 	u32 reg;
@@ -1870,7 +1873,7 @@ static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
 	.swing_hbr3_hbr2	= &qmp_dp_v5_voltage_swing_hbr3_hbr2,
 	.pre_emphasis_hbr3_hbr2 = &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
 
-	.dp_aux_init		= qmp_v6_dp_aux_init,
+	.dp_aux_init		= qmp_v4_dp_aux_init,
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
@@ -1945,6 +1948,8 @@ static int qmp_combo_dp_serdes_init(struct qmp_combo *qmp)
 
 static void qmp_v3_dp_aux_init(struct qmp_combo *qmp)
 {
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+
 	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
 	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
 	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
@@ -1952,7 +1957,7 @@ static void qmp_v3_dp_aux_init(struct qmp_combo *qmp)
 	/* Turn on BIAS current for PHY/PLL */
 	writel(QSERDES_V3_COM_BIAS_EN | QSERDES_V3_COM_BIAS_EN_MUX |
 	       QSERDES_V3_COM_CLKBUF_L_EN | QSERDES_V3_COM_EN_SYSCLK_TX_SEL,
-	       qmp->dp_serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
+	       qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
 
 	writel(DP_PHY_PD_CTL_PSR_PWRDN, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
 
@@ -1966,7 +1971,7 @@ static void qmp_v3_dp_aux_init(struct qmp_combo *qmp)
 	       QSERDES_V3_COM_BIAS_EN_MUX | QSERDES_V3_COM_CLKBUF_R_EN |
 	       QSERDES_V3_COM_CLKBUF_L_EN | QSERDES_V3_COM_EN_SYSCLK_TX_SEL |
 	       QSERDES_V3_COM_CLKBUF_RX_DRIVE_L,
-	       qmp->dp_serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
+	       qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
 
 	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG0);
 	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
@@ -2162,39 +2167,14 @@ static int qmp_v3_calibrate_dp_phy(struct qmp_combo *qmp)
 
 static void qmp_v4_dp_aux_init(struct qmp_combo *qmp)
 {
-	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
-	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
-	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
-
-	/* Turn on BIAS current for PHY/PLL */
-	writel(0x17, qmp->dp_serdes + QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN);
-
-	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG0);
-	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
-	writel(0xa4, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
-	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG3);
-	writel(0x0a, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG4);
-	writel(0x26, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG5);
-	writel(0x0a, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG6);
-	writel(0x03, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG7);
-	writel(0xb7, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG8);
-	writel(0x03, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG9);
-	qmp->dp_aux_cfg = 0;
-
-	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
-	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
-	       PHY_AUX_REQ_ERR_MASK,
-	       qmp->dp_dp_phy + QSERDES_V4_DP_PHY_AUX_INTERRUPT_MASK);
-}
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
-static void qmp_v6_dp_aux_init(struct qmp_combo *qmp)
-{
 	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
 	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
 	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
 
 	/* Turn on BIAS current for PHY/PLL */
-	writel(0x17, qmp->dp_serdes + QSERDES_V6_COM_PLL_BIAS_EN_CLK_BUFLR_EN);
+	writel(0x17, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
 
 	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG0);
 	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
-- 
2.39.2

