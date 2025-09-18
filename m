Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F99DB58F07
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 09:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14F710E6A6;
	Tue, 16 Sep 2025 07:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="l0WfkVSM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FB010E606
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 02:32:46 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1757989965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oiOCKx20vaIFqmnLmrqVV2MDQFuD7U1kdDdocFeOCic=;
 b=l0WfkVSMvn4Vpz2DYLitReJPuS+ytOLB/Ub7Ler0RztF5x/cWCFFVB/gjtmKLjc79p3n2J
 vBvm/rFCdwcXx6YHXIKpD5VlqjGI4u/oTG1AUZ+J4CijDLhe1Rb3nsuIHmPUlb0x/jaVZV
 elpjaGvx2cbsC+DjctFYd6Vz5IpTZi3FHZwrKyeoWqeQzc4GUGvv1feJVAXE6wMYFVh5mG
 LacwZ0UzqmvS0FnzbnRxOhx1XGauM4t7SOldsa8Yu4IkCqunW7EfynrQ1j5c7TrmPy/l9t
 Mc+8IfOXbLT8C4ti1djitawuw7KrBrCEh+Oj3WiCSRR3leELVKa95ueMTPL4Nw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 15 Sep 2025 19:32:13 -0700
Subject: [PATCH v2 2/3] drm: panel: Add LG SW49410 Panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-judyln-panel-v2-2-01ab2199fea5@postmarketos.org>
References: <20250915-judyln-panel-v2-0-01ab2199fea5@postmarketos.org>
In-Reply-To: <20250915-judyln-panel-v2-0-01ab2199fea5@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 phone-devel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757989951; l=20338;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=re8gv2fBP018DNrWN2yWpxBmLNcDEFjmj3RvMld4C2M=;
 b=+G3xxjyN/cRiZw1f91P8L2MfaU5mB5AP1rFq/+eYa/aw+j8ZZWN+dkd32JEj9H/hRssfU6E6U
 fhu2Ti6JJMRCd1xjLgaJl2sZ+KKqfK/If4k3fnsUls0pNUiV1g0H0/m
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 16 Sep 2025 07:21:33 +0000
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

From: Amir Dahan <system64fumo@protonmail.com>

Added panel driver used by LG G7 ThinQ (judyln)

Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
Co-developed-by: Paul Sajna <sajattack@postmarketos.org>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/gpu/drm/panel/Kconfig            |  13 +
 drivers/gpu/drm/panel/Makefile           |   1 +
 drivers/gpu/drm/panel/panel-lg-sw49410.c | 502 +++++++++++++++++++++++++++++++
 3 files changed, 516 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index cfebb08e8a62680a14a500d28decfafc2daf743a..a369e3e009de0df0226b7180d05f8554ea743401 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -406,6 +406,19 @@ config DRM_PANEL_LG_SW43408
 	  pixel. It provides a MIPI DSI interface to the host and has a
 	  built-in LED backlight.
 
+config DRM_PANEL_LG_SW49410
+	tristate "LG SW49410 panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DSC_HELPER
+	select DRM_DISPLAY_HELPER
+	help
+	  Say Y here if you want to enable support for LG sw49410 panel.
+	  The panel has a 1440x3120@60Hz resolution and uses 24 bit RGB per
+	  pixel. It provides a MIPI DSI interface to the host and has a
+	  built-in LED backlight.
+
 config DRM_PANEL_MAGNACHIP_D53E6EA8966
 	tristate "Magnachip D53E6EA8966 DSI panel"
 	depends on OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 714cbac830e3f0be3659f1907c5dbacef863bbd8..f7f6d232ad9c7163f328d94f4461fcb3379f998b 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_DRM_PANEL_LINCOLNTECH_LCD197) += panel-lincolntech-lcd197.o
 obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
 obj-$(CONFIG_DRM_PANEL_LG_SW43408) += panel-lg-sw43408.o
+obj-$(CONFIG_DRM_PANEL_LG_SW49410) += panel-lg-sw49410.o
 obj-$(CONFIG_DRM_PANEL_MAGNACHIP_D53E6EA8966) += panel-magnachip-d53e6ea8966.o
 obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
 obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3051D) += panel-newvision-nv3051d.o
diff --git a/drivers/gpu/drm/panel/panel-lg-sw49410.c b/drivers/gpu/drm/panel/panel-lg-sw49410.c
new file mode 100644
index 0000000000000000000000000000000000000000..781ca2b82afcd82b13f443ccb1a0dac29c069c3b
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-lg-sw49410.c
@@ -0,0 +1,502 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+// Copyright (c) 2025, The Linux Foundation. All rights reserved.
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
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
+
+struct sw49410_panel {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct drm_dsc_config dsc;
+	struct gpio_desc *reset_gpio;
+};
+
+static inline
+struct sw49410_panel *to_sw49410_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct sw49410_panel, panel);
+}
+
+static void sw49410_panel_reset(struct sw49410_panel *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int sw49410_panel_on(struct sw49410_panel *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+	struct drm_dsc_picture_parameter_set pps;
+
+	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x0c2f);
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x00ff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0x2c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x81);
+
+	/*Manufacturer protection*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0xac);
+
+	/*Source Control*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3,
+				     0x04, 0x04, 0x28, 0x08, 0x5a, 0x12, 0x23,
+				     0x02);
+
+	/*Gate & Mux Control*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4,
+				     0x11, 0x04, 0x02, 0x02, 0x02, 0x02, 0x02,
+				     0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0xd0,
+				     0xe4, 0xe4, 0xe4, 0x93, 0x4e, 0x39, 0x0a,
+				     0x10, 0x18, 0x25, 0x24, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00);
+
+	/*Sync Setup*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5,
+				     0x2e, 0x0f, 0x10, 0xc0, 0x00, 0x10, 0xc0,
+				     0x00);
+
+	/*Panel Setting*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6,
+				     0x03, 0x05, 0x0b, 0xb3, 0x30);
+
+	/*Touch Timing Control*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8,
+				     0x57, 0x02, 0x90, 0x40, 0x5d, 0xd0, 0x05,
+				     0x00, 0x00, 0x18, 0x22, 0x04, 0x01, 0x02,
+				     0x90, 0x40, 0x4c, 0xc0, 0x04, 0x00, 0x00,
+				     0x18, 0x22, 0x04, 0x01, 0x08, 0x00, 0x3a,
+				     0x86, 0x83, 0x00);
+
+	/*Touch Source Setting*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9,
+				     0x64, 0x64, 0x2a, 0x3f, 0xee);
+
+	/*DSC Configuration*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x3d, 0x1f, 0x01, 0xff, 0x01, 0x3c, 0x1f,
+				     0x01, 0xff, 0x01, 0x00);
+
+	/*Low Rate Refresh Setting*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbc, 0x00, 0x00, 0x00, 0x90);
+
+	/*Black Frame Setting*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbd, 0x00, 0x00);
+
+	/* U2 Corner Down */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbf, 0x4f, 0x02);
+
+	/*Internal Oscillator Setting*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0,
+				     0x00, 0x04, 0x18, 0x07, 0x11, 0x11, 0x3c,
+				     0x00, 0x0a, 0x0a);
+
+	/*Power Control1*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1,
+				     0x01, 0x00, 0xf0, 0xc2, 0xcf, 0x0c);
+
+	/*Power Control2*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2,
+				     0xcc, 0x44, 0x44, 0x20, 0x22, 0x26, 0x21,
+				     0x00);
+
+	/*Power Control3*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3,
+				     0x92, 0x11, 0x09, 0x09, 0x11, 0xcc, 0x02,
+				     0x02, 0xa4, 0xa4, 0x02, 0xa2, 0x38, 0x28,
+				     0x14, 0x40, 0x38, 0xc0);
+
+	/*Vcom Setting*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4, 0x26, 0x00);
+
+	/*Power Sequence Option Configuration*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc9,
+				     0x05, 0x5d, 0x03, 0x04, 0x00);
+
+	/*Abrupt Power Off Control*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0x9b, 0x10);
+
+	/*LFD Control*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcb,
+				     0xf3, 0x90, 0x3d, 0x30, 0xcc);
+
+	/*Tail TFT Setting*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcc,
+				     0x00, 0x40, 0x50, 0x90, 0x41);
+
+	/*U2 Option*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xce, 0x00, 0x00);
+
+	/*Gamma*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd0,
+				     0x12, 0x05, 0x20, 0x1b, 0x2c, 0x28, 0x3f,
+				     0x3d, 0x4f, 0x4f, 0x66, 0x66, 0x6e, 0x6e,
+				     0x76, 0x76, 0x80, 0x80, 0x88, 0x88, 0x95,
+				     0x95, 0x3f, 0x3f, 0xa2, 0xa2, 0x94, 0x94,
+				     0x8b, 0x8b, 0x81, 0x81, 0x75, 0x75, 0x66,
+				     0x66, 0x47, 0x47, 0x2d, 0x2d, 0x00, 0x01,
+				     0x12, 0x05, 0x20, 0x1b, 0x2c, 0x28, 0x3f,
+				     0x3d, 0x4f, 0x4f, 0x66, 0x66, 0x6e, 0x6e,
+				     0x76, 0x76, 0x80, 0x80, 0x88, 0x88, 0x95,
+				     0x95, 0x3f, 0x3f, 0xa2, 0xa2, 0x94, 0x94,
+				     0x8b, 0x8b, 0x81, 0x81, 0x75, 0x75, 0x66,
+				     0x66, 0x47, 0x47, 0x2d, 0x2d, 0x00, 0x01,
+				     0x12, 0x05, 0x20, 0x1b, 0x2c, 0x28, 0x3f,
+				     0x3d, 0x4f, 0x4f, 0x66, 0x66, 0x6e, 0x6e,
+				     0x76, 0x76, 0x80, 0x80, 0x88, 0x88, 0x95,
+				     0x95, 0x3f, 0x3f, 0xa2, 0xa2, 0x94, 0x94,
+				     0x8b, 0x8b, 0x81, 0x81, 0x75, 0x75, 0x66,
+				     0x66, 0x47, 0x47, 0x2d, 0x2d, 0x00, 0x01,
+				     0x12, 0x05, 0x20, 0x1b, 0x2c, 0x28, 0x3f,
+				     0x3d, 0x4f, 0x4f, 0x66, 0x66, 0x6e, 0x6e,
+				     0x76, 0x76, 0x80, 0x80, 0x88, 0x88, 0x94,
+				     0x94, 0x3f, 0x3f, 0xa4, 0xa4, 0x95, 0x95,
+				     0x8b, 0x8b, 0x81, 0x81, 0x75, 0x75, 0x66,
+				     0x66, 0x47, 0x47, 0x2d, 0x2d, 0x00, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd1,
+				     0x12, 0x05, 0x20, 0x1b, 0x2e, 0x29, 0x41,
+				     0x3f, 0x52, 0x52, 0x6a, 0x6a, 0x72, 0x72,
+				     0x7a, 0x7a, 0x84, 0x84, 0x8c, 0x8c, 0x9a,
+				     0x9a, 0x3f, 0x3f, 0x9b, 0x9b, 0x8d, 0x8d,
+				     0x84, 0x84, 0x7a, 0x7a, 0x6e, 0x6e, 0x5f,
+				     0x5f, 0x41, 0x41, 0x2a, 0x2a, 0x00, 0x01,
+				     0x12, 0x05, 0x20, 0x1b, 0x2e, 0x29, 0x41,
+				     0x3f, 0x52, 0x52, 0x6a, 0x6a, 0x72, 0x72,
+				     0x7a, 0x7a, 0x84, 0x84, 0x8c, 0x8c, 0x9a,
+				     0x9a, 0x3f, 0x3f, 0x9b, 0x9b, 0x8d, 0x8d,
+				     0x84, 0x84, 0x7a, 0x7a, 0x6e, 0x6e, 0x5f,
+				     0x5f, 0x41, 0x41, 0x2a, 0x2a, 0x00, 0x01,
+				     0x12, 0x05, 0x20, 0x1b, 0x2e, 0x29, 0x41,
+				     0x3f, 0x52, 0x52, 0x6a, 0x6a, 0x72, 0x72,
+				     0x7a, 0x7a, 0x84, 0x84, 0x8c, 0x8c, 0x9a,
+				     0x9a, 0x3f, 0x3f, 0x9b, 0x9b, 0x8d, 0x8d,
+				     0x84, 0x84, 0x7a, 0x7a, 0x6e, 0x6e, 0x5f,
+				     0x5f, 0x41, 0x41, 0x2a, 0x2a, 0x00, 0x01,
+				     0x12, 0x05, 0x20, 0x1b, 0x2e, 0x29, 0x41,
+				     0x3f, 0x52, 0x52, 0x6a, 0x6a, 0x72, 0x72,
+				     0x7a, 0x7a, 0x84, 0x84, 0x8c, 0x8c, 0x9a,
+				     0x9a, 0x3f, 0x3f, 0x9b, 0x9b, 0x8d, 0x8d,
+				     0x84, 0x84, 0x7a, 0x7a, 0x6e, 0x6e, 0x5f,
+				     0x5f, 0x41, 0x41, 0x2a, 0x2a, 0x00, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd2,
+				     0x12, 0x05, 0x20, 0x1b, 0x2f, 0x2a, 0x43,
+				     0x41, 0x55, 0x55, 0x6e, 0x6e, 0x76, 0x76,
+				     0x7e, 0x7e, 0x88, 0x88, 0x90, 0x90, 0x9f,
+				     0x9f, 0x3f, 0x3f, 0x95, 0x95, 0x86, 0x86,
+				     0x7d, 0x7d, 0x74, 0x74, 0x68, 0x68, 0x59,
+				     0x59, 0x3c, 0x3c, 0x26, 0x26, 0x00, 0x01,
+				     0x12, 0x05, 0x20, 0x1b, 0x2f, 0x2a, 0x43,
+				     0x41, 0x55, 0x55, 0x6e, 0x6e, 0x76, 0x76,
+				     0x7e, 0x7e, 0x88, 0x88, 0x90, 0x90, 0x9f,
+				     0x9f, 0x3f, 0x3f, 0x95, 0x95, 0x86, 0x86,
+				     0x7d, 0x7d, 0x74, 0x74, 0x68, 0x68, 0x59,
+				     0x59, 0x3c, 0x3c, 0x26, 0x26, 0x00, 0x01,
+				     0x12, 0x05, 0x20, 0x1b, 0x2f, 0x2a, 0x43,
+				     0x41, 0x55, 0x55, 0x6e, 0x6e, 0x76, 0x76,
+				     0x7e, 0x7e, 0x88, 0x88, 0x90, 0x90, 0x9f,
+				     0x9f, 0x3f, 0x3f, 0x95, 0x95, 0x86, 0x86,
+				     0x7d, 0x7d, 0x74, 0x74, 0x68, 0x68, 0x59,
+				     0x59, 0x3c, 0x3c, 0x26, 0x26, 0x00, 0x01,
+				     0x12, 0x05, 0x20, 0x1b, 0x2f, 0x2a, 0x43,
+				     0x41, 0x55, 0x55, 0x6e, 0x6e, 0x76, 0x76,
+				     0x7e, 0x7e, 0x88, 0x88, 0x90, 0x90, 0x9f,
+				     0x9f, 0x3f, 0x3f, 0x95, 0x95, 0x86, 0x86,
+				     0x7d, 0x7d, 0x74, 0x74, 0x68, 0x68, 0x59,
+				     0x59, 0x3c, 0x3c, 0x26, 0x26, 0x00, 0x01);
+
+	/* MPLUS Control */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd3, 0x12, 0x01, 0x00, 0x00);
+
+	/*Mplus Setting*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd4,
+				     0xdc, 0x5f, 0x9c, 0xbe, 0x39, 0x39, 0x39,
+				     0x47, 0x48, 0x48, 0x48, 0x3a, 0x00, 0x03,
+				     0x6d, 0x80, 0x00, 0x00, 0x8c, 0x66, 0x00,
+				     0x00, 0x8c, 0x66, 0x00, 0x00, 0x8c, 0x66,
+				     0x00, 0x0a, 0x48, 0x80, 0x00, 0x0a, 0x48,
+				     0x80, 0x00, 0x0a, 0x48, 0x80, 0x00, 0x0a,
+				     0x48, 0x80, 0x20, 0x0a, 0x14, 0x0a, 0x18,
+				     0x00, 0x1c, 0xcc, 0x23, 0x9e, 0x23, 0x9e,
+				     0x01, 0x01, 0x01, 0x01, 0x04, 0x04, 0x04,
+				     0x04, 0x01, 0x00, 0x02, 0x80, 0x00, 0x10,
+				     0x00, 0x10, 0x00, 0x10, 0x13, 0x9e, 0x13,
+				     0x9e, 0x13, 0x9e, 0x13, 0x9e, 0x05, 0x05,
+				     0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x23,
+				     0x9e, 0xff, 0xff, 0x13, 0x33, 0x18, 0x00,
+				     0x16, 0x66, 0x10, 0x00, 0xff, 0x01, 0x00,
+				     0x02, 0x00, 0x03, 0x00, 0x04, 0x00, 0x05,
+				     0x00, 0x06, 0x00, 0x07, 0x00, 0x08, 0x00,
+				     0x09, 0x00, 0x0a, 0x00, 0x0b, 0x00, 0x0c,
+				     0x00, 0x0d, 0x00, 0x0e, 0x00, 0x0f, 0x00,
+				     0x1b, 0x25, 0xdc, 0x18, 0x00, 0x20, 0x00,
+				     0x1c, 0xe1, 0x00, 0xff, 0xe0, 0xc8, 0xc8,
+				     0x41, 0x8f);
+
+	/*Notch Up Gradation*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xad,
+				     0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x06,
+				     0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
+				     0x06, 0x06, 0x20, 0x40, 0x60, 0x90, 0xc0,
+				     0xf0, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+				     0xff, 0xff, 0xff, 0xff);
+
+	/*Notch Down Gradation*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xae,
+				     0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x06,
+				     0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
+				     0x06, 0x06, 0x20, 0x40, 0x60, 0x90, 0xc0,
+				     0xf0, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+				     0xff, 0xff, 0xff, 0xff);
+
+	/*GIP Setting*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe5,
+				     0x0b, 0x0a, 0x0c, 0x00, 0x02, 0x04, 0x06,
+				     0x08, 0x0f, 0x1b, 0x02, 0x1a, 0x1a, 0x0b,
+				     0x0a, 0x0c, 0x01, 0x03, 0x05, 0x07, 0x09,
+				     0x10, 0x1b, 0x03, 0x1a, 0x1a);
+
+	/*Mux Setting*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6,
+				     0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
+				     0x18, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16,
+				     0x17, 0x18);
+
+	/*Test1*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xed,
+				     0x21, 0x49, 0x00, 0x00, 0x00, 0x00);
+
+	/*BLU Control*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x81);
+
+	/*Sharpness*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3,
+				     0x00, 0x01, 0x00, 0x0d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4,
+				     0x00, 0x00, 0x40, 0x83, 0xc5, 0x00, 0x01,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb,
+				     0x20, 0x40, 0x60, 0x80, 0xa0, 0xc0, 0xe0,
+				     0x13, 0x18, 0x18, 0x18, 0x16, 0x0d, 0x0d,
+				     0x00, 0xc7, 0xcf, 0xd8, 0xe1, 0xea, 0xf3,
+				     0xf9, 0xff);
+
+	/*Gamma Correction*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf5, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf6,
+				     0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40,
+				     0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf7,
+				     0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40,
+				     0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8,
+				     0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40,
+				     0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00);
+
+	/*BLU PWM Control*/
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc,
+				     0x13, 0x70, 0xd0, 0x26, 0x30, 0x7c, 0x02,
+				     0xff, 0x12, 0x22, 0x22, 0x10, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_ENTER_NORMAL_MODE);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 128);
+
+	// Black frame setting
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbd, 0x01, 0x05);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 5000, 6000);
+
+	drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
+
+	mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
+	mipi_dsi_compression_mode_multi(&dsi_ctx, true);
+	mipi_dsi_msleep(&dsi_ctx, 28);
+
+	return dsi_ctx.accum_err;
+}
+
+static int sw49410_panel_off(struct sw49410_panel *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 128);
+
+	return dsi_ctx.accum_err;
+}
+
+static int sw49410_panel_prepare(struct drm_panel *panel)
+{
+	struct sw49410_panel *ctx = to_sw49410_panel(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	sw49410_panel_reset(ctx);
+
+	ret = sw49410_panel_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int sw49410_panel_unprepare(struct drm_panel *panel)
+{
+	struct sw49410_panel *ctx = to_sw49410_panel(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = sw49410_panel_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	return 0;
+}
+
+static const struct drm_display_mode sw49410_panel_mode = {
+	.clock = (1440 + 168 + 4 + 84) * (3120 + 2 + 18 + 18) * 60 / 1000,
+	.hdisplay = 1440,
+	.hsync_start = 1440 + 168,
+	.hsync_end = 1440 + 168 + 4,
+	.htotal = 1440 + 168 + 4 + 84,
+	.vdisplay = 3120,
+	.vsync_start = 3120 + 2,
+	.vsync_end = 3120 + 2 + 18,
+	.vtotal = 3120 + 2 + 18 + 18,
+	.width_mm = 65,
+	.height_mm = 140,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static int sw49410_panel_get_modes(struct drm_panel *panel,
+						struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &sw49410_panel_mode);
+}
+
+static const struct drm_panel_funcs sw49410_panel_panel_funcs = {
+	.prepare = sw49410_panel_prepare,
+	.unprepare = sw49410_panel_unprepare,
+	.get_modes = sw49410_panel_get_modes,
+};
+
+static int sw49410_panel_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct sw49410_panel *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	drm_panel_init(&ctx->panel, dev, &sw49410_panel_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	/* This panel only supports DSC; unconditionally enable it */
+	dsi->dsc = &ctx->dsc;
+
+	ctx->dsc.dsc_version_major = 1;
+	ctx->dsc.dsc_version_minor = 1;
+
+	ctx->dsc.slice_height = 60;
+	ctx->dsc.slice_width = 720;
+
+	WARN_ON(1440 % ctx->dsc.slice_width);
+	ctx->dsc.slice_count = 1440 / ctx->dsc.slice_width;
+	ctx->dsc.bits_per_component = 8;
+	ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
+	ctx->dsc.block_pred_enable = true;
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		drm_panel_remove(&ctx->panel);
+		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void sw49410_panel_remove(struct mipi_dsi_device *dsi)
+{
+	struct sw49410_panel *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id sw49410_of_match[] = {
+	{ .compatible = "lg,sw49410" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sw49410_of_match);
+
+static struct mipi_dsi_driver sw49410_panel_driver = {
+	.driver = {
+		.name = "panel-lg-sw49410",
+		.of_match_table = sw49410_of_match,
+	},
+	.probe = sw49410_panel_probe,
+	.remove = sw49410_panel_remove,
+};
+module_mipi_dsi_driver(sw49410_panel_driver);
+
+MODULE_AUTHOR("Amir Dahan <system64fumo@protonmail.com>");
+MODULE_DESCRIPTION("DRM driver for SW49410 DSI panel");
+MODULE_LICENSE("GPL");

-- 
2.51.0

