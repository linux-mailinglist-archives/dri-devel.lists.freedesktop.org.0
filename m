Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 178AE752EC6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDACF10E7AF;
	Fri, 14 Jul 2023 01:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A468B10E0C8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:38:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E79A61BB3;
 Fri, 14 Jul 2023 01:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C228C433C7;
 Fri, 14 Jul 2023 01:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689298684;
 bh=MOWpJ/g3+vAITpFiVZXxc8UxPAL4534GqthAG24iYJc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c/I6Z+ie7CrQHGTcboX42cW4KKZH5VsQzo7dIabYJcksLessxZ2FiLvjnz4eYGFRW
 3KMhD+QZyLRI60Bw3BdMV7/1TP2nGh5mQlYnKDHM7oK34+Kb9b9cPDIKC7JrJvMj6f
 cn/WAqCHAso7u/U2ooKKUjNw4n2lu1Qa1qpcbgfeYkuRiSz1ZiHAN0yQyPyPfe+aPF
 Qtyji+d6H/DlXLTHpI4lCPGMk15Tmr9u2TI+WynBAQ8lXQSVAgHDp94nr+FD4/LcdB
 bw0fKjZBUkRgSBrTCsECla8F1C2UakNiWWCuIFR0O/KryFjpDuxsW3nRR3xF/eY8iz
 NjUoDKjFDSIrA==
Received: by mercury (Postfix, from userid 1000)
 id E832610676F4; Fri, 14 Jul 2023 03:37:58 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v3 12/19] drm/panel: sitronix-st7789v: avoid hardcoding
 polarity info
Date: Fri, 14 Jul 2023 03:37:49 +0200
Message-Id: <20230714013756.1546769-13-sre@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230714013756.1546769-1-sre@kernel.org>
References: <20230714013756.1546769-1-sre@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add polarity information via mode and bus flags, so that they are no
longer hardcoded and forward the information to the DRM stack. This is
required for adding panels with different settings.

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index ee84d7a9019e..94c805c79d05 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -28,6 +28,7 @@
 #define ST7789V_RGBCTRL_VSYNC_HIGH		BIT(3)
 #define ST7789V_RGBCTRL_HSYNC_HIGH		BIT(2)
 #define ST7789V_RGBCTRL_PCLK_HIGH		BIT(1)
+#define ST7789V_RGBCTRL_DE_LOW			BIT(0)
 #define ST7789V_RGBCTRL_VBP(n)			((n) & 0x7f)
 #define ST7789V_RGBCTRL_HBP(n)			((n) & 0x1f)
 
@@ -112,6 +113,7 @@
 struct st7789_panel_info {
 	const struct drm_display_mode *mode;
 	u32 bus_format;
+	u32 bus_flags;
 	bool invert_mode;
 };
 
@@ -168,12 +170,15 @@ static const struct drm_display_mode default_mode = {
 	.vtotal = 320 + 8 + 4 + 4,
 	.width_mm = 61,
 	.height_mm = 103,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
 };
 
 static const struct st7789_panel_info default_panel = {
 	.mode = &default_mode,
 	.invert_mode = true,
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
+		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
 };
 
 static int st7789v_get_modes(struct drm_panel *panel,
@@ -198,6 +203,7 @@ static int st7789v_get_modes(struct drm_panel *panel,
 	connector->display_info.bpc = 6;
 	connector->display_info.width_mm = ctx->info->mode->width_mm;
 	connector->display_info.height_mm = ctx->info->mode->height_mm;
+	connector->display_info.bus_flags = ctx->info->bus_flags;
 	drm_display_info_set_bus_formats(&connector->display_info,
 					 &ctx->info->bus_format, 1);
 
@@ -207,7 +213,7 @@ static int st7789v_get_modes(struct drm_panel *panel,
 static int st7789v_prepare(struct drm_panel *panel)
 {
 	struct st7789v *ctx = panel_to_st7789v(panel);
-	u8 pixel_fmt;
+	u8 pixel_fmt, polarity;
 	int ret;
 
 	switch (ctx->info->bus_format) {
@@ -225,6 +231,16 @@ static int st7789v_prepare(struct drm_panel *panel)
 
 	pixel_fmt = (pixel_fmt << 4) | pixel_fmt;
 
+	polarity = 0;
+	if (ctx->info->mode->flags & DRM_MODE_FLAG_PVSYNC)
+		polarity |= ST7789V_RGBCTRL_VSYNC_HIGH;
+	if (ctx->info->mode->flags & DRM_MODE_FLAG_PHSYNC)
+		polarity |= ST7789V_RGBCTRL_HSYNC_HIGH;
+	if (ctx->info->bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE)
+		polarity |= ST7789V_RGBCTRL_PCLK_HIGH;
+	if (ctx->info->bus_flags & DRM_BUS_FLAG_DE_LOW)
+		polarity |= ST7789V_RGBCTRL_DE_LOW;
+
 	ret = regulator_enable(ctx->power);
 	if (ret)
 		return ret;
@@ -340,9 +356,7 @@ static int st7789v_prepare(struct drm_panel *panel)
 	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_RGBCTRL_CMD));
 	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_WO |
 					     ST7789V_RGBCTRL_RCM(2) |
-					     ST7789V_RGBCTRL_VSYNC_HIGH |
-					     ST7789V_RGBCTRL_HSYNC_HIGH |
-					     ST7789V_RGBCTRL_PCLK_HIGH));
+					     polarity));
 	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_VBP(8)));
 	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_HBP(20)));
 
-- 
2.40.1

