Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3706EBB45
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 22:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A428110E1CC;
	Sat, 22 Apr 2023 20:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B90B10E1A7
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 20:50:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A611C61578;
 Sat, 22 Apr 2023 20:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69095C433A1;
 Sat, 22 Apr 2023 20:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682196630;
 bh=eUU5RldMNCDDlm4SoM+xtwyGoFwbZ815W9/D47ihSVI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MG5GyLBgcBInmQq6rn0xgHi5c/ZuG76NQlt5f0s4j2WcrDIGVAoNVxkufW0ECBBAt
 izW/XN+3AAe8Ghj8/hQSyln7Od3wl5NE2cFcZyifoD1mIe/Odj00i83lH+SY0V39eD
 xNtUjd/3hsWO0Oa6UIWhzomtcFMqaRze2SjKO8tVt05k+qGNNANlWTz61r3K179aTq
 rwz59hTYbFeJD4/vECJtusc3jacJFwgsWr3awUobEDHJzGvnsZBt86m7q70jcfrox8
 gPyBV+G9OZsexTmZ/6W7H2YN1BDWoqF3Ns7EwhD2lNQ5USPN5KcB6ozP2Tuwvy2e6B
 Rg4LAvME+qc/A==
Received: by mercury (Postfix, from userid 1000)
 id 253661066CD2; Sat, 22 Apr 2023 22:50:25 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 13/13] drm/panel: sitronix-st7789v: add Inanbo T28CP45TN89
 support
Date: Sat, 22 Apr 2023 22:50:12 +0200
Message-Id: <20230422205012.2464933-14-sre@kernel.org>
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

UNI-T UTi260b has a Inanbo T28CP45TN89 v17 panel. I could not find
proper documentation for the panel apart from a technical drawing, but
according to the vendor U-Boot it is based on a Sitronix st7789v chip.
I generated the init sequence by modifying the default one until proper
graphics output has been seen on the device.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index f3b1bf7ef996..172c6c1fc090 100644
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
 struct st7789_panel_info default_panel = {
 	.mode = &default_mode,
 	.invert_mode = true,
@@ -181,6 +196,14 @@ struct st7789_panel_info default_panel = {
 		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
 };
 
+struct st7789_panel_info t28cp45tn89_panel = {
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
2.39.2

