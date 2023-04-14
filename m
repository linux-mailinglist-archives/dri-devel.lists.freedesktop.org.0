Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 170806E40B0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23D910E398;
	Mon, 17 Apr 2023 07:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF0A10E070
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 16:11:28 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <jzi@pengutronix.de>)
 id 1pnM1A-00049P-QL; Fri, 14 Apr 2023 18:11:21 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <jzi@pengutronix.de>)
 id 1pnM19-00BEra-Ci; Fri, 14 Apr 2023 18:11:19 +0200
Received: from jzi by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <jzi@pengutronix.de>)
 id 1pnM18-00FQvp-Id; Fri, 14 Apr 2023 18:11:18 +0200
From: Johannes Zink <j.zink@pengutronix.de>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 2/2] drm/panel-simple: allow LVDS format override
Date: Fri, 14 Apr 2023 18:11:16 +0200
Message-Id: <20230414161116.3673911-3-j.zink@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414161116.3673911-1-j.zink@pengutronix.de>
References: <20230414161116.3673911-1-j.zink@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jzi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Mon, 17 Apr 2023 07:21:51 +0000
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
Cc: Johannes Zink <j.zink@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some panels support multiple LVDS data mapping formats, which can be
used e.g. run displays on jeida-18 format when only 3 LVDS lanes are
available.

Add parsing of an optional data-mapping devicetree property, which also
touches up the bits per color to match the bus format.

Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 37 +++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 065f378bba9d..7366ad13b3f1 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -40,6 +40,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_of.h>
 
 /**
  * struct panel_desc - Describes a simple panel.
@@ -559,7 +560,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	struct device_node *ddc;
 	int connector_type;
 	u32 bus_flags;
-	int err;
+	int err, ret;
 
 	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
 	if (!panel)
@@ -605,6 +606,40 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 			panel_simple_parse_panel_timing_node(dev, panel, &dt);
 	}
 
+
+	/* optional data-mapping property for overriding bus format */
+	ret = drm_of_lvds_get_data_mapping(dev->of_node);
+	if (ret == -EINVAL) {
+		dev_warn(dev, "Ignore invalid data-mapping property");
+	} else if (ret != -ENODEV) {
+		int bpc;
+
+		switch (ret) {
+		default:
+			WARN_ON(1);
+			fallthrough;
+		case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+			fallthrough;
+		case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+			bpc = 8;
+			break;
+		case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+			bpc = 6;
+		}
+
+		if (desc->bpc != bpc || desc->bus_format != ret) {
+			struct panel_desc *override_desc;
+
+			override_desc = devm_kmemdup(dev, desc, sizeof(*desc), GFP_KERNEL);
+			if (!override_desc)
+				return -ENOMEM;
+
+			override_desc->bus_format = ret;
+			override_desc->bpc = bpc;
+			panel->desc = override_desc;
+		}
+	}
+
 	connector_type = desc->connector_type;
 	/* Catch common mistakes for panels. */
 	switch (connector_type) {
-- 
2.39.2

