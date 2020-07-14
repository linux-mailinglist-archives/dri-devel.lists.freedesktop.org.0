Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A94B21FF62
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12DE6E9E8;
	Tue, 14 Jul 2020 20:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2CB6E9BE;
 Tue, 14 Jul 2020 20:58:36 +0000 (UTC)
IronPort-SDR: YtxqL2fszEwejt0M6qR5+6YEmWj0rwVNTs3Q5//NB1TwZJADd1hzJUEKeae9es37vQtQ0E2rHT
 1J8H8wYpC9xA==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444583"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444583"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:36 -0700
IronPort-SDR: DchrMGaONHpjq6G7MGaakc2QY1u2/7Y1j9Xd8UIsbGAAuHK25MU6GqDLRIDp2YvGECaLD2LSSG
 xevsfP2TvKEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504197"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:35 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 33/59] drm/kmb: Initialize clocks for clk_msscam,
 clk_mipi_ecfg, & clk_mipi_cfg.
Date: Tue, 14 Jul 2020 13:57:19 -0700
Message-Id: <1594760265-11618-34-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Edmund Dea <edmund.j.dea@intel.com>

Note that we enable clk_msscam but do not set clk_msscam. However, we do
enable and set clk_mipi_ecfg and clk_mipi_cfg.

Verify that LCD and MIPI clocks are set successfully.

Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 112 +++++++++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/kmb/kmb_drv.h |   2 +
 2 files changed, 102 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 1368770..9dc5f91 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -36,6 +36,9 @@ static irqreturn_t kmb_isr(int irq, void *arg);
 
 static struct clk *clk_lcd;
 static struct clk *clk_mipi;
+static struct clk *clk_msscam;
+static struct clk *clk_mipi_ecfg;
+static struct clk *clk_mipi_cfg;
 
 struct drm_bridge *adv_bridge;
 
@@ -54,6 +57,24 @@ static int kmb_display_clk_enable(void)
 		DRM_ERROR("Failed to enable MIPI clock: %d\n", ret);
 		return ret;
 	}
+
+	ret = clk_prepare_enable(clk_msscam);
+	if (ret) {
+		DRM_ERROR("Failed to enable MSSCAM clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(clk_mipi_ecfg);
+	if (ret) {
+		DRM_ERROR("Failed to enable MIPI_ECFG clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(clk_mipi_cfg);
+	if (ret) {
+		DRM_ERROR("Failed to enable MIPI_CFG clock: %d\n", ret);
+		return ret;
+	}
 	DRM_INFO("SUCCESS : enabled LCD MIPI clocks\n");
 	return 0;
 }
@@ -64,6 +85,12 @@ static int kmb_display_clk_disable(void)
 		clk_disable_unprepare(clk_lcd);
 	if (clk_mipi)
 		clk_disable_unprepare(clk_mipi);
+	if (clk_msscam)
+		clk_disable_unprepare(clk_msscam);
+	if (clk_mipi_ecfg)
+		clk_disable_unprepare(clk_mipi_ecfg);
+	if (clk_mipi_cfg)
+		clk_disable_unprepare(clk_mipi_cfg);
 	return 0;
 }
 
@@ -98,6 +125,7 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	/*u32 version;*/
 	int ret = 0;
+	unsigned long clk;
 
 	/* Map LCD MMIO registers */
 	dev_p->lcd_mmio = kmb_map_mmio(pdev, "lcd_regs");
@@ -108,7 +136,6 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 
 	/* Map MIPI MMIO registers */
 	dev_p->mipi_mmio = kmb_map_mmio(pdev, "mipi_regs");
-
 	if (IS_ERR(dev_p->mipi_mmio)) {
 		DRM_ERROR("failed to map MIPI registers\n");
 		iounmap(dev_p->lcd_mmio);
@@ -126,33 +153,94 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 		return -ENOMEM;
 	}
 
-	/* enable display clocks*/
+	/* Enable display clocks*/
 	clk_lcd = clk_get(&pdev->dev, "clk_lcd");
-	if (!clk_lcd) {
+	if (IS_ERR(clk_lcd)) {
 		DRM_ERROR("clk_get() failed clk_lcd\n");
 		goto setup_fail;
 	}
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 
 	clk_mipi = clk_get(&pdev->dev, "clk_mipi");
-	if (!clk_mipi) {
+	if (IS_ERR(clk_mipi)) {
 		DRM_ERROR("clk_get() failed clk_mipi\n");
 		goto setup_fail;
 	}
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
+
+	clk_msscam = clk_get(&pdev->dev, "clk_msscam");
+	if (IS_ERR(clk_msscam)) {
+		DRM_ERROR("clk_get() failed clk_msscam\n");
+		goto setup_fail;
+	}
+
+	clk_mipi_ecfg = clk_get(&pdev->dev, "clk_mipi_ecfg");
+	if (IS_ERR(clk_mipi_ecfg)) {
+		DRM_ERROR("clk_get() failed clk_mipi_ecfg\n");
+		goto setup_fail;
+	}
+
+	clk_mipi_cfg = clk_get(&pdev->dev, "clk_mipi_cfg");
+	if (IS_ERR(clk_mipi_cfg)) {
+		DRM_ERROR("clk_get() failed clk_mipi_cfg\n");
+		goto setup_fail;
+	}
+
 	ret = kmb_display_clk_enable();
 
-	/* set LCD clock to 200 Mhz*/
+	/* Set LCD clock to 200 Mhz*/
 	DRM_INFO("Get clk_lcd before set = %ld\n", clk_get_rate(clk_lcd));
-	ret = clk_set_rate(clk_lcd, 200000000);
-	DRM_INFO("Setting LCD clock tp 200Mhz ret = %d\n", ret);
+	ret = clk_set_rate(clk_lcd, KMB_LCD_DEFAULT_CLK);
+	if (clk_get_rate(clk_lcd) != KMB_LCD_DEFAULT_CLK) {
+		DRM_ERROR("failed to set to clk_lcd to %d\n",
+				KMB_LCD_DEFAULT_CLK);
+		goto setup_fail;
+	}
+	DRM_INFO("Setting LCD clock to %d Mhz ret = %d\n",
+			KMB_LCD_DEFAULT_CLK/1000000, ret);
 	DRM_INFO("Get clk_lcd after set = %ld\n", clk_get_rate(clk_lcd));
-	/* set MIPI clock to 24 Mhz*/
+
+	/* Set MIPI clock to 24 Mhz*/
 	DRM_INFO("Get clk_mipi before set = %ld\n", clk_get_rate(clk_mipi));
-	ret = clk_set_rate(clk_mipi, 24000000);
-	DRM_INFO("Setting MIPI clock tp 24Mhz ret = %d\n", ret);
+	ret = clk_set_rate(clk_mipi, KMB_MIPI_DEFAULT_CLK);
+	if (clk_get_rate(clk_mipi) != KMB_MIPI_DEFAULT_CLK) {
+		DRM_ERROR("failed to set to clk_mipi to %d\n",
+				KMB_MIPI_DEFAULT_CLK);
+		goto setup_fail;
+	}
+	DRM_INFO("Setting MIPI clock to %d Mhz ret = %d\n",
+			KMB_MIPI_DEFAULT_CLK/1000000, ret);
 	DRM_INFO("Get clk_mipi after set = %ld\n", clk_get_rate(clk_mipi));
 
+	clk = clk_get_rate(clk_mipi_ecfg);
+	if (clk != KMB_MIPI_DEFAULT_CLK) {
+		/* Set MIPI_ECFG clock to 24 Mhz*/
+		DRM_INFO("Get clk_mipi_ecfg before set = %ld\n", clk);
+		ret = clk_set_rate(clk_mipi_ecfg, KMB_MIPI_DEFAULT_CLK);
+		clk = clk_get_rate(clk_mipi_ecfg);
+		if (clk != KMB_MIPI_DEFAULT_CLK) {
+			DRM_ERROR("failed to set to clk_mipi_ecfg to %d\n",
+					KMB_MIPI_DEFAULT_CLK);
+			goto setup_fail;
+		}
+		DRM_INFO("Setting MIPI_ECFG clock tp %d Mhz ret = %d\n",
+				KMB_MIPI_DEFAULT_CLK/1000000, ret);
+		DRM_INFO("Get clk_mipi_ecfg after set = %ld\n", clk);
+	}
+
+	clk = clk_get_rate(clk_mipi_cfg);
+	if (clk != KMB_MIPI_DEFAULT_CLK) {
+		/* Set MIPI_CFG clock to 24 Mhz*/
+		DRM_INFO("Get clk_mipi_cfg before set = %ld\n", clk);
+		ret = clk_set_rate(clk_mipi_cfg, 24000000);
+		clk = clk_get_rate(clk_mipi_cfg);
+		if (clk != KMB_MIPI_DEFAULT_CLK) {
+			DRM_ERROR("failed to set to clk_mipi_cfg to %d\n",
+					KMB_MIPI_DEFAULT_CLK);
+			goto setup_fail;
+		}
+		DRM_INFO("Setting MIPI_CFG clock tp 24Mhz ret = %d\n", ret);
+		DRM_INFO("Get clk_mipi_cfg after set = %ld\n", clk);
+	}
+
 #ifdef WIP
 	/* Register irqs here - section 17.3 in databook
 	 * lists LCD at 79 and 82 for MIPI under MSS CPU -
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 1150505..8c5ccf7 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -10,6 +10,8 @@
 
 #define KMB_MAX_WIDTH			16384	/*max width in pixels */
 #define KMB_MAX_HEIGHT			16384	/*max height in pixels */
+#define KMB_LCD_DEFAULT_CLK		200000000
+#define KMB_MIPI_DEFAULT_CLK		24000000
 
 struct kmb_drm_private {
 	struct drm_device		drm;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
