Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F93904E39
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 10:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B835D10E7D2;
	Wed, 12 Jun 2024 08:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="ulswbu1H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp16.i.mail.ru (smtp16.i.mail.ru [95.163.41.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB0A10E7CA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 08:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=oqluNzAu9FoFII29qH8cTPlFyKHLBzSkfLu3+aV7hrE=; t=1718181258; x=1718271258; 
 b=ulswbu1H9VUkYArhSAEHANpz0vNow39fRADfgOiKE8BL126Bvc5yoauJawWkwE7hHrrmxyd4KeR
 ozYX7Iuom2wzRiKUg7+nwl2GRykGitdlsXGHNvTFixGp4BHWRHO1TgpXdYqRmSKv9jyrYhZtaQbDA
 c9Cj9+W8x6bidX1OKaI=;
Received: by smtp16.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
 id 1sHJQu-00000006Iqv-1D4p; Wed, 12 Jun 2024 11:34:16 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, adrian@travitia.xyz, degdagmohamed@gmail.com,
 Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH v2 2/2] drm/panel: Add Samsung AMS639RQ08 panel driver
Date: Wed, 12 Jun 2024 11:34:05 +0300
Message-ID: <20240612083405.15750-3-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612083405.15750-1-danila@jiaxyga.com>
References: <20240612083405.15750-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp16.i.mail.ru;
 auth=pass smtp.auth=danila@jiaxyga.com
 smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9AC8CA0B4439200FA3396D26EA105C0471DE01117BA8131F700894C459B0CD1B99482E7B7D5FC789D87FE86DE270AD9EE7DA64669BD8F541C18367D251A7F91BD1E35E39F85F323EC
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7E439DB85B4CC0F53EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063727C65896DA7AF7D78638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8038B8C6B35619D6105E8BD7C2AB4DD11DB43DD82ECE0887ECC7F00164DA146DAFE8445B8C89999728AA50765F7900637DCE3DBD6F8E38AFD389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8A9FF340AA05FB58CF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C10A7BA5215B3CCEC6136E347CC761E074AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3E2B0921DE55F4073BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF17B107DEF921CE791DD303D21008E298D5E8D9A59859A8B6957A4DEDD2346B4275ECD9A6C639B01B78DA827A17800CE7AEA1580DED4E70E3731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5E3DA7D379BB9B0585002B1117B3ED696947A839CC9B7DDD68D59E407A97E9958823CB91A9FED034534781492E4B8EEADF94D3DC5184210B4C79554A2A72441328621D336A7BC284946AD531847A6065AED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF3A557326F3BBA7107D775F2FFA951AEEEE420329849C0A3803D038B532554971265F63FF884E79B304A26A3878DC13306DF1B459DB5CA71D1DB24A82BF7F4F2272FABE6F497FC5360D035775BAD7A4FF02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj7p5wIdCuWKM+xQE68OQa5A==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981B214AC7FA6C30164A7CF1FCFAF80C0E91E834379425F4AEF6E6A5B9EC695DC762C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
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

Add the driver for Samsung AMS639RQ08 FHD Plus CMD mode panel support
found in:
- Xiaomi Mi 9 Lite / CC9 (sdm710-xiaomi-pyxis)
- Xiaomi Mi 9T / Redmi K20 (sm7150-xiaomi-davinci)
- Xiaomi Mi 9T Pro / Redmi K20 Pro (sm8150-xiaomi-raphael)

Tested-by: Degdag Mohamed <degdagmohamed@gmail.com> # xiaomi-raphael
Tested-by: Jens Reidel <adrian@travitia.xyz> # xiaomi-davinci
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-ams639rq08.c  | 362 ++++++++++++++++++
 3 files changed, 372 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams639rq08.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 2ae0eb0638f32..8a86960ae812a 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -576,6 +576,15 @@ config DRM_PANEL_RONBO_RB070D30
 	  Say Y here if you want to enable support for Ronbo Electronics
 	  RB070D30 1024x600 DSI panel.
 
+config DRM_PANEL_SAMSUNG_AMS639RQ08
+	tristate "Samsung AMS639RQ08 panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y or M here if you want to enable support for the
+	  Samsung AMS639RQ08 FHD Plus (2340x1080@60Hz) CMD mode panel.
+
 config DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01
 	tristate "Samsung AMS452EF01 panel with S6E88A0 DSI video mode controller"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index f0203f6e02f44..eb87bc01b0414 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS639RQ08) += panel-samsung-ams639rq08.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20) += panel-samsung-atna33xc20.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-ams639rq08.c b/drivers/gpu/drm/panel/panel-samsung-ams639rq08.c
new file mode 100644
index 0000000000000..f9789fdd6c326
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-ams639rq08.c
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024, Danila Tikhonov <danila@jiaxyga.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+/* Manufacturer Command Set */
+#define MCS_ACCESS_PROT_OFF	0xb0
+#define MCS_UNKNOWN_B7		0xb7
+#define MCS_BIAS_CURRENT_CTRL	0xd1
+#define MCS_PASSWD1		0xf0
+#define MCS_PASSWD2		0xfc
+#define MCS_UNKNOWN_FF		0xff
+
+struct ams639rq08 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[4];
+};
+
+static inline struct ams639rq08 *to_ams639rq08(struct drm_panel *panel)
+{
+	return container_of(panel, struct ams639rq08, panel);
+}
+
+static void ams639rq08_reset(struct ams639rq08 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int ams639rq08_on(struct ams639rq08 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	/* Delay 2ms for VCI1 power */
+	mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq(dsi, MCS_ACCESS_PROT_OFF, 0x0c);
+	mipi_dsi_dcs_write_seq(dsi, MCS_UNKNOWN_FF, 0x10);
+	mipi_dsi_dcs_write_seq(dsi, MCS_ACCESS_PROT_OFF, 0x2f);
+	mipi_dsi_dcs_write_seq(dsi, MCS_BIAS_CURRENT_CTRL, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0xa5, 0xa5);
+
+	/* Sleep Out */
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
+		return ret;
+	}
+	usleep_range(10000, 11000);
+
+	/* TE OUT (Vsync On) */
+	mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0x5a, 0x5a);
+
+	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set tear on: %d\n", ret);
+		return ret;
+	}
+
+	/* DBV Smooth Transition */
+	mipi_dsi_dcs_write_seq(dsi, MCS_UNKNOWN_B7, 0x01, 0x4b);
+
+	/* Edge Dimming Speed Setting */
+	mipi_dsi_dcs_write_seq(dsi, MCS_ACCESS_PROT_OFF, 0x06);
+	mipi_dsi_dcs_write_seq(dsi, MCS_UNKNOWN_B7, 0x10);
+	mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
+
+	/* Page Address Set */
+	ret = mipi_dsi_dcs_set_page_address(dsi, 0x0000, 0x0923);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set page address: %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0x5a, 0x5a);
+
+	/* Set DDIC internal HFP */
+	mipi_dsi_dcs_write_seq(dsi, MCS_ACCESS_PROT_OFF, 0x23);
+	mipi_dsi_dcs_write_seq(dsi, MCS_BIAS_CURRENT_CTRL, 0x11);
+
+	/* OFC Setting 84.1 Mhz */
+	mipi_dsi_dcs_write_seq(dsi, 0xe9, 0x11, 0x55,
+				    0xa6, 0x75, 0xa3,
+				    0xb9, 0xa1, 0x4a,
+				    0x00, 0x1a, 0xb8);
+
+	/* Err_FG Setting */
+	mipi_dsi_dcs_write_seq(dsi, 0xe1,
+				    0x00, 0x00, 0x02,
+				    0x02, 0x42, 0x02);
+	mipi_dsi_dcs_write_seq(dsi, 0xe2,
+				    0x00, 0x00, 0x00,
+				    0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, MCS_ACCESS_PROT_OFF, 0x0c);
+	mipi_dsi_dcs_write_seq(dsi, 0xe1, 0x19);
+	mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+
+	/* Brightness Control */
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x0000);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display brightness: %d\n", ret);
+		return ret;
+	}
+
+	/* Display On */
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	msleep(67);
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display on: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ams639rq08_off(struct ams639rq08 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display off: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(120);
+
+	return 0;
+}
+
+static int ams639rq08_prepare(struct drm_panel *panel)
+{
+	struct ams639rq08 *ctx = to_ams639rq08(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	ams639rq08_reset(ctx);
+
+	ret = ams639rq08_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ams639rq08_unprepare(struct drm_panel *panel)
+{
+	struct ams639rq08 *ctx = to_ams639rq08(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = ams639rq08_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode ams639rq08_mode = {
+	.clock = (1080 + 64 + 20 + 64) * (2340 + 64 + 20 + 64) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 64,
+	.hsync_end = 1080 + 64 + 20,
+	.htotal = 1080 + 64 + 20 + 64,
+	.vdisplay = 2340,
+	.vsync_start = 2340 + 64,
+	.vsync_end = 2340 + 64 + 20,
+	.vtotal = 2340 + 64 + 20 + 64,
+	.width_mm = 68,
+	.height_mm = 147,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int ams639rq08_get_modes(struct drm_panel *panel,
+					struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &ams639rq08_mode);
+}
+
+static const struct drm_panel_funcs ams639rq08_panel_funcs = {
+	.prepare = ams639rq08_prepare,
+	.unprepare = ams639rq08_unprepare,
+	.get_modes = ams639rq08_get_modes,
+};
+
+static int ams639rq08_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return 0;
+}
+
+static int ams639rq08_bl_get_brightness(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_get_display_brightness_large(dsi, &brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return brightness;
+}
+
+static const struct backlight_ops ams639rq08_bl_ops = {
+	.update_status = ams639rq08_bl_update_status,
+	.get_brightness = ams639rq08_bl_get_brightness,
+};
+
+static struct backlight_device *
+ams639rq08_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 1023,
+		.max_brightness = 2047,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+						&ams639rq08_bl_ops, &props);
+}
+
+static int ams639rq08_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct ams639rq08 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->supplies[0].supply = "vdd3p3";
+	ctx->supplies[1].supply = "vddio";
+	ctx->supplies[2].supply = "vsn";
+	ctx->supplies[3].supply = "vsp";
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
+								ctx->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+					"Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
+
+	drm_panel_init(&ctx->panel, dev, &ams639rq08_panel_funcs,
+			DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = ams639rq08_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+					"Failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0) {
+		drm_panel_remove(&ctx->panel);
+		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void ams639rq08_remove(struct mipi_dsi_device *dsi)
+{
+	struct ams639rq08 *ctx = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id ams639rq08_of_match[] = {
+	{ .compatible = "samsung,ams639rq08" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ams639rq08_of_match);
+
+static struct mipi_dsi_driver ams639rq08_driver = {
+	.probe = ams639rq08_probe,
+	.remove = ams639rq08_remove,
+	.driver = {
+		.name = "panel-samsung-ams639rq08",
+		.of_match_table = ams639rq08_of_match,
+	},
+};
+module_mipi_dsi_driver(ams639rq08_driver);
+
+MODULE_AUTHOR("Danila Tikhonov <danila@jiaxyga.com>");
+MODULE_DESCRIPTION("DRM driver for SAMSUNG AMS639RQ08 cmd mode dsi panel");
+MODULE_LICENSE("GPL");
-- 
2.45.2

