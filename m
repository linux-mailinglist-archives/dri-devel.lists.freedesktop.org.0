Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 763324F7BBF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7632410E775;
	Thu,  7 Apr 2022 09:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0808810E765
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:34:26 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4F6FE240003;
 Thu,  7 Apr 2022 09:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649324064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=1QZGZ1l8/R6LZhl//SEGQRr/cjfdJ4XRWOzBWhSBo4I=;
 b=E0RlPrFXWSHAXPNxV2G21nu0veHQpr26sTTRKSYUb1XKBVxKJVi4xUpdsBFHnjoWGApEUC
 umKFnAhmhvCBpt+LvvamJ8rkTiq+WMqwcBagV2COABEPuDEcp23nx7LNZSQOjzZGqnzY3S
 XMZYEaIJAbX/azduTrkHP1SHWwxzGmG2iPmifpxpFjzUzNW3fZFyyBns7bRD8t4N0fhBDt
 RL2rsXPfW2eCcQbokZ/s0x2KwpEyG8zcv/JSPaTp4qJaI3a4aT2DtfnCD5HSOLqzqU8M83
 v4oV3rOV13JSuHv6MsmVl/aIZhJc0HTie6N+OdeS7WQAb1ISSXkRUSWPvijwlA==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm: of: Improve error handling in bridge/panel detection
Date: Thu,  7 Apr 2022 11:34:08 +0200
Message-Id: <20220407093408.1478769-1-paul.kocialkowski@bootlin.com>
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
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the previous rework of drm_of_find_panel_or_bridge only
-EPROBE_DEFER is returned while previous behavior allowed -ENODEV
to be returned when the port/endpoint is either missing or unavailable.

Make the default return code of the function -ENODEV to handle this and
only return -EPROBE_DEFER in find_panel_or_bridge when the of device is
available but not yet registered. Also return the error code whenever
the remote node exists to avoid checking for child nodes.

Checking child nodes could result in -EPROBE_DEFER returned by
find_panel_or_bridge with an unrelated child node that would overwrite
a legitimate -ENODEV from find_panel_or_bridge if the remote node from
the of graph is unavailable. This happens because find_panel_or_bridge
has no way to distinguish between a legitimate panel/bridge node that
isn't yet registered and an unrelated node.

Add comments around to clarify this behavior.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Fixes: 67bae5f28c89 ("drm: of: Properly try all possible cases for bridge/panel detection")
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

---
 drivers/gpu/drm/drm_of.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 8716da6369a6..97ea9d2016ff 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -223,6 +223,9 @@ static int find_panel_or_bridge(struct device_node *node,
 				struct drm_panel **panel,
 				struct drm_bridge **bridge)
 {
+	if (!of_device_is_available(node))
+		return -ENODEV;
+
 	if (panel) {
 		*panel = of_drm_find_panel(node);
 		if (!IS_ERR(*panel))
@@ -265,7 +268,7 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				struct drm_bridge **bridge)
 {
 	struct device_node *node;
-	int ret;
+	int ret = -ENODEV;
 
 	if (!panel && !bridge)
 		return -EINVAL;
@@ -282,8 +285,12 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 			ret = find_panel_or_bridge(node, panel, bridge);
 			of_node_put(node);
 
-			if (!ret)
-				return 0;
+			/*
+			 * If the graph/remote node is present we consider it
+			 * to be the legitimate candidate here and return
+			 * whatever code we got from find_panel_or_bridge.
+			 */
+			return ret;
 		}
 	}
 
@@ -296,12 +303,18 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 		ret = find_panel_or_bridge(node, panel, bridge);
 		of_node_put(node);
 
-		/* Stop at the first found occurrence. */
+		/*
+		 * Note that an unrelated (available) child node will cause
+		 * find_panel_or_bridge to return -EPROBE_DEFER because there
+		 * is no way to distinguish the node from a legitimate
+		 * panel/bridge that didn't register yet. Keep iterating nodes
+		 * and only return on the first found occurrence.
+		 */
 		if (!ret)
 			return 0;
 	}
 
-	return -EPROBE_DEFER;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
 
-- 
2.35.1

