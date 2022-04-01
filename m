Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB2A4EF7C3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 18:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DA310E2E7;
	Fri,  1 Apr 2022 16:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DD910E2E7
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 16:22:18 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7F90C83B06;
 Fri,  1 Apr 2022 18:22:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648830136;
 bh=SvLv1hoF4X4/Qv0A4qHRi+g3E4Wd9TLQiv+s+PnsWI0=;
 h=From:To:Cc:Subject:Date:From;
 b=Dz/hd9vAxCxYSF9v01iIFiB9yQ99t9KgdaDzwrjOstZMWRaVFP0ub3Pt1VL8PwFhV
 2eyNdNbf4Jd6vuYDNdiWKUZEYo9mjXXzEqnjtCQ5mtL6+EfolUJwQDY7SVUciMT5iF
 ypF4oPk2ZxdIdrQ7gjrhq0mkJm/72k+DloZN2gQFDtNnLh0aeYqFhhC95y8j36hPAV
 5rexx46tYIwnUb3NTY1UK+vOAATk0l1NUEdsiqPhQYN/nn+KRSpaQzWxbMMF3rqF1N
 1A0S8uUGSQlNl5yZpxkiw6VsI8h1kMOeDRUCOLpyvdDRbKw5afd4TY+gcfKc122+m9
 BYcyqi3+zeeBA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/panel: lvds: Simplify mode parsing
Date: Fri,  1 Apr 2022 18:21:53 +0200
Message-Id: <20220401162154.295152-1-marex@denx.de>
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

Tested-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
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
V2: - Reinstate mandatory width-mm/height-mm DT property check
    - Collect TB from Christoph
---
 drivers/gpu/drm/panel/panel-lvds.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 27a1c9923b09..6422868c1089 100644
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
@@ -125,23 +124,20 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
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
+	if (lvds->dmode.width_mm == 0) {
 		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
 			np, "width-mm");
 		return -ENODEV;
 	}
-	ret = of_property_read_u32(np, "height-mm", &lvds->height);
-	if (ret < 0) {
+
+	if (lvds->dmode.height_mm == 0) {
 		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
 			np, "height-mm");
 		return -ENODEV;
-- 
2.35.1

