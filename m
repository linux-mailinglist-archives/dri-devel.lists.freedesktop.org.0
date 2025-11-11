Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C97C4D215
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 11:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E7710E540;
	Tue, 11 Nov 2025 10:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I5HDVpTz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9CD10E540
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 10:43:19 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-34381ec9197so2395935a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 02:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762857798; x=1763462598; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MZEDfeWpx78pjJDVHaRwd0TynoQkZQpi48Ht85grStM=;
 b=I5HDVpTzJwQICeB4vmWdJ2gZJTXH7Zm2KWuM1IJ6MtE16P/bZ45nsSigc/pK79N3PP
 uoUYrbSwRWgr73JP6khPgeze/yRImTTxjRLGvw4trEYfrNrSGyAPqmwQFPDrNToeEVuJ
 Va15Lcgom+Se3U//SiZ9B000IQ5BHNxzAUFZ6U/wWiXJu2A6SOqd+kChaNmsWNHGleYX
 GDquPMHmYR4hUrqEDrv6PtZ0wLmG6FQwO9doplmCjq1F2wZG8QQItSHHvcEsTSJEalkU
 Zgs1OvUglW/Nymcel8qgjN+gOy9O7INfG/9i1szJTwfNdq7ynlaN3otIyryCC+PRfVEV
 Gy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762857798; x=1763462598;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MZEDfeWpx78pjJDVHaRwd0TynoQkZQpi48Ht85grStM=;
 b=as4B5gUDkbRVBIlv3x5YU9GDpNAzN09PeHfRu1aY7CvZ7mX+9DKn4H69VqaDLE59uN
 zRxbqb3BayBHeKyhFcP0qcaMUrSkN26prCcMbBu8wHS4Y3Zl5f2R3p6SAcRS5/9Ln8Mu
 5qw90mFNSrTVG4TzcI+4xUBVTCuwZyQwapwBmAB+PISCjWJwpoDey4CYXsinPle/j/dh
 VLhp3fupJ+SSXjDK2GJgm4YM4rPpsll/HiFw1NWDAZLASYAN6xExRUwoPb9Sdnx1WnhI
 CFoqbbJ09omqjdLYdyZ2hn9FvTAYmBTCCXIFqNFHaX5w1ZtmRg6Kf0IyH2GP/HhF3RvL
 JpTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwaU9k6oowlzOJw/3iZA+VepS2tfVvXtbpJaFusoOLbxv+U0j4yGvFA0WIqXpkYmKtk/f95kTuyXE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/7dRAtxyGc0sa+4/lm31rz3Lwv/H83wTskFAQyw11ajPqY6rK
 oFlF0hlwP81ny0lacR6iz8/Gk5a9PNbRqU2XULKYs3DEJG3NUhiWR5Os
X-Gm-Gg: ASbGncu8mjH6CC6Bw9GNIQsyavx2fzQ8YedmekFobMogNc93YWpKAkiHAOfOZjRVzKV
 3jw5/202av9am/lFQVSwPTyh0oKmLwhDMq7n/xNS2HK0QqWIGF0aHrhgugcXXqUWI2hctnwP8pK
 zKm57rwGvKFAN6IPpq6tQBYok9P74H5ONK8lWbF1e90ibfjtMuijMpd7uh+z87SMiSK7MmLWVBb
 v2X+cD44OgiPOKUY/q6AOHawInNgZ7DxNfWC4cSz4ssMQUq0VWLc+Y332iGXX3ulw7ZotcHu6dV
 913nkrEsAid6zzPlE1gwwZ5S0tn8dYlpRtATWHJN7uejOH3apcISB1nUH/LrI1IguMgi61jGv0b
 9MEozZPNZhrZrt9Cq1VF/sc2Vsv0pKUxhbM3Uak3KOIxmAKe8dImnCUAO5UKyhi9CZUaazzSz6s
 EgbLwqI2f9XZJcjZC9GSZ5KufT6A==
X-Google-Smtp-Source: AGHT+IHyK5nuOa8qQ/Z6QUguHmwsTbAgoHMcNIwwmfJYUrdA5TVOoq5wd1Bil/WV96jNvTNUtMq4Ew==
X-Received: by 2002:a17:90b:4a8f:b0:343:653d:31c with SMTP id
 98e67ed59e1d1-3436cb0d08amr12853905a91.5.1762857797615; 
 Tue, 11 Nov 2025 02:43:17 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ba901e312a2sm15200222a12.31.2025.11.11.02.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 02:43:17 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v1] drm: panel: Add Waveshare MIPI-DSI panel driver
Date: Tue, 11 Nov 2025 16:13:09 +0530
Message-Id: <20251111104309.3424018-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
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

This patch adds a DRM panel driver for Waveshare MIPI-DSI panels
of various sizes (5.0", 5.5", 7.0", 8.0", and 10.1") with integrated
touch functionality.

The driver provides:
 - Initialization and reset sequencing
 - MIPI-DSI command transfer for panel setup
 - Backlight integration through the backlight class device
 - Support for multiple panel variants via compatible strings

These panels are commonly used with Waveshare development kits
and require proper power sequencing and regulator support.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 arch/arm64/configs/defconfig                  |    1 +
 drivers/gpu/drm/panel/Kconfig                 |   11 +
 drivers/gpu/drm/panel/Makefile                |    1 +
 .../gpu/drm/panel/panel-waveshare-dsi-v2.c    | 2687 +++++++++++++++++
 4 files changed, 2700 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-waveshare-dsi-v2.c

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a1e564024be2..178c8699f86c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1823,4 +1823,5 @@ CONFIG_CORESIGHT_STM=m
 CONFIG_CORESIGHT_CPU_DEBUG=m
 CONFIG_CORESIGHT_CTI=m
 CONFIG_MEMTEST=y
+CONFIG_DRM_PANEL_WAVESHARE_TOUCHSCREEN_V2=y
 CONFIG_REGULATOR_WAVESHARE_TOUCHSCREEN=y
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 407c5f6a268b..b771817af8f8 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -1137,6 +1137,17 @@ config DRM_PANEL_VISIONOX_VTDR6130
 	  Say Y here if you want to enable support for Visionox
 	  VTDR6130 1080x2400 AMOLED DSI panel.
 
+config DRM_PANEL_WAVESHARE_TOUCHSCREEN_V2
+	tristate "Waveshare touchscreen panels V2"
+	depends on DRM_MIPI_DSI
+	depends on I2C
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Enable support for Waveshare DSI touchscreen panels,
+	  Say Y here if you want to enable support for the Waveshare
+	  DSI Touchscreens.  To compile this driver as a module,
+	  choose M here.
+
 config DRM_PANEL_WIDECHIPS_WS2401
 	tristate "Widechips WS2401 DPI panel driver"
 	depends on SPI && GPIOLIB
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 3615a761b44f..3947e28addde 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -114,5 +114,6 @@ obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_RM692E5) += panel-visionox-rm692e5.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_VTDR6130) += panel-visionox-vtdr6130.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_R66451) += panel-visionox-r66451.o
+obj-$(CONFIG_DRM_PANEL_WAVESHARE_TOUCHSCREEN_V2) += panel-waveshare-dsi-v2.o
 obj-$(CONFIG_DRM_PANEL_WIDECHIPS_WS2401) += panel-widechips-ws2401.o
 obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) += panel-xinpeng-xpp055c272.o
diff --git a/drivers/gpu/drm/panel/panel-waveshare-dsi-v2.c b/drivers/gpu/drm/panel/panel-waveshare-dsi-v2.c
new file mode 100644
index 000000000000..7af11fdc026f
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-waveshare-dsi-v2.c
@@ -0,0 +1,2687 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Waveshare International Limited
+ *
+ * Based on panel-raspberrypi-touchscreen by Broadcom
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+#include <video/mipi_display.h>
+
+struct ws_panel_desc {
+	int (*init)(struct mipi_dsi_device *dsi);
+	const struct drm_display_mode *mode;
+	const unsigned long mode_flags;
+	unsigned int lanes;
+	enum mipi_dsi_pixel_format format;
+};
+
+struct ws_panel {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	const struct ws_panel_desc *desc;
+
+	struct regulator *power;
+	struct gpio_desc *reset;
+	struct gpio_desc *iovcc;
+	struct gpio_desc *avdd;
+
+	enum drm_panel_orientation orientation;
+};
+
+enum dsi_cmd_type {
+	INIT_DCS_CMD,
+	DELAY_CMD,
+};
+
+struct panel_init_cmd {
+	enum dsi_cmd_type type;
+	size_t len;
+	const char *data;
+};
+
+static int ws_panel_12_3_a_4lane_init(struct mipi_dsi_device *dsi)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB9, 0x83, 0x10, 0x2E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xCD);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBB, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD1, 0x67, 0x2C, 0xFF, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBE, 0x11, 0x96, 0x89);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD9, 0x04, 0x03, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB1, 0x10, 0xFA, 0xAF,
+		      0xAF, 0x33, 0x33, 0xB1, 0x4D, 0x2F, 0x36,
+		      0x36, 0x36, 0x36, 0x22, 0x21, 0x15, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB2, 0x00, 0xD0, 0x27,
+		      0x80, 0x00, 0x14, 0x40, 0x2C, 0x32, 0x02,
+		      0x00, 0x00, 0x15, 0x20, 0xD7, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB4, 0x98, 0xA0, 0x01,
+		      0x01, 0x98, 0xA0, 0x68, 0x50, 0x01, 0xC7, 0x01,
+		      0x58, 0x00, 0xFF, 0x00, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB6, 0x4D, 0x4D, 0xE3);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBF, 0xFC, 0x85, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD2, 0x33, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD3, 0x00, 0x00, 0x00,
+		      0x00, 0x64, 0x04, 0x00, 0x08,
+		      0x08, 0x27, 0x27, 0x22, 0x2F, 0x15, 0x15, 0x04, 0x04,
+		      0x32, 0x10, 0x13, 0x00, 0x13, 0x32, 0x10, 0x1F, 0x00,
+		      0x02, 0x32, 0x17, 0xFD, 0x00, 0x10, 0x00, 0x00, 0x20,
+		      0x30, 0x01, 0x55, 0x21, 0x38, 0x01, 0x55, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x00, 0x0C, 0x1A, 0x23,
+		      0x2B, 0x4F, 0x64, 0x69,
+		      0x6C, 0x64, 0x77, 0x77, 0x76, 0x80, 0x79, 0x7E, 0x85,
+		      0x9A, 0x97, 0x4D, 0x56, 0x64, 0x70, 0x00, 0x0C, 0x1A,
+		      0x23, 0x2B, 0x4F, 0x64, 0x69, 0x6C, 0x64, 0x77, 0x77,
+		      0x76, 0x80, 0x79, 0x7E, 0x85, 0x9A, 0x97, 0x4D, 0x56,
+		      0x64, 0x76);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB1, 0x01, 0x9B, 0x01, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCB, 0x80, 0x36, 0x12, 0x16,
+		      0xC0, 0x28, 0x40, 0x84, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD3, 0x01, 0x00, 0xFC, 0x00,
+		      0x00, 0x11, 0x10, 0x00, 0x0E, 0x00, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB4, 0x4E, 0x00, 0x33, 0x11,
+		      0x33, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBF, 0xF2, 0x00, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC0, 0x23, 0x23, 0x22, 0x11,
+		      0xA2, 0x17, 0x00, 0x80,
+		      0x00, 0x00, 0x08, 0x00, 0x63, 0x63);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC6, 0xF9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC7, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC8, 0x00, 0x04, 0x04, 0x00,
+		      0x00, 0x82, 0x13, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD0, 0x07, 0x04, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD5, 0x18, 0x18, 0x18, 0x18,
+		      0x18, 0x18, 0x21, 0x20,
+		      0x21, 0x20, 0x01, 0x00, 0x03, 0x02, 0x05, 0x04, 0x07,
+		      0x06, 0x1A, 0x1A, 0x1A, 0x1A, 0x9A, 0x9A, 0x9A, 0x9A,
+		      0x18, 0x18, 0x18, 0x18, 0x21, 0x20, 0x21, 0x20, 0x18,
+		      0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD6, 0x18, 0x18, 0x18, 0x18,
+		      0x18, 0x18, 0x20, 0x21,
+		      0x20, 0x21, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06,
+		      0x07, 0x1A, 0x1A, 0x1A, 0x1A, 0x1A, 0x1A, 0x1A, 0x1A,
+		      0x18, 0x18, 0x18, 0x18, 0x20, 0x21, 0x20, 0x21, 0x98,
+		      0x98, 0x98, 0x98, 0x98, 0x98, 0x98, 0x98, 0x98, 0x98);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE7, 0x00, 0x34, 0x01, 0x88,
+		      0x0E, 0xBE, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC2, 0x43, 0xFF, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCC, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB2, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD8, 0xAA, 0xAA, 0xAA, 0xAA,
+		      0xAA, 0xAA, 0xAA, 0xAA,
+		      0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0x80, 0x2A, 0xAA, 0xAA,
+		      0xAA, 0xAA, 0x80, 0x2A, 0xAA, 0xAA, 0xAA);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD8, 0xAA, 0xAA, 0xAA, 0xAA,
+		      0xAA, 0xAA, 0xAA, 0xAA,
+		      0xAA, 0xAA, 0xAA, 0xAA);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD8, 0xFF, 0xFF, 0xFF, 0xFF,
+		      0xFF, 0xF0, 0xFF, 0xFF,
+		      0xFF, 0xFF, 0xFF, 0xF0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
+	msleep(120);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
+	msleep(20);
+
+	return 0;
+};
+
+static int ws_panel_10_1_a_4lane_init(struct mipi_dsi_device *dsi)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE1, 0x93);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE2, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE3, 0xF8);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x3B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0C, 0x74);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0xAF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1B, 0xAF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3A, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3C, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3D, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3E, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3F, 0x7F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x40, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x41, 0xA0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x42, 0x81);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x43, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x44, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x45, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x57, 0x69);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x59, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5A, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5B, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5D, 0x7F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5E, 0x6B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5F, 0x5C);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x4F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x4D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x63, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0x2B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x65, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x67, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x63);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6A, 0x5A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6B, 0x4F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6C, 0x4E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6D, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6E, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6F, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x70, 0x7F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x71, 0x6B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x72, 0x5C);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x73, 0x4F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x74, 0x4D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x76, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0x2B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x78, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7A, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7B, 0x63);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7C, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7D, 0x5A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7E, 0x4F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7F, 0x4E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x81, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x82, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x02, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x05, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x06, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0A, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0B, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0C, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0D, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0E, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0F, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x10, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11, 0x4B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x12, 0x4B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x13, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x14, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x16, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1A, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1B, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1C, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1D, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1E, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1F, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x22, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x23, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x24, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x27, 0x4A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x28, 0x4A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2A, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2B, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2C, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2D, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2E, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2F, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x30, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x31, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x32, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x33, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x34, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x36, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3A, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3B, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3C, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3D, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3E, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3F, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x40, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x41, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x42, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x43, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x44, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x45, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x46, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x47, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x48, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x49, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4A, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4B, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4C, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4D, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4E, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4F, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x50, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x51, 0x0B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x52, 0x0B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x53, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x54, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x56, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x57, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5B, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5C, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5D, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5E, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5F, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x63, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0x6A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x67, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x1D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6A, 0x6A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6B, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6D, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6E, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6F, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0xDD);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x78, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7A, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7D, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7E, 0x82);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x0E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x02, 0xB3);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x61);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0E, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE6, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE7, 0x0C);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
+	msleep(120);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
+	msleep(60);
+
+	return 0;
+};
+
+static int ws_panel_10_1_a_init(struct mipi_dsi_device *dsi)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE1, 0x93);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE2, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE3, 0xF8);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0C, 0x74);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0xAF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1B, 0xAF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3A, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3C, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3D, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3E, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3F, 0x7F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x40, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x41, 0xA0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x42, 0x81);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x43, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x44, 0x0D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x45, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x57, 0x69);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x59, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5A, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5B, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5D, 0x7F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5E, 0x6A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5F, 0x5B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x4F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x4A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x3D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x63, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x65, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x67, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x62);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6A, 0x59);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6B, 0x4C);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6C, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6D, 0x3A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6E, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6F, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x70, 0x7F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x71, 0x6A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x72, 0x5B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x73, 0x4F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x74, 0x4A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0x3D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x76, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x78, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7A, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7B, 0x62);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7C, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7D, 0x59);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7E, 0x4C);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7F, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x3A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x81, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x82, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x02, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x5E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x05, 0x5E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x06, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0A, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0B, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0C, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0D, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0E, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0F, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x10, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11, 0x4B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x12, 0x4B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x13, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x14, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x16, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1A, 0x5E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1B, 0x5E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1C, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1D, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1E, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1F, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x22, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x23, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x24, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x27, 0x4A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x28, 0x4A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2A, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2B, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2C, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2D, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2E, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2F, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x30, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x31, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x32, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x33, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x34, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x36, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3A, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3B, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3C, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3D, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3E, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3F, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x40, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x41, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x42, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x43, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x44, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x45, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x46, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x47, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x48, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x49, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4A, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4B, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4C, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4D, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4E, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4F, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x50, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x51, 0x0B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x52, 0x0B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x53, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x54, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x56, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x57, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5B, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5D, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5E, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5F, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x63, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0x6A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x67, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6A, 0x6A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6B, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6D, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6E, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6F, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0xDD);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x78, 0x2C);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7A, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7D, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7E, 0x82);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x0E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x02, 0xB3);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x61);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0E, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x58);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2B, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE6, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE7, 0x0C);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
+	msleep(120);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
+	msleep(60);
+
+	return 0;
+};
+
+static int ws_panel_10_1_b_4lane_init(struct mipi_dsi_device *dsi)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE1, 0x93);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE2, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE3, 0xF8);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x3D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0xBF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1B, 0xBF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1C, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x24, 0xFE);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3A, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3C, 0x74);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3D, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3E, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3F, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x40, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x41, 0xA0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x42, 0x7E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x43, 0x1A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x44, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x45, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x57, 0xA9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x59, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5A, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5B, 0x1A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5D, 0x7F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5E, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5F, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x3D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x2D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x63, 0x2D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x65, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x67, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x2D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6A, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6B, 0x27);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6C, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6D, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6E, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6F, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x70, 0x7F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x71, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x72, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x73, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x74, 0x3D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0x2D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x76, 0x2D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x78, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7A, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7B, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7C, 0x2D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7D, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7E, 0x27);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7F, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x81, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x82, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x02, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x05, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x06, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0A, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0B, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0C, 0x4B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0D, 0x4A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0E, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0F, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x10, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x12, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x13, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x14, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x16, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1A, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1B, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1C, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1D, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1E, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1F, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x22, 0x4B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x23, 0x4A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x24, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x27, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x28, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2A, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2B, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2C, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2D, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2E, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2F, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x30, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x31, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x32, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x33, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x34, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x36, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x0B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3A, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3B, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3C, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3D, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3E, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3F, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x40, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x41, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x42, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x43, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x44, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x45, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x46, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x47, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x48, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x49, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4A, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4B, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4C, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4D, 0x0B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4E, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4F, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x50, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x51, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x52, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x53, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x54, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x56, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x57, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5B, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5C, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5D, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5E, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5F, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x63, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0x66);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x65, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x67, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6A, 0x66);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6B, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6D, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6E, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6F, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0xE3);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x76, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0xD5);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x78, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7D, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7E, 0x66);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x0E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x02, 0xB3);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0E, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x58);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2B, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0x1D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
+	msleep(120);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
+	msleep(5);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35);
+
+	return 0;
+};
+
+static int ws_panel_10_1_b_init(struct mipi_dsi_device *dsi)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE1, 0x93);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE2, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE3, 0xF8);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x3D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0xBF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1B, 0xBF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1C, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x24, 0xFE);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3A, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3C, 0x74);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3D, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3E, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3F, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x40, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x41, 0xA0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x42, 0x7E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x43, 0x1A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x44, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x45, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x57, 0xA9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x59, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5A, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5B, 0x1A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5D, 0x7F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5E, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5F, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x3D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x2D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x63, 0x2D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x65, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x67, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x2D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6A, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6B, 0x27);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6C, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6D, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6E, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6F, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x70, 0x7F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x71, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x72, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x73, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x74, 0x3D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0x2D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x76, 0x2D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x78, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7A, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7B, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7C, 0x2D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7D, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7E, 0x27);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7F, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x81, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x82, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x02, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x05, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x06, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0A, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0B, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0C, 0x4B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0D, 0x4A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0E, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0F, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x10, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x12, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x13, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x14, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x16, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1A, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1B, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1C, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1D, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1E, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1F, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x22, 0x4B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x23, 0x4A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x24, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x27, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x28, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2A, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2B, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2C, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2D, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2E, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2F, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x30, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x31, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x32, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x33, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x34, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x36, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x0B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3A, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3B, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3C, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3D, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3E, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3F, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x40, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x41, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x42, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x43, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x44, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x45, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x46, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x47, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x48, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x49, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4A, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4B, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4C, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4D, 0x0B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4E, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4F, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x50, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x51, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x52, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x53, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x54, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x56, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x57, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5B, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5C, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5D, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5E, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5F, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x63, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0x66);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x65, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x67, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6A, 0x66);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6B, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6D, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6E, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6F, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0xE3);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x76, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0xD5);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x78, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7D, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7E, 0x66);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x0E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x02, 0xB3);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0E, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x58);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2B, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0x1D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
+	msleep(120);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
+	msleep(5);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35);
+
+	return 0;
+};
+
+static int ws_panel_8_8_a_init(struct mipi_dsi_device *dsi)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
+	msleep(120);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
+	msleep(50);
+
+	return 0;
+};
+
+static int ws_panel_8_a_4lane_init(struct mipi_dsi_device *dsi)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE1, 0x93);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE2, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE3, 0xF8);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x7E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0C, 0x74);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0xB7);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1B, 0xB7);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x24, 0xFE);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3A, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3B, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3C, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3D, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3E, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3F, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x40, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x41, 0xA0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x43, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x44, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x45, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4B, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x56, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x57, 0xA9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x58, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x59, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5A, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5B, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5D, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5E, 0x63);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5F, 0x54);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x63, 0x3D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x65, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x67, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x62);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6A, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6B, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6C, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6D, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6E, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6F, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x70, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x71, 0x63);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x72, 0x54);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x73, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x74, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x76, 0x3D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x78, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7A, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7B, 0x62);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7C, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7D, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7E, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7F, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x81, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x82, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x02, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x4B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x05, 0x4B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x06, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0A, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0B, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0C, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0D, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0E, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0F, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x10, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x12, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x13, 0x35);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x14, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x16, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1A, 0x4A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1B, 0x4A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1C, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1D, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1E, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1F, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x22, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x23, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x24, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x27, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x28, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x35);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2A, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2B, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x59, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5B, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5C, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5D, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5E, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5F, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x63, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0x6B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x65, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0x0C);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x67, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6A, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6B, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6D, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6E, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6F, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x70, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x71, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x72, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x73, 0x7B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x74, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0xF8);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x76, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0xD5);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x78, 0x2E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7A, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7B, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7D, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7E, 0x7B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x0E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x02, 0xB3);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0E, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x36, 0x59);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
+	msleep(120);	   mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
+	msleep(60);
+
+	return 0;
+};
+
+static int ws_panel_8_a_init(struct mipi_dsi_device *dsi)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE1, 0x93);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE2, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE3, 0xF8);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x4E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0C, 0x74);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0xB7);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1B, 0xB7);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x24, 0xFE);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3A, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3B, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3C, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3D, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3E, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3F, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x40, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x41, 0xA0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x43, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x44, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x45, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4B, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x56, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x57, 0xA9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x58, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x59, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5A, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5B, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5D, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5E, 0x63);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5F, 0x54);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x63, 0x3D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x65, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x67, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x62);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6A, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6B, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6C, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6D, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6E, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6F, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x70, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x71, 0x63);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x72, 0x54);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x73, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x74, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x76, 0x3D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x78, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7A, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7B, 0x62);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7C, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7D, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7E, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7F, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x81, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x82, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x02, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x4B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x05, 0x4B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x06, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0A, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0B, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0C, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0D, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0E, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0F, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x10, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x12, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x13, 0x35);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x14, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x16, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1A, 0x4A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1B, 0x4A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1C, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1D, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1E, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1F, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x22, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x23, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x24, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x27, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x28, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x35);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2A, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2B, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x59, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5B, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5C, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5D, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5E, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5F, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x63, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0x6B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x65, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0x0C);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x67, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6A, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6B, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6D, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6E, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6F, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x70, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x71, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x72, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x73, 0x7B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x74, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0xF8);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x76, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0xD5);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x78, 0x2E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7A, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7B, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7D, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7E, 0x7B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x0E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x02, 0xB3);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0E, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x36, 0x59);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x58);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2B, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
+	msleep(120);	   mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
+	msleep(60);
+
+	return 0;
+};
+
+static int ws_panel_7_a_init(struct mipi_dsi_device *dsi)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xFF, 0x98, 0x81, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x02, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x05, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x06, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x61);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0B, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0C, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0D, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0E, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0F, 0x61);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x10, 0x61);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x12, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x13, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x14, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x16, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1B, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1D, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1E, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1F, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x22, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x23, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x24, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x27, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x28, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2B, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2D, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2E, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2F, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x30, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x31, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x32, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x33, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x34, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x36, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x3C);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3B, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3D, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3E, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3F, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x40, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x41, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x42, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x43, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x44, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x50, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x51, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x52, 0x54);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x53, 0x76);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x54, 0x98);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0xBA);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x56, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x57, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x58, 0x54);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x59, 0x76);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5A, 0x98);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5B, 0xBA);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5C, 0xDC);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5D, 0xFE);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5E, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5F, 0x0E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x0C);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x0D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x63, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x65, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x67, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6B, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6C, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6D, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6E, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6F, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x70, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x71, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x72, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x73, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x74, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0x0E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x76, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0x0C);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x78, 0x0D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7A, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7B, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7C, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7D, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7E, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7F, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x81, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x82, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x83, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x84, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x85, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x86, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x87, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x88, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x89, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8A, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xFF, 0x98, 0x81, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6C, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6E, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6F, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3A, 0x94);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8D, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x87, 0xBA);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x76);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB2, 0xD1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB5, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3B, 0x98);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xFF, 0x98, 0x81, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x22, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x31, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x53, 0x71);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x8F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x40, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x50, 0x96);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x51, 0x96);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xA0, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xA1, 0x1D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xA2, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xA3, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xA4, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xA5, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xA6, 0x1C);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xA7, 0x1D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xA8, 0x7E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xA9, 0x1D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xAA, 0x29);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xAB, 0x6B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xAC, 0x1A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xAD, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xAE, 0x4B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xAF, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB0, 0x27);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB1, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB2, 0x64);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB3, 0x39);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC0, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC1, 0x1D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC2, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC3, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC4, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC5, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC6, 0x1C);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC7, 0x1D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC8, 0x7E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC9, 0x1D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCA, 0x29);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCB, 0x6B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCC, 0x1A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCD, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCE, 0x4B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCF, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD0, 0x27);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD1, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD2, 0x64);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD3, 0x39);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xFF, 0x98, 0x81, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3A, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x36, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
+	msleep(120);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
+	msleep(60);
+
+	return 0;
+};
+
+static int ws_panel_5_5_a_init(struct mipi_dsi_device *dsi)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB9, 0xFF, 0x83, 0x94);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBA, 0x61, 0x03, 0x68,
+		      0x6B, 0xB2, 0xC0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB1, 0x48, 0x12, 0x72,
+		      0x09, 0x32, 0x54, 0x71, 0x71, 0x57, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB2, 0x00, 0x80, 0x64,
+		      0x0C, 0x0D, 0x2F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB4, 0x73, 0x74, 0x73,
+		      0x74, 0x73, 0x74, 0x01, 0x0C,
+		      0x86, 0x75, 0x00, 0x3F, 0x73, 0x74, 0x73, 0x74, 0x73,
+		      0x74, 0x01, 0x0C, 0x86);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB6, 0x86, 0x86);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD3, 0x00, 0x00, 0x07,
+		      0x07, 0x40, 0x07, 0x0C, 0x00,
+		      0x08, 0x10, 0x08, 0x00, 0x08, 0x54, 0x15, 0x0A, 0x05,
+		      0x0A, 0x02, 0x15, 0x06, 0x05, 0x06, 0x47, 0x44, 0x0A,
+		      0x0A, 0x4B, 0x10, 0x07, 0x07, 0x0C, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD5, 0x1C, 0x1C, 0x1D, 0x1D,
+		      0x00, 0x01, 0x02, 0x03,
+		      0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x24,
+		      0x25, 0x18, 0x18, 0x26, 0x27, 0x18, 0x18, 0x18, 0x18,
+		      0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+		      0x18, 0x18, 0x18, 0x20, 0x21, 0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD6, 0x1C, 0x1C, 0x1D, 0x1D,
+		      0x07, 0x06, 0x05, 0x04,
+		      0x03, 0x02, 0x01, 0x00, 0x0B, 0x0A, 0x09, 0x08, 0x21,
+		      0x20, 0x18, 0x18, 0x27, 0x26, 0x18, 0x18, 0x18, 0x18,
+		      0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+		      0x18, 0x18, 0x18, 0x25, 0x24, 0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x00, 0x13, 0x21, 0x28,
+		      0x2B, 0x2E, 0x32, 0x2F,
+		      0x61, 0x6E, 0x7E, 0x7B, 0x80, 0x8F, 0x91, 0x93, 0x9D,
+		      0x9D, 0x97, 0xA4, 0xB1, 0x57, 0x55, 0x58, 0x5D, 0x60,
+		      0x67, 0x74, 0x7F, 0x00, 0x13, 0x21, 0x28, 0x2B, 0x2E,
+		      0x32, 0x2F, 0x61, 0x6E, 0x7D, 0x7B, 0x7F, 0x8E, 0x90,
+		      0x93, 0x9C, 0x9D, 0x98, 0xA4, 0xB1, 0x58, 0x55, 0x59,
+		      0x5E, 0x61, 0x68, 0x76, 0x7F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC0, 0x1F, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCC, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD4, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD8, 0xFF, 0xFF, 0xFF, 0xFF,
+		      0xFF, 0xFF, 0xFF, 0xFF,
+		      0xFF, 0xFF, 0xFF, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB1, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC6, 0xED);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC7, 0x00, 0xC0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
+	msleep(120);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
+	msleep(50);
+
+	return 0;
+};
+
+static int ws_panel_5_a_init(struct mipi_dsi_device *dsi)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB9, 0xFF, 0x83, 0x94);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB1, 0x48, 0x0A, 0x6A,
+		      0x09, 0x33, 0x54, 0x71, 0x71, 0x2E, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBA, 0x61, 0x03, 0x68,
+		      0x6B, 0xB2, 0xC0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB2, 0x00, 0x80, 0x64,
+		      0x0C, 0x06, 0x2F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB4, 0x1C, 0x78, 0x1C,
+		      0x78, 0x1C, 0x78, 0x01, 0x0C,
+		      0x86, 0x75, 0x00, 0x3F, 0x1C, 0x78, 0x1C, 0x78, 0x1C,
+		      0x78, 0x01, 0x0C, 0x86);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD3, 0x00, 0x00, 0x00,
+		      0x00, 0x00, 0x00, 0x08, 0x08,
+		      0x32, 0x10, 0x05, 0x00, 0x05, 0x32, 0x13, 0xC1, 0x00,
+		      0x01, 0x32, 0x10, 0x08, 0x00, 0x00, 0x37, 0x03, 0x07,
+		      0x07, 0x37, 0x05, 0x05, 0x37, 0x0C, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD5, 0x18, 0x18, 0x18, 0x18,
+		      0x22, 0x23, 0x20, 0x21,
+		      0x04, 0x05, 0x06, 0x07, 0x00, 0x01, 0x02, 0x03, 0x18,
+		      0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+		      0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+		      0x18, 0x18, 0x18, 0x18, 0x18, 0x19, 0x19, 0x19, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD6, 0x18, 0x18, 0x19, 0x19,
+		      0x21, 0x20, 0x23, 0x22,
+		      0x03, 0x02, 0x01, 0x00, 0x07, 0x06, 0x05, 0x04, 0x18,
+		      0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+		      0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+		      0x18, 0x18, 0x18, 0x18, 0x18, 0x19, 0x19, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x07, 0x08, 0x09, 0x0D,
+		      0x10, 0x14, 0x16, 0x13,
+		      0x24, 0x36, 0x48, 0x4A, 0x58, 0x6F, 0x76, 0x80, 0x97,
+		      0xA5, 0xA8, 0xB5, 0xC6, 0x62, 0x63, 0x68, 0x6F, 0x72,
+		      0x78, 0x7F, 0x7F, 0x00, 0x02, 0x08, 0x0D, 0x0C, 0x0E,
+		      0x0F, 0x10, 0x24, 0x36, 0x48, 0x4A, 0x58, 0x6F, 0x78,
+		      0x82, 0x99, 0xA4, 0xA0, 0xB1, 0xC0, 0x5E, 0x5E, 0x64,
+		      0x6B, 0x6C, 0x73, 0x7F, 0x7F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCC, 0x0B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC0, 0x1F, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB6, 0x6B, 0x6B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD4, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB1, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBF, 0x40, 0x81, 0x50, 0x00,
+		      0x1A, 0xFC, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
+	msleep(200);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB2, 0x00, 0x80, 0x64, 0x0C,
+		      0x06, 0x2F, 0x00, 0x00,
+		      0x00, 0x00, 0xC0, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
+	msleep(80);
+
+	return 0;
+};
+
+static int ws_panel_4_c_init(struct mipi_dsi_device *dsi)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE1, 0x93);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE2, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE3, 0xF8);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0xD0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1B, 0xD0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x24, 0xFE);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3A, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3C, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3D, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3E, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3F, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x40, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x41, 0x64);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x42, 0xC7);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x43, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x44, 0x0B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x45, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x57, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x59, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5A, 0x1B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5B, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5D, 0x7F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5E, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5F, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x63, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x65, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0x2F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x67, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6A, 0x4C);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6B, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6C, 0x3D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6D, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6E, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6F, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x70, 0x7F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x71, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x72, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x73, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x74, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x76, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x78, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x2F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7A, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7B, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7C, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7D, 0x4C);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7E, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7F, 0x3D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x81, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x82, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x02, 0x5E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x5E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x05, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x06, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x4A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0x4A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0A, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0B, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0C, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0D, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0E, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0F, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x10, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x12, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x13, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x14, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x16, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0x5E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x5E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1A, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1B, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1C, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1D, 0x4B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1E, 0x4B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1F, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x22, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x23, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x24, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x27, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x28, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2A, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2B, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2C, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2D, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2E, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2F, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x30, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x31, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x32, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x33, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x34, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x0B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x36, 0x0B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3A, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3B, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3C, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3D, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3E, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3F, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x40, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x41, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x42, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x43, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x44, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x45, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x46, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x47, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x48, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x49, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4A, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4B, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4C, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4D, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4E, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4F, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x50, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x51, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x52, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x53, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x54, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x56, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x57, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x59, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5B, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5C, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5D, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5E, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5F, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x63, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0xA6);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x65, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x67, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6A, 0x7F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6B, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6D, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6E, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6F, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0xD9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x76, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x78, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
+	msleep(120);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
+	msleep(5);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x00);
+
+	return 0;
+};
+
+static int ws_panel_3_4_c_init(struct mipi_dsi_device *dsi)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE1, 0x93);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE2, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE3, 0xF8);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0xD0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1B, 0xD0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x24, 0xFE);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3A, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3C, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3D, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3E, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3F, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x40, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x41, 0x64);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x42, 0xC7);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x43, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x44, 0x0B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x45, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x57, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x59, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5A, 0x1B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5B, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5D, 0x7F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5E, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5F, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x63, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x65, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0x2F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x67, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6A, 0x4C);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6B, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6C, 0x3D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6D, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6E, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6F, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x70, 0x7F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x71, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x72, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x73, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x74, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x76, 0x2A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x78, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x2F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7A, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7B, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7C, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7D, 0x4C);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7E, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7F, 0x3D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x81, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x82, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x02, 0x5E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x5E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x05, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x06, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x4A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0x4A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0A, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0B, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0C, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0D, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0E, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0F, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x10, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x12, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x13, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x14, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x16, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0x5E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x5E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1A, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1B, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1C, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1D, 0x4B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1E, 0x4B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1F, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x22, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x23, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x24, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x27, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x28, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2A, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2B, 0x5F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2C, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2D, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2E, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2F, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x30, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x31, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x32, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x33, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x34, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x0B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x36, 0x0B);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3A, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3B, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3C, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3D, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3E, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3F, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x40, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x41, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x42, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x43, 0x1E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x44, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x45, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x46, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x47, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x48, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x49, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4A, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4B, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4C, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4D, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4E, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4F, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x50, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x51, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x52, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x53, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x54, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x56, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x57, 0x1F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x59, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5A, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5B, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5C, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5D, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5E, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5F, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x63, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0xA6);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x65, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x67, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6A, 0x7F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6B, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6C, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6D, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6E, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6F, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0xD9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x76, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x78, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
+	msleep(120);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
+	msleep(5);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x00);
+
+	return 0;
+};
+
+static inline struct ws_panel *panel_to_ws(struct drm_panel *panel)
+{
+	return container_of(panel, struct ws_panel, panel);
+}
+
+static int ws_panel_prepare(struct drm_panel *panel)
+{
+	struct ws_panel *ctx = panel_to_ws(panel);
+	int ret;
+
+	if (ctx->iovcc) {
+		gpiod_set_value_cansleep(ctx->iovcc, 1);
+		msleep(20);
+	}
+
+	if (ctx->avdd) {
+		gpiod_set_value_cansleep(ctx->avdd, 1);
+		msleep(20);
+	}
+
+	if (ctx->reset) {
+		gpiod_set_value_cansleep(ctx->reset, 0);
+		msleep(60);
+		gpiod_set_value_cansleep(ctx->reset, 1);
+		msleep(60);
+	}
+
+	ret = ctx->desc->init(ctx->dsi);
+	if (ret < 0)
+		dev_err(panel->dev, "failed to init panel: %d\n", ret);
+
+	return 0;
+}
+
+static int ws_panel_unprepare(struct drm_panel *panel)
+{
+	struct ws_panel *ctx = panel_to_ws(panel);
+
+	mipi_dsi_dcs_set_display_off(ctx->dsi);
+	mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
+
+	if (ctx->reset) {
+		gpiod_set_value_cansleep(ctx->reset, 0);
+		msleep(5);
+	}
+
+	if (ctx->avdd) {
+		gpiod_set_value_cansleep(ctx->avdd, 0);
+		msleep(5);
+	}
+
+	if (ctx->iovcc) {
+		gpiod_set_value_cansleep(ctx->iovcc, 0);
+		msleep(5);
+	}
+
+	return 0;
+}
+
+static const struct drm_display_mode ws_panel_12_3_a_4lane_mode = {
+	.clock = 95000,
+	.hdisplay = 720,
+	.hsync_start = 720 + 10,
+	.hsync_end = 720 + 10 + 10,
+	.htotal = 720 + 10 + 10 + 12,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 64,
+	.vsync_end = 1920 + 64 + 18,
+	.vtotal = 1920 + 64 + 18 + 4,
+	.width_mm = 109,
+	.height_mm = 292,
+};
+
+static const struct drm_display_mode ws_panel_10_1_a_mode = {
+	.clock = 70000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 40,
+	.hsync_end = 800 + 40 + 20,
+	.htotal = 800 + 40 + 20 + 20,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 20,
+	.vsync_end = 1280 + 20 + 20,
+	.vtotal = 1280 + 20 + 20 + 4,
+	.width_mm = 135,
+	.height_mm = 216,
+};
+
+static const struct drm_display_mode ws_panel_10_1_b_4lane_mode = {
+	.clock = 66000,
+	.hdisplay = 720,
+	.hsync_start = 720 + 60,
+	.hsync_end = 720 + 60 + 60,
+	.htotal = 720 + 60 + 60 + 4,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 16,
+	.vsync_end = 1280 + 16 + 12,
+	.vtotal = 1280 + 16 + 12 + 4,
+	.width_mm = 125,
+	.height_mm = 222,
+};
+
+static const struct drm_display_mode ws_panel_10_1_b_mode = {
+	.clock = 69000,
+	.hdisplay = 720,
+	.hsync_start = 720 + 50,
+	.hsync_end = 720 + 50 + 50,
+	.htotal = 720 + 50 + 50 + 50,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 26,
+	.vsync_end = 1280 + 26 + 12,
+	.vtotal = 1280 + 26 + 12 + 4,
+	.width_mm = 125,
+	.height_mm = 222,
+};
+
+static const struct drm_display_mode ws_panel_9_b_4lane_mode = {
+	.clock = 66000,
+	.hdisplay = 720,
+	.hsync_start = 720 + 60,
+	.hsync_end = 720 + 60 + 60,
+	.htotal = 720 + 60 + 60 + 4,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 16,
+	.vsync_end = 1280 + 16 + 12,
+	.vtotal = 1280 + 16 + 12 + 4,
+	.width_mm = 114,
+	.height_mm = 196,
+};
+
+static const struct drm_display_mode ws_panel_9_b_mode = {
+	.clock = 69000,
+	.hdisplay = 720,
+	.hsync_start = 720 + 50,
+	.hsync_end = 720 + 50 + 50,
+	.htotal = 720 + 50 + 50 + 50,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 26,
+	.vsync_end = 1280 + 26 + 12,
+	.vtotal = 1280 + 26 + 12 + 4,
+	.width_mm = 114,
+	.height_mm = 196,
+};
+
+static const struct drm_display_mode ws_panel_8_8_a_mode = {
+	.clock = 75000,
+	.hdisplay = 480,
+	.hsync_start = 480 + 50,
+	.hsync_end = 480 + 50 + 50,
+	.htotal = 480 + 50 + 50 + 50,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 20,
+	.vsync_end = 1920 + 20 + 20,
+	.vtotal = 1920 + 20 + 20 + 20,
+	.width_mm = 68,
+	.height_mm = 219,
+};
+
+static const struct drm_display_mode ws_panel_8_a_mode = {
+	.clock = 70000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 40,
+	.hsync_end = 800 + 40 + 20,
+	.htotal = 800 + 40 + 20 + 20,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 30,
+	.vsync_end = 1280 + 30 + 12,
+	.vtotal = 1280 + 30 + 12 + 4,
+	.width_mm = 107,
+	.height_mm = 172,
+};
+
+static const struct drm_display_mode ws_panel_7_a_mode = {
+	.clock = 83333,
+	.hdisplay = 720,
+	.hsync_start = 720 + 120,
+	.hsync_end = 720 + 120 + 100,
+	.htotal = 720 + 120 + 100 + 100,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 10,
+	.vsync_end = 1280 + 10 + 10,
+	.vtotal = 1280 + 10 + 10 + 10,
+	.width_mm = 85,
+	.height_mm = 154,
+};
+
+static const struct drm_display_mode ws_panel_5_5_a_mode = {
+	.clock = 65000,
+	.hdisplay = 720,
+	.hsync_start = 720 + 50,
+	.hsync_end = 720 + 50 + 50,
+	.htotal = 720 + 50 + 50 + 10,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 15,
+	.vsync_end = 1280 + 15 + 12,
+	.vtotal = 1280 + 15 + 12 + 4,
+	.width_mm = 62,
+	.height_mm = 110,
+};
+
+static const struct drm_display_mode ws_panel_5_a_mode = {
+	.clock = 70000,
+	.hdisplay = 720,
+	.hsync_start = 720 + 40,
+	.hsync_end = 720 + 40 + 20,
+	.htotal = 720 + 40 + 20 + 20,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 30,
+	.vsync_end = 1280 + 30 + 10,
+	.vtotal = 1280 + 30 + 10 + 4,
+	.width_mm = 62,
+	.height_mm = 110,
+};
+
+static const struct drm_display_mode ws_panel_4_c_mode = {
+	.clock       = 36500,
+	.hdisplay    = 720,
+	.hsync_start = 720 + 40,
+	.hsync_end   = 720 + 40 + 20,
+	.htotal      = 720 + 40 + 20 + 20,
+	.vdisplay    = 720,
+	.vsync_start = 720 + 24,
+	.vsync_end   = 720 + 24 + 4,
+	.vtotal      = 720 + 24 + 4 + 12,
+	.width_mm	 = 88,
+	.height_mm	 = 88,
+};
+
+static const struct drm_display_mode ws_panel_3_4_c_mode = {
+	.clock       = 44300,
+	.hdisplay    = 800,
+	.hsync_start = 800 + 40,
+	.hsync_end   = 800 + 40 + 20,
+	.htotal      = 800 + 40 + 20 + 20,
+	.vdisplay    = 800,
+	.vsync_start = 800 + 24,
+	.vsync_end   = 800 + 24 + 4,
+	.vtotal      = 800 + 24 + 4 + 12,
+	.width_mm	 = 88,
+	.height_mm	 = 88,
+};
+
+static int ws_panel_get_modes(struct drm_panel *panel,
+			      struct drm_connector *connector)
+{
+	struct ws_panel *ctx = panel_to_ws(panel);
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, ctx->desc->mode);
+	if (!mode) {
+		dev_err(&ctx->dsi->dev, "failed to add mode %ux%ux@%u\n",
+			ctx->desc->mode->hdisplay, ctx->desc->mode->vdisplay,
+			drm_mode_vrefresh(ctx->desc->mode));
+		return -ENOMEM;
+	}
+
+	drm_mode_set_name(mode);
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	drm_mode_probed_add(connector, mode);
+
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+
+	drm_connector_set_panel_orientation(connector, ctx->orientation);
+
+	return 1;
+}
+
+static enum drm_panel_orientation
+ws_panel_get_orientation(struct drm_panel *panel)
+{
+	struct ws_panel *ctx = panel_to_ws(panel);
+
+	return ctx->orientation;
+}
+
+static const struct drm_panel_funcs ws_panel_funcs = {
+	.prepare = ws_panel_prepare,
+	.unprepare = ws_panel_unprepare,
+	.get_modes = ws_panel_get_modes,
+	.get_orientation = ws_panel_get_orientation,
+};
+
+static int ws_panel_dsi_probe(struct mipi_dsi_device *dsi)
+{
+	struct ws_panel *ctx;
+	int ret;
+
+	dev_info(&dsi->dev, "dsi panel: %s\n",
+		 (char *)of_get_property(
+			 dsi->dev.of_node, "compatible", NULL));
+
+	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	mipi_dsi_set_drvdata(dsi, ctx);
+	ctx->dsi = dsi;
+	ctx->desc = of_device_get_match_data(&dsi->dev);
+
+	ctx->panel.prepare_prev_first = true;
+	drm_panel_init(&ctx->panel, &dsi->dev, &ws_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ctx->reset = devm_gpiod_get_optional(
+			&dsi->dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset))
+		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->reset),
+				     "Couldn't get our reset GPIO\n");
+
+	ctx->iovcc = devm_gpiod_get_optional(
+			&dsi->dev, "iovcc", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->iovcc))
+		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->iovcc),
+					"Couldn't get our iovcc GPIO\n");
+
+	ctx->avdd = devm_gpiod_get_optional(&dsi->dev, "avdd", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->avdd))
+		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->avdd),
+					"Couldn't get our avdd GPIO\n");
+
+	ret = of_drm_get_panel_orientation(
+			dsi->dev.of_node, &ctx->orientation);
+	if (ret) {
+		dev_err(&dsi->dev, "%pOF: failed to get orientation: %d\n",
+			dsi->dev.of_node, ret);
+		return ret;
+	}
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
+
+	drm_panel_add(&ctx->panel);
+
+	dsi->mode_flags = ctx->desc->mode_flags;
+	dsi->format = ctx->desc->format;
+	dsi->lanes = ctx->desc->lanes;
+	dev_info(&dsi->dev, "lanes: %d\n", dsi->lanes);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret)
+		drm_panel_remove(&ctx->panel);
+
+	return ret;
+}
+
+static void ws_panel_dsi_remove(struct mipi_dsi_device *dsi)
+{
+	struct ws_panel *ctx = mipi_dsi_get_drvdata(dsi);
+
+	mipi_dsi_detach(dsi);
+	drm_panel_remove(&ctx->panel);
+	if (ctx->reset) {
+		gpiod_set_value_cansleep(ctx->reset, 0);
+		msleep(5);
+	}
+
+	if (ctx->avdd) {
+		gpiod_set_value_cansleep(ctx->avdd, 0);
+		msleep(5);
+	}
+
+	if (ctx->iovcc) {
+		gpiod_set_value_cansleep(ctx->iovcc, 0);
+		msleep(5);
+	}
+}
+
+static void ws_panel_dsi_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct ws_panel *ctx = mipi_dsi_get_drvdata(dsi);
+
+	if (ctx->reset) {
+		dev_info(&dsi->dev, "shutdown\n");
+		gpiod_set_value_cansleep(ctx->reset, 0);
+		msleep(5);
+	}
+
+	if (ctx->avdd) {
+		gpiod_set_value_cansleep(ctx->avdd, 0);
+		msleep(5);
+	}
+
+	if (ctx->iovcc) {
+		gpiod_set_value_cansleep(ctx->iovcc, 0);
+		msleep(5);
+	}
+}
+
+static const struct ws_panel_desc ws_panel_12_3_inch_a_4lane_desc = {
+	.init = ws_panel_12_3_a_4lane_init,
+	.mode = &ws_panel_12_3_a_4lane_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+};
+
+static const struct ws_panel_desc ws_panel_10_1_inch_a_4lane_desc = {
+	.init = ws_panel_10_1_a_4lane_init,
+	.mode = &ws_panel_10_1_a_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+};
+
+static const struct ws_panel_desc ws_panel_10_1_inch_a_desc = {
+	.init = ws_panel_10_1_a_init,
+	.mode = &ws_panel_10_1_a_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+};
+
+static const struct ws_panel_desc ws_panel_10_1_inch_b_4lane_desc = {
+	.init = ws_panel_10_1_b_4lane_init,
+	.mode = &ws_panel_10_1_b_4lane_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+};
+
+static const struct ws_panel_desc ws_panel_10_1_inch_b_desc = {
+	.init = ws_panel_10_1_b_init,
+	.mode = &ws_panel_10_1_b_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+};
+
+static const struct ws_panel_desc ws_panel_9_inch_b_4lane_desc = {
+	.init = ws_panel_10_1_b_4lane_init,
+	.mode = &ws_panel_9_b_4lane_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+};
+
+static const struct ws_panel_desc ws_panel_9_inch_b_desc = {
+	.init = ws_panel_10_1_b_init,
+	.mode = &ws_panel_9_b_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+};
+
+static const struct ws_panel_desc ws_panel_8_8_inch_a_desc = {
+	.init = ws_panel_8_8_a_init,
+	.mode = &ws_panel_8_8_a_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+};
+
+static const struct ws_panel_desc ws_panel_8_inch_a_4lane_desc = {
+	.init = ws_panel_8_a_4lane_init,
+	.mode = &ws_panel_8_a_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+};
+
+static const struct ws_panel_desc ws_panel_8_inch_a_desc = {
+	.init = ws_panel_8_a_init,
+	.mode = &ws_panel_8_a_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+};
+
+static const struct ws_panel_desc ws_panel_7_inch_a_desc = {
+	.init = ws_panel_7_a_init,
+	.mode = &ws_panel_7_a_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+};
+
+static const struct ws_panel_desc ws_panel_5_5_inch_a_desc = {
+	.init = ws_panel_5_5_a_init,
+	.mode = &ws_panel_5_5_a_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+};
+
+static const struct ws_panel_desc ws_panel_5_inch_a_desc = {
+	.init = ws_panel_5_a_init,
+	.mode = &ws_panel_5_a_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+};
+
+static const struct ws_panel_desc ws_panel_4_inch_c_desc = {
+	.init = ws_panel_4_c_init,
+	.mode = &ws_panel_4_c_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+};
+
+static const struct ws_panel_desc ws_panel_3_4_inch_c_desc = {
+	.init = ws_panel_3_4_c_init,
+	.mode = &ws_panel_3_4_c_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+};
+
+static const struct of_device_id ws_panel_of_match[] = {
+	{ .compatible = "waveshare,12.3-dsi-touch-a,4lane",
+	  &ws_panel_12_3_inch_a_4lane_desc },
+	{ .compatible = "waveshare,10.1-dsi-touch-a-4lane",
+	  &ws_panel_10_1_inch_a_4lane_desc },
+	{ .compatible = "waveshare,10.1-dsi-touch-a",
+	  &ws_panel_10_1_inch_a_desc },
+	{ .compatible = "waveshare,10.1-dsi-touch-b,4lane",
+	  &ws_panel_10_1_inch_b_4lane_desc },
+	{ .compatible = "waveshare,10.1-dsi-touch-b",
+	  &ws_panel_10_1_inch_b_desc },
+	{ .compatible = "waveshare,9.0-dsi-touch-b,4lane",
+	  &ws_panel_9_inch_b_4lane_desc },
+	{ .compatible = "waveshare,9.0-dsi-touch-b",
+	  &ws_panel_9_inch_b_desc },
+	{ .compatible = "waveshare,8.8-dsi-touch-a",
+	  &ws_panel_8_8_inch_a_desc },
+	{ .compatible = "waveshare,8.0-dsi-touch-a-4lane",
+	  &ws_panel_8_inch_a_4lane_desc },
+	{ .compatible = "waveshare,8.0-dsi-touch-a", &ws_panel_8_inch_a_desc },
+	{ .compatible = "waveshare,7.0-dsi-touch-a", &ws_panel_7_inch_a_desc },
+	{ .compatible = "waveshare,7.0-dsi-touch-b", &ws_panel_7_inch_a_desc },
+	{ .compatible = "waveshare,5.5-dsi-touch-a",
+	  &ws_panel_5_5_inch_a_desc },
+	{ .compatible = "waveshare,5.0-dsi-touch-a", &ws_panel_5_inch_a_desc },
+	{ .compatible = "waveshare,4.0-dsi-touch-c", &ws_panel_4_inch_c_desc },
+	{ .compatible = "waveshare,3.4-dsi-touch-c",
+		&ws_panel_3_4_inch_c_desc },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ws_panel_of_match);
+
+static struct mipi_dsi_driver ws_panel_dsi_driver = {
+	.probe		= ws_panel_dsi_probe,
+	.remove		= ws_panel_dsi_remove,
+	.shutdown	= ws_panel_dsi_shutdown,
+	.driver = {
+		.name		= "waveshare-dsi",
+		.of_match_table	= ws_panel_of_match,
+	},
+};
+module_mipi_dsi_driver(ws_panel_dsi_driver);
+
+MODULE_AUTHOR("Waveshare Team <support@waveshare.com>");
+MODULE_DESCRIPTION("Waveshare DSI panel driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

