Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE496AAFD30
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 16:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA0F10E3AF;
	Thu,  8 May 2025 14:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XDTWhdmq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687E810E3AF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 14:35:01 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a0b0dd3b5bso67917f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 07:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746714900; x=1747319700; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tbCbkXsD7YNzb32rDK+QilQgXnhU1hEkB5ht6gWz7/s=;
 b=XDTWhdmqdHYxiRiLIxuIiDkoV14OHpHzfZfxitegnOzIG7YvHBpAczn1Q9lRGV/+sP
 i+grlUukTj0t1/CEbf/NKNUzULzUCc2qlB2O7P4ZLYe6P2SaYpuerr5tX+7Yt+ykPYbB
 ORNkudGLC0BFyM/JfFULORstDExlcYvowgwfa4yOkKj/PEwPAUMsJipniVT5Q/MS6Sdr
 hiHYQmKxPZJuTjLkn6Dk29FLLQeESpe9q5Zj6RlJKqhIXy8ffaZ9RPl3xr7LtcW6MIEq
 JHckyQmYmrdx3FRjLiJuaQNCey0ha4kPkcv/0XEBhXNmNSFGpp6p1AHxy9tAwKGmhdJb
 46Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746714900; x=1747319700;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tbCbkXsD7YNzb32rDK+QilQgXnhU1hEkB5ht6gWz7/s=;
 b=Vi0WjCqFSGzAGauSDcTnUd2l3FdG6HZ0rV/XY9G6Pn4tWkHjCzEsJBRfvmc6P9tq/C
 AOWggQ1+WqEY9aRYpJg2zHtQCI3iwH+qaqUk5msP6r8bMMtWMstuzqmHgXkqDcgnig9g
 ztDppcgWUmfbyAP7VbhKZcHZk83+WuAAlXCZ1q7ITBphO+NJOdsz6XF53upc0aVcyAZJ
 D7MyCagdDLpuKqC+i6O1JbHWTjACaJfzmQhxsXoX5/Gu61cCL3FB3JJbDCT9onnkFGBV
 30SQWchy7Sp80+84nLZJcJhNYkDkjC90qKbRqjXKLQbLNh1WmtLUGVvsgaoiVb41//xQ
 u8Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBjWh+NG3lrKjOp6MTx1CfOAO91LLWTnKVVT8DwcuwBYK3HGwn2QePOq46o6cNjq0hKRjQE/z8okU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxviTwDCvYg3LuH+T0l39GGSFKPByYailhLz366NX0erJ9ILyEF
 EduUZwlCA5B/XDqvZBIiU/aLXhCBp7ulDZJbI/E/gs50RuxbaLUCV70riG/niYI=
X-Gm-Gg: ASbGncuuoiTu68i1UfRUy25OemXNAKhaUKJ4QwohSekLg7mjGR1kCpAeQ8ql6Q0Ayng
 wD/TwCNBITa90dp0YBxkIS/KUmh5iwTIcf4VBcZKOenJfmB9WEilPX2Omv45miFX9CLRw4V+atK
 Lv9JRQQbrGKsFWR943XVLRbRb+0JsMVwgPQgKVYGpaiUqI01TcyYGuvRDxbNLrdehuqVaHqHGTn
 k8g8tKWqqZgk3iAtQgUMTiRGFJzi2CPzS2NNo+hwJFmLbDPxmS5r+SWzfNy2XHhdIjgtujwNKUu
 F6EH3h5sj5vHC+SvTmnD7CuPFRJiTHecdqU13k4m1C7fUZdu518fE7gJ8XMfHy3WiJ+gHQ==
X-Google-Smtp-Source: AGHT+IHKRFzeVuZR32ohV+1cEUWHG3h4+XKyCO0FbtcmqDReT7lEHTU+FqvRRyJN5aC5lQ1kGCe+VQ==
X-Received: by 2002:a05:6000:4212:b0:3a0:ba77:fde with SMTP id
 ffacd0b85a97d-3a1f5c6102bmr40669f8f.8.1746714899898; 
 Thu, 08 May 2025 07:34:59 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58ec98dsm149861f8f.25.2025.05.08.07.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 07:34:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 08 May 2025 16:34:48 +0200
Subject: [PATCH v2 2/2] drm/panel: Add Novatek NT37801 panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-sm8750-display-panel-v2-2-3ca072e3d1fa@linaro.org>
References: <20250508-sm8750-display-panel-v2-0-3ca072e3d1fa@linaro.org>
In-Reply-To: <20250508-sm8750-display-panel-v2-0-3ca072e3d1fa@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14098;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=EDDVKelXJBqp6lbt4Dny38T0MBAdPUKWIgXoG6um3Jg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHMEOaQax2tc9V06Qn0ALv5UI0R2sdk3hVM6uy
 8zWLddWmKOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBzBDgAKCRDBN2bmhouD
 1+gsD/91FwHiQj3YlbHTV30mpZf7SdbmW2ARWNJipSl+Aopd5YI3ELKwvNyaVVjFzxSUs7Omgfr
 0boohrnkkjLW2LKD0lXKFmneQC31EGWBOD2SOjMLh3owgsdEYonRHZigJVHbXF/DIVee4ugH5in
 JnOV86ce8R7k/HhGUIcHqIvYqgcrcJ/MiQWJkyVly+3R+ANoAhL2MyKdiql7AGaB0rx5igBDwmq
 /AwRElTLKj4sIS1arpxae7LbWmZSjrCWSvvVkNF9DVgRIoW/13hSOdBfJl2yajnjO8WGUacPyrL
 N+xzj6RDVlHtIAqHdDhQIR4hhg+UqmwAdjCfam/SQ+Xd5sTGGeFkyuKsM7ZWg20qKnN5qjgT4uP
 lAej/MUpTwiteVq1kFme5DqapC9ZyMjwwivXLFG4hjco7yINR3zhfiedOceRYzSRcg1s0hdMcw4
 INakuZGeEr8zQw9+l8RXZgXB+DMhzGom0RhZ2oEPwRNG0Cw7N5qStI6mBleyG2SNTARK+Dv/uw4
 ueUJcOGNfVmy3m1j8lpBR/aodQZdbopKfGLZAG37+oRlXRmIMnnJTQ/vaYrzmrs7sEk6EHeS/eb
 xQPwmgV0ym6slVgpP3mpfge27V++d7nC/vKA4oRxkVxYTvoF3B9Rh46T3Yo7lsaOmRXCeKxK4BH
 WQrDgFHlylsjYqw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Add driver for the Novatek NT37801 or NT37810 AMOLED DSI 1440x3200
panel in CMD mode, used on Qualcomm MTP8750 board (SM8750).

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt37801.c | 340 ++++++++++++++++++++++++++
 4 files changed, 357 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2c3be5f6131432647dd01f22bbf4bf1c8bde9e6..78cdd5f81c322c230a82c8a877b2338d932478cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7595,6 +7595,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
 F:	drivers/gpu/drm/panel/panel-novatek-nt36672a.c
 
+DRM DRIVER FOR NOVATEK NT37801 PANELS
+M:	Krzysztof Kozlowski <krzk@kernel.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
+F:	drivers/gpu/drm/panel/panel-novatek-nt37801.c
+
 DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
 M:	Lyude Paul <lyude@redhat.com>
 M:	Danilo Krummrich <dakr@kernel.org>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 7e9c60a626fbbabb954ed2a7e3d1ef5eee0679d6..c7b688995c8d31b7445aa79dcc310742e4e724d8 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -508,6 +508,16 @@ config DRM_PANEL_NOVATEK_NT36672E
 	  LCD panel module. The panel has a resolution of 1080x2408 and uses 24 bit
 	  RGB per pixel.
 
+config DRM_PANEL_NOVATEK_NT37801
+	tristate "Novatek NT37801/NT37810 AMOLED DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for Novatek NT37801 (or
+	  NT37810) AMOLED DSI Video Mode LCD panel module with 1440x3200
+	  resolution.
+
 config DRM_PANEL_NOVATEK_NT39016
 	tristate "Novatek NT39016 RGB/SPI panel"
 	depends on OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 883974f0cba128e28f23e31512f8d30d59913b0e..2dcc224cba63e9cf59410fd974e5f068bb9e26b3 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -50,6 +50,7 @@ obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35950) += panel-novatek-nt35950.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36523) += panel-novatek-nt36523.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672E) += panel-novatek-nt36672e.o
+obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37801) += panel-novatek-nt37801.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
 obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) += panel-mantix-mlaf057we51.o
 obj-$(CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO) += panel-olimex-lcd-olinuxino.o
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
new file mode 100644
index 0000000000000000000000000000000000000000..84d367eab058bdddf5a40feb6a75f29ec62dd9f2
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2024 Linaro Limited
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+
+#include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+#include <video/mipi_display.h>
+
+struct novatek_nt37801 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct drm_dsc_config dsc;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data *supplies;
+};
+
+static const struct regulator_bulk_data novatek_nt37801_supplies[] = {
+	{ .supply = "vddio" },
+	{ .supply = "vci" },
+	{ .supply = "vdd" },
+};
+
+static inline struct novatek_nt37801 *to_novatek_nt37801(struct drm_panel *panel)
+{
+	return container_of(panel, struct novatek_nt37801, panel);
+}
+
+static void novatek_nt37801_reset(struct novatek_nt37801 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 21000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(10000, 21000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 21000);
+}
+
+#define NT37801_DCS_SWITCH_PAGE			0xf0
+
+#define novatek_nt37801_switch_page(dsi_ctx, page) \
+	mipi_dsi_dcs_write_seq_multi((dsi_ctx), NT37801_DCS_SWITCH_PAGE, \
+				     0x55, 0xaa, 0x52, 0x08, (page))
+
+static int novatek_nt37801_on(struct novatek_nt37801 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	novatek_nt37801_switch_page(&dsi_ctx, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc5, 0x0b, 0x0b, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf5, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0x00);
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 0x059f);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x0c7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x90, 0x03, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x91,
+				     0x89, 0x28, 0x00, 0x28, 0xc2, 0x00, 0x02,
+				     0x68, 0x04, 0x6c, 0x00, 0x0a, 0x02, 0x77,
+				     0x01, 0xe9, 0x10, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x81);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb,
+				     0x00, 0x01, 0x00, 0x11, 0x33, 0x33, 0x33,
+				     0x55, 0x57, 0xd0, 0x00, 0x00, 0x44, 0x56,
+				     0x77, 0x78, 0x9a, 0xbc, 0xdd, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0xdc);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x00);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x00, 0x18, 0x00, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51,
+				     0x07, 0xff, 0x07, 0xff, 0x0f, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_MEMORY_START);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x00);
+
+	novatek_nt37801_switch_page(&dsi_ctx, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x55, 0x01, 0xff, 0x03);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
+	return dsi_ctx.accum_err;
+}
+
+static int novatek_nt37801_off(struct novatek_nt37801 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	return dsi_ctx.accum_err;
+}
+
+static int novatek_nt37801_prepare(struct drm_panel *panel)
+{
+	struct novatek_nt37801 *ctx = to_novatek_nt37801(panel);
+	struct device *dev = &ctx->dsi->dev;
+	struct drm_dsc_picture_parameter_set pps;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(novatek_nt37801_supplies),
+				    ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	novatek_nt37801_reset(ctx);
+
+	ret = novatek_nt37801_on(ctx);
+	if (ret < 0)
+		goto err;
+
+	drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
+
+	ret = mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
+	if (ret < 0) {
+		dev_err(panel->dev, "failed to transmit PPS: %d\n", ret);
+		goto err;
+	}
+
+	ret = mipi_dsi_compression_mode(ctx->dsi, true);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable compression mode: %d\n", ret);
+		goto err;
+	}
+
+	msleep(28);
+
+	return 0;
+
+err:
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(novatek_nt37801_supplies),
+			       ctx->supplies);
+
+	return ret;
+}
+
+static int novatek_nt37801_unprepare(struct drm_panel *panel)
+{
+	struct novatek_nt37801 *ctx = to_novatek_nt37801(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = novatek_nt37801_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	regulator_bulk_disable(ARRAY_SIZE(novatek_nt37801_supplies),
+			       ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode novatek_nt37801_mode = {
+	.clock = (1440 + 20 + 4 + 20) * (3200 + 20 + 2 + 18) * 120 / 1000,
+	.hdisplay = 1440,
+	.hsync_start = 1440 + 20,
+	.hsync_end = 1440 + 20 + 4,
+	.htotal = 1440 + 20 + 4 + 20,
+	.vdisplay = 3200,
+	.vsync_start = 3200 + 20,
+	.vsync_end = 3200 + 20 + 2,
+	.vtotal = 3200 + 20 + 2 + 18,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int novatek_nt37801_get_modes(struct drm_panel *panel,
+				     struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector,
+						    &novatek_nt37801_mode);
+}
+
+static const struct drm_panel_funcs novatek_nt37801_panel_funcs = {
+	.prepare = novatek_nt37801_prepare,
+	.unprepare = novatek_nt37801_unprepare,
+	.get_modes = novatek_nt37801_get_modes,
+};
+
+static int novatek_nt37801_bl_update_status(struct backlight_device *bl)
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
+static const struct backlight_ops novatek_nt37801_bl_ops = {
+	.update_status = novatek_nt37801_bl_update_status,
+};
+
+static struct backlight_device *
+novatek_nt37801_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 4095,
+		.max_brightness = 4095,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &novatek_nt37801_bl_ops, &props);
+}
+
+static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct novatek_nt37801 *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct novatek_nt37801, panel,
+				   &novatek_nt37801_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (!ctx)
+		return -ENOMEM;
+
+	ret = devm_regulator_bulk_get_const(dev,
+					    ARRAY_SIZE(novatek_nt37801_supplies),
+					    novatek_nt37801_supplies,
+					    &ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	ctx->panel.prepare_prev_first = true;
+	ctx->panel.backlight = novatek_nt37801_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	/* This panel only supports DSC; unconditionally enable it */
+	dsi->dsc = &ctx->dsc;
+	ctx->dsc.dsc_version_major = 1;
+	ctx->dsc.dsc_version_minor = 1;
+	ctx->dsc.slice_height = 40;
+	ctx->dsc.slice_width = 720;
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
+static void novatek_nt37801_remove(struct mipi_dsi_device *dsi)
+{
+	struct novatek_nt37801 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id novatek_nt37801_of_match[] = {
+	{ .compatible = "novatek,nt37801" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, novatek_nt37801_of_match);
+
+static struct mipi_dsi_driver novatek_nt37801_driver = {
+	.probe = novatek_nt37801_probe,
+	.remove = novatek_nt37801_remove,
+	.driver = {
+		.name = "panel-novatek-nt37801",
+		.of_match_table = novatek_nt37801_of_match,
+	},
+};
+module_mipi_dsi_driver(novatek_nt37801_driver);
+
+MODULE_AUTHOR("Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>");
+MODULE_DESCRIPTION("Panel driver for the Novatek NT37801/NT37810 AMOLED DSI panel");
+MODULE_LICENSE("GPL");

-- 
2.45.2

