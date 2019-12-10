Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4C1119EBE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 23:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32A66E9E5;
	Tue, 10 Dec 2019 22:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163026E9D6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:58:18 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E38831184;
 Tue, 10 Dec 2019 23:58:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576018696;
 bh=eYgz2duzYF1p+CJw9bGlTixbVVVvhh3XBlRLSyi72YQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=odz7uIDuxcoJDhW1TxOyKUknS5cg4PKxZWnl2B48WrMx8b9YFEV2IssDLHMCEO6y2
 nh7vf5W4glIbv8qG57RlHhjpRnUf7uou0uOCJPFqLmrmCbAtmAyOC7CVNc0iBP1GlK
 zxQDDulwQFuafco/Xjl02F/T+FU6AXn78+BFcL5k=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 13/50] drm/bridge: panel: Implement bridge connector
 operations
Date: Wed, 11 Dec 2019 00:57:13 +0200
Message-Id: <20191210225750.15709-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the newly added bridge connector operations, allowing the
usage of drm_bridge_panel with drm_bridge_connector.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Use the connector type from the panel instead of hardcoding it to DPI
- Rebased on top top of Sam's panel .get_modes() rework
---
 drivers/gpu/drm/bridge/panel.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 25c77cb24f42..cf4be369d75e 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -61,7 +61,7 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 	int ret;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
-		return -EINVAL;
+		return 0;
 
 	if (!bridge->encoder) {
 		DRM_ERROR("Missing encoder\n");
@@ -124,6 +124,14 @@ static void panel_bridge_post_disable(struct drm_bridge *bridge)
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
@@ -131,6 +139,7 @@ static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.enable = panel_bridge_enable,
 	.disable = panel_bridge_disable,
 	.post_disable = panel_bridge_post_disable,
+	.get_modes = panel_bridge_get_modes,
 };
 
 /**
@@ -200,6 +209,8 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
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
