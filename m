Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4329FBABE67
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 09:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE5710E51D;
	Tue, 30 Sep 2025 07:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="gGoo6QHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2798310E51C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:51:06 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id
 d9443c01a7336-27ee41e074dso52328755ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 00:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1759218665; x=1759823465; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=60hr+t3VU3n6O3UnBPMWzfsQUhzglMdEt7VA1TIh1So=;
 b=gGoo6QHUVyllJDutF8Mw4Glgwj/Q9yeXMjjO2xdvtHXg7aKHp+Ftkr68/HDo3sS4VJ
 LNRHc/RqbgClVE7yp1PMEK3B93j+0QRkJKwhLKqThz/ldmd1lk+SB15H8yY2yS92seDK
 awKNxHFbVOgk/oqxVxataCOo6Nd4YvC0of7RqLKWWA+nMWfOwd0jD6aeRboY/sgQ+YXP
 ZZWTlWlzmVVJ0O5bKpOurGcc1DJ/0DAM0RaJGK6KlbE+kZL5ZJ+BvxnzpNTWQnI2y2wh
 cWjujFu7ne0xJYJ3ew6pXky9jFgKg0pN80woiagRh8BLqUGVQuN7Ik+UNRBOqnC2tL1x
 R/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759218665; x=1759823465;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=60hr+t3VU3n6O3UnBPMWzfsQUhzglMdEt7VA1TIh1So=;
 b=VcrDfpyT6FvASrZj47FnMKL0rpj0JIG+GOUDYadT5Lu3jgr8irTA5KPvR0Y9p25/K6
 XDRYFvXwPKs6MJXkhPflbZ5TiGwXj6bNR61fBBxI7S5V6YCEZMdNb64Ssdj/vqg4uPb3
 3H1TCJk63Wc80JrYwjd9cxx6WeLM66cY0aE00MahPRXfNRuyRCC1w5qWdMd2RQ7n1hUn
 w87KyEacjcAoRXbnblOJm7pImgk3HRCoRwRfTKzQwZ5Z1vzQkkdidtfzoWCrlK1rV/2S
 RpeFs5IvZJBtCZ2TlnVBrg0mST+m/IxoFMw7Iz1Y3X4rD8xD6D65jaofbAeIaO6/MmQD
 JZng==
X-Gm-Message-State: AOJu0YxiLe/ezc4Sow54EXxkI3JIb0JB/y2TQTRYd2iz1FPIUP98fmrx
 hXFk2+ILFQeAUJO2m+VwiKfwNjUfSuC4uSjCHFsRRd0s//RzE+xgXFHgVvqT1HAo5Do=
X-Gm-Gg: ASbGncv4b0tMQNdHJjbWrv6YwAaeRXKS418/qXzL5TJZTlMnKyZYoRGHy/3YgG6y28t
 7k1gIT95WHMiq/81H1R5v1tMeYG9yXSOCxFiAVCI7otqevfm3AboXar9pejHAjOJGcBeNOwmkbr
 wByRoDoqGN8CV+oHq05q4WG3s+h2faixVoKmjZGoljNa400Ma1iC+XQbLmlrsAECEjFyjy6kIKZ
 2x5C2xtG+BIfevpr3NqsaBnvyARtIg2eDHgkZzq+KMM2H7PrUH8hjav9rrgYEqMPJZTx3+ELuvd
 /nCY7E4WDK0PmhxQj69gKRKB7eDVzyTMz9BWXAUjZyw95f+JVYO3bIanY6qGBmoLBdk5fw9q211
 tMRr4HVigD8wTx0XqrVDl+X4RHpDKU7zvpMx1oB/+nRT5vX+wpaNEqFiCX9hxigq7DqYEeTk2Nt
 Pes8TQC6zwiwcJEaJnVg==
X-Google-Smtp-Source: AGHT+IGhRjc/a14/eaZ4YvqMOpu6kLwlxEUo+yCQX0UzgJOr1NpZ0sRtE5db0gL+ZNvRxuseuwI2sQ==
X-Received: by 2002:a17:902:e890:b0:24c:a269:b6d5 with SMTP id
 d9443c01a7336-27ed493e891mr192104545ad.0.1759218665443; 
 Tue, 30 Sep 2025 00:51:05 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed688223dsm152313565ad.86.2025.09.30.00.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:51:05 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v1 2/2] drm/panel: Add driver for Tianma TL121BVMS07-00 panel
Date: Tue, 30 Sep 2025 15:50:44 +0800
Message-Id: <20250930075044.1368134-3-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930075044.1368134-1-yelangyan@huaqin.corp-partner.google.com>
References: <20250930075044.1368134-1-yelangyan@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a DRM panel driver for the Tianma TL121BVMS07-00 12.1"
MIPI-DSI TFT LCD panel. The panel requires multiple power
supplies (AVDD, AVEE, 1.8V logic), an enable GPIO, and a
backlight device. The panel is based on the Ilitek IL79900A
controller.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 .../drm/panel/panel-tianma-tl121bvms07-00.c   | 419 ++++++++++++++++++
 1 file changed, 419 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-tianma-tl121bvms07-00.c

diff --git a/drivers/gpu/drm/panel/panel-tianma-tl121bvms07-00.c b/drivers/gpu/drm/panel/panel-tianma-tl121bvms07-00.c
new file mode 100644
index 000000000000..5facffeda864
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-tianma-tl121bvms07-00.c
@@ -0,0 +1,419 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DRM panel driver for Tianma TL121BVMS07-00 12.1" MIPI-DSI TFT LCD panel
+ *
+ * Based on drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+ */
+
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
+
+#include <video/mipi_display.h>
+
+struct tm_panel;
+
+struct panel_desc {
+	const struct drm_display_mode *modes;
+	unsigned int bpc;
+
+	/**
+	 * @width_mm: width of the panel's active display area
+	 * @height_mm: height of the panel's active display area
+	 */
+	struct {
+		unsigned int width_mm;
+		unsigned int height_mm;
+	} size;
+
+	unsigned long mode_flags;
+	enum mipi_dsi_pixel_format format;
+	int (*init)(struct tm_panel *tm);
+	unsigned int lanes;
+	bool discharge_on_disable;
+	bool lp11_before_reset;
+};
+
+struct tm_panel {
+	struct drm_panel base;
+	struct mipi_dsi_device *dsi;
+
+	const struct panel_desc *desc;
+
+	enum drm_panel_orientation orientation;
+	struct regulator *pp1800;
+	struct regulator *avee;
+	struct regulator *avdd;
+	struct gpio_desc *enable_gpio;
+
+	bool prepared;
+};
+
+static int tm_tl121bvms07_00_init(struct tm_panel *tm)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = tm->dsi };
+	struct mipi_dsi_device *dsi = ctx.dsi;
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x5a, 0xa5, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3e, 0x62);
+
+
+	mipi_dsi_generic_write_seq(dsi, 0xff, 0x5a, 0xa5, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1b, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5e, 0x40);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x5a, 0xa5, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0X29, 0x00);
+
+	mipi_dsi_generic_write_seq(dsi, 0xff, 0x5a, 0xa5, 0x00);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0X11);
+
+	if (ctx.accum_err)
+		return ctx.accum_err;
+
+	msleep(120);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0X29);
+
+	if (ctx.accum_err)
+		return ctx.accum_err;
+
+	msleep(80);
+
+	return 0;
+};
+
+static inline struct tm_panel *to_tm_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct tm_panel, base);
+}
+
+static int tm_panel_enter_sleep_mode(struct tm_panel *tm)
+{
+	struct mipi_dsi_device *dsi = tm->dsi;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0)
+		return ret;
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int tm_panel_disable(struct drm_panel *panel)
+{
+	struct tm_panel *tm = to_tm_panel(panel);
+	int ret;
+
+	ret = tm_panel_enter_sleep_mode(tm);
+	if (ret < 0) {
+		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
+		return ret;
+	}
+
+	msleep(150);
+
+	return 0;
+}
+
+static int tm_panel_unprepare(struct drm_panel *panel)
+{
+	struct tm_panel *tm = to_tm_panel(panel);
+
+	if (!tm->prepared)
+		return 0;
+
+	if (tm->desc->discharge_on_disable) {
+		regulator_disable(tm->avee);
+		regulator_disable(tm->avdd);
+		usleep_range(5000, 7000);
+		gpiod_set_value(tm->enable_gpio, 0);
+		usleep_range(5000, 7000);
+		regulator_disable(tm->pp1800);
+	} else {
+		gpiod_set_value(tm->enable_gpio, 0);
+		usleep_range(1000, 2000);
+		regulator_disable(tm->avee);
+		regulator_disable(tm->avdd);
+		usleep_range(5000, 7000);
+		regulator_disable(tm->pp1800);
+	}
+
+	tm->prepared = false;
+
+	return 0;
+}
+
+static int tm_panel_prepare(struct drm_panel *panel)
+{
+	struct tm_panel *tm = to_tm_panel(panel);
+	int ret;
+
+	if (tm->prepared)
+		return 0;
+
+	ret = regulator_enable(tm->pp1800);
+	if (ret < 0)
+		return ret;
+
+	usleep_range(6000, 8000);
+
+	ret = regulator_enable(tm->avdd);
+	if (ret < 0)
+		goto poweroff1v8;
+	ret = regulator_enable(tm->avee);
+	if (ret < 0)
+		goto poweroffavdd;
+
+	usleep_range(11000, 12000);
+
+	gpiod_set_value(tm->enable_gpio, 1);
+
+	if (tm->desc->lp11_before_reset) {
+		ret = mipi_dsi_dcs_nop(tm->dsi);
+		if (ret < 0) {
+			dev_err(&tm->dsi->dev, "Failed to send NOP: %d\n", ret);
+			goto poweroff;
+		}
+		usleep_range(1000, 2000);
+	}
+	gpiod_set_value(tm->enable_gpio, 0);
+	usleep_range(1000, 2000);
+	gpiod_set_value(tm->enable_gpio, 1);
+	usleep_range(20000, 21000);
+
+	ret = tm->desc->init(tm);
+	if (ret < 0)
+		goto poweroff;
+
+	tm->prepared = true;
+	return 0;
+
+poweroff:
+	gpiod_set_value(tm->enable_gpio, 0);
+	regulator_disable(tm->avee);
+poweroffavdd:
+	regulator_disable(tm->avdd);
+poweroff1v8:
+	usleep_range(5000, 7000);
+	regulator_disable(tm->pp1800);
+
+	return ret;
+}
+
+static int tm_panel_enable(struct drm_panel *panel)
+{
+	msleep(130);
+	return 0;
+}
+
+static const struct drm_display_mode tm_tl121bvms07_00_default_mode = {
+	.clock = 264355,
+	.hdisplay = 1600,
+	.hsync_start = 1600 + 20,
+	.hsync_end = 1600 + 20 + 4,
+	.htotal = 1600 + 20 + 4 + 20,
+	.vdisplay = 2560,
+	.vsync_start = 2560 + 82,
+	.vsync_end = 2560 + 82 + 2,
+	.vtotal = 2560 + 82 + 2 + 36,
+};
+
+static const struct panel_desc tm_tl121bvms07_00_desc = {
+	.modes = &tm_tl121bvms07_00_default_mode,
+	.bpc = 8,
+	.size = {
+		.width_mm = 163,
+		.height_mm = 260,
+	},
+	.lanes = 3,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM,
+	.init = tm_tl121bvms07_00_init,
+	.lp11_before_reset = true,
+};
+
+static int tm_panel_get_modes(struct drm_panel *panel,
+			       struct drm_connector *connector)
+{
+	struct tm_panel *tm = to_tm_panel(panel);
+	const struct drm_display_mode *m = tm->desc->modes;
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, m);
+	if (!mode) {
+		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
+			m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
+		return -ENOMEM;
+	}
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	drm_mode_set_name(mode);
+	drm_mode_probed_add(connector, mode);
+
+	connector->display_info.width_mm = tm->desc->size.width_mm;
+	connector->display_info.height_mm = tm->desc->size.height_mm;
+	connector->display_info.bpc = tm->desc->bpc;
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
+	drm_connector_set_panel_orientation(connector, tm->orientation);
+
+	return 1;
+}
+
+static enum drm_panel_orientation tm_panel_get_orientation(struct drm_panel *panel)
+{
+	struct tm_panel *tm = to_tm_panel(panel);
+
+	return tm->orientation;
+}
+
+static const struct drm_panel_funcs tm_panel_funcs = {
+	.disable = tm_panel_disable,
+	.unprepare = tm_panel_unprepare,
+	.prepare = tm_panel_prepare,
+	.enable = tm_panel_enable,
+	.get_modes = tm_panel_get_modes,
+	.get_orientation = tm_panel_get_orientation,
+};
+
+static int tm_panel_add(struct tm_panel *tm)
+{
+	struct device *dev = &tm->dsi->dev;
+	int err;
+
+	tm->avdd = devm_regulator_get(dev, "avdd");
+	if (IS_ERR(tm->avdd))
+		return PTR_ERR(tm->avdd);
+
+	tm->avee = devm_regulator_get(dev, "avee");
+	if (IS_ERR(tm->avee))
+		return PTR_ERR(tm->avee);
+
+	tm->pp1800 = devm_regulator_get(dev, "pp1800");
+	if (IS_ERR(tm->pp1800))
+		return PTR_ERR(tm->pp1800);
+
+	tm->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(tm->enable_gpio)) {
+		dev_err(dev, "cannot get reset-gpios %ld\n",
+			PTR_ERR(tm->enable_gpio));
+		return PTR_ERR(tm->enable_gpio);
+	}
+
+	gpiod_set_value(tm->enable_gpio, 0);
+
+	tm->base.prepare_prev_first = true;
+
+	drm_panel_init(&tm->base, dev, &tm_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	err = of_drm_get_panel_orientation(dev->of_node, &tm->orientation);
+	if (err < 0) {
+		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, err);
+		return err;
+	}
+
+	err = drm_panel_of_backlight(&tm->base);
+	if (err)
+		return err;
+
+	tm->base.funcs = &tm_panel_funcs;
+	tm->base.dev = &tm->dsi->dev;
+
+	drm_panel_add(&tm->base);
+
+	return 0;
+}
+
+static int tm_panel_probe(struct mipi_dsi_device *dsi)
+{
+	struct tm_panel *tm;
+	int ret;
+	const struct panel_desc *desc;
+
+	tm = devm_kzalloc(&dsi->dev, sizeof(*tm), GFP_KERNEL);
+	if (!tm)
+		return -ENOMEM;
+
+	desc = of_device_get_match_data(&dsi->dev);
+	dsi->lanes = desc->lanes;
+	dsi->format = desc->format;
+	dsi->mode_flags = desc->mode_flags;
+	tm->desc = desc;
+	tm->dsi = dsi;
+	ret = tm_panel_add(tm);
+	if (ret < 0)
+		return ret;
+
+	mipi_dsi_set_drvdata(dsi, tm);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret)
+		drm_panel_remove(&tm->base);
+	return ret;
+}
+
+static void tm_panel_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct tm_panel *tm = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_disable(&tm->base);
+	drm_panel_unprepare(&tm->base);
+}
+
+static void tm_panel_remove(struct mipi_dsi_device *dsi)
+{
+	struct tm_panel *tm = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	tm_panel_shutdown(dsi);
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
+
+	if (tm->base.dev)
+		drm_panel_remove(&tm->base);
+}
+
+static const struct of_device_id tm_of_match[] = {
+	{ .compatible = "tianma,tl121bvms07-00",
+	  .data = &tm_tl121bvms07_00_desc
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, tm_of_match);
+
+static struct mipi_dsi_driver tm_panel_driver = {
+	.driver = {
+		.name = "panel-tianma-tl121bvms07-00",
+		.of_match_table = tm_of_match,
+	},
+	.probe = tm_panel_probe,
+	.remove = tm_panel_remove,
+	.shutdown = tm_panel_shutdown,
+};
+module_mipi_dsi_driver(tm_panel_driver);
+
+MODULE_AUTHOR("Langyan Ye <yelangyan@huaqin.corp-partner.google.com>");
+MODULE_DESCRIPTION("TM tl121bvms07-00 1600x2560 video mode panel driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

