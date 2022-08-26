Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC6D5A2FDC
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 21:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E1B10E20D;
	Fri, 26 Aug 2022 19:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B131310E20D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 19:24:34 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oRewM-0000At-VJ; Fri, 26 Aug 2022 21:24:27 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 2/4] drm/imx: add bridge wrapper driver for i.MX8MP DWC HDMI
Date: Fri, 26 Aug 2022 21:24:22 +0200
Message-Id: <20220826192424.3216734-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826192424.3216734-1-l.stach@pengutronix.de>
References: <20220826192424.3216734-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a simple wrapper driver for the DWC HDMI bridge driver that
implements the few bits that are necessary to abstract the i.MX8MP
SoC integration.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Tested-by: Marek Vasut <marex@denx.de>
---
 drivers/gpu/drm/bridge/imx/Kconfig       |   9 ++
 drivers/gpu/drm/bridge/imx/Makefile      |   2 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c | 141 +++++++++++++++++++++++
 3 files changed, 152 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 608f47f41bcd..d828d8bfd893 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -44,4 +44,13 @@ config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
 	  Choose this to enable pixel link to display pixel interface(PXL2DPI)
 	  found in Freescale i.MX8qxp processor.
 
+config DRM_IMX8MP_DW_HDMI_BRIDGE
+	tristate "i.MX8MP HDMI bridge support"
+	depends on OF
+	depends on COMMON_CLK
+	select DRM_DW_HDMI
+	help
+	  Choose this to enable support for the internal HDMI encoder found
+	  on the i.MX8MP SoC.
+
 endif # ARCH_MXC || COMPILE_TEST
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index aa90ec8d5433..03b0074ae538 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -7,3 +7,5 @@ obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
+
+obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) += imx8mp-hdmi.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c
new file mode 100644
index 000000000000..66089bc690c8
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright (C) 2022 Pengutronix, Lucas Stach <kernel@pengutronix.de>
+ */
+
+#include <drm/bridge/dw_hdmi.h>
+#include <drm/drm_modes.h>
+#include <linux/clk.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+struct imx_hdmi {
+	struct dw_hdmi_plat_data plat_data;
+	struct dw_hdmi *dw_hdmi;
+	struct clk *pixclk;
+	struct clk *fdcc;
+};
+
+static enum drm_mode_status
+imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
+		       const struct drm_display_info *info,
+		       const struct drm_display_mode *mode)
+{
+	struct imx_hdmi *hdmi = (struct imx_hdmi *)data;
+
+	if (mode->clock < 13500)
+		return MODE_CLOCK_LOW;
+
+	if (mode->clock > 297000)
+		return MODE_CLOCK_HIGH;
+
+	if (clk_round_rate(hdmi->pixclk, mode->clock * 1000) !=
+	    mode->clock * 1000)
+		return MODE_CLOCK_RANGE;
+
+	/* We don't support double-clocked and Interlaced modes */
+	if ((mode->flags & DRM_MODE_FLAG_DBLCLK) ||
+	    (mode->flags & DRM_MODE_FLAG_INTERLACE))
+		return MODE_BAD;
+
+	return MODE_OK;
+}
+
+static int imx8mp_hdmi_phy_init(struct dw_hdmi *dw_hdmi, void *data,
+				const struct drm_display_info *display,
+				const struct drm_display_mode *mode)
+{
+	return 0;
+}
+
+static void imx8mp_hdmi_phy_disable(struct dw_hdmi *dw_hdmi, void *data)
+{
+}
+
+static const struct dw_hdmi_phy_ops imx8mp_hdmi_phy_ops = {
+	.init		= imx8mp_hdmi_phy_init,
+	.disable	= imx8mp_hdmi_phy_disable,
+	.read_hpd	= dw_hdmi_phy_read_hpd,
+	.update_hpd	= dw_hdmi_phy_update_hpd,
+	.setup_hpd	= dw_hdmi_phy_setup_hpd,
+};
+
+static int imx_dw_hdmi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct dw_hdmi_plat_data *plat_data;
+	struct imx_hdmi *hdmi;
+	int ret;
+
+	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
+	if (!hdmi)
+		return -ENOMEM;
+
+	plat_data = &hdmi->plat_data;
+
+	hdmi->pixclk = devm_clk_get(dev, "pix");
+	if (IS_ERR(hdmi->pixclk))
+		return dev_err_probe(dev, PTR_ERR(hdmi->pixclk),
+				     "Unable to get pixel clock\n");
+
+	hdmi->fdcc = devm_clk_get(dev, "fdcc");
+	if (IS_ERR(hdmi->fdcc))
+		return dev_err_probe(dev, PTR_ERR(hdmi->fdcc),
+				     "Unable to get FDCC clock\n");
+
+	ret = clk_prepare_enable(hdmi->fdcc);
+	if (ret)
+		return dev_err_probe(dev, ret, "Unable to enable FDCC clock\n");
+
+	plat_data->mode_valid = imx8mp_hdmi_mode_valid;
+	plat_data->phy_ops = &imx8mp_hdmi_phy_ops;
+	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
+	plat_data->priv_data = hdmi;
+
+	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
+	if (IS_ERR(hdmi->dw_hdmi))
+		return PTR_ERR(hdmi->dw_hdmi);
+
+	/*
+	 * Just release PHY core from reset, all other power management is done
+	 * by the PHY driver.
+	 */
+	dw_hdmi_phy_gen1_reset(hdmi->dw_hdmi);
+
+	platform_set_drvdata(pdev, hdmi);
+
+	return 0;
+}
+
+static int imx_dw_hdmi_remove(struct platform_device *pdev)
+{
+	struct imx_hdmi *hdmi = platform_get_drvdata(pdev);
+
+	dw_hdmi_remove(hdmi->dw_hdmi);
+
+	clk_disable_unprepare(hdmi->fdcc);
+
+	return 0;
+}
+
+static const struct of_device_id imx_dw_hdmi_of_table[] = {
+	{ .compatible = "fsl,imx8mp-hdmi" },
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, imx_dw_hdmi_of_table);
+
+static struct platform_driver im_dw_hdmi_platform_driver = {
+	.probe		= imx_dw_hdmi_probe,
+	.remove		= imx_dw_hdmi_remove,
+	.driver		= {
+		.name	= "imx-dw-hdmi",
+		.of_match_table = imx_dw_hdmi_of_table,
+	},
+};
+
+module_platform_driver(im_dw_hdmi_platform_driver);
+
+MODULE_DESCRIPTION("i.MX8M HDMI encoder driver");
+MODULE_LICENSE("GPL");
-- 
2.30.2

