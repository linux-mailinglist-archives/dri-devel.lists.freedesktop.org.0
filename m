Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB216EBB4C
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 22:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA57D10E202;
	Sat, 22 Apr 2023 20:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D23810E18F
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 20:50:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 22D6761585;
 Sat, 22 Apr 2023 20:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D73C43446;
 Sat, 22 Apr 2023 20:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682196630;
 bh=UCgJ0lBHPs8yqB9le5P3aPDLxWVWkM/ZAlRVx5+BBZs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dBu4DRifQ43325uLYeciViJyaRPqX/vJ/rw/P6oIQB8teAQE7bMD1b56MJCTrQRYY
 WkLtR3d/5dUs+rnVTpvarTIeXpLA63sYkwfPQoYKdvkyqMBfxjYj5gd6dEo1wgXc9A
 mj4ewMSDx2mpe8nkksmeflkRUrDp3oQLJTEH2w+imgZppYtHu8SiTXKpmo6Zt1SHc/
 WT2fBIpfLkJVjUUkSIqm2VdVNpT9ppt/H9WompSFl5ixLxbIi1bCwZvcfn0NtZXDsR
 0Q5tkDAlXVum4CwLyiY3zM52N4MFu44yHW5Ge+NazJ+NiJTCh49tXBEmxf/cMoWrTo
 oCqXRj5LZ4GVw==
Received: by mercury (Postfix, from userid 1000)
 id 22D051066CD0; Sat, 22 Apr 2023 22:50:25 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 12/13] drm/panel: sitronix-st7789v: avoid hardcoding
 polarity info
Date: Sat, 22 Apr 2023 22:50:11 +0200
Message-Id: <20230422205012.2464933-13-sre@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230422205012.2464933-1-sre@kernel.org>
References: <20230422205012.2464933-1-sre@kernel.org>
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
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add polarity information via mode and bus flags, so that they are no
longer hardcoded and forward the information to the DRM stack. This is
required for adding panels with different settings.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 158623a8dfb7..f3b1bf7ef996 100644
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
 
 struct st7789_panel_info default_panel = {
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
2.39.2

