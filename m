Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A55C186DB8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 15:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601AB897F0;
	Mon, 16 Mar 2020 14:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74553897F0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 14:46:59 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5D5FF400B0;
 Mon, 16 Mar 2020 14:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1584370018; bh=LN9uKbzVNlSJ2O4zRB08l1ExGsQQvCBB7mmSYtvGZrc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JHt/AE69tmQHie6O79odi3mt5wnEPoAqmp0CGrK+zwUL+u34z3hWbVYxVWlP+fZ0G
 tiVk6+wPCTwkWxtU4abWJATQhAJhZIAvZstkVT+NVFpRXiayMhrYcg7GPDafYy2gUm
 QscLCvxLV4N4KtEIZMpYazinlKbz6jGWW1CxXOVpYy2kuy7FL5eUEq8lSZqCaw/daY
 2lxkBJZ7mEs0I0GGH0IazfTW8ZZa9Y0gSmNmQC7XNgKJHT9iG8kZhr8jTAvmfscn1R
 4OOjXILGNzb1n9kxxeI8brN7hSPhAKLvWKuPE5QVCf5yRf4/xkANwRutFJPhRO4/Dv
 /03O4DT6UoRBw==
Received: from paltsev-e7480.internal.synopsys.com (unknown [10.121.8.79])
 by mailhost.synopsys.com (Postfix) with ESMTP id 6520DA005F;
 Mon, 16 Mar 2020 14:46:56 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: dri-devel@lists.freedesktop.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 1/2] DRM: ARC: add HDMI 2.0 TX encoder support
Date: Mon, 16 Mar 2020 17:46:46 +0300
Message-Id: <20200316144647.10416-2-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316144647.10416-1-Eugeniy.Paltsev@synopsys.com>
References: <20200316144647.10416-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Synopsys ARC SoCs (like HSDK4xD) include on-chip DesignWare HDMI
encoders. Support them with a platform driver to provide platform glue
data to the dw-hdmi driver.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 MAINTAINERS                       |   6 ++
 drivers/gpu/drm/Makefile          |   2 +-
 drivers/gpu/drm/arc/Kconfig       |   7 ++
 drivers/gpu/drm/arc/Makefile      |   1 +
 drivers/gpu/drm/arc/arc-dw-hdmi.c | 126 ++++++++++++++++++++++++++++++
 5 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/arc/arc-dw-hdmi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a6fbdf354d34..a6dd992c5f95 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1258,6 +1258,12 @@ S:	Supported
 F:	drivers/gpu/drm/arc/
 F:	Documentation/devicetree/bindings/display/snps,arcpgu.txt
 
+ARC DW HDMI DRIVER
+M:	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
+S:	Supported
+F:	drivers/gpu/drm/arc/arc-dw-hdmi.c
+F:	Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.txt
+
 ARCNET NETWORK LAYER
 M:	Michael Grzeschik <m.grzeschik@pengutronix.de>
 L:	netdev@vger.kernel.org
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 6493088a0fdd..5b0bcf7f45cd 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -109,7 +109,7 @@ obj-y			+= panel/
 obj-y			+= bridge/
 obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/
 obj-$(CONFIG_DRM_ETNAVIV) += etnaviv/
-obj-$(CONFIG_DRM_ARCPGU)+= arc/
+obj-y			+= arc/
 obj-y			+= hisilicon/
 obj-$(CONFIG_DRM_ZTE)	+= zte/
 obj-$(CONFIG_DRM_MXSFB)	+= mxsfb/
diff --git a/drivers/gpu/drm/arc/Kconfig b/drivers/gpu/drm/arc/Kconfig
index e8f3d63e0b91..baec9d2a4fba 100644
--- a/drivers/gpu/drm/arc/Kconfig
+++ b/drivers/gpu/drm/arc/Kconfig
@@ -8,3 +8,10 @@ config DRM_ARCPGU
 	  Choose this option if you have an ARC PGU controller.
 
 	  If M is selected the module will be called arcpgu.
+
+config DRM_ARC_DW_HDMI
+	tristate "ARC DW HDMI"
+	depends on DRM && OF
+	select DRM_DW_HDMI
+	help
+	  Synopsys DW HDMI driver for various ARC development boards
diff --git a/drivers/gpu/drm/arc/Makefile b/drivers/gpu/drm/arc/Makefile
index c7028b7427b3..7a156d8c2c3c 100644
--- a/drivers/gpu/drm/arc/Makefile
+++ b/drivers/gpu/drm/arc/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 arcpgu-y := arcpgu_crtc.o arcpgu_hdmi.o arcpgu_sim.o arcpgu_drv.o
 obj-$(CONFIG_DRM_ARCPGU) += arcpgu.o
+obj-$(CONFIG_DRM_ARC_DW_HDMI) += arc-dw-hdmi.o
diff --git a/drivers/gpu/drm/arc/arc-dw-hdmi.c b/drivers/gpu/drm/arc/arc-dw-hdmi.c
new file mode 100644
index 000000000000..4869dd668a51
--- /dev/null
+++ b/drivers/gpu/drm/arc/arc-dw-hdmi.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Synopsys DW HDMI driver for various ARC development boards
+//
+// Copyright (C) 2020 Synopsys
+// Author: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
+
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <drm/bridge/dw_hdmi.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_encoder_slave.h>
+#include <drm/drm_of.h>
+
+static const struct dw_hdmi_mpll_config snps_hdmi_mpll_cfg[] = {
+	{
+		27000000, {
+			{ 0x00B3, 0x0000 },
+			{ 0x00B3, 0x0000 },
+			{ 0x00B3, 0x0000 }
+		},
+	}, {
+		74250000, {
+			{ 0x0072, 0x0001},
+			{ 0x0072, 0x0001},
+			{ 0x0072, 0x0001}
+		},
+	}, {
+		148500000, {
+			{ 0x0051, 0x0002},
+			{ 0x0051, 0x0002},
+			{ 0x0051, 0x0002}
+		},
+	}, {
+		~0UL, {
+			{ 0x00B3, 0x0000 },
+			{ 0x00B3, 0x0000 },
+			{ 0x00B3, 0x0000 },
+		},
+	}
+};
+
+static const struct dw_hdmi_curr_ctrl snps_hdmi_cur_ctr[] = {
+	/* pixelclk    bpp8    bpp10   bpp12 */
+	{ 27000000,  { 0x0000, 0x0000, 0x0000 }, },
+	{ 74250000,  { 0x0008, 0x0008, 0x0008 }, },
+	{ 148500000, { 0x001b, 0x001b, 0x001b }, },
+	{ ~0UL,      { 0x0000, 0x0000, 0x0000 }, }
+};
+
+
+static const struct dw_hdmi_phy_config snps_hdmi_phy_config[] = {
+	/* pixelclk   symbol  term    vlev */
+	{ 27000000,   0x8009, 0x0004, 0x0232},
+	{ 74250000,   0x8009, 0x0004, 0x0232},
+	{ 148500000,  0x8009, 0x0004, 0x0232},
+	{ ~0UL,       0x8009, 0x0004, 0x0232}
+};
+
+static enum drm_mode_status snps_dw_hdmi_mode_valid(struct drm_connector *con,
+						    const struct drm_display_mode *mode)
+{
+	return MODE_OK;
+}
+
+static struct dw_hdmi_plat_data snps_dw_hdmi_drv_data = {
+	.mpll_cfg   = snps_hdmi_mpll_cfg,
+	.cur_ctr    = snps_hdmi_cur_ctr,
+	.phy_config = snps_hdmi_phy_config,
+	.mode_valid = snps_dw_hdmi_mode_valid,
+};
+
+static const struct of_device_id snps_dw_hdmi_dt_ids[] = {
+	{
+		.compatible = "snps,dw-hdmi-hsdk",
+		.data = &snps_dw_hdmi_drv_data
+	}, { /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, snps_dw_hdmi_dt_ids);
+
+static int snps_dw_hdmi_probe(struct platform_device *pdev)
+{
+	const struct dw_hdmi_plat_data *plat_data;
+	const struct of_device_id *match;
+	struct dw_hdmi *hdmi;
+
+	if (!pdev->dev.of_node)
+		return -ENODEV;
+
+	match = of_match_node(snps_dw_hdmi_dt_ids, pdev->dev.of_node);
+	plat_data = match->data;
+
+	hdmi = dw_hdmi_probe(pdev, plat_data);
+	if (IS_ERR(hdmi))
+		return PTR_ERR(hdmi);
+
+	platform_set_drvdata(pdev, hdmi);
+
+	return 0;
+}
+
+static int snps_dw_hdmi_remove(struct platform_device *pdev)
+{
+	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
+
+	dw_hdmi_remove(hdmi);
+
+	return 0;
+}
+
+static struct platform_driver snps_dw_hdmi_platform_driver = {
+	.probe  = snps_dw_hdmi_probe,
+	.remove = snps_dw_hdmi_remove,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = snps_dw_hdmi_dt_ids,
+	},
+};
+module_platform_driver(snps_dw_hdmi_platform_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("ARC specific DW-HDMI driver extension");
+MODULE_AUTHOR("Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>");
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
