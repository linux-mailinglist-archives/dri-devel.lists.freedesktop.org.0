Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BB54EE199
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 21:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EDC10E0CE;
	Thu, 31 Mar 2022 19:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FB210E0CE
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 19:24:11 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4D18683A9D;
 Thu, 31 Mar 2022 21:24:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648754644;
 bh=+dBsLQ6ceAaaR+/w7shJNChFMepPMmf7sQl9h8mBkqs=;
 h=From:To:Cc:Subject:Date:From;
 b=ddrboFGS2R4+4DWm5oV9HChFdNZcrK2++XWNr22G0plGKk0mcHebc9fvbaDheL9bO
 LDM94Bfp+uI8URoarIWBmqDekmNkF/7dzxdLTFmMZJfFf3DKOse+kI2ZD7FtjJYqaM
 b2gVyMmdYfBFhJ3t17opRH2MsZzKWEo5WrOyh0OPTp+yFLUHsBnbnUjSBQaN6D8wZn
 oYCz9sargvpmiTBYW2F78xrVbe3L7CYKGatt25rDhGhc0ZGxoUG7oAxQMX322bWEia
 +1NT+CU8Avf5dDH6EFN+RcM9JYSCsrJdrCWJp2NdR/dvVSFAbzQzOcvit+611+UCXL
 NK9vIZf/pJ6Xw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/panel: lvds: Simplify mode parsing
Date: Thu, 31 Mar 2022 21:23:46 +0200
Message-Id: <20220331192347.103299-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, robert.foss@linaro.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mode parsing is currently implemented in three steps:
of_get_display_timing() - DT panel-timing to struct display_timing
videomode_from_timing() - struct display_timing to struct videomode
drm_display_mode_from_videomode() - struct videomode to struct drm_display_mode

Replace all that with simple of_get_drm_panel_display_mode() call,
which already populates struct drm_display_mode and then duplicate
that mode in panel_lvds_get_modes() each time, since the mode does
not change.

Nice bonus is the bus_flags parsed by of_get_drm_panel_display_mode()
out of panel-timing DT node, which is used in subsequent patch to fix
handling of 'de-active' DT property.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dmitry Osipenko <digetx@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/panel-lvds.c | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 27a1c9923b09..65c6a6e9e223 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -30,7 +30,8 @@ struct panel_lvds {
 	const char *label;
 	unsigned int width;
 	unsigned int height;
-	struct videomode video_mode;
+	struct drm_display_mode dmode;
+	u32 bus_flags;
 	unsigned int bus_format;
 	bool data_mirror;
 
@@ -87,16 +88,15 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	struct panel_lvds *lvds = to_panel_lvds(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_create(connector->dev);
+	mode = drm_mode_duplicate(connector->dev, &lvds->dmode);
 	if (!mode)
 		return 0;
 
-	drm_display_mode_from_videomode(&lvds->video_mode, mode);
 	mode->type |= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 	drm_mode_probed_add(connector, mode);
 
-	connector->display_info.width_mm = lvds->width;
-	connector->display_info.height_mm = lvds->height;
+	connector->display_info.width_mm = lvds->dmode.width_mm;
+	connector->display_info.height_mm = lvds->dmode.height_mm;
 	drm_display_info_set_bus_formats(&connector->display_info,
 					 &lvds->bus_format, 1);
 	connector->display_info.bus_flags = lvds->data_mirror
@@ -116,7 +116,6 @@ static const struct drm_panel_funcs panel_lvds_funcs = {
 static int panel_lvds_parse_dt(struct panel_lvds *lvds)
 {
 	struct device_node *np = lvds->dev->of_node;
-	struct display_timing timing;
 	int ret;
 
 	ret = of_drm_get_panel_orientation(np, &lvds->orientation);
@@ -125,28 +124,13 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
 		return ret;
 	}
 
-	ret = of_get_display_timing(np, "panel-timing", &timing);
+	ret = of_get_drm_panel_display_mode(np, &lvds->dmode, &lvds->bus_flags);
 	if (ret < 0) {
 		dev_err(lvds->dev, "%pOF: problems parsing panel-timing (%d)\n",
 			np, ret);
 		return ret;
 	}
 
-	videomode_from_timing(&timing, &lvds->video_mode);
-
-	ret = of_property_read_u32(np, "width-mm", &lvds->width);
-	if (ret < 0) {
-		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
-			np, "width-mm");
-		return -ENODEV;
-	}
-	ret = of_property_read_u32(np, "height-mm", &lvds->height);
-	if (ret < 0) {
-		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
-			np, "height-mm");
-		return -ENODEV;
-	}
-
 	of_property_read_string(np, "label", &lvds->label);
 
 	ret = drm_of_lvds_get_data_mapping(np);
-- 
2.35.1

