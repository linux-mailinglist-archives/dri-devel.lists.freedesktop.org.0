Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2AF7F6CBA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 08:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7366E10E364;
	Fri, 24 Nov 2023 07:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB1E10E5E7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 07:18:10 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ANMsBFZ021992; Fri, 24 Nov 2023 08:17:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=SHgmO6NomtaIRhqk5gfHNSdYmangnboMcVbymiu6fk4=; b=GO
 CnsHIGVuBTYgcETotuMmtKLL7GyJfTWiNogDfK7VpkiDrZUjwr4EdWgbq2rGc4RN
 zjUd3K/drHOwq68+wr1y9IM2T2C3D9c423zJCoCaZY4cFBmxxIcZ9T2RzrRhOLsS
 pVkqLBXK+wPFIDgXVjABsPbBIaEjyAVpnddfgd9kf3SIEJcV75kjkQYZ/dycZyGT
 SW/X+BgMFJDDAFKP0iiHL/UGFzoPqb28j+CEFsRlTXe4yGynCmRlVcSTiuzZkAzG
 me7aevUehKf9uSqPvNoU6c1IcU19vNS7I9TaQJhH6fn7NXEC6PBOwZOpA6BHnHnr
 pE+1lqcM1cMhL+71C2xQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uj46nnt8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Nov 2023 08:17:14 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E8EC510002A;
 Fri, 24 Nov 2023 08:17:13 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE152215137;
 Fri, 24 Nov 2023 08:17:13 +0100 (CET)
Received: from localhost (10.252.31.103) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 24 Nov
 2023 08:17:13 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RESEND 2/3] drm/stm: dsi: expose DSI PHY internal clock
Date: Fri, 24 Nov 2023 08:16:48 +0100
Message-ID: <20231124071649.372270-3-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231124071649.372270-1-raphael.gallais-pou@foss.st.com>
References: <20231124071649.372270-1-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.31.103]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_15,2023-11-22_01,2023-05-22_02
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	DSISRC __________
	               __\_
	              |    \
	pll4_p_ck   ->|  1  |____dsi_k
	ck_dsi_phy  ->|  0  |
	              |____/

A DSI clock is missing in the clock framework. Looking at the
clk_summary, it appears that 'ck_dsi_phy' is not implemented. Since the
DSI kernel clock is based on the internal DSI pll. The common clock
driver can not directly expose this 'ck_dsi_phy' clock because it does
not contain any common registers with the DSI. Thus it needs to be done
directly within the DSI phy driver.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 246 ++++++++++++++++++++++----
 1 file changed, 215 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index a0ca4d7f3b8a..1a4a88ecffe0 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -7,7 +7,9 @@
  */
 
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/iopoll.h>
+#include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -77,9 +79,12 @@ enum dsi_color {
 
 struct dw_mipi_dsi_stm {
 	void __iomem *base;
+	struct device *dev;
 	struct clk *pllref_clk;
 	struct clk *pclk;
+	struct clk_hw txbyte_clk;
 	struct dw_mipi_dsi *dsi;
+	struct dw_mipi_dsi_plat_data pdata;
 	u32 hw_version;
 	int lane_min_kbps;
 	int lane_max_kbps;
@@ -196,29 +201,198 @@ static int dsi_pll_get_params(struct dw_mipi_dsi_stm *dsi,
 	return 0;
 }
 
-static int dw_mipi_dsi_phy_init(void *priv_data)
+#define clk_to_dw_mipi_dsi_stm(clk) \
+	container_of(clk, struct dw_mipi_dsi_stm, txbyte_clk)
+
+static void dw_mipi_dsi_clk_disable(struct clk_hw *clk)
 {
-	struct dw_mipi_dsi_stm *dsi = priv_data;
+	struct dw_mipi_dsi_stm *dsi = clk_to_dw_mipi_dsi_stm(clk);
+
+	DRM_DEBUG_DRIVER("\n");
+
+	/* Disable the DSI PLL */
+	dsi_clear(dsi, DSI_WRPCR, WRPCR_PLLEN);
+
+	/* Disable the regulator */
+	dsi_clear(dsi, DSI_WRPCR, WRPCR_REGEN | WRPCR_BGREN);
+}
+
+static int dw_mipi_dsi_clk_enable(struct clk_hw *clk)
+{
+	struct dw_mipi_dsi_stm *dsi = clk_to_dw_mipi_dsi_stm(clk);
 	u32 val;
 	int ret;
 
+	DRM_DEBUG_DRIVER("\n");
+
 	/* Enable the regulator */
 	dsi_set(dsi, DSI_WRPCR, WRPCR_REGEN | WRPCR_BGREN);
-	ret = readl_poll_timeout(dsi->base + DSI_WISR, val, val & WISR_RRS,
-				 SLEEP_US, TIMEOUT_US);
+	ret = readl_poll_timeout_atomic(dsi->base + DSI_WISR, val, val & WISR_RRS,
+					SLEEP_US, TIMEOUT_US);
 	if (ret)
 		DRM_DEBUG_DRIVER("!TIMEOUT! waiting REGU, let's continue\n");
 
 	/* Enable the DSI PLL & wait for its lock */
 	dsi_set(dsi, DSI_WRPCR, WRPCR_PLLEN);
-	ret = readl_poll_timeout(dsi->base + DSI_WISR, val, val & WISR_PLLLS,
-				 SLEEP_US, TIMEOUT_US);
+	ret = readl_poll_timeout_atomic(dsi->base + DSI_WISR, val, val & WISR_PLLLS,
+					SLEEP_US, TIMEOUT_US);
 	if (ret)
 		DRM_DEBUG_DRIVER("!TIMEOUT! waiting PLL, let's continue\n");
 
 	return 0;
 }
 
+static int dw_mipi_dsi_clk_is_enabled(struct clk_hw *hw)
+{
+	struct dw_mipi_dsi_stm *dsi = clk_to_dw_mipi_dsi_stm(hw);
+
+	return dsi_read(dsi, DSI_WRPCR) & WRPCR_PLLEN;
+}
+
+static unsigned long dw_mipi_dsi_clk_recalc_rate(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	struct dw_mipi_dsi_stm *dsi = clk_to_dw_mipi_dsi_stm(hw);
+	unsigned int idf, ndiv, odf, pll_in_khz, pll_out_khz;
+	u32 val;
+
+	DRM_DEBUG_DRIVER("\n");
+
+	pll_in_khz = (unsigned int)(parent_rate / 1000);
+
+	val = dsi_read(dsi, DSI_WRPCR);
+
+	idf = (val & WRPCR_IDF) >> 11;
+	if (!idf)
+		idf = 1;
+	ndiv = (val & WRPCR_NDIV) >> 2;
+	odf = int_pow(2, (val & WRPCR_ODF) >> 16);
+
+	/* Get the adjusted pll out value */
+	pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
+
+	return (unsigned long)pll_out_khz * 1000;
+}
+
+static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long *parent_rate)
+{
+	struct dw_mipi_dsi_stm *dsi = clk_to_dw_mipi_dsi_stm(hw);
+	unsigned int idf, ndiv, odf, pll_in_khz, pll_out_khz;
+	int ret;
+
+	DRM_DEBUG_DRIVER("\n");
+
+	pll_in_khz = (unsigned int)(*parent_rate / 1000);
+
+	/* Compute best pll parameters */
+	idf = 0;
+	ndiv = 0;
+	odf = 0;
+
+	ret = dsi_pll_get_params(dsi, pll_in_khz, rate / 1000,
+				 &idf, &ndiv, &odf);
+	if (ret)
+		DRM_WARN("Warning dsi_pll_get_params(): bad params\n");
+
+	/* Get the adjusted pll out value */
+	pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
+
+	return pll_out_khz * 1000;
+}
+
+static int dw_mipi_dsi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate)
+{
+	struct dw_mipi_dsi_stm *dsi = clk_to_dw_mipi_dsi_stm(hw);
+	unsigned int idf, ndiv, odf, pll_in_khz, pll_out_khz;
+	int ret;
+	u32 val;
+
+	DRM_DEBUG_DRIVER("\n");
+
+	pll_in_khz = (unsigned int)(parent_rate / 1000);
+
+	/* Compute best pll parameters */
+	idf = 0;
+	ndiv = 0;
+	odf = 0;
+
+	ret = dsi_pll_get_params(dsi, pll_in_khz, rate / 1000, &idf, &ndiv, &odf);
+	if (ret)
+		DRM_WARN("Warning dsi_pll_get_params(): bad params\n");
+
+	/* Get the adjusted pll out value */
+	pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
+
+	/* Set the PLL division factors */
+	dsi_update_bits(dsi, DSI_WRPCR,	WRPCR_NDIV | WRPCR_IDF | WRPCR_ODF,
+			(ndiv << 2) | (idf << 11) | ((ffs(odf) - 1) << 16));
+
+	/* Compute uix4 & set the bit period in high-speed mode */
+	val = 4000000 / pll_out_khz;
+	dsi_update_bits(dsi, DSI_WPCR0, WPCR0_UIX4, val);
+
+	return 0;
+}
+
+static void dw_mipi_dsi_clk_unregister(void *data)
+{
+	struct dw_mipi_dsi_stm *dsi = data;
+
+	DRM_DEBUG_DRIVER("\n");
+
+	of_clk_del_provider(dsi->dev->of_node);
+	clk_hw_unregister(&dsi->txbyte_clk);
+}
+
+static const struct clk_ops dw_mipi_dsi_stm_clk_ops = {
+	.enable = dw_mipi_dsi_clk_enable,
+	.disable = dw_mipi_dsi_clk_disable,
+	.is_enabled = dw_mipi_dsi_clk_is_enabled,
+	.recalc_rate = dw_mipi_dsi_clk_recalc_rate,
+	.round_rate = dw_mipi_dsi_clk_round_rate,
+	.set_rate = dw_mipi_dsi_clk_set_rate,
+};
+
+static struct clk_init_data cdata_init = {
+	.name = "ck_dsi_phy",
+	.ops = &dw_mipi_dsi_stm_clk_ops,
+	.parent_names = (const char * []) {"ck_hse"},
+	.num_parents = 1,
+};
+
+static int dw_mipi_dsi_clk_register(struct dw_mipi_dsi_stm *dsi,
+				    struct device *dev)
+{
+	struct device_node *node = dev->of_node;
+	int ret;
+
+	DRM_DEBUG_DRIVER("Registering clk\n");
+
+	dsi->txbyte_clk.init = &cdata_init;
+
+	ret = clk_hw_register(dev, &dsi->txbyte_clk);
+	if (ret)
+		return ret;
+
+	ret = of_clk_add_hw_provider(node, of_clk_hw_simple_get,
+				     &dsi->txbyte_clk);
+	if (ret)
+		clk_hw_unregister(&dsi->txbyte_clk);
+
+	return ret;
+}
+
+static int dw_mipi_dsi_phy_init(void *priv_data)
+{
+	struct dw_mipi_dsi_stm *dsi = priv_data;
+	int ret;
+
+	ret = clk_prepare_enable(dsi->txbyte_clk.clk);
+	return ret;
+}
+
 static void dw_mipi_dsi_phy_power_on(void *priv_data)
 {
 	struct dw_mipi_dsi_stm *dsi = priv_data;
@@ -235,6 +409,8 @@ static void dw_mipi_dsi_phy_power_off(void *priv_data)
 
 	DRM_DEBUG_DRIVER("\n");
 
+	clk_disable_unprepare(dsi->txbyte_clk.clk);
+
 	/* Disable the DSI wrapper */
 	dsi_clear(dsi, DSI_WCR, WCR_DSIEN);
 }
@@ -245,9 +421,8 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
 			  unsigned int *lane_mbps)
 {
 	struct dw_mipi_dsi_stm *dsi = priv_data;
-	unsigned int idf, ndiv, odf, pll_in_khz, pll_out_khz;
+	unsigned int pll_in_khz, pll_out_khz;
 	int ret, bpp;
-	u32 val;
 
 	pll_in_khz = (unsigned int)(clk_get_rate(dsi->pllref_clk) / 1000);
 
@@ -268,25 +443,10 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
 		DRM_WARN("Warning min phy mbps is used\n");
 	}
 
-	/* Compute best pll parameters */
-	idf = 0;
-	ndiv = 0;
-	odf = 0;
-	ret = dsi_pll_get_params(dsi, pll_in_khz, pll_out_khz,
-				 &idf, &ndiv, &odf);
+	ret = clk_set_rate((dsi->txbyte_clk.clk), pll_out_khz * 1000);
 	if (ret)
-		DRM_WARN("Warning dsi_pll_get_params(): bad params\n");
-
-	/* Get the adjusted pll out value */
-	pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
-
-	/* Set the PLL division factors */
-	dsi_update_bits(dsi, DSI_WRPCR,	WRPCR_NDIV | WRPCR_IDF | WRPCR_ODF,
-			(ndiv << 2) | (idf << 11) | ((ffs(odf) - 1) << 16));
-
-	/* Compute uix4 & set the bit period in high-speed mode */
-	val = 4000000 / pll_out_khz;
-	dsi_update_bits(dsi, DSI_WPCR0, WPCR0_UIX4, val);
+		DRM_DEBUG_DRIVER("ERROR Could not set rate of %d to %s clk->name",
+				 pll_out_khz, clk_hw_get_name(&dsi->txbyte_clk));
 
 	/* Select video mode by resetting DSIM bit */
 	dsi_clear(dsi, DSI_WCFGR, WCFGR_DSIM);
@@ -445,6 +605,7 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct dw_mipi_dsi_stm *dsi;
+	const struct dw_mipi_dsi_plat_data *pdata = of_device_get_match_data(dev);
 	int ret;
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
@@ -514,18 +675,40 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 		dsi->lane_max_kbps *= 2;
 	}
 
-	dw_mipi_dsi_stm_plat_data.base = dsi->base;
-	dw_mipi_dsi_stm_plat_data.priv_data = dsi;
+	dsi->pdata = *pdata;
+	dsi->pdata.base = dsi->base;
+	dsi->pdata.priv_data = dsi;
+
+	dsi->pdata.max_data_lanes = 2;
+	dsi->pdata.phy_ops = &dw_mipi_dsi_stm_phy_ops;
 
 	platform_set_drvdata(pdev, dsi);
 
-	dsi->dsi = dw_mipi_dsi_probe(pdev, &dw_mipi_dsi_stm_plat_data);
+	dsi->dsi = dw_mipi_dsi_probe(pdev, &dsi->pdata);
 	if (IS_ERR(dsi->dsi)) {
 		ret = PTR_ERR(dsi->dsi);
 		dev_err_probe(dev, ret, "Failed to initialize mipi dsi host\n");
 		goto err_dsi_probe;
 	}
 
+	/*
+	 * We need to wait for the generic bridge to probe before enabling and
+	 * register the internal pixel clock.
+	 */
+	ret = clk_prepare_enable(dsi->pclk);
+	if (ret) {
+		DRM_ERROR("%s: Failed to enable peripheral clk\n", __func__);
+		goto err_dsi_probe;
+	}
+
+	ret = dw_mipi_dsi_clk_register(dsi, dev);
+	if (ret) {
+		DRM_ERROR("Failed to register DSI pixel clock: %d\n", ret);
+		goto err_dsi_probe;
+	}
+
+	clk_disable_unprepare(dsi->pclk);
+
 	return 0;
 
 err_dsi_probe:
@@ -542,12 +725,13 @@ static void dw_mipi_dsi_stm_remove(struct platform_device *pdev)
 
 	dw_mipi_dsi_remove(dsi->dsi);
 	clk_disable_unprepare(dsi->pllref_clk);
+	dw_mipi_dsi_clk_unregister(dsi);
 	regulator_disable(dsi->vdd_supply);
 }
 
 static int __maybe_unused dw_mipi_dsi_stm_suspend(struct device *dev)
 {
-	struct dw_mipi_dsi_stm *dsi = dw_mipi_dsi_stm_plat_data.priv_data;
+	struct dw_mipi_dsi_stm *dsi = dev_get_drvdata(dev);
 
 	DRM_DEBUG_DRIVER("\n");
 
@@ -560,7 +744,7 @@ static int __maybe_unused dw_mipi_dsi_stm_suspend(struct device *dev)
 
 static int __maybe_unused dw_mipi_dsi_stm_resume(struct device *dev)
 {
-	struct dw_mipi_dsi_stm *dsi = dw_mipi_dsi_stm_plat_data.priv_data;
+	struct dw_mipi_dsi_stm *dsi = dev_get_drvdata(dev);
 	int ret;
 
 	DRM_DEBUG_DRIVER("\n");
-- 
2.25.1

