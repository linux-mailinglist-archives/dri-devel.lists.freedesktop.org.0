Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3979C752EAD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214E310E7AD;
	Fri, 14 Jul 2023 01:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712C310E7AE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:38:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D31FD61BB5;
 Fri, 14 Jul 2023 01:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1020AC433BC;
 Fri, 14 Jul 2023 01:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689298687;
 bh=SyHMszDT1ot5JXMApsI+a0Y92zb2LHjU42ndESHqtcg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ovrsLS/TZJtAZ7paj9/FRcsV2ekw0hVbaBkK6e0tEl+FhmpR62+tEz70dFHVW963n
 YP3B8dOwKWIKuyRauWfsb/J3GjIiFJzFiqqH6Q89YURwXqOZ4dDYiGJkF1Jt0eiofl
 yEFV2olGuzaTW1qo4jnQlwBIxrQzpC0qC+bUQ/hqjF0RIAHL6kdTs1G4o5QBhM8L3+
 +hjzAl3GkIgtvzFkR/m58TW+pr/URA2AMMadbBFYv7wNKvW4agt20xc/6eWVz84hH4
 Y89bRENVtvtL5rlkLcL6Am1FgcsqpYqP4GrF/0qr2mKldI5nYfe2pFS1bdnYxq+RTF
 U+DeifwVZHM4w==
Received: by mercury (Postfix, from userid 1000)
 id 047E510676FA; Fri, 14 Jul 2023 03:37:59 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v3 18/19] drm/panel: sitronix-st7789v: Add EDT ET028013DMA
 panel support
Date: Fri, 14 Jul 2023 03:37:55 +0200
Message-Id: <20230714013756.1546769-19-sre@kernel.org>
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
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Miquel Raynal <miquel.raynal@bootlin.com>

This panel from Emerging Display Technologies Corporation features an
ST7789V2 LCD controller panel inside which is almost identical to what
the Sitronix panel driver supports.

In practice, the module physical size is specific, and experiments show
that the display will malfunction if any of the following situation
occurs:
* Pixel clock is above 3MHz
* Pixel clock is not inverted
I could not properly identify the reasons behind these failures, scope
captures show valid input signals.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 3d24690e891b..47387f127e05 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -187,6 +187,21 @@ static const struct drm_display_mode t28cp45tn89_mode = {
 	.flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC,
 };
 
+static const struct drm_display_mode et028013dma_mode = {
+	.clock = 3000,
+	.hdisplay = 240,
+	.hsync_start = 240 + 38,
+	.hsync_end = 240 + 38 + 10,
+	.htotal = 240 + 38 + 10 + 10,
+	.vdisplay = 320,
+	.vsync_start = 320 + 8,
+	.vsync_end = 320 + 8 + 4,
+	.vtotal = 320 + 8 + 4 + 4,
+	.width_mm = 43,
+	.height_mm = 58,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+};
+
 static const struct st7789_panel_info default_panel = {
 	.mode = &default_mode,
 	.invert_mode = true,
@@ -203,6 +218,14 @@ static const struct st7789_panel_info t28cp45tn89_panel = {
 		     DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 };
 
+static const struct st7789_panel_info et028013dma_panel = {
+	.mode = &et028013dma_mode,
+	.invert_mode = true,
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
+		     DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
+};
+
 static int st7789v_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
@@ -474,6 +497,7 @@ static void st7789v_remove(struct spi_device *spi)
 static const struct spi_device_id st7789v_spi_id[] = {
 	{ "st7789v", (unsigned long) &default_panel },
 	{ "t28cp45tn89-v17", (unsigned long) &t28cp45tn89_panel },
+	{ "et028013dma", (unsigned long) &et028013dma_panel },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, st7789v_spi_id);
@@ -481,6 +505,7 @@ MODULE_DEVICE_TABLE(spi, st7789v_spi_id);
 static const struct of_device_id st7789v_of_match[] = {
 	{ .compatible = "sitronix,st7789v", .data = &default_panel },
 	{ .compatible = "inanbo,t28cp45tn89-v17", .data = &t28cp45tn89_panel },
+	{ .compatible = "edt,et028013dma", .data = &et028013dma_panel },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, st7789v_of_match);
-- 
2.40.1

