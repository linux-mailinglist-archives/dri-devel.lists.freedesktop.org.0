Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC129309BA4
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 12:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7526E0C2;
	Sun, 31 Jan 2021 11:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159B16E09A
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 18:10:26 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DSj1D58vYz1qs1D;
 Sat, 30 Jan 2021 19:10:24 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DSj1D4CW0z1tYTW;
 Sat, 30 Jan 2021 19:10:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id uganKxIeFcMl; Sat, 30 Jan 2021 19:10:22 +0100 (CET)
X-Auth-Info: C07Fu5GlUXbkmlKX+j3cKhzp8+0P2sQsKLqKdZdTpQA=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 30 Jan 2021 19:10:22 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 driver
Date: Sat, 30 Jan 2021 19:10:14 +0100
Message-Id: <20210130181014.161457-2-marex@denx.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210130181014.161457-1-marex@denx.de>
References: <20210130181014.161457-1-marex@denx.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 31 Jan 2021 11:43:06 +0000
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
Cc: Marek Vasut <marex@denx.de>, Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add driver for TI SN65DSI83 Single-Channel DSI to Single-Link LVDS bridge.
The driver operates the chip over I2C bus. Currently the LVDS clock are
always derived from DSI clock lane, which is the usual mode of operation,
support for clock from external oscillator is not implemented, but it is
easy to add if ever needed. Only RGB888 pixel format is implemented, the
LVDS666 is not supported, but could be added if needed.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Philippe Schenker <philippe.schenker@toradex.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Valentin Raevsky <valentin@compulab.co.il>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/Kconfig        |  10 +
 drivers/gpu/drm/bridge/Makefile       |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 535 ++++++++++++++++++++++++++
 3 files changed, 546 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/ti-sn65dsi83.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index cc401786962a..5e4f674e3fdb 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -234,6 +234,16 @@ config DRM_TI_TFP410
 	help
 	  Texas Instruments TFP410 DVI/HDMI Transmitter driver
 
+config DRM_TI_SN65DSI83
+	tristate "TI SN65DSI83 DSI to LVDS bridge"
+	depends on OF
+	select DRM_KMS_HELPER
+	select REGMAP_I2C
+	select DRM_PANEL
+	select DRM_MIPI_DSI
+	help
+	  Texas Instruments SN65DSI83 DSI to LVDS Bridge driver
+
 config DRM_TI_SN65DSI86
 	tristate "TI SN65DSI86 DSI to eDP bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 21ea8fe09992..e11415db0a31 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_DRM_TOSHIBA_TC358767) += tc358767.o
 obj-$(CONFIG_DRM_TOSHIBA_TC358768) += tc358768.o
 obj-$(CONFIG_DRM_TOSHIBA_TC358775) += tc358775.o
 obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511/
+obj-$(CONFIG_DRM_TI_SN65DSI83) += ti-sn65dsi83.o
 obj-$(CONFIG_DRM_TI_SN65DSI86) += ti-sn65dsi86.o
 obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
 obj-$(CONFIG_DRM_TI_TPD12S015) += ti-tpd12s015.o
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
new file mode 100644
index 000000000000..79c023ba3dce
--- /dev/null
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -0,0 +1,535 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Marek Vasut <marex@denx.de>
+ *
+ * Based on previous work of:
+ * Valentin Raevsky <valentin@compulab.co.il>
+ * Philippe Schenker <philippe.schenker@toradex.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_graph.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+
+/* ID registers */
+#define REG_ID(n)				(0x00 + (n))
+/* Reset and clock registers */
+#define REG_RC_RESET				0x09
+#define  REG_RC_RESET_SOFT_RESET		BIT(0)
+#define REG_RC_LVDS_PLL				0x0a
+#define  REG_RC_LVDS_PLL_PLL_EN_STAT		BIT(7)
+#define  REG_RC_LVDS_PLL_LVDS_CLK_RANGE(n)	(((n) & 0x7) << 1)
+#define  REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY	BIT(0)
+#define REG_RC_DSI_CLK				0x0b
+#define  REG_RC_DSI_CLK_DSI_CLK_DIVIDER(n)	(((n) & 0x1f) << 3)
+#define  REG_RC_DSI_CLK_REFCLK_MULTIPLIER(n)	((n) & 0x3)
+#define REG_RC_PLL_EN				0x0d
+#define  REG_RC_PLL_EN_PLL_EN			BIT(0)
+/* DSI registers */
+#define REG_DSI_LANE				0x10
+#define  REG_DSI_LANE_RESERVED			BIT(5)
+#define  REG_DSI_LANE_CHA_DSI_LANES(n)		(((n) & 0x3) << 3)
+#define  REG_DSI_LANE_SOT_ERR_TOL_DIS		BIT(0)
+#define REG_DSI_EQ				0x11
+#define  REG_DSI_EQ_CHA_DSI_DATA_EQ(n)		(((n) & 0x3) << 6)
+#define  REG_DSI_EQ_CHA_DSI_CLK_EQ(n)		(((n) & 0x3) << 2)
+#define REG_DSI_CLK				0x12
+#define  REG_DSI_CLK_CHA_DSI_CLK_RANGE(n)	((n) & 0xff)
+/* LVDS registers */
+#define REG_LVDS_FMT				0x18
+#define  REG_LVDS_FMT_DE_NEG_POLARITY		BIT(7)
+#define  REG_LVDS_FMT_HS_NEG_POLARITY		BIT(6)
+#define  REG_LVDS_FMT_VS_NEG_POLARITY		BIT(5)
+#define  REG_LVDS_FMT_RESERVED			BIT(4)	/* Set to 1 */
+#define  REG_LVDS_FMT_CHA_24BPP_MODE		BIT(3)
+#define  REG_LVDS_FMT_CHA_24BPP_FORMAT1		BIT(1)
+#define REG_LVDS_VCOM				0x19
+#define  REG_LVDS_VCOM_CHA_LVDS_VOCM		BIT(6)
+#define  REG_LVDS_VCOM_CHA_LVDS_VOD_SWING(n)	(((n) & 0x3) << 2)
+#define REG_LVDS_LANE				0x1a
+#define  REG_LVDS_LANE_CHA_REVERSE_LVDS		BIT(5)
+#define  REG_LVDS_LANE_CHA_LVDS_TERM		BIT(1)
+#define REG_LVDS_CM				0x1b
+#define  REG_LVDS_CM_CHA_LVDS_CM_ADJUST(n)	((n) & 0x3)
+/* Video registers */
+#define REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW	0x20
+#define REG_VID_CHA_ACTIVE_LINE_LENGTH_HIGH	0x21
+#define REG_VID_CHA_VERTICAL_DISPLAY_SIZE_LOW	0x24
+#define REG_VID_CHA_VERTICAL_DISPLAY_SIZE_HIGH	0x25
+#define REG_VID_CHA_SYNC_DELAY_LOW		0x28
+#define REG_VID_CHA_SYNC_DELAY_HIGH		0x29
+#define REG_VID_CHA_HSYNC_PULSE_WIDTH_LOW	0x2c
+#define REG_VID_CHA_HSYNC_PULSE_WIDTH_HIGH	0x2d
+#define REG_VID_CHA_VSYNC_PULSE_WIDTH_LOW	0x30
+#define REG_VID_CHA_VSYNC_PULSE_WIDTH_HIGH	0x31
+#define REG_VID_CHA_HORIZONTAL_BACK_PORCH	0x34
+#define REG_VID_CHA_VERTICAL_BACK_PORCH		0x36
+#define REG_VID_CHA_HORIZONTAL_FRONT_PORCH	0x38
+#define REG_VID_CHA_VERTICAL_FRONT_PORCH	0x3a
+#define REG_VID_CHA_TEST_PATTERN		0x3c
+/* IRQ registers */
+#define REG_IRQ_GLOBAL				0xe0
+#define  REG_IRQ_GLOBAL_IRQ_EN			BIT(0)
+#define REG_IRQ_EN				0xe1
+#define  REG_IRQ_EN_CHA_SYNCH_ERR_EN		BIT(7)
+#define  REG_IRQ_EN_CHA_CRC_ERR_EN		BIT(6)
+#define  REG_IRQ_EN_CHA_UNC_ECC_ERR_EN		BIT(5)
+#define  REG_IRQ_EN_CHA_COR_ECC_ERR_EN		BIT(4)
+#define  REG_IRQ_EN_CHA_LLP_ERR_EN		BIT(3)
+#define  REG_IRQ_EN_CHA_SOT_BIT_ERR_EN		BIT(2)
+#define  REG_IRQ_EN_CHA_PLL_UNLOCK_EN		BIT(0)
+#define REG_IRQ_STAT				0xe5
+#define  REG_IRQ_STAT_CHA_SYNCH_ERR		BIT(7)
+#define  REG_IRQ_STAT_CHA_CRC_ERR		BIT(6)
+#define  REG_IRQ_STAT_CHA_UNC_ECC_ERR		BIT(5)
+#define  REG_IRQ_STAT_CHA_COR_ECC_ERR		BIT(4)
+#define  REG_IRQ_STAT_CHA_LLP_ERR		BIT(3)
+#define  REG_IRQ_STAT_CHA_SOT_BIT_ERR		BIT(2)
+#define  REG_IRQ_STAT_CHA_PLL_UNLOCK		BIT(0)
+
+struct sn65dsi83 {
+	struct drm_bridge		bridge;
+	struct drm_display_mode		mode;
+	struct device			*dev;
+	struct regmap			*regmap;
+	struct device_node		*host_node;
+	struct mipi_dsi_device		*dsi;
+	struct drm_bridge		*panel_bridge;
+	struct gpio_desc		*enable_gpio;
+	int				dsi_lanes;
+};
+
+static const struct regmap_range sn65dsi83_readable_ranges[] = {
+	regmap_reg_range(REG_ID(0), REG_ID(8)),
+	regmap_reg_range(REG_RC_LVDS_PLL, REG_RC_DSI_CLK),
+	regmap_reg_range(REG_RC_PLL_EN, REG_RC_PLL_EN),
+	regmap_reg_range(REG_DSI_LANE, REG_DSI_CLK),
+	regmap_reg_range(REG_LVDS_FMT, REG_LVDS_CM),
+	regmap_reg_range(REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW,
+			 REG_VID_CHA_ACTIVE_LINE_LENGTH_HIGH),
+	regmap_reg_range(REG_VID_CHA_VERTICAL_DISPLAY_SIZE_LOW,
+			 REG_VID_CHA_VERTICAL_DISPLAY_SIZE_HIGH),
+	regmap_reg_range(REG_VID_CHA_SYNC_DELAY_LOW,
+			 REG_VID_CHA_SYNC_DELAY_HIGH),
+	regmap_reg_range(REG_VID_CHA_HSYNC_PULSE_WIDTH_LOW,
+			 REG_VID_CHA_HSYNC_PULSE_WIDTH_HIGH),
+	regmap_reg_range(REG_VID_CHA_VSYNC_PULSE_WIDTH_LOW,
+			 REG_VID_CHA_VSYNC_PULSE_WIDTH_HIGH),
+	regmap_reg_range(REG_VID_CHA_HORIZONTAL_BACK_PORCH,
+			 REG_VID_CHA_HORIZONTAL_BACK_PORCH),
+	regmap_reg_range(REG_VID_CHA_VERTICAL_BACK_PORCH,
+			 REG_VID_CHA_VERTICAL_BACK_PORCH),
+	regmap_reg_range(REG_VID_CHA_HORIZONTAL_FRONT_PORCH,
+			 REG_VID_CHA_HORIZONTAL_FRONT_PORCH),
+	regmap_reg_range(REG_VID_CHA_VERTICAL_FRONT_PORCH,
+			 REG_VID_CHA_VERTICAL_FRONT_PORCH),
+	regmap_reg_range(REG_VID_CHA_TEST_PATTERN, REG_VID_CHA_TEST_PATTERN),
+	regmap_reg_range(REG_IRQ_GLOBAL, REG_IRQ_EN),
+	regmap_reg_range(REG_IRQ_STAT, REG_IRQ_STAT),
+};
+
+static const struct regmap_access_table sn65dsi83_readable_table = {
+	.yes_ranges = sn65dsi83_readable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(sn65dsi83_readable_ranges),
+};
+
+static const struct regmap_range sn65dsi83_writeable_ranges[] = {
+	regmap_reg_range(REG_RC_RESET, REG_RC_DSI_CLK),
+	regmap_reg_range(REG_RC_PLL_EN, REG_RC_PLL_EN),
+	regmap_reg_range(REG_DSI_LANE, REG_DSI_CLK),
+	regmap_reg_range(REG_LVDS_FMT, REG_LVDS_CM),
+	regmap_reg_range(REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW,
+			 REG_VID_CHA_ACTIVE_LINE_LENGTH_HIGH),
+	regmap_reg_range(REG_VID_CHA_VERTICAL_DISPLAY_SIZE_LOW,
+			 REG_VID_CHA_VERTICAL_DISPLAY_SIZE_HIGH),
+	regmap_reg_range(REG_VID_CHA_SYNC_DELAY_LOW,
+			 REG_VID_CHA_SYNC_DELAY_HIGH),
+	regmap_reg_range(REG_VID_CHA_HSYNC_PULSE_WIDTH_LOW,
+			 REG_VID_CHA_HSYNC_PULSE_WIDTH_HIGH),
+	regmap_reg_range(REG_VID_CHA_VSYNC_PULSE_WIDTH_LOW,
+			 REG_VID_CHA_VSYNC_PULSE_WIDTH_HIGH),
+	regmap_reg_range(REG_VID_CHA_HORIZONTAL_BACK_PORCH,
+			 REG_VID_CHA_HORIZONTAL_BACK_PORCH),
+	regmap_reg_range(REG_VID_CHA_VERTICAL_BACK_PORCH,
+			 REG_VID_CHA_VERTICAL_BACK_PORCH),
+	regmap_reg_range(REG_VID_CHA_HORIZONTAL_FRONT_PORCH,
+			 REG_VID_CHA_HORIZONTAL_FRONT_PORCH),
+	regmap_reg_range(REG_VID_CHA_VERTICAL_FRONT_PORCH,
+			 REG_VID_CHA_VERTICAL_FRONT_PORCH),
+	regmap_reg_range(REG_VID_CHA_TEST_PATTERN, REG_VID_CHA_TEST_PATTERN),
+	regmap_reg_range(REG_IRQ_GLOBAL, REG_IRQ_EN),
+	regmap_reg_range(REG_IRQ_STAT, REG_IRQ_STAT),
+};
+
+static const struct regmap_access_table sn65dsi83_writeable_table = {
+	.yes_ranges = sn65dsi83_writeable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(sn65dsi83_writeable_ranges),
+};
+
+static const struct regmap_range sn65dsi83_volatile_ranges[] = {
+	regmap_reg_range(REG_RC_LVDS_PLL, REG_RC_LVDS_PLL),
+	regmap_reg_range(REG_IRQ_STAT, REG_IRQ_STAT),
+};
+
+static const struct regmap_access_table sn65dsi83_volatile_table = {
+	.yes_ranges = sn65dsi83_volatile_ranges,
+	.n_yes_ranges = ARRAY_SIZE(sn65dsi83_volatile_ranges),
+};
+
+static const struct regmap_config sn65dsi83_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.rd_table = &sn65dsi83_readable_table,
+	.wr_table = &sn65dsi83_writeable_table,
+	.volatile_table = &sn65dsi83_volatile_table,
+	.cache_type = REGCACHE_RBTREE,
+	.max_register = REG_IRQ_STAT,
+};
+
+static struct sn65dsi83 *bridge_to_sn65dsi83(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct sn65dsi83, bridge);
+}
+
+static int sn65dsi83_attach(struct drm_bridge *bridge,
+			    enum drm_bridge_attach_flags flags)
+{
+	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
+	struct device *dev = ctx->dev;
+	struct mipi_dsi_device *dsi;
+	struct mipi_dsi_host *host;
+	int ret = 0;
+
+	const struct mipi_dsi_device_info info = {
+		.type = "sn65dsi83",
+		.channel = 0,
+		.node = NULL,
+	};
+
+	host = of_find_mipi_dsi_host_by_node(ctx->host_node);
+	if (!host) {
+		dev_err(dev, "failed to find dsi host\n");
+		return -EPROBE_DEFER;
+	}
+
+	dsi = mipi_dsi_device_register_full(host, &info);
+	if (IS_ERR(dsi)) {
+		ret = PTR_ERR(dsi);
+		dev_err(dev, "failed to create dsi device, ret=%i\n", ret);
+		goto err_dsi_device;
+	}
+
+	ctx->dsi = dsi;
+
+	dsi->lanes = ctx->dsi_lanes;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(dev, "failed to attach dsi to host\n");
+		goto err_dsi_attach;
+	}
+
+	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
+				 &ctx->bridge, flags);
+
+err_dsi_attach:
+	mipi_dsi_device_unregister(dsi);
+err_dsi_device:
+	return ret;
+}
+
+static void sn65dsi83_pre_enable(struct drm_bridge *bridge)
+{
+	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
+
+	/*
+	 * Reset the chip, pull EN line low for t_reset=10ms,
+	 * then high for t_en=1ms.
+	 */
+	gpiod_set_value(ctx->enable_gpio, 0);
+	usleep_range(10000, 11000);
+	gpiod_set_value(ctx->enable_gpio, 1);
+	usleep_range(1000, 1100);
+}
+
+static u8 sn65dsi83_get_lvds_range(struct sn65dsi83 *ctx)
+{
+	/*
+	 * The encoding of the LVDS_CLK_RANGE is as follows:
+	 * 000 - 25 MHz <= LVDS_CLK < 37.5 MHz
+	 * 001 - 37.5 MHz <= LVDS_CLK < 62.5 MHz
+	 * 010 - 62.5 MHz <= LVDS_CLK < 87.5 MHz
+	 * 011 - 87.5 MHz <= LVDS_CLK < 112.5 MHz
+	 * 100 - 112.5 MHz <= LVDS_CLK < 137.5 MHz
+	 * 101 - 137.5 MHz <= LVDS_CLK <= 154 MHz
+	 * which is a range of 12.5MHz..162.5MHz in 50MHz steps, except that
+	 * the ends of the ranges are clamped to the supported range. Since
+	 * sn65dsi83_mode_valid() already filters the valid modes and limits
+	 * the clock to 25..154 MHz, the range calculation can be simplified
+	 * as follows:
+	 */
+	return (ctx->mode.clock - 12500) / 25000;
+}
+
+static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx)
+{
+	/*
+	 * The encoding of the CHA_DSI_CLK_RANGE is as follows:
+	 * 0x00 through 0x07 - Reserved
+	 * 0x08 - 40 <= DSI_CLK < 45 MHz
+	 * 0x09 - 45 <= DSI_CLK < 50 MHz
+	 * ...
+	 * 0x63 - 495 <= DSI_CLK < 500 MHz
+	 * 0x64 - 500 MHz
+	 * 0x65 through 0xFF - Reserved
+	 * which is DSI clock in 5 MHz steps, clamped to 40..500 MHz.
+	 * The DSI clock are calculated as:
+	 *  DSI_CLK = mode clock * bpp / dsi_data_lanes / 2
+	 * the 2 is there because the bus is DDR.
+	 */
+	return clamp((unsigned int)ctx->mode.clock *
+		     mipi_dsi_pixel_format_to_bpp(ctx->dsi->format) /
+		     ctx->dsi_lanes / 2, 40000U, 500000U) / 5000U;
+}
+
+static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx)
+{
+	/* The divider is (DSI_CLK / LVDS_CLK) - 1, which really is: */
+	return (mipi_dsi_pixel_format_to_bpp(ctx->dsi->format) /
+		ctx->dsi_lanes / 2) - 1;
+}
+
+static void sn65dsi83_enable(struct drm_bridge *bridge)
+{
+	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
+	u16 val;
+
+	/* Clear reset, disable PLL */
+	regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
+	regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
+
+	/* Reference clock derived from DSI link clock. */
+	regmap_write(ctx->regmap, REG_RC_LVDS_PLL,
+		REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx)) |
+		REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
+	regmap_write(ctx->regmap, REG_DSI_CLK,
+		REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx)));
+	regmap_write(ctx->regmap, REG_RC_DSI_CLK,
+		REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
+
+	/* Set number of DSI lanes, keep reserved bits. */
+	regmap_write(ctx->regmap, REG_DSI_LANE,
+		REG_DSI_LANE_RESERVED |
+		REG_DSI_LANE_CHA_DSI_LANES(~(ctx->dsi_lanes - 1)));
+	/* No equalization. */
+	regmap_write(ctx->regmap, REG_DSI_EQ, 0x00);
+
+	/* RGB888 is the only format supported so far. */
+	regmap_write(ctx->regmap, REG_LVDS_FMT,
+		(ctx->mode.flags & DRM_MODE_FLAG_NHSYNC ?
+		 REG_LVDS_FMT_HS_NEG_POLARITY : 0) |
+		(ctx->mode.flags & DRM_MODE_FLAG_NVSYNC ?
+		 REG_LVDS_FMT_VS_NEG_POLARITY : 0) |
+		REG_LVDS_FMT_RESERVED |
+		REG_LVDS_FMT_CHA_24BPP_MODE);
+	regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x00);
+	regmap_write(ctx->regmap, REG_LVDS_LANE, REG_LVDS_LANE_CHA_LVDS_TERM);
+	regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
+
+	regmap_bulk_write(ctx->regmap, REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW,
+			  &ctx->mode.hdisplay, 2);
+	regmap_bulk_write(ctx->regmap, REG_VID_CHA_VERTICAL_DISPLAY_SIZE_LOW,
+			  &ctx->mode.vdisplay, 2);
+	val = 32 + 1;	/* 32 + 1 pixel clock to ensure proper operation */
+	regmap_bulk_write(ctx->regmap, REG_VID_CHA_SYNC_DELAY_LOW, &val, 2);
+	val = ctx->mode.hsync_end - ctx->mode.hsync_start;
+	regmap_bulk_write(ctx->regmap, REG_VID_CHA_HSYNC_PULSE_WIDTH_LOW,
+			  &val, 2);
+	val = ctx->mode.vsync_end - ctx->mode.vsync_start;
+	regmap_bulk_write(ctx->regmap, REG_VID_CHA_VSYNC_PULSE_WIDTH_LOW,
+			  &val, 2);
+	regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_BACK_PORCH,
+		     ctx->mode.htotal - ctx->mode.hsync_end);
+	regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_BACK_PORCH,
+		     ctx->mode.vtotal - ctx->mode.vsync_end);
+	regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_FRONT_PORCH,
+		     ctx->mode.hsync_start - ctx->mode.hdisplay);
+	regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_FRONT_PORCH,
+		     ctx->mode.vsync_start - ctx->mode.vdisplay);
+	regmap_write(ctx->regmap, REG_VID_CHA_TEST_PATTERN, 0x00);
+
+	/* Enable PLL */
+	regmap_write(ctx->regmap, REG_RC_PLL_EN, REG_RC_PLL_EN_PLL_EN);
+	/* Trigger reset after CSR register update. */
+	regmap_write(ctx->regmap, REG_RC_RESET, REG_RC_RESET_SOFT_RESET);
+}
+
+static void sn65dsi83_disable(struct drm_bridge *bridge)
+{
+	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
+
+	/* Clear reset, disable PLL */
+	regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
+	regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
+}
+
+static void sn65dsi83_post_disable(struct drm_bridge *bridge)
+{
+	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
+
+	/* Put the chip in reset, pull EN line low. */
+	gpiod_set_value(ctx->enable_gpio, 0);
+}
+
+static enum drm_mode_status
+sn65dsi83_mode_valid(struct drm_bridge *bridge,
+		     const struct drm_display_info *info,
+		     const struct drm_display_mode *mode)
+{
+	/* LVDS output clock range 25..154 MHz */
+	if (mode->clock < 25000)
+		return MODE_CLOCK_LOW;
+	if (mode->clock > 154000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static void sn65dsi83_mode_set(struct drm_bridge *bridge,
+			       const struct drm_display_mode *mode,
+			       const struct drm_display_mode *adj)
+{
+	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
+
+	ctx->mode = *mode;
+}
+
+static const struct drm_bridge_funcs sn65dsi83_funcs = {
+	.attach		= sn65dsi83_attach,
+	.pre_enable	= sn65dsi83_pre_enable,
+	.enable		= sn65dsi83_enable,
+	.disable	= sn65dsi83_disable,
+	.post_disable	= sn65dsi83_post_disable,
+	.mode_valid	= sn65dsi83_mode_valid,
+	.mode_set	= sn65dsi83_mode_set,
+};
+
+static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx)
+{
+	struct drm_bridge *panel_bridge;
+	struct device *dev = ctx->dev;
+	struct device_node *endpoint;
+	struct drm_panel *panel;
+	int ret;
+
+	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
+	ctx->dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	ctx->host_node = of_graph_get_remote_port_parent(endpoint);
+	of_node_put(endpoint);
+	of_node_put(ctx->host_node);
+
+	if (ctx->dsi_lanes < 0 || ctx->dsi_lanes > 4)
+		return -EINVAL;
+	if (!ctx->host_node)
+		return -ENODEV;
+
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, &panel_bridge);
+	if (ret < 0)
+		return ret;
+	if (panel) {
+		panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+		if (IS_ERR(panel_bridge))
+			return PTR_ERR(panel_bridge);
+	}
+
+	ctx->panel_bridge = panel_bridge;
+
+	return 0;
+}
+
+static int sn65dsi83_probe(struct i2c_client *client,
+			   const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct sn65dsi83 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->dev = dev;
+
+	ctx->enable_gpio = devm_gpiod_get(ctx->dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->enable_gpio))
+		return PTR_ERR(ctx->enable_gpio);
+
+	ret = sn65dsi83_parse_dt(ctx);
+	if (ret)
+		return ret;
+
+	ctx->regmap = devm_regmap_init_i2c(client, &sn65dsi83_regmap_config);
+	if (IS_ERR(ctx->regmap))
+		return PTR_ERR(ctx->regmap);
+
+	dev_set_drvdata(dev, ctx);
+	i2c_set_clientdata(client, ctx);
+
+	ctx->bridge.funcs = &sn65dsi83_funcs;
+	ctx->bridge.of_node = dev->of_node;
+	drm_bridge_add(&ctx->bridge);
+
+	return 0;
+}
+
+static int sn65dsi83_remove(struct i2c_client *client)
+{
+	struct sn65dsi83 *ctx = i2c_get_clientdata(client);
+
+	mipi_dsi_detach(ctx->dsi);
+	mipi_dsi_device_unregister(ctx->dsi);
+	drm_bridge_remove(&ctx->bridge);
+
+	return 0;
+}
+
+static struct i2c_device_id sn65dsi83_id[] = {
+	{ "ti,sn65dsi83", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, sn65dsi83_id);
+
+static const struct of_device_id sn65dsi83_match_table[] = {
+	{ .compatible = "ti,sn65dsi83" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, sn65dsi83_match_table);
+
+static struct i2c_driver sn65dsi83_driver = {
+	.probe = sn65dsi83_probe,
+	.remove = sn65dsi83_remove,
+	.id_table = sn65dsi83_id,
+	.driver = {
+		.name = "sn65dsi83",
+		.of_match_table = sn65dsi83_match_table,
+	},
+};
+module_i2c_driver(sn65dsi83_driver);
+
+MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
+MODULE_DESCRIPTION("TI SN65DSI83 DSI to LVDS bridge driver");
+MODULE_LICENSE("GPL v2");
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
