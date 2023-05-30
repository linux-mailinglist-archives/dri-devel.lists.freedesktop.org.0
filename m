Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35869715708
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 09:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB04710E35B;
	Tue, 30 May 2023 07:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE20B10E358
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 07:38:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-30ad8f33f1aso2493351f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 00:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685432308; x=1688024308;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yMsSn3PxeghPJ4vFjHKvDZOF1432jaj9kLPy4oiu4OI=;
 b=DWl8a0FY5O98004Aj5vJ8jCh9gXLO6LsVqfHHsstZDs8dwLPalgUS5NpOTBkyfi/hd
 yQoHfBWAIECoPmmeANFK3aIfUa2/P3Ma1T6rUPBTvm+qjaGnehMp7piEWESRy5OXnuYO
 5jexfdU3NtIFDtrh3OplfZ0+AcqWiJid8E/GxTLDvQhC8x/pLTG3x8WbqcXn8qurgHKb
 kf8ViFr4d0OcvOBFsKVkouUrC3tZnolXJLHFml84mib1EEF0EpNN+33eplvJqYzbiRjZ
 eetHeKO+Ub/b1Lkcq+P+lPTVEC74dDQykh2RViftjw4L6yRR9KPIhF40Pbn/2kpa0gcN
 1GVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685432308; x=1688024308;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yMsSn3PxeghPJ4vFjHKvDZOF1432jaj9kLPy4oiu4OI=;
 b=XREy7UVbQiagdjPgqs0+EM4iMVk8CP5ojNNJ4L9/Fr9qorNT+upaE+SuPnHGM9in2z
 Iz3z/eqTMj+iMl5JqH95fpTz/Q5sKKr3IWegbkTlgTGR3knCWfZE+GZVfEOTizm4eTDq
 eR93XsA+VtxIPEZ8n2qrQRFDBqnv0AL/APIklqHPDLpA7JWUkYc1h8qxTdB/a6qk2uIC
 2IubuBweiolPzZbNIaWm7v6stKjs6Ta7Jy8q3Il92+6HIjnrew+19BMMB9CrdS7fAe6c
 oPX7zovrezYAxFlMAInrZ7sJ0Y9lhPBOqjSHvsOO1UvVElrf+oYk5+1aaUt4nDvrKcam
 Dslw==
X-Gm-Message-State: AC+VfDxO5X1zu7BpaH67BIejv47aiw4a8L4a6zJCa+VHvQxqCP1rboUQ
 cd8HFO/wcXsZk+YzQIaG8/r8Ew==
X-Google-Smtp-Source: ACHHUZ4EtrnIGuC/Dxx8K85WB3LqU4c4OiIgmx0C5nEFPN8WG4nDDhO5W/EjWNaX1TyDE/eeJeKicg==
X-Received: by 2002:adf:eecc:0:b0:30a:e465:5b29 with SMTP id
 a12-20020adfeecc000000b0030ae4655b29mr768094wrp.57.1685432307734; 
 Tue, 30 May 2023 00:38:27 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 00:38:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 30 May 2023 09:38:13 +0200
Subject: [PATCH v5 12/17] drm/meson: add support for MIPI-DSI transceiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-12-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=19297;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vdNged+bT879opvCVPv6gCiacGfP+EnbSlkc5Uackdg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdafiIkw9gKoaNh108AEtzF2eG4nQrk5QZ25klcNz
 aoxua/aJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn4gAKCRB33NvayMhJ0eQKD/
 9gAts/+rd7NIeBPNj1L6CiWSRU8DVHN75lhmUl4NR11ctuHHc5d2OeckKK49KuhVXfECOZW9f87Qj3
 o6heThKy6y/WboNt03Es3aDEps85ou6hkGg/jAPL2A0R2ifteNyS614qEhVjsL+1qx+r6QEi5XfrN8
 z3WHZMxFI5J+qinxR8IUuewJTxJmeg9K/onJS6zeN42xM2cAVp5q2HIKebAZpkhOe/0S1oAw6KmbMG
 tXwjrH0igxK7iPf5ZuoAp5LYKL6auAmzGDObL96s1t2FIMkct7BuEAUccV1Il9G/Kdc2wCgZYrLs6Z
 AtyGzjvVuWw224xEl28vCq0GK4FOHKurHT5wUXg3XFZcSbjy89F1SDQmwbtsTvfjtdiL9WLKV2MDZs
 qc9u2/yaO064xE5H2lpbn7y7QUtI9NvLBNTjQSVxsszVVOeq1t1j3z50O23sqxQPPIidp59iNug/sz
 8spTyNn1CB3QmMRyaPH+HaxxFfZiZGwZadPoV50bjqvgDfmv9GSA6+0XI4LkFKPCtfagc/P9+UL7+e
 0zBO1YHVg4z6zAQvJDXuvlBe4zFTBJh6rSqTHenbS/8Je9T/cZBlvFFHdMFC4f426qFgyXjE2j2XuK
 Eje8R/7+zrxqfZKsNB/b+suRIzvNB/R8MK4nxjf/6q896vvcvUHilBCvY4PQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicolas Belin <nbelin@baylibre.com>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, "Lukas F. Hartmann" <lukas@mntre.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Amlogic G12A/G12B/SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver
(ver 1.21a), with a custom glue managing the IP resets, clock and data
inputs similar to the DW-HDMI Glue on other Amlogic SoCs.

This adds support for the Glue managing the transceiver, mimicing the init
flow provided by Amlogic to setup the ENCL encoder, the glue, the transceiver,
the digital D-PHY and the Analog PHY in the proper way.

An optional "MEAS" clock can be enabled to measure the delay between each
vsync feeding the DW-MIPI-DSI transceiver.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/meson/Kconfig             |   7 +
 drivers/gpu/drm/meson/Makefile            |   1 +
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 352 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h | 160 ++++++++++++++
 4 files changed, 520 insertions(+)

diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
index 823909da87db..615fdd0ce41b 100644
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
index 000000000000..dd505ac37976
--- /dev/null
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -0,0 +1,352 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
+ */
+
+#include <linux/clk.h>
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
+	struct clk *bit_clk;
+	struct clk *px_clk;
+	struct reset_control *top_rst;
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
+	/* Set the bit clock rate to hs_clk_rate */
+	ret = clk_set_rate(mipi_dsi->bit_clk,
+			   mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate);
+	if (ret) {
+		dev_err(mipi_dsi->dev, "Failed to set DSI Bit clock rate %lu (ret %d)\n",
+			mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate, ret);
+		return ret;
+	}
+
+	/* Make sure the rate of the bit clock is not modified by someone else */
+	ret = clk_rate_exclusive_get(mipi_dsi->bit_clk);
+	if (ret) {
+		dev_err(mipi_dsi->dev,
+			"Failed to set the exclusivity on the bit clock rate (ret %d)\n", ret);
+		return ret;
+	}
+
+	ret = clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 1000);
+
+	if (ret) {
+		dev_err(mipi_dsi->dev, "Failed to set DSI Pixel clock rate %u (%d)\n",
+			mipi_dsi->mode->clock * 1000, ret);
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
+		       FIELD_PREP(MIPI_DSI_TOP_COMP0_SEL, 0),
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
+
+	/* Remove the exclusivity on the bit clock rate */
+	clk_rate_exclusive_put(mipi_dsi->bit_clk);
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
+	*lane_mbps = DIV_ROUND_UP(mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate, USEC_PER_SEC);
+
+	return 0;
+}
+
+static int
+dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
+			   struct dw_mipi_dsi_dphy_timing *timing)
+{
+	struct meson_dw_mipi_dsi *mipi_dsi = priv_data;
+
+	switch (mipi_dsi->mode->hdisplay) {
+	case 240:
+	case 768:
+	case 1920:
+	case 2560:
+		timing->clk_lp2hs = 23;
+		timing->clk_hs2lp = 38;
+		timing->data_lp2hs = 15;
+		timing->data_hs2lp = 9;
+		break;
+
+	default:
+		timing->clk_lp2hs = 37;
+		timing->clk_hs2lp = 135;
+		timing->data_lp2hs = 50;
+		timing->data_hs2lp = 3;
+	}
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
+static int meson_dw_mipi_dsi_host_attach(void *priv_data,
+					 struct mipi_dsi_device *device)
+{
+	struct meson_dw_mipi_dsi *mipi_dsi = priv_data;
+	int ret;
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
+	ret = phy_init(mipi_dsi->phy);
+	if (ret)
+		return ret;
+
+	meson_dw_mipi_dsi_hw_init(mipi_dsi);
+
+	return 0;
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
+	struct device *dev = &pdev->dev;
+
+	mipi_dsi = devm_kzalloc(dev, sizeof(*mipi_dsi), GFP_KERNEL);
+	if (!mipi_dsi)
+		return -ENOMEM;
+
+	mipi_dsi->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mipi_dsi->base))
+		return PTR_ERR(mipi_dsi->base);
+
+	mipi_dsi->phy = devm_phy_get(dev, "dphy");
+	if (IS_ERR(mipi_dsi->phy))
+		return dev_err_probe(dev, PTR_ERR(mipi_dsi->phy),
+				     "failed to get mipi dphy\n");
+
+	mipi_dsi->bit_clk = devm_clk_get_enabled(dev, "bit");
+	if (IS_ERR(mipi_dsi->bit_clk)) {
+		int ret = PTR_ERR(mipi_dsi->bit_clk);
+
+		/* TOFIX GP0 on some platforms fails to lock in early boot, defer probe */
+		if (ret == -EIO)
+			ret = -EPROBE_DEFER;
+
+		return dev_err_probe(dev, ret, "Unable to get enabled bit_clk\n");
+	}
+
+	mipi_dsi->px_clk = devm_clk_get_enabled(dev, "px");
+	if (IS_ERR(mipi_dsi->px_clk))
+		return dev_err_probe(dev, PTR_ERR(mipi_dsi->px_clk),
+				     "Unable to get enabled px_clk\n");
+
+	/*
+	 * We use a TOP reset signal because the APB reset signal
+	 * is handled by the TOP control registers.
+	 */
+	mipi_dsi->top_rst = devm_reset_control_get_exclusive(dev, "top");
+	if (IS_ERR(mipi_dsi->top_rst))
+		return dev_err_probe(dev, PTR_ERR(mipi_dsi->top_rst),
+				     "Unable to get reset control\n");
+
+	reset_control_assert(mipi_dsi->top_rst);
+	usleep_range(10, 20);
+	reset_control_deassert(mipi_dsi->top_rst);
+
+	/* MIPI DSI Controller */
+
+	mipi_dsi->dev = dev;
+	mipi_dsi->pdata.base = mipi_dsi->base;
+	mipi_dsi->pdata.max_data_lanes = 4;
+	mipi_dsi->pdata.phy_ops = &meson_dw_mipi_dsi_phy_ops;
+	mipi_dsi->pdata.host_ops = &meson_dw_mipi_dsi_host_ops;
+	mipi_dsi->pdata.priv_data = mipi_dsi;
+	platform_set_drvdata(pdev, mipi_dsi);
+
+	mipi_dsi->dmd = dw_mipi_dsi_probe(pdev, &mipi_dsi->pdata);
+	if (IS_ERR(mipi_dsi->dmd))
+		return dev_err_probe(dev, PTR_ERR(mipi_dsi->dmd),
+				     "Failed to probe dw_mipi_dsi\n");
+
+	return 0;
+}
+
+static int meson_dw_mipi_dsi_remove(struct platform_device *pdev)
+{
+	struct meson_dw_mipi_dsi *mipi_dsi = platform_get_drvdata(pdev);
+
+	dw_mipi_dsi_remove(mipi_dsi->dmd);
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
2.34.1

