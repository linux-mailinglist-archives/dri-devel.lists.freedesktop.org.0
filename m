Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512A399BBFF
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2024 23:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E9710E388;
	Sun, 13 Oct 2024 21:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="Iud8nHPl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="AoMO1KhP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fallback16.i.mail.ru (fallback16.i.mail.ru [79.137.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3770F10E388
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 21:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=hvu5dW6z/PYfylLlw1OYdRxZbZhEWz9eHuNV8iN7Fo0=; 
 t=1728854668;x=1728944668; 
 b=Iud8nHPl8ThJm4DMUAVNKYKnVjDu7BovtDhLpwvc7AdQ7DmBokxjTBsy4kABf83Q8/frPD6b1yO945ccEJdSZVodTTx7nYyH2KeNRWmNbtrpDMJ4XS3GFR6ZTR3nIsQTD7tbGMEyi1gvxiV2yC4Qg1qCzShu8pjv879QFpiUfXk=;
Received: from [10.113.49.28] (port=45534 helo=smtp16.i.mail.ru)
 by fallback16.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1t064g-001t8b-9K; Mon, 14 Oct 2024 00:24:26 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=hvu5dW6z/PYfylLlw1OYdRxZbZhEWz9eHuNV8iN7Fo0=; t=1728854666; x=1728944666; 
 b=AoMO1KhP6WOhaoLxekioLYuofmfxmQrz5A9HxPCATcDLZo02QBF3ou4ZDIxaZH3IASzebKZeAwD
 gqznvyGv5+4wgyKmHByrRyI0cGFIQ4/iNQCM6qQ9YewIOh4Nte448hckXnb2NJn697KYPfepwJsxw
 fBX8auvNTGxKTMtFg28=;
Received: by exim-smtp-57f79c7799-ff99r with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1t064S-00000000ArH-1tHy; Mon, 14 Oct 2024 00:24:13 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@mainlining.org, danila@jiaxyga.com
Subject: [PATCH 2/2] drm/panel: Add Samsung AMS581VF01 panel driver
Date: Mon, 14 Oct 2024 00:24:02 +0300
Message-ID: <20241013212402.15624-3-danila@jiaxyga.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241013212402.15624-1-danila@jiaxyga.com>
References: <20241013212402.15624-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9B01871A0ED523BBF93215B4F211077CAB8D34C6C4A8736E4182A05F538085040E34FF32D403B9DE63DE06ABAFEAF67050E6F29F300A80A236FE32FC68D7A2621DBD6ABFBCFC3BAB6
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78E88BD1CA827EF00C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE751DD1FEBB966604DEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BC08E230531AC9C9003F93F55EA53B073EE0BEB3B7ACC4A346795C8301D74EE26A471835C12D1D9774AD6D5ED66289B5278DA827A17800CE7ABB305BD10C6E5099FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C327ED053E960B195E117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CF40CF4A39350C3ECFBA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B62E644F1A5478FC1A76E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C22494AAE2D1698E8717BE827F84554CEF50127C277FBC8AE2E8BEC1C9C6CFAD2A0F5AAAE862A0553A39223F8577A6DFFEA7C0D13C52992D4BC2543847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5DB6AFE90B367B6165002B1117B3ED69688C25F884AA46F80715D9AB585B0EB04823CB91A9FED034534781492E4B8EEAD2F8D89FC5850081EC79554A2A72441328621D336A7BC284946AD531847A6065AED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFE537428D27F5F191E55875053D4D4F6FD5D584984429ABC1D77488AC27DB7568486D6DC23143AA0E7C85317C21026A498D6E76898033468DE9F78341A6FF8F0FE48818429B58FF60457F7985AD47CF5C02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojTJ02HBIKT7IcqxjF66nbuA==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981D35572ECED80C0D400C2CDE4AB6CFA7B270F1692D08227FEAC67350DF226822F2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B42DA9BE0E4F7CCE4C920C9969AF7F7D50289E8CBDDC4EFD27049FFFDB7839CE9E3928B87FA8A99B4443A9B8764115D3517AA7BD75D5B57E50673800CA4E604211
X-7FA49CB5: 0D63561A33F958A5A1FBE5F9BD5791D2A5DA7FF1FF1FA200A59C9B4ED702C9F58941B15DA834481FA18204E546F3947CA85A14DF5F041C99F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637876557C5A8D58DD0389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3D8B0ABA717EF295735872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojTJ02HBIKT7KszZgF6fQGIg==
X-Mailru-MI: 8000000000000800
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

Add the driver for Samsung AMS581VF01 SOFEF01-based 5.81" FHD Plus CMD
mode OLED panel support found in Google Pixel 4a (sm7150-google-sunfish)

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-ams581vf01.c  | 283 ++++++++++++++++++
 3 files changed, 293 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams581vf01.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index ddfaa99ea9dd..f637dcc7a886 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -614,6 +614,15 @@ config DRM_PANEL_RONBO_RB070D30
 	  Say Y here if you want to enable support for Ronbo Electronics
 	  RB070D30 1024x600 DSI panel.
 
+config DRM_PANEL_SAMSUNG_AMS581VF01
+	tristate "Samsung AMS581VF01 panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y or M here if you want to enable support for the
+	  Samsung AMS581VF01 FHD Plus (2340x1080@60Hz) CMD mode panel.
+
 config DRM_PANEL_SAMSUNG_AMS639RQ08
 	tristate "Samsung AMS639RQ08 panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 4b5eaf111676..4db02c2411ae 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS581VF01) += panel-samsung-ams581vf01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS639RQ08) += panel-samsung-ams639rq08.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20) += panel-samsung-atna33xc20.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-ams581vf01.c b/drivers/gpu/drm/panel/panel-samsung-ams581vf01.c
new file mode 100644
index 000000000000..cf6186312252
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-ams581vf01.c
@@ -0,0 +1,283 @@
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
+#define MCS_PASSWD		0xf0
+
+struct ams581vf01 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data *supplies;
+};
+
+static const struct regulator_bulk_data ams581vf01_supplies[] = {
+	{ .supply = "vdd3p3" },
+	{ .supply = "vddio" },
+	{ .supply = "vsn" },
+	{ .supply = "vsp" },
+};
+
+static inline struct ams581vf01 *to_ams581vf01(struct drm_panel *panel)
+{
+	return container_of(panel, struct ams581vf01, panel);
+}
+
+static void ams581vf01_reset(struct ams581vf01 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int ams581vf01_on(struct ams581vf01 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	/* Sleep Out, Wait 10ms */
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	usleep_range(10000, 11000);
+
+	/* TE On */
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	/* MIC Setting */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD, 0x5a, 0x5a); /* Unlock */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xeb, 0x17,
+					       0x41, 0x92,
+					       0x0e, 0x10,
+					       0x82, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD, 0xa5, 0xa5); /* Lock */
+
+	/* Column & Page Address Setting */
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 0x0437);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x0923);
+
+	/* Brightness Setting */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+
+	/* Horizontal & Vertical sync Setting */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD, 0x5a, 0x5a); /* Unlock */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_ACCESS_PROT_OFF, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe8, 0x11, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD, 0xa5, 0xa5); /* Lock */
+	mipi_dsi_msleep(&dsi_ctx, 110);
+
+	/* Display On */
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
+}
+
+static void ams581vf01_off(struct ams581vf01 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	/* Display Off & Sleep In */
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+
+	/* VCI operating mode change */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD, 0x5a, 0x5a); /* Unlock */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_ACCESS_PROT_OFF, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD, 0xa5, 0xa5);  /* Lock */
+
+	mipi_dsi_msleep(&dsi_ctx, 120);
+}
+
+static int ams581vf01_prepare(struct drm_panel *panel)
+{
+	struct ams581vf01 *ctx = to_ams581vf01(panel);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ams581vf01_supplies),
+				    ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	ams581vf01_reset(ctx);
+
+	ret = ams581vf01_on(ctx);
+	if (ret < 0) {
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(ams581vf01_supplies),
+				       ctx->supplies);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ams581vf01_unprepare(struct drm_panel *panel)
+{
+	struct ams581vf01 *ctx = to_ams581vf01(panel);
+
+	ams581vf01_off(ctx);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(ams581vf01_supplies),
+			       ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode ams581vf01_mode = {
+	.clock = (1080 + 32 + 73 + 98) * (2340 + 8 + 1 + 8) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 32,
+	.hsync_end = 1080 + 32 + 73,
+	.htotal = 1080 + 32 + 73 + 98,
+	.vdisplay = 2340,
+	.vsync_start = 2340 + 8,
+	.vsync_end = 2340 + 8 + 1,
+	.vtotal = 2340 + 8 + 1 + 8,
+	.width_mm = 62,
+	.height_mm = 134,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int ams581vf01_get_modes(struct drm_panel *panel,
+				 struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &ams581vf01_mode);
+}
+
+static const struct drm_panel_funcs ams581vf01_panel_funcs = {
+	.prepare = ams581vf01_prepare,
+	.unprepare = ams581vf01_unprepare,
+	.get_modes = ams581vf01_get_modes,
+};
+
+static int ams581vf01_bl_update_status(struct backlight_device *bl)
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
+static const struct backlight_ops ams581vf01_bl_ops = {
+	.update_status = ams581vf01_bl_update_status,
+};
+
+static struct backlight_device *
+ams581vf01_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 511,
+		.max_brightness = 1023,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+						&ams581vf01_bl_ops, &props);
+}
+
+static int ams581vf01_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct ams581vf01 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ret = devm_regulator_bulk_get_const(&dsi->dev,
+					    ARRAY_SIZE(ams581vf01_supplies),
+					    ams581vf01_supplies,
+					    &ctx->supplies);
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
+	drm_panel_init(&ctx->panel, dev, &ams581vf01_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = ams581vf01_create_backlight(dsi);
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
+static void ams581vf01_remove(struct mipi_dsi_device *dsi)
+{
+	struct ams581vf01 *ctx = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id ams581vf01_of_match[] = {
+	{ .compatible = "samsung,ams581vf01" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ams581vf01_of_match);
+
+static struct mipi_dsi_driver ams581vf01_driver = {
+	.probe = ams581vf01_probe,
+	.remove = ams581vf01_remove,
+	.driver = {
+		.name = "panel-samsung-ams581vf01",
+		.of_match_table = ams581vf01_of_match,
+	},
+};
+module_mipi_dsi_driver(ams581vf01_driver);
+
+MODULE_AUTHOR("Danila Tikhonov <danila@jiaxyga.com>");
+MODULE_DESCRIPTION("DRM driver for SAMSUNG AMS581VF01 cmd mode dsi panel");
+MODULE_LICENSE("GPL");
-- 
2.47.0

