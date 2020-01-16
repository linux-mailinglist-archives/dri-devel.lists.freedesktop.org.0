Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C928413D5D8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 09:21:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8539D6EC23;
	Thu, 16 Jan 2020 08:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3A36EBBC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 03:37:29 +0000 (UTC)
X-Spam: yes
X-Spam-Score: 6.6 / 99999
X-Spam-Symbols: FROM_EQ_ENVFROM, SUSPICIOUS_RECIPS, FROM_HAS_DN, TO_DN_SOME,
 FREEMAIL_ENVRCPT, RCVD_NO_TLS_LAST, RCPT_COUNT_TWELVE, ARC_NA,
 RCVD_VIA_SMTP_AUTH, BROKEN_CONTENT_TYPE, MID_CONTAINS_FROM,
 R_MISSING_CHARSET, TAGGED_RCPT, TO_MATCH_ENVRCPT_SOME,
 MIME_TRACE, ASN, RCVD_COUNT_TWO
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id 166b653e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Wed, 15 Jan 2020 19:37:29 -0800 (PST)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 4F85D47722;
 Thu, 16 Jan 2020 03:37:24 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 3/5] drm/panel: Add Feixin K101 IM2BA02 panel
Date: Thu, 16 Jan 2020 11:36:34 +0800
Message-Id: <20200116033636.512461-4-icenowy@aosc.io>
In-Reply-To: <20200116033636.512461-1-icenowy@aosc.io>
References: <20200116033636.512461-1-icenowy@aosc.io>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1579145847;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
 bh=QBucPrKeFngOiKB8rJ2zea2pBOmCE0vN08xK7jAsLkI=;
 b=GaOpKR53FKfkJp1DF6Epfpdtf+HUbtI52lTjxxv4shS/auDgcxrCUjANJQsV9FD3WVPCme
 xIYL74kHD3LZveFTeooB9fR3K+opynDb96vVmxS5mes/Z1zd9hGTgwi8UalpiWrLctAdah
 IbeHlMMMJPzs8SQnxuSmHqEbuNSj9pk=
X-Mailman-Approved-At: Thu, 16 Jan 2020 08:21:03 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Feixin K101 IM2BA02 is a 800x1280 4-lane MIPI-DSI LCD panel.

Add a panel driver for it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
Changes in v2:
- Use regulator_bulk.
- Small code fixes.

 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-feixin-k101-im2ba02.c | 526 ++++++++++++++++++
 4 files changed, 542 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 98cf0b034f61..2ec9ae62478a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5251,6 +5251,12 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 S:	Maintained
 F:	drivers/gpu/drm/tve200/
 
+DRM DRIVER FOR FEIXIN K101 IM2BA02 MIPI-DSI LCD PANELS
+M:	Icenowy Zheng <icenowy@aosc.io>
+S:	Maintained
+F:	drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
+F:	Documentation/devicetree/bindings/display/panel/feixin,k101-im2ba02.yaml
+
 DRM DRIVER FOR FEIYANG FY07024DI26A30-D MIPI-DSI LCD PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index ae44ac2ec106..4641ec804e5e 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -50,6 +50,15 @@ config DRM_PANEL_SIMPLE
 	  that it can be automatically turned off when the panel goes into a
 	  low power state.
 
+config DRM_PANEL_FEIXIN_K101_IM2BA02
+	tristate "Feixin K101 IM2BA02 panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the Feixin K101 IM2BA02
+	  4-lane 800x1280 MIPI DSI panel.
+
 config DRM_PANEL_FEIYANG_FY07024DI26A30D
 	tristate "Feiyang FY07024DI26A30-D MIPI-DSI LCD panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 7c4d3c581fd4..442c17ccc62e 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_DRM_PANEL_ARM_VERSATILE) += panel-arm-versatile.o
 obj-$(CONFIG_DRM_PANEL_BOE_HIMAX8279D) += panel-boe-himax8279d.o
 obj-$(CONFIG_DRM_PANEL_LVDS) += panel-lvds.o
 obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
+obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
 obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
diff --git a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
new file mode 100644
index 000000000000..fddbfddf6566
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
@@ -0,0 +1,526 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019-2020 Icenowy Zheng <icenowy@aosc.io>
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/delay.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+
+#define K101_IM2BA02_INIT_CMD_LEN	2
+
+static const char * const regulator_names[] = {
+	"dvdd",
+	"avdd",
+	"cvdd"
+};
+
+struct k101_im2ba02 {
+	struct drm_panel	panel;
+	struct mipi_dsi_device	*dsi;
+
+	struct regulator_bulk_data supplies[ARRAY_SIZE(regulator_names)];
+	struct gpio_desc	*reset;
+};
+
+static inline struct k101_im2ba02 *panel_to_k101_im2ba02(struct drm_panel *panel)
+{
+	return container_of(panel, struct k101_im2ba02, panel);
+}
+
+struct k101_im2ba02_init_cmd {
+	u8 data[K101_IM2BA02_INIT_CMD_LEN];
+};
+
+static const struct k101_im2ba02_init_cmd k101_im2ba02_init_cmds[] = {
+	/* Switch to page 0 */
+	{ .data = { 0xE0, 0x00 } },
+
+	/* Seems to be some password */
+	{ .data = { 0xE1, 0x93} },
+	{ .data = { 0xE2, 0x65 } },
+	{ .data = { 0xE3, 0xF8 } },
+
+	/* Lane number, 0x02 - 3 lanes, 0x03 - 4 lanes */
+	{ .data = { 0x80, 0x03 } },
+
+	/* Sequence control */
+	{ .data = { 0x70, 0x02 } },
+	{ .data = { 0x71, 0x23 } },
+	{ .data = { 0x72, 0x06 } },
+
+	/* Switch to page 1 */
+	{ .data = { 0xE0, 0x01 } },
+
+	/* Set VCOM */
+	{ .data = { 0x00, 0x00 } },
+	{ .data = { 0x01, 0x66 } },
+	/* Set VCOM_Reverse */
+	{ .data = { 0x03, 0x00 } },
+	{ .data = { 0x04, 0x25 } },
+
+	/* Set Gamma Power, VG[MS][PN] */
+	{ .data = { 0x17, 0x00 } },
+	{ .data = { 0x18, 0x6D } },
+	{ .data = { 0x19, 0x00 } },
+	{ .data = { 0x1A, 0x00 } },
+	{ .data = { 0x1B, 0xBF } }, /* VGMN = -4.5V */
+	{ .data = { 0x1C, 0x00 } },
+
+	/* Set Gate Power */
+	{ .data = { 0x1F, 0x3E } }, /* VGH_R = 15V */
+	{ .data = { 0x20, 0x28 } }, /* VGL_R = -11V */
+	{ .data = { 0x21, 0x28 } }, /* VGL_R2 = -11V */
+	{ .data = { 0x22, 0x0E } }, /* PA[6:4] = 0, PA[0] = 0 */
+
+	/* Set Panel */
+	{ .data = { 0x37, 0x09 } }, /* SS = 1, BGR = 1 */
+
+	/* Set RGBCYC */
+	{ .data = { 0x38, 0x04 } }, /* JDT = 100 column inversion */
+	{ .data = { 0x39, 0x08 } }, /* RGB_N_EQ1 */
+	{ .data = { 0x3A, 0x12 } }, /* RGB_N_EQ2 */
+	{ .data = { 0x3C, 0x78 } }, /* set EQ3 for TE_H */
+	{ .data = { 0x3D, 0xFF } }, /* set CHGEN_ON */
+	{ .data = { 0x3E, 0xFF } }, /* set CHGEN_OFF */
+	{ .data = { 0x3F, 0x7F } }, /* set CHGEN_OFF2 */
+
+	/* Set TCON parameter */
+	{ .data = { 0x40, 0x06 } }, /* RSO = 800 points */
+	{ .data = { 0x41, 0xA0 } }, /* LN = 1280 lines */
+
+	/* Set power voltage */
+	{ .data = { 0x55, 0x0F } }, /* DCDCM */
+	{ .data = { 0x56, 0x01 } },
+	{ .data = { 0x57, 0x69 } },
+	{ .data = { 0x58, 0x0A } },
+	{ .data = { 0x59, 0x0A } },
+	{ .data = { 0x5A, 0x45 } },
+	{ .data = { 0x5B, 0x15 } },
+
+	/* Set gamma */
+	{ .data = { 0x5D, 0x7C } },
+	{ .data = { 0x5E, 0x65 } },
+	{ .data = { 0x5F, 0x55 } },
+	{ .data = { 0x60, 0x49 } },
+	{ .data = { 0x61, 0x44 } },
+	{ .data = { 0x62, 0x35 } },
+	{ .data = { 0x63, 0x3A } },
+	{ .data = { 0x64, 0x23 } },
+	{ .data = { 0x65, 0x3D } },
+	{ .data = { 0x66, 0x3C } },
+	{ .data = { 0x67, 0x3D } },
+	{ .data = { 0x68, 0x5D } },
+	{ .data = { 0x69, 0x4D } },
+	{ .data = { 0x6A, 0x56 } },
+	{ .data = { 0x6B, 0x48 } },
+	{ .data = { 0x6C, 0x45 } },
+	{ .data = { 0x6D, 0x38 } },
+	{ .data = { 0x6E, 0x25 } },
+	{ .data = { 0x6F, 0x00 } },
+	{ .data = { 0x70, 0x7C } },
+	{ .data = { 0x71, 0x65 } },
+	{ .data = { 0x72, 0x55 } },
+	{ .data = { 0x73, 0x49 } },
+	{ .data = { 0x74, 0x44 } },
+	{ .data = { 0x75, 0x35 } },
+	{ .data = { 0x76, 0x3A } },
+	{ .data = { 0x77, 0x23 } },
+	{ .data = { 0x78, 0x3D } },
+	{ .data = { 0x79, 0x3C } },
+	{ .data = { 0x7A, 0x3D } },
+	{ .data = { 0x7B, 0x5D } },
+	{ .data = { 0x7C, 0x4D } },
+	{ .data = { 0x7D, 0x56 } },
+	{ .data = { 0x7E, 0x48 } },
+	{ .data = { 0x7F, 0x45 } },
+	{ .data = { 0x80, 0x38 } },
+	{ .data = { 0x81, 0x25 } },
+	{ .data = { 0x82, 0x00 } },
+
+	/* Switch to page 2, for GIP */
+	{ .data = { 0xE0, 0x02 } },
+
+	{ .data = { 0x00, 0x1E } },
+	{ .data = { 0x01, 0x1E } },
+	{ .data = { 0x02, 0x41 } },
+	{ .data = { 0x03, 0x41 } },
+	{ .data = { 0x04, 0x43 } },
+	{ .data = { 0x05, 0x43 } },
+	{ .data = { 0x06, 0x1F } },
+	{ .data = { 0x07, 0x1F } },
+	{ .data = { 0x08, 0x1F } },
+	{ .data = { 0x09, 0x1F } },
+	{ .data = { 0x0A, 0x1E } },
+	{ .data = { 0x0B, 0x1E } },
+	{ .data = { 0x0C, 0x1F } },
+	{ .data = { 0x0D, 0x47 } },
+	{ .data = { 0x0E, 0x47 } },
+	{ .data = { 0x0F, 0x45 } },
+	{ .data = { 0x10, 0x45 } },
+	{ .data = { 0x11, 0x4B } },
+	{ .data = { 0x12, 0x4B } },
+	{ .data = { 0x13, 0x49 } },
+	{ .data = { 0x14, 0x49 } },
+	{ .data = { 0x15, 0x1F } },
+
+	{ .data = { 0x16, 0x1E } },
+	{ .data = { 0x17, 0x1E } },
+	{ .data = { 0x18, 0x40 } },
+	{ .data = { 0x19, 0x40 } },
+	{ .data = { 0x1A, 0x42 } },
+	{ .data = { 0x1B, 0x42 } },
+	{ .data = { 0x1C, 0x1F } },
+	{ .data = { 0x1D, 0x1F } },
+	{ .data = { 0x1E, 0x1F } },
+	{ .data = { 0x1F, 0x1f } },
+	{ .data = { 0x20, 0x1E } },
+	{ .data = { 0x21, 0x1E } },
+	{ .data = { 0x22, 0x1f } },
+	{ .data = { 0x23, 0x46 } },
+	{ .data = { 0x24, 0x46 } },
+	{ .data = { 0x25, 0x44 } },
+	{ .data = { 0x26, 0x44 } },
+	{ .data = { 0x27, 0x4A } },
+	{ .data = { 0x28, 0x4A } },
+	{ .data = { 0x29, 0x48 } },
+	{ .data = { 0x2A, 0x48 } },
+	{ .data = { 0x2B, 0x1f } },
+
+	{ .data = { 0x2C, 0x1F } },
+	{ .data = { 0x2D, 0x1F } },
+	{ .data = { 0x2E, 0x42 } },
+	{ .data = { 0x2F, 0x42 } },
+	{ .data = { 0x30, 0x40 } },
+	{ .data = { 0x31, 0x40 } },
+	{ .data = { 0x32, 0x1E } },
+	{ .data = { 0x33, 0x1E } },
+	{ .data = { 0x34, 0x1F } },
+	{ .data = { 0x35, 0x1F } },
+	{ .data = { 0x36, 0x1E } },
+	{ .data = { 0x37, 0x1E } },
+	{ .data = { 0x38, 0x1F } },
+	{ .data = { 0x39, 0x48 } },
+	{ .data = { 0x3A, 0x48 } },
+	{ .data = { 0x3B, 0x4A } },
+	{ .data = { 0x3C, 0x4A } },
+	{ .data = { 0x3D, 0x44 } },
+	{ .data = { 0x3E, 0x44 } },
+	{ .data = { 0x3F, 0x46 } },
+	{ .data = { 0x40, 0x46 } },
+	{ .data = { 0x41, 0x1F } },
+
+	{ .data = { 0x42, 0x1F } },
+	{ .data = { 0x43, 0x1F } },
+	{ .data = { 0x44, 0x43 } },
+	{ .data = { 0x45, 0x43 } },
+	{ .data = { 0x46, 0x41 } },
+	{ .data = { 0x47, 0x41 } },
+	{ .data = { 0x48, 0x1E } },
+	{ .data = { 0x49, 0x1E } },
+	{ .data = { 0x4A, 0x1E } },
+	{ .data = { 0x4B, 0x1F } },
+	{ .data = { 0x4C, 0x1E } },
+	{ .data = { 0x4D, 0x1E } },
+	{ .data = { 0x4E, 0x1F } },
+	{ .data = { 0x4F, 0x49 } },
+	{ .data = { 0x50, 0x49 } },
+	{ .data = { 0x51, 0x4B } },
+	{ .data = { 0x52, 0x4B } },
+	{ .data = { 0x53, 0x45 } },
+	{ .data = { 0x54, 0x45 } },
+	{ .data = { 0x55, 0x47 } },
+	{ .data = { 0x56, 0x47 } },
+	{ .data = { 0x57, 0x1F } },
+
+	{ .data = { 0x58, 0x10 } },
+	{ .data = { 0x59, 0x00 } },
+	{ .data = { 0x5A, 0x00 } },
+	{ .data = { 0x5B, 0x30 } },
+	{ .data = { 0x5C, 0x02 } },
+	{ .data = { 0x5D, 0x40 } },
+	{ .data = { 0x5E, 0x01 } },
+	{ .data = { 0x5F, 0x02 } },
+	{ .data = { 0x60, 0x30 } },
+	{ .data = { 0x61, 0x01 } },
+	{ .data = { 0x62, 0x02 } },
+	{ .data = { 0x63, 0x6A } },
+	{ .data = { 0x64, 0x6A } },
+	{ .data = { 0x65, 0x05 } },
+	{ .data = { 0x66, 0x12 } },
+	{ .data = { 0x67, 0x74 } },
+	{ .data = { 0x68, 0x04 } },
+	{ .data = { 0x69, 0x6A } },
+	{ .data = { 0x6A, 0x6A } },
+	{ .data = { 0x6B, 0x08 } },
+
+	{ .data = { 0x6C, 0x00 } },
+	{ .data = { 0x6D, 0x04 } },
+	{ .data = { 0x6E, 0x04 } },
+	{ .data = { 0x6F, 0x88 } },
+	{ .data = { 0x70, 0x00 } },
+	{ .data = { 0x71, 0x00 } },
+	{ .data = { 0x72, 0x06 } },
+	{ .data = { 0x73, 0x7B } },
+	{ .data = { 0x74, 0x00 } },
+	{ .data = { 0x75, 0x07 } },
+	{ .data = { 0x76, 0x00 } },
+	{ .data = { 0x77, 0x5D } },
+	{ .data = { 0x78, 0x17 } },
+	{ .data = { 0x79, 0x1F } },
+	{ .data = { 0x7A, 0x00 } },
+	{ .data = { 0x7B, 0x00 } },
+	{ .data = { 0x7C, 0x00 } },
+	{ .data = { 0x7D, 0x03 } },
+	{ .data = { 0x7E, 0x7B } },
+
+	{ .data = { 0xE0, 0x04 } },
+	{ .data = { 0x2B, 0x2B } },
+	{ .data = { 0x2E, 0x44 } },
+
+	{ .data = { 0xE0, 0x01 } },
+	{ .data = { 0x0E, 0x01 } },
+
+	{ .data = { 0xE0, 0x03 } },
+	{ .data = { 0x98, 0x2F } },
+
+	{ .data = { 0xE0, 0x00 } },
+	{ .data = { 0xE6, 0x02 } },
+	{ .data = { 0xE7, 0x02 } },
+
+	{ .data = { 0x11, 0x00 } },
+};
+
+static const struct k101_im2ba02_init_cmd timed_cmds[] = {
+	{ .data = { 0x29, 0x00 } },
+	{ .data = { 0x35, 0x00 } },
+};
+
+static int k101_im2ba02_prepare(struct drm_panel *panel)
+{
+	struct k101_im2ba02 *ctx = panel_to_k101_im2ba02(panel);
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	unsigned int i;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret)
+		return ret;
+
+	msleep(30);
+
+	gpiod_set_value(ctx->reset, 1);
+	msleep(50);
+
+	gpiod_set_value(ctx->reset, 0);
+	msleep(50);
+
+	gpiod_set_value(ctx->reset, 1);
+	msleep(200);
+
+	for (i = 0; i < ARRAY_SIZE(k101_im2ba02_init_cmds); i++) {
+		const struct k101_im2ba02_init_cmd *cmd = &k101_im2ba02_init_cmds[i];
+
+		ret = mipi_dsi_dcs_write_buffer(dsi, cmd->data, K101_IM2BA02_INIT_CMD_LEN);
+		if (ret < 0)
+			goto powerdown;
+	}
+
+	return 0;
+
+powerdown:
+	gpiod_set_value(ctx->reset, 0);
+	msleep(50);
+
+	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+}
+
+static int k101_im2ba02_enable(struct drm_panel *panel)
+{
+	struct k101_im2ba02 *ctx = panel_to_k101_im2ba02(panel);
+	const struct k101_im2ba02_init_cmd *cmd = &timed_cmds[1];
+	int ret;
+
+	msleep(150);
+
+	ret = mipi_dsi_dcs_set_display_on(ctx->dsi);
+	if (ret < 0)
+		return ret;
+
+	msleep(50);
+
+	return mipi_dsi_dcs_write_buffer(ctx->dsi, cmd->data, K101_IM2BA02_INIT_CMD_LEN);
+}
+
+static int k101_im2ba02_disable(struct drm_panel *panel)
+{
+	struct k101_im2ba02 *ctx = panel_to_k101_im2ba02(panel);
+
+	return mipi_dsi_dcs_set_display_off(ctx->dsi);
+}
+
+static int k101_im2ba02_unprepare(struct drm_panel *panel)
+{
+	struct k101_im2ba02 *ctx = panel_to_k101_im2ba02(panel);
+	int ret;
+
+	ret = mipi_dsi_dcs_set_display_off(ctx->dsi);
+	if (ret < 0)
+		DRM_DEV_ERROR(panel->dev, "failed to set display off: %d\n",
+			      ret);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
+	if (ret < 0)
+		DRM_DEV_ERROR(panel->dev, "failed to enter sleep mode: %d\n",
+			      ret);
+
+	msleep(200);
+
+	gpiod_set_value(ctx->reset, 0);
+	msleep(20);
+
+	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+}
+
+static const struct drm_display_mode k101_im2ba02_default_mode = {
+	.clock = 70000,
+	.vrefresh = 60,
+
+	.hdisplay = 800,
+	.hsync_start = 800 + 20,
+	.hsync_end = 800 + 20 + 20,
+	.htotal = 800 + 20 + 20 + 20,
+
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 16,
+	.vsync_end = 1280 + 16 + 4,
+	.vtotal = 1280 + 16 + 4 + 4,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+	.width_mm	= 136,
+	.height_mm	= 217,
+};
+
+static int k101_im2ba02_get_modes(struct drm_panel *panel,
+				  struct drm_connector *connector)
+{
+	struct k101_im2ba02 *ctx = panel_to_k101_im2ba02(panel);
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &k101_im2ba02_default_mode);
+	if (!mode) {
+		DRM_DEV_ERROR(&ctx->dsi->dev, "failed to add mode %ux%ux@%u\n",
+			      k101_im2ba02_default_mode.hdisplay,
+			      k101_im2ba02_default_mode.vdisplay,
+			      k101_im2ba02_default_mode.vrefresh);
+		return -ENOMEM;
+	}
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
+static const struct drm_panel_funcs k101_im2ba02_funcs = {
+	.disable = k101_im2ba02_disable,
+	.unprepare = k101_im2ba02_unprepare,
+	.prepare = k101_im2ba02_prepare,
+	.enable = k101_im2ba02_enable,
+	.get_modes = k101_im2ba02_get_modes,
+};
+
+static int k101_im2ba02_dsi_probe(struct mipi_dsi_device *dsi)
+{
+	struct k101_im2ba02 *ctx;
+	unsigned int i;
+	int ret;
+
+	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	mipi_dsi_set_drvdata(dsi, ctx);
+	ctx->dsi = dsi;
+
+	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++)
+		ctx->supplies[i].supply = regulator_names[i];
+
+	ret = devm_regulator_bulk_get(&dsi->dev, ARRAY_SIZE(ctx->supplies),
+				      ctx->supplies);
+	if (ret < 0) {
+		DRM_DEV_ERROR(&dsi->dev, "Couldn't get regulators\n");
+		return ret;
+	}
+
+	ctx->reset = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset)) {
+		DRM_DEV_ERROR(&dsi->dev, "Couldn't get our reset GPIO\n");
+		return PTR_ERR(ctx->reset);
+	}
+
+	drm_panel_init(&ctx->panel, &dsi->dev, &k101_im2ba02_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
+
+	ret = drm_panel_add(&ctx->panel);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->lanes = 4;
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int k101_im2ba02_dsi_remove(struct mipi_dsi_device *dsi)
+{
+	struct k101_im2ba02 *ctx = mipi_dsi_get_drvdata(dsi);
+
+	mipi_dsi_detach(dsi);
+	drm_panel_remove(&ctx->panel);
+
+	return 0;
+}
+
+static const struct of_device_id k101_im2ba02_of_match[] = {
+	{ .compatible = "feixin,k101-im2ba02", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, k101_im2ba02_of_match);
+
+static struct mipi_dsi_driver k101_im2ba02_driver = {
+	.probe = k101_im2ba02_dsi_probe,
+	.remove = k101_im2ba02_dsi_remove,
+	.driver = {
+		.name = "feixin-k101-im2ba02",
+		.of_match_table = k101_im2ba02_of_match,
+	},
+};
+module_mipi_dsi_driver(k101_im2ba02_driver);
+
+MODULE_AUTHOR("Icenowy Zheng <icenowy@aosc.io>");
+MODULE_DESCRIPTION("Feixin K101 IM2BA02 MIPI-DSI LCD panel");
+MODULE_LICENSE("GPL");
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
