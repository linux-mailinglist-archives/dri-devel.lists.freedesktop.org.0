Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF3LGBGDm2k60wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 23:28:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D28B0170986
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 23:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E754610E137;
	Sun, 22 Feb 2026 22:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QsPYiLVP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED1310E119
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 22:28:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7CF8D4453A;
 Sun, 22 Feb 2026 22:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35EB4C2BC86;
 Sun, 22 Feb 2026 22:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771799302;
 bh=FIwzC/HPkbwbad4JZAQNlRkTkAcHSLKhyaEcM/3BSAk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=QsPYiLVPMvsvi5+g7ThYAX8g21x1E4Timbx1OWTiGbQwMhb/278Ow3K1VQqdpF147
 uC7BwBIF3uI0Pv2ZGV0CFEAOW+l+tncC4+sxgZa5YU/Vma+MzMnajBACzW0QUyCSvL
 Cbr/NHT9BOMnhraZo78iVNBzUGbV+YMxeNUK54bVSTeno3mpyIH1zH42o32W1yIBwu
 2HtJIBJVkAJCKfesW5BSnfmpU1UPlkatFv2RiDFBbzQr/FzvwunqRxiH71DlyOrSP3
 wX210hoyXL2YKxJ9oLDU1RGULQGJSt+azxW91U1SFSJbEwXcuCVoAj1RsthZxaBxO4
 GLoziYQSC/W3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 274BCC636C5;
 Sun, 22 Feb 2026 22:28:22 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 22 Feb 2026 16:26:23 -0600
Subject: [PATCH RFC 2/2] drm/panel: Add panel driver for ChipWealth
 CH13726A based panels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260222-ch13726a-v1-2-e501d78e105a@gmail.com>
References: <20260222-ch13726a-v1-0-e501d78e105a@gmail.com>
In-Reply-To: <20260222-ch13726a-v1-0-e501d78e105a@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771799301; l=10447;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=XQViDwO3gm90rnkfJEMEPFrgcHgCVG/PFsXlXjlHwWE=;
 b=wdr9WR7lvHXN221P/npBjST8e5XuhJtPt7DOyN5MZN+VQ5y6dV5OykTqQkV05xFfI8+G8qC4E
 vF4aJ2MH1+jANSy5ptL3rk0vKnooMRI1m4wZegoFesYYwb1pZIiAKQt
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
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
Reply-To: webgeek1234@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.19 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:teguh@sobir.in,m:webgeek1234@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[webgeek1234.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,sobir.in,gmail.com];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D28B0170986
X-Rspamd-Action: no action

From: Teguh Sobirin <teguh@sobir.in>

This is used by the AYN Thor for the bottom panel.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Co-authored-by: Aaron Kling <webgeek1234@gmail.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                     |  11 +
 drivers/gpu/drm/panel/Makefile                    |   1 +
 drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c | 296 ++++++++++++++++++++++
 3 files changed, 308 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 307152ad77591af513086121813e6d52f9f5ed62..9791bf9850c3c29481afe46176aa474cf20ee0be 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -105,6 +105,17 @@ config DRM_PANEL_BOE_TV101WUM_LL2
 	  Say Y here if you want to support for BOE TV101WUM-LL2
 	  WUXGA PANEL DSI Video Mode panel
 
+config DRM_PANEL_CHIPWEALTH_CH13726A
+	tristate "CHIPWEALTH CH13726A-based DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
+	help
+	  Say Y here if you want to enable support for ChipWealth
+	  CH13726A-based display panels.
+
 config DRM_PANEL_EBBG_FT8719
 	tristate "EBBG FT8719 panel driver"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index aeffaa95666d6d447f675bf4e8e7d28ee7c1351a..8ec0a978221016d1e34bf05c64f58232d0a2dec3 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_DRM_PANEL_BOE_TD4320) += panel-boe-td4320.o
 obj-$(CONFIG_DRM_PANEL_BOE_TH101MB31UIG002_28A) += panel-boe-th101mb31ig002-28a.o
 obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_LL2) += panel-boe-tv101wum-ll2.o
 obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_NL6) += panel-boe-tv101wum-nl6.o
+obj-$(CONFIG_DRM_PANEL_CHIPWEALTH_CH13726A) += panel-chipwealth-ch13726a.o
 obj-$(CONFIG_DRM_PANEL_DSI_CM) += panel-dsi-cm.o
 obj-$(CONFIG_DRM_PANEL_LVDS) += panel-lvds.o
 obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
diff --git a/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c b/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c
new file mode 100644
index 0000000000000000000000000000000000000000..89961a5a697f0bbe3f6376ddf255a1f7e1461380
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ChipWealth CH13726A MIPI-DSI panel driver
+ * Copyright (c) 2024, Teguh Sobirin <teguh@sobir.in>.
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+#include <video/mipi_display.h>
+
+struct ch13726a_panel {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator_bulk_data supplies[4];
+	struct gpio_desc *reset_gpio;
+	const struct drm_display_mode *display_mode;
+	enum drm_panel_orientation orientation;
+	bool prepared;
+};
+
+static inline struct ch13726a_panel *to_ch13726a_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct ch13726a_panel, panel);
+}
+
+static void ch13726a_reset(struct ch13726a_panel *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(10000, 11000);
+}
+
+static int ch13726a_on(struct ch13726a_panel *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x50);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb9, 0x00);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
+}
+
+static int ch13726a_disable(struct drm_panel *panel)
+{
+	struct ch13726a_panel *ctx = to_ch13726a_panel(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
+}
+
+static int ch13726a_prepare(struct drm_panel *panel)
+{
+	struct ch13726a_panel *ctx = to_ch13726a_panel(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (ctx->prepared)
+		return 0;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	ch13726a_reset(ctx);
+
+	ret = ch13726a_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+		return ret;
+	}
+
+	msleep(28);
+
+	ctx->prepared = true;
+
+	return 0;
+}
+
+static int ch13726a_unprepare(struct drm_panel *panel)
+{
+	struct ch13726a_panel *ctx = to_ch13726a_panel(panel);
+
+	if (!ctx->prepared)
+		return 0;
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+
+	ctx->prepared = false;
+	return 0;
+}
+
+static const struct drm_display_mode thor_bottom_display_mode = {
+	.clock = (1080 + 28 + 4 + 36) * (1240 + 16 + 4 + 8) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 28,
+	.hsync_end = 1080 + 28 + 4,
+	.htotal = 1080 + 28 + 4 + 36,
+	.vdisplay = 1240,
+	.vsync_start = 1240 + 16,
+	.vsync_end = 1240 + 16 + 4,
+	.vtotal = 1240 + 16 + 4 + 8,
+	.width_mm = 65,
+	.height_mm = 75,
+};
+
+static int ch13726a_get_modes(struct drm_panel *panel,
+					struct drm_connector *connector)
+{
+	struct ch13726a_panel *ctx = to_ch13726a_panel(panel);
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, ctx->display_mode);
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
+static enum drm_panel_orientation ch13726a_get_orientation(struct drm_panel *panel)
+{
+	struct ch13726a_panel *ctx = to_ch13726a_panel(panel);
+
+	return ctx->orientation;
+}
+
+static const struct drm_panel_funcs ch13726a_panel_funcs = {
+	.prepare = ch13726a_prepare,
+	.unprepare = ch13726a_unprepare,
+	.disable = ch13726a_disable,
+	.get_modes = ch13726a_get_modes,
+	.get_orientation = ch13726a_get_orientation,
+};
+
+static int ch13726a_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return 0;
+}
+
+static const struct backlight_ops ch13726a_bl_ops = {
+	.update_status = ch13726a_bl_update_status,
+};
+
+static struct backlight_device *
+ch13726a_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 255,
+		.max_brightness = 255,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &ch13726a_bl_ops, &props);
+}
+
+static int ch13726a_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct ch13726a_panel *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->display_mode = of_device_get_match_data(dev);
+
+	ctx->supplies[0].supply = "vdd1v2";
+	ctx->supplies[1].supply = "vddio";
+	ctx->supplies[2].supply = "vdd";
+	ctx->supplies[3].supply = "avdd";
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
+				      ctx->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
+	if (ret < 0) {
+		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, ret);
+		return ret;
+	}
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	drm_panel_init(&ctx->panel, dev, &ch13726a_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = ch13726a_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
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
+static void ch13726a_remove(struct mipi_dsi_device *dsi)
+{
+	struct ch13726a_panel *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id ch13726a_of_match[] = {
+	{ .compatible = "ayntec,thor-panel-bottom", .data = &thor_bottom_display_mode },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ch13726a_of_match);
+
+static struct mipi_dsi_driver ch13726a_driver = {
+	.probe = ch13726a_probe,
+	.remove = ch13726a_remove,
+	.driver = {
+		.name = "panel-ch13726a-amoled",
+		.of_match_table = ch13726a_of_match,
+	},
+};
+module_mipi_dsi_driver(ch13726a_driver);
+
+MODULE_DESCRIPTION("DRM driver for CH13726A DSI panels");
+MODULE_LICENSE("GPL");

-- 
2.52.0


