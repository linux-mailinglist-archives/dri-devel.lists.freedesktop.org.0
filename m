Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 468F29275EE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 14:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2642F10EAB8;
	Thu,  4 Jul 2024 12:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arri.de header.i=@arri.de header.b="JGubVhPy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03hn2233.outbound.protection.outlook.com [52.100.14.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03A010EAB8
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 12:27:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eexpjCmnznbaOvL9PZkYwIN30dJIyBM35gGrJQRHcX6J5+Rwi+6RJA0U2bqao3+4pJTlY+FtWTSB6mgHQiZOGlbNBloaXlByL8bStXM1Ob03I5MHyNfEEu016kU/kQIKX6RwBWOYlwlLGPqUPRjGmI/KSrlBY6Kqc7PNnTJH8XeuD4dtX4hRMd2oxhugiouvkM6ybdO7L7RCS7STCKZ9rkzUpCzMRcmjw7rXQ9XwpAbo2QRVHQEZooQJuLNeRUYXgbgvZ+7P+kzu4D5BqkEQtXZJGoNaYFE/DjCMXLUT5usdtXkunWe0rypO6V40quXmprmRY8UigSN/ECO0kysMpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeUGYAqAc589YKBG9jO3O+XEEZ3XCcAxJf90M/Ew8S8=;
 b=EEEyBCKcHPCqz+B6cAesY8OQg8qALeOaT+AJZnTGVpc5C399hAhqgXASQBMYd1SX7vbrsR+HnHXRva1RjS4HMwA9+d3GKHjdd+Ifut/aiQLVjXmUScxYvPjFEUhpt0AT6Nvkvi4Nax/Dj4biIjo/hT0wjIqyc+SF2PVLQH1A5y0QFnDxh82ZR24Gi70qU4d8saCAdHsFsQ9y0ugdh5Ds4Wu0VzjaQTmsJqNqr+mGMY7TALoEwcoxURqo/RoI0apMkvXPrz11sJYB8GEuwSACzViynM552/+9elqtrIR6Q7MaQnyIl7sKeoNImRIIJfcU7lbczRlT/Tn1s4EEfkFl0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QeUGYAqAc589YKBG9jO3O+XEEZ3XCcAxJf90M/Ew8S8=;
 b=JGubVhPyO62V4I7XTF54VGSwGd3dEUUjZWKJHRWEAms8EbPVF481hKVviB+dbsIVSEqXqfWW3BZD4jzQteJ7I20YhwKG/kiVefSx+qCMzrdqqXdb6dRiQCfQUZsXT0h4owtIbjud/AY482TEJhp2Clj1uI54xAjw7Nak7TgYIt0=
Received: from AS4P251CA0029.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::19)
 by DBBPR07MB7482.eurprd07.prod.outlook.com (2603:10a6:10:1f3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 12:27:01 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::49) by AS4P251CA0029.outlook.office365.com
 (2603:10a6:20b:5d3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29 via Frontend
 Transport; Thu, 4 Jul 2024 12:27:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.18 via Frontend Transport; Thu, 4 Jul 2024 12:27:00 +0000
Received: from N9W6SW14.arri.de (10.30.4.245) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 4 Jul
 2024 14:26:59 +0200
From: Christian Eggers <ceggers@arri.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: David Lechner <david@lechnology.com>, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?=
 <noralf@tronnes.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <ceggers@gmx.de>, Christian Eggers
 <ceggers@arri.de>
Subject: [RFC PATCH RESEND] drm/tiny: Add support for Sitronix ST7539
Date: Thu, 4 Jul 2024 14:26:42 +0200
Message-ID: <20240704122642.22906-1-ceggers@arri.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.30.4.245]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AB:EE_|DBBPR07MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: 75b256d6-debc-487f-65b4-08dc9c249a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|34020700016|376014|36860700013|7416014|1800799024|82310400026|12100799063;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?djcgNQVRvzmlcktBTc+4Ll4fvmZ/t9Glhg+l373Ryl7MYaHEQALpd1DyYzoR?=
 =?us-ascii?Q?vjlNS7nHS+H14ZoEqRQ3MP1kSGY483kP5KpBRdhmQ4KUSi+ChzQwaw4vd7Tx?=
 =?us-ascii?Q?l6nhQSkhP8ptw5czL90oB7mp5UEApB6NWup8163a3Ch7dfSaCXmc60/xpXWl?=
 =?us-ascii?Q?o8Q0AnPr4fay96bWl2OXsa3zjufGSPih+1iWJWHCP+U7yda2Lqg50H+fzS4T?=
 =?us-ascii?Q?kfPJJa4S+ZlEY8gPHn3LotXRj2SSJW8V69aXgTsCsHYyhhzQ46Hd9X5980HL?=
 =?us-ascii?Q?y6KFO0ABoT6zQwWGNrwTgWiI1oZAvQquDxBe4IJdnPl91ephT4VTmFdcB9h8?=
 =?us-ascii?Q?aj+eO8EMYCud0u02z2KGE2jMkhZbXpnovz3699RddR9ZjMACsPkkrEFZeDw9?=
 =?us-ascii?Q?xuLkYBWznATZZx8dTLr4v5Q9G/YN56mh9YbRhue+2wnvuZ24j/VZzkAtDidc?=
 =?us-ascii?Q?3q/KP40SH9EYDXKe9aCK8ABDi5KsLDS97YURyUq0M4YT/xNCw9dnsBgQeK6E?=
 =?us-ascii?Q?ec5v0gxxgDXStEE2Ht3OwA4atDhZJ5Cd+5zz5aHlONz/UBrkfqDtP0ZIc5vh?=
 =?us-ascii?Q?u6uqLc/8zC/uPC8m8dAEJ5Q5HFFQRc/GXC5oS82sAgvwj3eTCCAqdF0d/Ni6?=
 =?us-ascii?Q?QSoMXwaU2QqNmvTrzPUSko/evdMKnF75gyuteehZ5ofkUA3Ih6VjxQ/lzdtz?=
 =?us-ascii?Q?ATb/DrKHlIQFM8Gt3UTknyLFrrJN0S9cvifZ9RgClRtu8hR6hmZIsdjE92Mr?=
 =?us-ascii?Q?J4USUI+aHRjCbGjzEj9nQzIw8E7dIC38M8ZxqcO6JS507w+agWH2AbKABlHA?=
 =?us-ascii?Q?aJd8F+BS2FsOiyyiYM0b8gKmSUxUAUKJUMoNQzYZJMsz99je1wK68cmsoBV+?=
 =?us-ascii?Q?b4M1krZbu6jKLqarkZ/Hhbb88K7buHftteahYPdhKeF54K/rFJL/AYwIGF3u?=
 =?us-ascii?Q?DrSuAqwwrR/Z85tMkrPyTpIVgIrfODDz5RSxcGj9MEkhkrPa+COX17hELuQ/?=
 =?us-ascii?Q?jxpPNKViEPCAWatmzlIX5Q202EqalLpDBU9TIW0Fznax9t911vqE/EWtRY30?=
 =?us-ascii?Q?8djMMamNKztTUhNvODjukElFbM4dqJcjmSjCfjugq4342DmmbG9IeDwQ4kG/?=
 =?us-ascii?Q?8UzVEKhe+SCYvptVXZh3bP6XBSHm6t1x1iMrlAkdMF8WiUsZf0Z7fu5wFMwQ?=
 =?us-ascii?Q?gP4K5jYWdH68U61DRcYyHC+eTXcNyPnL4bl9jXrpXwTzgZykpOunOMtZKPfT?=
 =?us-ascii?Q?rMl2adlUL2WzaSp+ta/r51H5VIU+L+yiV5K1J3e6sPczIi0U7f0+XdW2+VY6?=
 =?us-ascii?Q?U0OQxIWXFu+9zruP7gvz/fD0YLu1xUT3lJ5iTjJggvk/dplgBOTAPfZhZ0Rf?=
 =?us-ascii?Q?EZBlj1Dq2hqHFOleYITGPZKgVhzq?=
X-Forefront-Antispam-Report: CIP:217.111.95.7; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mta.arri.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(34020700016)(376014)(36860700013)(7416014)(1800799024)(82310400026)(12100799063);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 12:27:00.2391 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b256d6-debc-487f-65b4-08dc9c249a65
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a; Ip=[217.111.95.7];
 Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR07MB7482
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

Resend because the 1st transmission got HTML'ed by my company's mail server.

Based on the existing ST7586 driver. But the ST7539 ...
- is monochrome only
- has 8 VERTICAL pixels per byte
- doesn't support any MIPI DCS commands
- has (a few) 16 bit commands
- doesn't support setting a clipping rect when writing to the RAM
- doesn't support rotation (only mirroring of X and/or Y axis)

Questions/TODO:
- should drivers for such old displays be mainlined?
- shall I use mipi_dbi_ although the display doesn't implement MIPI DCS
  (and has some 16 bit commands)?
- can the conversion to 8 vertical pixels/byte (taken from
  solomon/ssd130x.c) be avoided / simplified / made more efficient?
- how to implement setting of the display contrast (required by my
  application)?
- add device tree binding

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 MAINTAINERS                   |   6 +
 drivers/gpu/drm/tiny/Kconfig  |  11 +
 drivers/gpu/drm/tiny/Makefile |   1 +
 drivers/gpu/drm/tiny/st7539.c | 424 ++++++++++++++++++++++++++++++++++
 4 files changed, 442 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/st7539.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e7d543cf9f6c..7191206c1ae3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7116,6 +7116,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
 
+DRM DRIVER FOR SITRONIX ST7539 PANELS
+M:	Christian Eggers <ceggers@arri.de>
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/tiny/st7539.c
+
 DRM DRIVER FOR SITRONIX ST7586 PANELS
 M:	David Lechner <david@lechnology.com>
 S:	Maintained
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index f6889f649bc1..220d2aee9354 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -186,6 +186,17 @@ config TINYDRM_REPAPER
 
 	  If M is selected the module will be called repaper.
 
+config TINYDRM_ST7539
+	tristate "DRM support for Sitronix ST7539 display panels"
+	depends on DRM && SPI
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
+	select DRM_MIPI_DBI
+	help
+	  DRM driver for Sitronix ST7539 panels.
+
+	  If M is selected the module will be called st7539.
+
 config TINYDRM_ST7586
 	tristate "DRM support for Sitronix ST7586 display panels"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 76dde89a044b..0bd217779995 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -14,5 +14,6 @@ obj-$(CONFIG_TINYDRM_ILI9341)		+= ili9341.o
 obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
 obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
 obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
+obj-$(CONFIG_TINYDRM_ST7539)		+= st7539.o
 obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
 obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o
diff --git a/drivers/gpu/drm/tiny/st7539.c b/drivers/gpu/drm/tiny/st7539.c
new file mode 100644
index 000000000000..9a6aeea006ef
--- /dev/null
+++ b/drivers/gpu/drm/tiny/st7539.c
@@ -0,0 +1,424 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * DRM driver for Sitronix ST7539 panels
+ *
+ * Copyright 2024 Christian Eggers <ceggers@arri.de>
+ *
+ * based on st7586.c
+ * Copyright 2017 David Lechner <david@lechnology.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/spi/spi.h>
+#include <video/mipi_display.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_dma_helper.h>
+#include <drm/drm_fbdev_dma.h>
+#include <drm/drm_format_helper.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_rect.h>
+
+/* controller-specific commands */
+#define ST7539_SET_COLUMN_ADDRESS_LSB(CA) (0x00 | ((CA) & 0x0f))
+#define ST7539_SET_COLUMN_ADDRESS_MSB(CA) (0x10 | (((CA) & 0xff) >> 4))
+#define ST7539_SET_SCROLL_LINE(x)    (0x40 | ((x) & 0x3f))
+#define ST7539_SET_CONTRAST           0x81    /* + 1 byte value */
+#define ST7539_SET_FPS__76            0xA0    /* 76 fps */
+#define ST7539_SET_FPS__95            0xA1    /* 95 fps */
+#define ST7539_SET_FPS__132           0xA2    /* 132 fps */
+#define ST7539_SET_FPS__168           0xA3    /* 168 fps */
+#define ST7539_SET_DISP_NORMAL        0xA6    /* non inverse */
+#define ST7539_SET_DISP_INVERSE       0xA7    /* inverse display */
+#define ST7539_SET_DISP_OFF           0xAE    /* display off and controller power down */
+#define ST7539_SET_DISP_ON            0xAF    /* display on and controller power on */
+#define ST7539_SET_PAGE_ADDRESS(PA)  (0xB0 | ((PA) & 0xf))
+#define ST7539_SET_SCAN_NORMAL        0xC0    /* MX=0, MY=0 */
+#define ST7539_SET_SCAN_X_INV         0xC2    /* MX=1, MY=0 */
+#define ST7539_SET_SCAN_Y_INV         0xC4    /* MX=0, MY=1 */
+#define ST7539_SET_SCAN_XY_INV        0xC6    /* MX=1, MY=1 */
+#define ST7539_SOFT_RESET             0xE2
+#define ST7539_NOP                    0xE3
+#define ST7539_SET_BIAS__1_6          0xE8    /* 1/6 */
+#define ST7539_SET_BIAS__1_7          0xE9    /* 1/7 */
+#define ST7539_SET_BIAS__1_8          0xEA    /* 1/8 */
+#define ST7539_SET_BIAS__1_9          0xEB    /* 1/9 */
+
+#define ST7539_HOR_RES 192
+#define ST7539_VER_RES 64
+
+/* slightly modified version of from mipi_dbi_typec3_command() */
+static int st7539_dbi_command_buf(struct mipi_dbi *dbi,
+				   u8 *cmd, size_t cmd_len,
+				   u8 *par, size_t num)
+{
+	struct spi_device *spi = dbi->spi;
+	u32 speed_hz;
+	int ret = 0;
+
+	spi_bus_lock(spi->controller);
+	gpiod_set_value_cansleep(dbi->dc, 0);
+	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, cmd_len);
+	ret = mipi_dbi_spi_transfer(spi, speed_hz, 8, cmd, cmd_len);
+	spi_bus_unlock(spi->controller);
+	if (ret || !num)
+		return ret;
+
+	spi_bus_lock(spi->controller);
+	gpiod_set_value_cansleep(dbi->dc, 1);
+	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, num);
+	ret = mipi_dbi_spi_transfer(spi, speed_hz, 8, par, num);
+	spi_bus_unlock(spi->controller);
+
+	return ret;
+}
+
+/**
+ * st7539_dbi_command16 - Command with 2 bytes
+ * @dbi: MIPI DBI structure
+ * @cmd: Array of two command bytes
+ *
+ * Returns:
+ * Zero on success, negative error code on failure.
+ */
+static int st7539_dbi_command16(struct mipi_dbi *dbi, const u8 *cmd)
+{
+	u8 *cmdbuf;
+	int ret;
+
+	/* SPI requires dma-safe buffers */
+	cmdbuf = kmemdup(cmd, 2, GFP_KERNEL);
+	if (!cmdbuf)
+		return -ENOMEM;
+
+	mutex_lock(&dbi->cmdlock);
+	ret = st7539_dbi_command_buf(dbi, cmdbuf, 2, NULL, 0);
+	mutex_unlock(&dbi->cmdlock);
+
+	kfree(cmdbuf);
+
+	return ret;
+}
+
+static int st7539_dbi_typec3_command(struct mipi_dbi *dbi,
+				   u8 *cmd, u8 *par, size_t num)
+{
+	return st7539_dbi_command_buf(dbi, cmd, 1, par, num);
+}
+
+/*
+ * The ST7539 controller packs 8 VERTICAL pixels into one byte
+ * (similar as "page_address_mode" for SH1106 in drm/solomon/ssd130x.c).
+ */
+
+static void st7539_xrgb8888_to_mono(u8 *dst, struct iosys_map *src,
+				       struct drm_framebuffer *fb,
+				       struct drm_rect *clip,
+				       struct drm_format_conv_state *fmtcnv_state)
+{
+	u8 *buf;
+	struct iosys_map dst_map;
+
+	unsigned int width = drm_rect_width(clip);
+	unsigned int height = drm_rect_height(clip);
+	unsigned int line_length = DIV_ROUND_UP(width, 8);
+	unsigned int page_height = 8;
+	unsigned int pages = DIV_ROUND_UP(height, page_height);
+	size_t len = pages * width;
+	u32 array_idx = 0;
+	int i, j, k;
+
+	/* intermediate buffer (8 horizontal pixels per byte) */
+	buf = kmalloc(len, GFP_KERNEL);
+	if (!buf)
+		return;
+
+	iosys_map_set_vaddr(&dst_map, buf);
+	drm_fb_xrgb8888_to_mono(&dst_map, NULL, src, fb, clip, fmtcnv_state);
+
+	/* convert to 8 VERTICAL pixels per byte */
+	for (i = 0; i < pages; i++) {
+		for (j = 0; j < width; j++) {
+			u8 data = 0;
+
+			for (k = 0; k < 8; k++) {
+				u8 byte = buf[(8 * i + k) * line_length + j / 8];
+				u8 bit = !((byte >> (j % 8)) & 1);  /* invert pixels */
+
+				data |= bit << k;
+			}
+			dst[array_idx++] = data;
+		}
+	}
+
+	kfree(buf);
+}
+
+static int st7539_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *fb,
+			   struct drm_rect *clip, struct drm_format_conv_state *fmtcnv_state)
+{
+	int ret;
+
+	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret)
+		return ret;
+
+	st7539_xrgb8888_to_mono(dst, src, fb, clip, fmtcnv_state);
+
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+
+	return 0;
+}
+
+static void st7539_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
+			    struct drm_rect *rect, struct drm_format_conv_state *fmtcnv_state)
+{
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
+	struct mipi_dbi *dbi = &dbidev->dbi;
+	int start, end, ret = 0;
+
+	/* hardware doesn't support clipping of the column --> send full lines */
+	rect->x1 = 0;
+	rect->x2 = ST7539_HOR_RES;
+	/* 8 pixels per byte, so grow clip to nearest multiple of 8 */
+	rect->y1 = rounddown(rect->y1, 8);
+	rect->y2 = roundup(rect->y2, 8);
+
+	DRM_DEBUG_KMS("Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
+
+	ret = st7539_buf_copy(dbidev->tx_buf, src, fb, rect, fmtcnv_state);
+	if (ret)
+		goto err_msg;
+
+	/* Pixels are packed 8 per byte */
+	start = rect->y1 / 8;
+	end = rect->y2 / 8;
+
+	mipi_dbi_command(dbi, ST7539_SET_COLUMN_ADDRESS_LSB(rect->x1 & 0xFF));
+	mipi_dbi_command(dbi, ST7539_SET_COLUMN_ADDRESS_MSB((rect->x1 >> 8) & 0xFF));
+
+	ret = mipi_dbi_command_buf(dbi, ST7539_SET_PAGE_ADDRESS(start),
+				   (u8 *)dbidev->tx_buf,
+				   (rect->x2 - rect->x1) * (end - start));
+err_msg:
+	if (ret)
+		dev_err_once(fb->dev->dev, "Failed to update display %d\n", ret);
+}
+
+static void st7539_pipe_update(struct drm_simple_display_pipe *pipe,
+			       struct drm_plane_state *old_state)
+{
+	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
+	struct drm_framebuffer *fb = state->fb;
+	struct drm_rect rect;
+	int idx;
+
+	if (!pipe->crtc.state->active)
+		return;
+
+	if (!drm_dev_enter(fb->dev, &idx))
+		return;
+
+	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
+		st7539_fb_dirty(&shadow_plane_state->data[0], fb, &rect,
+				&shadow_plane_state->fmtcnv_state);
+
+	drm_dev_exit(idx);
+}
+
+static void st7539_pipe_enable(struct drm_simple_display_pipe *pipe,
+			       struct drm_crtc_state *crtc_state,
+			       struct drm_plane_state *plane_state)
+{
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct mipi_dbi *dbi = &dbidev->dbi;
+	struct drm_rect rect = {
+		.x1 = 0,
+		.x2 = fb->width,
+		.y1 = 0,
+		.y2 = fb->height,
+	};
+	int idx;
+
+	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+		return;
+
+	DRM_DEBUG_KMS("\n");
+
+	/* Cannot use mipi_dbi_poweron_reset() here as the ST7539 has a non DCI
+	 * opcode for soft reset
+	 */
+	mipi_dbi_hw_reset(dbi);
+
+	mipi_dbi_command(dbi, ST7539_SOFT_RESET);
+	mipi_dbi_command(dbi, ST7539_SET_FPS__76);
+	mipi_dbi_command(dbi, ST7539_SET_BIAS__1_9);
+	st7539_dbi_command16(dbi, (u8[]){ST7539_SET_CONTRAST, 120});
+	mipi_dbi_command(dbi, ST7539_SET_SCAN_Y_INV);  /* ToDo: make this configurable */
+
+	st7539_fb_dirty(&shadow_plane_state->data[0], fb, &rect,
+			&shadow_plane_state->fmtcnv_state);
+
+	mipi_dbi_command(dbi, ST7539_SET_DISP_ON);
+}
+
+static void st7539_pipe_disable(struct drm_simple_display_pipe *pipe)
+{
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+
+	/*
+	 * This callback is not protected by drm_dev_enter/exit since we want to
+	 * turn off the display on regular driver unload. It's highly unlikely
+	 * that the underlying SPI controller is gone should this be called after
+	 * unplug.
+	 */
+
+	DRM_DEBUG_KMS("\n");
+
+	mipi_dbi_command(&dbidev->dbi, MIPI_DCS_SET_DISPLAY_OFF);
+}
+
+static const u32 st7539_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+static const struct drm_simple_display_pipe_funcs st7539_pipe_funcs = {
+	.mode_valid	= mipi_dbi_pipe_mode_valid,
+	.enable		= st7539_pipe_enable,
+	.disable	= st7539_pipe_disable,
+	.update		= st7539_pipe_update,
+	.begin_fb_access = mipi_dbi_pipe_begin_fb_access,
+	.end_fb_access	= mipi_dbi_pipe_end_fb_access,
+	.reset_plane	= mipi_dbi_pipe_reset_plane,
+	.duplicate_plane_state = mipi_dbi_pipe_duplicate_plane_state,
+	.destroy_plane_state = mipi_dbi_pipe_destroy_plane_state,
+};
+
+static const struct drm_display_mode st7539_mode = {
+	DRM_SIMPLE_MODE(ST7539_HOR_RES, ST7539_VER_RES, 57, 23),
+};
+
+DEFINE_DRM_GEM_DMA_FOPS(st7539_fops);
+
+static const struct drm_driver st7539_driver = {
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops			= &st7539_fops,
+	DRM_GEM_DMA_DRIVER_OPS_VMAP,
+	.debugfs_init		= mipi_dbi_debugfs_init,
+	.name			= "st7539",
+	.desc			= "Sitronix ST7539",
+	.date			= "20240624",
+	.major			= 1,
+	.minor			= 0,
+};
+
+static const struct of_device_id st7539_of_match[] = {
+	{ .compatible = "sitronix,st7539" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, st7539_of_match);
+
+static const struct spi_device_id st7539_id[] = {
+	{ "st7539", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, st7539_id);
+
+static int st7539_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct mipi_dbi_dev *dbidev;
+	struct drm_device *drm;
+	struct mipi_dbi *dbi;
+	struct gpio_desc *a0;
+	size_t bufsize;
+	int ret;
+
+	dbidev = devm_drm_dev_alloc(dev, &st7539_driver,
+				    struct mipi_dbi_dev, drm);
+	if (IS_ERR(dbidev))
+		return PTR_ERR(dbidev);
+
+	dbi = &dbidev->dbi;
+	drm = &dbidev->drm;
+
+	bufsize = DIV_ROUND_UP(st7539_mode.vdisplay, 8) * st7539_mode.hdisplay;
+
+	dbi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(dbi->reset))
+		return dev_err_probe(dev, PTR_ERR(dbi->reset), "Failed to get GPIO 'reset'\n");
+
+	a0 = devm_gpiod_get(dev, "a0", GPIOD_OUT_LOW);
+	if (IS_ERR(a0))
+		return dev_err_probe(dev, PTR_ERR(a0), "Failed to get GPIO 'a0'\n");
+
+	ret = mipi_dbi_spi_init(spi, dbi, a0);
+	if (ret)
+		return ret;
+
+	/* override the command function set in mipi_dbi_spi_init() */
+	dbi->command = st7539_dbi_typec3_command;
+
+	/* Cannot read from this controller via SPI */
+	dbi->read_commands = NULL;
+
+	ret = mipi_dbi_dev_init_with_formats(dbidev, &st7539_pipe_funcs,
+					     st7539_formats, ARRAY_SIZE(st7539_formats),
+					     &st7539_mode, 0, bufsize);
+	if (ret)
+		return ret;
+
+	drm_mode_config_reset(drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		return ret;
+
+	spi_set_drvdata(spi, drm);
+
+	drm_fbdev_dma_setup(drm, 0);
+
+	return 0;
+}
+
+static void st7539_remove(struct spi_device *spi)
+{
+	struct drm_device *drm = spi_get_drvdata(spi);
+
+	drm_dev_unplug(drm);
+	drm_atomic_helper_shutdown(drm);
+}
+
+static void st7539_shutdown(struct spi_device *spi)
+{
+	drm_atomic_helper_shutdown(spi_get_drvdata(spi));
+}
+
+static struct spi_driver st7539_spi_driver = {
+	.driver = {
+		.name = "st7539",
+		.of_match_table = st7539_of_match,
+	},
+	.id_table = st7539_id,
+	.probe = st7539_probe,
+	.remove = st7539_remove,
+	.shutdown = st7539_shutdown,
+};
+module_spi_driver(st7539_spi_driver);
+
+MODULE_DESCRIPTION("Sitronix ST7539 DRM driver");
+MODULE_AUTHOR("Christian Eggers <ceggers@arri.de>");
+MODULE_LICENSE("GPL");
-- 
2.43.0

