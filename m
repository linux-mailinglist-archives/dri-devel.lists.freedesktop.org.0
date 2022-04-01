Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748A74EF7C4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 18:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FCB10E4B2;
	Fri,  1 Apr 2022 16:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF7510E2E7
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 16:22:19 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E93B6842EC;
 Fri,  1 Apr 2022 18:22:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648830137;
 bh=87cCZFMQsqoWTE4FAiAIW+7wExhXsmlZ4j3WDi2aXgQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VCwpd3xece1z9suKCXvW73152JHizR5Xe0MGtTxcPbwdcRVZZlLuiJFPIgbMQJM96
 iunabSmb62Ma9BrnZbpSFbWeobAY0VwIjpkLGme0SUzV7bYrA94aSFC9i6GsbP8Xh7
 rcNHJeEQdn54xcppJBD92NxwJ50ltBDTt9nThcaoHMEo1OXf0ub5+07sWQlRMEMVDz
 j/kG+AjiyLz7M4PqrSEvf6vkTTZSBb8BL9XefcIuarYxMkU2aJZzxKlH0ZTHIV/VNS
 PQ4JPrVlBZGZ+1CUr/EF2YAaR1gwdYNeu7V1YO4RhR1xzsudIkJm3YTtZRnyS9c9EW
 JZyBaX7ujumTA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/panel: lvds: Use bus_flags from DT panel-timing
 property
Date: Fri,  1 Apr 2022 18:21:54 +0200
Message-Id: <20220401162154.295152-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401162154.295152-1-marex@denx.de>
References: <20220401162154.295152-1-marex@denx.de>
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

This driver currently rewrites bus_flags based solely on the value of
DT property 'data-mirror' and ignores bus_flags which might have been
set in DT panel-timing node. Specificaly, the 'de-active' DT property
sets DRM_BUS_FLAG_DE_ bus_flags.

Since of_get_drm_panel_display_mode() conveniently parses the bus_flags
out of DT panel-timing property, just ORR them with bus_flags inferred
from 'data-mirror' DT property and use the result as panel bus_flags.

This fixes handling of panels with 'panel-timing { de-active = <1>; };'.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
V2: - Collect RB from Laurent, TB from Christoph
---
 drivers/gpu/drm/panel/panel-lvds.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 6422868c1089..eca067e78579 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -33,7 +33,6 @@ struct panel_lvds {
 	struct drm_display_mode dmode;
 	u32 bus_flags;
 	unsigned int bus_format;
-	bool data_mirror;
 
 	struct regulator *supply;
 
@@ -99,9 +98,7 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	connector->display_info.height_mm = lvds->dmode.height_mm;
 	drm_display_info_set_bus_formats(&connector->display_info,
 					 &lvds->bus_format, 1);
-	connector->display_info.bus_flags = lvds->data_mirror
-					  ? DRM_BUS_FLAG_DATA_LSB_TO_MSB
-					  : DRM_BUS_FLAG_DATA_MSB_TO_LSB;
+	connector->display_info.bus_flags = lvds->bus_flags;
 	drm_connector_set_panel_orientation(connector, lvds->orientation);
 
 	return 1;
@@ -154,7 +151,9 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
 
 	lvds->bus_format = ret;
 
-	lvds->data_mirror = of_property_read_bool(np, "data-mirror");
+	lvds->bus_flags |= of_property_read_bool(np, "data-mirror") ?
+			   DRM_BUS_FLAG_DATA_LSB_TO_MSB :
+			   DRM_BUS_FLAG_DATA_MSB_TO_LSB;
 
 	return 0;
 }
-- 
2.35.1

