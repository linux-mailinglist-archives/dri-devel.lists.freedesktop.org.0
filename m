Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4A93E38C8
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 07:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D123589C9C;
	Sun,  8 Aug 2021 05:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [85.215.255.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B7189CA4
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 05:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628399446;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=PNoL+uPVa/EtHg8cMcNNaXbR5Yr+tlsCZB8IjNiOBAo=;
 b=EMwa6Zi+2gKe46WDGWYJfc+FooZ3M2xEL7EEicEIC+rDD89LQOtLZMXfV0OYdSD//o
 /8SphPjWpRVaXr+EPdYgfNumTvrjNcKzL84c6xByh52dBOSmtf/jNWpkbKJbcNLaBsp3
 Q+gOAZEasFKGySFkBjuNctUWm7tJYt5E+7NNgqn27V3fF3UEVwrbEAwrjJGrZ7jNH7xk
 laSgIWh53+OYRK8yoY+fgsKG3CVnNvMhnpj5svE7B93yBTNoCxtnF9AU58VQ2AVqzkfk
 B5Z0AEbkMfvEQOpmsBiHjh4f/Rlxs45R1l0SmMKszbe5tSTNMH3wWodNZcxfM+K8YaPK
 G6ww==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdcKVX0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
 with ESMTPSA id Q02727x785AjEye
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 8 Aug 2021 07:10:45 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
 Paul Boddie <paul@boddie.org.uk>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/9] drm/ingenic: Add jz4780 Synopsys HDMI driver
Date: Sun,  8 Aug 2021 07:10:37 +0200
Message-Id: <7a87980d496f8ee937ac732278a2a2256f25023b.1628399442.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628399442.git.hns@goldelico.com>
References: <cover.1628399442.git.hns@goldelico.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Boddie <paul@boddie.org.uk>

A specialisation of the generic Synopsys HDMI driver is employed for JZ4780
HDMI support. This requires a new driver, plus device tree and configuration
modifications.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/Kconfig           |   9 ++
 drivers/gpu/drm/ingenic/Makefile          |   1 +
 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c | 121 ++++++++++++++++++++++
 3 files changed, 131 insertions(+)
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c

diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
index 3b57f8be007c4..4c7d311fbefff 100644
--- a/drivers/gpu/drm/ingenic/Kconfig
+++ b/drivers/gpu/drm/ingenic/Kconfig
@@ -25,4 +25,13 @@ config DRM_INGENIC_IPU
 
 	  The Image Processing Unit (IPU) will appear as a second primary plane.
 
+config DRM_INGENIC_DW_HDMI
+	bool "Ingenic specific support for Synopsys DW HDMI"
+	depends on MACH_JZ4780
+	select DRM_DW_HDMI
+	help
+	  Choose this option to enable Synopsys DesignWare HDMI based driver.
+	  If you want to enable HDMI on Ingenic JZ4780 based SoC, you should
+	  select this option..
+
 endif
diff --git a/drivers/gpu/drm/ingenic/Makefile b/drivers/gpu/drm/ingenic/Makefile
index d313326bdddbb..3db9888a6c046 100644
--- a/drivers/gpu/drm/ingenic/Makefile
+++ b/drivers/gpu/drm/ingenic/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_DRM_INGENIC) += ingenic-drm.o
 ingenic-drm-y = ingenic-drm-drv.o
 ingenic-drm-$(CONFIG_DRM_INGENIC_IPU) += ingenic-ipu.o
+ingenic-drm-$(CONFIG_DRM_INGENIC_DW_HDMI) += ingenic-dw-hdmi.o
diff --git a/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
new file mode 100644
index 0000000000000..61e7a57d7cec1
--- /dev/null
+++ b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
+ * Copyright (C) 2019, 2020 Paul Boddie <paul@boddie.org.uk>
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
+static bool
+ingenic_dw_hdmi_mode_fixup(struct drm_bridge *bridge,
+			   const struct drm_display_mode *mode,
+			   struct drm_display_mode *adjusted_mode)
+{
+	adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+	adjusted_mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+
+	return true;
+}
+
+static const struct drm_bridge_timings ingenic_dw_hdmi_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
+};
+
+static struct dw_hdmi_plat_data ingenic_dw_hdmi_plat_data = {
+	.mpll_cfg   = ingenic_mpll_cfg,
+	.cur_ctr    = ingenic_cur_ctr,
+	.phy_config = ingenic_phy_config,
+	.mode_valid = ingenic_dw_hdmi_mode_valid,
+	.mode_fixup = ingenic_dw_hdmi_mode_fixup,
+	.timings    = &ingenic_dw_hdmi_timings,
+};
+
+static const struct of_device_id ingenic_dw_hdmi_dt_ids[] = {
+	{ .compatible = "ingenic,jz4780-dw-hdmi" },
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, ingenic_dw_hdmi_dt_ids);
+
+static int ingenic_dw_hdmi_probe(struct platform_device *pdev)
+{
+	struct dw_hdmi *hdmi;
+
+	hdmi = dw_hdmi_probe(pdev, &ingenic_dw_hdmi_plat_data);
+	if (IS_ERR(hdmi))
+		return PTR_ERR(hdmi);
+
+	platform_set_drvdata(pdev, hdmi);
+
+	return 0;
+}
+
+static int ingenic_dw_hdmi_remove(struct platform_device *pdev)
+{
+	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
+
+	dw_hdmi_remove(hdmi);
+
+	return 0;
+}
+
+static struct platform_driver ingenic_dw_hdmi_driver = {
+	.probe  = ingenic_dw_hdmi_probe,
+	.remove = ingenic_dw_hdmi_remove,
+	.driver = {
+		.name = "dw-hdmi-ingenic",
+		.of_match_table = ingenic_dw_hdmi_dt_ids,
+	},
+};
+
+struct platform_driver *ingenic_dw_hdmi_driver_ptr = &ingenic_dw_hdmi_driver;
-- 
2.31.1

