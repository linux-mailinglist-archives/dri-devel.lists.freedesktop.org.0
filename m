Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 747B3160671
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 22:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13B56E34B;
	Sun, 16 Feb 2020 21:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41016E34B
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 21:03:47 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38606D9A;
 Sun, 16 Feb 2020 22:03:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1581887026;
 bh=z4mBgyD1ond1QaUqQPqENiKt+9n3tK5jw/cJpbyLfOk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ekC+2p4ojDUU8IfIaS+ao9AcbFNMjlLlV+R0zKqbZordDurZSMnX96JNaiFpdWxLl
 rxpvNKdbpXiVjgTLWTBTE1cEcKoL9WhQEDmlFo1jNH6kzapCNQtaPxFIu31CU+QXHE
 zcWAKqWkudPbRIPfT/fu0R4g0xZQglPr2nBpihNI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 14/51] drm/bridge: panel: Implement bridge connector
 operations
Date: Sun, 16 Feb 2020 23:02:31 +0200
Message-Id: <20200216210308.17312-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
References: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the newly added bridge connector operations, allowing the
usage of drm_bridge_panel with drm_bridge_connector.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
Changes since v2:

- Use the connector type from the panel instead of hardcoding it to DPI
- Rebased on top top of Sam's panel .get_modes() rework
---
 drivers/gpu/drm/bridge/panel.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 81017b4afe25..bbc212cc53ac 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -60,10 +60,8 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 	struct drm_connector *connector = &panel_bridge->connector;
 	int ret;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
 
 	if (!bridge->encoder) {
 		DRM_ERROR("Missing encoder\n");
@@ -126,6 +124,14 @@ static void panel_bridge_post_disable(struct drm_bridge *bridge)
 	drm_panel_unprepare(panel_bridge->panel);
 }
 
+static int panel_bridge_get_modes(struct drm_bridge *bridge,
+				  struct drm_connector *connector)
+{
+	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
+
+	return drm_panel_get_modes(panel_bridge->panel, connector);
+}
+
 static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.attach = panel_bridge_attach,
 	.detach = panel_bridge_detach,
@@ -133,6 +139,7 @@ static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.enable = panel_bridge_enable,
 	.disable = panel_bridge_disable,
 	.post_disable = panel_bridge_post_disable,
+	.get_modes = panel_bridge_get_modes,
 };
 
 /**
@@ -202,6 +209,8 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 #ifdef CONFIG_OF
 	panel_bridge->bridge.of_node = panel->dev->of_node;
 #endif
+	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
+	panel_bridge->bridge.type = connector_type;
 
 	drm_bridge_add(&panel_bridge->bridge);
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
