Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD4A7388FF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 17:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD18910E4AE;
	Wed, 21 Jun 2023 15:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBA310E4B2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 15:27:24 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b45bc83f26so85259221fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 08:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687361243; x=1689953243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w6UGMmKiSJ87dVKJCq6xTOUGaCMzpqDueTLzydEjdu0=;
 b=QZXGtmQF62OQJm5FwnA3w98/XGxgxSDQC6lOmNIllVn7/5Aopv8RKCucz5E1J8URUp
 is/K62+zrCtrXMOmFUGAodFzSGVUBeLzJbx5dW8eHFGwShh24pB3hCYzTlk1D2faBi2c
 chRLXKTam5gasaBZ4QFtkmY6Tsy/C0tRknFXEwQp+aMQHKqtmwXsSPluEIlED0kVkAUA
 zgLW6BssoR0G9rURe2JSn81tZGthn8k33wqGReVxRHYOlW/sGCD3LKy29SOVO7UT0uxg
 ziixa4YOogeY7Aq24FtxFtF0i7DAPjiDVKK6cP3VJb2CNciF5HFnowUy7k/a1RPFLXNb
 YrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687361243; x=1689953243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w6UGMmKiSJ87dVKJCq6xTOUGaCMzpqDueTLzydEjdu0=;
 b=H5DvUC+NppXw4x0GySGDcYfLIBJ3C2AMt2pK+X4GS2mIDdWhH2N1Wql88RDTyrFnpw
 +OHbaRXi2UxCuHSOLvRqq69PpDIqGJCWMjhDWvKZA5rXUcGvJPdGHBMuwimgvyJqNHpt
 ++u1a3qRa+t8dh3uYgajPl/aJsCrfMwGdVz4DnPW07dE9v9Ajh6P0KM6veu/ITGthlCF
 gy8J5BnNz7OYX4lOkJ6NllEi0qjI15Y3nmLIzw3ALcuNY0g6NwuKR8KmfyHfdNGK0Mf5
 LZ+MWJy7V4JIaBdfvKRiVa3EX3S8q2cc8ppKnXG451effwIya+2gd3ZQR8ZIHemju0Du
 a5FA==
X-Gm-Message-State: AC+VfDxroP+0qObqnji+wpZOBRxiNRRahUSNDouh0vpLwRVSYsqq7vBr
 q/CqbfU3pSpYcrXKhsoC/mLeBw==
X-Google-Smtp-Source: ACHHUZ6OQHpZLmOn+GB2U9YmlbdTWYs7FWVBDehg+O3BdWjlPMbOnSI4grwgrF3oLw2g5VzKtoBPmQ==
X-Received: by 2002:a2e:8797:0:b0:2b4:430a:83f3 with SMTP id
 n23-20020a2e8797000000b002b4430a83f3mr10052145lji.53.1687361242538; 
 Wed, 21 Jun 2023 08:27:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a2e9b4b000000b002ad5f774579sm926408ljj.96.2023.06.21.08.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 08:27:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH 2/7] phy: qcom: qmp-combo: reuse register layouts for more
 registers
Date: Wed, 21 Jun 2023 18:27:14 +0300
Message-Id: <20230621152719.1025801-3-dmitry.baryshkov@linaro.org>
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

Instead of passing additional registers to qmp_v456_configure_dp_phy(),
reuse qphy_reg_layout and add those registers to register layout maps.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 100 ++++++++++++++--------
 1 file changed, 64 insertions(+), 36 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 9d03b7b8e00c..5a0966e66cc1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -106,6 +106,13 @@ enum qphy_reg_layout {
 	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
 	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
 	QPHY_PCS_POWER_DOWN_CONTROL,
+
+	QPHY_COM_RESETSM_CNTRL,
+	QPHY_COM_C_READY_STATUS,
+	QPHY_COM_CMN_STATUS,
+
+	QPHY_DP_PHY_STATUS,
+
 	/* Keep last to ensure regs_layout arrays are properly initialized */
 	QPHY_LAYOUT_SIZE
 };
@@ -117,9 +124,15 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V3_PCS_POWER_DOWN_CONTROL,
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V3_PCS_AUTONOMOUS_MODE_CTRL,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V3_PCS_LFPS_RXTERM_IRQ_CLEAR,
+
+	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V3_COM_RESETSM_CNTRL,
+	[QPHY_COM_C_READY_STATUS]	= QSERDES_V3_COM_C_READY_STATUS,
+	[QPHY_COM_CMN_STATUS]		= QSERDES_V3_COM_CMN_STATUS,
+
+	[QPHY_DP_PHY_STATUS]		= QSERDES_V3_DP_PHY_STATUS,
 };
 
-static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
+static const unsigned int qmp_v45_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= QPHY_V4_PCS_SW_RESET,
 	[QPHY_START_CTRL]		= QPHY_V4_PCS_START_CONTROL,
 	[QPHY_PCS_STATUS]		= QPHY_V4_PCS_PCS_STATUS1,
@@ -128,6 +141,29 @@ static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	/* In PCS_USB */
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
+
+	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V4_COM_RESETSM_CNTRL,
+	[QPHY_COM_C_READY_STATUS]	= QSERDES_V4_COM_C_READY_STATUS,
+	[QPHY_COM_CMN_STATUS]		= QSERDES_V4_COM_CMN_STATUS,
+
+	[QPHY_DP_PHY_STATUS]		= QSERDES_V4_DP_PHY_STATUS,
+};
+
+static const unsigned int qmp_v6_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= QPHY_V5_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V5_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V5_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V5_PCS_POWER_DOWN_CONTROL,
+
+	/* In PCS_USB */
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
+
+	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V6_COM_RESETSM_CNTRL,
+	[QPHY_COM_C_READY_STATUS]	= QSERDES_V6_COM_C_READY_STATUS,
+	[QPHY_COM_CMN_STATUS]		= QSERDES_V6_COM_CMN_STATUS,
+
+	[QPHY_DP_PHY_STATUS]		= QSERDES_V6_DP_PHY_STATUS,
 };
 
 static const struct qmp_phy_init_tbl qmp_v3_usb3_serdes_tbl[] = {
@@ -1564,7 +1600,7 @@ static const struct qmp_phy_cfg sc8180x_usb3dpphy_cfg = {
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v4_usb3phy_regs_layout,
+	.regs			= qmp_v45_usb3phy_regs_layout,
 	.pcs_usb_offset		= 0x300,
 
 	.has_pwrdn_delay	= true,
@@ -1612,7 +1648,7 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v4_usb3phy_regs_layout,
+	.regs			= qmp_v45_usb3phy_regs_layout,
 };
 
 static const struct qmp_phy_cfg sm6350_usb3dpphy_cfg = {
@@ -1702,7 +1738,7 @@ static const struct qmp_phy_cfg sm8250_usb3dpphy_cfg = {
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v4_usb3phy_regs_layout,
+	.regs			= qmp_v45_usb3phy_regs_layout,
 	.pcs_usb_offset		= 0x300,
 
 	.has_pwrdn_delay	= true,
@@ -1752,7 +1788,7 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_cfg = {
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v4_usb3phy_regs_layout,
+	.regs			= qmp_v45_usb3phy_regs_layout,
 
 	.has_pwrdn_delay	= true,
 };
@@ -1795,7 +1831,7 @@ static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
 	.configure_dp_phy	= qmp_v6_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
-	.regs			= qmp_v4_usb3phy_regs_layout,
+	.regs			= qmp_v6_usb3phy_regs_layout,
 	.clk_list		= qmp_v4_phy_clk_l,
 	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -1994,6 +2030,7 @@ static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
 static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	u32 phy_vco_div, status;
 	unsigned long pixel_freq;
 
@@ -2034,9 +2071,9 @@ static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp)
 	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	writel(0x20, qmp->dp_serdes + QSERDES_V3_COM_RESETSM_CNTRL);
+	writel(0x20, qmp->dp_serdes + cfg->regs[QPHY_COM_RESETSM_CNTRL]);
 
-	if (readl_poll_timeout(qmp->dp_serdes + QSERDES_V3_COM_C_READY_STATUS,
+	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_C_READY_STATUS],
 			status,
 			((status & BIT(0)) > 0),
 			500,
@@ -2045,7 +2082,7 @@ static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp)
 
 	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V3_DP_PHY_STATUS,
+	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
 			status,
 			((status & BIT(1)) > 0),
 			500,
@@ -2056,7 +2093,7 @@ static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp)
 	udelay(2000);
 	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	return readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V3_DP_PHY_STATUS,
+	return readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
 			status,
 			((status & BIT(1)) > 0),
 			500,
@@ -2148,13 +2185,10 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
 			QSERDES_V4_TX_TX_EMP_POST1_LVL);
 }
 
-static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp,
-				     unsigned int com_resetm_ctrl_reg,
-				     unsigned int com_c_ready_status_reg,
-				     unsigned int com_cmn_status_reg,
-				     unsigned int dp_phy_status_reg)
+static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	u32 phy_vco_div, status;
 	unsigned long pixel_freq;
 
@@ -2199,23 +2233,23 @@ static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp,
 	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	writel(0x20, qmp->dp_serdes + com_resetm_ctrl_reg);
+	writel(0x20, qmp->dp_serdes + cfg->regs[QPHY_COM_RESETSM_CNTRL]);
 
-	if (readl_poll_timeout(qmp->dp_serdes + com_c_ready_status_reg,
+	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_C_READY_STATUS],
 			status,
 			((status & BIT(0)) > 0),
 			500,
 			10000))
 		return -ETIMEDOUT;
 
-	if (readl_poll_timeout(qmp->dp_serdes + com_cmn_status_reg,
+	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
 			status,
 			((status & BIT(0)) > 0),
 			500,
 			10000))
 		return -ETIMEDOUT;
 
-	if (readl_poll_timeout(qmp->dp_serdes + com_cmn_status_reg,
+	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
 			status,
 			((status & BIT(1)) > 0),
 			500,
@@ -2224,14 +2258,14 @@ static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp,
 
 	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	if (readl_poll_timeout(qmp->dp_dp_phy + dp_phy_status_reg,
+	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
 			status,
 			((status & BIT(0)) > 0),
 			500,
 			10000))
 		return -ETIMEDOUT;
 
-	if (readl_poll_timeout(qmp->dp_dp_phy + dp_phy_status_reg,
+	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
 			status,
 			((status & BIT(1)) > 0),
 			500,
@@ -2243,16 +2277,14 @@ static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp,
 
 static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp)
 {
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
 	u32 status;
 	int ret;
 
-	ret = qmp_v456_configure_dp_phy(qmp, QSERDES_V4_COM_RESETSM_CNTRL,
-					QSERDES_V4_COM_C_READY_STATUS,
-					QSERDES_V4_COM_CMN_STATUS,
-					QSERDES_V4_DP_PHY_STATUS);
+	ret = qmp_v456_configure_dp_phy(qmp);
 	if (ret < 0)
 		return ret;
 
@@ -2287,7 +2319,7 @@ static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp)
 	udelay(2000);
 	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V4_DP_PHY_STATUS,
+	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
 			status,
 			((status & BIT(1)) > 0),
 			500,
@@ -2308,16 +2340,14 @@ static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp)
 
 static int qmp_v5_configure_dp_phy(struct qmp_combo *qmp)
 {
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
 	u32 status;
 	int ret;
 
-	ret = qmp_v456_configure_dp_phy(qmp, QSERDES_V4_COM_RESETSM_CNTRL,
-					QSERDES_V4_COM_C_READY_STATUS,
-					QSERDES_V4_COM_CMN_STATUS,
-					QSERDES_V4_DP_PHY_STATUS);
+	ret = qmp_v456_configure_dp_phy(qmp);
 	if (ret < 0)
 		return ret;
 
@@ -2347,7 +2377,7 @@ static int qmp_v5_configure_dp_phy(struct qmp_combo *qmp)
 	udelay(2000);
 	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V4_DP_PHY_STATUS,
+	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
 			status,
 			((status & BIT(1)) > 0),
 			500,
@@ -2368,16 +2398,14 @@ static int qmp_v5_configure_dp_phy(struct qmp_combo *qmp)
 
 static int qmp_v6_configure_dp_phy(struct qmp_combo *qmp)
 {
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
 	u32 status;
 	int ret;
 
-	ret = qmp_v456_configure_dp_phy(qmp, QSERDES_V6_COM_RESETSM_CNTRL,
-					QSERDES_V6_COM_C_READY_STATUS,
-					QSERDES_V6_COM_CMN_STATUS,
-					QSERDES_V6_DP_PHY_STATUS);
+	ret = qmp_v456_configure_dp_phy(qmp);
 	if (ret < 0)
 		return ret;
 
@@ -2407,7 +2435,7 @@ static int qmp_v6_configure_dp_phy(struct qmp_combo *qmp)
 	udelay(2000);
 	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V6_DP_PHY_STATUS,
+	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
 			       status,
 			       ((status & BIT(1)) > 0),
 			       500,
-- 
2.39.2

