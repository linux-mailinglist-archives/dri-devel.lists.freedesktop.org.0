Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B547A4B5D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 17:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0957C10E286;
	Mon, 18 Sep 2023 15:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8A810E286
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 15:01:05 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BF2C466072FB;
 Mon, 18 Sep 2023 16:01:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695049263;
 bh=4sbRG2aeCSqvnQfdgkb5xEWF2nVPvL6FiYhQyfisGCs=;
 h=From:To:Cc:Subject:Date:From;
 b=END5yvqWkPZ6TqXEEb3QXDyd6O9kk91YYcp4YfsHXOlfLL2esJhHnj4mo2svnZAKh
 wuR4OX6AGy7TOK3B+yAQ0vS13HNbM7lzqPC1U2fjYOFy+VrUa+ZQvJOx1LFPuHXbjc
 STDCAValnQVetcP6Ak8ZN6xop3bSG9fiUqhFX7rOReGAW40nGEIwU1AOPZMZLy1dCF
 vXZPbGbAo5CvaD4xQL3hFQD0gGHHV0jsbej1Lv1OgxbTkm6Lpngo7qi1A607Coc1B3
 Ps9gTBi/PCQBarc4wFN8GHr2VyxbqkJ6fKHlRSSeIVAqvEehbHSlYXff8MJUcxUs0F
 zy11qj6g+LheA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: andrzej.hajda@intel.com
Subject: [PATCH] drm/bridge: panel: Fix device link for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Mon, 18 Sep 2023 17:00:43 +0200
Message-ID: <20230918150043.403250-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
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
Cc: neil.armstrong@linaro.org, ulf.hansson@linaro.org, rfoss@kernel.org,
 jonas@kwiboo.se, victor.liu@nxp.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, ehristev@collabora.com,
 Laurent.pinchart@ideasonboard.com, wenst@chromium.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When external bridges are attached with DRM_BRIDGE_ATTACH_NO_CONNECTOR,
the panel bridge may also get the same flag, but in the .attach()
callback for the panel bridge a device link is added only when this
flag is not present; To make things worse, the .detach() callback
tries to delete the device link unconditionally and without checking
if it was created in the first place, crashing the kernel with a NULL
pointer kernel panic upon calling panel_bridge_detach().

Fix that by moving the device_link_add() call before checking if the
DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is present.

Fixes: 199cf07ebd2b ("drm/bridge: panel: Add a device link between drm device and panel device")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/bridge/panel.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index e00d2e94c751..8c507dfd589e 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -67,14 +67,6 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 	struct drm_device *drm_dev = bridge->dev;
 	int ret;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
-		return 0;
-
-	if (!bridge->encoder) {
-		DRM_ERROR("Missing encoder\n");
-		return -ENODEV;
-	}
-
 	panel_bridge->link = device_link_add(drm_dev->dev, panel->dev,
 					     DL_FLAG_STATELESS);
 	if (!panel_bridge->link) {
@@ -83,6 +75,14 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
+
+	if (!bridge->encoder) {
+		DRM_ERROR("Missing encoder\n");
+		return -ENODEV;
+	}
+
 	drm_connector_helper_add(connector,
 				 &panel_bridge_connector_helper_funcs);
 
-- 
2.42.0

