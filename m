Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E46C1292B7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E106E1A5;
	Mon, 23 Dec 2019 08:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shell.v3.sk (unknown [167.172.186.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2D56EBE7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 07:56:45 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 0B7A9DFCB5;
 Fri, 20 Dec 2019 07:49:26 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id L6py84SH2mC5; Fri, 20 Dec 2019 07:49:22 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 4285DDFCB4;
 Fri, 20 Dec 2019 07:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id RLYw9Uolp3jF; Fri, 20 Dec 2019 07:49:21 +0000 (UTC)
Received: from furthur.lan (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 3670DDFCB2;
 Fri, 20 Dec 2019 07:49:21 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/3] drm/bridge: chrontel-ch7033: Add a new driver
Date: Fri, 20 Dec 2019 08:49:14 +0100
Message-Id: <20191220074914.249281-4-lkundrak@v3.sk>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191220074914.249281-1-lkundrak@v3.sk>
References: <20191220074914.249281-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a driver for video encoder with VGA and DVI/HDMI outputs.

There is no documentation for the chip -- the operation was guessed from
what was sniffed on a Dell Wyse 3020 ThinOS terminal, the register names
come from the ch7035 driver in Mediatek's GPL code dump.

Only bare minimum is implemented -- no fancy stuff, such as scaling. That
would only worsen our misery. We don't load the firmware and we don't need
to even bother enabling the MCU.  There are probably no distributable
firmware images anyway.

Just like the tda998x driver, this one uses the component framework and
adds an encoder on component bind, so that it works with the Armada DRM
driver.

Tested with a handful of monitors ranging from 1024x768@75 to 1400x1050@60,
with VGA as well as DVI.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/gpu/drm/bridge/Kconfig           |  10 +
 drivers/gpu/drm/bridge/Makefile          |   1 +
 drivers/gpu/drm/bridge/chrontel-ch7033.c | 722 +++++++++++++++++++++++
 3 files changed, 733 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/chrontel-ch7033.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 34362976cd6fd..9456ea968c5b7 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -37,6 +37,16 @@ config DRM_CDNS_DSI
 	  Support Cadence DPI to DSI bridge. This is an internal
 	  bridge and is meant to be directly embedded in a SoC.
 
+config DRM_CHRONTEL_CH7033
+	tristate "Chrontel CH7033 Video Encoder"
+	depends on OF
+	select DRM_KMS_HELPER
+	help
+	  Enable support for the Chrontel CH7033 VGA/DVI/HDMI Encoder, as
+	  found in the Dell Wyse 3020 thin client.
+
+	  If in doubt, say "N".
+
 config DRM_DUMB_VGA_DAC
 	tristate "Dumb VGA DAC Bridge support"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 4934fcf5a6f82..74a9ab2f17468 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
 obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
+obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
 obj-$(CONFIG_DRM_LVDS_ENCODER) += lvds-encoder.o
 obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
new file mode 100644
index 0000000000000..a3b63984226a4
--- /dev/null
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -0,0 +1,722 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Chrontel CH7033 Video Encoder Driver
+ *
+ * Copyright (C) 2019 Lubomir Rintel
+ */
+
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/gpio/consumer.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_of.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+
+/* Page 0, Register 0x07 */
+enum {
+	DRI_PD		= BIT(3),
+	IO_PD		= BIT(5),
+};
+
+/* Page 0, Register 0x08 */
+enum {
+	DRI_PDDRI	= GENMASK(7, 4),
+	PDDAC		= GENMASK(3, 1),
+	PANEN		= BIT(0),
+};
+
+/* Page 0, Register 0x09 */
+enum {
+	DPD		= BIT(7),
+	GCKOFF		= BIT(6),
+	TV_BP		= BIT(5),
+	SCLPD		= BIT(4),
+	SDPD		= BIT(3),
+	VGA_PD		= BIT(2),
+	HDBKPD		= BIT(1),
+	HDMI_PD		= BIT(0),
+};
+
+/* Page 0, Register 0x0a */
+enum {
+	MEMINIT		= BIT(7),
+	MEMIDLE		= BIT(6),
+	MEMPD		= BIT(5),
+	STOP		= BIT(4),
+	LVDS_PD		= BIT(3),
+	HD_DVIB		= BIT(2),
+	HDCP_PD		= BIT(1),
+	MCU_PD		= BIT(0),
+};
+
+/* Page 0, Register 0x18 */
+enum {
+	IDF		= GENMASK(7, 4),
+	INTEN		= BIT(3),
+	SWAP		= GENMASK(2, 0),
+};
+
+enum {
+	BYTE_SWAP_RGB	= 0,
+	BYTE_SWAP_RBG	= 1,
+	BYTE_SWAP_GRB	= 2,
+	BYTE_SWAP_GBR	= 3,
+	BYTE_SWAP_BRG	= 4,
+	BYTE_SWAP_BGR	= 5,
+};
+
+/* Page 0, Register 0x19 */
+enum {
+	HPO_I		= BIT(5),
+	VPO_I		= BIT(4),
+	DEPO_I		= BIT(3),
+	CRYS_EN		= BIT(2),
+	GCLKFREQ	= GENMASK(2, 0),
+};
+
+/* Page 0, Register 0x2e */
+enum {
+	HFLIP		= BIT(7),
+	VFLIP		= BIT(6),
+	DEPO_O		= BIT(5),
+	HPO_O		= BIT(4),
+	VPO_O		= BIT(3),
+	TE		= GENMASK(2, 0),
+};
+
+/* Page 0, Register 0x2b */
+enum {
+	SWAPS		= GENMASK(7, 4),
+	VFMT		= GENMASK(3, 0),
+};
+
+/* Page 0, Register 0x54 */
+enum {
+	COMP_BP		= BIT(7),
+	DAC_EN_T	= BIT(6),
+	HWO_HDMI_HI	= GENMASK(5, 3),
+	HOO_HDMI_HI	= GENMASK(2, 0),
+};
+
+/* Page 0, Register 0x57 */
+enum {
+	FLDSEN		= BIT(7),
+	VWO_HDMI_HI	= GENMASK(5, 3),
+	VOO_HDMI_HI	= GENMASK(2, 0),
+};
+
+/* Page 0, Register 0x7e */
+enum {
+	HDMI_LVDS_SEL	= BIT(7),
+	DE_GEN		= BIT(6),
+	PWM_INDEX_HI	= BIT(5),
+	USE_DE		= BIT(4),
+	R_INT		= GENMASK(3, 0),
+};
+
+/* Page 1, Register 0x07 */
+enum {
+	BPCKSEL		= BIT(7),
+	DRI_CMFB_EN	= BIT(6),
+	CEC_PUEN	= BIT(5),
+	CEC_T		= BIT(3),
+	CKINV		= BIT(2),
+	CK_TVINV	= BIT(1),
+	DRI_CKS2	= BIT(0),
+};
+
+/* Page 1, Register 0x08 */
+enum {
+	DACG		= BIT(6),
+	DACKTST		= BIT(5),
+	DEDGEB		= BIT(4),
+	SYO		= BIT(3),
+	DRI_IT_LVDS	= GENMASK(2, 1),
+	DISPON		= BIT(0),
+};
+
+/* Page 1, Register 0x0c */
+enum {
+	DRI_PLL_CP	= GENMASK(7, 6),
+	DRI_PLL_DIVSEL	= BIT(5),
+	DRI_PLL_N1_1	= BIT(4),
+	DRI_PLL_N1_0	= BIT(3),
+	DRI_PLL_N3_1	= BIT(2),
+	DRI_PLL_N3_0	= BIT(1),
+	DRI_PLL_CKTSTEN = BIT(0),
+};
+
+/* Page 1, Register 0x6b */
+enum {
+	VCO3CS		= GENMASK(7, 6),
+	ICPGBK2_0	= GENMASK(5, 3),
+	DRI_VCO357SC	= BIT(2),
+	PDPLL2		= BIT(1),
+	DRI_PD_SER	= BIT(0),
+};
+
+/* Page 1, Register 0x6c */
+enum {
+	PLL2N11		= GENMASK(7, 4),
+	PLL2N5_4	= BIT(3),
+	PLL2N5_TOP	= BIT(2),
+	DRI_PLL_PD	= BIT(1),
+	PD_I2CM		= BIT(0),
+};
+
+/* Page 3, Register 0x28 */
+enum {
+	DIFF_EN		= GENMASK(7, 6),
+	CORREC_EN	= GENMASK(5, 4),
+	VGACLK_BP	= BIT(3),
+	HM_LV_SEL	= BIT(2),
+	HD_VGA_SEL	= BIT(1),
+};
+
+/* Page 3, Register 0x2a */
+enum {
+	LVDSCLK_BP	= BIT(7),
+	HDTVCLK_BP	= BIT(6),
+	HDMICLK_BP	= BIT(5),
+	HDTV_BP		= BIT(4),
+	HDMI_BP		= BIT(3),
+	THRWL		= GENMASK(2, 0),
+};
+
+/* Page 4, Register 0x52 */
+enum {
+	PGM_ARSTB	= BIT(7),
+	MCU_ARSTB	= BIT(6),
+	MCU_RETB	= BIT(2),
+	RESETIB		= BIT(1),
+	RESETDB		= BIT(0),
+};
+
+struct ch7033_priv {
+	struct i2c_client *client;
+	struct i2c_adapter *ddc;
+	struct gpio_desc *hpd;
+	struct drm_encoder encoder;
+	struct drm_bridge bridge;
+	struct drm_connector connector;
+};
+
+#define conn_to_ch7033_priv(x) \
+	container_of(x, struct ch7033_priv, connector)
+#define bridge_to_ch7033_priv(x) \
+	container_of(x, struct ch7033_priv, bridge)
+
+
+static int32_t ch7033_update_reg(struct i2c_client *client,
+				 u8 command, u8 value, u8 mask)
+{
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(client, command);
+	if (ret < 0)
+		return ret;
+
+	ret &= ~mask;
+	ret |= value;
+	return i2c_smbus_write_byte_data(client, command, ret);
+}
+
+static enum drm_connector_status ch7033_connector_detect(
+	struct drm_connector *connector, bool force)
+{
+	struct ch7033_priv *priv = conn_to_ch7033_priv(connector);
+
+	if (priv->hpd) {
+		if (gpiod_get_value_cansleep(priv->hpd))
+			return connector_status_connected;
+	} else if (priv->ddc) {
+		if (drm_probe_ddc(priv->ddc))
+			return connector_status_connected;
+	}
+
+	return connector_status_unknown;
+}
+
+static void ch7033_connector_destroy(struct drm_connector *connector)
+{
+	drm_connector_cleanup(connector);
+}
+
+static const struct drm_connector_funcs ch7033_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.detect = ch7033_connector_detect,
+	.destroy = ch7033_connector_destroy,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int ch7033_connector_get_modes(struct drm_connector *connector)
+{
+	struct ch7033_priv *priv = conn_to_ch7033_priv(connector);
+	struct edid *edid;
+	int ret;
+
+	edid = drm_get_edid(connector, priv->ddc);
+	drm_connector_update_edid_property(connector, edid);
+	if (edid) {
+		ret = drm_add_edid_modes(connector, edid);
+		kfree(edid);
+	} else {
+		ret = drm_add_modes_noedid(connector, 1920, 1080);
+		drm_set_preferred_mode(connector, 1024, 768);
+	}
+	return ret;
+}
+
+static struct drm_encoder *ch7033_connector_best_encoder(
+			struct drm_connector *connector)
+{
+	struct ch7033_priv *priv = conn_to_ch7033_priv(connector);
+
+	return priv->bridge.encoder;
+}
+
+static const struct drm_connector_helper_funcs ch7033_connector_helper_funcs = {
+	.get_modes = ch7033_connector_get_modes,
+	.best_encoder = ch7033_connector_best_encoder,
+};
+
+static irqreturn_t ch7033_hpd_irq(int irq, void *data)
+{
+	struct ch7033_priv *priv = data;
+
+	if (priv->connector.dev)
+		drm_helper_hpd_irq_event(priv->connector.dev);
+
+	return IRQ_HANDLED;
+}
+
+static int ch7033_bridge_attach(struct drm_bridge *bridge)
+{
+	struct ch7033_priv *priv = bridge_to_ch7033_priv(bridge);
+	struct drm_connector *connector = &priv->connector;
+	int ret;
+
+	if (priv->hpd) {
+		connector->polled = DRM_CONNECTOR_POLL_HPD;
+	} else if (priv->ddc) {
+		connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+				    DRM_CONNECTOR_POLL_DISCONNECT;
+	}
+
+	drm_connector_helper_add(connector,
+				 &ch7033_connector_helper_funcs);
+	ret = drm_connector_init_with_ddc(bridge->dev, connector,
+					  &ch7033_connector_funcs,
+					  DRM_MODE_CONNECTOR_DVII,
+					  priv->ddc);
+	if (ret) {
+		DRM_ERROR("Failed to initialize connector\n");
+		return ret;
+	}
+
+	drm_connector_attach_encoder(&priv->connector,
+				     priv->bridge.encoder);
+
+	return 0;
+}
+
+static void ch7033_bridge_detach(struct drm_bridge *bridge)
+{
+	struct ch7033_priv *priv = bridge_to_ch7033_priv(bridge);
+
+	drm_connector_cleanup(&priv->connector);
+}
+
+static enum drm_mode_status ch7033_bridge_mode_valid(struct drm_bridge *bridge,
+				     const struct drm_display_mode *mode)
+{
+	if (mode->clock > 165000)
+		return MODE_CLOCK_HIGH;
+	if (mode->hdisplay >= 1920)
+		return MODE_BAD_HVALUE;
+	if (mode->vdisplay >= 1080)
+		return MODE_BAD_VVALUE;
+	return MODE_OK;
+}
+
+static void ch7033_bridge_disable(struct drm_bridge *bridge)
+{
+	struct ch7033_priv *priv = bridge_to_ch7033_priv(bridge);
+
+	i2c_smbus_write_byte_data(priv->client, 0x03, 0x04);
+	ch7033_update_reg(priv->client, 0x52, 0x00, RESETDB);
+}
+
+static void ch7033_bridge_enable(struct drm_bridge *bridge)
+{
+	struct ch7033_priv *priv = bridge_to_ch7033_priv(bridge);
+
+	i2c_smbus_write_byte_data(priv->client, 0x03, 0x04);
+	ch7033_update_reg(priv->client, 0x52, RESETDB, RESETDB);
+}
+
+static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
+				   const struct drm_display_mode *mode,
+				   const struct drm_display_mode *adjusted_mode)
+{
+	struct ch7033_priv *priv = bridge_to_ch7033_priv(bridge);
+	int hbporch = mode->hsync_start - mode->hdisplay;
+	int hsynclen = mode->hsync_end - mode->hsync_start;
+	int vbporch = mode->vsync_start - mode->vdisplay;
+	int vsynclen = mode->vsync_end - mode->vsync_start;
+
+	/*
+	 * Page 4
+	 */
+	i2c_smbus_write_byte_data(priv->client, 0x03, 0x04);
+
+	/* Turn everything off to set all the registers to their defaults. */
+	i2c_smbus_write_byte_data(priv->client, 0x52, 0x00);
+	/* Bring I/O block up. */
+	i2c_smbus_write_byte_data(priv->client, 0x52, RESETIB);
+
+	/*
+	 * Page 0
+	 */
+	i2c_smbus_write_byte_data(priv->client, 0x03, 0x00);
+
+	/* Bring up parts we need from the power down. */
+	ch7033_update_reg(priv->client, 0x07, 0, DRI_PD | IO_PD);
+	ch7033_update_reg(priv->client, 0x08, 0, DRI_PDDRI | PDDAC | PANEN);
+	ch7033_update_reg(priv->client, 0x09, 0, HDMI_PD | VGA_PD |
+						 DPD | GCKOFF);
+	ch7033_update_reg(priv->client, 0x0a, 0, HD_DVIB);
+
+	/* Horizontal input timing. */
+	i2c_smbus_write_byte_data(priv->client, 0x0b, (mode->htotal >> 8) << 3 |
+						      (mode->hdisplay >> 8));
+	i2c_smbus_write_byte_data(priv->client, 0x0c, mode->hdisplay);
+	i2c_smbus_write_byte_data(priv->client, 0x0d, mode->htotal);
+	i2c_smbus_write_byte_data(priv->client, 0x0e, (hsynclen >> 8) << 3 |
+						      (hbporch >> 8));
+	i2c_smbus_write_byte_data(priv->client, 0x0f, hbporch);
+	i2c_smbus_write_byte_data(priv->client, 0x10, hsynclen);
+
+	/* Vertical input timing. */
+	i2c_smbus_write_byte_data(priv->client, 0x11, (mode->vtotal >> 8) << 3 |
+						      (mode->vdisplay >> 8));
+	i2c_smbus_write_byte_data(priv->client, 0x12, mode->vdisplay);
+	i2c_smbus_write_byte_data(priv->client, 0x13, mode->vtotal);
+	i2c_smbus_write_byte_data(priv->client, 0x14, ((vsynclen >> 8) << 3) |
+						      (vbporch >> 8));
+	i2c_smbus_write_byte_data(priv->client, 0x15, vbporch);
+	i2c_smbus_write_byte_data(priv->client, 0x16, vsynclen);
+
+	/* Input color swap. */
+	ch7033_update_reg(priv->client, 0x18, BYTE_SWAP_BGR, SWAP);
+
+	/* Input clock and sync polarity. */
+	ch7033_update_reg(priv->client, 0x19, mode->clock >> 16, 0x1);
+	ch7033_update_reg(priv->client, 0x19,
+			  (mode->flags & DRM_MODE_FLAG_PHSYNC) ? HPO_I : 0 |
+			  (mode->flags & DRM_MODE_FLAG_PVSYNC) ? VPO_I : 0 |
+			  mode->clock >> 16,
+			  HPO_I | VPO_I | GCLKFREQ);
+	i2c_smbus_write_byte_data(priv->client, 0x1a, mode->clock >> 8);
+	i2c_smbus_write_byte_data(priv->client, 0x1b, mode->clock);
+
+	/* Horizontal output timing. */
+	i2c_smbus_write_byte_data(priv->client, 0x1f, (mode->htotal >> 8) << 3 |
+						      (mode->hdisplay >> 8));
+	i2c_smbus_write_byte_data(priv->client, 0x20, mode->hdisplay);
+	i2c_smbus_write_byte_data(priv->client, 0x21, mode->htotal);
+
+	/* Vertical output timing. */
+	i2c_smbus_write_byte_data(priv->client, 0x25, (mode->vtotal >> 8) << 3 |
+						      (mode->vdisplay >> 8));
+	i2c_smbus_write_byte_data(priv->client, 0x26, mode->vdisplay);
+	i2c_smbus_write_byte_data(priv->client, 0x27, mode->vtotal);
+
+	/* VGA channel bypass */
+	ch7033_update_reg(priv->client, 0x2b, 9, VFMT);
+
+	/* Output sync polarity. */
+	ch7033_update_reg(priv->client, 0x2e,
+			  (mode->flags & DRM_MODE_FLAG_PHSYNC) ? HPO_O : 0 |
+			  (mode->flags & DRM_MODE_FLAG_PVSYNC) ? VPO_O : 0,
+			  HPO_O | VPO_O);
+
+	/* HDMI horizontal output timing. */
+	ch7033_update_reg(priv->client, 0x54, (hsynclen >> 8) << 3 |
+					      (hbporch >> 8),
+					      HWO_HDMI_HI | HOO_HDMI_HI);
+	i2c_smbus_write_byte_data(priv->client, 0x55, hbporch);
+	i2c_smbus_write_byte_data(priv->client, 0x56, hsynclen);
+
+	/* HDMI vertical output timing. */
+	ch7033_update_reg(priv->client, 0x57, (vsynclen >> 8) << 3 |
+					      (vbporch >> 8),
+					      VWO_HDMI_HI | VOO_HDMI_HI);
+	i2c_smbus_write_byte_data(priv->client, 0x58, vbporch);
+	i2c_smbus_write_byte_data(priv->client, 0x59, vsynclen);
+
+	/* Pick HDMI, not LVDS. */
+	ch7033_update_reg(priv->client, 0x7e, HDMI_LVDS_SEL, HDMI_LVDS_SEL);
+
+	/*
+	 * Page 1
+	 */
+	i2c_smbus_write_byte_data(priv->client, 0x03, 0x01);
+
+	/* No idea what these do, but VGA is wobbly and blinky without them. */
+	ch7033_update_reg(priv->client, 0x07, CKINV, CKINV);
+	ch7033_update_reg(priv->client, 0x08, DISPON, DISPON);
+
+	/* DRI PLL */
+	ch7033_update_reg(priv->client, 0x0c, DRI_PLL_DIVSEL, DRI_PLL_DIVSEL);
+	if (mode->clock <= 40000) {
+		ch7033_update_reg(priv->client, 0x0c, 0,
+						      DRI_PLL_N1_1 |
+						      DRI_PLL_N1_0 |
+						      DRI_PLL_N3_1 |
+						      DRI_PLL_N3_0);
+	} else if (mode->clock < 80000) {
+		ch7033_update_reg(priv->client, 0x0c, DRI_PLL_N3_0 |
+						      DRI_PLL_N1_0,
+						      DRI_PLL_N1_1 |
+						      DRI_PLL_N1_0 |
+						      DRI_PLL_N3_1 |
+						      DRI_PLL_N3_0);
+	} else {
+		ch7033_update_reg(priv->client, 0x0c, DRI_PLL_N3_1 |
+						      DRI_PLL_N1_1,
+						      DRI_PLL_N1_1 |
+						      DRI_PLL_N1_0 |
+						      DRI_PLL_N3_1 |
+						      DRI_PLL_N3_0);
+	}
+
+	/* This seems to be color calibration for VGA. */
+	i2c_smbus_write_byte_data(priv->client, 0x64, 0x29); /* LSB Blue */
+	i2c_smbus_write_byte_data(priv->client, 0x65, 0x29); /* LSB Green */
+	i2c_smbus_write_byte_data(priv->client, 0x66, 0x29); /* LSB Red */
+	i2c_smbus_write_byte_data(priv->client, 0x67, 0x00); /* MSB Blue */
+	i2c_smbus_write_byte_data(priv->client, 0x68, 0x00); /* MSB Green */
+	i2c_smbus_write_byte_data(priv->client, 0x69, 0x00); /* MSB Red */
+
+	ch7033_update_reg(priv->client, 0x6b, 0x00, DRI_PD_SER);
+	ch7033_update_reg(priv->client, 0x6c, 0x00, DRI_PLL_PD);
+
+	/*
+	 * Page 3
+	 */
+	i2c_smbus_write_byte_data(priv->client, 0x03, 0x03);
+
+	/* More bypasses and apparently another HDMI/LVDS selector. */
+	ch7033_update_reg(priv->client, 0x28, VGACLK_BP | HM_LV_SEL,
+					      VGACLK_BP | HM_LV_SEL);
+	ch7033_update_reg(priv->client, 0x2a, HDMICLK_BP | HDMI_BP,
+					      HDMICLK_BP | HDMI_BP);
+
+	/*
+	 * Page 4
+	 */
+	i2c_smbus_write_byte_data(priv->client, 0x03, 0x04);
+
+	/* Output clock. */
+	i2c_smbus_write_byte_data(priv->client, 0x10, mode->clock >> 16);
+	i2c_smbus_write_byte_data(priv->client, 0x11, mode->clock >> 8);
+	i2c_smbus_write_byte_data(priv->client, 0x12, mode->clock);
+}
+
+static const struct drm_bridge_funcs ch7033_bridge_funcs = {
+	.attach = ch7033_bridge_attach,
+	.detach = ch7033_bridge_detach,
+	.mode_valid = ch7033_bridge_mode_valid,
+	.disable = ch7033_bridge_disable,
+	.enable = ch7033_bridge_enable,
+	.mode_set = ch7033_bridge_mode_set,
+};
+
+static void ch7033_encoder_destroy(struct drm_encoder *encoder)
+{
+	drm_encoder_cleanup(encoder);
+}
+
+static const struct drm_encoder_funcs ch7033_encoder_funcs = {
+	.destroy = ch7033_encoder_destroy,
+};
+
+static int ch7033_bind(struct device *dev, struct device *master,
+		       void *data)
+{
+	struct drm_device *drm = data;
+	struct ch7033_priv *priv = dev_get_drvdata(dev);
+	uint32_t crtcs;
+	int ret;
+
+	crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
+	priv->encoder.possible_crtcs = crtcs;
+
+	ret = drm_encoder_init(drm, &priv->encoder, &ch7033_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret)
+		return ret;
+
+	ret = drm_bridge_attach(&priv->encoder, &priv->bridge, NULL);
+	if (ret)
+		drm_encoder_cleanup(&priv->encoder);
+
+	return ret;
+}
+
+static void ch7033_unbind(struct device *dev, struct device *master,
+			  void *data)
+{
+	struct ch7033_priv *priv = dev_get_drvdata(dev);
+
+	drm_encoder_cleanup(&priv->encoder);
+}
+
+static const struct component_ops ch7033_ops = {
+	.bind = ch7033_bind,
+	.unbind = ch7033_unbind,
+};
+
+static int ch7033_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct device_node *ddc_node, *conn_node;
+	struct device *dev = &client->dev;
+	struct ch7033_priv *priv;
+	struct i2c_adapter *ddc;
+	int ret;
+
+	conn_node = of_graph_get_remote_node(dev->of_node, 1, -1);
+	if (!conn_node) {
+		dev_err(&client->dev, "unable to get the connector node\n");
+		return -EINVAL;
+	}
+
+	ddc_node = of_parse_phandle(conn_node, "ddc-i2c-bus", 0);
+	if (ddc_node) {
+		ddc = of_get_i2c_adapter_by_node(ddc_node);
+		if (!ddc) {
+			ret = -EPROBE_DEFER;
+			goto out;
+		}
+	} else {
+		dev_info(&client->dev, "no DDC bus for connector\n");
+		ddc = NULL;
+	}
+
+	ret = i2c_smbus_read_byte_data(client, 0x00);
+	if ((i2c_smbus_read_byte_data(client, 0x00) & 0xf7) != 0x56) {
+		dev_err(&client->dev, "the device is not a ch7033\n");
+		ret = -ENODEV;
+		goto out;
+	}
+
+	i2c_smbus_write_byte_data(client, 0x03, 0x04);
+	ret = i2c_smbus_read_byte_data(client, 0x51) & 0x0f;
+	if (ret != 3) {
+		dev_err(&client->dev, "unknown revision %d\n", ret);
+		ret = -ENODEV;
+		goto out;
+	}
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	dev_set_drvdata(dev, priv);
+
+	INIT_LIST_HEAD(&priv->bridge.list);
+
+	priv->client = client;
+	priv->ddc = ddc;
+
+	priv->hpd = devm_gpiod_get_from_of_node(dev, conn_node, "hpd-gpios",
+						0, GPIOD_IN, "HPD");
+	if (IS_ERR(priv->hpd)) {
+		if (PTR_ERR(priv->hpd) == -ENOENT) {
+			dev_info(&client->dev, "no HPD pin\n");
+			priv->hpd = NULL;
+		} else {
+			ret = PTR_ERR(priv->hpd);
+			goto out;
+		}
+	}
+
+	if (priv->hpd) {
+		ret = devm_request_threaded_irq(&client->dev,
+						gpiod_to_irq(priv->hpd),
+						NULL, ch7033_hpd_irq,
+						IRQF_TRIGGER_RISING |
+						IRQF_TRIGGER_FALLING |
+						IRQF_ONESHOT,
+						"HPD", priv);
+		if (ret) {
+			dev_err(&client->dev, "failed to request irq\n");
+			goto out;
+		}
+	}
+
+	priv->bridge.funcs = &ch7033_bridge_funcs;
+	priv->bridge.of_node = dev->of_node;
+
+	drm_bridge_add(&priv->bridge);
+
+	ret = component_add(dev, &ch7033_ops);
+	if (ret) {
+		drm_bridge_remove(&priv->bridge);
+		goto out;
+	}
+
+	dev_info(dev, "Chrontel CH7033 Video Encoder\n");
+out:
+	of_node_put(conn_node);
+	return ret;
+}
+
+static int ch7033_remove(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct ch7033_priv *priv = dev_get_drvdata(dev);
+
+	component_del(dev, &ch7033_ops);
+	drm_bridge_remove(&priv->bridge);
+
+	return 0;
+}
+
+static const struct of_device_id ch7033_dt_ids[] = {
+	{ .compatible = "chrontel,ch7033", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ch7033_dt_ids);
+
+static const struct i2c_device_id ch7033_ids[] = {
+	{ "ch7033", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ch7033_ids);
+
+static struct i2c_driver ch7033_driver = {
+	.probe = ch7033_probe,
+	.remove = ch7033_remove,
+	.driver = {
+		.name = "ch7033",
+		.of_match_table = of_match_ptr(ch7033_dt_ids),
+	},
+	.id_table = ch7033_ids,
+};
+
+module_i2c_driver(ch7033_driver);
+
+MODULE_AUTHOR("Lubomir Rintel <lkundrak@v3.sk>");
+MODULE_DESCRIPTION("Chrontel CH7033 Video Encoder Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
