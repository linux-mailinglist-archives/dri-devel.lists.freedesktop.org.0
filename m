Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2D2829D3A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 16:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCF510E61C;
	Wed, 10 Jan 2024 15:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFD710E60F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 15:14:20 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a2c179aa5c4so23869366b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 07:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1704899659; x=1705504459; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+N0oNnhvefANzwE/C/9ajXYuBkvvv0LTVUo1X3IIYTw=;
 b=o5Hs+FyHjod4oNyClZzF7MULoiXpGRfPXbHfY7/5i/sdaHm+N/jj+SwABu4z+ZjgeO
 8o6sInDnbWDGhOK0b78qYpKPEjrsqVVls6l+7SZdfJZz63WJc/AvXNIZOd5elM4r9xvq
 2qhcUNwX7wdKiRJyxK2yqhqYf3873GT4DpKE2eSTeDb2lWVKC0AAHp7AGVzYK0hcldJo
 tIfVyVTJ7SqqsjHaWL1wJTRLk2iDfKoE6vtEQJR9cru2h291n4ILYaX8e7h4oOqz7nLP
 clwlElzVzyoyHR09LCoMAErLhsED3rXghjawmYFwbWRvPmwgQ8bXa7zmDUgLAZl50U79
 V8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704899659; x=1705504459;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+N0oNnhvefANzwE/C/9ajXYuBkvvv0LTVUo1X3IIYTw=;
 b=XuT0zuzn7DPK9LhinBflhOdxgq5uGJBiui8G66LsTyziDZXFkrdszeUChGXLtcMA4x
 0vZmHg/PRSN8LZyjRBs/r/ep/K7JttJmz/K7ebMUcOlutR91bSL5x6dpANT3awB7Tngu
 +cehkfWDXVxF1n6FNzGXzY8L0S+8AUvMUreR5lwopagCf/UKvVYYB5a5Q6avqLEMIYst
 xYQL/8mxvcoNtpj+0NMp8j1br3H1jUiX2I8E5SP3JWY7kO9Ht6pnPu7IpTJQDXSxN+8V
 sjdfL2n6KPW9V6eI3ZAR4IilUEwAC0e7pZU8hF++iMhbxrJldKMOJCpWXufcwH2S5Myq
 zCaw==
X-Gm-Message-State: AOJu0Ywtmi9u5HAlqrXQUmQ7M2DBmZJsbpt0vHYPYq4TGKnONIGwk1xk
 gAs8MclAunRaHEXS3SmBtkXshv9TeulzyVbbTC03Cyo+dg2waw==
X-Google-Smtp-Source: AGHT+IFLjqu91jpqL55jGv8OLP9mSGJfnFlj+Y6cBx9H4VoxXnBetq/EK0J9pN05w/NSdMhyxnKPIQ==
X-Received: by 2002:a17:906:6802:b0:a27:6d9c:8194 with SMTP id
 k2-20020a170906680200b00a276d9c8194mr651100ejr.119.1704899658827; 
 Wed, 10 Jan 2024 07:14:18 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 jx22-20020a170906ca5600b00a27a25afaf2sm2174517ejb.98.2024.01.10.07.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 07:14:17 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 10 Jan 2024 16:14:09 +0100
Subject: [PATCH v2 2/4] drm/panel: Add driver for DJN HX83112A LCD panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240110-fp4-panel-v2-2-8ad11174f65b@fairphone.com>
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
In-Reply-To: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
X-Mailer: b4 0.12.4
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca.weiss@fairphone.com>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the 2340x1080 LCD DJN panel bundled with a HX83112A
driver IC, as found on the Fairphone 4 smartphone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/panel/Kconfig                |  10 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-himax-hx83112a.c | 352 +++++++++++++++++++++++++++
 3 files changed, 363 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 99e14dc212ec..3379b13df4b8 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -162,6 +162,16 @@ config DRM_PANEL_FEIYANG_FY07024DI26A30D
 	  Say Y if you want to enable support for panels based on the
 	  Feiyang FY07024DI26A30-D MIPI-DSI interface.
 
+config DRM_PANEL_HIMAX_HX83112A
+	tristate "Himax HX83112A-based DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_KMS_HELPER
+	help
+	  Say Y here if you want to enable support for Himax HX83112A-based
+	  display panels, such as the one found in the Fairphone 4 smartphone.
+
 config DRM_PANEL_HIMAX_HX8394
 	tristate "HIMAX HX8394 MIPI-DSI LCD panels"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index d10c3de51c6d..c2fc4c8c8340 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_DRM_PANEL_EBBG_FT8719) += panel-ebbg-ft8719.o
 obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
 obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
 obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
+obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112A) += panel-himax-hx83112a.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
diff --git a/drivers/gpu/drm/panel/panel-himax-hx83112a.c b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
new file mode 100644
index 000000000000..cccc6075fd8e
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
@@ -0,0 +1,352 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree.
+ * Copyright (c) 2024 Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct hx83112a_panel {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator_bulk_data supplies[3];
+	struct gpio_desc *reset_gpio;
+};
+
+static inline struct hx83112a_panel *to_hx83112a_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct hx83112a_panel, panel);
+}
+
+static void hx83112a_reset(struct hx83112a_panel *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	msleep(20);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	msleep(20);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	msleep(50);
+}
+
+static int hx83112a_on(struct hx83112a_panel *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x83, 0x11, 0x2a);
+	mipi_dsi_dcs_write_seq(dsi, 0xb1,
+			       0x08, 0x28, 0x28, 0x83, 0x83, 0x4c, 0x4f, 0x33);
+	mipi_dsi_dcs_write_seq(dsi, 0xb2,
+			       0x00, 0x02, 0x00, 0x90, 0x24, 0x00, 0x08, 0x19,
+			       0xea, 0x11, 0x11, 0x00, 0x11, 0xa3);
+	mipi_dsi_dcs_write_seq(dsi, 0xb4,
+			       0x58, 0x68, 0x58, 0x68, 0x0f, 0xef, 0x0b, 0xc0,
+			       0x0b, 0xc0, 0x0b, 0xc0, 0x00, 0xff, 0x00, 0xff,
+			       0x00, 0x00, 0x14, 0x15, 0x00, 0x29, 0x11, 0x07,
+			       0x12, 0x00, 0x29);
+	mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x02);
+	mipi_dsi_dcs_write_seq(dsi, 0xb4,
+			       0x00, 0x12, 0x12, 0x11, 0x88, 0x12, 0x12, 0x00,
+			       0x53);
+	mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x03);
+	mipi_dsi_dcs_write_seq(dsi, 0xc1,
+			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
+			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
+			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
+			       0x84, 0x7c, 0x74, 0x6b, 0x62, 0x5a, 0x51, 0x49,
+			       0x41, 0x39, 0x31, 0x29, 0x21, 0x19, 0x12, 0x0a,
+			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
+			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
+			       0x40);
+	mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x02);
+	mipi_dsi_dcs_write_seq(dsi, 0xc1,
+			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
+			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
+			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
+			       0x84, 0x7c, 0x74, 0x6b, 0x62, 0x5a, 0x51, 0x49,
+			       0x41, 0x39, 0x31, 0x29, 0x21, 0x19, 0x12, 0x0a,
+			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
+			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
+			       0x40);
+	mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0xc1,
+			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
+			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
+			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
+			       0x84, 0x7c, 0x74, 0x6b, 0x62, 0x5a, 0x51, 0x49,
+			       0x41, 0x39, 0x31, 0x29, 0x21, 0x19, 0x12, 0x0a,
+			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
+			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
+			       0x40);
+	mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0xc7, 0x70, 0x00, 0x04, 0xe0, 0x33, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xcc, 0x08);
+	mipi_dsi_dcs_write_seq(dsi, 0xd2, 0x2b, 0x2b);
+	mipi_dsi_dcs_write_seq(dsi, 0xd3,
+			       0x80, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x08,
+			       0x08, 0x03, 0x03, 0x22, 0x18, 0x07, 0x07, 0x07,
+			       0x07, 0x32, 0x10, 0x06, 0x00, 0x06, 0x32, 0x10,
+			       0x07, 0x00, 0x07, 0x32, 0x19, 0x31, 0x09, 0x31,
+			       0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x08,
+			       0x09, 0x30, 0x00, 0x00, 0x00, 0x06, 0x0d, 0x00,
+			       0x0f);
+	mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0xd3,
+			       0x00, 0x00, 0x19, 0x10, 0x00, 0x0a, 0x00, 0x81);
+	mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xd5,
+			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+			       0xc0, 0xc0, 0x18, 0x18, 0x19, 0x19, 0x18, 0x18,
+			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x3f, 0x3f,
+			       0x28, 0x28, 0x24, 0x24, 0x02, 0x03, 0x02, 0x03,
+			       0x00, 0x01, 0x00, 0x01, 0x31, 0x31, 0x31, 0x31,
+			       0x30, 0x30, 0x30, 0x30, 0x2f, 0x2f, 0x2f, 0x2f);
+	mipi_dsi_dcs_write_seq(dsi, 0xd6,
+			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x19, 0x19,
+			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x3f, 0x3f,
+			       0x24, 0x24, 0x28, 0x28, 0x01, 0x00, 0x01, 0x00,
+			       0x03, 0x02, 0x03, 0x02, 0x31, 0x31, 0x31, 0x31,
+			       0x30, 0x30, 0x30, 0x30, 0x2f, 0x2f, 0x2f, 0x2f);
+	mipi_dsi_dcs_write_seq(dsi, 0xd8,
+			       0xaa, 0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xea,
+			       0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xea, 0xab, 0xaa,
+			       0xaa, 0xaa, 0xaa, 0xea, 0xab, 0xaa, 0xaa, 0xaa);
+	mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0xd8,
+			       0xaa, 0x2e, 0x28, 0x00, 0x00, 0x00, 0xaa, 0x2e,
+			       0x28, 0x00, 0x00, 0x00, 0xaa, 0xee, 0xaa, 0xaa,
+			       0xaa, 0xaa, 0xaa, 0xee, 0xaa, 0xaa, 0xaa, 0xaa);
+	mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x02);
+	mipi_dsi_dcs_write_seq(dsi, 0xd8,
+			       0xaa, 0xff, 0xff, 0xff, 0xff, 0xff, 0xaa, 0xff,
+			       0xff, 0xff, 0xff, 0xff);
+	mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x03);
+	mipi_dsi_dcs_write_seq(dsi, 0xd8,
+			       0xaa, 0xaa, 0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
+			       0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xff, 0xff, 0xff,
+			       0xff, 0xff, 0xaa, 0xff, 0xff, 0xff, 0xff, 0xff);
+	mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xe7,
+			       0x0e, 0x0e, 0x1e, 0x65, 0x1c, 0x65, 0x00, 0x50,
+			       0x20, 0x20, 0x00, 0x00, 0x02, 0x02, 0x02, 0x05,
+			       0x14, 0x14, 0x32, 0xb9, 0x23, 0xb9, 0x08);
+	mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0xe7,
+			       0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d, 0xa4, 0x0e);
+	mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x02);
+	mipi_dsi_dcs_write_seq(dsi, 0xe7,
+			       0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00,
+			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,
+			       0x00, 0x00, 0x00, 0x02, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xe9, 0xc3);
+	mipi_dsi_dcs_write_seq(dsi, 0xcb, 0xd1, 0xd6);
+	mipi_dsi_dcs_write_seq(dsi, 0xe9, 0x3f);
+	mipi_dsi_dcs_write_seq(dsi, 0xe9, 0xc6);
+	mipi_dsi_dcs_write_seq(dsi, 0xbf, 0x37);
+	mipi_dsi_dcs_write_seq(dsi, 0xe9, 0x3f);
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(150);
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display on: %d\n", ret);
+		return ret;
+	}
+	msleep(50);
+
+	return 0;
+}
+
+static int hx83112a_disable(struct drm_panel *panel)
+{
+	struct hx83112a_panel *ctx = to_hx83112a_panel(panel);
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display off: %d\n", ret);
+		return ret;
+	}
+	msleep(20);
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
+static int hx83112a_prepare(struct drm_panel *panel)
+{
+	struct hx83112a_panel *ctx = to_hx83112a_panel(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	hx83112a_reset(ctx);
+
+	ret = hx83112a_on(ctx);
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
+static int hx83112a_unprepare(struct drm_panel *panel)
+{
+	struct hx83112a_panel *ctx = to_hx83112a_panel(panel);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode hx83112a_mode = {
+	.clock = (1080 + 28 + 8 + 8) * (2340 + 27 + 5 + 5) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 28,
+	.hsync_end = 1080 + 28 + 8,
+	.htotal = 1080 + 28 + 8 + 8,
+	.vdisplay = 2340,
+	.vsync_start = 2340 + 27,
+	.vsync_end = 2340 + 27 + 5,
+	.vtotal = 2340 + 27 + 5 + 5,
+	.width_mm = 67,
+	.height_mm = 145,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int hx83112a_get_modes(struct drm_panel *panel,
+				  struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &hx83112a_mode);
+}
+
+static const struct drm_panel_funcs hx83112a_panel_funcs = {
+	.prepare = hx83112a_prepare,
+	.unprepare = hx83112a_unprepare,
+	.disable = hx83112a_disable,
+	.get_modes = hx83112a_get_modes,
+};
+
+static int hx83112a_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct hx83112a_panel *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->supplies[0].supply = "vdd1";
+	ctx->supplies[1].supply = "vsn";
+	ctx->supplies[2].supply = "vsp";
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
+				      ctx->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
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
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_VIDEO_HSE |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	drm_panel_init(&ctx->panel, dev, &hx83112a_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void hx83112a_remove(struct mipi_dsi_device *dsi)
+{
+	struct hx83112a_panel *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id hx83112a_of_match[] = {
+	{ .compatible = "fairphone,fp4-hx83112a-djn" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, hx83112a_of_match);
+
+static struct mipi_dsi_driver hx83112a_driver = {
+	.probe = hx83112a_probe,
+	.remove = hx83112a_remove,
+	.driver = {
+		.name = "panel-himax-hx83112a",
+		.of_match_table = hx83112a_of_match,
+	},
+};
+module_mipi_dsi_driver(hx83112a_driver);
+
+MODULE_DESCRIPTION("DRM driver for hx83112a-equipped DSI panels");
+MODULE_LICENSE("GPL");

-- 
2.43.0

