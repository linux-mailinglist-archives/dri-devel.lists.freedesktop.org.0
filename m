Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D1B766C2A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 13:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D8710E1EF;
	Fri, 28 Jul 2023 11:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FEE10E1EF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 11:55:03 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qPM3Z-0002Lv-0R; Fri, 28 Jul 2023 13:54:53 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qPM3Y-002hCy-AD; Fri, 28 Jul 2023 13:54:52 +0200
Received: from localhost ([::1] helo=dude03.red.stw.pengutronix.de)
 by dude03.red.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qPM3W-008twe-Br; Fri, 28 Jul 2023 13:54:50 +0200
From: Johannes Zink <j.zink@pengutronix.de>
Date: Fri, 28 Jul 2023 13:54:40 +0200
Subject: [PATCH v3 3/3] drm/panel-simple: allow LVDS format override
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230523-simplepanel_support_nondefault_datamapping-v3-3-78ede374d3d9@pengutronix.de>
References: <20230523-simplepanel_support_nondefault_datamapping-v3-0-78ede374d3d9@pengutronix.de>
In-Reply-To: <20230523-simplepanel_support_nondefault_datamapping-v3-0-78ede374d3d9@pengutronix.de>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dan Carpenter <error27@gmail.com>, kernel test robot <lkp@intel.com>,
 Johannes Zink <j.zink@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-jzi@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some panels support multiple LVDS data mapping formats, which can be
used e.g. run displays on jeida-18 format when only 3 LVDS lanes are
available.

Add parsing of an optional data-mapping devicetree property, which also
touches up the bits per color to match the bus format.

Signed-off-by: Johannes Zink <j.zink@pengutronix.de>

---

Changes:

  v2 -> v3: - worked in Laurent's review findings (thanks for reviewing
              my work):
	        - extract fixing up the bus format to separate
		  function
		- only call function on LVDS panels
		- fix typos found by Laurent
		- simplified error handling

  v1 -> v2: - fix missing unwind goto found by test robot
              Reported-by: kernel test robot <lkp@intel.com>
              Reported-by: Dan Carpenter <error27@gmail.com>
              Link: https://lore.kernel.org/r/202304160359.4LHmFOlU-lkp@intel.com/
---
 drivers/gpu/drm/panel/panel-simple.c | 55 +++++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4badda6570d5..0c25718dcb56 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -40,6 +40,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_of.h>
 
 /**
  * struct panel_desc - Describes a simple panel.
@@ -549,6 +550,51 @@ static void panel_simple_parse_panel_timing_node(struct device *dev,
 		dev_err(dev, "Reject override mode: No display_timing found\n");
 }
 
+static int panel_simple_override_nondefault_lvds_datamapping(struct device *dev,
+							     struct panel_simple *panel)
+{
+	int ret, bpc;
+
+	ret = drm_of_lvds_get_data_mapping(dev->of_node);
+	if (ret < 0) {
+		if (ret == -EINVAL)
+			dev_warn(dev, "Ignore invalid data-mapping property\n");
+
+		/*
+		 * Ignore non-existing or malformatted property, fallback to
+		 * default data-mapping, and return 0.
+		 */
+		return 0;
+	}
+
+	switch (ret) {
+	default:
+		WARN_ON(1);
+		fallthrough;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+		fallthrough;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+		bpc = 8;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+		bpc = 6;
+	}
+
+	if (panel->desc->bpc != bpc || panel->desc->bus_format != ret) {
+		struct panel_desc *override_desc;
+
+		override_desc = devm_kmemdup(dev, panel->desc, sizeof(*panel->desc), GFP_KERNEL);
+		if (!override_desc)
+			return -ENOMEM;
+
+		override_desc->bus_format = ret;
+		override_desc->bpc = bpc;
+		panel->desc = override_desc;
+	}
+
+	return 0;
+}
+
 static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 {
 	struct panel_simple *panel;
@@ -556,7 +602,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	struct device_node *ddc;
 	int connector_type;
 	u32 bus_flags;
-	int err;
+	int err, ret;
 
 	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
 	if (!panel)
@@ -601,6 +647,13 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 			panel_simple_parse_panel_timing_node(dev, panel, &dt);
 	}
 
+	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS) {
+		/* Optional data-mapping property for overriding bus format */
+		ret = panel_simple_override_nondefault_lvds_datamapping(dev, panel);
+		if (ret)
+			goto free_ddc;
+	}
+
 	connector_type = desc->connector_type;
 	/* Catch common mistakes for panels. */
 	switch (connector_type) {

-- 
2.39.2

