Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2664A4EE19A
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 21:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176FF10E9B9;
	Thu, 31 Mar 2022 19:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F291310E0E5
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 19:24:11 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B834983ACE;
 Thu, 31 Mar 2022 21:24:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648754645;
 bh=KQ6AVrh9f5VXtBkk7aZ+MeV8gf3HxkabbTOvJ/IX6Ug=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IDF6ASth8veB8wSel/4AQ9BijdqI61F8KIfDPG/HHqrFvtgmWPq6r8YxMVhktjdHf
 prSRZiX3YlrbfAEeDODhwWeGLRhTJRLk7LW20E0aTu2FGFzhiS5TxuqZY+H+5wBdUr
 j2uMTaBJtTqAOFwURwLtdSjaJ0PJgIi2EkHma3EWoyM+6AwH4gQToqv0sGx2WqlQEp
 ToXXXUAtPCs2kD7b6UdtWS338e198ibNUpNIR3Uk3GaEMZoLGTcMa83iXtk6NOIacv
 MKnThpZP7mHop4YuBXi+DQTfLhYeeUy/cBO3kCRHoOXORhb8dWZJHnkxjIa15Y1Izo
 BmDppiycJvfnQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/panel: lvds: Use bus_flags from DT panel-timing
 property
Date: Thu, 31 Mar 2022 21:23:47 +0200
Message-Id: <20220331192347.103299-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331192347.103299-1-marex@denx.de>
References: <20220331192347.103299-1-marex@denx.de>
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
 drivers/gpu/drm/panel/panel-lvds.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 65c6a6e9e223..f11252fb00fe 100644
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
@@ -142,7 +139,9 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
 
 	lvds->bus_format = ret;
 
-	lvds->data_mirror = of_property_read_bool(np, "data-mirror");
+	lvds->bus_flags |= of_property_read_bool(np, "data-mirror") ?
+			   DRM_BUS_FLAG_DATA_LSB_TO_MSB :
+			   DRM_BUS_FLAG_DATA_MSB_TO_LSB;
 
 	return 0;
 }
-- 
2.35.1

