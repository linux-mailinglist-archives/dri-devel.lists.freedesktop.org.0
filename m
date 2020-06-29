Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA3E20E95C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 01:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5D76E04E;
	Mon, 29 Jun 2020 23:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CA789E7B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 23:33:35 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69115124D;
 Tue, 30 Jun 2020 01:33:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1593473613;
 bh=JpKbSdJ87LaqPJ9SQZtUWZvm3MNEL1O0yhk9JD5lL6k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jDB8rY/S8ltDsHnyydKuhDdez3mqKvnILjipVxYYIHcan/02h6yEEx/U/65Q/Qxmb
 e3lT30dw6lZSNCtRrbxQ8oNensLyWAKm/DQZ7qhMp5XZDrUeh62yrKwpGiygC0idI4
 BjY2JwQGGQohEGqZJBYolGbyD4ZeKRFcHkQ04Pls=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm: panel: simple: Warn in case of incorrect bus
 format for LVDS panels
Date: Tue, 30 Jun 2020 02:33:20 +0300
Message-Id: <20200629233320.8774-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629233320.8774-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200629233320.8774-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Liu Ying <victor.liu@nxp.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Pascal Roeleven <dev@pascalroeleven.nl>,
 Thierry Reding <thierry.reding@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only the MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
MEDIA_BUS_FMT_RGB888_1X7X4_SPWG and MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA bus
formats are valid for LVDS panels. Warn at probe time to catch the
common mistake of using an incorrect format, as well as discrepancies
between the bus format and the reported bpc.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index cd416376bf71..3a35f74d6cb7 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -549,13 +549,22 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 			panel_simple_parse_panel_timing_node(dev, panel, &dt);
 	}
 
-	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS)
+	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS) {
 		/* Catch common mistakes for LVDS panels. */
 		WARN_ON(desc->bus_flags &
 			~(DRM_BUS_FLAG_DE_LOW |
 			  DRM_BUS_FLAG_DE_HIGH |
 			  DRM_BUS_FLAG_DATA_MSB_TO_LSB |
 			  DRM_BUS_FLAG_DATA_LSB_TO_MSB));
+		WARN_ON(desc->bus_format != MEDIA_BUS_FMT_RGB666_1X7X3_SPWG &&
+			desc->bus_format != MEDIA_BUS_FMT_RGB888_1X7X4_SPWG &&
+			desc->bus_format != MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA);
+		WARN_ON(desc->bus_format == MEDIA_BUS_FMT_RGB666_1X7X3_SPWG &&
+			desc->bpc != 6);
+		WARN_ON((desc->bus_format == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG ||
+			 desc->bus_format == MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA) &&
+			desc->bpc != 8);
+	}
 
 	drm_panel_init(&panel->base, dev, &panel_simple_funcs,
 		       desc->connector_type);
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
