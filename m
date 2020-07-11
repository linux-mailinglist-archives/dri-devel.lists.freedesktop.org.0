Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9039921C366
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 11:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFAB6E144;
	Sat, 11 Jul 2020 09:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DA06E144
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 09:47:30 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 9102E20023;
 Sat, 11 Jul 2020 11:47:27 +0200 (CEST)
Date: Sat, 11 Jul 2020 11:47:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm/panel: panel-simple: validate panel description
Message-ID: <20200711094726.GA940164@ravnborg.org>
References: <20200703192417.372164-1-sam@ravnborg.org>
 <20200703192417.372164-3-sam@ravnborg.org>
 <20200710221124.GI5964@pendragon.ideasonboard.com>
 <20200711074807.GA779438@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200711074807.GA779438@ravnborg.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8
 a=uxUQ345eqn56x_wrn9sA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=D0XLA9XvdZm18NrgonBM:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, kbuild test robot <lkp@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thierry Reding <thierry.reding@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Warn is we detect a panel with missing descriptions.
This is inpsired by a similar patch by Laurent that introduced checks
for LVDS panels - this extends the checks to the reminaing type of
connectors.

This is known to fail for some of the existing panels but added
despite this as we need help from people using the panels to
add the missing info.
The checks are not complete but will catch the most common mistakes.
The checks at the same time serves as documentation for the minimum
required description for a panel.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---

This is my attempt on the validation described in the previous mail.
The assignment of default connector_type will then be a follow-up patch
to this.

	Sam

 drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 2aff93accad5..025a7ccdfcb3 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -549,8 +549,12 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 			panel_simple_parse_panel_timing_node(dev, panel, &dt);
 	}
 
-	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS) {
-		/* Catch common mistakes for LVDS panels. */
+	/* Catch common mistakes for panels. */
+	switch (desc->connector_type) {
+	case 0:
+		WARN(desc->connector_type == 0, "specify missing connector_type\n");
+		break;
+	case DRM_MODE_CONNECTOR_LVDS:
 		WARN_ON(desc->bus_flags &
 			~(DRM_BUS_FLAG_DE_LOW |
 			  DRM_BUS_FLAG_DE_HIGH |
@@ -564,6 +568,30 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 		WARN_ON((desc->bus_format == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG ||
 			 desc->bus_format == MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA) &&
 			desc->bpc != 8);
+		break;
+	case DRM_MODE_CONNECTOR_eDP:
+		WARN_ON(desc->bus_format == 0);
+		WARN_ON(desc->bpc != 6 && desc->bpc != 8);
+		break;
+	case DRM_MODE_CONNECTOR_DSI:
+		WARN_ON(desc->bpc != 6 && desc->bpc != 8);
+		break;
+	case DRM_MODE_CONNECTOR_DPI:
+		WARN_ON(desc->bus_flags &
+			~(DRM_BUS_FLAG_DE_LOW |
+			  DRM_BUS_FLAG_DE_HIGH |
+			  DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
+			  DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+			  DRM_BUS_FLAG_DATA_MSB_TO_LSB |
+			  DRM_BUS_FLAG_DATA_LSB_TO_MSB |
+			  DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE |
+			  DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE));
+		WARN_ON(desc->bus_format == 0);
+		WARN_ON(desc->bpc != 6 && desc->bpc != 8);
+		break;
+	default:
+		WARN(true, "panel has unknown connector_type: %d\n", desc->connector_type);
+		break;
 	}
 
 	drm_panel_init(&panel->base, dev, &panel_simple_funcs,
-- 
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
