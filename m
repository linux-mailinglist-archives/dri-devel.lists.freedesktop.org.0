Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31156654899
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0457A10E599;
	Thu, 22 Dec 2022 22:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539C810E599
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 22:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671748725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ght9Cz12XBVdRGneYg26vNie4Bxq0erKME7Iy3zY0sk=;
 b=JNTUXWCn1VxTO7lId0eUP+eELmw7yGjGWz4Yyf5mUs4ow1jbzWQWbf0Z2fTMkPggrL0VAB
 ooY5WoU/M8xM6qBBugePDfQwebCfWz2C+wC4obXmPhlf31NzUg1VFxGnxrvovRu4eh6swr
 3+uvByt5/GTSNc6696hT9CtL370qOVY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-427-v-20NfRvP8KwW47Iywmb8g-1; Thu, 22 Dec 2022 17:38:44 -0500
X-MC-Unique: v-20NfRvP8KwW47Iywmb8g-1
Received: by mail-wm1-f69.google.com with SMTP id
 t24-20020a1c7718000000b003d1fd0b866fso685075wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 14:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ght9Cz12XBVdRGneYg26vNie4Bxq0erKME7Iy3zY0sk=;
 b=EOX/ECg2iXQigrrmnq+MqKofOv3ztD/gfUN/GEJRH7dfVW+j8TCalGgh3nWOLHpcd+
 cgAQsEmooPMB5Bpa4x0o58fDCTQF2FyQhp0KfdvGx955Vi8HcW4E9u8bonuLo3WHBmgJ
 HqxuWkndYj5povAo7Goe+RCpMnYbjFhHZyopQn/JMChrlupzG2Q8azYi38OlQ89FpJDR
 xB9E/np6q4xY+mPI+0C/Rg5m66i1C7jgCbQQXx+S5l0dA9ATQuEEaQlta3kIo8HjAfLE
 xV0W1IekCCNxAMi9abXgAuEHgrd+ecp6i2l2u9NUgxHfy6CHbadVdR3gUEl3H1WSFM4c
 u7sQ==
X-Gm-Message-State: AFqh2krGKx9LkgF1sNulSNfhK5vszQHW/dFYNjW2m1gXK/Hkp0vfqagl
 baukc7I67PdqeDcjx55lrCfQiG3/dyVFFH+q6xNaAm4TQoql+xKWkGnCzaINX9Vjn99oQcGmZnO
 L7y7fn+kFQAQ9UB/Jmu/RKdEE9nne
X-Received: by 2002:a1c:19c4:0:b0:3d1:ebdf:d592 with SMTP id
 187-20020a1c19c4000000b003d1ebdfd592mr5462946wmz.22.1671748722669; 
 Thu, 22 Dec 2022 14:38:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuP0u7dskGkzNbFK3ZW8MZVZqH4CqyAnp12i/3HFUwZu5I/n43YZMwG5g5RPJKp6qEDcJuEyw==
X-Received: by 2002:a1c:19c4:0:b0:3d1:ebdf:d592 with SMTP id
 187-20020a1c19c4000000b003d1ebdfd592mr5462933wmz.22.1671748722393; 
 Thu, 22 Dec 2022 14:38:42 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n25-20020a7bc5d9000000b003d969a595fbsm2386239wmk.10.2022.12.22.14.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 14:38:42 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] drm: panel: Add Himax HX8394 panel controller driver
Date: Thu, 22 Dec 2022 23:38:27 +0100
Message-Id: <20221222223830.2494900-2-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221222223830.2494900-1-javierm@redhat.com>
References: <20221222223830.2494900-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Robert Mader <robert.mader@posteo.de>, Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Martijn Braam <martijn@brixit.nl>, Thierry Reding <thierry.reding@gmail.com>,
 Ondrej Jirman <megi@xff.cz>, Peter Robinson <pbrobinson@gmail.com>,
 =?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kamil Trzciński <ayufan@ayufan.eu>

The driver is for panels based on the Himax HX8394 controller, such as the
HannStar HSD060BHW4 720x1440 TFT LCD panel that uses a MIPI-DSI interface.

Signed-off-by: Kamil Trzciński <ayufan@ayufan.eu>
Co-developed-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Ondrej Jirman <megi@xff.cz>
Co-developed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/panel/Kconfig              |  12 +
 drivers/gpu/drm/panel/Makefile             |   1 +
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 460 +++++++++++++++++++++
 3 files changed, 473 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx8394.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 737edcdf9eef..7ee9c83f09a7 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -154,6 +154,18 @@ config DRM_PANEL_FEIYANG_FY07024DI26A30D
 	  Say Y if you want to enable support for panels based on the
 	  Feiyang FY07024DI26A30-D MIPI-DSI interface.
 
+config DRM_PANEL_HIMAX_HX8394
+	tristate "HIMAX HX8394 MIPI-DSI LCD panels"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y if you want to enable support for panels based on the
+	  Himax HX8394 controller, such as the HannStar HSD060BHW4
+	  720x1440 TFT LCD panel that uses a MIPI-DSI interface.
+
+	  If M is selected the module will be called panel-himax-hx8394.
+
 config DRM_PANEL_ILITEK_IL9322
 	tristate "Ilitek ILI9322 320x240 QVGA panels"
 	depends on OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index f8f9d9f6a307..84c01adafd4c 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_DRM_PANEL_EBBG_FT8719) += panel-ebbg-ft8719.o
 obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
 obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
 obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
+obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
new file mode 100644
index 000000000000..b22eec0674b5
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -0,0 +1,460 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for panels based on Himax HX8394 controller, such as:
+ *
+ * - HannStar HSD060BHW4 5.99" MIPI-DSI panel
+ *
+ * Copyright (C) Kamil Trzciński
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/display_timing.h>
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+#define DRV_NAME "panel-himax-hx8394"
+
+/* Manufacturer specific commands sent via DSI, listed in HX8394-F datasheet */
+#define HX8394_CMD_SETSEQUENCE	  0xb0
+#define HX8394_CMD_SETPOWER	  0xb1
+#define HX8394_CMD_SETDISP	  0xb2
+#define HX8394_CMD_SETCYC	  0xb4
+#define HX8394_CMD_SETVCOM	  0xb6
+#define HX8394_CMD_SETTE	  0xb7
+#define HX8394_CMD_SETSENSOR	  0xb8
+#define HX8394_CMD_SETEXTC	  0xb9
+#define HX8394_CMD_SETMIPI	  0xba
+#define HX8394_CMD_SETOTP	  0xbb
+#define HX8394_CMD_SETREGBANK	  0xbd
+#define HX8394_CMD_UNKNOWN1	  0xc0
+#define HX8394_CMD_SETDGCLUT	  0xc1
+#define HX8394_CMD_SETID	  0xc3
+#define HX8394_CMD_SETDDB	  0xc4
+#define HX8394_CMD_UNKNOWN2	  0xc6
+#define HX8394_CMD_SETCABC	  0xc9
+#define HX8394_CMD_SETCABCGAIN	  0xca
+#define HX8394_CMD_SETPANEL	  0xcc
+#define HX8394_CMD_SETOFFSET	  0xd2
+#define HX8394_CMD_SETGIP0	  0xd3
+#define HX8394_CMD_UNKNOWN3	  0xd4
+#define HX8394_CMD_SETGIP1	  0xd5
+#define HX8394_CMD_SETGIP2	  0xd6
+#define HX8394_CMD_SETGPO	  0xd6
+#define HX8394_CMD_SETSCALING	  0xdd
+#define HX8394_CMD_SETIDLE	  0xdf
+#define HX8394_CMD_SETGAMMA	  0xe0
+#define HX8394_CMD_SETCHEMODE_DYN 0xe4
+#define HX8394_CMD_SETCHE	  0xe5
+#define HX8394_CMD_SETCESEL	  0xe6
+#define HX8394_CMD_SET_SP_CMD	  0xe9
+#define HX8394_CMD_SETREADINDEX	  0xfe
+#define HX8394_CMD_GETSPIREAD	  0xff
+
+struct hx8394 {
+	struct device *dev;
+	struct drm_panel panel;
+	struct gpio_desc *reset_gpio;
+	struct regulator *vcc;
+	struct regulator *iovcc;
+	bool prepared;
+
+	const struct hx8394_panel_desc *desc;
+};
+
+struct hx8394_panel_desc {
+	const struct drm_display_mode *mode;
+	unsigned int lanes;
+	unsigned long mode_flags;
+	enum mipi_dsi_pixel_format format;
+	int (*init_sequence)(struct hx8394 *ctx);
+};
+
+static inline struct hx8394 *panel_to_hx8394(struct drm_panel *panel)
+{
+	return container_of(panel, struct hx8394, panel);
+}
+
+#define dsi_dcs_write_seq(dsi, cmd, seq...) do {			\
+		static const u8 d[] = { seq };				\
+		int ret;						\
+		ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));	\
+		if (ret < 0)						\
+			return ret;					\
+	} while (0)
+
+static int hsd060bhw4_init_sequence(struct hx8394 *ctx)
+{
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+
+	/* 5.19.8 SETEXTC: Set extension command (B9h) */
+	dsi_dcs_write_seq(dsi, HX8394_CMD_SETEXTC,
+			  0xff, 0x83, 0x94);
+
+	/* 5.19.2 SETPOWER: Set power (B1h) */
+	dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
+			  0x48, 0x11, 0x71, 0x09, 0x32, 0x24, 0x71, 0x31, 0x55, 0x30);
+
+	/* 5.19.9 SETMIPI: Set MIPI control (BAh) */
+	dsi_dcs_write_seq(dsi, HX8394_CMD_SETMIPI,
+			  0x63, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
+
+	/* 5.19.3 SETDISP: Set display related register (B2h) */
+	dsi_dcs_write_seq(dsi, HX8394_CMD_SETDISP,
+			  0x00, 0x80, 0x78, 0x0c, 0x07);
+
+	/* 5.19.4 SETCYC: Set display waveform cycles (B4h) */
+	dsi_dcs_write_seq(dsi, HX8394_CMD_SETCYC,
+			  0x12, 0x63, 0x12, 0x63, 0x12, 0x63, 0x01, 0x0c, 0x7c, 0x55,
+			  0x00, 0x3f, 0x12, 0x6b, 0x12, 0x6b, 0x12, 0x6b, 0x01, 0x0c,
+			  0x7c);
+
+	/* 5.19.19 SETGIP0: Set GIP Option0 (D3h) */
+	dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP0,
+			  0x00, 0x00, 0x00, 0x00, 0x3c, 0x1c, 0x00, 0x00, 0x32, 0x10,
+			  0x09, 0x00, 0x09, 0x32, 0x15, 0xad, 0x05, 0xad, 0x32, 0x00,
+			  0x00, 0x00, 0x00, 0x37, 0x03, 0x0b, 0x0b, 0x37, 0x00, 0x00,
+			  0x00, 0x0c, 0x40);
+
+	/* 5.19.20 Set GIP Option1 (D5h) */
+	dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP1,
+			  0x19, 0x19, 0x18, 0x18, 0x1b, 0x1b, 0x1a, 0x1a, 0x00, 0x01,
+			  0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x20, 0x21, 0x18, 0x18,
+			  0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+			  0x24, 0x25, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+			  0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
+
+	/* 5.19.21 Set GIP Option2 (D6h) */
+	dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP2,
+			  0x18, 0x18, 0x19, 0x19, 0x1b, 0x1b, 0x1a, 0x1a, 0x07, 0x06,
+			  0x05, 0x04, 0x03, 0x02, 0x01, 0x00, 0x25, 0x24, 0x18, 0x18,
+			  0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+			  0x21, 0x20, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+			  0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
+
+	/* 5.19.25 SETGAMMA: Set gamma curve related setting (E0h) */
+	dsi_dcs_write_seq(dsi, HX8394_CMD_SETGAMMA,
+			  0x00, 0x04, 0x0c, 0x12, 0x14, 0x18, 0x1a, 0x18, 0x31, 0x3f,
+			  0x4d, 0x4c, 0x54, 0x65, 0x6b, 0x70, 0x7f, 0x82, 0x7e, 0x8a,
+			  0x99, 0x4a, 0x48, 0x49, 0x4b, 0x4a, 0x4c, 0x4b, 0x7f, 0x00,
+			  0x04, 0x0c, 0x11, 0x13, 0x17, 0x1a, 0x18, 0x31,
+			  0x3f, 0x4d, 0x4c, 0x54, 0x65, 0x6b, 0x70, 0x7f,
+			  0x82, 0x7e, 0x8a, 0x99, 0x4a, 0x48, 0x49, 0x4b,
+			  0x4a, 0x4c, 0x4b, 0x7f);
+
+	/* 5.19.17 SETPANEL (CCh) */
+	dsi_dcs_write_seq(dsi, HX8394_CMD_SETPANEL, 0x0b);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN1, 0x1f, 0x31);
+
+	/* 5.19.5 SETVCOM: Set VCOM voltage (B6h) */
+	dsi_dcs_write_seq(dsi, HX8394_CMD_SETVCOM,
+			  0x7d, 0x7d);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN3,
+			  0x02);
+
+	/* 5.19.11 Set register bank (BDh) */
+	dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK, 0x01);
+
+	/* 5.19.2 SETPOWER: Set power (B1h) */
+	dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER, 0x00);
+
+	/* 5.19.11 Set register bank (BDh) */
+	dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK, 0x00);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN3,
+			  0xed);
+
+	return 0;
+}
+
+static const struct drm_display_mode hsd060bhw4_mode = {
+	.hdisplay    = 720,
+	.hsync_start = 720 + 40,
+	.hsync_end   = 720 + 40 + 46,
+	.htotal	     = 720 + 40 + 46 + 40,
+	.vdisplay    = 1440,
+	.vsync_start = 1440 + 9,
+	.vsync_end   = 1440 + 9 + 7,
+	.vtotal	     = 1440 + 9 + 7 + 7,
+	.clock	     = 74250,
+	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	.width_mm    = 68,
+	.height_mm   = 136,
+};
+
+static const struct hx8394_panel_desc hsd060bhw4_desc = {
+	.mode = &hsd060bhw4_mode,
+	.lanes = 4,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init_sequence = hsd060bhw4_init_sequence,
+};
+
+static int hx8394_enable(struct drm_panel *panel)
+{
+	struct hx8394 *ctx = panel_to_hx8394(panel);
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	int ret;
+
+	dev_info(ctx->dev, "enable\n");
+
+	ret = ctx->desc->init_sequence(ctx);
+	if (ret) {
+		dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret) {
+		dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
+		return ret;
+	}
+
+	/* Panel is operational 120 msec after reset */
+	msleep(120);
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret) {
+		dev_err(ctx->dev, "Failed to turn on the display: %d\n", ret);
+		goto sleep_in;
+	}
+
+	return 0;
+
+sleep_in:
+	/* This will probably fail, but let's try orderly power off anyway. */
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (!ret)
+		msleep(50);
+
+	return ret;
+}
+
+static int hx8394_disable(struct drm_panel *panel)
+{
+	struct hx8394 *ctx = panel_to_hx8394(panel);
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	int ret;
+
+	dev_info(ctx->dev, "disable\n");
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret) {
+		dev_err(ctx->dev, "Failed to enter sleep mode: %d\n", ret);
+		return ret;
+	}
+
+	msleep(50); /* about 3 frames */
+
+	return 0;
+}
+
+static int hx8394_unprepare(struct drm_panel *panel)
+{
+	struct hx8394 *ctx = panel_to_hx8394(panel);
+
+	if (!ctx->prepared)
+		return 0;
+
+	dev_info(ctx->dev, "unprepare\n");
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	regulator_disable(ctx->iovcc);
+	regulator_disable(ctx->vcc);
+
+	ctx->prepared = false;
+
+	return 0;
+}
+
+static int hx8394_prepare(struct drm_panel *panel)
+{
+	struct hx8394 *ctx = panel_to_hx8394(panel);
+	int ret;
+
+	if (ctx->prepared)
+		return 0;
+
+	dev_info(ctx->dev, "prepare\n");
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	ret = regulator_enable(ctx->vcc);
+	if (ret) {
+		dev_err(ctx->dev, "Failed to enable vcc supply: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_enable(ctx->iovcc);
+	if (ret) {
+		dev_err(ctx->dev, "Failed to enable iovcc supply: %d\n", ret);
+		goto disable_vcc;
+	}
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+
+	msleep(180);
+
+	ctx->prepared = true;
+
+	return 0;
+
+disable_vcc:
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_disable(ctx->vcc);
+	return ret;
+}
+
+static int hx8394_get_modes(struct drm_panel *panel,
+			    struct drm_connector *connector)
+{
+	struct hx8394 *ctx = panel_to_hx8394(panel);
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, ctx->desc->mode);
+	if (!mode) {
+		dev_err(ctx->dev, "Failed to add mode %ux%u@%u\n",
+			ctx->desc->mode->hdisplay, ctx->desc->mode->vdisplay,
+			drm_mode_vrefresh(ctx->desc->mode));
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
+static const struct drm_panel_funcs hx8394_drm_funcs = {
+	.disable   = hx8394_disable,
+	.unprepare = hx8394_unprepare,
+	.prepare   = hx8394_prepare,
+	.enable	   = hx8394_enable,
+	.get_modes = hx8394_get_modes,
+};
+
+static int hx8394_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct hx8394 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset gpio\n");
+
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	ctx->dev = dev;
+	ctx->desc = of_device_get_match_data(dev);
+
+	dsi->mode_flags = ctx->desc->mode_flags;
+	dsi->format = ctx->desc->format;
+	dsi->lanes = ctx->desc->lanes;
+
+	ctx->vcc = devm_regulator_get(dev, "vcc");
+	if (IS_ERR(ctx->vcc))
+		return dev_err_probe(dev, PTR_ERR(ctx->vcc),
+				     "Failed to request vcc regulator\n");
+
+	ctx->iovcc = devm_regulator_get(dev, "iovcc");
+	if (IS_ERR(ctx->iovcc))
+		return dev_err_probe(dev, PTR_ERR(ctx->iovcc),
+				     "Failed to request iovcc regulator\n");
+
+	drm_panel_init(&ctx->panel, dev, &hx8394_drm_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "mipi_dsi_attach failed\n");
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	dev_info(dev, "%ux%u@%u %ubpp dsi %udl - ready\n",
+		 ctx->desc->mode->hdisplay, ctx->desc->mode->vdisplay,
+		 drm_mode_vrefresh(ctx->desc->mode),
+		 mipi_dsi_pixel_format_to_bpp(dsi->format), dsi->lanes);
+
+	return 0;
+}
+
+static void hx8394_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct hx8394 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = drm_panel_disable(&ctx->panel);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
+
+	ret = drm_panel_unprepare(&ctx->panel);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
+}
+
+static void hx8394_remove(struct mipi_dsi_device *dsi)
+{
+	struct hx8394 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	hx8394_shutdown(dsi);
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id hx8394_of_match[] = {
+	{ .compatible = "hannstar,hsd060bhw4", .data = &hsd060bhw4_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, hx8394_of_match);
+
+static struct mipi_dsi_driver hx8394_driver = {
+	.probe	= hx8394_probe,
+	.remove = hx8394_remove,
+	.shutdown = hx8394_shutdown,
+	.driver = {
+		.name = DRV_NAME,
+		.of_match_table = hx8394_of_match,
+	},
+};
+module_mipi_dsi_driver(hx8394_driver);
+
+MODULE_AUTHOR("Kamil Trzciński <ayufan@ayufan.eu>");
+MODULE_DESCRIPTION("DRM driver for Himax HX8394 based MIPI DSI panels");
+MODULE_LICENSE("GPL");
-- 
2.38.1

