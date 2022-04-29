Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3DC515606
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 22:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C157210E0AE;
	Fri, 29 Apr 2022 20:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E908910E0AE
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 20:45:34 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8154883966;
 Fri, 29 Apr 2022 22:45:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651265132;
 bh=1hMQWhYJvitbS0AuUYuke6rlAOcNJcirQPcQaOnRSio=;
 h=From:To:Cc:Subject:Date:From;
 b=T9TNLvGO2nX0drQsY4iasaa/0KU22ngEEgEDiZuQk8vymlfwxIMLq7OCGdgYItIAx
 O7jyR/JbIWH5gkdC24AJIkmyrsVk1SY7dmNexpeirw5M4iX5pbxJZa7I59fUmuKCoi
 dzj8Ep9DYChTnwWc3/gZm14VUoVU1KOqeHoJSpXO4wrq9zku9WwifpcHBhs8h4RGV2
 8pTKuwQSajbP/K9IRcTWx7r4PTu76pp/creiVAY0nYzmXCAhgPOdC3a9x4ukL3nTSB
 BN27Fff0NVuvb6ZDyNsI0sXQZvgYHmibDYOM58Nne31/EpQA20M1ANsicLkJqOV4sy
 0JY0uuoWtFJIA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/stm: dsi: Enable wrapper glue regulator early
Date: Fri, 29 Apr 2022 22:45:19 +0200
Message-Id: <20220429204519.241549-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Antonio Borneo <antonio.borneo@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, robert.foss@linaro.org,
 Philippe Cornu <philippe.cornu@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Certain DSI bridge chips like TC358767/TC358867/TC9595 expect the DSI D0
data lane to be in LP-11 state when released from reset. Currently the
STM32MP157 DSI host wrapper glue logic keeps D0 data lane in LP-00 state
until DSI init happens, which confuses the TC358767 into entering some
sort of test mode and the chip cannot be brought out of this test mode
in any way.

Enable the wrapper glue logic regulator in probe callback already and
disable it in remove callback to satisfy this requirement. The D0 data
lane is in LP-11 mode when the TC358767 bridge chip is brought up and
the chip is not confused anymore.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 30 +++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 89897d5f5c72..c403633ffeae 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -194,16 +194,29 @@ static int dsi_pll_get_params(struct dw_mipi_dsi_stm *dsi,
 	return 0;
 }
 
+static int dw_mipi_dsi_phy_regulator_on(struct dw_mipi_dsi_stm *dsi)
+{
+	u32 val;
+
+	/* Enable the regulator */
+	dsi_set(dsi, DSI_WRPCR, WRPCR_REGEN | WRPCR_BGREN);
+	return readl_poll_timeout(dsi->base + DSI_WISR, val, val & WISR_RRS,
+				  SLEEP_US, TIMEOUT_US);
+}
+
+static void dw_mipi_dsi_phy_regulator_off(struct dw_mipi_dsi_stm *dsi)
+{
+	/* Disable the regulator */
+	dsi_clear(dsi, DSI_WRPCR, WRPCR_REGEN | WRPCR_BGREN);
+}
+
 static int dw_mipi_dsi_phy_init(void *priv_data)
 {
 	struct dw_mipi_dsi_stm *dsi = priv_data;
 	u32 val;
 	int ret;
 
-	/* Enable the regulator */
-	dsi_set(dsi, DSI_WRPCR, WRPCR_REGEN | WRPCR_BGREN);
-	ret = readl_poll_timeout(dsi->base + DSI_WISR, val, val & WISR_RRS,
-				 SLEEP_US, TIMEOUT_US);
+	ret = dw_mipi_dsi_phy_regulator_on(dsi);
 	if (ret)
 		DRM_DEBUG_DRIVER("!TIMEOUT! waiting REGU, let's continue\n");
 
@@ -499,8 +512,16 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 	}
 
 	dsi->hw_version = dsi_read(dsi, DSI_VERSION) & VERSION;
+
+	ret = dw_mipi_dsi_phy_regulator_on(dsi);
 	clk_disable_unprepare(pclk);
 
+	if (ret) {
+		DRM_ERROR("%s: Failed to enable wrapper regulator, ret=%d\n",
+			  __func__, ret);
+		goto err_dsi_probe;
+	}
+
 	if (dsi->hw_version != HWVER_130 && dsi->hw_version != HWVER_131) {
 		ret = -ENODEV;
 		DRM_ERROR("bad dsi hardware version\n");
@@ -542,6 +563,7 @@ static int dw_mipi_dsi_stm_remove(struct platform_device *pdev)
 	struct dw_mipi_dsi_stm *dsi = platform_get_drvdata(pdev);
 
 	dw_mipi_dsi_remove(dsi->dsi);
+	dw_mipi_dsi_phy_regulator_off(dsi);
 	clk_disable_unprepare(dsi->pllref_clk);
 	regulator_disable(dsi->vdd_supply);
 
-- 
2.35.1

