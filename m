Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D0816BC7D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2556EA63;
	Tue, 25 Feb 2020 08:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F8F6E9C4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:21:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 63B622935C9
Received: by earth.universe (Postfix, from userid 1000)
 id B08363C0CB4; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 49/56] drm/omap: drop unused DSS next pointer
Date: Tue, 25 Feb 2020 00:21:19 +0100
Message-Id: <20200224232126.3385250-50-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since all encoders and panels are using the bridge API now,
we next pointer is no longer useful and can be dropped.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c     |  2 +-
 drivers/gpu/drm/omapdrm/dss/omapdss.h  |  1 -
 drivers/gpu/drm/omapdrm/dss/output.c   | 13 +------------
 drivers/gpu/drm/omapdrm/omap_encoder.c |  4 ----
 4 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index c2791305c332..d62713b241d2 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -135,7 +135,7 @@ struct omap_dss_device *omapdss_device_next_output(struct omap_dss_device *from)
 			goto done;
 		}
 
-		if (dssdev->id && (dssdev->next || dssdev->bridge))
+		if (dssdev->id && (dssdev->bridge))
 			goto done;
 	}
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 325a89d802e2..03498f0ed6c2 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -292,7 +292,6 @@ struct omap_dss_device {
 	struct module *owner;
 
 	struct dss_device *dss;
-	struct omap_dss_device *next;
 	struct drm_bridge *bridge;
 	struct drm_bridge *next_bridge;
 	struct drm_panel *panel;
diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
index ce21c798cca6..40cb353572f6 100644
--- a/drivers/gpu/drm/omapdrm/dss/output.c
+++ b/drivers/gpu/drm/omapdrm/dss/output.c
@@ -30,7 +30,6 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 		return 0;
 	}
 
-	out->next = omapdss_find_device_by_node(remote_node);
 	out->bridge = of_drm_find_bridge(remote_node);
 	out->panel = of_drm_find_panel(remote_node);
 	if (IS_ERR(out->panel))
@@ -38,12 +37,6 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 
 	of_node_put(remote_node);
 
-	if (out->next && out->type != out->next->type) {
-		dev_err(out->dev, "output type and display type don't match\n");
-		ret = -EINVAL;
-		goto error;
-	}
-
 	if (out->panel) {
 		struct drm_bridge *bridge;
 
@@ -69,7 +62,7 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 		out->bridge = local_bridge;
 	}
 
-	if (!out->next && !out->bridge) {
+	if (!out->bridge) {
 		ret = -EPROBE_DEFER;
 		goto error;
 	}
@@ -78,7 +71,6 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 
 error:
 	omapdss_device_cleanup_output(out);
-	out->next = NULL;
 	return ret;
 }
 EXPORT_SYMBOL(omapdss_device_init_output);
@@ -88,9 +80,6 @@ void omapdss_device_cleanup_output(struct omap_dss_device *out)
 	if (out->bridge && out->panel)
 		drm_panel_bridge_remove(out->next_bridge ?
 					out->next_bridge : out->bridge);
-
-	if (out->next)
-		omapdss_device_put(out->next);
 }
 EXPORT_SYMBOL(omapdss_device_cleanup_output);
 
diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index 610c5a2f2771..5f5fa01240a7 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -75,7 +75,6 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 {
 	struct omap_encoder *omap_encoder = to_omap_encoder(encoder);
 	struct omap_dss_device *output = omap_encoder->output;
-	struct omap_dss_device *dssdev;
 	struct drm_device *dev = encoder->dev;
 	struct drm_connector *connector;
 	struct drm_bridge *bridge;
@@ -98,9 +97,6 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 	 *
 	 * A better solution is to use DRM's bus-flags through the whole driver.
 	 */
-	for (dssdev = output; dssdev; dssdev = dssdev->next)
-		omap_encoder_update_videomode_flags(&vm, dssdev->bus_flags);
-
 	for (bridge = output->bridge; bridge;
 	     bridge = drm_bridge_get_next_bridge(bridge)) {
 		if (!bridge->timings)
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
