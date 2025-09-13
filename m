Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3CEB562AF
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 21:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C5310E0C5;
	Sat, 13 Sep 2025 19:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P4/wGjep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272E310E0C5
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Sep 2025 19:19:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CEB0344F9B;
 Sat, 13 Sep 2025 19:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94EB7C4CEFB;
 Sat, 13 Sep 2025 19:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757791191;
 bh=68qw43AJQzlD513oO+j/AbM2rUINiFLlslGggFKp8xY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=P4/wGjep60rCSXK8H/J7hBaFeNVH/s/NTxou1w01S1od7T2Yuxmpq9DXCDPEfrKlw
 kjmfUlSiZzdhodugyp5OwJpmnYW3LXLgxNW6Bm5Z6n/1BiDgy7/xDE2JvEoNNhMqfz
 Nmh3WT748OS0eacNtdG6Y1XlSrDRccQfrEWAX655BfJwp+EFKtM6cYEKG1gIppCMo3
 A+2aml78mUv/pWJcMQUHEUf2GcRP4KBcSC+7YUf4f4Zdv4Hb21uDVug1LP/jFwc2+0
 Pt/3GnblfeG6AQke4yC9l2Rm9GAg1F2u4tGYYJMFC3Zw3S87y7F85eNmrsi/Wa9S83
 UFTCplLtwPFUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 8A341CAC587;
 Sat, 13 Sep 2025 19:19:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 13 Sep 2025 21:19:48 +0200
Subject: [PATCH v6 2/3] drm: panel: nt36672a: Add support for novatek
 nt35596s panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-nt35596s-v6-2-b5deb05e04af@ixit.cz>
References: <20250913-nt35596s-v6-0-b5deb05e04af@ixit.cz>
In-Reply-To: <20250913-nt35596s-v6-0-b5deb05e04af@ixit.cz>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Molly Sophia <mollysophia379@gmail.com>, 
 Arnaud Ferraris <arnaud.ferraris@collabora.com>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10371; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=j3PCObGJSVW2oB63WGDlOgJWuhYG0NWr/z6v3GHZ1/E=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBoxcPWN7CVdvMB7k67qfNaP0KyT7VfdY1JLHKQf
 sR6fq/GpWqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaMXD1gAKCRBgAj/E00kg
 crvED/0dqAaaPQ0YcGik9l9+NnouQr1RpWV95zWl+Sosre7TCekGyMzttRKIgkEO0kfNnCROG4m
 ExfD4AELHndHtrFtbZfS8ZNwtJCp71LDiscAtha/3kD/au/VVx+JCxVTc1SpOO3kppJdWMBzaAz
 u0xANFdyTTSDfN3vKYbHipHd5pKv8cfVGTX+sTJmQI3k2KN8AjqrHvdQJUZuJAL0WrbjgEBhBKu
 bKrlrp3EiT9x+puYIl2R0SLEhcB75ANIhpjq8U+9YUYJ8Vu/d2ej0NvEbblv5sqt/GXY9r1GiOJ
 hIjHoVuYbv9AEDlVTJBF5XuYFFdYu8gXpVenzKuKLlIzLyF9oEaCIeOkOcOqrJrWd5qMrqGA7I/
 Bl3dQQXeWh4PAsd/RV+5D+eP3j+4HFvNBOgV2xPBQZ/CQ56FUy9HOw8UKaKx3ajYFPMBeEjkIkw
 QPMC+YkpqMtwDJ3mSyDV6lOvq+Y7tGC4eNKNKJFTpk/sVpVsTY5IAJQ2QD/CgqI29HoGhPH9B47
 YQjMwHSrDi/vR0fEDn1wOZ6Hh7iNTA1RIOkD6ygI8KJ99DUM0B1gp/35XFOjOhMVn5blVGPw7qG
 OKdkz1Hb2Gj/cN3FMrliuQH73IF91BOwHlSbtCtOkJr5WHXEDnYx+sOTmhQJJpwcHrx5eM0jgEp
 ouofuOVyO0GXhWQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Molly Sophia <mollysophia379@gmail.com>

Novatek NT35596s is a generic DSI IC that drives command and video mode
panels.
Currently add support for the LCD panel from JDI connected with this IC,
as found on Xiaomi Mi Mix 2S phones.

Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/Kconfig                  |   7 +-
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 225 ++++++++++++++++++++++++-
 2 files changed, 222 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 407c5f6a268b2ec66e5d0eddae26b3368e4cb2cb..dd2ea9f87292a5a99ae91b14b3f0d197c4db944f 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -521,14 +521,15 @@ config DRM_PANEL_NOVATEK_NT36523
 	  Boe panels used in Xiaomi Mi Pad 5 and 5 Pro tablets.
 
 config DRM_PANEL_NOVATEK_NT36672A
-	tristate "Novatek NT36672A DSI panel"
+	tristate "Novatek NT36672A/NT35596S DSI panel"
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  Say Y here if you want to enable support for the panels built
-	  around the Novatek NT36672A display controller, such as some
-	  Tianma panels used in a few Xiaomi Poco F1 mobile phones.
+	  around the Novatek NT36672A or NT35596S display controller, such
+	  as some Tianma panels used in a few Xiaomi Poco F1 mobile phones
+	  or the JDI panels used in Xiaomi Mi Mix2S mobile phones.
 
 config DRM_PANEL_NOVATEK_NT36672E
 	tristate "Novatek NT36672E DSI panel"
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index f7518ec469176a4e2d4f2b03f8e77f03511a12a7..a0271ca5feeb125a9d57b3b1ac47a7933cf06226 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -3,13 +3,16 @@
  * Copyright (C) 2020 Linaro Ltd
  * Author: Sumit Semwal <sumit.semwal@linaro.org>
  *
- * This driver is for the DSI interface to panels using the NT36672A display driver IC
- * from Novatek.
- * Currently supported are the Tianma FHD+ panels found in some Xiaomi phones, including
- * some variants of the Poco F1 phone.
+ * Copyright (C) 2022 Molly Sophia <mollysophia379@gmail.com>
  *
- * Panels using the Novatek NT37762A IC should add appropriate configuration per-panel and
- * use this driver.
+ * This driver is for the DSI interface to panels using the NT36672A/NT35596S
+ * display driver IC from Novatek.
+ * Currently supported are the Tianma FHD+ panels found in some Xiaomi phones,
+ * including some variants of the Poco F1 phone, and the JDI FHD+ panels found
+ * in Xiaomi Mi Mix 2S phones.
+ *
+ * Panels using the Novatek NT37762A or NT35596S IC should add appropriate
+ * configuration per-panel and use this driver.
  */
 
 #include <linux/delay.h>
@@ -591,6 +594,212 @@ static const struct nt36672a_panel_desc tianma_fhd_video_panel_desc = {
 	.num_off_cmds = ARRAY_SIZE(tianma_fhd_video_off_cmds),
 };
 
+static const struct nt36672a_panel_cmd jdi_nt35596s_video_on_cmds[] = {
+	{ .data = { 0xff, 0x24 } },
+	{ .data = { 0x9d, 0x34 } },
+	{ .data = { 0xfb, 0x01 } },
+	{ .data = { 0xc4, 0x25 } },
+	{ .data = { 0xd1, 0x08 } },
+	{ .data = { 0xd2, 0x84 } },
+	{ .data = { 0xff, 0x26 } },
+	{ .data = { 0xfb, 0x01 } },
+	{ .data = { 0x03, 0x1c } },
+	{ .data = { 0x3b, 0x08 } },
+	{ .data = { 0x6b, 0x08 } },
+	{ .data = { 0x97, 0x08 } },
+	{ .data = { 0xc5, 0x08 } },
+	{ .data = { 0xfb, 0x01 } },
+	{ .data = { 0xff, 0x23 } },
+	{ .data = { 0xfb, 0x01 } },
+	{ .data = { 0x01, 0x84 } },
+	{ .data = { 0x05, 0x2d } },
+	{ .data = { 0x06, 0x00 } },
+	{ .data = { 0x33, 0x07 } },
+	{ .data = { 0x21, 0xee } },
+	{ .data = { 0x22, 0xed } },
+	{ .data = { 0x23, 0xea } },
+	{ .data = { 0x24, 0xe8 } },
+	{ .data = { 0x25, 0xe5 } },
+	{ .data = { 0x26, 0xe2 } },
+	{ .data = { 0x27, 0xde } },
+	{ .data = { 0x28, 0xbb } },
+	{ .data = { 0x29, 0x87 } },
+	{ .data = { 0x2a, 0x77 } },
+	{ .data = { 0x32, 0x0c } },
+	{ .data = { 0x13, 0x3f } },
+	{ .data = { 0x14, 0x34 } },
+	{ .data = { 0x15, 0x2a } },
+	{ .data = { 0x16, 0x25 } },
+	{ .data = { 0x17, 0x9d } },
+	{ .data = { 0x18, 0x9a } },
+	{ .data = { 0x19, 0x97 } },
+	{ .data = { 0x1a, 0x94 } },
+	{ .data = { 0x1b, 0x91 } },
+	{ .data = { 0x1c, 0x8e } },
+	{ .data = { 0x1d, 0x8b } },
+	{ .data = { 0x1e, 0x89 } },
+	{ .data = { 0x1f, 0x86 } },
+	{ .data = { 0x20, 0x83 } },
+	{ .data = { 0xff, 0x22 } },
+	{ .data = { 0x00, 0x0a } },
+	{ .data = { 0x01, 0x43 } },
+	{ .data = { 0x02, 0x5b } },
+	{ .data = { 0x03, 0x6a } },
+	{ .data = { 0x04, 0x7a } },
+	{ .data = { 0x05, 0x82 } },
+	{ .data = { 0x06, 0x85 } },
+	{ .data = { 0x07, 0x80 } },
+	{ .data = { 0x08, 0x7c } },
+	{ .data = { 0x09, 0x7c } },
+	{ .data = { 0x0a, 0x74 } },
+	{ .data = { 0x0b, 0x71 } },
+	{ .data = { 0x0c, 0x6e } },
+	{ .data = { 0x0d, 0x68 } },
+	{ .data = { 0x0e, 0x65 } },
+	{ .data = { 0x0f, 0x5c } },
+	{ .data = { 0x10, 0x32 } },
+	{ .data = { 0x11, 0x18 } },
+	{ .data = { 0x12, 0x00 } },
+	{ .data = { 0x13, 0x00 } },
+	{ .data = { 0x1a, 0x00 } },
+	{ .data = { 0x1b, 0x00 } },
+	{ .data = { 0x1c, 0x00 } },
+	{ .data = { 0x1d, 0x00 } },
+	{ .data = { 0x1e, 0x00 } },
+	{ .data = { 0x1f, 0x00 } },
+	{ .data = { 0x20, 0x00 } },
+	{ .data = { 0x21, 0x00 } },
+	{ .data = { 0x22, 0x00 } },
+	{ .data = { 0x23, 0x00 } },
+	{ .data = { 0x24, 0x00 } },
+	{ .data = { 0x25, 0x00 } },
+	{ .data = { 0x26, 0x00 } },
+	{ .data = { 0x27, 0x00 } },
+	{ .data = { 0x28, 0x00 } },
+	{ .data = { 0x29, 0x00 } },
+	{ .data = { 0x2a, 0x00 } },
+	{ .data = { 0x2b, 0x00 } },
+	{ .data = { 0x2f, 0x00 } },
+	{ .data = { 0x30, 0x00 } },
+	{ .data = { 0x31, 0x00 } },
+	{ .data = { 0x32, 0x0c } },
+	{ .data = { 0x33, 0x0c } },
+	{ .data = { 0x34, 0x0c } },
+	{ .data = { 0x35, 0x0b } },
+	{ .data = { 0x36, 0x09 } },
+	{ .data = { 0x37, 0x09 } },
+	{ .data = { 0x38, 0x08 } },
+	{ .data = { 0x39, 0x05 } },
+	{ .data = { 0x3a, 0x03 } },
+	{ .data = { 0x3b, 0x00 } },
+	{ .data = { 0x3f, 0x00 } },
+	{ .data = { 0x40, 0x00 } },
+	{ .data = { 0x41, 0x00 } },
+	{ .data = { 0x42, 0x00 } },
+	{ .data = { 0x43, 0x00 } },
+	{ .data = { 0x44, 0x00 } },
+	{ .data = { 0x45, 0x00 } },
+	{ .data = { 0x46, 0x00 } },
+	{ .data = { 0x47, 0x00 } },
+	{ .data = { 0x48, 0x00 } },
+	{ .data = { 0x49, 0x03 } },
+	{ .data = { 0x4a, 0x06 } },
+	{ .data = { 0x4b, 0x07 } },
+	{ .data = { 0x4c, 0x07 } },
+	{ .data = { 0x53, 0x01 } },
+	{ .data = { 0x54, 0x01 } },
+	{ .data = { 0x55, 0x89 } },
+	{ .data = { 0x56, 0x00 } },
+	{ .data = { 0x58, 0x00 } },
+	{ .data = { 0x68, 0x00 } },
+	{ .data = { 0x84, 0xff } },
+	{ .data = { 0x85, 0xff } },
+	{ .data = { 0x86, 0x03 } },
+	{ .data = { 0x87, 0x00 } },
+	{ .data = { 0x88, 0x00 } },
+	{ .data = { 0xa2, 0x20 } },
+	{ .data = { 0xa9, 0x01 } },
+	{ .data = { 0xaa, 0x12 } },
+	{ .data = { 0xab, 0x13 } },
+	{ .data = { 0xac, 0x0a } },
+	{ .data = { 0xad, 0x74 } },
+	{ .data = { 0xaf, 0x33 } },
+	{ .data = { 0xb0, 0x03 } },
+	{ .data = { 0xb1, 0x14 } },
+	{ .data = { 0xb2, 0x42 } },
+	{ .data = { 0xb3, 0x40 } },
+	{ .data = { 0xb4, 0xa5 } },
+	{ .data = { 0xb6, 0x44 } },
+	{ .data = { 0xb7, 0x04 } },
+	{ .data = { 0xb8, 0x14 } },
+	{ .data = { 0xb9, 0x42 } },
+	{ .data = { 0xba, 0x40 } },
+	{ .data = { 0xbb, 0xa5 } },
+	{ .data = { 0xbd, 0x44 } },
+	{ .data = { 0xbe, 0x04 } },
+	{ .data = { 0xbf, 0x00 } },
+	{ .data = { 0xc0, 0x75 } },
+	{ .data = { 0xc1, 0x6a } },
+	{ .data = { 0xc2, 0xa5 } },
+	{ .data = { 0xc4, 0x22 } },
+	{ .data = { 0xc5, 0x02 } },
+	{ .data = { 0xc6, 0x00 } },
+	{ .data = { 0xc7, 0x95 } },
+	{ .data = { 0xc8, 0x8a } },
+	{ .data = { 0xc9, 0xa5 } },
+	{ .data = { 0xcb, 0x22 } },
+	{ .data = { 0xcc, 0x02 } },
+	{ .data = { 0xcd, 0x00 } },
+	{ .data = { 0xce, 0xb5 } },
+	{ .data = { 0xcf, 0xaa } },
+	{ .data = { 0xd0, 0xa5 } },
+	{ .data = { 0xd2, 0x22 } },
+	{ .data = { 0xd3, 0x02 } },
+	{ .data = { 0xfb, 0x01 } },
+	{ .data = { 0xff, 0x10 } },
+	{ .data = { 0x26, 0x02 } },
+	{ .data = { 0x35, 0x00 } },
+	{ .data = { 0x51, 0xff } },
+	{ .data = { 0x53, 0x24 } },
+	{ .data = { 0x55, 0x00 } },
+	{ .data = { 0xb0, 0x00 } },
+};
+
+static const struct drm_display_mode jdi_nt35596s_video_panel_mode = {
+	.clock = (1080 + 16 + 28 + 40) * (2160 + 7 + 4 + 24) * 60 / 1000,
+
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 16,
+	.hsync_end = 1080 + 16 + 28,
+	.htotal = 1080 + 16 + 28 + 40,
+
+	.vdisplay = 2160,
+	.vsync_start = 2160 + 7,
+	.vsync_end = 2160 + 7 + 4,
+	.vtotal = 2160 + 7 + 4 + 24,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct nt36672a_panel_desc jdi_nt35596s_video_panel_desc = {
+	.display_mode = &jdi_nt35596s_video_panel_mode,
+
+	.width_mm = 68,
+	.height_mm = 136,
+
+	.mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_CLOCK_NON_CONTINUOUS |
+		      MIPI_DSI_MODE_VIDEO_BURST,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 4,
+	.on_cmds_1 = jdi_nt35596s_video_on_cmds,
+	.num_on_cmds_1 = ARRAY_SIZE(jdi_nt35596s_video_on_cmds),
+	.on_cmds_2 = NULL,
+	.num_on_cmds_2 = 0,
+	.off_cmds = NULL,
+	.num_off_cmds = 0,
+};
+
 static int nt36672a_panel_add(struct nt36672a_panel *pinfo)
 {
 	struct device *dev = &pinfo->link->dev;
@@ -668,6 +877,7 @@ static void nt36672a_panel_remove(struct mipi_dsi_device *dsi)
 
 static const struct of_device_id tianma_fhd_video_of_match[] = {
 	{ .compatible = "tianma,fhd-video", .data = &tianma_fhd_video_panel_desc },
+	{ .compatible = "jdi,fhd-nt35596s", .data = &jdi_nt35596s_video_panel_desc },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tianma_fhd_video_of_match);
@@ -683,5 +893,6 @@ static struct mipi_dsi_driver nt36672a_panel_driver = {
 module_mipi_dsi_driver(nt36672a_panel_driver);
 
 MODULE_AUTHOR("Sumit Semwal <sumit.semwal@linaro.org>");
-MODULE_DESCRIPTION("NOVATEK NT36672A based MIPI-DSI LCD panel driver");
+MODULE_AUTHOR("Molly Sophia <mollysophia379@gmail.com>");
+MODULE_DESCRIPTION("NOVATEK NT36672A/NT35596S based MIPI-DSI LCD panel driver");
 MODULE_LICENSE("GPL");

-- 
2.51.0


