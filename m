Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2238991D32A
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 20:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831BF10E2B3;
	Sun, 30 Jun 2024 18:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="WSj41HZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com
 [91.218.175.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820ED10E2B8
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2024 18:36:51 +0000 (UTC)
X-Envelope-To: robh@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1719772610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P9ZFsw5xKwfg6vVcqc1X4au1s1qxxzW1yFV8kIX9ZSE=;
 b=WSj41HZMGv+5oU1m0ZUCu94priRa8IH+Xf+qpfZZXkMKcVQBHwQnOLpZUSlDoLnH7/DbLD
 vGpzC5/N21SSH/ixqqfq3tTutZkjzwIIiTHO5ZayFUU2BNC/2Wxi8f6+6EDUNhR2viYEz6
 v5OkQG/f6CQGp7GYrO5C49twKxJdjTVmBNGE5ubWH8WYM/5PlGXLqYXn14/Npqn80eAsXi
 DPeM6HL89XghS3hklKVG0hdFPmGFK+9/CzjQxEL8vUzA00BnGvIVEoNZczgqScbOIkTLBS
 WXvyxtWlWBVwi+qWvPkjzArcx7BeFGnJIPVQUy9Eoah3OAF/CR0ytuSEyAX2Yw==
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
X-Envelope-To: dmitry.torokhov@gmail.com
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: caleb@postmarketos.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: dmitry.baryshkov@linaro.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: andersson@kernel.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
Date: Sun, 30 Jun 2024 20:36:29 +0200
Subject: [PATCH v2 6/8] drm/panel: add driver for samsung amb655x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240630-oneplus8-v2-6-c4a1f8da74f1@postmarketos.org>
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
In-Reply-To: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
To: Caleb Connolly <caleb@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
X-Developer-Signature: v=1; a=openpgp-sha256; l=16049;
 i=caleb@postmarketos.org; h=from:subject:message-id;
 bh=EPwneTSUtmzFjis/lUpYnHTx38d8qVEWHysAJM4/3lo=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmgaWzuaPi7F90lxPkFwq9649JuWMaX2MePgXr1
 GADhQASGl+JAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZoGlswAKCRAFgzErGV9k
 trKID/9DttHjwt+bJmb9SIFBqofaHu3tELGSP04/SURKKIAzjTUWMdcVjTbpCXOiZ04C9N4PVhB
 x1/UFpfNaPUvWNX21ymPjCw8nhLYL3eZRPSs6gsskbCy73UfMEY2uHzx/vxsqIYJdYyxOSMi46w
 HqHo/kt0HEXv+elYqv+L8OYeeQ2jPT9qnjTenfbSaaA3xx5lOVvG0l96gVetbp30RYUSyYxirt+
 41U7Yfvrrr2nt0gMUVAM4hxnUgAN2RrNBcDI+DLtfdM52hEExbD0AXYrKz3qvIEr6oGSKKyoxFj
 0rrbP8n0eqi1C125OamKGZ7jMW2MC5RWXS/bRYAQzZw6meShgU21IPLYyOGfnsj6F725OtAFXTy
 pRRTLoRicuMyRqSW6R+De6xVt7/mq6UFPexQWmPg7Er0aWbF4ww1Iv8xRNtuju9hp1c4Q+iKyYp
 lvv1Cn/05l6JR6shMeW90qMVWCfquSQWJA7oiQ3yF8ZPnPC5BW0lJpA/te5y3NsE6ciB8zwGn2U
 6F65ziTCjY+Sy391weuqghqPdqw1qUA7313/r1ZnQZMgB+4Fxj3zdkUQpSByUkeBimXlwWv0Bh2
 2k+bxioFuiVYcateYk6Lmls2murBA/WJCnkbfQPXJPspdMD56Vmk5Aa3TV3PK45gRkcOGZuyCcr
 Kao3oOGwoIWGtVg==
X-Developer-Key: i=caleb@postmarketos.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Migadu-Flow: FLOW_OUT
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

This is a 1080x2400 120hz panel used on the OnePlus 8T. It uses DSC but
with many non-standard DCS commands.

The only user of this panel (the OnePlus 8T) has a bug somewhere in the
DSI stack whereby it isn't possible to properly initialize this panel
after a reset. As a result, the reset GPIO is made optional so it can be
left unused on that device.

Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
---
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-samsung-amb655x.c | 399 ++++++++++++++++++++++++++
 4 files changed, 416 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 807feae089c4..2b9cfbf92d7a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7142,8 +7142,15 @@ M:	Robert Chiras <robert.chiras@nxp.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
 F:	drivers/gpu/drm/panel/panel-raydium-rm67191.c
 
+DRM DRIVER FOR SAMSUNG AMB655X PANEL
+M:	Caleb Connolly <caleb@postmarketos.org>
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
+F:	drivers/gpu/drm/panel/panel-samsung-amb655x.c
+
 DRM DRIVER FOR SAMSUNG DB7430 PANELS
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index bf4eadfe21cb..7203d16ab20a 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -590,8 +590,17 @@ config DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01
 	depends on OF
 	select DRM_MIPI_DSI
 	select VIDEOMODE_HELPERS
 
+config DRM_PANEL_SAMSUNG_AMB655X
+	tristate "Samsung AMB655X DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  DRM panel driver for the Samsung AMB655X panel.
+	  This panel has a resolution of 1080x2400 @ 60hz or 120Hz.
+
 config DRM_PANEL_SAMSUNG_ATNA33XC20
 	tristate "Samsung ATNA33XC20 eDP panel"
 	depends on OF
 	depends on BACKLIGHT_CLASS_DEVICE
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 051b75b3df7b..be6d500a56a4 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -58,8 +58,9 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67191) += panel-raydium-rm67191.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMB655X) += panel-samsung-amb655x.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20) += panel-samsung-atna33xc20.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-amb655x.c b/drivers/gpu/drm/panel/panel-samsung-amb655x.c
new file mode 100644
index 000000000000..945346e84f68
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-amb655x.c
@@ -0,0 +1,399 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+//   Copyright (c) 2015-2017, The Linux Foundation. All rights reserved.
+//   Copyright (c) 2024 Caleb Connolly <caleb@postmarketos.org>
+
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct samsung_amb655x {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct drm_dsc_config dsc;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[3];
+};
+
+static inline
+struct samsung_amb655x *to_samsung_amb655x(struct drm_panel *panel)
+{
+	return container_of(panel, struct samsung_amb655x, panel);
+}
+
+static void samsung_amb655x_reset(struct samsung_amb655x *amb655x)
+{
+	gpiod_set_value_cansleep(amb655x->reset_gpio, 0);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(amb655x->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(amb655x->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int samsung_amb655x_on(struct samsung_amb655x *amb655x)
+{
+	struct drm_dsc_picture_parameter_set pps;
+	struct mipi_dsi_device *dsi = amb655x->dsi;
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	drm_dsc_pps_payload_pack(&pps, &amb655x->dsc);
+
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_buffer_multi(&ctx, &pps, sizeof(pps));
+	mipi_dsi_dcs_write_long_multi(&ctx, 0x9d, 0x01);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xf0, 0xa5, 0xa5);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 11);
+
+	/* VLIN CURRENT LIMIT */
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xb0, 0x04);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xd5, 0x24, 0x9e, 0x9e, 0x00, 0x20);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xf0, 0xa5, 0xa5);
+
+	/* OSC Select */
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xfc, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xb0, 0x16);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xd1, 0x22);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xd6, 0x11);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xfc, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xf0, 0xa5, 0xa5);
+
+	/* TE ON */
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_long_multi(&ctx, MIPI_DCS_SET_TEAR_ON, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xf0, 0xa5, 0xa5);
+
+	/* TSP Setting */
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xdf, 0x83, 0x00, 0x10);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xb0, 0x01);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xe6, 0x01);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xf0, 0xa5, 0xa5);
+
+	mipi_dsi_dcs_set_column_address_multi(&ctx, 0x0000, 1080 - 1);
+	mipi_dsi_dcs_set_page_address_multi(&ctx, 0x0000, 2400 - 1);
+
+	/* FD Setting */
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xd5, 0x8d);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xb0, 0x0a);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xd5, 0x05);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xf0, 0xa5, 0xa5);
+
+	/* FFC Function */
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xfc, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xb0, 0x01);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xe4, 0xa6, 0x75, 0xa3);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xe9,
+				      0x11, 0x75, 0xa6, 0x75,
+				      0xa3, 0x4b, 0x17, 0xac,
+				      0x4b, 0x17, 0xac, 0x00,
+				      0x19, 0x19);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xfc, 0xa5, 0xa5);
+	mipi_dsi_msleep(&ctx, 61);
+
+	/* Dimming Setting */
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xb0, 0x06);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xb7, 0x01);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xb0, 0x05);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xb7, 0x13);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xb0, 0x01);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xb7, 0x4c);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xf0, 0xa5, 0xa5);
+
+	mipi_dsi_dcs_write_long_multi(&ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+
+	/* refresh rate Transition */
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xf0, 0x5a, 0x5a);
+	/* 60 Hz */
+	//mipi_dsi_dcs_write_long_multi(&ctx, 0x60, 0x00);
+	/* 120 Hz */
+	mipi_dsi_dcs_write_long_multi(&ctx, 0x60, 0x10);
+
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xf0, 0xa5, 0xa5);
+
+	/* ACL Mode */
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_long_multi(&ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+	mipi_dsi_msleep(&ctx, 110);
+
+	mipi_dsi_dcs_write_long_multi(&ctx, 0x9F, 0x5A, 0x5A);
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
+	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_ENTER_NORMAL_MODE);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0x9F, 0xA5, 0xA5);
+
+	return ctx.accum_err;
+}
+
+static int samsung_amb655x_off(struct samsung_amb655x *amb655x)
+{
+	struct mipi_dsi_device *dsi = amb655x->dsi;
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_write_long_multi(&ctx, 0x9f, 0x5a, 0x5a);
+
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 20);
+
+	mipi_dsi_dcs_set_display_off_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 20);
+
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
+	mipi_dsi_dcs_write_long_multi(&ctx, 0x9f, 0xa5, 0xa5);
+
+	mipi_dsi_msleep(&ctx, 150);
+
+	return ctx.accum_err;
+}
+
+static int samsung_amb655x_prepare(struct drm_panel *panel)
+{
+	struct samsung_amb655x *ctx = to_samsung_amb655x(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	/*
+	 * During the first call to prepare, the regulators are already enabled
+	 * since they're boot-on. Avoid enabling them twice so we keep the refcounts
+	 * balanced.
+	 */
+	if (!regulator_is_enabled(ctx->supplies[0].consumer)) {
+		ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+		if (ret) {
+			dev_err(dev, "Failed to enable regulators: %d\n", ret);
+			return ret;
+		}
+	}
+
+	samsung_amb655x_reset(ctx);
+
+	ret = samsung_amb655x_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		return ret;
+	}
+
+	msleep(28);
+
+	return 0;
+}
+
+static int samsung_amb655x_unprepare(struct drm_panel *panel)
+{
+	struct samsung_amb655x *amb655x = to_samsung_amb655x(panel);
+	struct device *dev = &amb655x->dsi->dev;
+	int ret;
+
+	ret = samsung_amb655x_off(amb655x);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(amb655x->reset_gpio, 1);
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(amb655x->supplies), amb655x->supplies);
+	if (ret) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct drm_display_mode samsung_amb655x_120_mode = {
+	.clock = (1080 + 52 + 24 + 24) * (2400 + 4 + 4 + 8) * 120 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 52,
+	.hsync_end = 1080 + 52 + 24,
+	.htotal = 1080 + 52 + 24 + 24,
+	.vdisplay = 2400,
+	.vsync_start = 2400 + 4,
+	.vsync_end = 2400 + 4 + 4,
+	.vtotal = 2400 + 4 + 4 + 8,
+	.width_mm = 70,
+	.height_mm = 151,
+};
+
+static int samsung_amb655x_get_modes(struct drm_panel *panel,
+				     struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &samsung_amb655x_120_mode);
+	if (!mode)
+		return -ENOMEM;
+
+	drm_mode_set_name(mode);
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs samsung_amb655x_panel_funcs = {
+	.prepare = samsung_amb655x_prepare,
+	.unprepare = samsung_amb655x_unprepare,
+	.get_modes = samsung_amb655x_get_modes,
+};
+
+static int samsung_amb655x_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+	int ret;
+
+	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static const struct backlight_ops samsung_amb655x_bl_ops = {
+	.update_status = samsung_amb655x_bl_update_status,
+};
+
+static struct backlight_device *
+samsung_amb655x_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 2047,
+		.max_brightness = 2047,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &samsung_amb655x_bl_ops, &props);
+}
+
+static int samsung_amb655x_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct samsung_amb655x *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->supplies[0].supply = "vddio";
+	ctx->supplies[1].supply = "vdd";
+	ctx->supplies[2].supply = "avdd";
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to get vddio regulator\n");
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret)
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+
+	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+
+	drm_panel_init(&ctx->panel, dev, &samsung_amb655x_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = samsung_amb655x_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	/* This panel only supports DSC; unconditionally enable it */
+	dsi->dsc = &ctx->dsc;
+
+	ctx->dsc.dsc_version_major = 1;
+	ctx->dsc.dsc_version_minor = 1;
+
+	/* TODO: Pass slice_per_pkt = 2 */
+	ctx->dsc.slice_height = 30;
+	ctx->dsc.slice_width = 540;
+	/*
+	 * TODO: hdisplay should be read from the selected mode once
+	 * it is passed back to drm_panel (in prepare?)
+	 */
+	WARN_ON(1080 % ctx->dsc.slice_width);
+	ctx->dsc.slice_count = 1080 / ctx->dsc.slice_width;
+	ctx->dsc.bits_per_component = 8;
+	ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
+	ctx->dsc.block_pred_enable = true;
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void samsung_amb655x_remove(struct mipi_dsi_device *dsi)
+{
+	struct samsung_amb655x *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id samsung_amb655x_of_match[] = {
+	{ .compatible = "samsung,amb655x" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, samsung_amb655x_of_match);
+
+static struct mipi_dsi_driver samsung_amb655x_driver = {
+	.probe = samsung_amb655x_probe,
+	.remove = samsung_amb655x_remove,
+	.driver = {
+		.name = "panel-samsung-amb655x",
+		.of_match_table = samsung_amb655x_of_match,
+	},
+};
+module_mipi_dsi_driver(samsung_amb655x_driver);
+
+MODULE_AUTHOR("Caleb Connolly <caleb@postmarketos.org>");
+MODULE_DESCRIPTION("DRM driver for Samsung AMB655X DSC DSI panel");
+MODULE_LICENSE("GPL");

-- 
2.45.0

