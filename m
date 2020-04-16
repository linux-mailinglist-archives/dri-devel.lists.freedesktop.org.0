Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7EC1AD69C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 09:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0926E362;
	Fri, 17 Apr 2020 06:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610AD6EB71
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 21:07:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 4501F2A23DF
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: panel: Return always an error pointer in
 drm_panel_bridge_add()
Date: Thu, 16 Apr 2020 23:06:54 +0200
Message-Id: <20200416210654.2468805-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Apr 2020 06:59:46 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Collabora Kernel ML <kernel@collabora.com>, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 89958b7cd955 ("drm/bridge: panel: Infer connector type from
panel by default"), drm_panel_bridge_add() and their variants can return
NULL and an error pointer. This is fine but none of the actual users of
the API are checking for the NULL value. Instead of change all the
users, seems reasonable to return an error pointer instead. So change
the returned value for those functions when the connector type is unknown.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 drivers/gpu/drm/bridge/panel.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 8461ee8304ba..7a3df0f319f3 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -166,7 +166,7 @@ static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
  *
  * The connector type is set to @panel->connector_type, which must be set to a
  * known type. Calling this function with a panel whose connector type is
- * DRM_MODE_CONNECTOR_Unknown will return NULL.
+ * DRM_MODE_CONNECTOR_Unknown will return ERR_PTR(-EINVAL).
  *
  * See devm_drm_panel_bridge_add() for an automatically managed version of this
  * function.
@@ -174,7 +174,7 @@ static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel)
 {
 	if (WARN_ON(panel->connector_type == DRM_MODE_CONNECTOR_Unknown))
-		return NULL;
+		return ERR_PTR(-EINVAL);
 
 	return drm_panel_bridge_add_typed(panel, panel->connector_type);
 }
@@ -265,7 +265,7 @@ struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
 					     struct drm_panel *panel)
 {
 	if (WARN_ON(panel->connector_type == DRM_MODE_CONNECTOR_Unknown))
-		return NULL;
+		return ERR_PTR(-EINVAL);
 
 	return devm_drm_panel_bridge_add_typed(dev, panel,
 					       panel->connector_type);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
