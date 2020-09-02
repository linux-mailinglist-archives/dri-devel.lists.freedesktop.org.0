Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869A225A5AE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 08:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D786E124;
	Wed,  2 Sep 2020 06:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6548A6E124
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 06:44:25 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id c142so2296017pfb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 23:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=glSU4ZaH3aMBVnbdfwsUklIig+uauBfubDY6DwFqnA8=;
 b=hvm/l+pQvFq6kscuhhgYdDWtIYibh8mbWjhcrHofIPaDSYdOTrYVuJFOkEB2EB6u9z
 FeFe75hkNb3AQFAyUNwRxpVp+3bPP5DMvZanY/aiEmXu1sSi3MQKgAT3bp0eMZ4vft1Q
 aOdMfW+HJrcpIQjycCAyOa1bOZXaC3m0KbNoxYfZwWXP/X2FwEAivZgKnacda0FYzNuh
 TceH1C0Ti5JH1LNzGxPhwsIqlGQ014WOekcyZCeMhOd9ox/psE0tACFPy0lArpmnz9dS
 eBFO8grNhlqazv0X6XvGck79cFS33TjmfsEVcmwvmD52JQSuog1AJ4RUH8jwqKtOnk4Q
 L1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=glSU4ZaH3aMBVnbdfwsUklIig+uauBfubDY6DwFqnA8=;
 b=RCVQTOEezsLIgm+/AVoAY6223YxKbhS8dSOXO8tMkwEwmQfQDeOj/5wGUS0qOtfD9t
 Fj6257AC+zNFVi3rRvliOMrDBYV6dttYY2V5otBWhgcrfAjhGOBnM990elyK3rRn/B3D
 I+C5r/0HBWZEv5Gknub4mdJ3d/n8ums0l3nojVQKAVpvM6pdEu5x8Nt3yYqs1bheKVF0
 2xcdDhiDFOLsZx0n4KqcuR8Adht/xUJhGzxdFHIwcuGS9E75ekN91BFT2CBUbOAJu9HU
 PFMcUnSfqIJ8cS75+uwIO7ZsTp6oUYcdlAcKY6/WNwR4jXB1s92Gtj6pUcISDaH1wXVs
 K8Cg==
X-Gm-Message-State: AOAM532wxukZ6BM/vyZPv3xqnGzir0Xm9DGgiwoBDkTD3DOUCcMHAIoP
 0o3kiYlrHA2keswc809JWiIlMQ==
X-Google-Smtp-Source: ABdhPJz9JxRS33fx8LbOQgdj2xE+wi6xW1eRvvQmiucdNlOnQ1DALZ29Yf4N4dPI+1iFF7WKVhjxtg==
X-Received: by 2002:a63:ba49:: with SMTP id l9mr859105pgu.101.1599029064744;
 Tue, 01 Sep 2020 23:44:24 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
 by smtp.gmail.com with ESMTPSA id i23sm4317434pfo.207.2020.09.01.23.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 23:44:23 -0700 (PDT)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v7 2/2] drm: panel: Add novatek nt36672a panel driver
Date: Wed,  2 Sep 2020 12:14:07 +0530
Message-Id: <20200902064407.30712-3-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902064407.30712-1-sumit.semwal@linaro.org>
References: <20200902064407.30712-1-sumit.semwal@linaro.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Benni Steini <bennisteinir@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Novatek NT36672a is a generic DSI IC that drives command and video mode
panels. Add the driver for it.

Right now adding support for some Poco F1 phones that have an LCD panel
from Tianma connected with this IC, with a resolution of 1080x2246 that
operates in DSI video mode.

During testing, Benni Steini <bennisteinir@gmail.com> helped us fix
the reset sequence timing (from 10ms to 20ms), to get the bootanimation
to work on Android.

With current AOSP, we need to increase it to 200ms - this seems to be a
safe high value to avoid a white screen occasionally.

Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benni Steini <bennisteinir@gmail.com>

---
v2: increase reset sequence timing to a safe 200ms
v4: Since "0425662fdf05: drm: Nuke mode->vrefresh", we have to calculate
    vrefresh on demand. Update for it.
v5: Fixed review comments from Sam:
      - rebased on top of drm-misc-next
           remove return of drm_panel_add()
           remove drm_panel_detach()
      - renamed the panel driver file to reflect that this is a novatek
           nt36672a display driver and not only for tianma panels.
           Adjusted some internal names also to reflect the same.
      - corrected changelog to add info about the generic Novatek DSI IC
      - corrected compatible string accordingly
      - removed pinctrl
      - used drm_panel* API for prepare/unprepare/disable/remove
v6: Fixed few review comments on v5 from Sam:
      - add dev_err_probe() support
      - move DRM_* error printing to dev_err()
      - removed a few unnecessary bits
v7: Fixed review comments on v6 from Bjorn:
      - Reworked the send_mipi_commands functionality
      - removed regulator disable_loads; moved active_load setting to probe
        time
      - made function names and struct less generic
      - updated the reset_gpio working to active_low
      - update MAINTAINERS for file name changes
---
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-novatek-nt36672a.c    | 711 ++++++++++++++++++
 4 files changed, 729 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36672a.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 01fb9ee6b951..c6fb966c0959 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5517,6 +5517,13 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
 F:	drivers/gpu/drm/panel/panel-novatek-nt35510.c
 
+DRM DRIVER FOR NOVATEK NT36672A PANELS
+M:	Sumit Semwal <sumit.semwal@linaro.org>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
+F:	drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+
 DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
 M:	Ben Skeggs <bskeggs@redhat.com>
 L:	dri-devel@lists.freedesktop.org
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 8d97d07c5871..51e6cb6c7826 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -208,6 +208,16 @@ config DRM_PANEL_NOVATEK_NT35510
 	  around the Novatek NT35510 display controller, such as some
 	  Hydis panels.
 
+config DRM_PANEL_NOVATEK_NT36672A
+	tristate "Novatek NT36672A DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the panels built
+	  around the Novatek NT36672A display controller, such as some
+	  Tianma panels used in a few Xiaomi Poco F1 mobile phones.
+
 config DRM_PANEL_NOVATEK_NT39016
 	tristate "Novatek NT39016 RGB/SPI panel"
 	depends on OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 15a4e7752951..4a36eb45f670 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
 obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
+obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
 obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) += panel-mantix-mlaf057we51.o
 obj-$(CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO) += panel-olimex-lcd-olinuxino.o
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
new file mode 100644
index 000000000000..533cd3934b8b
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -0,0 +1,711 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2020 Linaro Ltd
+ * Author: Sumit Semwal <sumit.semwal@linaro.org>
+ *
+ * This driver is for the DSI interface to panels using the NT36672A display driver IC
+ * from Novatek.
+ * Currently supported are the Tianma FHD+ panels found in some Xiaomi phones, including
+ * some variants of the Poco F1 phone.
+ *
+ * Panels using the Novatek NT37762A IC should add appropriate configuration per-panel and
+ * use this driver.
+ */
+
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+
+#include <linux/gpio/consumer.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+#include <video/mipi_display.h>
+
+struct nt36672a_panel_cmd {
+	const char data[2];
+};
+
+static const char * const nt36672a_regulator_names[] = {
+	"vddio",
+	"vddpos",
+	"vddneg",
+};
+
+static unsigned long const nt36672a_regulator_enable_loads[] = {
+	62000,
+	100000,
+	100000
+};
+
+struct nt36672a_panel_desc {
+	const struct drm_display_mode *display_mode;
+	const char *panel_name;
+
+	unsigned int width_mm;
+	unsigned int height_mm;
+
+	unsigned long mode_flags;
+	enum mipi_dsi_pixel_format format;
+	unsigned int lanes;
+
+	unsigned int num_on_cmds_1;
+	const struct nt36672a_panel_cmd *on_cmds_1;
+	unsigned int num_on_cmds_2;
+	const struct nt36672a_panel_cmd *on_cmds_2;
+
+	unsigned int num_off_cmds;
+	const struct nt36672a_panel_cmd *off_cmds;
+};
+
+struct nt36672a_panel {
+	struct drm_panel base;
+	struct mipi_dsi_device *link;
+	const struct nt36672a_panel_desc *desc;
+
+	struct regulator_bulk_data supplies[ARRAY_SIZE(nt36672a_regulator_names)];
+
+	struct gpio_desc *reset_gpio;
+
+	bool prepared;
+};
+
+static inline struct nt36672a_panel *to_nt36672a_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct nt36672a_panel, base);
+}
+
+static int nt36672a_send_cmds(struct drm_panel *panel, const struct nt36672a_panel_cmd *cmds,
+			      int num)
+{
+	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
+	unsigned int i;
+	int err;
+
+	for (i = 0; i < num; i++) {
+		const struct nt36672a_panel_cmd *cmd = &cmds[i];
+
+		err = mipi_dsi_dcs_write(pinfo->link, cmd->data[0], cmd->data + 1, 1);
+
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
+static int nt36672a_panel_power_off(struct drm_panel *panel)
+{
+	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
+	int ret = 0;
+
+	gpiod_set_value(pinfo->reset_gpio, 1);
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(pinfo->supplies), pinfo->supplies);
+	if (ret)
+		dev_err(panel->dev, "regulator_bulk_disable failed %d\n", ret);
+
+	return ret;
+}
+
+static int nt36672a_panel_unprepare(struct drm_panel *panel)
+{
+	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
+	int ret;
+
+	if (!pinfo->prepared)
+		return 0;
+
+	/* send off cmds */
+	ret = nt36672a_send_cmds(panel, pinfo->desc->off_cmds,
+				 pinfo->desc->num_off_cmds);
+
+	if (ret < 0)
+		dev_err(panel->dev, "failed to send DCS off cmds: %d\n", ret);
+
+	ret = mipi_dsi_dcs_set_display_off(pinfo->link);
+	if (ret < 0)
+		dev_err(panel->dev, "set_display_off cmd failed ret = %d\n", ret);
+
+	/* 120ms delay required here as per DCS spec */
+	msleep(120);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(pinfo->link);
+	if (ret < 0)
+		dev_err(panel->dev, "enter_sleep cmd failed ret = %d\n", ret);
+
+	/* 0x3C = 60ms delay */
+	msleep(60);
+
+	ret = nt36672a_panel_power_off(panel);
+	if (ret < 0)
+		dev_err(panel->dev, "power_off failed ret = %d\n", ret);
+
+	pinfo->prepared = false;
+
+	return ret;
+}
+
+static int nt36672a_panel_power_on(struct nt36672a_panel *pinfo)
+{
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(pinfo->supplies), pinfo->supplies);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * As per downstream kernel, Reset sequence of Tianma FHD panel requires the panel to
+	 * be out of reset for 10ms, followed by being held in reset for 10ms. But for Android
+	 * AOSP, we needed to bump it upto 200ms otherwise we get white screen sometimes.
+	 * FIXME: Try to reduce this 200ms to a lesser value.
+	 */
+	gpiod_set_value(pinfo->reset_gpio, 1);
+	msleep(200);
+	gpiod_set_value(pinfo->reset_gpio, 0);
+	msleep(200);
+
+	return 0;
+}
+
+static int nt36672a_panel_prepare(struct drm_panel *panel)
+{
+	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
+	int err;
+
+	if (pinfo->prepared)
+		return 0;
+
+	err = nt36672a_panel_power_on(pinfo);
+	if (err < 0)
+		goto poweroff;
+
+	/* send first part of init cmds */
+	err = nt36672a_send_cmds(panel, pinfo->desc->on_cmds_1,
+				 pinfo->desc->num_on_cmds_1);
+
+	if (err < 0) {
+		dev_err(panel->dev, "failed to send DCS Init 1st Code: %d\n", err);
+		goto poweroff;
+	}
+
+	err = mipi_dsi_dcs_exit_sleep_mode(pinfo->link);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
+		goto poweroff;
+	}
+
+	/* 0x46 = 70 ms delay */
+	msleep(70);
+
+	err = mipi_dsi_dcs_set_display_on(pinfo->link);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to Set Display ON: %d\n", err);
+		goto poweroff;
+	}
+
+	/* Send rest of the init cmds */
+	err = nt36672a_send_cmds(panel, pinfo->desc->on_cmds_2,
+				 pinfo->desc->num_on_cmds_2);
+
+	if (err < 0) {
+		dev_err(panel->dev, "failed to send DCS Init 2nd Code: %d\n", err);
+		goto poweroff;
+	}
+
+	msleep(120);
+
+	pinfo->prepared = true;
+
+	return 0;
+
+poweroff:
+	gpiod_set_value(pinfo->reset_gpio, 0);
+	return err;
+}
+
+static int nt36672a_panel_get_modes(struct drm_panel *panel,
+				    struct drm_connector *connector)
+{
+	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
+	const struct drm_display_mode *m = pinfo->desc->display_mode;
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, m);
+	if (!mode) {
+		dev_err(panel->dev, "failed to add mode %ux%u@%u\n", m->hdisplay,
+			m->vdisplay, drm_mode_vrefresh(m));
+		return -ENOMEM;
+	}
+
+	connector->display_info.width_mm = pinfo->desc->width_mm;
+	connector->display_info.height_mm = pinfo->desc->height_mm;
+
+	drm_mode_set_name(mode);
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs panel_funcs = {
+	.unprepare = nt36672a_panel_unprepare,
+	.prepare = nt36672a_panel_prepare,
+	.get_modes = nt36672a_panel_get_modes,
+};
+
+static const struct nt36672a_panel_cmd tianma_fhd_video_on_cmds_1[] = {
+	/* skin enhancement mode */
+	{ .data = {0xFF, 0x22} },
+	{ .data = {0x00, 0x40} },
+	{ .data = {0x01, 0xC0} },
+	{ .data = {0x02, 0x40} },
+	{ .data = {0x03, 0x40} },
+	{ .data = {0x04, 0x40} },
+	{ .data = {0x05, 0x40} },
+	{ .data = {0x06, 0x40} },
+	{ .data = {0x07, 0x40} },
+	{ .data = {0x08, 0x40} },
+	{ .data = {0x09, 0x40} },
+	{ .data = {0x0A, 0x40} },
+	{ .data = {0x0B, 0x40} },
+	{ .data = {0x0C, 0x40} },
+	{ .data = {0x0D, 0x40} },
+	{ .data = {0x0E, 0x40} },
+	{ .data = {0x0F, 0x40} },
+	{ .data = {0x10, 0x40} },
+	{ .data = {0x11, 0x50} },
+	{ .data = {0x12, 0x60} },
+	{ .data = {0x13, 0x70} },
+	{ .data = {0x14, 0x58} },
+	{ .data = {0x15, 0x68} },
+	{ .data = {0x16, 0x78} },
+	{ .data = {0x17, 0x77} },
+	{ .data = {0x18, 0x39} },
+	{ .data = {0x19, 0x2D} },
+	{ .data = {0x1A, 0x2E} },
+	{ .data = {0x1B, 0x32} },
+	{ .data = {0x1C, 0x37} },
+	{ .data = {0x1D, 0x3A} },
+	{ .data = {0x1E, 0x40} },
+	{ .data = {0x1F, 0x40} },
+	{ .data = {0x20, 0x40} },
+	{ .data = {0x21, 0x40} },
+	{ .data = {0x22, 0x40} },
+	{ .data = {0x23, 0x40} },
+	{ .data = {0x24, 0x40} },
+	{ .data = {0x25, 0x40} },
+	{ .data = {0x26, 0x40} },
+	{ .data = {0x27, 0x40} },
+	{ .data = {0x28, 0x40} },
+	{ .data = {0x2D, 0x00} },
+	{ .data = {0x2F, 0x40} },
+	{ .data = {0x30, 0x40} },
+	{ .data = {0x31, 0x40} },
+	{ .data = {0x32, 0x40} },
+	{ .data = {0x33, 0x40} },
+	{ .data = {0x34, 0x40} },
+	{ .data = {0x35, 0x40} },
+	{ .data = {0x36, 0x40} },
+	{ .data = {0x37, 0x40} },
+	{ .data = {0x38, 0x40} },
+	{ .data = {0x39, 0x40} },
+	{ .data = {0x3A, 0x40} },
+	{ .data = {0x3B, 0x40} },
+	{ .data = {0x3D, 0x40} },
+	{ .data = {0x3F, 0x40} },
+	{ .data = {0x40, 0x40} },
+	{ .data = {0x41, 0x40} },
+	{ .data = {0x42, 0x40} },
+	{ .data = {0x43, 0x40} },
+	{ .data = {0x44, 0x40} },
+	{ .data = {0x45, 0x40} },
+	{ .data = {0x46, 0x40} },
+	{ .data = {0x47, 0x40} },
+	{ .data = {0x48, 0x40} },
+	{ .data = {0x49, 0x40} },
+	{ .data = {0x4A, 0x40} },
+	{ .data = {0x4B, 0x40} },
+	{ .data = {0x4C, 0x40} },
+	{ .data = {0x4D, 0x40} },
+	{ .data = {0x4E, 0x40} },
+	{ .data = {0x4F, 0x40} },
+	{ .data = {0x50, 0x40} },
+	{ .data = {0x51, 0x40} },
+	{ .data = {0x52, 0x40} },
+	{ .data = {0x53, 0x01} },
+	{ .data = {0x54, 0x01} },
+	{ .data = {0x55, 0xFE} },
+	{ .data = {0x56, 0x77} },
+	{ .data = {0x58, 0xCD} },
+	{ .data = {0x59, 0xD0} },
+	{ .data = {0x5A, 0xD0} },
+	{ .data = {0x5B, 0x50} },
+	{ .data = {0x5C, 0x50} },
+	{ .data = {0x5D, 0x50} },
+	{ .data = {0x5E, 0x50} },
+	{ .data = {0x5F, 0x50} },
+	{ .data = {0x60, 0x50} },
+	{ .data = {0x61, 0x50} },
+	{ .data = {0x62, 0x50} },
+	{ .data = {0x63, 0x50} },
+	{ .data = {0x64, 0x50} },
+	{ .data = {0x65, 0x50} },
+	{ .data = {0x66, 0x50} },
+	{ .data = {0x67, 0x50} },
+	{ .data = {0x68, 0x50} },
+	{ .data = {0x69, 0x50} },
+	{ .data = {0x6A, 0x50} },
+	{ .data = {0x6B, 0x50} },
+	{ .data = {0x6C, 0x50} },
+	{ .data = {0x6D, 0x50} },
+	{ .data = {0x6E, 0x50} },
+	{ .data = {0x6F, 0x50} },
+	{ .data = {0x70, 0x07} },
+	{ .data = {0x71, 0x00} },
+	{ .data = {0x72, 0x00} },
+	{ .data = {0x73, 0x00} },
+	{ .data = {0x74, 0x06} },
+	{ .data = {0x75, 0x0C} },
+	{ .data = {0x76, 0x03} },
+	{ .data = {0x77, 0x09} },
+	{ .data = {0x78, 0x0F} },
+	{ .data = {0x79, 0x68} },
+	{ .data = {0x7A, 0x88} },
+	{ .data = {0x7C, 0x80} },
+	{ .data = {0x7D, 0x80} },
+	{ .data = {0x7E, 0x80} },
+	{ .data = {0x7F, 0x00} },
+	{ .data = {0x80, 0x00} },
+	{ .data = {0x81, 0x00} },
+	{ .data = {0x83, 0x01} },
+	{ .data = {0x84, 0x00} },
+	{ .data = {0x85, 0x80} },
+	{ .data = {0x86, 0x80} },
+	{ .data = {0x87, 0x80} },
+	{ .data = {0x88, 0x40} },
+	{ .data = {0x89, 0x91} },
+	{ .data = {0x8A, 0x98} },
+	{ .data = {0x8B, 0x80} },
+	{ .data = {0x8C, 0x80} },
+	{ .data = {0x8D, 0x80} },
+	{ .data = {0x8E, 0x80} },
+	{ .data = {0x8F, 0x80} },
+	{ .data = {0x90, 0x80} },
+	{ .data = {0x91, 0x80} },
+	{ .data = {0x92, 0x80} },
+	{ .data = {0x93, 0x80} },
+	{ .data = {0x94, 0x80} },
+	{ .data = {0x95, 0x80} },
+	{ .data = {0x96, 0x80} },
+	{ .data = {0x97, 0x80} },
+	{ .data = {0x98, 0x80} },
+	{ .data = {0x99, 0x80} },
+	{ .data = {0x9A, 0x80} },
+	{ .data = {0x9B, 0x80} },
+	{ .data = {0x9C, 0x80} },
+	{ .data = {0x9D, 0x80} },
+	{ .data = {0x9E, 0x80} },
+	{ .data = {0x9F, 0x80} },
+	{ .data = {0xA0, 0x8A} },
+	{ .data = {0xA2, 0x80} },
+	{ .data = {0xA6, 0x80} },
+	{ .data = {0xA7, 0x80} },
+	{ .data = {0xA9, 0x80} },
+	{ .data = {0xAA, 0x80} },
+	{ .data = {0xAB, 0x80} },
+	{ .data = {0xAC, 0x80} },
+	{ .data = {0xAD, 0x80} },
+	{ .data = {0xAE, 0x80} },
+	{ .data = {0xAF, 0x80} },
+	{ .data = {0xB7, 0x76} },
+	{ .data = {0xB8, 0x76} },
+	{ .data = {0xB9, 0x05} },
+	{ .data = {0xBA, 0x0D} },
+	{ .data = {0xBB, 0x14} },
+	{ .data = {0xBC, 0x0F} },
+	{ .data = {0xBD, 0x18} },
+	{ .data = {0xBE, 0x1F} },
+	{ .data = {0xBF, 0x05} },
+	{ .data = {0xC0, 0x0D} },
+	{ .data = {0xC1, 0x14} },
+	{ .data = {0xC2, 0x03} },
+	{ .data = {0xC3, 0x07} },
+	{ .data = {0xC4, 0x0A} },
+	{ .data = {0xC5, 0xA0} },
+	{ .data = {0xC6, 0x55} },
+	{ .data = {0xC7, 0xFF} },
+	{ .data = {0xC8, 0x39} },
+	{ .data = {0xC9, 0x44} },
+	{ .data = {0xCA, 0x12} },
+	{ .data = {0xCD, 0x80} },
+	{ .data = {0xDB, 0x80} },
+	{ .data = {0xDC, 0x80} },
+	{ .data = {0xDD, 0x80} },
+	{ .data = {0xE0, 0x80} },
+	{ .data = {0xE1, 0x80} },
+	{ .data = {0xE2, 0x80} },
+	{ .data = {0xE3, 0x80} },
+	{ .data = {0xE4, 0x80} },
+	{ .data = {0xE5, 0x40} },
+	{ .data = {0xE6, 0x40} },
+	{ .data = {0xE7, 0x40} },
+	{ .data = {0xE8, 0x40} },
+	{ .data = {0xE9, 0x40} },
+	{ .data = {0xEA, 0x40} },
+	{ .data = {0xEB, 0x40} },
+	{ .data = {0xEC, 0x40} },
+	{ .data = {0xED, 0x40} },
+	{ .data = {0xEE, 0x40} },
+	{ .data = {0xEF, 0x40} },
+	{ .data = {0xF0, 0x40} },
+	{ .data = {0xF1, 0x40} },
+	{ .data = {0xF2, 0x40} },
+	{ .data = {0xF3, 0x40} },
+	{ .data = {0xF4, 0x40} },
+	{ .data = {0xF5, 0x40} },
+	{ .data = {0xF6, 0x40} },
+	{ .data = {0xFB, 0x1} },
+	{ .data = {0xFF, 0x23} },
+	{ .data = {0xFB, 0x01} },
+	/* dimming enable */
+	{ .data = {0x01, 0x84} },
+	{ .data = {0x05, 0x2D} },
+	{ .data = {0x06, 0x00} },
+	 /* resolution 1080*2246 */
+	{ .data = {0x11, 0x01} },
+	{ .data = {0x12, 0x7B} },
+	{ .data = {0x15, 0x6F} },
+	{ .data = {0x16, 0x0B} },
+	 /* UI mode */
+	{ .data = {0x29, 0x0A} },
+	{ .data = {0x30, 0xFF} },
+	{ .data = {0x31, 0xFF} },
+	{ .data = {0x32, 0xFF} },
+	{ .data = {0x33, 0xFF} },
+	{ .data = {0x34, 0xFF} },
+	{ .data = {0x35, 0xFF} },
+	{ .data = {0x36, 0xFF} },
+	{ .data = {0x37, 0xFF} },
+	{ .data = {0x38, 0xFC} },
+	{ .data = {0x39, 0xF8} },
+	{ .data = {0x3A, 0xF4} },
+	{ .data = {0x3B, 0xF1} },
+	{ .data = {0x3D, 0xEE} },
+	{ .data = {0x3F, 0xEB} },
+	{ .data = {0x40, 0xE8} },
+	{ .data = {0x41, 0xE5} },
+	 /* STILL mode */
+	{ .data = {0x2A, 0x13} },
+	{ .data = {0x45, 0xFF} },
+	{ .data = {0x46, 0xFF} },
+	{ .data = {0x47, 0xFF} },
+	{ .data = {0x48, 0xFF} },
+	{ .data = {0x49, 0xFF} },
+	{ .data = {0x4A, 0xFF} },
+	{ .data = {0x4B, 0xFF} },
+	{ .data = {0x4C, 0xFF} },
+	{ .data = {0x4D, 0xED} },
+	{ .data = {0x4E, 0xD5} },
+	{ .data = {0x4F, 0xBF} },
+	{ .data = {0x50, 0xA6} },
+	{ .data = {0x51, 0x96} },
+	{ .data = {0x52, 0x86} },
+	{ .data = {0x53, 0x76} },
+	{ .data = {0x54, 0x66} },
+	 /* MOVING mode */
+	{ .data = {0x2B, 0x0E} },
+	{ .data = {0x58, 0xFF} },
+	{ .data = {0x59, 0xFF} },
+	{ .data = {0x5A, 0xFF} },
+	{ .data = {0x5B, 0xFF} },
+	{ .data = {0x5C, 0xFF} },
+	{ .data = {0x5D, 0xFF} },
+	{ .data = {0x5E, 0xFF} },
+	{ .data = {0x5F, 0xFF} },
+	{ .data = {0x60, 0xF6} },
+	{ .data = {0x61, 0xEA} },
+	{ .data = {0x62, 0xE1} },
+	{ .data = {0x63, 0xD8} },
+	{ .data = {0x64, 0xCE} },
+	{ .data = {0x65, 0xC3} },
+	{ .data = {0x66, 0xBA} },
+	{ .data = {0x67, 0xB3} },
+	{ .data = {0xFF, 0x25} },
+	{ .data = {0xFB, 0x01} },
+	{ .data = {0x05, 0x04} },
+	{ .data = {0xFF, 0x26} },
+	{ .data = {0xFB, 0x01} },
+	{ .data = {0x1C, 0xAF} },
+	{ .data = {0xFF, 0x10} },
+	{ .data = {0xFB, 0x01} },
+	{ .data = {0x51, 0xFF} },
+	{ .data = {0x53, 0x24} },
+	{ .data = {0x55, 0x00} },
+};
+
+static const struct nt36672a_panel_cmd tianma_fhd_video_on_cmds_2[] = {
+	{ .data = {0xFF, 0x24} },
+	{ .data = {0xFB, 0x01} },
+	{ .data = {0xC3, 0x01} },
+	{ .data = {0xC4, 0x54} },
+	{ .data = {0xFF, 0x10} },
+};
+
+static const struct nt36672a_panel_cmd tianma_fhd_video_off_cmds[] = {
+	{ .data = {0xFF, 0x24} },
+	{ .data = {0xFB, 0x01} },
+	{ .data = {0xC3, 0x01} },
+	{ .data = {0xFF, 0x10} },
+};
+
+static const struct drm_display_mode tianma_fhd_video_panel_default_mode = {
+	.clock		= 161331,
+
+	.hdisplay	= 1080,
+	.hsync_start	= 1080 + 40,
+	.hsync_end	= 1080 + 40 + 20,
+	.htotal		= 1080 + 40 + 20 + 44,
+
+	.vdisplay	= 2246,
+	.vsync_start	= 2246 + 15,
+	.vsync_end	= 2246 + 15 + 2,
+	.vtotal		= 2246 + 15 + 2 + 8,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct nt36672a_panel_desc tianma_fhd_video_panel_desc = {
+	.display_mode = &tianma_fhd_video_panel_default_mode,
+
+	.width_mm = 68,
+	.height_mm = 136,
+
+	.mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_VIDEO
+			| MIPI_DSI_MODE_VIDEO_HSE
+			| MIPI_DSI_CLOCK_NON_CONTINUOUS
+			| MIPI_DSI_MODE_VIDEO_BURST,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 4,
+	.on_cmds_1 = tianma_fhd_video_on_cmds_1,
+	.num_on_cmds_1 = ARRAY_SIZE(tianma_fhd_video_on_cmds_1),
+	.on_cmds_2 = tianma_fhd_video_on_cmds_2,
+	.num_on_cmds_2 = ARRAY_SIZE(tianma_fhd_video_on_cmds_2),
+	.off_cmds = tianma_fhd_video_off_cmds,
+	.num_off_cmds = ARRAY_SIZE(tianma_fhd_video_off_cmds),
+};
+
+static int nt36672a_panel_add(struct nt36672a_panel *pinfo)
+{
+	struct device *dev = &pinfo->link->dev;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++)
+		pinfo->supplies[i].supply = nt36672a_regulator_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(pinfo->supplies),
+				      pinfo->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++) {
+		ret = regulator_set_load(pinfo->supplies[i].consumer,
+					 nt36672a_regulator_enable_loads[i]);
+		if (ret)
+			return  dev_err_probe(dev, ret, "failed to set regulator enable loads\n");
+	}
+
+	pinfo->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(pinfo->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(pinfo->reset_gpio),
+				     "failed to get reset gpio from DT\n");
+
+	drm_panel_init(&pinfo->base, dev, &panel_funcs, DRM_MODE_CONNECTOR_DSI);
+
+	drm_panel_add(&pinfo->base);
+
+	return 0;
+}
+
+static int nt36672a_panel_probe(struct mipi_dsi_device *dsi)
+{
+	struct nt36672a_panel *pinfo;
+	const struct nt36672a_panel_desc *desc;
+	int err;
+
+	pinfo = devm_kzalloc(&dsi->dev, sizeof(*pinfo), GFP_KERNEL);
+	if (!pinfo)
+		return -ENOMEM;
+
+	desc = of_device_get_match_data(&dsi->dev);
+	dsi->mode_flags = desc->mode_flags;
+	dsi->format = desc->format;
+	dsi->lanes = desc->lanes;
+	pinfo->desc = desc;
+	pinfo->link = dsi;
+
+	mipi_dsi_set_drvdata(dsi, pinfo);
+
+	err = nt36672a_panel_add(pinfo);
+	if (err < 0)
+		return err;
+
+	return mipi_dsi_attach(dsi);
+}
+
+static int nt36672a_panel_remove(struct mipi_dsi_device *dsi)
+{
+	struct nt36672a_panel *pinfo = mipi_dsi_get_drvdata(dsi);
+	int err;
+
+	err = drm_panel_unprepare(&pinfo->base);
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", err);
+
+	err = drm_panel_disable(&pinfo->base);
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
+
+	err = mipi_dsi_detach(dsi);
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
+
+	drm_panel_remove(&pinfo->base);
+
+	return 0;
+}
+
+static void nt36672a_panel_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct nt36672a_panel *pinfo = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_disable(&pinfo->base);
+	drm_panel_unprepare(&pinfo->base);
+}
+
+static const struct of_device_id tianma_fhd_video_of_match[] = {
+	{ .compatible = "tianma,fhd-video", .data = &tianma_fhd_video_panel_desc },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tianma_fhd_video_of_match);
+
+static struct mipi_dsi_driver nt36672a_panel_driver = {
+	.driver = {
+		.name = "panel-tianma-nt36672a",
+		.of_match_table = tianma_fhd_video_of_match,
+	},
+	.probe = nt36672a_panel_probe,
+	.remove = nt36672a_panel_remove,
+	.shutdown = nt36672a_panel_shutdown,
+};
+module_mipi_dsi_driver(nt36672a_panel_driver);
+
+MODULE_AUTHOR("Sumit Semwal <sumit.semwal@linaro.org>");
+MODULE_DESCRIPTION("NOVATEK NT36672A based MIPI-DSI LCD panel driver");
+MODULE_LICENSE("GPL");
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
