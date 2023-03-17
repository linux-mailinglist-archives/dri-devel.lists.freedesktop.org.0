Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012A46BF640
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 00:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B7D10E2A0;
	Fri, 17 Mar 2023 23:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E055F10E285
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 23:24:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C72E60C8B;
 Fri, 17 Mar 2023 23:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C095C4339E;
 Fri, 17 Mar 2023 23:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679095442;
 bh=qL80OSKOjY+h3c9Ry29E/ayqErdLzYcV34ROf0tHBDY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h8drLyvJkin6H/hSa2hYvg9l1/P54zrIrPm8BwDfjW2avtpx0qfDlsq/0CzB7fldt
 SfyMmtTUFZiyTNmUd0cjKygtSXGEMU1HRkoprJ4QX8PnCmZRI+v0K1Xk/vAEwU597T
 HlN7xp0SQRcariffFlcRIWK0+hWRMxzbDwV+dM7nIfH35gx+qVTQg6ksaDz/jZmmWy
 IVr3IF+25kO3PVYdKAGxfY4OgAjGwq8bg+BVv9J0ft50QXNQiuRKsqAl7j0cZ4ZA0s
 VbSkILd//S1S0A/MQ81wZpFhyBROikEng/CThsKCSoBDZcaYfvQI1hxyCfmdU8iPiZ
 QDK//KdENF6tQ==
Received: by mercury (Postfix, from userid 1000)
 id E62431062108; Sat, 18 Mar 2023 00:23:57 +0100 (CET)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCHv1 7/7] drm/panel: sitronix-st7789v: add Inanbo T28CP45TN89
 support
Date: Sat, 18 Mar 2023 00:23:55 +0100
Message-Id: <20230317232355.1554980-8-sre@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317232355.1554980-1-sre@kernel.org>
References: <20230317232355.1554980-1-sre@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UNI-T UTi260b has a Inanbo T28CP45TN89 v17 panel. I could not find
proper documentation for the panel apart from a technical drawing, but
according to the vendor U-Boot it is based on a Sitronix st7789v chip.
I generated the init sequence by modifying the default one until proper
graphics output has been seen on the device.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index a62a2f5737e4..90f70eb84f11 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -10,6 +10,7 @@
 #include <linux/spi/spi.h>
 
 #include <video/mipi_display.h>
+#include <linux/media-bus-format.h>
 
 #include <drm/drm_device.h>
 #include <drm/drm_modes.h>
@@ -113,6 +114,8 @@ struct st7789v;
 struct st7789_panel_info {
 	const struct drm_display_mode *mode;
 	int (*init_sequence)(struct st7789v *ctx);
+	unsigned int bpc;
+	u32 bus_format;
 };
 
 struct st7789v {
@@ -174,6 +177,20 @@ static const struct drm_display_mode default_mode = {
 	.height_mm = 103,
 };
 
+static const struct drm_display_mode t28cp45tn89_mode = {
+	.clock = 6008,
+	.hdisplay = 240,
+	.hsync_start = 240 + 38,
+	.hsync_end = 240 + 38 + 10,
+	.htotal = 240 + 38 + 10 + 10,
+	.vdisplay = 320,
+	.vsync_start = 320 + 8,
+	.vsync_end = 320 + 8 + 4,
+	.vtotal = 320 + 8 + 4 + 4,
+	.width_mm = 43,
+	.height_mm = 57,
+};
+
 static int init_sequence_default(struct st7789v *ctx) {
 	int ret;
 
@@ -283,11 +300,125 @@ static int init_sequence_default(struct st7789v *ctx) {
 	return 0;
 }
 
+static int init_sequence_t28cp45tn89(struct st7789v *ctx) {
+	int ret;
+
+	ST7789V_TEST(ret, st7789v_write_command(ctx,
+						MIPI_DCS_SET_ADDRESS_MODE));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, 0));
+
+	ST7789V_TEST(ret, st7789v_write_command(ctx,
+						MIPI_DCS_SET_PIXEL_FORMAT));
+	ST7789V_TEST(ret, st7789v_write_data(ctx,
+					     (MIPI_DCS_PIXEL_FMT_16BIT << 4) |
+					     (MIPI_DCS_PIXEL_FMT_16BIT)));
+
+	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_PORCTRL_CMD));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, 0xc));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, 0xc));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, 0));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PORCTRL_IDLE_BP(3) |
+					     ST7789V_PORCTRL_IDLE_FP(3)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx,
+					     ST7789V_PORCTRL_PARTIAL_BP(3) |
+					     ST7789V_PORCTRL_PARTIAL_FP(3)));
+
+	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_GCTRL_CMD));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_GCTRL_VGLS(5) |
+					     ST7789V_GCTRL_VGHS(3)));
+
+	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_VCOMS_CMD));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, 0x2b));
+
+	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_LCMCTRL_CMD));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_LCMCTRL_XMH |
+					     ST7789V_LCMCTRL_XMX |
+					     ST7789V_LCMCTRL_XBGR));
+
+	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_VDVVRHEN_CMD));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_VDVVRHEN_CMDEN));
+
+	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_VRHS_CMD));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, 0xf));
+
+	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_VDVS_CMD));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, 0x20));
+
+	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_FRCTRL2_CMD));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, 0xf));
+
+	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_PWCTRL1_CMD));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PWCTRL1_MAGIC));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PWCTRL1_AVDD(2) |
+					     ST7789V_PWCTRL1_AVCL(2) |
+					     ST7789V_PWCTRL1_VDS(1)));
+
+	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_PVGAMCTRL_CMD));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP63(0xd)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP1(0xca)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP2(0xe)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP4(8)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP6(9)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP13(7)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP20(0x2d)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP27(0xb) |
+					     ST7789V_PVGAMCTRL_VP36(3)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP43(0x3d)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_JP1(3) |
+					     ST7789V_PVGAMCTRL_VP50(4)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP57(0xa)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP59(0xa)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP61(0x1b)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP62(0x28)));
+
+	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_NVGAMCTRL_CMD));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN63(0xd)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN1(0xca)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN2(0xf)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN4(8)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN6(8)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN13(7)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN20(0x2e)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN27(0xc) |
+					     ST7789V_NVGAMCTRL_VN36(5)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN43(0x40)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_JN1(3) |
+					     ST7789V_NVGAMCTRL_VN50(4)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN57(9)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN59(0xb)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN61(0x1b)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN62(0x28)));
+
+	ST7789V_TEST(ret, st7789v_write_command(ctx, MIPI_DCS_EXIT_INVERT_MODE));
+
+	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_RAMCTRL_CMD));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RAMCTRL_DM_RGB |
+					     ST7789V_RAMCTRL_RM_RGB));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RAMCTRL_EPF(3) |
+					     ST7789V_RAMCTRL_MAGIC));
+
+	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_RGBCTRL_CMD));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_WO |
+					     ST7789V_RGBCTRL_RCM(2) |
+					     ST7789V_RGBCTRL_VSYNC_HIGH));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_VBP(8)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_HBP(20)));
+
+	return 0;
+}
+
 struct st7789_panel_info default_panel = {
 	.mode = &default_mode,
 	.init_sequence = init_sequence_default,
 };
 
+struct st7789_panel_info t28cp45tn89_panel = {
+	.mode = &t28cp45tn89_mode,
+	.init_sequence = init_sequence_t28cp45tn89,
+	.bpc = 6,
+	.bus_format = MEDIA_BUS_FMT_RGB565_1X16,
+};
+
 static int st7789v_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
@@ -307,8 +438,12 @@ static int st7789v_get_modes(struct drm_panel *panel,
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 	drm_mode_probed_add(connector, mode);
 
+	connector->display_info.bpc = ctx->info->bpc;
 	connector->display_info.width_mm = ctx->info->mode->width_mm;
 	connector->display_info.height_mm = ctx->info->mode->height_mm;
+	if (ctx->info->bus_format)
+		drm_display_info_set_bus_formats(&connector->display_info,
+						 &ctx->info->bus_format, 1);
 
 	return 1;
 }
@@ -417,12 +552,14 @@ static void st7789v_remove(struct spi_device *spi)
 
 static const struct spi_device_id st7789v_spi_id[] = {
 	{ "st7789v", (unsigned long) &default_panel },
+	{ "t28cp45tn89-v17", (unsigned long) &t28cp45tn89_panel },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, st7789v_spi_id);
 
 static const struct of_device_id st7789v_of_match[] = {
 	{ .compatible = "sitronix,st7789v", .data = &default_panel },
+	{ .compatible = "inanbo,t28cp45tn89-v17", .data = &t28cp45tn89_panel },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, st7789v_of_match);
-- 
2.39.2

