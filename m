Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 239294F64D5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 18:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBF410E56F;
	Wed,  6 Apr 2022 16:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63AF10E4A8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 16:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1649262373;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=XcDnRua1uEeDGMPHUYm+AIxPrh0N3urB8auCHil5oBo=;
 b=Wz+Ws0ToeRUsrl3oYpR7R2GCE2fmWfjQStj6yCx7TqI+pWDOvHXI3fl/1EVZYLLvPl
 k42uP2QVwg2+gstgz6JxkiCzSk6RVD1eLHbSXxqfrvEs0A9jYRD6gBhFbcJ3kzmr8Vf6
 ZqFvUhSezmJyC987XsNvX1jwjwpQXCZwY4i5bExXnVNf3PTZeCQv2GAdExhmwrEOniOO
 l7WfLbLwIRThRj6DDZSZvJmODsWg1Fh+DoNEsCGpYzzxdrYYQqUeFXQRNFnESClTLhxw
 RJz7AEriPrqJX6bel1QPBE4fRiqLoZ3kDspapsduEv5xb+z4zakx0uEovjqTuXMPoZcP
 36gQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UMf2MwPVbgcbPa"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.42.2 DYNA|AUTH)
 with ESMTPSA id k708cfy36GQCgVO
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 6 Apr 2022 18:26:12 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Paul Boddie <paul@boddie.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Paul Cercueil <paul@crapouillou.net>,
 Maxime Ripard <maxime@cerno.tech>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v17 2/6] drm/ingenic: Add dw-hdmi driver specialization for
 jz4780
Date: Wed,  6 Apr 2022 18:26:04 +0200
Message-Id: <a5575ec3f7fc8c747602c014bcf06d14ad954171.1649262368.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1649262368.git.hns@goldelico.com>
References: <cover.1649262368.git.hns@goldelico.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org, Ezequiel Garcia <ezequiel@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Boddie <paul@boddie.org.uk>

A specialisation of the generic Synopsys HDMI driver is employed for
JZ4780 HDMI support. This requires a new driver, plus device tree and
configuration modifications.

Here we add Kconfig DRM_INGENIC_DW_HDMI, Makefile and driver code.

Note that there is no hpd-gpio installed on the CI20 board HDMI
connector. Hence there is no hpd detection by the connector driver
and we have to enable polling in the dw-hdmi core driver.

For that we need to set .poll_enabled but that struct component
can only be accessed by core code. Hence we use the public
setter function drm_kms_helper_hotplug_event() introduced before.

Also note that we disable Color Space Conversion since it is not
working on jz4780.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/Kconfig           |   9 ++
 drivers/gpu/drm/ingenic/Makefile          |   1 +
 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c | 104 ++++++++++++++++++++++
 3 files changed, 114 insertions(+)
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c

diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
index 001f59fb06d56..090830bcbde7f 100644
--- a/drivers/gpu/drm/ingenic/Kconfig
+++ b/drivers/gpu/drm/ingenic/Kconfig
@@ -24,4 +24,13 @@ config DRM_INGENIC_IPU
 
 	  The Image Processing Unit (IPU) will appear as a second primary plane.
 
+config DRM_INGENIC_DW_HDMI
+	tristate "Ingenic specific support for Synopsys DW HDMI"
+	depends on MACH_JZ4780
+	select DRM_DW_HDMI
+	help
+	  Choose this option to enable Synopsys DesignWare HDMI based driver.
+	  If you want to enable HDMI on Ingenic JZ4780 based SoC, you should
+	  select this option.
+
 endif
diff --git a/drivers/gpu/drm/ingenic/Makefile b/drivers/gpu/drm/ingenic/Makefile
index d313326bdddbb..f10cc1c5a5f22 100644
--- a/drivers/gpu/drm/ingenic/Makefile
+++ b/drivers/gpu/drm/ingenic/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_DRM_INGENIC) += ingenic-drm.o
 ingenic-drm-y = ingenic-drm-drv.o
 ingenic-drm-$(CONFIG_DRM_INGENIC_IPU) += ingenic-ipu.o
+obj-$(CONFIG_DRM_INGENIC_DW_HDMI) += ingenic-dw-hdmi.o
diff --git a/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
new file mode 100644
index 0000000000000..10c56183613b0
--- /dev/null
+++ b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
+ * Copyright (C) 2019, 2020 Paul Boddie <paul@boddie.org.uk>
+ *
+ * Derived from dw_hdmi-imx.c with i.MX portions removed.
+ */
+
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#include <drm/bridge/dw_hdmi.h>
+#include <drm/drm_of.h>
+#include <drm/drm_print.h>
+
+static const struct dw_hdmi_mpll_config ingenic_mpll_cfg[] = {
+	{ 45250000,  { { 0x01e0, 0x0000 }, { 0x21e1, 0x0000 }, { 0x41e2, 0x0000 } } },
+	{ 92500000,  { { 0x0140, 0x0005 }, { 0x2141, 0x0005 }, { 0x4142, 0x0005 } } },
+	{ 148500000, { { 0x00a0, 0x000a }, { 0x20a1, 0x000a }, { 0x40a2, 0x000a } } },
+	{ 216000000, { { 0x00a0, 0x000a }, { 0x2001, 0x000f }, { 0x4002, 0x000f } } },
+	{ ~0UL,      { { 0x0000, 0x0000 }, { 0x0000, 0x0000 }, { 0x0000, 0x0000 } } }
+};
+
+static const struct dw_hdmi_curr_ctrl ingenic_cur_ctr[] = {
+	/*pixelclk     bpp8    bpp10   bpp12 */
+	{ 54000000,  { 0x091c, 0x091c, 0x06dc } },
+	{ 58400000,  { 0x091c, 0x06dc, 0x06dc } },
+	{ 72000000,  { 0x06dc, 0x06dc, 0x091c } },
+	{ 74250000,  { 0x06dc, 0x0b5c, 0x091c } },
+	{ 118800000, { 0x091c, 0x091c, 0x06dc } },
+	{ 216000000, { 0x06dc, 0x0b5c, 0x091c } },
+	{ ~0UL,      { 0x0000, 0x0000, 0x0000 } },
+};
+
+/*
+ * Resistance term 133Ohm Cfg
+ * PREEMP config 0.00
+ * TX/CK level 10
+ */
+static const struct dw_hdmi_phy_config ingenic_phy_config[] = {
+	/*pixelclk   symbol   term   vlev */
+	{ 216000000, 0x800d, 0x0005, 0x01ad},
+	{ ~0UL,      0x0000, 0x0000, 0x0000}
+};
+
+static enum drm_mode_status
+ingenic_dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
+			   const struct drm_display_info *info,
+			   const struct drm_display_mode *mode)
+{
+	if (mode->clock < 13500)
+		return MODE_CLOCK_LOW;
+	/* FIXME: Hardware is capable of 270MHz, but setup data is missing. */
+	if (mode->clock > 216000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static struct dw_hdmi_plat_data ingenic_dw_hdmi_plat_data = {
+	.mpll_cfg   = ingenic_mpll_cfg,
+	.cur_ctr    = ingenic_cur_ctr,
+	.phy_config = ingenic_phy_config,
+	.mode_valid = ingenic_dw_hdmi_mode_valid,
+	.output_port	= 1,
+	.disable_csc	= 0,	/* DRM_COLOR_FORMAT_YCBCR do not work */
+};
+
+static const struct of_device_id ingenic_dw_hdmi_dt_ids[] = {
+	{ .compatible = "ingenic,jz4780-dw-hdmi" },
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, ingenic_dw_hdmi_dt_ids);
+
+static void ingenic_dw_hdmi_cleanup(void *data)
+{
+	struct dw_hdmi *hdmi = (struct dw_hdmi *)data;
+
+	dw_hdmi_remove(hdmi);
+}
+
+static int ingenic_dw_hdmi_probe(struct platform_device *pdev)
+{
+	struct dw_hdmi *hdmi;
+
+	hdmi = dw_hdmi_probe(pdev, &ingenic_dw_hdmi_plat_data);
+	if (IS_ERR(hdmi))
+		return PTR_ERR(hdmi);
+
+	return devm_add_action_or_reset(&pdev->dev, ingenic_dw_hdmi_cleanup, hdmi);
+}
+
+static struct platform_driver ingenic_dw_hdmi_driver = {
+	.probe  = ingenic_dw_hdmi_probe,
+	.driver = {
+		.name = "dw-hdmi-ingenic",
+		.of_match_table = ingenic_dw_hdmi_dt_ids,
+	},
+};
+module_platform_driver(ingenic_dw_hdmi_driver);
+
+MODULE_DESCRIPTION("JZ4780 Specific DW-HDMI Driver Extension");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:dw-hdmi-ingenic");
-- 
2.33.0

