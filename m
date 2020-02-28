Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A7117462B
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 11:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA906E30D;
	Sat, 29 Feb 2020 10:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5304::7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8DA6F4AF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 18:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582913984;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=KXDxjYvjEmkF3JyQOKq8VWv0rkPPoGHlQy9Z7iMTutw=;
 b=rOGZDkSyPgq0Ul96ser2WF2JOuocUcXDDx+HvbPfGpJGLikCaIqOGjW/YuETmSK4dy
 Hm8cXBjGEgegyF2tvHQuOFRtzn8Am/e49Uw3Cjn2PTH3qxaLqJo3xa69JgPijZuPugYD
 NW81eU3nvTzb3xpsX8iYVExOJyMpwuXGU343RoMHI6ZSDoXSbt38sWPFYXMZgbIcWiTU
 Y+HefwRsbD6C5dHuM0ZWSsBhwOj7JunSt6+5La/1i+HUr5mSc9mCPvN+yHL3M34yYmU9
 DtCdiuFslt6Lsu7HdAniDgtF/7qDSO6md77fgpm73X4/k7a1R+0WAih7vDMMNrAkVTWN
 o7yg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6G1+ULkA="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
 with ESMTPSA id y0a02cw1SIJb2Lq
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 28 Feb 2020 19:19:37 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Paul Boddie <paul@boddie.org.uk>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC v2 4/8] drm: ingenic: add jz4780 Synopsys HDMI driver.
Date: Fri, 28 Feb 2020 19:19:29 +0100
Message-Id: <818cca0cda7a5dbb29d818468e47681f5882e1e1.1582913973.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582913973.git.hns@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 29 Feb 2020 10:13:17 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-gpio@vger.kernel.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Boddie <paul@boddie.org.uk>

A specialisation of the generic Synopsys HDMI driver is employed for JZ4780
HDMI support. This requires a new driver, plus device tree and configuration
modifications.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/Kconfig          |   8 ++
 drivers/gpu/drm/ingenic/Makefile         |   1 +
 drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c | 120 +++++++++++++++++++++++
 3 files changed, 129 insertions(+)
 create mode 100644 drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c

diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
index d82c3d37ec9c..44bfd0d35af1 100644
--- a/drivers/gpu/drm/ingenic/Kconfig
+++ b/drivers/gpu/drm/ingenic/Kconfig
@@ -14,3 +14,11 @@ config DRM_INGENIC
 	  Choose this option for DRM support for the Ingenic SoCs.
 
 	  If M is selected the module will be called ingenic-drm.
+
+config DRM_DW_HDMI_JZ4780
+	tristate "HDMI Support for Ingenic JZ4780"
+	depends on DRM_INGENIC
+	depends on OF
+	select DRM_DW_HDMI
+	help
+	  Choose this option for HDMI output from the Ingenic JZ4780.
diff --git a/drivers/gpu/drm/ingenic/Makefile b/drivers/gpu/drm/ingenic/Makefile
index 11cac42ce0bb..238383de63c7 100644
--- a/drivers/gpu/drm/ingenic/Makefile
+++ b/drivers/gpu/drm/ingenic/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_DRM_INGENIC) += ingenic-drm.o
+obj-$(CONFIG_DRM_DW_HDMI_JZ4780) += dw_hdmi-jz4780.o
diff --git a/drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c b/drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c
new file mode 100644
index 000000000000..fa379e337263
--- /dev/null
+++ b/drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
+ * Copyright (C) 2019 Paul Boddie <paul@boddie.org.uk>
+ *
+ * Derived from dw_hdmi-imx.c with i.MX portions removed.
+ * Probe and remove operations derived from rcar_dw_hdmi.c.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <drm/bridge/dw_hdmi.h>
+#include <drm/drm_of.h>
+
+static const struct dw_hdmi_mpll_config jz4780_mpll_cfg[] = {
+	{ 45250000,  { { 0x01e0, 0x0000 },
+		       { 0x21e1, 0x0000 },
+		       { 0x41e2, 0x0000 } } },
+	{ 92500000,  { { 0x0140, 0x0005 },
+		       { 0x2141, 0x0005 },
+		       { 0x4142, 0x0005 } } },
+	{ 148500000, { { 0x00a0, 0x000a },
+		       { 0x20a1, 0x000a },
+		       { 0x40a2, 0x000a } } },
+	{ 216000000, { { 0x00a0, 0x000a },
+		       { 0x2001, 0x000f },
+		       { 0x4002, 0x000f } } },
+	{ ~0UL,      { { 0x0000, 0x0000 },
+		       { 0x0000, 0x0000 },
+		       { 0x0000, 0x0000 } } }
+};
+
+static const struct dw_hdmi_curr_ctrl jz4780_cur_ctr[] = {
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
+static const struct dw_hdmi_phy_config jz4780_phy_config[] = {
+	/*pixelclk   symbol   term   vlev */
+	{ 216000000, 0x800d, 0x0005, 0x01ad},
+	{ ~0UL,      0x0000, 0x0000, 0x0000}
+};
+
+static enum drm_mode_status
+jz4780_hdmi_mode_valid(struct drm_connector *con,
+		       const struct drm_display_mode *mode)
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
+static struct dw_hdmi_plat_data jz4780_dw_hdmi_plat_data = {
+	.mpll_cfg   = jz4780_mpll_cfg,
+	.cur_ctr    = jz4780_cur_ctr,
+	.phy_config = jz4780_phy_config,
+	.mode_valid = jz4780_hdmi_mode_valid,
+};
+
+static const struct of_device_id jz4780_dw_hdmi_dt_ids[] = {
+	{ .compatible = "ingenic,jz4780-dw-hdmi" },
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, jz4780_dw_hdmi_dt_ids);
+
+static int jz4780_dw_hdmi_probe(struct platform_device *pdev)
+{
+	struct dw_hdmi *hdmi;
+
+	hdmi = dw_hdmi_probe(pdev, &jz4780_dw_hdmi_plat_data);
+	if (IS_ERR(hdmi))
+		return PTR_ERR(hdmi);
+
+	platform_set_drvdata(pdev, hdmi);
+
+	return 0;
+}
+
+static int jz4780_dw_hdmi_remove(struct platform_device *pdev)
+{
+	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
+
+	dw_hdmi_remove(hdmi);
+
+	return 0;
+}
+
+static struct platform_driver jz4780_dw_hdmi_platform_driver = {
+	.probe  = jz4780_dw_hdmi_probe,
+	.remove = jz4780_dw_hdmi_remove,
+	.driver = {
+		.name = "dw-hdmi-jz4780",
+		.of_match_table = jz4780_dw_hdmi_dt_ids,
+	},
+};
+
+module_platform_driver(jz4780_dw_hdmi_platform_driver);
+
+MODULE_AUTHOR("Andy Yan <andy.yan@rock-chips.com>");
+MODULE_AUTHOR("Yakir Yang <ykk@rock-chips.com>");
+MODULE_AUTHOR("Paul Boddie <paul@boddie.org.uk>");
+MODULE_DESCRIPTION("Ingenic JZ4780 DW-HDMI Driver Extension");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:dw-hdmi-jz4780");
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
