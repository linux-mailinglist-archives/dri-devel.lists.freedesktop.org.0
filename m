Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F91F4DDD70
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 17:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC64310E2D0;
	Fri, 18 Mar 2022 16:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262F810E2D0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 16:03:04 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 565E81C0003;
 Fri, 18 Mar 2022 16:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647619383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9LCyO4ZeV4D1HkpUM5CtcxANfcmtzF+DEYKQhTlGfIU=;
 b=ocD7OJMqhqSqoXXVWORr9+FjnQVAGBTRQtnrn49FmdWlOtnfx0f8Mg3n9lYPj55My4JAWH
 DiSImPl/7ba1vNaeKwsx0SIcNDvGN3Pmzzzdv80b1MkFHjqSMVvy4i1t3t/6/csrLdHUqd
 lzLgeA/FYWACnLCrwrLuzf+QobWPFdKH82u46KI82HJMpiggy1E1ae2NWlPMgkQhHGTA9U
 WiuagoitmpoeHjTm7+ZZSKo6L0ZMepSzdsvB5TYk8GIoYIqsPTp3Fz8WugjFEdT2hvwGnS
 PebDndy3PVkgeMfsno3oZjQATzx+1RiswPUNWn64QKPAoTVMnouSWZgBInJDrw==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm: of: Properly try all possible cases for bridge/panel
 detection
Date: Fri, 18 Mar 2022 17:02:49 +0100
Message-Id: <20220318160249.126431-1-paul.kocialkowski@bootlin.com>
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

Changes since v1:
- Renamed remote to node;
- Renamed helper to find_panel_or_bridge;
- Cleared bridge pointer early;
- Returned early to make the code more concise;

---
 drivers/gpu/drm/drm_of.c | 98 ++++++++++++++++++++--------------------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 9d90cd75c457..63137c833b7a 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -219,6 +219,28 @@ int drm_of_encoder_active_endpoint(struct device_node *node,
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
+		else
+			*panel = NULL;
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
@@ -241,66 +263,44 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
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
-
-	if (panel) {
-		*panel = of_drm_find_panel(remote);
-		if (!IS_ERR(*panel))
-			ret = 0;
-		else
-			*panel = NULL;
-	}
+	/* Otherwise check for any child node other than port/ports. */
+	for_each_available_child_of_node(np, node) {
+		if (of_node_name_eq(node, "port") ||
+		    of_node_name_eq(node, "ports"))
+			continue;
 
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

