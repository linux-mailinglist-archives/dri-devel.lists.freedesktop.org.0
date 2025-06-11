Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5821AD5C36
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 18:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C8A10E3CC;
	Wed, 11 Jun 2025 16:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="pOnyoIuw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F0510E6CB
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 16:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1749659639; bh=kfASGtEfe9UwYNbpU0AMhte4id9vbgsrFgVzrBmqIqA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=pOnyoIuwJRUV7/OwOkld3l2Mf8NwtbEXQZmbdiUsi8ENj2VceA/eRbrZm4VsQ6CUc
 Cg+/0bJiqE2+7kxeq7t02YkGhRwedXN2O3ekqVCy7Ate7DbV7m4KScb3ogYvFlACbL
 8e6BXrsd1UAWagPnoVX/sh5i1yHCpsFrUs1bjKrQ=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 11 Jun 2025 18:33:17 +0200
Subject: [PATCH v4 3/4] drm/panel: Add driver for DJN HX83112B LCD panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-fp3-display-v4-3-ef67701e7687@lucaweiss.eu>
References: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
In-Reply-To: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18988; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=kfASGtEfe9UwYNbpU0AMhte4id9vbgsrFgVzrBmqIqA=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSa/zDE0F5QyhggYmwqN6ebwomndHuHIot8STo
 qniVkVDuwqJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEmv8wAKCRBy2EO4nU3X
 VqjaEACHnWoLE03Lp1J21A+m/2GYiHv83j9Vl819Bd/tUqVeP4NS0LQAOPysVMGu/7U9oeKljQ8
 +LP1UfjhzDPGfKmbp20enRd8EJf2MlhCV6FtmFXffoIfaMA0QLIziZmVdNmCyy7jTEyqGnkvJaK
 a/prPxZFvGAn7fAoby2WjrcpZMcyEIbFkiIdJxqfktYWuYML9PxPrlYixPUo6Dv6Gmlm4oPNU3i
 F3TVTDpHLd4OiFtO4vaLXNsNBHMGNo25eTK34vMs0xfJSmI/iAV09mvT9Tsbd6GRaHxvkigfbMf
 wuVCRRzCx6pxC7ZOFUPHLDCNzMD/7vaUtHQSwxzSXC8TopcV8GMNVDMHYk9PROWQhS0I+Jh7AZ4
 xAvwipaud8zO4ehHi5hwC2acFTnMPMzGj0Pux1W2Pqr4BtB7ZmULHf6R3ub7Gg30sdwaSW0cvYD
 R90MpHBs0qKsw8Bk2H1iB+D7lQtEz7UxH88hVHAf87R0bZAG2Y5nOONdlVvsJz5YNt7K9u+wEXl
 cjFQnHgvsF3nW7+0/T/Y1njBY6y1LDfyTFzcQ6r57wrTPpY+q4w4OfgQ7q7hZjsbGXFAkSdCGV8
 1ooLSqI52S5lRy4j/y//vhxCBq/ybEAstvWNX1AXPnBO4t5h+/he5LieG/Xka11l5PCLdMDTuMv
 cJ4j8Dc3SXi064A==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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

Add support for the 2160x1080 LCD panel from DJN (98-03057-6598B-I)
bundled with a HX83112B driver IC, as found on the Fairphone 3
smartphone.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 drivers/gpu/drm/panel/Kconfig                |  10 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-himax-hx83112b.c | 430 +++++++++++++++++++++++++++
 3 files changed, 441 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index cfebb08e8a62680a14a500d28decfafc2daf743a..deee941ffa707f0795f5edd9349eddebc33e0958 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -193,6 +193,16 @@ config DRM_PANEL_HIMAX_HX83112A
 	  Say Y here if you want to enable support for Himax HX83112A-based
 	  display panels, such as the one found in the Fairphone 4 smartphone.
 
+config DRM_PANEL_HIMAX_HX83112B
+	tristate "Himax HX83112B-based DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_KMS_HELPER
+	help
+	  Say Y here if you want to enable support for Himax HX83112B-based
+	  display panels, such as the one found in the Fairphone 3 smartphone.
+
 config DRM_PANEL_HIMAX_HX8394
 	tristate "HIMAX HX8394 MIPI-DSI LCD panels"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 714cbac830e3f0be3659f1907c5dbacef863bbd8..5f61b4542b28d013b6475d1a6b84bfe912551e9c 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX8279) += panel-himax-hx8279.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX83102) += panel-himax-hx83102.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112A) += panel-himax-hx83112a.o
+obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112B) += panel-himax-hx83112b.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
diff --git a/drivers/gpu/drm/panel/panel-himax-hx83112b.c b/drivers/gpu/drm/panel/panel-himax-hx83112b.c
new file mode 100644
index 0000000000000000000000000000000000000000..263f79a967de3ddd474ff5fe6d2b5af6129d4b2f
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-himax-hx83112b.c
@@ -0,0 +1,430 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree.
+ * Copyright (c) 2025 Luca Weiss <luca@lucaweiss.eu>
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+/* Manufacturer specific DSI commands */
+#define HX83112B_SETPOWER1	0xb1
+#define HX83112B_SETDISP	0xb2
+#define HX83112B_SETDRV		0xb4
+#define HX83112B_SETEXTC	0xb9
+#define HX83112B_SETBANK	0xbd
+#define HX83112B_SETDGCLUT	0xc1
+#define HX83112B_SETDISMO	0xc2
+#define HX83112B_UNKNOWN1	0xc6
+#define HX83112B_SETPANEL	0xcc
+#define HX83112B_UNKNOWN2	0xd1
+#define HX83112B_SETPOWER2	0xd2
+#define HX83112B_SETGIP0	0xd3
+#define HX83112B_SETGIP1	0xd5
+#define HX83112B_SETGIP2	0xd6
+#define HX83112B_SETGIP3	0xd8
+#define HX83112B_SETIDLE	0xdd
+#define HX83112B_UNKNOWN3	0xe7
+#define HX83112B_UNKNOWN4	0xe9
+
+struct hx83112b_panel {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator_bulk_data *supplies;
+	struct gpio_desc *reset_gpio;
+};
+
+static const struct regulator_bulk_data hx83112b_supplies[] = {
+	{ .supply = "iovcc" },
+	{ .supply = "vsn" },
+	{ .supply = "vsp" },
+};
+
+static inline struct hx83112b_panel *to_hx83112b_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct hx83112b_panel, panel);
+}
+
+static void hx83112b_reset(struct hx83112b_panel *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int hx83112b_on(struct hx83112b_panel *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETEXTC, 0x83, 0x11, 0x2b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETDISMO, 0x08, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETDISP, 0x04, 0x38, 0x08, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETPOWER1,
+				     0xf8, 0x27, 0x27, 0x00, 0x00, 0x0b, 0x0e,
+				     0x0b, 0x0e, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETPOWER2, 0x2d, 0x2d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETDISP,
+				     0x80, 0x02, 0x18, 0x80, 0x70, 0x00, 0x08,
+				     0x1c, 0x08, 0x11, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN4, 0xd1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETDISP, 0x00, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN4, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETDISP, 0xb5, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETIDLE,
+				     0x00, 0x00, 0x08, 0x1c, 0x08, 0x34, 0x34,
+				     0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETDRV,
+				     0x65, 0x6b, 0x00, 0x00, 0xd0, 0xd4, 0x36,
+				     0xcf, 0x06, 0xce, 0x00, 0xce, 0x00, 0x00,
+				     0x00, 0x07, 0x00, 0x2a, 0x07, 0x01, 0x07,
+				     0x00, 0x00, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN4, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETDRV, 0x01, 0x67, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN4, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETDGCLUT, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETDGCLUT,
+				     0xff, 0xfb, 0xf9, 0xf6, 0xf4, 0xf1, 0xef,
+				     0xea, 0xe7, 0xe5, 0xe2, 0xdf, 0xdd, 0xda,
+				     0xd8, 0xd5, 0xd2, 0xcf, 0xcc, 0xc5, 0xbe,
+				     0xb7, 0xb0, 0xa8, 0xa0, 0x98, 0x8e, 0x85,
+				     0x7b, 0x72, 0x69, 0x5e, 0x53, 0x48, 0x3e,
+				     0x35, 0x2b, 0x22, 0x17, 0x0d, 0x09, 0x07,
+				     0x05, 0x01, 0x00, 0x26, 0xf0, 0x86, 0x25,
+				     0x6e, 0xb6, 0xdd, 0xf3, 0xd8, 0xcc, 0x9b,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETDGCLUT,
+				     0xff, 0xfb, 0xf9, 0xf6, 0xf4, 0xf1, 0xef,
+				     0xea, 0xe7, 0xe5, 0xe2, 0xdf, 0xdd, 0xda,
+				     0xd8, 0xd5, 0xd2, 0xcf, 0xcc, 0xc5, 0xbe,
+				     0xb7, 0xb0, 0xa8, 0xa0, 0x98, 0x8e, 0x85,
+				     0x7b, 0x72, 0x69, 0x5e, 0x53, 0x48, 0x3e,
+				     0x35, 0x2b, 0x22, 0x17, 0x0d, 0x09, 0x07,
+				     0x05, 0x01, 0x00, 0x26, 0xf0, 0x86, 0x25,
+				     0x6e, 0xb6, 0xdd, 0xf3, 0xd8, 0xcc, 0x9b,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETDGCLUT,
+				     0xff, 0xfb, 0xf9, 0xf6, 0xf4, 0xf1, 0xef,
+				     0xea, 0xe7, 0xe5, 0xe2, 0xdf, 0xdd, 0xda,
+				     0xd8, 0xd5, 0xd2, 0xcf, 0xcc, 0xc5, 0xbe,
+				     0xb7, 0xb0, 0xa8, 0xa0, 0x98, 0x8e, 0x85,
+				     0x7b, 0x72, 0x69, 0x5e, 0x53, 0x48, 0x3e,
+				     0x35, 0x2b, 0x22, 0x17, 0x0d, 0x09, 0x07,
+				     0x05, 0x01, 0x00, 0x26, 0xf0, 0x86, 0x25,
+				     0x6e, 0xb6, 0xdd, 0xf3, 0xd8, 0xcc, 0x9b,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETDISMO, 0xc8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETPANEL, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETGIP0,
+				     0x81, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,
+				     0x04, 0x00, 0x01, 0x13, 0x40, 0x04, 0x09,
+				     0x09, 0x0b, 0x0b, 0x32, 0x10, 0x08, 0x00,
+				     0x08, 0x32, 0x10, 0x08, 0x00, 0x08, 0x32,
+				     0x10, 0x08, 0x00, 0x08, 0x00, 0x00, 0x0a,
+				     0x08, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN4, 0xc5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN1, 0xf7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN4, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN4, 0xd4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN1, 0x6e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN4, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN4, 0xef);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETGIP0, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN4, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN4, 0xc8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETGIP0, 0xa1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN4, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETGIP1,
+				     0x18, 0x18, 0x19, 0x18, 0x18, 0x20, 0x18,
+				     0x18, 0x18, 0x10, 0x10, 0x18, 0x18, 0x00,
+				     0x00, 0x18, 0x18, 0x01, 0x01, 0x18, 0x18,
+				     0x28, 0x28, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x2f, 0x2f, 0x30, 0x30, 0x31, 0x31, 0x35,
+				     0x35, 0x36, 0x36, 0x37, 0x37, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0xfc,
+				     0xfc, 0x00, 0x00, 0xfc, 0xfc, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETGIP2,
+				     0x18, 0x18, 0x19, 0x18, 0x18, 0x20, 0x19,
+				     0x18, 0x18, 0x10, 0x10, 0x18, 0x18, 0x00,
+				     0x00, 0x18, 0x18, 0x01, 0x01, 0x18, 0x18,
+				     0x28, 0x28, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x2f, 0x2f, 0x30, 0x30, 0x31, 0x31, 0x35,
+				     0x35, 0x36, 0x36, 0x37, 0x37, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETGIP3,
+				     0xaa, 0xaa, 0xaa, 0xaf, 0xea, 0xaa, 0xaa,
+				     0xaa, 0xaa, 0xaf, 0xea, 0xaa, 0xaa, 0xaa,
+				     0xab, 0xaf, 0xef, 0xaa, 0xaa, 0xaa, 0xaa,
+				     0xaf, 0xea, 0xaa);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETGIP3,
+				     0xaa, 0xaa, 0xab, 0xaf, 0xea, 0xaa, 0xaa,
+				     0xaa, 0xae, 0xaf, 0xea, 0xaa);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETGIP3,
+				     0xaa, 0xaa, 0xaa, 0xaf, 0xea, 0xaa, 0xaa,
+				     0xaa, 0xaa, 0xaf, 0xea, 0xaa);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETGIP3,
+				     0xba, 0xaa, 0xaa, 0xaf, 0xea, 0xaa, 0xaa,
+				     0xaa, 0xaa, 0xaf, 0xea, 0xaa, 0xba, 0xaa,
+				     0xaa, 0xaf, 0xea, 0xaa, 0xaa, 0xaa, 0xaa,
+				     0xaf, 0xea, 0xaa);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN4, 0xe4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN3, 0x17, 0x69);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN4, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN3,
+				     0x09, 0x09, 0x00, 0x07, 0xe8, 0x00, 0x26,
+				     0x00, 0x07, 0x00, 0x00, 0xe8, 0x32, 0x00,
+				     0xe9, 0x0a, 0x0a, 0x00, 0x00, 0x00, 0x01,
+				     0x01, 0x00, 0x12, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN3,
+				     0x02, 0x00, 0x01, 0x20, 0x01, 0x18, 0x08,
+				     0xa8, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN3, 0x20, 0x20, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN3,
+				     0x00, 0xdc, 0x11, 0x70, 0x00, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN4, 0xc9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN3,
+				     0x2a, 0xce, 0x02, 0x70, 0x01, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN4, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112B_UNKNOWN2, 0x27);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x0000);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0x24);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	return dsi_ctx.accum_err;
+}
+
+static int hx83112b_off(struct hx83112b_panel *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	return dsi_ctx.accum_err;
+}
+
+static int hx83112b_prepare(struct drm_panel *panel)
+{
+	struct hx83112b_panel *ctx = to_hx83112b_panel(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(hx83112b_supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	hx83112b_reset(ctx);
+
+	ret = hx83112b_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(hx83112b_supplies), ctx->supplies);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int hx83112b_unprepare(struct drm_panel *panel)
+{
+	struct hx83112b_panel *ctx = to_hx83112b_panel(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = hx83112b_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(hx83112b_supplies), ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode hx83112b_mode = {
+	.clock = (1080 + 40 + 4 + 12) * (2160 + 32 + 2 + 2) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 40,
+	.hsync_end = 1080 + 40 + 4,
+	.htotal = 1080 + 40 + 4 + 12,
+	.vdisplay = 2160,
+	.vsync_start = 2160 + 32,
+	.vsync_end = 2160 + 32 + 2,
+	.vtotal = 2160 + 32 + 2 + 2,
+	.width_mm = 65,
+	.height_mm = 128,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int hx83112b_get_modes(struct drm_panel *panel,
+			      struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &hx83112b_mode);
+}
+
+static const struct drm_panel_funcs hx83112b_panel_funcs = {
+	.prepare = hx83112b_prepare,
+	.unprepare = hx83112b_unprepare,
+	.get_modes = hx83112b_get_modes,
+};
+
+static int hx83112b_bl_update_status(struct backlight_device *bl)
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
+static const struct backlight_ops hx83112b_bl_ops = {
+	.update_status = hx83112b_bl_update_status,
+};
+
+static struct backlight_device *
+hx83112b_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 4095,
+		.max_brightness = 4095,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &hx83112b_bl_ops, &props);
+}
+
+static int hx83112b_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct hx83112b_panel *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct hx83112b_panel, panel,
+				   &hx83112b_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ret = devm_regulator_bulk_get_const(dev,
+					    ARRAY_SIZE(hx83112b_supplies),
+					    hx83112b_supplies,
+					    &ctx->supplies);
+	if (ret < 0)
+		return ret;
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
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS |
+			  MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_LPM;
+
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = hx83112b_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
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
+static void hx83112b_remove(struct mipi_dsi_device *dsi)
+{
+	struct hx83112b_panel *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id hx83112b_of_match[] = {
+	{ .compatible = "djn,98-03057-6598b-i" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, hx83112b_of_match);
+
+static struct mipi_dsi_driver hx83112b_driver = {
+	.probe = hx83112b_probe,
+	.remove = hx83112b_remove,
+	.driver = {
+		.name = "panel-himax-hx83112b",
+		.of_match_table = hx83112b_of_match,
+	},
+};
+module_mipi_dsi_driver(hx83112b_driver);
+
+MODULE_DESCRIPTION("DRM driver for hx83112b-equipped DSI panels");
+MODULE_LICENSE("GPL");

-- 
2.49.0

