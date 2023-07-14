Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E6A752EC8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CB910E7A9;
	Fri, 14 Jul 2023 01:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DD010E7A9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:38:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F20D61BB5;
 Fri, 14 Jul 2023 01:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 583B5C433CC;
 Fri, 14 Jul 2023 01:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689298684;
 bh=i3ZrSSDxreDrHnbdzjRZb/TFVdFo15zQGfDgEtGHAcw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P/KHAdAtEeObqX6VWEDk0ol/pRePLLW+O8wxczMFSV9tDyruFPRh8YIAYg/BOBWMm
 zQZoMi7hqMriC9HuMMsg4zqjCgcE1JLo2PzoXW17KBWwcTa6aTbKxbd2Kp3nst/n7y
 TYQlDs8Ih5PVu2M0hMXxZQ67BDEt2yF/mdtXL9fpq4CFSH5RkE7HUNRFj3Hx+lP5U4
 IQJVkYeTWW8FCHKSwVZV1vl81N+kRGL9ktzm3u9Kb1YsaxLzPqrF9egRnkDlmbAcXM
 KE66/6bAfqQZNYB63TLXcat4LNM5OvgQqbh89l2EZrWHRLqybOUOdf8Y4yADPY7hU2
 YClOTMMf8/wHQ==
Received: by mercury (Postfix, from userid 1000)
 id DD676106769A; Fri, 14 Jul 2023 03:37:58 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v3 08/19] drm/panel: sitronix-st7789v: avoid hardcoding mode
 info
Date: Fri, 14 Jul 2023 03:37:45 +0200
Message-Id: <20230714013756.1546769-9-sre@kernel.org>
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

Avoid hard-coding the default_mode and supply it from match data. One
additional layer of abstraction has been introduced, which will be
needed for specifying other panel information (e.g. bus flags) in the
next steps.

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 24 ++++++++++++++-----
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index a6d6155ef45c..24c5bec6ce31 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -108,8 +108,13 @@
 			return val;		\
 	} while (0)
 
+struct st7789_panel_info {
+	const struct drm_display_mode *mode;
+};
+
 struct st7789v {
 	struct drm_panel panel;
+	const struct st7789_panel_info *info;
 	struct spi_device *spi;
 	struct gpio_desc *reset;
 	struct regulator *power;
@@ -160,16 +165,21 @@ static const struct drm_display_mode default_mode = {
 	.vtotal = 320 + 8 + 4 + 4,
 };
 
+static const struct st7789_panel_info default_panel = {
+	.mode = &default_mode,
+};
+
 static int st7789v_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
+	struct st7789v *ctx = panel_to_st7789v(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->dev, ctx->info->mode);
 	if (!mode) {
-		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
-			default_mode.hdisplay, default_mode.vdisplay,
-			drm_mode_vrefresh(&default_mode));
+		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
+			ctx->info->mode->hdisplay, ctx->info->mode->vdisplay,
+			drm_mode_vrefresh(ctx->info->mode));
 		return -ENOMEM;
 	}
 
@@ -359,6 +369,8 @@ static int st7789v_probe(struct spi_device *spi)
 	spi_set_drvdata(spi, ctx);
 	ctx->spi = spi;
 
+	ctx->info = device_get_match_data(&spi->dev);
+
 	drm_panel_init(&ctx->panel, dev, &st7789v_drm_funcs,
 		       DRM_MODE_CONNECTOR_DPI);
 
@@ -389,13 +401,13 @@ static void st7789v_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id st7789v_spi_id[] = {
-	{ "st7789v" },
+	{ "st7789v", (unsigned long) &default_panel },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, st7789v_spi_id);
 
 static const struct of_device_id st7789v_of_match[] = {
-	{ .compatible = "sitronix,st7789v" },
+	{ .compatible = "sitronix,st7789v", .data = &default_panel },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, st7789v_of_match);
-- 
2.40.1

