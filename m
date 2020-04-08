Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0213E1A302E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C62F6EB73;
	Thu,  9 Apr 2020 07:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374AD6E0A6
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 09:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1586339918; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=g62+P3BKA22iNR7eW+jsO/H0my3pBTnlVMgtoacBEdI=;
 b=IqCD+Fe8iXpPYgZyB4FiufcmedzXHNTYVtshHKXUrSBnmvcKn6oDW1WYFWaua7QWS0vIhH
 xb1EW+/mtjoDCBoXPpGywY0A2ILVc33DoC/RXCx5bBK2ErUgyGDtXtVAGf5r5J7igRmeNR
 6oVPctrzbvuwalTWhSrWobxLzOYTa0U=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 1/2] drm/panel: NT39016: Add support for multiple modes
Date: Wed,  8 Apr 2020 11:58:29 +0200
Message-Id: <20200408095830.8131-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Apr 2020 07:33:24 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for multiple drm_display_mode entries. This will allow to
add a 50 Hz mode later.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/panel/panel-novatek-nt39016.c | 33 +++++++++++++------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
index a470810f7dbe..f1286cf6528b 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
@@ -49,7 +49,8 @@ enum nt39016_regs {
 #define NT39016_SYSTEM_STANDBY	BIT(1)
 
 struct nt39016_panel_info {
-	struct drm_display_mode display_mode;
+	const struct drm_display_mode *display_modes;
+	unsigned int num_modes;
 	u16 width_mm, height_mm;
 	u32 bus_format, bus_flags;
 };
@@ -212,15 +213,22 @@ static int nt39016_get_modes(struct drm_panel *drm_panel,
 	struct nt39016 *panel = to_nt39016(drm_panel);
 	const struct nt39016_panel_info *panel_info = panel->panel_info;
 	struct drm_display_mode *mode;
+	unsigned int i;
 
-	mode = drm_mode_duplicate(connector->dev, &panel_info->display_mode);
-	if (!mode)
-		return -ENOMEM;
+	for (i = 0; i < panel_info->num_modes; i++) {
+		mode = drm_mode_duplicate(connector->dev,
+					  &panel_info->display_modes[i]);
+		if (!mode)
+			return -ENOMEM;
+
+		drm_mode_set_name(mode);
 
-	drm_mode_set_name(mode);
+		mode->type = DRM_MODE_TYPE_DRIVER;
+		if (panel_info->num_modes == 1)
+			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
-	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-	drm_mode_probed_add(connector, mode);
+		drm_mode_probed_add(connector, mode);
+	}
 
 	connector->display_info.bpc = 8;
 	connector->display_info.width_mm = panel_info->width_mm;
@@ -230,7 +238,7 @@ static int nt39016_get_modes(struct drm_panel *drm_panel,
 					 &panel_info->bus_format, 1);
 	connector->display_info.bus_flags = panel_info->bus_flags;
 
-	return 1;
+	return panel_info->num_modes;
 }
 
 static const struct drm_panel_funcs nt39016_funcs = {
@@ -316,8 +324,8 @@ static int nt39016_remove(struct spi_device *spi)
 	return 0;
 }
 
-static const struct nt39016_panel_info kd035g6_info = {
-	.display_mode = {
+static const struct drm_display_mode kd035g6_display_modes[] = {
+	{
 		.clock = 6000,
 		.hdisplay = 320,
 		.hsync_start = 320 + 10,
@@ -330,6 +338,11 @@ static const struct nt39016_panel_info kd035g6_info = {
 		.vrefresh = 60,
 		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
 	},
+};
+
+static const struct nt39016_panel_info kd035g6_info = {
+	.display_modes = kd035g6_display_modes,
+	.num_modes = ARRAY_SIZE(kd035g6_display_modes),
 	.width_mm = 71,
 	.height_mm = 53,
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
