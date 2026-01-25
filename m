Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEFeLmcYdmnXLgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 14:19:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAAE80A2B
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 14:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F9E10E17C;
	Sun, 25 Jan 2026 13:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XvpDn34i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C886A10E133
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 13:19:29 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4801bc328easo42170175e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 05:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769347168; x=1769951968; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wiE33LyxEJX3/UL2a7lOhkiHlYQtFsPfGjbbIbdNsMo=;
 b=XvpDn34iU6PnHkhMFlEi48m2rrB29bejw3FnIXRMHu0GEkKw8djVxNGABPP5Cx6QY5
 CQKjaXJ1Xf3NZOjR6N2ejvTYMh389P7bsu0AL3YDpKHwQU3XPcwawNQD3dJWtH93QH4z
 LilUcFFb94QP8N/q6vdcx9I9y+YqpTYbde6vJq6v8/HTMV2GEddvdtNGx+wyE8CqB+KT
 uMjLpS5iS/mJcWN6cUO2JxSrkZAIeRVS+YGIcK8kCEF6DHQUibjAM3lM6opFK+URl2Kt
 oa6DzZ79qg7Jt00Fs3mjZ2cB6kKHBvDxLnXXiazcE3WdWdEid7Q1G3KTeqPWPQjeEhvl
 qwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769347168; x=1769951968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wiE33LyxEJX3/UL2a7lOhkiHlYQtFsPfGjbbIbdNsMo=;
 b=ggFKwg6nCa4X6/cGqfBRgaoJdt3ZnjXA75Q9Fx9ZnH5LfostC//A5WNAF8+A5yRsHo
 rDITzgLxoqHDQrpf3q5NogYrtUE4HRBT5d3wmW2C0VgpsATYni0ja/Qf4EG+IlKG5/u1
 s9lEGVQc5wzleMkbk36Y0pSQ5YXATyvExsS5JZDJ00WMoW3Vit+/3/8hTHDhbtlSfyXC
 lD4mIVn546tz/ppiS/qF6dNeuUJOpwDj8AbtamH/m478VyZtPAQCOa0l22TnUvm6sU3u
 kM6Y0FM3os1usWFnkRv7IVGblU98p6wGz33qEWtKGpkjjLT7rdJimsCMB2wmWlcZ5sVQ
 znNQ==
X-Gm-Message-State: AOJu0Yz2z7IyjJdzNTKXRMKTOBV7S4itSWPF8X0bNyZHPCM42jexlPk4
 MMqNTQGuZdEKG7ahphnv4OBdpMxzc6MSAQr4sTCgydrJn3b6hTYxhTpy
X-Gm-Gg: AZuq6aKEHsaFiSZHc3f+qUoW4/YxjVd1CVJcZaWPcd58QSg29MRvvinlDcsvrYMO7Bo
 6OBcA22wYYF8l37O+MeZx7WfRuMwWZOYBatzUQ9jpnyGZYGL6LRbCM0QVxV9mJugHGRMzfTOvzR
 /gZ3xK85v+gDVQBCTFVaOhZoJsUwlwsxOBb6oySRK979g4/shBCSjPypxxQosTn/NGYB1CyXDr5
 RB5G1N9k/HHuiP2giF3In2V5R4vGmdiblwlFV/cEe6dwLSq1sOjZwKwY3ncGWwQgEmQtYGwUCJC
 OMIY04DtpTw3D1ZeN5YchvwOqzWHon+cWlWbDD0pJrWTfVQnF+FTL0Wp0jih6hIRvJCrBVjg1ZB
 sc4me4gFKX2yf4vqTznpxP3PgDQhgEyGtT1sRac5yhg4oWzheHfroHhhzRO/poVNAAMbQEnFk9C
 sO
X-Received: by 2002:a05:600c:820b:b0:477:58af:a91d with SMTP id
 5b1f17b1804b1-4805ce44046mr24397115e9.5.1769347168186; 
 Sun, 25 Jan 2026 05:19:28 -0800 (PST)
Received: from xeon ([188.163.112.49]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48047028928sm382382215e9.2.2026.01.25.05.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 05:19:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] gpu/drm: panel: add support for DSI panel used in
 Motorola Atrix 4G and Droid X2
Date: Sun, 25 Jan 2026 15:19:04 +0200
Message-ID: <20260125131904.45372-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125131904.45372-1-clamor95@gmail.com>
References: <20260125131904.45372-1-clamor95@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,oss.qualcomm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jessica.zhang@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6BAAE80A2B
X-Rspamd-Action: no action

Add support for the DSI LCD panel module found in Motorola Atrix 4G or
Droid X2 smartphones. Exact panel vendor and model are unknown hence panel
uses generic compatible based on board where it is used. The panel has a
540x960 resolution with 24 bit RGB per pixel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig              |  12 +
 drivers/gpu/drm/panel/Makefile             |   1 +
 drivers/gpu/drm/panel/panel-motorola-mot.c | 244 +++++++++++++++++++++
 3 files changed, 257 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-motorola-mot.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 35d894752688..bf4d244e7a0d 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -451,6 +451,18 @@ config DRM_PANEL_MANTIX_MLAF057WE51
 	  has a resolution of 720x1440 pixels, a built in backlight and touch
 	  controller.
 
+config DRM_PANEL_MOTOROLA_MOT
+	tristate "Atrix 4G and Droid X2 540x960 DSI video mode panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select VIDEOMODE_HELPERS
+	help
+	  Say Y here if you want to enable support for the LCD panel module
+	  for Motorola Atrix 4G or Droid X2. Exact panel vendor and model are
+	  unknown. The panel has a 540x960 resolution and uses 24 bit RGB per
+	  pixel.
+
 config DRM_PANEL_NEC_NL8048HL11
 	tristate "NEC NL8048HL11 RGB panel"
 	depends on GPIOLIB && OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 3848c0d768ba..721db1e3631b 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
 obj-$(CONFIG_DRM_PANEL_LG_SW43408) += panel-lg-sw43408.o
 obj-$(CONFIG_DRM_PANEL_MAGNACHIP_D53E6EA8966) += panel-magnachip-d53e6ea8966.o
+obj-$(CONFIG_DRM_PANEL_MOTOROLA_MOT) += panel-motorola-mot.o
 obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
 obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3051D) += panel-newvision-nv3051d.o
 obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3052C) += panel-newvision-nv3052c.o
diff --git a/drivers/gpu/drm/panel/panel-motorola-mot.c b/drivers/gpu/drm/panel/panel-motorola-mot.c
new file mode 100644
index 000000000000..eb1f86c3d704
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-motorola-mot.c
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/array_size.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+static const struct regulator_bulk_data mot_panel_supplies[] = {
+	{ .supply = "vddio" }, { .supply = "vdd" },
+};
+
+struct mot_panel {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+
+	struct gpio_desc *reset_gpio;
+
+	struct regulator_bulk_data *supplies;
+};
+
+static inline struct mot_panel *to_mot_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct mot_panel, panel);
+}
+
+static void mot_panel_reset(struct mot_panel *priv)
+{
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+	usleep_range(50000, 51000);
+	gpiod_set_value_cansleep(priv->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static void mot_es2(struct mipi_dsi_multi_context *ctx)
+{
+	mipi_dsi_generic_write_seq_multi(ctx, 0x55, 0x01);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(ctx);
+	mipi_dsi_msleep(ctx, 120);
+
+	mipi_dsi_generic_write_seq_multi(ctx, 0xf4, 0x00, 0xbb, 0x46, 0x53, 0x0c, 0x49,
+					 0x74, 0x29, 0x12, 0x15, 0x2f, 0x2f, 0x04);
+	mipi_dsi_generic_write_seq_multi(ctx, 0xf8, 0x4b, 0x04, 0x10, 0x1a, 0x2c, 0x2c,
+					 0x2c, 0x2c, 0x14, 0x12);
+
+	mipi_dsi_generic_write_seq_multi(ctx, 0xb5, 0x03, 0x7f, 0x00, 0x80, 0xc7, 0x00);
+	mipi_dsi_generic_write_seq_multi(ctx, 0xb7, 0x66, 0xf6, 0x46, 0x9f, 0x90, 0x99,
+					 0xff, 0x80, 0x6d, 0x01);
+
+	/* Gamma R */
+	mipi_dsi_generic_write_seq_multi(ctx, 0xf9, 0x04);
+	mipi_dsi_generic_write_seq_multi(ctx, 0xfa, 0x00, 0x2f, 0x30, 0x12, 0x0e, 0x0c,
+					 0x22, 0x27, 0x31, 0x2e, 0x07, 0x0f);
+	mipi_dsi_generic_write_seq_multi(ctx, 0xfb, 0x00, 0x2f, 0x30, 0x12, 0x0e, 0x0c,
+					 0x22, 0x27, 0x31, 0x2e, 0x07, 0x0f);
+
+	/* Gamma G */
+	mipi_dsi_generic_write_seq_multi(ctx, 0xf9, 0x02);
+	mipi_dsi_generic_write_seq_multi(ctx, 0xfa, 0x00, 0x2f, 0x37, 0x15, 0x15, 0x11,
+					 0x1f, 0x25, 0x2d, 0x2a, 0x05, 0x0f);
+	mipi_dsi_generic_write_seq_multi(ctx, 0xfb, 0x00, 0x2f, 0x37, 0x15, 0x15, 0x11,
+					 0x1f, 0x25, 0x2d, 0x2a, 0x05, 0x0f);
+
+	/* Gamma B */
+	mipi_dsi_generic_write_seq_multi(ctx, 0xf9, 0x01);
+	mipi_dsi_generic_write_seq_multi(ctx, 0xfa, 0x00, 0x2f, 0x3f, 0x16, 0x1f, 0x15,
+					 0x1f, 0x25, 0x2d, 0x2b, 0x06, 0x0b);
+	mipi_dsi_generic_write_seq_multi(ctx, 0xfb, 0x00, 0x2f, 0x3f, 0x16, 0x1f, 0x15,
+					 0x1f, 0x25, 0x2d, 0x2b, 0x06, 0x0b);
+
+	/* Gamma W */
+	mipi_dsi_generic_write_seq_multi(ctx, 0xf9, 0x20);
+	mipi_dsi_generic_write_seq_multi(ctx, 0xfa, 0x00, 0x2f, 0x34, 0x15, 0x1a, 0x11,
+					 0x1f, 0x23, 0x2d, 0x29, 0x02, 0x08);
+	mipi_dsi_generic_write_seq_multi(ctx, 0xfb, 0x00, 0x2f, 0x34, 0x15, 0x1a, 0x11,
+					 0x1f, 0x23, 0x2d, 0x29, 0x02, 0x08);
+
+	mipi_dsi_generic_write_seq_multi(ctx, 0x53, 0x2c);
+	mipi_dsi_generic_write_seq_multi(ctx, 0x35, 0x00);
+}
+
+static int mot_panel_prepare(struct drm_panel *panel)
+{
+	struct mot_panel *priv = to_mot_panel(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
+	struct device *dev = panel->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(mot_panel_supplies), priv->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable power supplies: %d\n", ret);
+		return ret;
+	}
+
+	mot_panel_reset(priv);
+
+	mipi_dsi_generic_write_seq_multi(&ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_generic_write_seq_multi(&ctx, 0xf1, 0x5a, 0x5a);
+	mipi_dsi_generic_write_seq_multi(&ctx, 0xd0, 0x8e);
+
+	mot_es2(&ctx);
+
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 20);
+
+	return ctx.accum_err;
+}
+
+static int mot_panel_disable(struct drm_panel *panel)
+{
+	struct mot_panel *priv = to_mot_panel(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 70);
+
+	return ctx.accum_err;
+}
+
+static int mot_panel_unprepare(struct drm_panel *panel)
+{
+	struct mot_panel *priv = to_mot_panel(panel);
+
+	usleep_range(10000, 11000);
+
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+	usleep_range(5000, 6000);
+
+	regulator_bulk_disable(ARRAY_SIZE(mot_panel_supplies), priv->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode mot_panel_mode = {
+	.clock = (540 + 32 + 32 + 16) * (960 + 12 + 12 + 8) * 60 / 1000,
+	.hdisplay = 540,
+	.hsync_start = 540 + 32,
+	.hsync_end = 540 + 32 + 32,
+	.htotal = 540 + 32 + 32 + 16,
+	.vdisplay = 960,
+	.vsync_start = 960 + 12,
+	.vsync_end = 960 + 12 + 12,
+	.vtotal = 960 + 12 + 12 + 8,
+	.width_mm = 51,
+	.height_mm = 91,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static int mot_panel_get_modes(struct drm_panel *panel,
+			       struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &mot_panel_mode);
+}
+
+static const struct drm_panel_funcs mot_panel_panel_funcs = {
+	.prepare = mot_panel_prepare,
+	.disable = mot_panel_disable,
+	.unprepare = mot_panel_unprepare,
+	.get_modes = mot_panel_get_modes,
+};
+
+static int mot_panel_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct mot_panel *priv;
+	int ret;
+
+	priv = devm_drm_panel_alloc(dev, struct mot_panel, panel,
+				    &mot_panel_panel_funcs,
+				    DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(mot_panel_supplies),
+					    mot_panel_supplies, &priv->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get supplies\n");
+
+	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						   GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
+				     "failed to get reset gpios\n");
+
+	priv->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, priv);
+
+	dsi->lanes = 2;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_LPM;
+
+	ret = drm_panel_of_backlight(&priv->panel);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get backlight\n");
+
+	drm_panel_add(&priv->panel);
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0) {
+		drm_panel_remove(&priv->panel);
+		return dev_err_probe(dev, ret, "failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void mot_panel_remove(struct mipi_dsi_device *dsi)
+{
+	struct mot_panel *priv = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_remove(&priv->panel);
+}
+
+static const struct of_device_id mot_panel_of_match[] = {
+	{ .compatible = "motorola,mot-panel" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mot_panel_of_match);
+
+static struct mipi_dsi_driver mot_panel_driver = {
+	.driver = {
+		.name = "panel-motorola-mot",
+		.of_match_table = mot_panel_of_match,
+	},
+	.probe = mot_panel_probe,
+	.remove = mot_panel_remove,
+};
+module_mipi_dsi_driver(mot_panel_driver);
+
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("Motorola MOT panel driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0

