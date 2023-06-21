Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A12B2738902
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 17:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCAB10E4B9;
	Wed, 21 Jun 2023 15:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B48D10E4AF
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 15:27:26 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b46773e427so68254761fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 08:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687361244; x=1689953244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MicCFkNBouLiXbSIH4JKKed61jEBtgAzBmipuLWTl/4=;
 b=OwG0hwW0S7dRHg5+B6A1m+O34iprVP9IxKbiSOa842rI7m8tfyPUQWw6h09X0boARt
 NPaCs3pEn49L8ND221/Q8GbCAych5gOKHun8P4OlzyNqgnwnflwv0obcStqFwIsPufeE
 J6F6NGhmoQ9ns11x4ItHR2Ld+O6HC+xRsAjNanx9ATC0wYFl6RcFSs9WxWI21DUoyzbq
 tE2DKuqsnR0hODvSEiN6cZNd4VMjr9kAU8LSUhryYyrZCi1/eIXk304/YT9sQNhO99Cs
 Oh4eYoaEsoNZdFWaZNnrzSUO+1szmlEjFtiJErMfV+pnNkNopj7eJ18gQ2Yv5xS9eqyd
 MtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687361244; x=1689953244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MicCFkNBouLiXbSIH4JKKed61jEBtgAzBmipuLWTl/4=;
 b=QN3qlEo11T2RSRdFoggV6njpn8QUZ3ctxDkqHw4uk360ROvkSjc7rz45CcC3ZDXGWo
 s9mil3PSB0NEwtl90p+YX4DgmV/UuX1salc7/fXf6I9FB4BcSSG8ZmHO3qJZP2lJEWrq
 LZXwbjDqJkhgFlSw6Bttu07S1AZpx1+R5rSgfNuzdJWCy77wNe+jA2BiqcLyunNrFB4V
 uj6VhGh7tZmEsJAKtG6pKY8cK/5NNIG3Aczx+Ny4kYFdq/OYFyNxhPa1A8q4frAl0QKX
 xzZnF34IEfot+z5Ga9y2KEI2nmEcunrGu7pm28WdbaSOWzpm3en6Jvnc+vD2w8jqzKN5
 KrxQ==
X-Gm-Message-State: AC+VfDz9CJ+Irp+1FizVQrUdWMdmX8aHSmgBKFjsB14MI0eiChcs4WF0
 e9wQomGl0XUbVVRA2ICDtK4aGg==
X-Google-Smtp-Source: ACHHUZ47h1YAEkKvaIBd+vlDcOPUhPGiWaVilv8f4vYR2MfIO2CWbO/0vX0NLssZ8eZYZuRYqMk1xw==
X-Received: by 2002:a2e:740e:0:b0:2b5:86e4:558e with SMTP id
 p14-20020a2e740e000000b002b586e4558emr1360325ljc.38.1687361244414; 
 Wed, 21 Jun 2023 08:27:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a2e9b4b000000b002ad5f774579sm926408ljj.96.2023.06.21.08.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 08:27:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH 4/7] phy: qcom: qmp-combo: reuse register layouts for some
 more registers
Date: Wed, 21 Jun 2023 18:27:16 +0300
Message-Id: <20230621152719.1025801-5-dmitry.baryshkov@linaro.org>
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

Use register layout for TX_HIGHZ_DRVR_EN and TX_TRANSCEIVER_BIAS_EN
registers. This will allow us to unify qmp_v[456]_configure_dp_phy()
functions in the next commit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 34 ++++++++++++-------
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h   |  2 ++
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 2f95e29110df..d034b4f45bd3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -116,6 +116,8 @@ enum qphy_reg_layout {
 	QPHY_TX_TX_POL_INV,
 	QPHY_TX_TX_DRV_LVL,
 	QPHY_TX_TX_EMP_POST1_LVL,
+	QPHY_TX_HIGHZ_DRVR_EN,
+	QPHY_TX_TRANSCEIVER_BIAS_EN,
 
 	/* Keep last to ensure regs_layout arrays are properly initialized */
 	QPHY_LAYOUT_SIZE
@@ -138,6 +140,8 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_TX_TX_POL_INV]		= QSERDES_V3_TX_TX_POL_INV,
 	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V3_TX_TX_DRV_LVL,
 	[QPHY_TX_TX_EMP_POST1_LVL]	= QSERDES_V3_TX_TX_EMP_POST1_LVL,
+	[QPHY_TX_HIGHZ_DRVR_EN]		= QSERDES_V3_TX_HIGHZ_DRVR_EN,
+	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V3_TX_TRANSCEIVER_BIAS_EN,
 };
 
 static const unsigned int qmp_v45_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
@@ -159,6 +163,8 @@ static const unsigned int qmp_v45_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_TX_TX_POL_INV]		= QSERDES_V4_TX_TX_POL_INV,
 	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V4_TX_TX_DRV_LVL,
 	[QPHY_TX_TX_EMP_POST1_LVL]	= QSERDES_V4_TX_TX_EMP_POST1_LVL,
+	[QPHY_TX_HIGHZ_DRVR_EN]		= QSERDES_V4_TX_HIGHZ_DRVR_EN,
+	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V4_TX_TRANSCEIVER_BIAS_EN,
 };
 
 static const unsigned int qmp_v5_5nm_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
@@ -180,6 +186,8 @@ static const unsigned int qmp_v5_5nm_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_TX_TX_POL_INV]		= QSERDES_V5_5NM_TX_TX_POL_INV,
 	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V5_5NM_TX_TX_DRV_LVL,
 	[QPHY_TX_TX_EMP_POST1_LVL]	= QSERDES_V5_5NM_TX_TX_EMP_POST1_LVL,
+	[QPHY_TX_HIGHZ_DRVR_EN]		= QSERDES_V5_5NM_TX_HIGHZ_DRVR_EN,
+	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V5_5NM_TX_TRANSCEIVER_BIAS_EN,
 };
 
 static const unsigned int qmp_v6_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
@@ -201,6 +209,8 @@ static const unsigned int qmp_v6_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_TX_TX_POL_INV]		= QSERDES_V6_TX_TX_POL_INV,
 	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V6_TX_TX_DRV_LVL,
 	[QPHY_TX_TX_EMP_POST1_LVL]	= QSERDES_V6_TX_TX_EMP_POST1_LVL,
+	[QPHY_TX_HIGHZ_DRVR_EN]		= QSERDES_V6_TX_HIGHZ_DRVR_EN,
+	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V6_TX_TRANSCEIVER_BIAS_EN,
 };
 
 static const struct qmp_phy_init_tbl qmp_v3_usb3_serdes_tbl[] = {
@@ -2346,10 +2356,10 @@ static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp)
 		drvr1_en = 0x10;
 	}
 
-	writel(drvr0_en, qmp->dp_tx + QSERDES_V4_TX_HIGHZ_DRVR_EN);
-	writel(bias0_en, qmp->dp_tx + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
-	writel(drvr1_en, qmp->dp_tx2 + QSERDES_V4_TX_HIGHZ_DRVR_EN);
-	writel(bias1_en, qmp->dp_tx2 + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
+	writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
+	writel(bias0_en, qmp->dp_tx + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
+	writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
+	writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
 
 	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	udelay(2000);
@@ -2406,10 +2416,10 @@ static int qmp_v5_configure_dp_phy(struct qmp_combo *qmp)
 		drvr1_en = 0x10;
 	}
 
-	writel(drvr0_en, qmp->dp_tx + QSERDES_V5_5NM_TX_HIGHZ_DRVR_EN);
-	writel(bias0_en, qmp->dp_tx + QSERDES_V5_5NM_TX_TRANSCEIVER_BIAS_EN);
-	writel(drvr1_en, qmp->dp_tx2 + QSERDES_V5_5NM_TX_HIGHZ_DRVR_EN);
-	writel(bias1_en, qmp->dp_tx2 + QSERDES_V5_5NM_TX_TRANSCEIVER_BIAS_EN);
+	writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
+	writel(bias0_en, qmp->dp_tx + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
+	writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
+	writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
 
 	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	udelay(2000);
@@ -2464,10 +2474,10 @@ static int qmp_v6_configure_dp_phy(struct qmp_combo *qmp)
 		drvr1_en = 0x10;
 	}
 
-	writel(drvr0_en, qmp->dp_tx + QSERDES_V4_TX_HIGHZ_DRVR_EN);
-	writel(bias0_en, qmp->dp_tx + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
-	writel(drvr1_en, qmp->dp_tx2 + QSERDES_V4_TX_HIGHZ_DRVR_EN);
-	writel(bias1_en, qmp->dp_tx2 + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
+	writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
+	writel(bias0_en, qmp->dp_tx + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
+	writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
+	writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
 
 	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	udelay(2000);
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h
index b4810c48dc20..8883e1de730e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h
@@ -17,6 +17,8 @@
 #define QSERDES_V6_TX_RES_CODE_LANE_RX				0x38
 #define QSERDES_V6_TX_RES_CODE_LANE_OFFSET_TX			0x3c
 #define QSERDES_V6_TX_RES_CODE_LANE_OFFSET_RX			0x40
+#define QSERDES_V6_TX_TRANSCEIVER_BIAS_EN			0x54
+#define QSERDES_V6_TX_HIGHZ_DRVR_EN				0x58
 #define QSERDES_V6_TX_TX_POL_INV				0x5c
 #define QSERDES_V6_TX_PARRATE_REC_DETECT_IDLE_EN		0x60
 #define QSERDES_V6_TX_BIST_PATTERN7				0x7c
-- 
2.39.2

