Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685EFCD46AF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 00:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DC210E45B;
	Sun, 21 Dec 2025 23:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990A110E44C
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 23:32:23 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 056CB1F8F4;
 Mon, 22 Dec 2025 00:32:20 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 22 Dec 2025 00:32:13 +0100
Subject: [PATCH v2 07/11] drm/panel: Add panel driver for Samsung SOFEF03-M
 DDIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-drm-panels-sony-v2-7-82a87465d163@somainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
In-Reply-To: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Casey Connolly <casey.connolly@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=15612;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=MoTvtDR5OLqdv3Xf0lrnPYulOnh4TDvo2jKiD8fpc00=;
 b=owEBbQKS/ZANAwAKAfFi0jHH5IZ2AcsmYgBpSIN7rwmDYyhNKFNFbMTxMBe+twniHpYaDu6HC
 Zn9+uf7GSGJAjMEAAEKAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCaUiDewAKCRDxYtIxx+SG
 dsFlD/9QFC8HNHOxyZN/oYztQixd6hAREE3UW7PQx5BAnBC8a2UjDm4MRR4SI5H5I0OdSpFz277
 R3x67bSnj4lE0GDxFhfV8IMiN+bUFphfIOsWxYe9uq1Ls/dhHvyGrq6L5HbkQuJkhlQmqMeNoef
 wUx2g41uRA0MRVSK0nXqfQj5hXVd0/jGbZyPOMjConXXejqVGWi6aku41bwKn18303YYJwesV9Y
 e1JZUwDthyFMJms+sJO8aP9KqyPCx/TgxS1g7qtc7v/3jtnKPleluJHqZvHAveCAk2MEMthana8
 2CN32kjKWY/z5Vo4jAv+NkJTQP6aykyyENsF2TR69xoiqaJJTEs3AD4O6W5A7h7tIdU91bmAb4g
 8m1nredGuxdVxwy5WmU0qtc+R8hK1D3Nf5+TzzKC31PiRN1SxvHZ4a+OI4WuHzs909pOKERjSvB
 zTHS3Ldk/kqFOey6VlLqJ0j4KIO9JB5KluQIB1+SbybSAJjclO6httwAj3AY1O5wAWfQiqIl5a1
 /AJwU83/HxloBHVNvr08pZoITZmI4XRgBYb5ioTXbdQXndLTI3DxkYsEPMjb7Bs9vrfJ4Uy7HK7
 WDpoF4heI2LL4URfvP+VmGtgm/FL4DssvJmHE+TooqFkJgmVGOuev0acWK7p4zE0ZVj2iyu7WOK
 f0cPf2YSFQgH9yA==
X-Developer-Key: i=marijn.suijten@somainline.org; a=openpgp;
 fpr=4E8B01B9A5BEA56B5FD66716F162D231C7E48676
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

The SOFEF03-M Display-Driver-IC is paired with a amb609vp01 panel on
the Sony Xperia 5 II and amb609vp04 panel on the Sony Xperia 5 III. It
requires Display Stream Compression 1.1 which allows the panels to run
at 120Hz, even though a 60Hz mode is available too.

Downstream porch values are retained; despite not being used in
command-mode they are useful to artificially bump the clock values to
account for "transfer overhead" while that calculation is still missing
from the MSM DSI host driver.

Co-developed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/panel/Kconfig                 |  16 ++
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-samsung-sofef03.c | 373 ++++++++++++++++++++++++++
 4 files changed, 391 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e48dd7f5a115..28135743ca0c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8204,6 +8204,7 @@ DRM DRIVER FOR SAMSUNG SOFEF03 DDIC
 M:	Marijn Suijten <marijn.suijten@somainline.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,sofef03-m.yaml
+F:	drivers/gpu/drm/panel/panel-samsung-sofef03.c
 
 DRM DRIVER FOR SHARP MEMORY LCD
 M:	Alex Lanzano <lanzano.alex@gmail.com>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 2f06b48dfb89..1f148bc5b068 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -953,6 +953,22 @@ config DRM_PANEL_SAMSUNG_SOFEF01
 
 	  This Display-IC features a fixed 1080x2520@60 mode.
 
+config DRM_PANEL_SAMSUNG_SOFEF03
+	tristate "Samsung SOFEF03-M DSI cmd mode panels"
+	depends on GPIOLIB
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DSC_HELPER
+	select DRM_DISPLAY_HELPER
+	help
+	  Say Y or M here if you want to enable support for the Samsung 6.1" AMOLED
+	  DSI command mode panel found in the Sony Xperia 5 II and Sony Xperia 5 III
+	  smartphones (both amb609vp01 panel).
+
+	  This Display-IC uses Display Stream Compression 1.1 and features a
+	  1080x2520@60 and 1080x2520@120 mode.
+
 config DRM_PANEL_SEIKO_43WVF1G
 	tristate "Seiko 43WVF1G panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index cbd9ef23b8d8..a9636f5f433a 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -95,6 +95,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01) += panel-samsung-s6e8aa5x01-ams561ra01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) += panel-samsung-sofef00.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF01) += panel-samsung-sofef01.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF03) += panel-samsung-sofef03.o
 obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) += panel-seiko-43wvf1g.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LQ079L1SX01) += panel-sharp-lq079l1sx01.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) += panel-sharp-lq101r1sx01.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef03.c b/drivers/gpu/drm/panel/panel-samsung-sofef03.c
new file mode 100644
index 000000000000..f9399aab0623
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef03.c
@@ -0,0 +1,373 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Konrad Dybcio <konrad.dybcio@linaro.org>
+ * Copyright (c) 2023 Marijn Suijten <marijn.suijten@somainline.org>
+ *
+ * Based on the following Sony downstream DTS command sequences:
+ * - Xperia 5 II (edo pdx206): https://github.com/sonyxperiadev/kernel-copyleft-dts/blob/58.2.A.10.xxx/somc/dsi-panel-sofef03_m-fhd_plus.dtsi
+ *  - Xperia 5 III (sagami pdx214): https://github.com/sonyxperiadev/kernel-copyleft-dts/blob/61.2.A.0.xxx/somc/dsi-panel-sofef03_m-amb609vp01-fhd_plus.dtsi
+ */
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
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
+
+#define WRITE_CONTROL_DISPLAY_BACKLIGHT BIT(5)
+
+/*
+ * TODO: This should be communicated via the mode when .prepare
+ * receives atomic commit info
+ */
+static const bool enable_120hz = true;
+
+struct samsung_sofef03_m {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct drm_dsc_config dsc;
+	struct regulator *vddio, *vci;
+	struct gpio_desc *reset_gpio;
+};
+
+static inline struct samsung_sofef03_m *
+to_samsung_sofef03_m(struct drm_panel *panel)
+{
+	return container_of(panel, struct samsung_sofef03_m, panel);
+}
+
+static void samsung_sofef03_m_reset(struct samsung_sofef03_m *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int samsung_sofef03_m_program(struct samsung_sofef03_m *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	dsi_ctx.dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9d, 0x01);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 10);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd5, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xee, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, 1080 - 1);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, 2520 - 1);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x83);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xec, 0x02, 0x00, 0x1c, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xec, 0x01, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     WRITE_CONTROL_DISPLAY_BACKLIGHT);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x2d, 0x27);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, enable_120hz ? 0x10 : 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_msleep(&dsi_ctx, 110);
+
+	return dsi_ctx.accum_err;
+}
+
+static int samsung_sofef03_m_prepare(struct drm_panel *panel)
+{
+	struct samsung_sofef03_m *ctx = to_samsung_sofef03_m(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+	struct drm_dsc_picture_parameter_set pps;
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_enable(ctx->vddio);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable vddio regulator: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_enable(ctx->vci);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable vci regulator: %d\n", ret);
+		regulator_disable(ctx->vddio);
+		return ret;
+	}
+
+	samsung_sofef03_m_reset(ctx);
+
+	ret = samsung_sofef03_m_program(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to send on command sequence: %d\n", ret);
+		goto fail;
+	}
+
+	drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
+
+	mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
+	mipi_dsi_compression_mode_multi(&dsi_ctx, true);
+	mipi_dsi_msleep(&dsi_ctx, 28);
+
+	ret = dsi_ctx.accum_err;
+
+	if (ret < 0)
+		goto fail;
+
+	return 0;
+
+fail:
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_disable(ctx->vci);
+	regulator_disable(ctx->vddio);
+	return ret;
+}
+
+static int samsung_sofef03_m_enable(struct drm_panel *panel)
+{
+	struct samsung_sofef03_m *ctx = to_samsung_sofef03_m(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
+}
+
+static int samsung_sofef03_m_disable(struct drm_panel *panel)
+{
+	struct samsung_sofef03_m *ctx = to_samsung_sofef03_m(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
+	return dsi_ctx.accum_err;
+}
+
+static int samsung_sofef03_m_unprepare(struct drm_panel *panel)
+{
+	struct samsung_sofef03_m *ctx = to_samsung_sofef03_m(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 100);
+
+	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_disable(ctx->vci);
+	regulator_disable(ctx->vddio);
+
+	return dsi_ctx.accum_err;
+}
+
+/*
+ * TODO: These porch values are unused for command-mode panels, but currently
+ * used to artificially bump the clocks to account for transfer overhead.
+ */
+static const struct drm_display_mode samsung_sofef03_m_60hz_mode = {
+	.clock = (1080 + 156 + 8 + 8) * (2520 + 2393 + 8 + 8) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 156,
+	.hsync_end = 1080 + 156 + 8,
+	.htotal = 1080 + 156 + 8 + 8,
+	.vdisplay = 2520,
+	.vsync_start = 2520 + 2393,
+	.vsync_end = 2520 + 2393 + 8,
+	.vtotal = 2520 + 2393 + 8 + 8,
+	.width_mm = 61,
+	.height_mm = 142,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static const struct drm_display_mode samsung_sofef03_m_120hz_mode = {
+	.clock = (1080 + 56 + 8 + 8) * (2520 + 499 + 8 + 8) * 120 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 56,
+	.hsync_end = 1080 + 56 + 8,
+	.htotal = 1080 + 56 + 8 + 8,
+	.vdisplay = 2520,
+	.vsync_start = 2520 + 499,
+	.vsync_end = 2520 + 499 + 8,
+	.vtotal = 2520 + 499 + 8 + 8,
+	.width_mm = 61,
+	.height_mm = 142,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int samsung_sofef03_m_get_modes(struct drm_panel *panel,
+				       struct drm_connector *connector)
+{
+	if (enable_120hz)
+		return drm_connector_helper_get_modes_fixed(
+			connector, &samsung_sofef03_m_120hz_mode);
+	else
+		return drm_connector_helper_get_modes_fixed(
+			connector, &samsung_sofef03_m_60hz_mode);
+}
+
+static const struct drm_panel_funcs samsung_sofef03_m_panel_funcs = {
+	.prepare = samsung_sofef03_m_prepare,
+	.enable = samsung_sofef03_m_enable,
+	.disable = samsung_sofef03_m_disable,
+	.unprepare = samsung_sofef03_m_unprepare,
+	.get_modes = samsung_sofef03_m_get_modes,
+};
+
+static int samsung_sofef03_m_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+
+	/* HACK: Setting anything below 0x100 makes the panel go black */
+	if (brightness != 0 && brightness < 256)
+		brightness = 256;
+
+	return mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+}
+
+static const struct backlight_ops samsung_sofef03_m_bl_ops = {
+	.update_status = samsung_sofef03_m_bl_update_status,
+};
+
+static int samsung_sofef03_m_probe(struct mipi_dsi_device *dsi)
+{
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 256,
+		.max_brightness = 1023,
+	};
+	struct device *dev = &dsi->dev;
+	struct samsung_sofef03_m *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct samsung_sofef03_m, panel,
+				   &samsung_sofef03_m_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ctx->vddio = devm_regulator_get(dev, "vddio");
+	if (IS_ERR(ctx->vddio))
+		return dev_err_probe(dev, PTR_ERR(ctx->vddio),
+				     "Failed to get vddio regulator\n");
+
+	ctx->vci = devm_regulator_get(dev, "vci");
+	if (IS_ERR(ctx->vci))
+		return dev_err_probe(dev, PTR_ERR(ctx->vci),
+				     "Failed to get vci regulator\n");
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
+	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = devm_backlight_device_register(
+		dev, dev_name(dev), dev, dsi,
+		&samsung_sofef03_m_bl_ops,
+		&props);
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
+	ctx->dsc.slice_height = 30;
+	ctx->dsc.slice_width = 540;
+	ctx->dsc.slice_count = 2;
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
+static void samsung_sofef03_m_remove(struct mipi_dsi_device *dsi)
+{
+	struct samsung_sofef03_m *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id samsung_sofef03_m_of_match[] = {
+	/* Sony Xperia 5 II */
+	{ .compatible = "samsung,sofef03-m-amb609vp01" },
+	/* Sony Xperia 5 III */
+	{ .compatible = "samsung,sofef03-m-amb609vp04" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, samsung_sofef03_m_of_match);
+
+static struct mipi_dsi_driver samsung_sofef03_m_driver = {
+	.probe = samsung_sofef03_m_probe,
+	.remove = samsung_sofef03_m_remove,
+	.driver = {
+		.name = "panel-samsung-sofef03-m",
+		.of_match_table = samsung_sofef03_m_of_match,
+	},
+};
+module_mipi_dsi_driver(samsung_sofef03_m_driver);
+
+MODULE_AUTHOR("Konrad Dybcio <konrad.dybcio@linaro.org>");
+MODULE_AUTHOR("Marijn Suijten <marijn.suijten@somainline.org>");
+MODULE_DESCRIPTION("DRM panel driver for Samsung SOFEF03-M Display-Driver-IC panels");
+MODULE_LICENSE("GPL");

-- 
2.52.0

