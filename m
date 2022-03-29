Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF7F4EAE74
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 15:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC7F10F0AB;
	Tue, 29 Mar 2022 13:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676DF10F0AB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 13:27:49 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3D20F40010;
 Tue, 29 Mar 2022 13:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648560467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=N2uL2iTnjVonVjgJItIcBn1T3SzQzmi/Fa83pTHnlu0=;
 b=TsA786HUDRn7oGtJu7nkgILmG7pLT8+7dqjTuzxea0m4IyARXi0Wu2ck6r95WZkJh/eXMz
 4ZNxq6K338MMiaCrTSlCEtWbyI3+VoqNDBSTmtSTBvSU/ebOFVcoGiEq9YFiV7y/yNo7X+
 47pphDSrJQ5PQPxSF/mVamOP9jNDzDORKtRLNh0jHkyL0t7TaV8Y1eHEOWv607v5pCiyTW
 0K4X/ssETvMb13hyqt07pxQpka8hnTURhZrBM3nIfinkWzHjTi6EPRrC1nFKterP1CRDTl
 oY/qswOuMtgIp8O7vH/qAnHeNDV/W5nUF4F3elFnvdiKwbpInXUT+8Au/Igmjg==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm: of: Properly try all possible cases for bridge/panel
 detection
Date: Tue, 29 Mar 2022 15:27:32 +0200
Message-Id: <20220329132732.628474-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While bridge/panel detection was initially relying on the usual
port/ports-based of graph detection, it was recently changed to
perform the lookup on any child node that is not port/ports
instead when such a node is available, with no fallback on the
usual way.

This results in breaking detection when a child node is present
but does not contain any panel or bridge node, even when the
usual port/ports-based of graph is there.

In order to support both situations properly, this commit reworks
the logic to try both options and not just one of the two: it will
only return -EPROBE_DEFER when both have failed.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Fixes: 80253168dbfd ("drm: of: Lookup if child node has panel or bridge")
---

Changes since v2:
- Removed unnecessary else statement and added a comment about
  clearing the panel pointer on error.

Changes since v1:
- Renamed remote to node;
- Renamed helper to find_panel_or_bridge;
- Cleared bridge pointer early;
- Returned early to make the code more concise;

---
 drivers/gpu/drm/drm_of.c | 99 ++++++++++++++++++++--------------------
 1 file changed, 50 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 9d90cd75c457..8716da6369a6 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -219,6 +219,29 @@ int drm_of_encoder_active_endpoint(struct device_node *node,
 }
 EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
 
+static int find_panel_or_bridge(struct device_node *node,
+				struct drm_panel **panel,
+				struct drm_bridge **bridge)
+{
+	if (panel) {
+		*panel = of_drm_find_panel(node);
+		if (!IS_ERR(*panel))
+			return 0;
+
+		/* Clear the panel pointer in case of error. */
+		*panel = NULL;
+	}
+
+	/* No panel found yet, check for a bridge next. */
+	if (bridge) {
+		*bridge = of_drm_find_bridge(node);
+		if (*bridge)
+			return 0;
+	}
+
+	return -EPROBE_DEFER;
+}
+
 /**
  * drm_of_find_panel_or_bridge - return connected panel or bridge device
  * @np: device tree node containing encoder output ports
@@ -241,66 +264,44 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				struct drm_panel **panel,
 				struct drm_bridge **bridge)
 {
-	int ret = -EPROBE_DEFER;
-	struct device_node *remote;
+	struct device_node *node;
+	int ret;
 
 	if (!panel && !bridge)
 		return -EINVAL;
+
 	if (panel)
 		*panel = NULL;
-
-	/**
-	 * Devices can also be child nodes when we also control that device
-	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
-	 *
-	 * Lookup for a child node of the given parent that isn't either port
-	 * or ports.
-	 */
-	for_each_available_child_of_node(np, remote) {
-		if (of_node_name_eq(remote, "port") ||
-		    of_node_name_eq(remote, "ports"))
-			continue;
-
-		goto of_find_panel_or_bridge;
+	if (bridge)
+		*bridge = NULL;
+
+	/* Check for a graph on the device node first. */
+	if (of_graph_is_present(np)) {
+		node = of_graph_get_remote_node(np, port, endpoint);
+		if (node) {
+			ret = find_panel_or_bridge(node, panel, bridge);
+			of_node_put(node);
+
+			if (!ret)
+				return 0;
+		}
 	}
 
-	/*
-	 * of_graph_get_remote_node() produces a noisy error message if port
-	 * node isn't found and the absence of the port is a legit case here,
-	 * so at first we silently check whether graph presents in the
-	 * device-tree node.
-	 */
-	if (!of_graph_is_present(np))
-		return -ENODEV;
-
-	remote = of_graph_get_remote_node(np, port, endpoint);
-
-of_find_panel_or_bridge:
-	if (!remote)
-		return -ENODEV;
+	/* Otherwise check for any child node other than port/ports. */
+	for_each_available_child_of_node(np, node) {
+		if (of_node_name_eq(node, "port") ||
+		    of_node_name_eq(node, "ports"))
+			continue;
 
-	if (panel) {
-		*panel = of_drm_find_panel(remote);
-		if (!IS_ERR(*panel))
-			ret = 0;
-		else
-			*panel = NULL;
-	}
-
-	/* No panel found yet, check for a bridge next. */
-	if (bridge) {
-		if (ret) {
-			*bridge = of_drm_find_bridge(remote);
-			if (*bridge)
-				ret = 0;
-		} else {
-			*bridge = NULL;
-		}
+		ret = find_panel_or_bridge(node, panel, bridge);
+		of_node_put(node);
 
+		/* Stop at the first found occurrence. */
+		if (!ret)
+			return 0;
 	}
 
-	of_node_put(remote);
-	return ret;
+	return -EPROBE_DEFER;
 }
 EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
 
-- 
2.35.1

