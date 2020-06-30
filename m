Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8316D20FF01
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F406E479;
	Tue, 30 Jun 2020 21:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8C76E357;
 Tue, 30 Jun 2020 21:28:50 +0000 (UTC)
IronPort-SDR: Jo8AE2bMSFpBI25biETZyOHOSf0+GdmbUgKi9z9TWyi15YWDJhUKTEz4wPlM1RC33wdYqI1RCQ
 LpwixUdQWqiA==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="133846893"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="133846893"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:48 -0700
IronPort-SDR: /9ug7yZtx9yjKTRvEVMUcwHddlXjmt1KRe3pxIJG6Fv360PzLO5GPZH5Y0rpKYGuf5zW2JN+L0
 CepfiI4BpmqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066750"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:48 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 33/59] drm/kmb: Initialize clocks for clk_msscam, clk_mipi_ecfg,
 & clk_mipi_cfg.
Date: Tue, 30 Jun 2020 14:27:45 -0700
Message-Id: <1593552491-23698-34-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
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
index 0588bd0..48c2b28 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -56,6 +56,9 @@ static irqreturn_t kmb_isr(int irq, void *arg);
 
 static struct clk *clk_lcd;
 static struct clk *clk_mipi;
+static struct clk *clk_msscam;
+static struct clk *clk_mipi_ecfg;
+static struct clk *clk_mipi_cfg;
 
 struct drm_bridge *adv_bridge;
 
@@ -74,6 +77,24 @@ static int kmb_display_clk_enable(void)
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
@@ -84,6 +105,12 @@ static int kmb_display_clk_disable(void)
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
 
@@ -118,6 +145,7 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	/*u32 version;*/
 	int ret = 0;
+	unsigned long clk;
 
 	/* Map LCD MMIO registers */
 	dev_p->lcd_mmio = kmb_map_mmio(pdev, "lcd_regs");
@@ -128,7 +156,6 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 
 	/* Map MIPI MMIO registers */
 	dev_p->mipi_mmio = kmb_map_mmio(pdev, "mipi_regs");
-
 	if (IS_ERR(dev_p->mipi_mmio)) {
 		DRM_ERROR("failed to map MIPI registers\n");
 		iounmap(dev_p->lcd_mmio);
@@ -146,33 +173,94 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
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
index 6c1d687..9e3bb83 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -30,6 +30,8 @@
 
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
