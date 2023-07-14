Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4821B752EBC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B84310E7B5;
	Fri, 14 Jul 2023 01:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FAA10E7A9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:38:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D2A7861BE2;
 Fri, 14 Jul 2023 01:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10089C433C7;
 Fri, 14 Jul 2023 01:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689298687;
 bh=TIdMELntounxEq+AZGdZ3Vnv1CEHXYkAD0LNGdTnnt0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pUbS71K+Bkd0Sp4MGb66jbx8cqFCbiFyJlFaI96ApEFPRUhu16SPlz8ykaJYC8Qr/
 Cg4Q8D0cygQ7hARBKUikiDeCz3faz5QCb42+iH/o4PWOlbQ87zFphGWzHEjAFPaUrl
 IQiYto+gCZ8F9prEIKiDt73HpVMarRYcFi4XXPqQedFI8o5PaMTL6YsxKG1LxWgAnk
 U2q72zPpoqjPPQxTQ93ynKRqVmcS+teZdP05NM4TUH1BbdQST4C5QcyzJxIyT7BX3O
 v6XlJSZucQXkZV6NiUCPfIKbczFkRUIDUaysdlWwSIe1EFUnc/uRndf1kw3zzcpKWF
 gRXTjYvYESP8A==
Received: by mercury (Postfix, from userid 1000)
 id EB2FE10676F5; Fri, 14 Jul 2023 03:37:58 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v3 13/19] drm/panel: sitronix-st7789v: add Inanbo T28CP45TN89
 support
Date: Fri, 14 Jul 2023 03:37:50 +0200
Message-Id: <20230714013756.1546769-14-sre@kernel.org>
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

UNI-T UTi260b has a Inanbo T28CP45TN89 v17 panel. I could not find
proper documentation for the panel apart from a technical drawing, but
according to the vendor U-Boot it is based on a Sitronix st7789v chip.
I generated the init sequence by modifying the default one until proper
graphics output has been seen on the device.

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 94c805c79d05..55e475471f43 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -173,6 +173,21 @@ static const struct drm_display_mode default_mode = {
 	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
 };
 
+static const struct drm_display_mode t28cp45tn89_mode = {
+	.clock = 6008,
+	.hdisplay = 240,
+	.hsync_start = 240 + 38,
+	.hsync_end = 240 + 38 + 10,
+	.htotal = 240 + 38 + 10 + 10,
+	.vdisplay = 320,
+	.vsync_start = 320 + 8,
+	.vsync_end = 320 + 8 + 4,
+	.vtotal = 320 + 8 + 4 + 4,
+	.width_mm = 43,
+	.height_mm = 57,
+	.flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
 static const struct st7789_panel_info default_panel = {
 	.mode = &default_mode,
 	.invert_mode = true,
@@ -181,6 +196,14 @@ static const struct st7789_panel_info default_panel = {
 		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
 };
 
+static const struct st7789_panel_info t28cp45tn89_panel = {
+	.mode = &t28cp45tn89_mode,
+	.invert_mode = false,
+	.bus_format = MEDIA_BUS_FMT_RGB565_1X16,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
+		     DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
+};
+
 static int st7789v_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
@@ -446,12 +469,14 @@ static void st7789v_remove(struct spi_device *spi)
 
 static const struct spi_device_id st7789v_spi_id[] = {
 	{ "st7789v", (unsigned long) &default_panel },
+	{ "t28cp45tn89-v17", (unsigned long) &t28cp45tn89_panel },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, st7789v_spi_id);
 
 static const struct of_device_id st7789v_of_match[] = {
 	{ .compatible = "sitronix,st7789v", .data = &default_panel },
+	{ .compatible = "inanbo,t28cp45tn89-v17", .data = &t28cp45tn89_panel },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, st7789v_of_match);
-- 
2.40.1

