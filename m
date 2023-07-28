Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8B8766F29
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 16:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C3C10E6F8;
	Fri, 28 Jul 2023 14:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC09610E6F7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 14:17:16 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qPOHC-0006G5-J8; Fri, 28 Jul 2023 16:17:06 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qPOHA-002jHV-TX; Fri, 28 Jul 2023 16:17:04 +0200
Received: from localhost ([::1] helo=dude03.red.stw.pengutronix.de)
 by dude03.red.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qPOH9-00APcf-UM; Fri, 28 Jul 2023 16:17:03 +0200
From: Johannes Zink <j.zink@pengutronix.de>
Date: Fri, 28 Jul 2023 16:16:57 +0200
Subject: [PATCH v4 3/3] drm/panel-simple: allow LVDS format override
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230523-simplepanel_support_nondefault_datamapping-v4-3-e6e7011f34b5@pengutronix.de>
References: <20230523-simplepanel_support_nondefault_datamapping-v4-0-e6e7011f34b5@pengutronix.de>
In-Reply-To: <20230523-simplepanel_support_nondefault_datamapping-v4-0-e6e7011f34b5@pengutronix.de>
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

  v3 -> v4: - worked in Dan's feedback (thanks for reviewing my work):
                - return with a proper error in case the call to
		  panel_simple_override_nondefault_lvds_datamapping()
		  fails
                - drop the unneeded and ambiguous ret variable

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
 drivers/gpu/drm/panel/panel-simple.c | 53 ++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4badda6570d5..3a164931093e 100644
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
@@ -601,6 +647,13 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 			panel_simple_parse_panel_timing_node(dev, panel, &dt);
 	}
 
+	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS) {
+		/* Optional data-mapping property for overriding bus format */
+		err = panel_simple_override_nondefault_lvds_datamapping(dev, panel);
+		if (err)
+			goto free_ddc;
+	}
+
 	connector_type = desc->connector_type;
 	/* Catch common mistakes for panels. */
 	switch (connector_type) {

-- 
2.39.2

