Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE934D3104
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 15:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E4510ED8B;
	Wed,  9 Mar 2022 14:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1215 seconds by postgrey-1.36 at gabe;
 Wed, 09 Mar 2022 14:32:12 UTC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BCD10ED8B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 14:32:11 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F3C35FF810;
 Wed,  9 Mar 2022 14:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646836330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4yNE8unHQFaK7qSnkWkqczTG141cySTJ7pfi48d6wGI=;
 b=JSLpwvLwjh4zr2SARMq3/4EKIuKAzfnLT6dtVBbpVJSI9lfj+AdtHbu3lQ0KqXdK1Zdm7r
 p3uRrHJFghTZBLI/FfjKZ8hO3w2S0jk1ihjRUlmgNn9hk7bg0gHvreyBuAkaVfHfF9b/qm
 rP8UJm+DJpbSKqfyQqmgyyl4ocFMel5r+g3QXrsm7SyIknIa2SsJd0S/pGcVp+oMH+/j2g
 Ke/ycL7pqtg2h+6Ka51h1fmJySwkg6Evvn6qBnsdwIEgRn2iE2HZceYW3mv0MKwXIMD8nb
 fpQIKa5Ttw95A+dtOJR6mPicRQheMthKZsGHEKuwSg0JxDDuXNyVnEKgZveTkQ==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm: of: Properly try all possible cases for bridge/panel
 detection
Date: Wed,  9 Mar 2022 15:32:00 +0100
Message-Id: <20220309143200.111292-1-paul.kocialkowski@bootlin.com>
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
 drivers/gpu/drm/drm_of.c | 93 +++++++++++++++++++++-------------------
 1 file changed, 49 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 9d90cd75c457..67f1b7dfc892 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -219,6 +219,35 @@ int drm_of_encoder_active_endpoint(struct device_node *node,
 }
 EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
 
+static int drm_of_find_remote_panel_or_bridge(struct device_node *remote,
+					      struct drm_panel **panel,
+					      struct drm_bridge **bridge)
+{
+	int ret = -EPROBE_DEFER;
+
+	if (panel) {
+		*panel = of_drm_find_panel(remote);
+		if (!IS_ERR(*panel))
+			ret = 0;
+		else
+			*panel = NULL;
+	}
+
+	/* No panel found yet, check for a bridge next. */
+	if (bridge) {
+		if (ret) {
+			*bridge = of_drm_find_bridge(remote);
+			if (*bridge)
+				ret = 0;
+		} else {
+			*bridge = NULL;
+		}
+
+	}
+
+	return ret;
+}
+
 /**
  * drm_of_find_panel_or_bridge - return connected panel or bridge device
  * @np: device tree node containing encoder output ports
@@ -249,57 +278,33 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 	if (panel)
 		*panel = NULL;
 
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
+	/* Check for a graph on the device node first. */
+	if (of_graph_is_present(np)) {
+		remote = of_graph_get_remote_node(np, port, endpoint);
+		if (remote) {
+			ret = drm_of_find_remote_panel_or_bridge(remote, panel,
+								 bridge);
+			of_node_put(remote);
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
+	if (ret) {
+		for_each_available_child_of_node(np, remote) {
+			if (of_node_name_eq(remote, "port") ||
+			    of_node_name_eq(remote, "ports"))
+				continue;
 
-	if (panel) {
-		*panel = of_drm_find_panel(remote);
-		if (!IS_ERR(*panel))
-			ret = 0;
-		else
-			*panel = NULL;
-	}
+			ret = drm_of_find_remote_panel_or_bridge(remote, panel,
+								 bridge);
+			of_node_put(remote);
 
-	/* No panel found yet, check for a bridge next. */
-	if (bridge) {
-		if (ret) {
-			*bridge = of_drm_find_bridge(remote);
-			if (*bridge)
-				ret = 0;
-		} else {
-			*bridge = NULL;
+			/* Stop at the first found occurrence. */
+			if (!ret)
+				break;
 		}
-
 	}
 
-	of_node_put(remote);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
-- 
2.35.1

