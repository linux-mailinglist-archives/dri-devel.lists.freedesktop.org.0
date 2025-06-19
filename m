Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7790AE0734
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F7B10EA4B;
	Thu, 19 Jun 2025 13:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=plaes.org header.i=@plaes.org header.b="QtfOjsQe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 359 seconds by postgrey-1.36 at gabe;
 Thu, 19 Jun 2025 13:28:23 UTC
Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6E010EA4B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 13:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
 t=1750339336; bh=yKbZMn2LsYDyc/vK8DPPOLXR1hKAwy3r4jBgfeiCnlU=;
 h=From:To:Cc:Subject:Date:From;
 b=QtfOjsQe9mWNQeY3WtOXUdvVV0EtQaEEFk6rE+dWVSXhPID8kVe8Byni5eh/DGleS
 TmxkyjRSarPnvceyo3B3Y1VLPTyZZBnkgav1kUdZ5chX3Eu92YMVHWkiAdosxwmwoQ
 OBz79eEhhQVnLCei5hS7b3vA4FMPbjkM+qT3I5d8vWnve5+LlhBeK7ztbxM7oUAIq0
 hxm01YFIzVEaAWO0oMy092DYy4f27Cz68H77kZYDSEuxAVe8Up42rUTzFhg3H6M6WF
 Y7ImiiCIFXrsINbwHS99efwftg68CR2f6KowR+Y9LqhtqzOJPhnoh+ydgJcZlkPo+n
 h6rpTuaGEeYow==
Received: from localhost (82-131-114-208.ip.elisa.ee [82.131.114.208])
 by mail.plaes.org (Postfix) with ESMTPSA id DE71E40015;
 Thu, 19 Jun 2025 13:22:15 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: John Watts <contact@jookia.org>, Ryan Walklin <ryan@testtoast.com>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: nv3052c: Reduce duplication of init sequences
Date: Thu, 19 Jun 2025 16:22:09 +0300
Message-ID: <20250619132211.556027-1-plaes@plaes.org>
X-Mailer: git-send-email 2.49.0
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

Although there are various small changes between the init
sequences, the second half is common for all 3 currently
supported displays.

Note that this is only compile-tested.

Signed-off-by: Priit Laes <plaes@plaes.org>
---
 .../gpu/drm/panel/panel-newvision-nv3052c.c   | 408 ++++--------------
 1 file changed, 74 insertions(+), 334 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
index 06e16a7c14a7..0d8a367b83fd 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -43,59 +43,12 @@ struct nv3052c {
 	struct gpio_desc *reset_gpio;
 };
 
-static const struct nv3052c_reg ltk035c5444t_panel_regs[] = {
-	// EXTC Command set enable, select page 1
-	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x01 },
-	// Mostly unknown registers
-	{ 0xe3, 0x00 },
-	{ 0x40, 0x00 },
-	{ 0x03, 0x40 },
-	{ 0x04, 0x00 },
-	{ 0x05, 0x03 },
-	{ 0x08, 0x00 },
-	{ 0x09, 0x07 },
-	{ 0x0a, 0x01 },
-	{ 0x0b, 0x32 },
-	{ 0x0c, 0x32 },
-	{ 0x0d, 0x0b },
-	{ 0x0e, 0x00 },
-	{ 0x23, 0xa0 },
-	{ 0x24, 0x0c },
-	{ 0x25, 0x06 },
-	{ 0x26, 0x14 },
-	{ 0x27, 0x14 },
-	{ 0x38, 0xcc }, // VCOM_ADJ1
-	{ 0x39, 0xd7 }, // VCOM_ADJ2
-	{ 0x3a, 0x4a }, // VCOM_ADJ3
-	{ 0x28, 0x40 },
-	{ 0x29, 0x01 },
-	{ 0x2a, 0xdf },
-	{ 0x49, 0x3c },
-	{ 0x91, 0x77 }, // EXTPW_CTRL2
-	{ 0x92, 0x77 }, // EXTPW_CTRL3
-	{ 0xa0, 0x55 },
-	{ 0xa1, 0x50 },
-	{ 0xa4, 0x9c },
-	{ 0xa7, 0x02 },
-	{ 0xa8, 0x01 },
-	{ 0xa9, 0x01 },
-	{ 0xaa, 0xfc },
-	{ 0xab, 0x28 },
-	{ 0xac, 0x06 },
-	{ 0xad, 0x06 },
-	{ 0xae, 0x06 },
-	{ 0xaf, 0x03 },
-	{ 0xb0, 0x08 },
-	{ 0xb1, 0x26 },
-	{ 0xb2, 0x28 },
-	{ 0xb3, 0x28 },
-	{ 0xb4, 0x33 },
-	{ 0xb5, 0x08 },
-	{ 0xb6, 0x26 },
-	{ 0xb7, 0x08 },
-	{ 0xb8, 0x26 },
-	{ 0xf0, 0x00 },
-	{ 0xf6, 0xc0 },
+/*
+ * Common initialization registers for all currently
+ * supported displays. Mostly seem to be related
+ * to Gamma correction curves and output pad mappings.
+ */
+static const struct nv3052c_reg common_init_regs[] = {
 	// EXTC Command set enable, select page 2
 	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x02 },
 	// Set gray scale voltage to adjust gamma
@@ -215,7 +168,7 @@ static const struct nv3052c_reg ltk035c5444t_panel_regs[] = {
 	{ 0xa0, 0x01 }, // PANELU2D33
 	// EXTC Command set enable, select page 2
 	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x02 },
-	// Unknown registers
+	// Page 2 register values (0x01..0x10) are same for nv3051d and nv3052c
 	{ 0x01, 0x01 },
 	{ 0x02, 0xda },
 	{ 0x03, 0xba },
@@ -236,6 +189,62 @@ static const struct nv3052c_reg ltk035c5444t_panel_regs[] = {
 	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x00 },
 	// Display Access Control
 	{ 0x36, 0x0a }, // bgr = 1, ss = 1, gs = 0
+
+};
+
+static const struct nv3052c_reg ltk035c5444t_panel_regs[] = {
+	// EXTC Command set enable, select page 1
+	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x01 },
+	// Mostly unknown registers
+	{ 0xe3, 0x00 },
+	{ 0x40, 0x00 },
+	{ 0x03, 0x40 },
+	{ 0x04, 0x00 },
+	{ 0x05, 0x03 },
+	{ 0x08, 0x00 },
+	{ 0x09, 0x07 },
+	{ 0x0a, 0x01 },
+	{ 0x0b, 0x32 },
+	{ 0x0c, 0x32 },
+	{ 0x0d, 0x0b },
+	{ 0x0e, 0x00 },
+	{ 0x23, 0xa0 },
+	{ 0x24, 0x0c },
+	{ 0x25, 0x06 },
+	{ 0x26, 0x14 },
+	{ 0x27, 0x14 },
+	{ 0x38, 0xcc }, // VCOM_ADJ1
+	{ 0x39, 0xd7 }, // VCOM_ADJ2
+	{ 0x3a, 0x4a }, // VCOM_ADJ3
+	{ 0x28, 0x40 },
+	{ 0x29, 0x01 },
+	{ 0x2a, 0xdf },
+	{ 0x49, 0x3c },
+	{ 0x91, 0x77 }, // EXTPW_CTRL2
+	{ 0x92, 0x77 }, // EXTPW_CTRL3
+	{ 0xa0, 0x55 },
+	{ 0xa1, 0x50 },
+	{ 0xa4, 0x9c },
+	{ 0xa7, 0x02 },
+	{ 0xa8, 0x01 },
+	{ 0xa9, 0x01 },
+	{ 0xaa, 0xfc },
+	{ 0xab, 0x28 },
+	{ 0xac, 0x06 },
+	{ 0xad, 0x06 },
+	{ 0xae, 0x06 },
+	{ 0xaf, 0x03 },
+	{ 0xb0, 0x08 },
+	{ 0xb1, 0x26 },
+	{ 0xb2, 0x28 },
+	{ 0xb3, 0x28 },
+	{ 0xb4, 0x33 },
+	{ 0xb5, 0x08 },
+	{ 0xb6, 0x26 },
+	{ 0xb7, 0x08 },
+	{ 0xb8, 0x26 },
+	{ 0xf0, 0x00 },
+	{ 0xf6, 0xc0 },
 };
 
 static const struct nv3052c_reg fs035vg158_panel_regs[] = {
@@ -291,146 +300,6 @@ static const struct nv3052c_reg fs035vg158_panel_regs[] = {
 	{ 0xb8, 0x26 },
 	{ 0xf0, 0x00 },
 	{ 0xf6, 0xc0 },
-	// EXTC Command set enable, select page 0
-	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x02 },
-	// Set gray scale voltage to adjust gamma
-	{ 0xb0, 0x0b }, // PGAMVR0
-	{ 0xb1, 0x16 }, // PGAMVR1
-	{ 0xb2, 0x17 }, // PGAMVR2
-	{ 0xb3, 0x2c }, // PGAMVR3
-	{ 0xb4, 0x32 }, // PGAMVR4
-	{ 0xb5, 0x3b }, // PGAMVR5
-	{ 0xb6, 0x29 }, // PGAMPR0
-	{ 0xb7, 0x40 }, // PGAMPR1
-	{ 0xb8, 0x0d }, // PGAMPK0
-	{ 0xb9, 0x05 }, // PGAMPK1
-	{ 0xba, 0x12 }, // PGAMPK2
-	{ 0xbb, 0x10 }, // PGAMPK3
-	{ 0xbc, 0x12 }, // PGAMPK4
-	{ 0xbd, 0x15 }, // PGAMPK5
-	{ 0xbe, 0x19 }, // PGAMPK6
-	{ 0xbf, 0x0e }, // PGAMPK7
-	{ 0xc0, 0x16 }, // PGAMPK8
-	{ 0xc1, 0x0a }, // PGAMPK9
-	// Set gray scale voltage to adjust gamma
-	{ 0xd0, 0x0c }, // NGAMVR0
-	{ 0xd1, 0x17 }, // NGAMVR0
-	{ 0xd2, 0x14 }, // NGAMVR1
-	{ 0xd3, 0x2e }, // NGAMVR2
-	{ 0xd4, 0x32 }, // NGAMVR3
-	{ 0xd5, 0x3c }, // NGAMVR4
-	{ 0xd6, 0x22 }, // NGAMPR0
-	{ 0xd7, 0x3d }, // NGAMPR1
-	{ 0xd8, 0x0d }, // NGAMPK0
-	{ 0xd9, 0x07 }, // NGAMPK1
-	{ 0xda, 0x13 }, // NGAMPK2
-	{ 0xdb, 0x13 }, // NGAMPK3
-	{ 0xdc, 0x11 }, // NGAMPK4
-	{ 0xdd, 0x15 }, // NGAMPK5
-	{ 0xde, 0x19 }, // NGAMPK6
-	{ 0xdf, 0x10 }, // NGAMPK7
-	{ 0xe0, 0x17 }, // NGAMPK8
-	{ 0xe1, 0x0a }, // NGAMPK9
-	// EXTC Command set enable, select page 3
-	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x03 },
-	// Set various timing settings
-	{ 0x00, 0x2a }, // GIP_VST_1
-	{ 0x01, 0x2a }, // GIP_VST_2
-	{ 0x02, 0x2a }, // GIP_VST_3
-	{ 0x03, 0x2a }, // GIP_VST_4
-	{ 0x04, 0x61 }, // GIP_VST_5
-	{ 0x05, 0x80 }, // GIP_VST_6
-	{ 0x06, 0xc7 }, // GIP_VST_7
-	{ 0x07, 0x01 }, // GIP_VST_8
-	{ 0x08, 0x03 }, // GIP_VST_9
-	{ 0x09, 0x04 }, // GIP_VST_10
-	{ 0x70, 0x22 }, // GIP_ECLK1
-	{ 0x71, 0x80 }, // GIP_ECLK2
-	{ 0x30, 0x2a }, // GIP_CLK_1
-	{ 0x31, 0x2a }, // GIP_CLK_2
-	{ 0x32, 0x2a }, // GIP_CLK_3
-	{ 0x33, 0x2a }, // GIP_CLK_4
-	{ 0x34, 0x61 }, // GIP_CLK_5
-	{ 0x35, 0xc5 }, // GIP_CLK_6
-	{ 0x36, 0x80 }, // GIP_CLK_7
-	{ 0x37, 0x23 }, // GIP_CLK_8
-	{ 0x40, 0x03 }, // GIP_CLKA_1
-	{ 0x41, 0x04 }, // GIP_CLKA_2
-	{ 0x42, 0x05 }, // GIP_CLKA_3
-	{ 0x43, 0x06 }, // GIP_CLKA_4
-	{ 0x44, 0x11 }, // GIP_CLKA_5
-	{ 0x45, 0xe8 }, // GIP_CLKA_6
-	{ 0x46, 0xe9 }, // GIP_CLKA_7
-	{ 0x47, 0x11 }, // GIP_CLKA_8
-	{ 0x48, 0xea }, // GIP_CLKA_9
-	{ 0x49, 0xeb }, // GIP_CLKA_10
-	{ 0x50, 0x07 }, // GIP_CLKB_1
-	{ 0x51, 0x08 }, // GIP_CLKB_2
-	{ 0x52, 0x09 }, // GIP_CLKB_3
-	{ 0x53, 0x0a }, // GIP_CLKB_4
-	{ 0x54, 0x11 }, // GIP_CLKB_5
-	{ 0x55, 0xec }, // GIP_CLKB_6
-	{ 0x56, 0xed }, // GIP_CLKB_7
-	{ 0x57, 0x11 }, // GIP_CLKB_8
-	{ 0x58, 0xef }, // GIP_CLKB_9
-	{ 0x59, 0xf0 }, // GIP_CLKB_10
-	// Map internal GOA signals to GOA output pad
-	{ 0xb1, 0x01 }, // PANELD2U2
-	{ 0xb4, 0x15 }, // PANELD2U5
-	{ 0xb5, 0x16 }, // PANELD2U6
-	{ 0xb6, 0x09 }, // PANELD2U7
-	{ 0xb7, 0x0f }, // PANELD2U8
-	{ 0xb8, 0x0d }, // PANELD2U9
-	{ 0xb9, 0x0b }, // PANELD2U10
-	{ 0xba, 0x00 }, // PANELD2U11
-	{ 0xc7, 0x02 }, // PANELD2U24
-	{ 0xca, 0x17 }, // PANELD2U27
-	{ 0xcb, 0x18 }, // PANELD2U28
-	{ 0xcc, 0x0a }, // PANELD2U29
-	{ 0xcd, 0x10 }, // PANELD2U30
-	{ 0xce, 0x0e }, // PANELD2U31
-	{ 0xcf, 0x0c }, // PANELD2U32
-	{ 0xd0, 0x00 }, // PANELD2U33
-	// Map internal GOA signals to GOA output pad
-	{ 0x81, 0x00 }, // PANELU2D2
-	{ 0x84, 0x15 }, // PANELU2D5
-	{ 0x85, 0x16 }, // PANELU2D6
-	{ 0x86, 0x10 }, // PANELU2D7
-	{ 0x87, 0x0a }, // PANELU2D8
-	{ 0x88, 0x0c }, // PANELU2D9
-	{ 0x89, 0x0e }, // PANELU2D10
-	{ 0x8a, 0x02 }, // PANELU2D11
-	{ 0x97, 0x00 }, // PANELU2D24
-	{ 0x9a, 0x17 }, // PANELU2D27
-	{ 0x9b, 0x18 }, // PANELU2D28
-	{ 0x9c, 0x0f }, // PANELU2D29
-	{ 0x9d, 0x09 }, // PANELU2D30
-	{ 0x9e, 0x0b }, // PANELU2D31
-	{ 0x9f, 0x0d }, // PANELU2D32
-	{ 0xa0, 0x01 }, // PANELU2D33
-	// EXTC Command set enable, select page 2
-	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x02 },
-	// Unknown registers
-	{ 0x01, 0x01 },
-	{ 0x02, 0xda },
-	{ 0x03, 0xba },
-	{ 0x04, 0xa8 },
-	{ 0x05, 0x9a },
-	{ 0x06, 0x70 },
-	{ 0x07, 0xff },
-	{ 0x08, 0x91 },
-	{ 0x09, 0x90 },
-	{ 0x0a, 0xff },
-	{ 0x0b, 0x8f },
-	{ 0x0c, 0x60 },
-	{ 0x0d, 0x58 },
-	{ 0x0e, 0x48 },
-	{ 0x0f, 0x38 },
-	{ 0x10, 0x2b },
-	// EXTC Command set enable, select page 0
-	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x00 },
-	// Display Access Control
-	{ 0x36, 0x0a }, // bgr = 1, ss = 1, gs = 0
 };
 
 
@@ -487,146 +356,6 @@ static const struct nv3052c_reg wl_355608_a8_panel_regs[] = {
 	{ 0xb8, 0x26 },
 	{ 0xf0, 0x00 },
 	{ 0xf6, 0xc0 },
-	// EXTC Command set enable, select page 2
-	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x02 },
-	// Set gray scale voltage to adjust gamma
-	{ 0xb0, 0x0b }, // PGAMVR0
-	{ 0xb1, 0x16 }, // PGAMVR1
-	{ 0xb2, 0x17 }, // PGAMVR2
-	{ 0xb3, 0x2c }, // PGAMVR3
-	{ 0xb4, 0x32 }, // PGAMVR4
-	{ 0xb5, 0x3b }, // PGAMVR5
-	{ 0xb6, 0x29 }, // PGAMPR0
-	{ 0xb7, 0x40 }, // PGAMPR1
-	{ 0xb8, 0x0d }, // PGAMPK0
-	{ 0xb9, 0x05 }, // PGAMPK1
-	{ 0xba, 0x12 }, // PGAMPK2
-	{ 0xbb, 0x10 }, // PGAMPK3
-	{ 0xbc, 0x12 }, // PGAMPK4
-	{ 0xbd, 0x15 }, // PGAMPK5
-	{ 0xbe, 0x19 }, // PGAMPK6
-	{ 0xbf, 0x0e }, // PGAMPK7
-	{ 0xc0, 0x16 }, // PGAMPK8
-	{ 0xc1, 0x0a }, // PGAMPK9
-	// Set gray scale voltage to adjust gamma
-	{ 0xd0, 0x0c }, // NGAMVR0
-	{ 0xd1, 0x17 }, // NGAMVR0
-	{ 0xd2, 0x14 }, // NGAMVR1
-	{ 0xd3, 0x2e }, // NGAMVR2
-	{ 0xd4, 0x32 }, // NGAMVR3
-	{ 0xd5, 0x3c }, // NGAMVR4
-	{ 0xd6, 0x22 }, // NGAMPR0
-	{ 0xd7, 0x3d }, // NGAMPR1
-	{ 0xd8, 0x0d }, // NGAMPK0
-	{ 0xd9, 0x07 }, // NGAMPK1
-	{ 0xda, 0x13 }, // NGAMPK2
-	{ 0xdb, 0x13 }, // NGAMPK3
-	{ 0xdc, 0x11 }, // NGAMPK4
-	{ 0xdd, 0x15 }, // NGAMPK5
-	{ 0xde, 0x19 }, // NGAMPK6
-	{ 0xdf, 0x10 }, // NGAMPK7
-	{ 0xe0, 0x17 }, // NGAMPK8
-	{ 0xe1, 0x0a }, // NGAMPK9
-	// EXTC Command set enable, select page 3
-	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x03 },
-	// Set various timing settings
-	{ 0x00, 0x2a }, // GIP_VST_1
-	{ 0x01, 0x2a }, // GIP_VST_2
-	{ 0x02, 0x2a }, // GIP_VST_3
-	{ 0x03, 0x2a }, // GIP_VST_4
-	{ 0x04, 0x61 }, // GIP_VST_5
-	{ 0x05, 0x80 }, // GIP_VST_6
-	{ 0x06, 0xc7 }, // GIP_VST_7
-	{ 0x07, 0x01 }, // GIP_VST_8
-	{ 0x08, 0x03 }, // GIP_VST_9
-	{ 0x09, 0x04 }, // GIP_VST_10
-	{ 0x70, 0x22 }, // GIP_ECLK1
-	{ 0x71, 0x80 }, // GIP_ECLK2
-	{ 0x30, 0x2a }, // GIP_CLK_1
-	{ 0x31, 0x2a }, // GIP_CLK_2
-	{ 0x32, 0x2a }, // GIP_CLK_3
-	{ 0x33, 0x2a }, // GIP_CLK_4
-	{ 0x34, 0x61 }, // GIP_CLK_5
-	{ 0x35, 0xc5 }, // GIP_CLK_6
-	{ 0x36, 0x80 }, // GIP_CLK_7
-	{ 0x37, 0x23 }, // GIP_CLK_8
-	{ 0x40, 0x03 }, // GIP_CLKA_1
-	{ 0x41, 0x04 }, // GIP_CLKA_2
-	{ 0x42, 0x05 }, // GIP_CLKA_3
-	{ 0x43, 0x06 }, // GIP_CLKA_4
-	{ 0x44, 0x11 }, // GIP_CLKA_5
-	{ 0x45, 0xe8 }, // GIP_CLKA_6
-	{ 0x46, 0xe9 }, // GIP_CLKA_7
-	{ 0x47, 0x11 }, // GIP_CLKA_8
-	{ 0x48, 0xea }, // GIP_CLKA_9
-	{ 0x49, 0xeb }, // GIP_CLKA_10
-	{ 0x50, 0x07 }, // GIP_CLKB_1
-	{ 0x51, 0x08 }, // GIP_CLKB_2
-	{ 0x52, 0x09 }, // GIP_CLKB_3
-	{ 0x53, 0x0a }, // GIP_CLKB_4
-	{ 0x54, 0x11 }, // GIP_CLKB_5
-	{ 0x55, 0xec }, // GIP_CLKB_6
-	{ 0x56, 0xed }, // GIP_CLKB_7
-	{ 0x57, 0x11 }, // GIP_CLKB_8
-	{ 0x58, 0xef }, // GIP_CLKB_9
-	{ 0x59, 0xf0 }, // GIP_CLKB_10
-	// Map internal GOA signals to GOA output pad
-	{ 0xb1, 0x01 }, // PANELD2U2
-	{ 0xb4, 0x15 }, // PANELD2U5
-	{ 0xb5, 0x16 }, // PANELD2U6
-	{ 0xb6, 0x09 }, // PANELD2U7
-	{ 0xb7, 0x0f }, // PANELD2U8
-	{ 0xb8, 0x0d }, // PANELD2U9
-	{ 0xb9, 0x0b }, // PANELD2U10
-	{ 0xba, 0x00 }, // PANELD2U11
-	{ 0xc7, 0x02 }, // PANELD2U24
-	{ 0xca, 0x17 }, // PANELD2U27
-	{ 0xcb, 0x18 }, // PANELD2U28
-	{ 0xcc, 0x0a }, // PANELD2U29
-	{ 0xcd, 0x10 }, // PANELD2U30
-	{ 0xce, 0x0e }, // PANELD2U31
-	{ 0xcf, 0x0c }, // PANELD2U32
-	{ 0xd0, 0x00 }, // PANELD2U33
-	// Map internal GOA signals to GOA output pad
-	{ 0x81, 0x00 }, // PANELU2D2
-	{ 0x84, 0x15 }, // PANELU2D5
-	{ 0x85, 0x16 }, // PANELU2D6
-	{ 0x86, 0x10 }, // PANELU2D7
-	{ 0x87, 0x0a }, // PANELU2D8
-	{ 0x88, 0x0c }, // PANELU2D9
-	{ 0x89, 0x0e }, // PANELU2D10
-	{ 0x8a, 0x02 }, // PANELU2D11
-	{ 0x97, 0x00 }, // PANELU2D24
-	{ 0x9a, 0x17 }, // PANELU2D27
-	{ 0x9b, 0x18 }, // PANELU2D28
-	{ 0x9c, 0x0f }, // PANELU2D29
-	{ 0x9d, 0x09 }, // PANELU2D30
-	{ 0x9e, 0x0b }, // PANELU2D31
-	{ 0x9f, 0x0d }, // PANELU2D32
-	{ 0xa0, 0x01 }, // PANELU2D33
-	// EXTC Command set enable, select page 2
-	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x02 },
-	// Unknown registers
-	{ 0x01, 0x01 },
-	{ 0x02, 0xda },
-	{ 0x03, 0xba },
-	{ 0x04, 0xa8 },
-	{ 0x05, 0x9a },
-	{ 0x06, 0x70 },
-	{ 0x07, 0xff },
-	{ 0x08, 0x91 },
-	{ 0x09, 0x90 },
-	{ 0x0a, 0xff },
-	{ 0x0b, 0x8f },
-	{ 0x0c, 0x60 },
-	{ 0x0d, 0x58 },
-	{ 0x0e, 0x48 },
-	{ 0x0f, 0x38 },
-	{ 0x10, 0x2b },
-	// EXTC Command set enable, select page 0
-	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x00 },
-	// Display Access Control
-	{ 0x36, 0x0a }, // bgr = 1, ss = 1, gs = 0
 };
 
 static inline struct nv3052c *to_nv3052c(struct drm_panel *panel)
@@ -655,6 +384,7 @@ static int nv3052c_prepare(struct drm_panel *panel)
 	gpiod_set_value_cansleep(priv->reset_gpio, 0);
 	usleep_range(5000, 20000);
 
+	/* Apply panel-specific initialization registers */
 	for (i = 0; i < panel_regs_len; i++) {
 		err = mipi_dbi_command(dbi, panel_regs[i].cmd,
 				       panel_regs[i].val);
@@ -665,6 +395,16 @@ static int nv3052c_prepare(struct drm_panel *panel)
 		}
 	}
 
+	/* Apply common initialization registers */
+	for (i = 0; i < ARRAY_SIZE(common_init_regs); i++) {
+		err = mipi_dbi_command(dbi, common_init_regs[i].cmd,
+				       common_init_regs[i].val);
+		if (err) {
+			dev_err(priv->dev, "Unable to set register: %d\n", err);
+			goto err_disable_regulator;
+		}
+	}
+
 	err = mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
 	if (err) {
 		dev_err(priv->dev, "Unable to exit sleep mode: %d\n", err);
-- 
2.49.0

