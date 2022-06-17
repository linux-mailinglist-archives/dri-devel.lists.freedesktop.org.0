Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F257354F1E8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E71D11A9EE;
	Fri, 17 Jun 2022 07:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E4711A9F3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 07:27:38 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id kq6so7083706ejb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 00:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U4Pt6dX20y12V8u4V+OViKUJGyXa3hK3IsPJV1JLMWE=;
 b=ZcicU6Z6hFiTydjYWlHAPbXC1F/jVqnKudS8aecswkGy5gc6/dAYH+q9uNA4f8wp+e
 H79dFBJ/7yJ5rtz6gc3LfwAuTYcOs2/HGutqDins0b6315J10xhBD9TwKbjRgm7prlTZ
 NzqP1q+RrZW81cmrcGBIqWq5Fpn3qBfwWLmbMHOtQdbOlyJqCujSYnG6GAQRik80s5cF
 CCiylolBzzDZOKdEhHjxUhQZzcO8cYXjPF8NAUdxy3OVahEWEi+HrtTHaTbHXc5oOqtg
 NgmxDEJLH4cy/JyLTdb7AFix9E5R22zwyFdQg8l4LbvWM9xuVjbXPsYQHz+bbBR03zae
 A7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U4Pt6dX20y12V8u4V+OViKUJGyXa3hK3IsPJV1JLMWE=;
 b=XQJQr+FXbjJr2ctGnc60Zjpe7Iwxku33jhoO9F1N+vZ6gfmRvgFveRo8cEjVWdlh3Z
 trxI6jMsXuJkHU1Xu4pPYaoKLhe77Cw+P72N85dIq3HfPYt87qfELWHKlxMn/AX7pq/m
 gZ4BNZOQnRkEpdUOlK745Cd6iYIKmCX3Sb2seIz9R8+GoSBDzb2K5tG4nd9kCIMTvBGh
 VOFtN0ohlZp2wXgTkxkNY+TFP2Zd81eSLag7yl4B3g2Hv5PjnVZw7lgfUnq6Qmiqxbkg
 xJuaKpIQjQoMnovJSeEkARWluNvh2wDAuQVPeIZisG3JAMe3ZIQe2dpsSgPggIbULj2V
 kmYw==
X-Gm-Message-State: AJIora8wWyc5Yq97bSW8cesZBZYWCogteCIgdYNlLkq4X6/KoJQDV+7v
 aBk9TP2ddEl45Or/9NDieTbXH7OmDB5bow==
X-Google-Smtp-Source: AGRyM1sy7pYIQbzYp53DMQWoIkvRDiLVBDh4cWq9pCIKXhIBlYVwxanreiKW1jSKdavuSs98bP4ZmA==
X-Received: by 2002:a17:906:778b:b0:712:e477:8f33 with SMTP id
 s11-20020a170906778b00b00712e4778f33mr8081910ejm.42.1655450857861; 
 Fri, 17 Jun 2022 00:27:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d227:8f3c:286a:d9d8])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a170906840900b006fec56a80a8sm1762556ejx.115.2022.06.17.00.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 00:27:37 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org,
	martin.blumenstingl@googlemail.com
Subject: [PATCH v3 6/6] drm/meson: add support for MIPI-DSI transceiver
Date: Fri, 17 Jun 2022 09:27:23 +0200
Message-Id: <20220617072723.1742668-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220617072723.1742668-1-narmstrong@baylibre.com>
References: <20220617072723.1742668-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=19338; h=from:subject;
 bh=PZ8q84CWoxyQYWWZJlYqiLEjqlXVQGbs+CkmFtmQKus=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBirCyrI+Nnb24D4ULuUw4ZkVK61JVQIA3X0+ERI32t
 APYNolGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYqwsqwAKCRB33NvayMhJ0Z09D/
 9Ig3N4+jj3xC40E0sjrM299BYoBTyHqNHj3Zt1ddJvMvWer2bxHgJsB//dZ9UmdrMfCb+Mjrsz0i6i
 DACuv59/IwFqHw2xUTUDHT+xO7RpJUkeccvMND/D5MkRT/cauyg8PrqwWA4rY4uiupSc+WHfrQnUjq
 BgQ0aP+MXnahyFvS1yu9zzrab2Vi25TlxNae8vs6fQx27wYeHArwQCJo5ZQ987dDLOKzQQ7Goz9ji/
 2IAv3XV65VmfVl93pxTga8P9NebQZ+Cpd0TR/4GXmgiBNEnbBRgpv97BLfR0AtPkJXKNacieWNZvT2
 PPUC7qfXv6zPRIbE65wneyDV7Em29d8XeueXPt82QvBgmPGEzmSYcraPy90u/9EG1Amr5A4qNKRaTJ
 rDhmUTfCCFP6c6TRjvLOMRlRup8Rbb5EjIlXloitSwg/yhZpbb5YPtOhZ15EMQKyJjEzibN290waM/
 QLdlCOC4qtzLaYmVZUIXagE7B9M1LJipFlsQcn+pGQUfiysejrvX2SSINYWfBOM+y//5+Nj6DTLGWn
 GEsh61woBPN7d8TFvTELNX3Cu0gMpCZpc1DcaZ2IGQw4aQN/e4SZvYJA1EdsVZYY0lAPLt8sp6VCPF
 b0VVRv4lCAFzZ8memj9bqb/LdSsCg7zG0Y4gB52E4Hsi7q5pKJ9QvHgSKA2A==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Amlogic G12A/G12B/SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
Glue on other Amlogic SoCs.

This adds support for the Glue managing the transceiver, mimicing the init flow provided
by Amlogic to setup the ENCL encoder, the glue, the transceiver, the digital D-PHY and the
Analog PHY in the proper way.

An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
DW-MIPI-DSI transceiver.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/meson/Kconfig             |   7 +
 drivers/gpu/drm/meson/Makefile            |   1 +
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 358 ++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h | 160 ++++++++++
 4 files changed, 526 insertions(+)
 create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h

diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
index 6c70fc3214af..71a1364b51e1 100644
--- a/drivers/gpu/drm/meson/Kconfig
+++ b/drivers/gpu/drm/meson/Kconfig
@@ -17,3 +17,10 @@ config DRM_MESON_DW_HDMI
 	default y if DRM_MESON
 	select DRM_DW_HDMI
 	imply DRM_DW_HDMI_I2S_AUDIO
+
+config DRM_MESON_DW_MIPI_DSI
+	tristate "MIPI DSI Synopsys Controller support for Amlogic Meson Display"
+	depends on DRM_MESON
+	default y if DRM_MESON
+	select DRM_DW_MIPI_DSI
+	select GENERIC_PHY_MIPI_DPHY
diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makefile
index 833e18c20603..43071bdbd4b9 100644
--- a/drivers/gpu/drm/meson/Makefile
+++ b/drivers/gpu/drm/meson/Makefile
@@ -6,3 +6,4 @@ meson-drm-y += meson_encoder_hdmi.o meson_encoder_dsi.o
 
 obj-$(CONFIG_DRM_MESON) += meson-drm.o
 obj-$(CONFIG_DRM_MESON_DW_HDMI) += meson_dw_hdmi.o
+obj-$(CONFIG_DRM_MESON_DW_MIPI_DSI) += meson_dw_mipi_dsi.o
diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
new file mode 100644
index 000000000000..52c8578914b6
--- /dev/null
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/reset.h>
+#include <linux/phy/phy.h>
+#include <linux/bitfield.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/bridge/dw_mipi_dsi.h>
+#include <drm/drm_mipi_dsi.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_device.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_print.h>
+
+#include "meson_drv.h"
+#include "meson_dw_mipi_dsi.h"
+#include "meson_registers.h"
+#include "meson_venc.h"
+
+#define DRIVER_NAME "meson-dw-mipi-dsi"
+#define DRIVER_DESC "Amlogic Meson MIPI-DSI DRM driver"
+
+struct meson_dw_mipi_dsi {
+	struct meson_drm *priv;
+	struct device *dev;
+	void __iomem *base;
+	struct phy *phy;
+	union phy_configure_opts phy_opts;
+	struct dw_mipi_dsi *dmd;
+	struct dw_mipi_dsi_plat_data pdata;
+	struct mipi_dsi_device *dsi_device;
+	const struct drm_display_mode *mode;
+	struct clk *px_clk;
+};
+
+#define encoder_to_meson_dw_mipi_dsi(x) \
+	container_of(x, struct meson_dw_mipi_dsi, encoder)
+
+static void meson_dw_mipi_dsi_hw_init(struct meson_dw_mipi_dsi *mipi_dsi)
+{
+	/* Software reset */
+	writel_bits_relaxed(MIPI_DSI_TOP_SW_RESET_DWC | MIPI_DSI_TOP_SW_RESET_INTR |
+			    MIPI_DSI_TOP_SW_RESET_DPI | MIPI_DSI_TOP_SW_RESET_TIMING,
+			    MIPI_DSI_TOP_SW_RESET_DWC | MIPI_DSI_TOP_SW_RESET_INTR |
+			    MIPI_DSI_TOP_SW_RESET_DPI | MIPI_DSI_TOP_SW_RESET_TIMING,
+			    mipi_dsi->base + MIPI_DSI_TOP_SW_RESET);
+	writel_bits_relaxed(MIPI_DSI_TOP_SW_RESET_DWC | MIPI_DSI_TOP_SW_RESET_INTR |
+			    MIPI_DSI_TOP_SW_RESET_DPI | MIPI_DSI_TOP_SW_RESET_TIMING,
+			    0, mipi_dsi->base + MIPI_DSI_TOP_SW_RESET);
+
+	/* Enable clocks */
+	writel_bits_relaxed(MIPI_DSI_TOP_CLK_SYSCLK_EN | MIPI_DSI_TOP_CLK_PIXCLK_EN,
+			    MIPI_DSI_TOP_CLK_SYSCLK_EN | MIPI_DSI_TOP_CLK_PIXCLK_EN,
+			    mipi_dsi->base + MIPI_DSI_TOP_CLK_CNTL);
+
+	/* Take memory out of power down */
+	writel_relaxed(0, mipi_dsi->base + MIPI_DSI_TOP_MEM_PD);
+}
+
+static int dw_mipi_dsi_phy_init(void *priv_data)
+{
+	struct meson_dw_mipi_dsi *mipi_dsi = priv_data;
+	unsigned int dpi_data_format, venc_data_width;
+	int ret;
+
+	ret = clk_set_rate(mipi_dsi->px_clk, mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate);
+	if (ret) {
+		pr_err("Failed to set DSI PLL rate %lu\n",
+		       mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate);
+
+		return ret;
+	}
+
+	switch (mipi_dsi->dsi_device->format) {
+	case MIPI_DSI_FMT_RGB888:
+		dpi_data_format = DPI_COLOR_24BIT;
+		venc_data_width = VENC_IN_COLOR_24B;
+		break;
+	case MIPI_DSI_FMT_RGB666:
+		dpi_data_format = DPI_COLOR_18BIT_CFG_2;
+		venc_data_width = VENC_IN_COLOR_18B;
+		break;
+	case MIPI_DSI_FMT_RGB666_PACKED:
+	case MIPI_DSI_FMT_RGB565:
+		return -EINVAL;
+	};
+
+	/* Configure color format for DPI register */
+	writel_relaxed(FIELD_PREP(MIPI_DSI_TOP_DPI_COLOR_MODE, dpi_data_format) |
+		       FIELD_PREP(MIPI_DSI_TOP_IN_COLOR_MODE, venc_data_width) |
+		       FIELD_PREP(MIPI_DSI_TOP_COMP2_SEL, 2) |
+		       FIELD_PREP(MIPI_DSI_TOP_COMP1_SEL, 1) |
+		       FIELD_PREP(MIPI_DSI_TOP_COMP0_SEL, 0) |
+		       (mipi_dsi->mode->flags & DRM_MODE_FLAG_NHSYNC ?
+				0 : MIPI_DSI_TOP_HSYNC_INVERT) |
+		       (mipi_dsi->mode->flags & DRM_MODE_FLAG_NVSYNC ?
+				0 : MIPI_DSI_TOP_VSYNC_INVERT),
+			mipi_dsi->base + MIPI_DSI_TOP_CNTL);
+
+	return phy_configure(mipi_dsi->phy, &mipi_dsi->phy_opts);
+}
+
+static void dw_mipi_dsi_phy_power_on(void *priv_data)
+{
+	struct meson_dw_mipi_dsi *mipi_dsi = priv_data;
+
+	if (phy_power_on(mipi_dsi->phy))
+		dev_warn(mipi_dsi->dev, "Failed to power on PHY\n");
+}
+
+static void dw_mipi_dsi_phy_power_off(void *priv_data)
+{
+	struct meson_dw_mipi_dsi *mipi_dsi = priv_data;
+
+	if (phy_power_off(mipi_dsi->phy))
+		dev_warn(mipi_dsi->dev, "Failed to power off PHY\n");
+}
+
+static int
+dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
+			  unsigned long mode_flags, u32 lanes, u32 format,
+			  unsigned int *lane_mbps)
+{
+	struct meson_dw_mipi_dsi *mipi_dsi = priv_data;
+	int bpp;
+
+	mipi_dsi->mode = mode;
+
+	bpp = mipi_dsi_pixel_format_to_bpp(mipi_dsi->dsi_device->format);
+
+	phy_mipi_dphy_get_default_config(mode->clock * 1000,
+					 bpp, mipi_dsi->dsi_device->lanes,
+					 &mipi_dsi->phy_opts.mipi_dphy);
+
+	*lane_mbps = mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate / 1000000;
+
+	return 0;
+}
+
+static int
+dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
+			   struct dw_mipi_dsi_dphy_timing *timing)
+{
+	/* TOFIX handle other cases */
+
+	timing->clk_lp2hs = 37;
+	timing->clk_hs2lp = 135;
+	timing->data_lp2hs = 50;
+	timing->data_hs2lp = 3;
+
+	return 0;
+}
+
+static int
+dw_mipi_dsi_get_esc_clk_rate(void *priv_data, unsigned int *esc_clk_rate)
+{
+	*esc_clk_rate = 4; /* Mhz */
+
+	return 0;
+}
+
+static const struct dw_mipi_dsi_phy_ops meson_dw_mipi_dsi_phy_ops = {
+	.init = dw_mipi_dsi_phy_init,
+	.power_on = dw_mipi_dsi_phy_power_on,
+	.power_off = dw_mipi_dsi_phy_power_off,
+	.get_lane_mbps = dw_mipi_dsi_get_lane_mbps,
+	.get_timing = dw_mipi_dsi_phy_get_timing,
+	.get_esc_clk_rate = dw_mipi_dsi_get_esc_clk_rate,
+};
+
+static int meson_dw_mipi_dsi_bind(struct device *dev, struct device *master, void *data)
+{
+	struct meson_dw_mipi_dsi *mipi_dsi = dev_get_drvdata(dev);
+	struct drm_device *drm = data;
+	struct meson_drm *priv = drm->dev_private;
+
+	/* Check before if we are supposed to have a sub-device... */
+	if (!mipi_dsi->dsi_device) {
+		dw_mipi_dsi_remove(mipi_dsi->dmd);
+		return -EPROBE_DEFER;
+	}
+
+	mipi_dsi->priv = priv;
+
+	meson_dw_mipi_dsi_hw_init(mipi_dsi);
+
+	return 0;
+}
+
+static const struct component_ops meson_dw_mipi_dsi_ops = {
+	.bind	= meson_dw_mipi_dsi_bind,
+};
+
+static int meson_dw_mipi_dsi_host_attach(void *priv_data,
+					 struct mipi_dsi_device *device)
+{
+	struct meson_dw_mipi_dsi *mipi_dsi = priv_data;
+
+	mipi_dsi->dsi_device = device;
+
+	switch (device->format) {
+	case MIPI_DSI_FMT_RGB888:
+		break;
+	case MIPI_DSI_FMT_RGB666:
+		break;
+	case MIPI_DSI_FMT_RGB666_PACKED:
+	case MIPI_DSI_FMT_RGB565:
+		dev_err(mipi_dsi->dev, "invalid pixel format %d\n", device->format);
+		return -EINVAL;
+	};
+
+	return phy_init(mipi_dsi->phy);
+}
+
+static int meson_dw_mipi_dsi_host_detach(void *priv_data,
+					 struct mipi_dsi_device *device)
+{
+	struct meson_dw_mipi_dsi *mipi_dsi = priv_data;
+
+	if (device == mipi_dsi->dsi_device)
+		mipi_dsi->dsi_device = NULL;
+	else
+		return -EINVAL;
+
+	return phy_exit(mipi_dsi->phy);
+}
+
+static const struct dw_mipi_dsi_host_ops meson_dw_mipi_dsi_host_ops = {
+	.attach = meson_dw_mipi_dsi_host_attach,
+	.detach = meson_dw_mipi_dsi_host_detach,
+};
+
+static int meson_dw_mipi_dsi_probe(struct platform_device *pdev)
+{
+	struct meson_dw_mipi_dsi *mipi_dsi;
+	struct reset_control *top_rst;
+	struct resource *res;
+	int ret;
+
+	mipi_dsi = devm_kzalloc(&pdev->dev, sizeof(*mipi_dsi), GFP_KERNEL);
+	if (!mipi_dsi)
+		return -ENOMEM;
+
+	mipi_dsi->dev = &pdev->dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	mipi_dsi->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(mipi_dsi->base))
+		return PTR_ERR(mipi_dsi->base);
+
+	mipi_dsi->phy = devm_phy_get(&pdev->dev, "dphy");
+	if (IS_ERR(mipi_dsi->phy)) {
+		ret = PTR_ERR(mipi_dsi->phy);
+		dev_err(&pdev->dev, "failed to get mipi dphy: %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi->px_clk = devm_clk_get(&pdev->dev, "px_clk");
+	if (IS_ERR(mipi_dsi->px_clk)) {
+		dev_err(&pdev->dev, "Unable to get PLL clk\n");
+		return PTR_ERR(mipi_dsi->px_clk);
+	}
+
+	/*
+	 * We use a TOP reset signal because the APB reset signal
+	 * is handled by the TOP control registers.
+	 */
+	top_rst = devm_reset_control_get_exclusive(&pdev->dev, "top");
+	if (IS_ERR(top_rst)) {
+		ret = PTR_ERR(top_rst);
+
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Unable to get reset control: %d\n", ret);
+
+		return ret;
+	}
+
+	ret = clk_prepare_enable(mipi_dsi->px_clk);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to prepare/enable PX clock\n");
+		return ret;
+	}
+
+	reset_control_assert(top_rst);
+	usleep_range(10, 20);
+	reset_control_deassert(top_rst);
+
+	/* MIPI DSI Controller */
+
+	mipi_dsi->pdata.base = mipi_dsi->base;
+	mipi_dsi->pdata.max_data_lanes = 4;
+	mipi_dsi->pdata.phy_ops = &meson_dw_mipi_dsi_phy_ops;
+	mipi_dsi->pdata.host_ops = &meson_dw_mipi_dsi_host_ops;
+	mipi_dsi->pdata.priv_data = mipi_dsi;
+	platform_set_drvdata(pdev, mipi_dsi);
+
+	mipi_dsi->dmd = dw_mipi_dsi_probe(pdev, &mipi_dsi->pdata);
+	if (IS_ERR(mipi_dsi->dmd)) {
+		ret = PTR_ERR(mipi_dsi->dmd);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"Failed to probe dw_mipi_dsi: %d\n", ret);
+		goto err_clkdisable;
+	}
+
+	return component_add(mipi_dsi->dev, &meson_dw_mipi_dsi_ops);
+
+err_clkdisable:
+	clk_disable_unprepare(mipi_dsi->px_clk);
+
+	return ret;
+}
+
+static int meson_dw_mipi_dsi_remove(struct platform_device *pdev)
+{
+	struct meson_dw_mipi_dsi *mipi_dsi = dev_get_drvdata(&pdev->dev);
+
+	dw_mipi_dsi_remove(mipi_dsi->dmd);
+
+	component_del(mipi_dsi->dev, &meson_dw_mipi_dsi_ops);
+
+	clk_disable_unprepare(mipi_dsi->px_clk);
+
+	return 0;
+}
+
+static const struct of_device_id meson_dw_mipi_dsi_of_table[] = {
+	{ .compatible = "amlogic,meson-g12a-dw-mipi-dsi", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, meson_dw_mipi_dsi_of_table);
+
+static struct platform_driver meson_dw_mipi_dsi_platform_driver = {
+	.probe		= meson_dw_mipi_dsi_probe,
+	.remove		= meson_dw_mipi_dsi_remove,
+	.driver		= {
+		.name		= DRIVER_NAME,
+		.of_match_table	= meson_dw_mipi_dsi_of_table,
+	},
+};
+module_platform_driver(meson_dw_mipi_dsi_platform_driver);
+
+MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.h b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.h
new file mode 100644
index 000000000000..e1bd6b85d6a3
--- /dev/null
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.h
@@ -0,0 +1,160 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2020 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (C) 2018 Amlogic, Inc. All rights reserved.
+ */
+
+#ifndef __MESON_DW_MIPI_DSI_H
+#define __MESON_DW_MIPI_DSI_H
+
+/* Top-level registers */
+/* [31: 4]    Reserved.     Default 0.
+ *     [3] RW timing_rst_n: Default 1.
+ *		1=Assert SW reset of timing feature.   0=Release reset.
+ *     [2] RW dpi_rst_n: Default 1.
+ *		1=Assert SW reset on mipi_dsi_host_dpi block.   0=Release reset.
+ *     [1] RW intr_rst_n: Default 1.
+ *		1=Assert SW reset on mipi_dsi_host_intr block.  0=Release reset.
+ *     [0] RW dwc_rst_n:  Default 1.
+ *		1=Assert SW reset on IP core.   0=Release reset.
+ */
+#define MIPI_DSI_TOP_SW_RESET                      0x3c0
+
+#define MIPI_DSI_TOP_SW_RESET_DWC	BIT(0)
+#define MIPI_DSI_TOP_SW_RESET_INTR	BIT(1)
+#define MIPI_DSI_TOP_SW_RESET_DPI	BIT(2)
+#define MIPI_DSI_TOP_SW_RESET_TIMING	BIT(3)
+
+/* [31: 5] Reserved.   Default 0.
+ *     [4] RW manual_edpihalt: Default 0.
+ *		1=Manual suspend VencL; 0=do not suspend VencL.
+ *     [3] RW auto_edpihalt_en: Default 0.
+ *		1=Enable IP's edpihalt signal to suspend VencL;
+ *		0=IP's edpihalt signal does not affect VencL.
+ *     [2] RW clock_freerun: Apply to auto-clock gate only. Default 0.
+ *		0=Default, use auto-clock gating to save power;
+ *		1=use free-run clock, disable auto-clock gating, for debug mode.
+ *     [1] RW enable_pixclk: A manual clock gate option, due to DWC IP does not
+ *		have auto-clock gating. 1=Enable pixclk.      Default 0.
+ *     [0] RW enable_sysclk: A manual clock gate option, due to DWC IP does not
+ *		have auto-clock gating. 1=Enable sysclk.      Default 0.
+ */
+#define MIPI_DSI_TOP_CLK_CNTL                      0x3c4
+
+#define MIPI_DSI_TOP_CLK_SYSCLK_EN	BIT(0)
+#define MIPI_DSI_TOP_CLK_PIXCLK_EN	BIT(1)
+
+/* [31:24]    Reserved. Default 0.
+ * [23:20] RW dpi_color_mode: Define DPI pixel format. Default 0.
+ *		0=16-bit RGB565 config 1;
+ *		1=16-bit RGB565 config 2;
+ *		2=16-bit RGB565 config 3;
+ *		3=18-bit RGB666 config 1;
+ *		4=18-bit RGB666 config 2;
+ *		5=24-bit RGB888;
+ *		6=20-bit YCbCr 4:2:2;
+ *		7=24-bit YCbCr 4:2:2;
+ *		8=16-bit YCbCr 4:2:2;
+ *		9=30-bit RGB;
+ *		10=36-bit RGB;
+ *		11=12-bit YCbCr 4:2:0.
+ *    [19] Reserved. Default 0.
+ * [18:16] RW in_color_mode:  Define VENC data width. Default 0.
+ *		0=30-bit pixel;
+ *		1=24-bit pixel;
+ *		2=18-bit pixel, RGB666;
+ *		3=16-bit pixel, RGB565.
+ * [15:14] RW chroma_subsample: Define method of chroma subsampling. Default 0.
+ *		Applicable to YUV422 or YUV420 only.
+ *		0=Use even pixel's chroma;
+ *		1=Use odd pixel's chroma;
+ *		2=Use averaged value between even and odd pair.
+ * [13:12] RW comp2_sel:  Select which component to be Cr or B: Default 2.
+ *		0=comp0; 1=comp1; 2=comp2.
+ * [11:10] RW comp1_sel:  Select which component to be Cb or G: Default 1.
+ *		0=comp0; 1=comp1; 2=comp2.
+ *  [9: 8] RW comp0_sel:  Select which component to be Y  or R: Default 0.
+ *		0=comp0; 1=comp1; 2=comp2.
+ *     [7]    Reserved. Default 0.
+ *     [6] RW de_pol:  Default 0.
+ *		If DE input is active low, set to 1 to invert to active high.
+ *     [5] RW hsync_pol: Default 0.
+ *		If HS input is active low, set to 1 to invert to active high.
+ *     [4] RW vsync_pol: Default 0.
+ *		If VS input is active low, set to 1 to invert to active high.
+ *     [3] RW dpicolorm: Signal to IP.   Default 0.
+ *     [2] RW dpishutdn: Signal to IP.   Default 0.
+ *     [1]    Reserved.  Default 0.
+ *     [0]    Reserved.  Default 0.
+ */
+#define MIPI_DSI_TOP_CNTL                          0x3c8
+
+/* VENC data width */
+#define VENC_IN_COLOR_30B   0x0
+#define VENC_IN_COLOR_24B   0x1
+#define VENC_IN_COLOR_18B   0x2
+#define VENC_IN_COLOR_16B   0x3
+
+/* DPI pixel format */
+#define DPI_COLOR_16BIT_CFG_1		0
+#define DPI_COLOR_16BIT_CFG_2		1
+#define DPI_COLOR_16BIT_CFG_3		2
+#define DPI_COLOR_18BIT_CFG_1		3
+#define DPI_COLOR_18BIT_CFG_2		4
+#define DPI_COLOR_24BIT			5
+#define DPI_COLOR_20BIT_YCBCR_422	6
+#define DPI_COLOR_24BIT_YCBCR_422	7
+#define DPI_COLOR_16BIT_YCBCR_422	8
+#define DPI_COLOR_30BIT			9
+#define DPI_COLOR_36BIT			10
+#define DPI_COLOR_12BIT_YCBCR_420	11
+
+#define MIPI_DSI_TOP_DPI_COLOR_MODE	GENMASK(23, 20)
+#define MIPI_DSI_TOP_IN_COLOR_MODE	GENMASK(18, 16)
+#define MIPI_DSI_TOP_CHROMA_SUBSAMPLE	GENMASK(15, 14)
+#define MIPI_DSI_TOP_COMP2_SEL		GENMASK(13, 12)
+#define MIPI_DSI_TOP_COMP1_SEL		GENMASK(11, 10)
+#define MIPI_DSI_TOP_COMP0_SEL		GENMASK(9, 8)
+#define MIPI_DSI_TOP_DE_INVERT		BIT(6)
+#define MIPI_DSI_TOP_HSYNC_INVERT	BIT(5)
+#define MIPI_DSI_TOP_VSYNC_INVERT	BIT(4)
+#define MIPI_DSI_TOP_DPICOLORM		BIT(3)
+#define MIPI_DSI_TOP_DPISHUTDN		BIT(2)
+
+#define MIPI_DSI_TOP_SUSPEND_CNTL                  0x3cc
+#define MIPI_DSI_TOP_SUSPEND_LINE                  0x3d0
+#define MIPI_DSI_TOP_SUSPEND_PIX                   0x3d4
+#define MIPI_DSI_TOP_MEAS_CNTL                     0x3d8
+/* [0] R  stat_edpihalt:  edpihalt signal from IP.    Default 0. */
+#define MIPI_DSI_TOP_STAT                          0x3dc
+#define MIPI_DSI_TOP_MEAS_STAT_TE0                 0x3e0
+#define MIPI_DSI_TOP_MEAS_STAT_TE1                 0x3e4
+#define MIPI_DSI_TOP_MEAS_STAT_VS0                 0x3e8
+#define MIPI_DSI_TOP_MEAS_STAT_VS1                 0x3ec
+/* [31:16] RW intr_stat/clr. Default 0.
+ *		For each bit, read as this interrupt level status,
+ *		write 1 to clear.
+ * [31:22] Reserved
+ * [   21] stat/clr of eof interrupt
+ * [   21] vde_fall interrupt
+ * [   19] stat/clr of de_rise interrupt
+ * [   18] stat/clr of vs_fall interrupt
+ * [   17] stat/clr of vs_rise interrupt
+ * [   16] stat/clr of dwc_edpite interrupt
+ * [15: 0] RW intr_enable. Default 0.
+ *		For each bit, 1=enable this interrupt, 0=disable.
+ *	[15: 6] Reserved
+ *	[    5] eof interrupt
+ *	[    4] de_fall interrupt
+ *	[    3] de_rise interrupt
+ *	[    2] vs_fall interrupt
+ *	[    1] vs_rise interrupt
+ *	[    0] dwc_edpite interrupt
+ */
+#define MIPI_DSI_TOP_INTR_CNTL_STAT                0x3f0
+// 31: 2    Reserved.   Default 0.
+//  1: 0 RW mem_pd.     Default 3.
+#define MIPI_DSI_TOP_MEM_PD                        0x3f4
+
+#endif /* __MESON_DW_MIPI_DSI_H */
-- 
2.25.1

