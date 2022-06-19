Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434EB550B23
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jun 2022 16:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7451210E30B;
	Sun, 19 Jun 2022 14:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 897 seconds by postgrey-1.36 at gabe;
 Sun, 19 Jun 2022 14:17:15 UTC
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C7110E30B
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 14:17:15 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25JE22Tl047222;
 Sun, 19 Jun 2022 09:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1655647322;
 bh=rvADblR0sOwbzM90eul+OKoXulB+aQQpqmHRrmuOhwY=;
 h=From:To:CC:Subject:Date;
 b=MYBdZpn/AYIeau0Nob/NVyNRFCUp5y0NQWzTeb3nuAsY6kkXxyQEz3S+BFEmtfNLW
 ksR8pE46M4GTgLeJ+/TRjAwuhBukBfvXxPtFb/5xAaOHHhFmwpEa6Rw3VQEMkyj3EN
 Tnlbko6r882TGhtS8atJmHaYYq71hnYuBIVw+IEo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25JE22lB104547
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 19 Jun 2022 09:02:02 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sun, 19
 Jun 2022 09:02:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sun, 19 Jun 2022 09:02:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25JE21d9085889;
 Sun, 19 Jun 2022 09:02:01 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] drm/bridge: cdns-dsi: Add support for J721E wrapper
Date: Sun, 19 Jun 2022 19:31:58 +0530
Message-ID: <20220619140158.30881-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: mparab@cadence.com, a-bhatia1@ti.com, jonas@kwiboo.se, airlied@linux.ie,
 tomi.valkeinen@ideasonboard.com, sjakhade@cadence.com, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, robert.foss@linaro.org,
 andrzej.hajda@intel.com, jpawar@cadence.com, Rahul T R <r-ravikumar@ti.com>,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for wrapper settings for DSI bridge on
j721e. Also set the DPI input to DPI0

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---

Notes:
    v2:
    - Moved setting DPI0 to bridge_enable, since it
      should be done after pm_runtime_get

 drivers/gpu/drm/bridge/Kconfig    | 10 ++++++++++
 drivers/gpu/drm/bridge/cdns-dsi.c | 24 ++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 8ffd601e68f9..72c4c962d752 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -26,6 +26,16 @@ config DRM_CDNS_DSI
 	  Support Cadence DPI to DSI bridge. This is an internal
 	  bridge and is meant to be directly embedded in a SoC.
 
+if DRM_CDNS_DSI
+
+config DRM_CDNS_DSI_J721E
+	bool "J721E Cadence DPI/DSI wrapper support"
+	default y
+	help
+	  Support J721E Cadence DPI/DSI wrapper. This wrapper adds
+	  support to select which DPI input to use for the bridge.
+endif
+
 config DRM_CHIPONE_ICN6211
 	tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
index 20bece84ff8c..06043cc235cc 100644
--- a/drivers/gpu/drm/bridge/cdns-dsi.c
+++ b/drivers/gpu/drm/bridge/cdns-dsi.c
@@ -424,6 +424,16 @@
 #define DSI_NULL_FRAME_OVERHEAD		6
 #define DSI_EOT_PKT_SIZE		4
 
+#define DSI_WRAP_REVISION		0x0
+#define DSI_WRAP_DPI_CONTROL		0x4
+#define DSI_WRAP_DSC_CONTROL		0x8
+#define DSI_WRAP_DPI_SECURE		0xc
+#define DSI_WRAP_DSI_0_ASF_STATUS	0x10
+
+#define DSI_WRAP_DPI_0_EN		BIT(0)
+#define DSI_WRAP_DSI2_MUX_SEL		BIT(4)
+
+
 struct cdns_dsi_output {
 	struct mipi_dsi_device *dev;
 	struct drm_panel *panel;
@@ -453,6 +463,9 @@ struct cdns_dsi_input {
 struct cdns_dsi {
 	struct mipi_dsi_host base;
 	void __iomem *regs;
+#ifdef CONFIG_DRM_CDNS_DSI_J721E
+	void __iomem *wrap_regs;
+#endif
 	struct cdns_dsi_input input;
 	struct cdns_dsi_output output;
 	unsigned int direct_cmd_fifo_depth;
@@ -924,6 +937,11 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
 
 	tmp = readl(dsi->regs + MCTL_MAIN_EN) | IF_EN(input->id);
 	writel(tmp, dsi->regs + MCTL_MAIN_EN);
+
+#ifdef CONFIG_DRM_CDNS_DSI_J721E
+	/* Set DPI0 as input */
+	writel(DSI_WRAP_DPI_0_EN, dsi->wrap_regs + DSI_WRAP_DPI_CONTROL);
+#endif
 }
 
 static void cdns_dsi_bridge_pre_enable(struct drm_bridge *bridge)
@@ -1212,6 +1230,12 @@ static int cdns_dsi_drm_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->regs))
 		return PTR_ERR(dsi->regs);
 
+#ifdef CONFIG_DRM_CDNS_DSI_J721E
+	dsi->wrap_regs = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(dsi->wrap_regs))
+		return PTR_ERR(dsi->wrap_regs);
+#endif
+
 	dsi->dsi_p_clk = devm_clk_get(&pdev->dev, "dsi_p_clk");
 	if (IS_ERR(dsi->dsi_p_clk))
 		return PTR_ERR(dsi->dsi_p_clk);
-- 
2.36.1

