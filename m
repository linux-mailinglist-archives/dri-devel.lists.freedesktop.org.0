Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAECBB28E3
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 07:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C6710E780;
	Thu,  2 Oct 2025 05:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="npQAZ4H/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C8210E1ED
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 14:01:26 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so4164104f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 07:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759327285; x=1759932085; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iKalYOaQVukRfcIPCAvRc5wI6gF1gNZA953ELCi2+qs=;
 b=npQAZ4H/9wofb44sgYF5sdWeozNxOJcJ9zidNkmvfm2CAJnH5SPE7PEH3rr4rhTBSj
 Upby7Kr5TOnHy7whlx0L9JmKbCLz7y8iFRVv2bpbNhq9E9DT6I0X7gJUvqjQxMvohhh+
 UFn8qCtDIpqqjieHCXt118h9LmJuK/pNaA7vdZ5RUx0txjBTr2mdbtnVyRw0AYjkYOAC
 c1wHhxj6ZunuHuDKXSIxdnFI2wGKLeBiwS1uGzt7oIn4W0eoHM+DsvpexVGABD3q1Ndp
 nsB4d7ubvYJnXSlZlCEqxKTskRk+mnjn4HB2JG3YaXj3uD7b8MG5ZFVATJzmjiQ6l1Cu
 PTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759327285; x=1759932085;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iKalYOaQVukRfcIPCAvRc5wI6gF1gNZA953ELCi2+qs=;
 b=kJvn7Q4T8FcZm3aK9MOaIFAgek1EpUTU2F1j7EEG2/ZzaLYCAzTnWBqfYsVcj3CnY5
 PEmt/dDoEwtZ2lyeyIOoPpzdLa+eGvC/IppZN70Fvwr3RWt7uSf1KkShOeKoYzYHATLz
 Fc/dytoTpoY5GuTC1Hp7u5g8TVc7VjHsD2G55TltZiqcJaRVXUzOQiP1bCQd7Fe+UIvi
 MvN0A0/9rW9JVi7QvX4/k4/xluO7DSdH+mZSiFnlyDN2EgXSikkEtu9/mP6YAgM8I29s
 xMbGonyj8Ikx+/d84lm+vfl1RxI8SmeP4goF+4BIKpE+rBQ1xaY0nyLhRmM0mgy18MFT
 2HZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUgmquDMe27rBvqXyvgefLVs4qWcSz4HzWekwpmjPG9TV8GhZEbP1rBqAR2GgrqU44OotnENLoXug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4JL4WGLM/79XiHwIEQExjT3vpHnJlIPEHHtJAdRT+lERyrZhF
 7L89bV6YnxfxUb3X43Lf0f0PuG3nayAEYS53FzEqE+oYLaq5D4iKn8IC
X-Gm-Gg: ASbGncuD3saoMfH/hE6VuUAY2K49cXqdOLDGlR2/lvV4h4azGre704F/q0lyI+adT2x
 NWMj2VUehqRqw/wZf6AgWVeFZIZngOnvq1D0xGhI8jSEZfUIGFSUtWG9R43AU6uUCySIEqLMzZf
 kETYdj/mcuTdt+RGXgDmTG0wnw5XcZiE1suG2cLM5KDprWOsU+EXej7GR50iOaHuc4l0BwsLCkV
 ouTjBru58HTg3jaCAsth+eCan00I13+zQTXLV0HLbHw3pLvidtxCyqYYDNuokq8+0lNLSC6sIK9
 Qo8EhoJFDetrNbafbYOyupWkeGgIid3iBXYMRBTPofmkOvi6YwLy3X1s9xgOtF7By922kr1f33x
 zdh+iov3ZbQ/Hbdp3mDLkidDTd2S4lxv3rxs4VqpeREvs8DgNRO4EKdoao6BJREEs6ycMxz3Bi6
 slU/tEELanWdV9HPmp5EUFUQW6E2WDiaUVaypwrwFigu+BV7vA/JXnbA==
X-Google-Smtp-Source: AGHT+IFpkvgyHXyw/+Pkpw85BpuMOmx154wGF/+ane8tu9MLaY4HwbF+NiWDdGeiau8jpLrDHs4J2g==
X-Received: by 2002:a05:6000:607:b0:3eb:9447:b97a with SMTP id
 ffacd0b85a97d-4255781a64fmr2951941f8f.54.1759327282771; 
 Wed, 01 Oct 2025 07:01:22 -0700 (PDT)
Received: from LAPTOP-AMJDAUEJ.soton.ac.uk
 (globalprotect-nat-extbord.soton.ac.uk. [152.78.0.24])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb89065b5sm27029828f8f.17.2025.10.01.07.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 07:01:22 -0700 (PDT)
From: Junjie Cao <caojunjie650@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>
Cc: Junjie Cao <caojunjie650@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 3/3] drm/panel: Add Novatek NT36532 panel driver
Date: Wed,  1 Oct 2025 21:59:14 +0800
Message-ID: <20251001135914.13754-4-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001135914.13754-1-caojunjie650@gmail.com>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Oct 2025 05:43:06 +0000
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

Add a driver for panels using the Novatek NT36532 Display Driver IC,
including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
tablets.

Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
---
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
 4 files changed, 455 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c8281ea4cc6..1394b26269b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7914,6 +7914,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
 F:	drivers/gpu/drm/panel/panel-novatek-nt36523.c
 
+DRM DRIVER FOR NOVATEK NT36532 PANELS
+M:	Junjie Cao <caojunjie650@gmail.com>
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/panel/novatek,nt36532.yaml
+F:	drivers/gpu/drm/panel/panel-novatek-nt36532.c
+
 DRM DRIVER FOR NOVATEK NT36672A PANELS
 M:	Sumit Semwal <sumit.semwal@linaro.org>
 S:	Maintained
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 407c5f6a268b..a2ef5be43c96 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -520,6 +520,16 @@ config DRM_PANEL_NOVATEK_NT36523
 	  around the Novatek NT36523 display controller, such as some
 	  Boe panels used in Xiaomi Mi Pad 5 and 5 Pro tablets.
 
+config DRM_PANEL_NOVATEK_NT36532
+	tristate "Novatek NT36532-based MIPI-DSI panels"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	help
+	  Say Y here if you want to enable support for the panels built
+	  around the Novatek NT36532 display controller, such as some
+	  CSOT panels used in OnePlus Pad 2 tablets. These panels are
+	  typically dual-DSI and may use DSC (Display Stream Compression).
+
 config DRM_PANEL_NOVATEK_NT36672A
 	tristate "Novatek NT36672A DSI panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 3615a761b44f..56b4e362890c 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35560) += panel-novatek-nt35560.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35950) += panel-novatek-nt35950.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36523) += panel-novatek-nt36523.o
+obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36532) += panel-novatek-nt36532.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672E) += panel-novatek-nt36672e.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37801) += panel-novatek-nt37801.o
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36532.c b/drivers/gpu/drm/panel/panel-novatek-nt36532.c
new file mode 100644
index 000000000000..a2f550801f34
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36532.c
@@ -0,0 +1,437 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Novatek NT36532 DriverIC panels driver
+ * Based on the template generated by linux-mdss-dsi-panel-driver-generator
+ *
+ * Copyright (c) 2025 Junjie Cao <caojunjie650@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/regulator/consumer.h>
+#include <linux/mod_devicetable.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct nt36532 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi[2];
+	const struct panel_info *panel_info;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data *supplies;
+};
+
+struct panel_info {
+	unsigned int width_mm;
+	unsigned int height_mm;
+
+	unsigned int lanes;
+	enum mipi_dsi_pixel_format format;
+	unsigned long mode_flags;
+
+	const struct drm_display_mode display_mode;
+
+	unsigned int dsc_slice_per_pkt;
+	struct drm_dsc_config * const dsc_cfg;
+
+	int (*init_sequence)(struct nt36532 *ctx);
+
+	bool is_dual_dsi;
+};
+
+static const struct regulator_bulk_data nt36532_supplies[] = {
+	{ .supply = "vddio" }, /* 1.8v */
+};
+
+static inline struct nt36532 *to_nt36532(struct drm_panel *panel)
+{
+	return container_of(panel, struct nt36532, panel);
+}
+
+static void nt36532_reset(struct nt36532 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 10100);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(5000, 5100);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(15000, 15100);
+}
+
+static int nt36532_prepare(struct drm_panel *panel)
+{
+	struct nt36532 *ctx = to_nt36532(panel);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(nt36532_supplies),
+				    ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	nt36532_reset(ctx);
+
+	ret = ctx->panel_info->init_sequence(ctx);
+	if (ret < 0) {
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(nt36532_supplies),
+				       ctx->supplies);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int nt36532_off(struct nt36532 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi[0];
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 10100);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 65);
+
+	return dsi_ctx.accum_err;
+}
+
+static int nt36532_unprepare(struct drm_panel *panel)
+{
+	struct nt36532 *ctx = to_nt36532(panel);
+	struct device *dev = &ctx->dsi[0]->dev;
+	int ret;
+
+	ret = nt36532_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(nt36532_supplies), ctx->supplies);
+
+	return 0;
+}
+
+static int nt36532_get_modes(struct drm_panel *panel,
+			     struct drm_connector *connector)
+{
+	struct nt36532 *ctx = to_nt36532(panel);
+	const struct panel_info *panel_info = ctx->panel_info;
+
+	return drm_connector_helper_get_modes_fixed(connector,
+						    &panel_info->display_mode);
+}
+
+static const struct drm_panel_funcs nt36532_panel_funcs = {
+	.prepare = nt36532_prepare,
+	.unprepare = nt36532_unprepare,
+	.get_modes = nt36532_get_modes,
+};
+
+static int nt36532_probe(struct mipi_dsi_device *dsi)
+{
+	struct mipi_dsi_device_info dsi_info = {"nt36532-secondary", 0, NULL};
+	const struct panel_info *panel_info;
+	struct mipi_dsi_host *dsi1_host;
+	struct device *dev = &dsi->dev;
+	struct device_node *dsi1;
+	struct nt36532 *ctx;
+	int num_dsi = 1;
+	int ret, i;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ret = devm_regulator_bulk_get_const(&dsi->dev,
+					    ARRAY_SIZE(nt36532_supplies),
+					    nt36532_supplies, &ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->panel_info = of_device_get_match_data(dev);
+	panel_info = ctx->panel_info;
+	if (!panel_info)
+		return -ENODEV;
+
+	if (panel_info->is_dual_dsi) {
+		num_dsi = 2;
+		dsi1 = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
+		if (!dsi1) {
+			dev_err(dev, "cannot get secondary DSI node.\n");
+			return -ENODEV;
+		}
+
+		dsi1_host = of_find_mipi_dsi_host_by_node(dsi1);
+		of_node_put(dsi1);
+		if (!dsi1_host)
+			return dev_err_probe(dev, -EPROBE_DEFER,
+					     "cannot get secondary DSI host\n");
+
+		dsi_info.node = dsi1;
+
+		ctx->dsi[1] = devm_mipi_dsi_device_register_full(dev, dsi1_host,
+								 &dsi_info);
+		if (IS_ERR(ctx->dsi[1])) {
+			dev_err(dev, "cannot get secondary DSI device\n");
+			return PTR_ERR(ctx->dsi[1]);
+		}
+
+		mipi_dsi_set_drvdata(ctx->dsi[1], ctx);
+	}
+
+	ctx->dsi[0] = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	drm_panel_init(&ctx->panel, dev, &nt36532_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ctx->panel.prepare_prev_first = true;
+
+	drm_panel_add(&ctx->panel);
+
+	for (i = 0; i < num_dsi; i++) {
+		ctx->dsi[i]->lanes = panel_info->lanes;
+		ctx->dsi[i]->format = panel_info->format;
+		ctx->dsi[i]->mode_flags = panel_info->mode_flags;
+		ctx->dsi[i]->dsc = panel_info->dsc_cfg;
+		ctx->dsi[i]->dsc_slice_per_pkt = panel_info->dsc_slice_per_pkt;
+		ret = devm_mipi_dsi_attach(dev, ctx->dsi[i]);
+		if (ret < 0) {
+			drm_panel_remove(&ctx->panel);
+			return dev_err_probe(dev, ret,
+					     "Failed to attach to DSI host\n");
+		}
+	}
+
+	return 0;
+}
+
+static void nt36532_remove(struct mipi_dsi_device *dsi)
+{
+	struct nt36532 *ctx = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static int csot_init_sequence(struct nt36532 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi[0];
+	struct drm_dsc_picture_parameter_set pps;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_LUT, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbc,
+				     0x00, 0x00, 0x03, 0x22, 0x00, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0xe1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0xa9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x8e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x8e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x8e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x2c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x3c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_ROWS, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_COLUMNS,
+				     0xfd);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0xfc);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0xfa);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0xf8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0xf6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, 0xf4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0xf2);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0xee);
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, 0xec);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0xea);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_3D_CONTROL, 0xe9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xe8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_VSYNC_TIMING, 0xe7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0xe6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_GET_SCANLINE, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0xf9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0xf6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0xf2);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0xec);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0xe8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0xe4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0xe0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0xde);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4f, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0xd6);
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x00d4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0xc2);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0xcd);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0xf6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0xeb);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0xe8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0xe5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS,
+				     0xe3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0xe0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0xde);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0xda);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0xd7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0xd4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0xd2);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0xc8);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x27);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_ROWS, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_COLUMNS,
+				     0x2a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd0, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd1, 0x54);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xde, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfa, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba, 0xaa, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb, 0xa0, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x27);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x8c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0xff07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0x2c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b,
+				     0x03, 0xd2, 0x1a, 0x04, 0x04, 0x00);
+
+	/* Enable DSC */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x90, 0x03);
+	drm_dsc_pps_payload_pack(&pps, ctx->panel_info->dsc_cfg);
+	mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9d, 0x01);
+
+	/* Program refresh rate control registers */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x91);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x41);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 10100);
+
+	return dsi_ctx.accum_err;
+}
+
+static const struct drm_display_mode csot_display_mode = {
+	/* 120Hz, the typical value */
+	.clock = (1500 + 118 + 20 + 100) * 2 * (2120 + 26 + 2 + 208) * 120 / 1000,
+	.hdisplay = 1500 * 2,
+	.hsync_start = (1500 + 118) * 2,
+	.hsync_end = (1500 + 118 + 20) * 2,
+	.htotal = (1500 + 118 + 20 + 100) * 2,
+	.vdisplay = 2120,
+	.vsync_start = 2120 + 26,
+	.vsync_end = 2120 + 26 + 2,
+	.vtotal = 2120 + 26 + 2 + 208,
+};
+
+static struct drm_dsc_config csot_dsc_cfg = {
+	.dsc_version_major = 1,
+	.dsc_version_minor = 2,
+	.slice_height = 20,
+	.slice_width = 750,
+	.slice_count = 2,
+	.bits_per_component = 8,
+	.bits_per_pixel = 8 << 4,
+	.block_pred_enable = true,
+};
+
+static const struct panel_info csot_panel_info = {
+	.width_mm = 250,
+	.height_mm = 177,
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |
+		      MIPI_DSI_MODE_LPM,
+	.display_mode = csot_display_mode,
+	.dsc_slice_per_pkt = 2,
+	.dsc_cfg = &csot_dsc_cfg,
+	.init_sequence = csot_init_sequence,
+	.is_dual_dsi = true,
+};
+
+static const struct of_device_id nt36532_of_match[] = {
+	{ .compatible = "csot,ppc100hb1-1", .data = &csot_panel_info },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, nt36532_of_match);
+
+static struct mipi_dsi_driver nt36532_driver = {
+	.probe = nt36532_probe,
+	.remove = nt36532_remove,
+	.driver = {
+		.name = "panel-novatek-nt36532",
+		.of_match_table = nt36532_of_match,
+	},
+};
+module_mipi_dsi_driver(nt36532_driver);
+
+MODULE_AUTHOR("Junjie Cao <caojunjie650@gmail.com>");
+MODULE_DESCRIPTION("DRM driver for Novatek NT36532 based MIPI DSI panels");
+MODULE_LICENSE("GPL");
-- 
2.48.1

