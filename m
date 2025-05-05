Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D27AA8F34
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 11:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08B310E3A5;
	Mon,  5 May 2025 09:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pWnNsOrB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5C710E3A5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 09:16:46 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cf861f936so7404035e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 02:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746436605; x=1747041405; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zMykZfK8zmVU2oh4dE9oTVU5CYlCzCSyC1fcDdNak2c=;
 b=pWnNsOrBdnnOMK/sDCov10spM+t4CTM5tOJdk9ST/CE4PL5ImoeTRQPPGwaFVuiPwm
 1T0CYDS8YQO2MlT8dK5FA7z3NaBGCBTW3eXtmzYlcVErpXiQCZIWUfiHPXnLJn/r8q0r
 Arr5QkXaG+qeLWDtGbkt6BTcpwCLBtBnthxyef6X++odm351yF6F6LMhqq68XBGeMSGg
 1ydH4Tcd7453KeZWa97zWcWI0P1+tLKPiqcO9dOdiB7rgD3yyB9TSsqeuiG8ZWAKbHeN
 EIuLzz+2nym2ZGExrzhIHZcarwQY0eXzafsQDG3TMI5YIfFhxuDMsh/yUaCSodzXPQa/
 dflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746436605; x=1747041405;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zMykZfK8zmVU2oh4dE9oTVU5CYlCzCSyC1fcDdNak2c=;
 b=AoiP6HbQ+u3QACAcdVYBxWtoeK2HmD9JRA9pe5MczxgrAP38fNxdWssDcRuHw+Q+90
 5cT3zrFHNARtFELbmDTlzEoeKWCCbd9PPQBDOxxBrg7PkaDRSCZMvfZP2S8kRRzg44fV
 XMBCeTEFoG4BAg1MZARXDPdDRtod9NMf5abtkcaTvAVjmbTzNVMUKii4F839Gxcx8R6b
 Rz82/SoZEYqeegUqraup9rMfnSvCEmzz8tmHuSMpO5q55qupFbqZtu+0Ai3TYbzK3Uq8
 Fnsc93wfh3P1GyeRfqstSnLFKHK3DEe11Nhxn/Gjtp5w89Bp752WJhvIl9J6F3YJ1KqZ
 RJKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+gtVQgFGle4RW72aQINRIqBfvq1mYiYfkYJr0p/U96pPXepaT7mVYz+R5aE0VkMzSFbEzpDEqASc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4d8TOFSPXdyay4WUztjepSWyGyAbf91SXax+8gqX7cD4+HEXy
 GB8kpxdJA0yoLjfgY3vdkrcIlx4t61tWvN+bQgsTukdjQho3ep0u8yh1qm4eyjs=
X-Gm-Gg: ASbGncvcmRr58x0tZ8aj5LRmMGxy+IVrl5OJElHIZT2dZtsuiQ6Y+swEBk8spxDSf7q
 P7BjoEHbLnb4B/t2gbbhbkdJ5SU7Ubi+HT0lOij78Bv3ol4CmUYGj69/S4zna3EAO54bLri8Ti7
 k10ZwJcGnYVoYNQWAUNJZAivOYfmfrWKqScSYSwvQRzmVZ1stMa0U5gfqV9iOi6P0iifE3SYYD/
 3cUkAQltcnyvWGfalMRPXQmIxKV9wnBjvcGCYzvvvTyw7i+y2j9kMmNUd+75rBtpVHc/ExOWe76
 B6F6u4uPSOVyqQLsqSwrVDc4MYtnl9vhqki+niyzmKNRbj7zSMCzkBgeOaKC8GXL+s21sQ==
X-Google-Smtp-Source: AGHT+IEAjTLGfHmtf0WI+UyP08T35bSV5uViXJnxuDGbmoMjCT3gbq9KfFvTHzVzqGuS3OQVOcpsjA==
X-Received: by 2002:a05:600c:4ec9:b0:43b:cab3:1fd1 with SMTP id
 5b1f17b1804b1-441bbea066bmr35516885e9.1.1746436604670; 
 Mon, 05 May 2025 02:16:44 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2aece0asm171784775e9.14.2025.05.05.02.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 02:16:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 05 May 2025 11:16:29 +0200
Subject: [PATCH 2/2] drm/panel: Add Novatek NT37801 panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-sm8750-display-panel-v1-2-e5b5398482cc@linaro.org>
References: <20250505-sm8750-display-panel-v1-0-e5b5398482cc@linaro.org>
In-Reply-To: <20250505-sm8750-display-panel-v1-0-e5b5398482cc@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13872;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LZ+KilW6dTkil/+VYR5mHCk8gn1ogIFi/NKVfrAhDoE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoGIH3+F0w3Qj8YAjxT2jGgykjGxSchcQF/su9t
 dH909y7Y/qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBiB9wAKCRDBN2bmhouD
 18lDD/9CY4UDcfjohu4eEpGA/le1h31DIjEPyFRr4iUKXDBbv8uA2Kjpyt96OfoISa7KylD/UZU
 eT3POlTTTdVvmxgG2IWmvO5pho/4Ear3PKJYYowp3DwIEr7L5i6ELOTVkAoyO/kZy5MdFx1cAH+
 AqjzoRBSGryB0k3oXrI5dD8P00ujPYns8k67UHOObGStyXHRFEl0bbpIbT3WQHO5AcRQHFiwARG
 Ab19+dnnUqlHbyv/23tJY5IV88ya1BO9nsOCzwA06pcsAZGyCMValoEyEtUBJiNq51V7mXgQypq
 fXh2+AMDorpi/LOpfboE4VatPpI8aIKcuVMwv8yZIoFkqHen36RL8ic4zDrDFPDy3e7xWzuatRD
 Pbisl978BiQSJ7WXKOX2TckvH4fo2bGi6uCPcnQzbaU2rlPB1hx0EXPfN9mFZ02TO4HbECdrJIB
 54q2xeD7lYarW8rnBcrj8WVfqvIexWdNE8PUdWBHDJaqJ3Hjs1mkfX2lPcpLYZoeIC1Ptm1nIhs
 RRhChVocVdJucKgngAIXMFBWrKrsMl5NedsCwaFx1WwrJygmjd8FxqcV5n0uXh4Ja5axgaD0ANf
 +wJTl6czQMi8rqUqJH2GbDPNzCUetQEdjIzbI0DaqnzcTWulzh8rtNRBpjnMDDKWZ0wsNrBWKz6
 WNxn9UWNdoE/6qg==
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt37801.c | 336 ++++++++++++++++++++++++++
 4 files changed, 353 insertions(+)

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
index 0000000000000000000000000000000000000000..2c07a61c3a58819ca4c5e39ae352eac1b1fc694c
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
@@ -0,0 +1,336 @@
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
+static int novatek_nt37801_on(struct novatek_nt37801 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
+				     0x55, 0xaa, 0x52, 0x08, 0x01);
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
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
+				     0x55, 0xaa, 0x52, 0x08, 0x01);
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
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
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
+	drm_panel_init(&ctx->panel, dev, &novatek_nt37801_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
+
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

