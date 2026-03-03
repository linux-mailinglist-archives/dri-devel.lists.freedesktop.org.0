Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Dx8F2rNpmnIVgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 13:00:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6131EEDA7
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 13:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F5010E7A5;
	Tue,  3 Mar 2026 12:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aZ4sRmK9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E491410E029
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 12:00:38 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2ae5636ab04so19409315ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 04:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772539238; x=1773144038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ytWoPyDSDvtLGrFLlumb2HTBIcfozlsIPTMU6AlTFx8=;
 b=aZ4sRmK9kj+aWUqiTritvTixgG05bC84S6bWQXG1ed2SxG3UMeaq/XrnZ+2MplWATW
 uK5xXKRtcO/ZXE5svuG/FZR1KFhDRekf4QrSOGMaUHjmvh+Kya18GdW/V9Vz5ffr8y1z
 uX6kBnb1IOdt3M/+RG4cdMwD52/KfiKiCqJzpvWdSBB63MXajgWwsyvypLOMV5NvG/jE
 UfIAWYaJH9vp/IMiVk1DkgHykafmSteTaiKbT/JTpe/2YjKoCH/uUNeT/QLQqNGUPTqf
 +4n25WiAChN6h6aU7osjugVoJVb4bleY6JTQb9ZHL31qAqJR2B34XkK470cTBtgrSDV2
 wLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772539238; x=1773144038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ytWoPyDSDvtLGrFLlumb2HTBIcfozlsIPTMU6AlTFx8=;
 b=ZPlVVvxsjsf2f721sj8rvyQyYAM5W1N/NL4u07O1SRv6XQsRUwTGdxS/lT9Ez3OLh6
 qJm582Qm32q9dryywmY2hVWcXb8rkaNl3ljULc1AWR2izLO2+4JsC+gUPNt4DVYhb9xr
 1nOxehQfiMV30IwwdHZqQI4COuqd/zqz7f/mQWwaCGhiLwWyEm3FmM7NeO5ccQ9at83w
 tdnYw9koeP0SUbXer+5iGCf2tHP8ml5RPvi0WnkecrOBqjt8OzSojMsegKEMMG+1x2gj
 0AwQoPlgv91SzJCAkZF96ZL3yWOarmvCRV+RRSe2+K8lkb1oqzqYoLv97oIR/es/fN5S
 qkNg==
X-Gm-Message-State: AOJu0YzDEDQxlHtJUH++pBljxLQiAw0wduyrbuq+IRYxkaGMqhzULDTD
 /ZytNlncrmQZ5hamj4yp6R4bHiNo5lWYTTEOrvZK8GdfgcAWZaPD1FGR
X-Gm-Gg: ATEYQzzNzUJGto7DuYcEd5D0zDXLCXvy/RDMJE1IwMTKNM9HV+vaMk8wjKDubP12vEX
 T2JVbHnw+MDIzS1ZOp4z6n95AeCjRVjiNSI8dI3XAntGC72V2chnU6JJtj5A57n/HL4TmDNKjER
 QJPbPgBiJXBE1REwRP1CR0NpNa/2x7+RbZc5b8a87Yf48bs/9LRxSM0Noq2p4nT0TdmN48DTKmU
 lMOE6aKh9KIiHg9HtOjIApUe/yuiOIqpGMWNxWH2G5sZ6mraaLM3i+qNVeEQVEKN87/OJ1wpfNT
 9VHIhhpljXhOI0XAegFKcDBWaZN3Najc3khYpBeRCIBmYYiS0I9i0fIQUK3qYsnDCbooR7FxThm
 5B5hea3n+zQCef4a0yW6kvD+r6Q0cimsEC1ZVr31TV/rRhZhiUNW76ZVjIf4ZlkO3na2AhshMzt
 IzxMw+NwE7QfFfOMnwSg==
X-Received: by 2002:a17:903:3887:b0:2ae:3dd5:c69c with SMTP id
 d9443c01a7336-2ae3dd5cb1emr151089185ad.33.1772539237861; 
 Tue, 03 Mar 2026 04:00:37 -0800 (PST)
Received: from nuvole ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae541358d4sm52570345ad.75.2026.03.03.04.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 04:00:37 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 2/2] drm/panel: Add Himax HX83121A panel driver
Date: Tue,  3 Mar 2026 19:57:30 +0800
Message-ID: <20260303115730.9580-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303115730.9580-1-mitltlatltl@gmail.com>
References: <20260303115730.9580-1-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: DB6131EEDA7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lumag@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Add a driver for panels using the Himax HX83121A Display Driver IC,
including support for the BOE/CSOT PPC357DB1-4, found in HUAWEI
Matebook E Go series (Gaokun2/3).

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                |  11 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-himax-hx83121a.c | 752 +++++++++++++++++++
 3 files changed, 764 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx83121a.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 7a83804fe..a60a15205 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -203,6 +203,17 @@ config DRM_PANEL_HIMAX_HX83112B
 	  Say Y here if you want to enable support for Himax HX83112B-based
 	  display panels, such as the one found in the Fairphone 3 smartphone.
 
+config DRM_PANEL_HIMAX_HX83121A
+	tristate "Himax HX83121A-based DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_KMS_HELPER
+	help
+	  Say Y here if you want to enable support for Himax HX83121A-based
+	  display panels, such as the one found in the HUAWEI Matebook E Go
+          series.
+
 config DRM_PANEL_HIMAX_HX8394
 	tristate "HIMAX HX8394 MIPI-DSI LCD panels"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 6de894e0d..32df40712 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_DRM_PANEL_HIMAX_HX8279) += panel-himax-hx8279.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX83102) += panel-himax-hx83102.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112A) += panel-himax-hx83112a.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112B) += panel-himax-hx83112b.o
+obj-$(CONFIG_DRM_PANEL_HIMAX_HX83121A) += panel-himax-hx83121a.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
 obj-$(CONFIG_DRM_PANEL_HYDIS_HV101HD1) += panel-hydis-hv101hd1.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
diff --git a/drivers/gpu/drm/panel/panel-himax-hx83121a.c b/drivers/gpu/drm/panel/panel-himax-hx83121a.c
new file mode 100644
index 000000000..719d5ed90
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-himax-hx83121a.c
@@ -0,0 +1,752 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Himax HX83121A DriverIC panels driver
+ * Copyright (c) 2024-2026 Pengyu Luo <mitltlatltl@gmail.com>
+ *
+ * Multiple panels handling based on panel-novatek-nt36523.c
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+#include <video/mipi_display.h>
+
+static bool enable_dsc = false;
+module_param(enable_dsc, bool, 0);
+MODULE_PARM_DESC(enable_dsc, "enable DSC on the panel (default: false)");
+
+struct himax {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi[2];
+	const struct panel_desc *desc;
+	struct drm_dsc_config dsc;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data *supplies;
+	struct backlight_device *backlight;
+};
+
+struct panel_desc {
+	unsigned int width_mm;
+	unsigned int height_mm;
+	unsigned int bpc;
+	unsigned int lanes;
+	enum mipi_dsi_pixel_format format;
+	unsigned long mode_flags;
+	const struct drm_dsc_config *dsc_cfg;
+	const struct drm_display_mode *dsc_modes;
+	unsigned int num_dsc_modes;
+
+	const struct drm_display_mode *modes;
+	unsigned int num_modes;
+
+	int (*init_sequence_dsc)(struct mipi_dsi_multi_context *dsi_ctx);
+	int (*init_sequence)(struct mipi_dsi_multi_context *dsi_ctx);
+
+	bool is_dual_dsi;
+	bool has_dcs_backlight;
+};
+
+static const struct regulator_bulk_data himax_supplies[] = {
+	{ .supply = "vddi" },
+	{ .supply = "vsp" },
+	{ .supply = "vsn" },
+};
+
+static inline struct himax *to_himax(struct drm_panel *panel)
+{
+	return container_of(panel, struct himax, panel);
+}
+
+static inline struct mipi_dsi_device *to_primary_dsi(struct himax *ctx)
+{
+	/* Sync on DSI1 for dual dsi */
+	return ctx->desc->is_dual_dsi ? ctx->dsi[1] : ctx->dsi[0];
+}
+
+static void himax_reset(struct himax *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(4000, 4100);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	msleep(20);
+}
+
+static int himax_prepare(struct drm_panel *panel)
+{
+	struct himax *ctx = to_himax(panel);
+	struct mipi_dsi_device *dsi = to_primary_dsi(ctx);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+	struct drm_dsc_picture_parameter_set pps;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(himax_supplies),
+				    ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	himax_reset(ctx);
+
+	if (enable_dsc && ctx->desc->init_sequence_dsc)
+		ret = ctx->desc->init_sequence_dsc(&dsi_ctx);
+	else if (ctx->desc->init_sequence)
+		ret = ctx->desc->init_sequence(&dsi_ctx);
+	else
+		ret = -EOPNOTSUPP;
+
+	if (ret < 0) {
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(himax_supplies),
+				       ctx->supplies);
+		return ret;
+	}
+
+	if (enable_dsc) {
+		drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
+		mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
+		mipi_dsi_compression_mode_multi(&dsi_ctx, true);
+	}
+
+	return backlight_update_status(ctx->backlight);
+}
+
+static int himax_off(struct mipi_dsi_multi_context *dsi_ctx)
+{
+	mipi_dsi_dcs_enter_sleep_mode_multi(dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 120);
+
+	return dsi_ctx->accum_err;
+}
+
+static int himax_unprepare(struct drm_panel *panel)
+{
+	struct himax *ctx = to_himax(panel);
+	struct mipi_dsi_device *dsi = to_primary_dsi(ctx);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	ret = himax_off(&dsi_ctx);
+	if (ret < 0)
+		dev_err(dev, "panel failed to off: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(himax_supplies), ctx->supplies);
+
+	return 0;
+}
+
+static int himax_get_modes(struct drm_panel *panel,
+			   struct drm_connector *connector)
+{
+
+	struct himax *ctx = to_himax(panel);
+	const struct panel_desc *desc = ctx->desc;
+	const struct drm_display_mode *modes;
+	int num_modes;
+	int i;
+
+	modes = enable_dsc ? desc->dsc_modes : desc->modes;
+	num_modes = enable_dsc ? desc->num_dsc_modes : desc->num_modes;
+
+	for (i = 0; i < num_modes; i++) {
+		const struct drm_display_mode *m = &modes[i];
+		struct drm_display_mode *mode;
+
+		mode = drm_mode_duplicate(connector->dev, m);
+		if (!mode) {
+			dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
+				m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
+			return -ENOMEM;
+		}
+
+		mode->type = DRM_MODE_TYPE_DRIVER;
+		if (i == 0)
+			mode->type |= DRM_MODE_TYPE_PREFERRED;
+
+		drm_mode_set_name(mode);
+		drm_mode_probed_add(connector, mode);
+	}
+
+	connector->display_info.width_mm = desc->width_mm;
+	connector->display_info.height_mm = desc->height_mm;
+	connector->display_info.bpc = desc->bpc;
+
+	return num_modes;
+}
+
+static const struct drm_panel_funcs himax_panel_funcs = {
+	.prepare = himax_prepare,
+	.unprepare = himax_unprepare,
+	.get_modes = himax_get_modes,
+};
+
+static int himax_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+	/* TODO: brightness to raw map table */
+	return mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+}
+
+static const struct backlight_ops himax_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = himax_bl_update_status,
+};
+
+static struct backlight_device *
+himax_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 512,
+		.max_brightness = 4095,
+		.scale = BACKLIGHT_SCALE_NON_LINEAR,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &himax_bl_ops, &props);
+}
+
+static int himax_probe(struct mipi_dsi_device *dsi)
+{
+	struct mipi_dsi_device_info dsi_info = {"dsi-secondary", 0, NULL};
+	struct mipi_dsi_host *dsi1_host;
+	struct device *dev = &dsi->dev;
+	const struct panel_desc *desc;
+	struct device_node *dsi1;
+	struct himax *ctx;
+	int num_dsi = 1;
+	int ret, i;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ret = devm_regulator_bulk_get_const(&dsi->dev,
+					    ARRAY_SIZE(himax_supplies),
+					    himax_supplies, &ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	desc = of_device_get_match_data(dev);
+	if (!desc)
+		return -ENODEV;
+	ctx->desc = desc;
+	ctx->dsc = *desc->dsc_cfg;
+
+	if (desc->is_dual_dsi) {
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
+	drm_panel_init(&ctx->panel, dev, &himax_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ctx->panel.prepare_prev_first = true;
+
+	if (desc->has_dcs_backlight) {
+		ctx->backlight = himax_create_backlight(to_primary_dsi(ctx));
+		if (IS_ERR(ctx->backlight))
+			return dev_err_probe(dev, PTR_ERR(ctx->backlight),
+					     "Failed to create backlight\n");
+	} else {
+		ret = drm_panel_of_backlight(&ctx->panel);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to get backlight\n");
+	}
+
+	drm_panel_add(&ctx->panel);
+
+	for (i = 0; i < num_dsi; i++) {
+		ctx->dsi[i]->lanes = desc->lanes;
+		ctx->dsi[i]->format = desc->format;
+		ctx->dsi[i]->mode_flags = desc->mode_flags;
+		ctx->dsi[i]->dsc = enable_dsc ? &ctx->dsc : NULL;
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
+static void himax_remove(struct mipi_dsi_device *dsi)
+{
+	struct himax *ctx = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static int boe_ppc357db1_4_dsc_init_seq(struct mipi_dsi_multi_context *dsi_ctx)
+{
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb9, 0x83, 0x12, 0x1a, 0x55, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe2, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x03);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe1, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0xc7);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb2, 0x98);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe7,
+				     0x01, 0x07, 0x01, 0x07, 0x01, 0x07, 0x06, 0x06,
+				     0x06, 0x16, 0x00, 0x16, 0x81, 0x02, 0x40, 0x00,
+				     0x1a, 0x4a, 0x05, 0x04, 0x03, 0x02, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0xc6);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd2, 0x00, 0x30);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0xc9);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd3, 0x04);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0xc6);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe2, 0x42);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb2, 0xf5);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xcd,
+				     0x81, 0x00, 0x80, 0x77, 0x00, 0x01, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe4,
+				     0xe1, 0xe1, 0xe1, 0xe1, 0xe1, 0xe1, 0xe1, 0xe1,
+				     0xc7, 0xb2, 0xa0, 0x90, 0x81, 0x75, 0x69, 0x5f,
+				     0x55, 0x4c, 0x44, 0x3d, 0x36, 0x2f, 0x2a, 0x24,
+				     0x1e, 0x19, 0x14, 0x10, 0x09, 0x08, 0x07, 0x54,
+				     0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x03);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe4,
+				     0xaa, 0xd4, 0xff, 0x2a, 0x55, 0x7f, 0xaa, 0xd4,
+				     0xff, 0xea, 0xff, 0x03);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0xc8);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb1, 0x25);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbe, 0x01, 0x35, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd9, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb9, 0x00, 0x00, 0x00);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 140);
+	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
+
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
+	mipi_dsi_msleep(dsi_ctx, 20);
+
+	return dsi_ctx->accum_err;
+}
+
+static int boe_ppc357db1_4_init_seq(struct mipi_dsi_multi_context *dsi_ctx)
+{
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb9, 0x83, 0x12, 0x1a, 0x55, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd1, 0x37, 0x03, 0x0c, 0xfd);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe2, 0x20);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x03);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe1, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0xc7);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb2, 0xa6);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe7,
+				     0x01, 0x07, 0x01, 0x07, 0x01, 0x07, 0x06, 0x06,
+				     0x06, 0x16, 0x00, 0x16, 0x81, 0x02, 0x40, 0x00,
+				     0x1a, 0x4a, 0x05, 0x04, 0x03, 0x02, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe2,
+				     0x02, 0x68, 0x02, 0x68, 0x02, 0x68, 0x02, 0x68,
+				     0x02, 0x6f, 0x03, 0x04, 0x2d, 0x09, 0x09, 0x00,
+				     0x00, 0x0f, 0x0f, 0x0f, 0x0f, 0x00, 0x00, 0x00,
+				     0x01, 0x10, 0x10, 0x1c, 0x25, 0x3c, 0x00, 0x23,
+				     0x5d, 0x02, 0x02, 0x00, 0x00, 0x58, 0x01, 0xac,
+				     0x0f, 0xa9, 0x10, 0x00, 0x2d, 0x6f, 0x00, 0x70,
+				     0x00, 0x0a, 0xcb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0xc6);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd2, 0x09, 0x85);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0xc9);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd3, 0x04);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb2, 0xf5);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe4,
+				     0xe1, 0xe1, 0xe1, 0xe1, 0xe1, 0xe1, 0xe1, 0xe1,
+				     0xc7, 0xb2, 0xa0, 0x90, 0x81, 0x75, 0x69, 0x5f,
+				     0x55, 0x4c, 0x44, 0x3d, 0x36, 0x2f, 0x2a, 0x24,
+				     0x1e, 0x19, 0x14, 0x10, 0x09, 0x08, 0x07, 0x54,
+				     0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x03);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe4,
+				     0xaa, 0xd4, 0xff, 0x2a, 0x55, 0x7f, 0xaa, 0xd4,
+				     0xff, 0xea, 0xff, 0x03);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0xc8);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb1, 0x25);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbe, 0x01, 0x35, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd9, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb9, 0x00, 0x00, 0x00);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 140);
+	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
+
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
+	mipi_dsi_msleep(dsi_ctx, 31);
+
+	return dsi_ctx->accum_err;
+}
+
+static int csot_ppc357db1_4_dsc_init_seq(struct mipi_dsi_multi_context *dsi_ctx)
+{
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb9, 0x83, 0x12, 0x1a, 0x55, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb1,
+				     0x1c, 0x6b, 0x6b, 0x27, 0xe7, 0x00, 0x1b, 0x25,
+				     0x21, 0x21, 0x2d, 0x2d, 0x17, 0x33, 0x31, 0x40,
+				     0xcd, 0xff, 0x1a, 0x05, 0x15, 0x98, 0x00, 0x88,
+				     0x7f, 0xff, 0xff, 0xcf, 0x1a, 0xcc, 0x02, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd1, 0x37, 0x03, 0x0c, 0xfd);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb2,
+				     0x00, 0x6a, 0x40, 0x00, 0x00, 0x14, 0x98, 0x60,
+				     0x3c, 0x02, 0x80, 0x21, 0x21, 0x00, 0x00, 0xf0,
+				     0x27);
+	/*
+	 * NOTE: Register 0xE2 configuration (based on downstream reference):
+	 * - 0x00: 120Hz with DSC enabled
+	 * - 0x10: 60Hz with DSC enabled
+	 * - 0x20: 60Hz with DSC disabled
+	 *
+	 * Both 0x00 and 0x10 are compatible with 60Hz/120Hz when DSC is active.
+	 * We use a fixed DSC-on value to remain refresh-rate agnostic.
+	 */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe2, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc0, 0x23, 0x23, 0xcc, 0x22, 0x99, 0xd8);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb4,
+				     0x46, 0x06, 0x0c, 0xbe, 0x0c, 0xbe, 0x09, 0x46,
+				     0x0f, 0x57, 0x0f, 0x57, 0x03, 0x4a, 0x00, 0x00,
+				     0x04, 0x0c, 0x00, 0x18, 0x01, 0x06, 0x08, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0xff, 0x00, 0xff, 0x10, 0x00, 0x02,
+				     0x14, 0x14, 0x14, 0x14);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x03);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe1, 0x01, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0xe2);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe7, 0x49);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd3,
+				     0x00, 0xc0, 0x08, 0x08, 0x08, 0x04, 0x04, 0x04,
+				     0x16, 0x02, 0x07, 0x07, 0x07, 0x31, 0x13, 0x19,
+				     0x12, 0x12, 0x03, 0x03, 0x03, 0x32, 0x10, 0x18,
+				     0x00, 0x11, 0x32, 0x10, 0x03, 0x00, 0x03, 0x32,
+				     0x10, 0x03, 0x00, 0x03, 0x00, 0x00, 0xff, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe1,
+				     0x11, 0x00, 0x00, 0x89, 0x30, 0x80, 0x0a, 0x00,
+				     0x03, 0x20, 0x00, 0x14, 0x03, 0x20, 0x03, 0x20,
+				     0x02, 0x00, 0x02, 0x91, 0x00, 0x20, 0x02, 0x47,
+				     0x00, 0x0b, 0x00, 0x0c, 0x05, 0x0e, 0x03, 0x68,
+				     0x18, 0x00, 0x10, 0xe0, 0x03, 0x0c, 0x20, 0x00,
+				     0x06, 0x0b, 0x0b, 0x33, 0x0e, 0x1c, 0x2a, 0x38,
+				     0x46, 0x54, 0x62, 0x69, 0x70, 0x77, 0x79, 0x7b,
+				     0x7d, 0x7e, 0x01, 0x02, 0x01, 0x00, 0x09);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe7,
+				     0x17, 0x08, 0x08, 0x2c, 0x46, 0x1e, 0x02, 0x23,
+				     0x5d, 0x02, 0xc9, 0x00, 0x00, 0x00, 0x00, 0x12,
+				     0x05, 0x02, 0x02, 0x07, 0x10, 0x10, 0x00, 0x1d,
+				     0xb9, 0x23, 0xb9, 0x00, 0x33, 0x02, 0x88);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe7,
+				     0x02, 0x00, 0xb2, 0x01, 0x56, 0x07, 0x56, 0x08,
+				     0x48, 0x14, 0xfd, 0x26);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe7,
+				     0x08, 0x08, 0x01, 0x03, 0x01, 0x03, 0x07, 0x02,
+				     0x02, 0x47, 0x00, 0x47, 0x81, 0x02, 0x40, 0x00,
+				     0x18, 0x4a, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01,
+				     0x00, 0x00, 0x03, 0x02, 0x01, 0x00, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbf,
+				     0xfd, 0x00, 0x80, 0x9c, 0x36, 0x00, 0x81, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xcd,
+				     0x81, 0x00, 0x80, 0x77, 0x00, 0x01, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe4,
+				     0xe1, 0xe1, 0xe1, 0xe1, 0xe1, 0xe1, 0xe1, 0xe1,
+				     0xc7, 0xb2, 0xa0, 0x90, 0x81, 0x75, 0x69, 0x5f,
+				     0x55, 0x4c, 0x44, 0x3d, 0x36, 0x2f, 0x2a, 0x24,
+				     0x1e, 0x19, 0x14, 0x10, 0x09, 0x08, 0x07, 0x54,
+				     0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x03);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe4,
+				     0xaa, 0xd4, 0xff, 0x2a, 0x55, 0x7f, 0xaa, 0xd4,
+				     0xff, 0xea, 0xff, 0x03);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbe, 0x01, 0x35, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd9, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb9, 0x00, 0x00, 0x00);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 140);
+	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
+
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
+	mipi_dsi_msleep(dsi_ctx, 20);
+
+	return dsi_ctx->accum_err;
+}
+
+static int csot_ppc357db1_4_init_seq(struct mipi_dsi_multi_context *dsi_ctx)
+{
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb9, 0x83, 0x12, 0x1a, 0x55, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb1,
+				     0x1c, 0x6b, 0x6b, 0x27, 0xe7, 0x00, 0x1b, 0x11,
+				     0x21, 0x21, 0x2d, 0x2d, 0x17, 0x33, 0x31, 0x40,
+				     0xcd, 0xff, 0x1a, 0x05, 0x15, 0x98, 0x00, 0x88,
+				     0x7f, 0xff, 0xff, 0xcf, 0x1a, 0xcc, 0x02, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd1, 0x37, 0x03, 0x0c, 0xfd);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe2, 0x20);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb2,
+				     0x00, 0x6a, 0x40, 0x00, 0x00, 0x14, 0x98, 0x60,
+				     0x3c, 0x02, 0x80, 0x21, 0x21, 0x00, 0x00, 0x10,
+				     0x27);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x03);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe1, 0x00, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0xe2);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe7, 0x49);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd3,
+				     0x00, 0xc0, 0x08, 0x08, 0x08, 0x04, 0x04, 0x04,
+				     0x16, 0x02, 0x07, 0x07, 0x07, 0x31, 0x13, 0x16,
+				     0x12, 0x12, 0x03, 0x03, 0x03, 0x32, 0x10, 0x15,
+				     0x00, 0x11, 0x32, 0x10, 0x03, 0x00, 0x03, 0x32,
+				     0x10, 0x03, 0x00, 0x03, 0x00, 0x00, 0xff, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe2,
+				     0x80, 0x05, 0x1c, 0xbe, 0x09, 0x8d, 0x0f, 0x57,
+				     0x03, 0x87, 0x06, 0x10, 0x32, 0x06, 0x15, 0x00,
+				     0x00, 0x14, 0x14, 0x14, 0x14, 0x00, 0x00, 0x00,
+				     0x01, 0x10, 0x10, 0x16, 0x28, 0x3c, 0x03, 0x23,
+				     0x5d, 0x02, 0x02, 0x00, 0x00, 0x48, 0x01, 0xac,
+				     0x0f, 0xab, 0x10, 0x00, 0x32, 0x87, 0x00, 0xa1,
+				     0x00, 0x0a, 0xcb, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe7,
+				     0x02, 0x00, 0xb2, 0x01, 0x56, 0x07, 0x56, 0x08,
+				     0x48, 0x14, 0x00, 0x26);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe7,
+				     0x05, 0x05, 0x01, 0x05, 0x01, 0x05, 0x04, 0x04,
+				     0x04, 0x24, 0x00, 0x24, 0x81, 0x02, 0x40, 0x00,
+				     0x32, 0x87, 0x03, 0x02, 0x01, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb2, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbf,
+				     0xfd, 0x00, 0x80, 0x9c, 0x10, 0x00, 0x81, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe4,
+				     0xe1, 0xe1, 0xe1, 0xe1, 0xe1, 0xe1, 0xe1, 0xe1,
+				     0xc7, 0xb2, 0xa0, 0x90, 0x81, 0x75, 0x69, 0x5f,
+				     0x55, 0x4c, 0x44, 0x3d, 0x36, 0x2f, 0x2a, 0x24,
+				     0x1e, 0x19, 0x14, 0x10, 0x09, 0x08, 0x07, 0x54,
+				     0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x03);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe4,
+				     0xaa, 0xd4, 0xff, 0x2a, 0x55, 0x7f, 0xaa, 0xd4,
+				     0xff, 0xea, 0xff, 0x03);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0xc8);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb1, 0x25);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbe, 0x01, 0x35, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd9, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb9, 0x00, 0x00, 0x00);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 140);
+	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
+
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
+	mipi_dsi_msleep(dsi_ctx, 31);
+
+	return dsi_ctx->accum_err;
+}
+
+static struct drm_dsc_config ppc357db1_4_dsc_cfg = {
+	.dsc_version_major = 1,
+	.dsc_version_minor = 1,
+	.slice_height = 20,
+	.slice_width = 800,
+	.slice_count = 1,
+	.bits_per_component = 8,
+	.bits_per_pixel = 8 << 4,
+	.block_pred_enable = true,
+};
+
+static const struct drm_display_mode ppc357db1_4_dsc_modes[] = {
+	{
+		.clock = (800 + 60 + 40 + 40) * 2 * (2560 + 154 + 4 + 18) * 120 / 1000,
+		.hdisplay = 800 * 2,
+		.hsync_start = (800 + 60) * 2,
+		.hsync_end = (800 + 60 + 40) * 2,
+		.htotal = (800 + 60 + 40 + 40) * 2,
+		.vdisplay = 2560,
+		.vsync_start = 2560 + 154,
+		.vsync_end = 2560 + 154 + 4,
+		.vtotal = 2560 + 154 + 4 + 18,
+	},
+	{
+		.clock = (800 + 60 + 40 + 40) * 2 * (2560 + 2890 + 4 + 18) * 60 / 1000,
+		.hdisplay = 800 * 2,
+		.hsync_start = (800 + 60) * 2,
+		.hsync_end = (800 + 60 + 40) * 2,
+		.htotal = (800 + 60 + 40 + 40) * 2,
+		.vdisplay = 2560,
+		.vsync_start = 2560 + 2890,
+		.vsync_end = 2560 + 2890 + 4,
+		.vtotal = 2560 + 2890 + 4 + 18,
+	},
+};
+
+static const struct drm_display_mode ppc357db1_4_modes[] = {
+	{
+		.clock = (800 + 60 + 20 + 40) * 2 * (2560 + 154 + 4 + 18) * 60 / 1000,
+		.hdisplay = 800 * 2,
+		.hsync_start = (800 + 60) * 2,
+		.hsync_end = (800 + 60 + 20) * 2,
+		.htotal = (800 + 60 + 20 + 40) * 2,
+		.vdisplay = 2560,
+		.vsync_start = 2560 + 168,
+		.vsync_end = 2560 + 168 + 4,
+		.vtotal = 2560 + 168 + 4 + 18,
+	},
+};
+
+/* Model name: BOE PPC357DB1-4 */
+static const struct panel_desc boe_ppc357db1_4_desc = {
+	.width_mm = 266,
+	.height_mm = 166,
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |
+		      MIPI_DSI_MODE_LPM,
+	.dsc_cfg = &ppc357db1_4_dsc_cfg,
+	.dsc_modes = ppc357db1_4_dsc_modes,
+	.num_dsc_modes = ARRAY_SIZE(ppc357db1_4_dsc_modes),
+	.modes = ppc357db1_4_modes,
+	.num_modes = ARRAY_SIZE(ppc357db1_4_modes),
+	.init_sequence_dsc = boe_ppc357db1_4_dsc_init_seq,
+	.init_sequence = boe_ppc357db1_4_init_seq,
+	.is_dual_dsi = true,
+	.has_dcs_backlight = true,
+};
+
+/* Model name: CSOT PPC357DB1-4 */
+static const struct panel_desc csot_ppc357db1_4_desc = {
+	.width_mm = 266,
+	.height_mm = 166,
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |
+		      MIPI_DSI_MODE_LPM,
+	.dsc_cfg = &ppc357db1_4_dsc_cfg,
+	.dsc_modes = ppc357db1_4_dsc_modes,
+	.num_dsc_modes = ARRAY_SIZE(ppc357db1_4_dsc_modes),
+	.modes = ppc357db1_4_modes,
+	.num_modes = ARRAY_SIZE(ppc357db1_4_modes),
+	.init_sequence_dsc = csot_ppc357db1_4_dsc_init_seq,
+	.init_sequence = csot_ppc357db1_4_init_seq,
+	.is_dual_dsi = true,
+	.has_dcs_backlight = true,
+};
+
+/*
+ * Known panels with HX83121A:
+ * CSOT PNC357DB1-4: on MI Book S 12.4
+ * CSOT PPC357DB1-1: on SAMSUNG Galaxy Tab S7 FE
+ * BOE/CSOT PPC357DB1-4: on HUAWEI Matebook E Go
+ * CSOT PPC357DB1-5: on MI Pad 5 Pro 12.4
+ */
+
+static const struct of_device_id himax_of_match[] = {
+	{ .compatible = "boe,ppc357db1-4", .data = &boe_ppc357db1_4_desc },
+	{ .compatible = "csot,ppc357db1-4", .data = &csot_ppc357db1_4_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, himax_of_match);
+
+static struct mipi_dsi_driver himax_driver = {
+	.probe = himax_probe,
+	.remove = himax_remove,
+	.driver = {
+		.name = "panel-himax-hx83121a",
+		.of_match_table = himax_of_match,
+	},
+};
+module_mipi_dsi_driver(himax_driver);
+
+MODULE_AUTHOR("Pengyu Luo <mitltlatltl0@gmail.com>");
+MODULE_DESCRIPTION("Himax HX83121A DriverIC panels driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

