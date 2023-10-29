Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFF77DAE09
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 20:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4953610E1A0;
	Sun, 29 Oct 2023 19:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8700A10E19E
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 19:46:14 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxqOiDtj5ltJs1AA--.3099S3;
 Mon, 30 Oct 2023 03:46:11 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxXNx+tj5lKq02AA--.51878S4; 
 Mon, 30 Oct 2023 03:46:10 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/8] drm/loongson: Introduce a drm bridge driver for it66121
 HDMI transmitter
Date: Mon, 30 Oct 2023 03:46:01 +0800
Message-Id: <20231029194607.379459-3-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231029194607.379459-1-suijingfeng@loongson.cn>
References: <20231029194607.379459-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxXNx+tj5lKq02AA--.51878S4
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9fXoWftFyDGr1fZw4kXw13GFWrXrc_yoW5ZrW7Go
 WvvFnxtw15XryxZws7Wa12gF1DZ3WDtrWFvr4Fq3ykuayUKwn8Ja17JwnrZr1aqwn7tr13
 Jr1ktrs5Gr43Cr18l-sFpf9Il3svdjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf
 9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
 UjIYCTnIWjp_UUUYU7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
 8IcIk0rVWrJVCq3wAFIxvE14AKwVWUAVWUZwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
 Y2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14
 v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
 02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
 wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
 w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
 0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUco7KUUUUU
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The IT66121 is a DVO to HDMI converter, LS3A5000+LS7A1000 ML5A_MB use this
chip to support HDMI output. Thus add a drm bridge based driver for it.
This patch is developed with drivers/gpu/drm/bridge/ite-it66121.c as base.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/loongson/Kconfig            |   1 +
 drivers/gpu/drm/loongson/Makefile           |   2 +
 drivers/gpu/drm/loongson/ite_it66121.c      | 749 ++++++++++++++++++++
 drivers/gpu/drm/loongson/ite_it66121.h      |  19 +
 drivers/gpu/drm/loongson/ite_it66121_regs.h | 268 +++++++
 5 files changed, 1039 insertions(+)
 create mode 100644 drivers/gpu/drm/loongson/ite_it66121.c
 create mode 100644 drivers/gpu/drm/loongson/ite_it66121.h
 create mode 100644 drivers/gpu/drm/loongson/ite_it66121_regs.h

diff --git a/drivers/gpu/drm/loongson/Kconfig b/drivers/gpu/drm/loongson/Kconfig
index df6946d505fa..a96f5699099e 100644
--- a/drivers/gpu/drm/loongson/Kconfig
+++ b/drivers/gpu/drm/loongson/Kconfig
@@ -7,6 +7,7 @@ config DRM_LOONGSON
 	select DRM_TTM
 	select I2C
 	select I2C_ALGOBIT
+	select REGMAP_I2C
 	help
 	  This is a DRM driver for Loongson Graphics, it may including
 	  LS7A2000, LS7A1000, LS2K2000 and LS2K1000 etc. Loongson LS7A
diff --git a/drivers/gpu/drm/loongson/Makefile b/drivers/gpu/drm/loongson/Makefile
index bef00b2c5569..1459d19b2c90 100644
--- a/drivers/gpu/drm/loongson/Makefile
+++ b/drivers/gpu/drm/loongson/Makefile
@@ -20,4 +20,6 @@ loongson-y += loongson_device.o \
 	      loongson_module.o \
 	      loongson_vbios.o
 
+loongson-y += ite_it66121.o
+
 obj-$(CONFIG_DRM_LOONGSON) += loongson.o
diff --git a/drivers/gpu/drm/loongson/ite_it66121.c b/drivers/gpu/drm/loongson/ite_it66121.c
new file mode 100644
index 000000000000..7b085575f864
--- /dev/null
+++ b/drivers/gpu/drm/loongson/ite_it66121.c
@@ -0,0 +1,749 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2020 BayLibre, SAS
+ * Author: Phong LE <ple@baylibre.com>
+ * Copyright (C) 2018-2019, Artem Mygaiev
+ * Copyright (C) 2017, Fresco Logic, Incorporated.
+ *
+ * IT66121 HDMI transmitter driver
+ */
+
+#include <linux/media-bus-format.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/bitfield.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+
+#include "ite_it66121.h"
+#include "ite_it66121_regs.h"
+
+#define IT66121_CHIP_NAME                       "IT66121"
+
+struct it66121_bridge {
+	struct drm_bridge bridge;
+	struct drm_connector connector;
+	struct regmap *regmap;
+	struct i2c_client *client;
+	/* Protects fields below and device registers */
+	struct mutex lock;
+	u16 vendor_id;
+	u16 device_id;
+	u32 revision;
+};
+
+static inline struct it66121_bridge *
+bridge_to_it66121(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct it66121_bridge, bridge);
+}
+
+static inline struct it66121_bridge *
+connector_to_it66121(struct drm_connector *connector)
+{
+	return container_of(connector, struct it66121_bridge, connector);
+}
+
+static const struct regmap_range_cfg it66121_regmap_banks[] = {
+	{
+		.name = IT66121_CHIP_NAME,
+		.range_min = 0x00,
+		.range_max = 0x1FF,
+		.selector_reg = IT66121_CLK_BANK_REG,
+		.selector_mask = 0x1,
+		.selector_shift = 0,
+		.window_start = 0x00,
+		.window_len = 0x100,
+	},
+};
+
+static const struct regmap_config it66121_regmap_config = {
+	.val_bits = 8,
+	.reg_bits = 8,
+	.max_register = 0x1FF,
+	.ranges = it66121_regmap_banks,
+	.num_ranges = ARRAY_SIZE(it66121_regmap_banks),
+};
+
+static inline int it66121_preamble_ddc(struct it66121_bridge *itb)
+{
+	return regmap_write(itb->regmap, IT66121_MASTER_SEL_REG,
+			    IT66121_MASTER_SEL_HOST);
+}
+
+static inline int it66121_fire_afe(struct it66121_bridge *itb)
+{
+	return regmap_write(itb->regmap, IT66121_AFE_DRV_REG, 0);
+}
+
+static int it66121_configure_input(struct it66121_bridge *itb)
+{
+	int ret;
+
+	ret = regmap_write(itb->regmap, IT66121_INPUT_MODE_REG,
+			   IT66121_INPUT_MODE_RGB888);
+	if (ret)
+		return ret;
+
+	return regmap_write(itb->regmap, IT66121_INPUT_CSC_REG,
+			    IT66121_INPUT_CSC_NO_CONV);
+}
+
+/*
+ * it66121_configure_afe() - Configure the analog front end
+ * @ctx: it66121_ctx object
+ * @mode: mode to configure
+ *
+ * RETURNS:
+ * zero if success, a negative error code otherwise.
+ */
+static int it66121_configure_afe(struct it66121_bridge *itb,
+				 const struct drm_display_mode *mode)
+{
+	int ret;
+
+	ret = regmap_write(itb->regmap, IT66121_AFE_DRV_REG,
+			   IT66121_AFE_DRV_RST);
+	if (ret)
+		return ret;
+
+	if (mode->clock > IT66121_AFE_CLK_HIGH) {
+		ret = regmap_write_bits(itb->regmap, IT66121_AFE_XP_REG,
+					IT66121_AFE_XP_GAINBIT |
+					IT66121_AFE_XP_ENO,
+					IT66121_AFE_XP_GAINBIT);
+		if (ret)
+			return ret;
+
+		ret = regmap_write_bits(itb->regmap, IT66121_AFE_IP_REG,
+					IT66121_AFE_IP_GAINBIT |
+					IT66121_AFE_IP_ER0,
+					IT66121_AFE_IP_GAINBIT);
+		if (ret)
+			return ret;
+
+		ret = regmap_write_bits(itb->regmap, IT66121_AFE_IP_REG,
+					IT66121_AFE_IP_EC1, 0);
+		if (ret)
+			return ret;
+
+		ret = regmap_write_bits(itb->regmap, IT66121_AFE_XP_EC1_REG,
+					IT66121_AFE_XP_EC1_LOWCLK, 0x80);
+		if (ret)
+			return ret;
+	} else {
+		ret = regmap_write_bits(itb->regmap, IT66121_AFE_XP_REG,
+					IT66121_AFE_XP_GAINBIT |
+					IT66121_AFE_XP_ENO,
+					IT66121_AFE_XP_ENO);
+		if (ret)
+			return ret;
+
+		ret = regmap_write_bits(itb->regmap, IT66121_AFE_IP_REG,
+					IT66121_AFE_IP_GAINBIT |
+					IT66121_AFE_IP_ER0,
+					IT66121_AFE_IP_ER0);
+		if (ret)
+			return ret;
+
+		ret = regmap_write_bits(itb->regmap, IT66121_AFE_IP_REG,
+					IT66121_AFE_IP_EC1,
+					IT66121_AFE_IP_EC1);
+		if (ret)
+			return ret;
+
+		ret = regmap_write_bits(itb->regmap, IT66121_AFE_XP_EC1_REG,
+					IT66121_AFE_XP_EC1_LOWCLK,
+					IT66121_AFE_XP_EC1_LOWCLK);
+		if (ret)
+			return ret;
+	}
+
+	/* Clear reset flags */
+	ret = regmap_write_bits(itb->regmap, IT66121_SW_RST_REG,
+				IT66121_SW_RST_REF | IT66121_SW_RST_VID, 0);
+	if (ret)
+		return ret;
+
+	return it66121_fire_afe(itb);
+}
+
+static inline int it66121_wait_ddc_ready(struct it66121_bridge *itb)
+{
+	u32 error = IT66121_DDC_STATUS_NOACK |
+		    IT66121_DDC_STATUS_WAIT_BUS |
+		    IT66121_DDC_STATUS_ARBI_LOSE;
+	u32 done = IT66121_DDC_STATUS_TX_DONE;
+	int ret, val;
+
+	ret = regmap_read_poll_timeout(itb->regmap, IT66121_DDC_STATUS_REG,
+				       val, val & (error | done),
+				       IT66121_EDID_SLEEP_US,
+				       IT66121_EDID_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	if (val & error)
+		return -EAGAIN;
+
+	return 0;
+}
+
+static int it66121_abort_ddc_ops(struct it66121_bridge *itb)
+{
+	unsigned int swreset, cpdesire;
+	int ret;
+
+	ret = regmap_read(itb->regmap, IT66121_SW_RST_REG, &swreset);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(itb->regmap, IT66121_HDCP_REG, &cpdesire);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(itb->regmap, IT66121_HDCP_REG,
+			   cpdesire & (~IT66121_HDCP_CPDESIRED & 0xFF));
+	if (ret)
+		return ret;
+
+	ret = regmap_write(itb->regmap, IT66121_SW_RST_REG,
+			   (swreset | IT66121_SW_RST_HDCP));
+	if (ret)
+		return ret;
+
+	ret = it66121_preamble_ddc(itb);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(itb->regmap, IT66121_DDC_COMMAND_REG,
+			   IT66121_DDC_COMMAND_ABORT);
+	if (ret)
+		return ret;
+
+	return it66121_wait_ddc_ready(itb);
+}
+
+static int it66121_get_edid_block(void *context,
+				  u8 *buf,
+				  unsigned int block,
+				  size_t len)
+{
+	struct it66121_bridge *itb = (struct it66121_bridge *)context;
+	int remain = len;
+	int offset = 0;
+	int ret, cnt;
+
+	offset = (block % 2) * len;
+	block = block / 2;
+
+	while (remain > 0) {
+		cnt = (remain > IT66121_EDID_FIFO_SIZE) ?
+				IT66121_EDID_FIFO_SIZE : remain;
+
+		ret = regmap_write(itb->regmap, IT66121_DDC_COMMAND_REG,
+				   IT66121_DDC_COMMAND_FIFO_CLR);
+		if (ret)
+			return ret;
+
+		ret = it66121_wait_ddc_ready(itb);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(itb->regmap, IT66121_DDC_OFFSET_REG, offset);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(itb->regmap, IT66121_DDC_BYTE_REG, cnt);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(itb->regmap, IT66121_DDC_SEGMENT_REG, block);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(itb->regmap, IT66121_DDC_COMMAND_REG,
+				   IT66121_DDC_COMMAND_EDID_READ);
+		if (ret)
+			return ret;
+
+		offset += cnt;
+		remain -= cnt;
+
+		ret = it66121_wait_ddc_ready(itb);
+		if (ret) {
+			it66121_abort_ddc_ops(itb);
+			return ret;
+		}
+
+		ret = regmap_noinc_read(itb->regmap, IT66121_DDC_RD_FIFO_REG,
+					buf, cnt);
+		if (ret)
+			return ret;
+
+		buf += cnt;
+	}
+
+	return 0;
+}
+
+static bool it66121_is_hpd_detect(struct it66121_bridge *itb)
+{
+	int val;
+
+	if (regmap_read(itb->regmap, IT66121_SYS_STATUS_REG, &val))
+		return false;
+
+	return val & IT66121_SYS_STATUS_HPDETECT;
+}
+
+static int it66121_connector_get_modes(struct drm_connector *connector)
+{
+	struct it66121_bridge *itb = connector_to_it66121(connector);
+	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	int num_modes = 0;
+	struct edid *edid;
+	int ret;
+
+	edid = drm_bridge_get_edid(&itb->bridge, connector);
+	if (!edid) {
+		drm_err(connector->dev, "Failed to read EDID\n");
+		goto failed;
+	}
+
+	if (drm_connector_update_edid_property(connector, edid)) {
+		drm_err(connector->dev, "Failed to update EDID\n");
+		goto failed;
+	}
+
+	ret = drm_display_info_set_bus_formats(&connector->display_info,
+					       &bus_format, 1);
+	if (ret)
+		goto failed;
+
+	num_modes = drm_add_edid_modes(connector, edid);
+
+failed:
+	return num_modes;
+}
+
+static int it66121_connector_detect_ctx(struct drm_connector *connector,
+					struct drm_modeset_acquire_ctx *ctx,
+					bool force)
+{
+	struct it66121_bridge *itb = connector_to_it66121(connector);
+
+	return it66121_is_hpd_detect(itb) ? connector_status_connected
+					  : connector_status_disconnected;
+}
+
+static struct drm_connector_helper_funcs it66121_connector_helper_funcs = {
+	.get_modes = it66121_connector_get_modes,
+	.detect_ctx = it66121_connector_detect_ctx,
+};
+
+static const struct drm_connector_funcs it66121_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int it66121_bridge_connector_init(struct drm_bridge *bridge)
+{
+	struct it66121_bridge *itb = bridge_to_it66121(bridge);
+	struct drm_connector *connector = &itb->connector;
+	int ret;
+
+	if (bridge->ops & DRM_BRIDGE_OP_HPD) {
+		connector->polled = DRM_CONNECTOR_POLL_HPD;
+	} else {
+		connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+				    DRM_CONNECTOR_POLL_DISCONNECT;
+	}
+
+	ret = drm_connector_init(bridge->dev,
+				 connector,
+				 &it66121_connector_funcs,
+				 bridge->type);
+	if (ret)
+		return ret;
+
+	drm_connector_helper_add(connector, &it66121_connector_helper_funcs);
+
+	drm_connector_attach_encoder(connector, bridge->encoder);
+
+	return 0;
+}
+
+static int it66121_bridge_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
+{
+	struct it66121_bridge *itb = bridge_to_it66121(bridge);
+	int ret;
+
+	ret = it66121_bridge_connector_init(bridge);
+	if (ret)
+		return ret;
+
+	ret = regmap_write_bits(itb->regmap, IT66121_CLK_BANK_REG,
+				IT66121_CLK_BANK_PWROFF_RCLK, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write_bits(itb->regmap, IT66121_INT_REG,
+				IT66121_INT_TX_CLK_OFF, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write_bits(itb->regmap, IT66121_AFE_DRV_REG,
+				IT66121_AFE_DRV_PWD, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write_bits(itb->regmap, IT66121_AFE_XP_REG,
+				IT66121_AFE_XP_PWDI | IT66121_AFE_XP_PWDPLL, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write_bits(itb->regmap, IT66121_AFE_IP_REG,
+				IT66121_AFE_IP_PWDPLL, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write_bits(itb->regmap, IT66121_AFE_DRV_REG,
+				IT66121_AFE_DRV_RST, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write_bits(itb->regmap, IT66121_AFE_XP_REG,
+				IT66121_AFE_XP_RESETB, IT66121_AFE_XP_RESETB);
+	if (ret)
+		return ret;
+
+	ret = regmap_write_bits(itb->regmap, IT66121_AFE_IP_REG,
+				IT66121_AFE_IP_RESETB, IT66121_AFE_IP_RESETB);
+	if (ret)
+		return ret;
+
+	ret = regmap_write_bits(itb->regmap, IT66121_SW_RST_REG,
+				IT66121_SW_RST_REF,
+				IT66121_SW_RST_REF);
+	if (ret)
+		return ret;
+
+	drm_info(bridge->dev,
+		 "IT66121 attached, Vendor ID: 0x%x, Device ID: 0x%x\n",
+		 itb->vendor_id, itb->device_id);
+
+	/* Per programming manual, sleep here for bridge to settle */
+	msleep(50);
+
+	return 0;
+}
+
+static void it66121_bridge_enable(struct drm_bridge *bridge,
+				  struct drm_bridge_state *state)
+{
+	struct it66121_bridge *itb = bridge_to_it66121(bridge);
+	struct regmap *regmap = itb->regmap;
+	int ret;
+
+	ret = regmap_clear_bits(regmap, IT66121_AVMUTE_REG, IT66121_AVMUTE_BIT);
+	if (ret)
+		drm_err(bridge->dev, "Enable it66121 bridge failed");
+
+	regmap_write(regmap, IT66121_PKT_GEN_CTRL_REG,
+		     IT66121_PKT_GEN_CTRL_ON | IT66121_PKT_GEN_CTRL_RPT);
+}
+
+static void it66121_bridge_disable(struct drm_bridge *bridge,
+				   struct drm_bridge_state *bridge_state)
+{
+	struct it66121_bridge *itb = bridge_to_it66121(bridge);
+	struct regmap *regmap = itb->regmap;
+	int ret;
+
+	ret = regmap_set_bits(regmap, IT66121_AVMUTE_REG, IT66121_AVMUTE_BIT);
+	if (ret)
+		drm_err(bridge->dev, "Disable it66121 bridge failed");
+
+	regmap_write(regmap, IT66121_PKT_GEN_CTRL_REG,
+		     IT66121_PKT_GEN_CTRL_ON | IT66121_PKT_GEN_CTRL_RPT);
+}
+
+static void it66121_bridge_mode_set(struct drm_bridge *bridge,
+				    const struct drm_display_mode *mode,
+				    const struct drm_display_mode *adj_mode)
+{
+	struct it66121_bridge *itb = bridge_to_it66121(bridge);
+	struct hdmi_avi_infoframe avi_infoframe;
+	u8 av_buf[HDMI_INFOFRAME_SIZE(AVI)];
+	int ret;
+
+	mutex_lock(&itb->lock);
+
+	hdmi_avi_infoframe_init(&avi_infoframe);
+
+	ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_infoframe,
+						       &itb->connector,
+						       adj_mode);
+	if (ret) {
+		drm_err(bridge->dev, "Failed to setup AVI infoframe\n");
+		goto unlock;
+	}
+
+	ret = hdmi_avi_infoframe_pack(&avi_infoframe, av_buf, sizeof(av_buf));
+	if (ret < 0) {
+		drm_err(bridge->dev, "Failed to pack infoframe\n");
+		goto unlock;
+	}
+
+	/* Write new AVI infoframe packet */
+	ret = regmap_bulk_write(itb->regmap, IT66121_AVIINFO_DB1_REG,
+				&av_buf[HDMI_INFOFRAME_HEADER_SIZE],
+				HDMI_AVI_INFOFRAME_SIZE);
+	if (ret)
+		goto unlock;
+
+	if (regmap_write(itb->regmap, IT66121_AVIINFO_CSUM_REG, av_buf[3]))
+		goto unlock;
+
+	/* Enable AVI infoframe */
+	if (regmap_write(itb->regmap, IT66121_AVI_INFO_PKT_REG,
+			 IT66121_AVI_INFO_PKT_ON | IT66121_AVI_INFO_PKT_RPT))
+		goto unlock;
+
+	/* Set TX mode to HDMI */
+	if (regmap_write(itb->regmap, IT66121_HDMI_MODE_REG, IT66121_HDMI_MODE_HDMI))
+		goto unlock;
+
+	if (regmap_write_bits(itb->regmap, IT66121_CLK_BANK_REG,
+			      IT66121_CLK_BANK_PWROFF_TXCLK,
+			      IT66121_CLK_BANK_PWROFF_TXCLK))
+		goto unlock;
+
+	if (it66121_configure_input(itb))
+		goto unlock;
+
+	if (it66121_configure_afe(itb, adj_mode))
+		goto unlock;
+
+	if (regmap_write_bits(itb->regmap, IT66121_CLK_BANK_REG,
+			      IT66121_CLK_BANK_PWROFF_TXCLK, 0))
+		goto unlock;
+
+unlock:
+	mutex_unlock(&itb->lock);
+}
+
+static enum drm_mode_status
+it66121_bridge_mode_valid(struct drm_bridge *bridge,
+			  const struct drm_display_info *info,
+			  const struct drm_display_mode *mode)
+{
+	if (mode->clock > 148500)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->clock < 25000)
+		return MODE_CLOCK_LOW;
+
+	return MODE_OK;
+}
+
+static struct edid *it66121_bridge_get_edid(struct drm_bridge *bridge,
+					    struct drm_connector *connector)
+{
+	struct it66121_bridge *itb = bridge_to_it66121(bridge);
+	struct edid *edid;
+	int ret;
+
+	mutex_lock(&itb->lock);
+	ret = it66121_preamble_ddc(itb);
+	if (ret) {
+		edid = NULL;
+		goto unlock;
+	}
+
+	ret = regmap_write(itb->regmap, IT66121_DDC_HEADER_REG,
+			   IT66121_DDC_HEADER_EDID);
+	if (ret) {
+		edid = NULL;
+		goto unlock;
+	}
+
+	edid = drm_do_get_edid(connector, it66121_get_edid_block, itb);
+
+unlock:
+	mutex_unlock(&itb->lock);
+
+	return edid;
+}
+
+static void it66121_bridge_detach(struct drm_bridge *bridge)
+{
+	struct it66121_bridge *itb = bridge_to_it66121(bridge);
+
+	mutex_destroy(&itb->lock);
+
+	i2c_unregister_device(itb->client);
+
+	drm_bridge_remove(bridge);
+}
+
+static const struct drm_bridge_funcs it66121_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.attach = it66121_bridge_attach,
+	.detach = it66121_bridge_detach,
+	.atomic_enable = it66121_bridge_enable,
+	.atomic_disable = it66121_bridge_disable,
+	.mode_set = it66121_bridge_mode_set,
+	.mode_valid = it66121_bridge_mode_valid,
+	.get_edid = it66121_bridge_get_edid,
+};
+
+static void it66121_bridge_get_version(struct it66121_bridge *itb)
+{
+	u32 vendor_ids[2] = { 0 };
+	u32 device_ids[2] = { 0 };
+
+	regmap_read(itb->regmap, IT66121_VENDOR_ID0_REG, &vendor_ids[0]);
+	regmap_read(itb->regmap, IT66121_VENDOR_ID1_REG, &vendor_ids[1]);
+	regmap_read(itb->regmap, IT66121_DEVICE_ID0_REG, &device_ids[0]);
+	regmap_read(itb->regmap, IT66121_DEVICE_ID1_REG, &device_ids[1]);
+
+	/* Revision is shared with DEVICE_ID1 */
+	itb->revision = FIELD_GET(IT66121_REVISION_MASK, device_ids[1]);
+	device_ids[1] &= IT66121_DEVICE_ID1_MASK;
+
+	itb->vendor_id = vendor_ids[1] << 8 | vendor_ids[0];
+	itb->device_id = device_ids[1] << 8 | device_ids[0];
+}
+
+static void it66121_bridge_init_base(struct it66121_bridge *itb, bool hpd)
+{
+	struct drm_bridge *bridge = &itb->bridge;
+
+	bridge->funcs = &it66121_bridge_funcs;
+	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
+	bridge->ops = DRM_BRIDGE_OP_EDID;
+
+	if (hpd)
+		bridge->ops |= DRM_BRIDGE_OP_HPD;
+
+	drm_bridge_add(bridge);
+}
+
+/*
+ * The device address is 0x98 if PCADR pin is pulled low, 0x98 >> 1 = 0x4c
+ * The device address is 0x9A if PCADR pin is pulled high, 0x9A >> 1 = 0x4d
+ */
+static bool it66121_probe_slave(struct drm_device *ddev,
+				struct i2c_adapter *adapter,
+				u8 *addr)
+{
+	struct i2c_msg msg = {
+		.len = 0,
+	};
+	int num = 3;
+	int count;
+	int i;
+
+	/* Try slave address 0x4c */
+	msg.addr = 0x4c;
+	count = 0;
+	for (i = 0; i < num; i++) {
+		count += i2c_transfer(adapter, &msg, 1);
+		udelay(9);
+	}
+
+	if (count == num) {
+		*addr = 0x4c;
+		return true;
+	}
+
+	/* Try slave address 0x4d */
+	msg.addr = 0x4d;
+	count = 0;
+	for (i = 0; i < num; i++) {
+		count += i2c_transfer(adapter, &msg, 1);
+		udelay(9);
+	}
+
+	if (count == num) {
+		*addr = 0x4d;
+		return true;
+	}
+
+	drm_err(ddev, "No reliable slave i2c device found\n");
+
+	/*
+	 * If no reliable slave i2c device found, we would like drop the
+	 * support.
+	 */
+	return false;
+}
+
+struct drm_bridge *it66121_bridge_create(struct drm_device *ddev,
+					 struct i2c_adapter *i2c,
+					 u8 addr,
+					 bool enable_hpd,
+					 u32 int_gpio,
+					 unsigned int pipe)
+{
+	struct i2c_board_info it66121_board_info = {
+		.type = IT66121_CHIP_NAME,
+	};
+	struct it66121_bridge *itb;
+	struct i2c_client *client;
+	u8 addr_probed;
+
+	if (!it66121_probe_slave(ddev, i2c, &addr_probed))
+		return NULL;
+
+	if (addr != addr_probed) {
+		drm_warn(ddev, "device address(0x%x) is not correct\n", addr);
+		addr = addr_probed;
+	}
+
+	it66121_board_info.addr = addr;
+
+	itb = devm_kzalloc(ddev->dev, sizeof(*itb), GFP_KERNEL);
+	if (!itb)
+		return NULL;
+
+	client = i2c_new_client_device(i2c, &it66121_board_info);
+	if (IS_ERR(client))
+		return NULL;
+
+	drm_info(ddev, "i2c client %s@0x%02x created\n",
+		 it66121_board_info.type, it66121_board_info.addr);
+
+	itb->client = client;
+
+	i2c_set_clientdata(client, itb);
+
+	mutex_init(&itb->lock);
+
+	itb->regmap = devm_regmap_init_i2c(client, &it66121_regmap_config);
+	if (IS_ERR(itb->regmap)) {
+		drm_err(ddev, "Failed to map registers\n");
+		return NULL;
+	}
+
+	it66121_bridge_get_version(itb);
+
+	it66121_bridge_init_base(itb, enable_hpd);
+
+	return &itb->bridge;
+}
diff --git a/drivers/gpu/drm/loongson/ite_it66121.h b/drivers/gpu/drm/loongson/ite_it66121.h
new file mode 100644
index 000000000000..c3e26cce1b02
--- /dev/null
+++ b/drivers/gpu/drm/loongson/ite_it66121.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2023 Loongson Technology Corporation Limited
+ */
+
+#ifndef __ITE_IT66121_H__
+#define __ITE_IT66121_H__
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_device.h>
+
+struct drm_bridge *it66121_bridge_create(struct drm_device *ddev,
+					 struct i2c_adapter *i2c,
+					 u8 addr,
+					 bool enable_hpd,
+					 u32 int_gpio,
+					 unsigned int pipe);
+
+#endif
diff --git a/drivers/gpu/drm/loongson/ite_it66121_regs.h b/drivers/gpu/drm/loongson/ite_it66121_regs.h
new file mode 100644
index 000000000000..57118a4501c1
--- /dev/null
+++ b/drivers/gpu/drm/loongson/ite_it66121_regs.h
@@ -0,0 +1,268 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+/*
+ * Copyright (C) 2020 BayLibre, SAS
+ * Author: Phong LE <ple@baylibre.com>
+ * Copyright (C) 2018-2019, Artem Mygaiev
+ * Copyright (C) 2017, Fresco Logic, Incorporated.
+ */
+
+#ifndef __ITE_IT66121_h__
+#define __ITE_IT66121_h__
+
+#define IT66121_VENDOR_ID0_REG			0x00
+#define IT66121_VENDOR_ID1_REG			0x01
+#define IT66121_DEVICE_ID0_REG			0x02
+#define IT66121_DEVICE_ID1_REG			0x03
+
+#define IT66121_REVISION_MASK			GENMASK(7, 4)
+#define IT66121_DEVICE_ID1_MASK			GENMASK(3, 0)
+
+#define IT66121_MASTER_SEL_REG			0x10
+#define IT66121_MASTER_SEL_HOST			BIT(0)
+
+#define IT66121_AFE_DRV_REG			0x61
+#define IT66121_AFE_DRV_RST			BIT(4)
+#define IT66121_AFE_DRV_PWD			BIT(5)
+
+#define IT66121_INPUT_MODE_REG			0x70
+#define IT66121_INPUT_MODE_RGB888		(0 << 6)
+#define IT66121_INPUT_MODE_YUV422		BIT(6)
+#define IT66121_INPUT_MODE_YUV444		(2 << 6)
+#define IT66121_INPUT_MODE_CCIR656		BIT(4)
+#define IT66121_INPUT_MODE_SYNCEMB		BIT(3)
+#define IT66121_INPUT_MODE_DDR			BIT(2)
+
+#define IT66121_INPUT_CSC_REG			0x72
+#define IT66121_INPUT_CSC_ENDITHER		BIT(7)
+#define IT66121_INPUT_CSC_ENUDFILTER		BIT(6)
+#define IT66121_INPUT_CSC_DNFREE_GO		BIT(5)
+#define IT66121_INPUT_CSC_RGB_TO_YUV		0x02
+#define IT66121_INPUT_CSC_YUV_TO_RGB		0x03
+#define IT66121_INPUT_CSC_NO_CONV		0x00
+
+#define IT66121_AFE_XP_REG			0x62
+#define IT66121_AFE_XP_GAINBIT			BIT(7)
+#define IT66121_AFE_XP_PWDPLL			BIT(6)
+#define IT66121_AFE_XP_ENI			BIT(5)
+#define IT66121_AFE_XP_ENO			BIT(4)
+#define IT66121_AFE_XP_RESETB			BIT(3)
+#define IT66121_AFE_XP_PWDI			BIT(2)
+#define IT6610_AFE_XP_BYPASS			BIT(0)
+
+#define IT66121_AFE_IP_REG			0x64
+#define IT66121_AFE_IP_GAINBIT			BIT(7)
+#define IT66121_AFE_IP_PWDPLL			BIT(6)
+#define IT66121_AFE_IP_CKSEL_05			(0 << 4)
+#define IT66121_AFE_IP_CKSEL_1			BIT(4)
+#define IT66121_AFE_IP_CKSEL_2			(2 << 4)
+#define IT66121_AFE_IP_CKSEL_2OR4		(3 << 4)
+#define IT66121_AFE_IP_ER0			BIT(3)
+#define IT66121_AFE_IP_RESETB			BIT(2)
+#define IT66121_AFE_IP_ENC			BIT(1)
+#define IT66121_AFE_IP_EC1			BIT(0)
+
+#define IT66121_AFE_XP_EC1_REG			0x68
+#define IT66121_AFE_XP_EC1_LOWCLK		BIT(4)
+
+#define IT66121_SW_RST_REG			0x04
+#define IT66121_SW_RST_REF			BIT(5)
+#define IT66121_SW_RST_AREF			BIT(4)
+#define IT66121_SW_RST_VID			BIT(3)
+#define IT66121_SW_RST_AUD			BIT(2)
+#define IT66121_SW_RST_HDCP			BIT(0)
+
+#define IT66121_DDC_COMMAND_REG			0x15
+#define IT66121_DDC_COMMAND_BURST_READ		0x0
+#define IT66121_DDC_COMMAND_EDID_READ		0x3
+#define IT66121_DDC_COMMAND_FIFO_CLR		0x9
+#define IT66121_DDC_COMMAND_SCL_PULSE		0xA
+#define IT66121_DDC_COMMAND_ABORT		0xF
+
+#define IT66121_HDCP_REG			0x20
+#define IT66121_HDCP_CPDESIRED			BIT(0)
+#define IT66121_HDCP_EN1P1FEAT			BIT(1)
+
+#define IT66121_INT_STATUS1_REG			0x06
+#define IT66121_INT_STATUS1_AUD_OVF		BIT(7)
+#define IT66121_INT_STATUS1_DDC_NOACK		BIT(5)
+#define IT66121_INT_STATUS1_DDC_FIFOERR		BIT(4)
+#define IT66121_INT_STATUS1_DDC_BUSHANG		BIT(2)
+#define IT66121_INT_STATUS1_RX_SENS_STATUS	BIT(1)
+#define IT66121_INT_STATUS1_HPD_STATUS		BIT(0)
+
+#define IT66121_DDC_HEADER_REG			0x11
+#define IT66121_DDC_HEADER_HDCP			0x74
+#define IT66121_DDC_HEADER_EDID			0xA0
+
+#define IT66121_DDC_OFFSET_REG			0x12
+#define IT66121_DDC_BYTE_REG			0x13
+#define IT66121_DDC_SEGMENT_REG			0x14
+#define IT66121_DDC_RD_FIFO_REG			0x17
+
+#define IT66121_CLK_BANK_REG			0x0F
+#define IT66121_CLK_BANK_PWROFF_RCLK		BIT(6)
+#define IT66121_CLK_BANK_PWROFF_ACLK		BIT(5)
+#define IT66121_CLK_BANK_PWROFF_TXCLK		BIT(4)
+#define IT66121_CLK_BANK_PWROFF_CRCLK		BIT(3)
+#define IT66121_CLK_BANK_0			0
+#define IT66121_CLK_BANK_1			1
+
+#define IT66121_INT_REG				0x05
+#define IT66121_INT_ACTIVE_HIGH			BIT(7)
+#define IT66121_INT_OPEN_DRAIN			BIT(6)
+#define IT66121_INT_TX_CLK_OFF			BIT(0)
+
+#define IT66121_INT_MASK1_REG			0x09
+#define IT66121_INT_MASK1_AUD_OVF		BIT(7)
+#define IT66121_INT_MASK1_DDC_NOACK		BIT(5)
+#define IT66121_INT_MASK1_DDC_FIFOERR		BIT(4)
+#define IT66121_INT_MASK1_DDC_BUSHANG		BIT(2)
+#define IT66121_INT_MASK1_RX_SENS		BIT(1)
+#define IT66121_INT_MASK1_HPD			BIT(0)
+
+#define IT66121_INT_CLR1_REG			0x0C
+#define IT66121_INT_CLR1_PKTACP			BIT(7)
+#define IT66121_INT_CLR1_PKTNULL		BIT(6)
+#define IT66121_INT_CLR1_PKTGEN			BIT(5)
+#define IT66121_INT_CLR1_KSVLISTCHK		BIT(4)
+#define IT66121_INT_CLR1_AUTHDONE		BIT(3)
+#define IT66121_INT_CLR1_AUTHFAIL		BIT(2)
+#define IT66121_INT_CLR1_RX_SENS		BIT(1)
+#define IT66121_INT_CLR1_HPD			BIT(0)
+
+#define IT66121_AVMUTE_REG			0xC1
+#define IT66121_AVMUTE_BIT			BIT(0)
+#define IT66121_AVMUTE_BLUESCR			BIT(1)
+
+#define IT66121_PKT_CTS_CTRL_REG		0xC5
+#define IT66121_PKT_CTS_CTRL_SEL		BIT(1)
+
+#define IT66121_PKT_GEN_CTRL_REG		0xC6
+#define IT66121_PKT_GEN_CTRL_ON			BIT(0)
+#define IT66121_PKT_GEN_CTRL_RPT		BIT(1)
+
+#define IT66121_AVIINFO_DB1_REG			0x158
+#define IT66121_AVIINFO_DB2_REG			0x159
+#define IT66121_AVIINFO_DB3_REG			0x15A
+#define IT66121_AVIINFO_DB4_REG			0x15B
+#define IT66121_AVIINFO_DB5_REG			0x15C
+#define IT66121_AVIINFO_CSUM_REG		0x15D
+#define IT66121_AVIINFO_DB6_REG			0x15E
+#define IT66121_AVIINFO_DB7_REG			0x15F
+#define IT66121_AVIINFO_DB8_REG			0x160
+#define IT66121_AVIINFO_DB9_REG			0x161
+#define IT66121_AVIINFO_DB10_REG		0x162
+#define IT66121_AVIINFO_DB11_REG		0x163
+#define IT66121_AVIINFO_DB12_REG		0x164
+#define IT66121_AVIINFO_DB13_REG		0x165
+
+#define IT66121_AVI_INFO_PKT_REG		0xCD
+#define IT66121_AVI_INFO_PKT_ON			BIT(0)
+#define IT66121_AVI_INFO_PKT_RPT		BIT(1)
+
+#define IT66121_HDMI_MODE_REG			0xC0
+#define IT66121_HDMI_MODE_HDMI			BIT(0)
+
+#define IT66121_SYS_STATUS_REG			0x0E
+#define IT66121_SYS_STATUS_ACTIVE_IRQ		BIT(7)
+#define IT66121_SYS_STATUS_HPDETECT		BIT(6)
+#define IT66121_SYS_STATUS_SENDECTECT		BIT(5)
+#define IT66121_SYS_STATUS_VID_STABLE		BIT(4)
+#define IT66121_SYS_STATUS_AUD_CTS_CLR		BIT(1)
+#define IT66121_SYS_STATUS_CLEAR_IRQ		BIT(0)
+
+#define IT66121_DDC_STATUS_REG			0x16
+#define IT66121_DDC_STATUS_TX_DONE		BIT(7)
+#define IT66121_DDC_STATUS_ACTIVE		BIT(6)
+#define IT66121_DDC_STATUS_NOACK		BIT(5)
+#define IT66121_DDC_STATUS_WAIT_BUS		BIT(4)
+#define IT66121_DDC_STATUS_ARBI_LOSE		BIT(3)
+#define IT66121_DDC_STATUS_FIFO_FULL		BIT(2)
+#define IT66121_DDC_STATUS_FIFO_EMPTY		BIT(1)
+#define IT66121_DDC_STATUS_FIFO_VALID		BIT(0)
+
+#define IT66121_EDID_SLEEP_US			20000
+#define IT66121_EDID_TIMEOUT_US			200000
+#define IT66121_EDID_FIFO_SIZE			32
+
+#define IT66121_CLK_CTRL0_REG			0x58
+#define IT66121_CLK_CTRL0_AUTO_OVER_SAMPLING	BIT(4)
+#define IT66121_CLK_CTRL0_EXT_MCLK_MASK		GENMASK(3, 2)
+#define IT66121_CLK_CTRL0_EXT_MCLK_128FS	(0 << 2)
+#define IT66121_CLK_CTRL0_EXT_MCLK_256FS	BIT(2)
+#define IT66121_CLK_CTRL0_EXT_MCLK_512FS	(2 << 2)
+#define IT66121_CLK_CTRL0_EXT_MCLK_1024FS	(3 << 2)
+#define IT66121_CLK_CTRL0_AUTO_IPCLK		BIT(0)
+#define IT66121_CLK_STATUS1_REG			0x5E
+#define IT66121_CLK_STATUS2_REG			0x5F
+
+#define IT66121_AUD_CTRL0_REG			0xE0
+#define IT66121_AUD_SWL				(3 << 6)
+#define IT66121_AUD_16BIT			(0 << 6)
+#define IT66121_AUD_18BIT			BIT(6)
+#define IT66121_AUD_20BIT			(2 << 6)
+#define IT66121_AUD_24BIT			(3 << 6)
+#define IT66121_AUD_SPDIFTC			BIT(5)
+#define IT66121_AUD_SPDIF			BIT(4)
+#define IT66121_AUD_I2S				(0 << 4)
+#define IT66121_AUD_EN_I2S3			BIT(3)
+#define IT66121_AUD_EN_I2S2			BIT(2)
+#define IT66121_AUD_EN_I2S1			BIT(1)
+#define IT66121_AUD_EN_I2S0			BIT(0)
+#define IT66121_AUD_CTRL0_AUD_SEL		BIT(4)
+
+#define IT66121_AUD_CTRL1_REG			0xE1
+#define IT66121_AUD_FIFOMAP_REG			0xE2
+#define IT66121_AUD_CTRL3_REG			0xE3
+#define IT66121_AUD_SRCVALID_FLAT_REG		0xE4
+#define IT66121_AUD_FLAT_SRC0			BIT(4)
+#define IT66121_AUD_FLAT_SRC1			BIT(5)
+#define IT66121_AUD_FLAT_SRC2			BIT(6)
+#define IT66121_AUD_FLAT_SRC3			BIT(7)
+#define IT66121_AUD_HDAUDIO_REG			0xE5
+
+#define IT66121_AUD_PKT_CTS0_REG		0x130
+#define IT66121_AUD_PKT_CTS1_REG		0x131
+#define IT66121_AUD_PKT_CTS2_REG		0x132
+#define IT66121_AUD_PKT_N0_REG			0x133
+#define IT66121_AUD_PKT_N1_REG			0x134
+#define IT66121_AUD_PKT_N2_REG			0x135
+
+#define IT66121_AUD_CHST_MODE_REG		0x191
+#define IT66121_AUD_CHST_CAT_REG		0x192
+#define IT66121_AUD_CHST_SRCNUM_REG		0x193
+#define IT66121_AUD_CHST_CHTNUM_REG		0x194
+#define IT66121_AUD_CHST_CA_FS_REG		0x198
+#define IT66121_AUD_CHST_OFS_WL_REG		0x199
+
+#define IT66121_AUD_PKT_CTS_CNT0_REG		0x1A0
+#define IT66121_AUD_PKT_CTS_CNT1_REG		0x1A1
+#define IT66121_AUD_PKT_CTS_CNT2_REG		0x1A2
+
+#define IT66121_AUD_FS_22P05K			0x4
+#define IT66121_AUD_FS_44P1K			0x0
+#define IT66121_AUD_FS_88P2K			0x8
+#define IT66121_AUD_FS_176P4K			0xC
+#define IT66121_AUD_FS_24K			0x6
+#define IT66121_AUD_FS_48K			0x2
+#define IT66121_AUD_FS_96K			0xA
+#define IT66121_AUD_FS_192K			0xE
+#define IT66121_AUD_FS_768K			0x9
+#define IT66121_AUD_FS_32K			0x3
+#define IT66121_AUD_FS_OTHER			0x1
+
+#define IT66121_AUD_SWL_21BIT			0xD
+#define IT66121_AUD_SWL_24BIT			0xB
+#define IT66121_AUD_SWL_23BIT			0x9
+#define IT66121_AUD_SWL_22BIT			0x5
+#define IT66121_AUD_SWL_20BIT			0x3
+#define IT66121_AUD_SWL_17BIT			0xC
+#define IT66121_AUD_SWL_19BIT			0x8
+#define IT66121_AUD_SWL_18BIT			0x4
+#define IT66121_AUD_SWL_16BIT			0x2
+#define IT66121_AUD_SWL_NOT_INDICATED		0x0
+
+#define IT66121_AFE_CLK_HIGH			80000 /* Khz */
+
+#endif
-- 
2.34.1

