Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B5198AE91
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 22:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4E210E05A;
	Mon, 30 Sep 2024 20:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="FTgTmN2/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="J13khg8s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 855 seconds by postgrey-1.36 at gabe;
 Mon, 30 Sep 2024 20:39:29 UTC
Received: from fallback18.i.mail.ru (fallback18.i.mail.ru [79.137.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C620C10E05A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 20:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=3iJcm5G5pdRzMZPFwnfcRuLnp2Ig4a9Qk118V9QfNWw=; 
 t=1727728769;x=1727818769; 
 b=FTgTmN2/akWSr+hqPQBtaCWFf6EHxZtmrocUK+B0TIH0vnb4D7MO5Hydq9cxDekPPPni3K03b3Kk/FsX/Ek73hZA6UkMY/gAT31KgP66z6kACtjbwqZi15+pPSpHhEw8X35ZH0oVfsHqqwY+1cJSWfCgtTSZv6qM42mdNhLX4Nk=;
Received: from [10.12.4.13] (port=33338 helo=smtp38.i.mail.ru)
 by fallback18.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1svMxI-00FfJ1-TW; Mon, 30 Sep 2024 23:25:17 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=3iJcm5G5pdRzMZPFwnfcRuLnp2Ig4a9Qk118V9QfNWw=; t=1727727916; x=1727817916; 
 b=J13khg8sPS6b0/7k528ZHlZKMjyPepXsBm7vt21gMCgO9dUosXIB05ACQo4+aOdZlKpOTJA2BE4
 S6XcYfAye5YOmdtYHpIrnYFgZoQ01dtr/vda5yAR4dpBDGNbxoThKUGEMwwFXzdDjNdgUNnpx3ggO
 GRgnaKBlmlWr1DojGNo=;
Received: by exim-smtp-69fb954d46-6fqd6 with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1svMx4-00000000HGp-1ewK; Mon, 30 Sep 2024 23:25:02 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, adrian@travitia.xyz, degdagmohamed@gmail.com,
 linux@mainlining.org, Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH v3 2/2] drm/panel: Add Samsung AMS639RQ08 panel driver
Date: Mon, 30 Sep 2024 23:24:48 +0300
Message-ID: <20240930202448.188051-3-danila@jiaxyga.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240930202448.188051-1-danila@jiaxyga.com>
References: <20240930202448.188051-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD964E86F54238FCC39B474B51A4E6CEF96B6E1A8C01776A3AB182A05F53808504045DDB624FCC7B8FE3DE06ABAFEAF670557CECC9846ABA09C1C5DC97C387795A50C4FDA321CD2EEF9
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B356E3E4D202B32AEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006379448E89E2A57838D8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8B944735CF172AB59D31576F67790544CFC91284E0CC22190CC7F00164DA146DAFE8445B8C89999728AA50765F7900637F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637BA939FD1B3BAB99B389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F790063750A1A8C6A3E0B001D81D268191BDAD3DBD4B6F7A4D31EC0BE2F48590F00D11D6D81D268191BDAD3D78DA827A17800CE7266735129D8A02D6EC76A7562686271ED91E3A1F190DE8FD2E808ACE2090B5E14AD6D5ED66289B5278DA827A17800CE7FE3A47D6FA29121068655334FD4449CB26055571C92BF10F35872C767BF85DA227C277FBC8AE2E8BD198C2A7CB645D0575ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-B7AD71C0: 4965CFDFE05191347903E2BF2CCE50FB42605BC54A9F883B79311020FFC8D4AD661A7FFD632DF40A1C98BA224982BC1D
X-C1DE0DAB: 0D63561A33F958A514BA70B046477A495002B1117B3ED6967BA080C80CE7C997AD0703CEB2EF9A27823CB91A9FED034534781492E4B8EEAD688A4496B03D38F1C79554A2A72441328621D336A7BC284946AD531847A6065AED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD75DCE07D45A749953FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF3E5F8F9191A50C370546920E730F923CF132E09F4173EADD7071ED3560597856792D7E5D32AAB0D0A06F21331F7F71AFB02C33038ABADD5CDAB1623086507E5B763C1008CBEFAD170D035775BAD7A4FF02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojNqGc3Zc5qMln5xvmk5an3A==
X-Mailru-Sender: 0A26D9779F8DDEAB5292BC5C4A2F209372733F1AA10A11B1B951B70A5BD4BD8E103F0513A1107EB8BDDB26EEA8DAF3A6210985D6C440852E55B4A2144138A88088F510C62CFD139357C462056C5AD9112068022A3E05D37EB4A721A3011E896F
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4CB1E8E83197BFF842CA3A8D249ED4F83C5BD1728C4FF32B468F3CF0E9FE49B6959AB7659C5DDE2DEBCEDFC9A423E898E8E4CB8C0AE79338B48A0BA594134B869
X-7FA49CB5: 0D63561A33F958A588EC9361796EB5D69D4AFCDFE72AEA169498B130C8598D378941B15DA834481FA18204E546F3947CEE16715F795C715CF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637C3E95B63A1FCE889389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C39B1AFFD6BD8BDD3135872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojNqGc3Zc5qMm/rhtqZxTKFg==
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
 .../gpu/drm/panel/panel-samsung-ams639rq08.c  | 329 ++++++++++++++++++
 3 files changed, 339 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams639rq08.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d3a9a9fafe4e..c5167b4fa589 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -614,6 +614,15 @@ config DRM_PANEL_RONBO_RB070D30
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
index 987a08702410..1a7a2ee394ec 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS639RQ08) += panel-samsung-ams639rq08.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20) += panel-samsung-atna33xc20.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-ams639rq08.c b/drivers/gpu/drm/panel/panel-samsung-ams639rq08.c
new file mode 100644
index 000000000000..817365cb5e46
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-ams639rq08.c
@@ -0,0 +1,329 @@
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
+	struct regulator_bulk_data *supplies;
+};
+
+static const struct regulator_bulk_data ams639rq08_supplies[] = {
+	{ .supply = "vdd3p3" },
+	{ .supply = "vddio" },
+	{ .supply = "vsn" },
+	{ .supply = "vsp" },
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
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	/* Delay 2ms for VCI1 power */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD1, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD2, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_ACCESS_PROT_OFF, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_UNKNOWN_FF, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_ACCESS_PROT_OFF, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_BIAS_CURRENT_CTRL, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD1, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD2, 0xa5, 0xa5);
+
+	/* Sleep Out */
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	usleep_range(10000, 11000);
+
+	/* TE OUT (Vsync On) */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD1, 0x5a, 0x5a);
+
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	/* DBV Smooth Transition */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_UNKNOWN_B7, 0x01, 0x4b);
+
+	/* Edge Dimming Speed Setting */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_ACCESS_PROT_OFF, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_UNKNOWN_B7, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD1, 0xa5, 0xa5);
+
+	/* Page Address Set */
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x0923);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD1, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD2, 0x5a, 0x5a);
+
+	/* Set DDIC internal HFP */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_ACCESS_PROT_OFF, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_BIAS_CURRENT_CTRL, 0x11);
+
+	/* OFC Setting 84.1 Mhz */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe9, 0x11, 0x55,
+					       0xa6, 0x75, 0xa3,
+					       0xb9, 0xa1, 0x4a,
+					       0x00, 0x1a, 0xb8);
+
+	/* Err_FG Setting */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1,
+					       0x00, 0x00, 0x02,
+					       0x02, 0x42, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2,
+					       0x00, 0x00, 0x00,
+					       0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_ACCESS_PROT_OFF, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD1, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD2, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+
+	/* Brightness Control */
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x0000);
+
+	/* Display On */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_msleep(&dsi_ctx, 67);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
+}
+
+static void ams639rq08_off(struct ams639rq08 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+}
+
+static int ams639rq08_prepare(struct drm_panel *panel)
+{
+	struct ams639rq08 *ctx = to_ams639rq08(panel);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ams639rq08_supplies),
+				    ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	ams639rq08_reset(ctx);
+
+	ret = ams639rq08_on(ctx);
+	if (ret < 0) {
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(ams639rq08_supplies),
+				       ctx->supplies);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ams639rq08_unprepare(struct drm_panel *panel)
+{
+	struct ams639rq08 *ctx = to_ams639rq08(panel);
+
+	ams639rq08_off(ctx);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(ams639rq08_supplies),
+			       ctx->supplies);
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
+	ret = devm_regulator_bulk_get_const(&dsi->dev,
+					    ARRAY_SIZE(ams639rq08_supplies),
+					    ams639rq08_supplies,
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
2.46.1

