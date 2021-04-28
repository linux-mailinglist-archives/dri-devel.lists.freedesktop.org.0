Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CB836D840
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 15:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6A26EB39;
	Wed, 28 Apr 2021 13:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net
 [194.109.24.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5426E209
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 13:25:51 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id bkCIlVh38k1MGbkCLlOQ26; Wed, 28 Apr 2021 15:25:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1619616350; bh=I4LsuZDj0z9KwAm2teshrnmEJ0OYeIIsMWZiM81gqYM=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
 b=rXR99iZF8f0jV11tUSwXymXDk+wv4VtXiULdKdDyEAPu/gX8AGoOf+G3kMzs3D/GH
 v/YVwPd55wjde871b5PHg8XCgsSPopvwdYj5FUzkI5EWgyakuhpQXJ8SjAwrcxlyDi
 4DWAXtHB205kvmpb8Dsdr7wblAaRJwrTPuDKI8JZXnd2fjIBAlGT2yE8RqmPc+vuKy
 4jZOWnDzQQXM3FlGmDrbTklQGn1UEH85Dl2ADtUy15VYpEB4kBaQX7FkhxgjsvyvJl
 Olo/59K/LvRN271flVbKeimWCVDqNzdz9xapj8YiC+3PPZC+8LjOacEn+6KrHYOHPi
 lMFlh+rbd3pzA==
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv3 1/6] drm: drm_bridge: add connector_attach/detach bridge ops
Date: Wed, 28 Apr 2021 15:25:40 +0200
Message-Id: <20210428132545.1205162-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210428132545.1205162-1-hverkuil-cisco@xs4all.nl>
References: <20210428132545.1205162-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDrP3ZirMCC5KFdn7pW3xJT36GgiPiG8oeeu4v+ykvL72offX23YO3z9jC3Z5A3iJgqrCaTh5BINYHL/fl1+6UAf1q4tbQv7yIhj9XqiNc2oo44NuArH
 Qk7jEPGgOwdgTf7SXvj1thAzyMVO47e+ukXninKLi9hK1WEZZZfkFh6ZbFIgwIVyfEd7aYkmSNuFBHa+RVRKgGaW/EcwuECIPmYxUya8YrL1EZWBDPj0kwc/
 Bx4nGNi1jCHYtevo7SSe1i0AodVNrXmI8QC0rh9K6//bxK4LAiefiUoQzZ6WeXxUwZKJwKLGZ8oWBh5wYoXbZwaJvj6pFz7ERbjtOYft9pCDMMmTU23jKKQA
 TQpD6Js2iNFnXErB379sx6FxR+rMVw1saLg60AjHvr27i5dvrds8J7d40bqezwOZ8NaBhpMd
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
Cc: Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bridge connector_attach/detach ops. These ops are called when a
bridge is attached or detached to a drm_connector. These ops can be
used to register and unregister an HDMI CEC adapter for a bridge that
supports CEC.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/drm_bridge_connector.c | 25 +++++++++++++++++++++++-
 include/drm/drm_bridge.h               | 27 ++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 791379816837..0676677badfe 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -203,6 +203,11 @@ static void drm_bridge_connector_destroy(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge)
+		if (bridge->funcs->connector_detach)
+			bridge->funcs->connector_detach(bridge, connector);
 
 	if (bridge_connector->bridge_hpd) {
 		struct drm_bridge *hpd = bridge_connector->bridge_hpd;
@@ -318,6 +323,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct i2c_adapter *ddc = NULL;
 	struct drm_bridge *bridge;
 	int connector_type;
+	int ret;
 
 	bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
 	if (!bridge_connector)
@@ -375,6 +381,23 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		connector->polled = DRM_CONNECTOR_POLL_CONNECT
 				  | DRM_CONNECTOR_POLL_DISCONNECT;
 
-	return connector;
+	ret = 0;
+	/* call connector_attach for all bridges */
+	drm_for_each_bridge_in_chain(encoder, bridge) {
+		if (!bridge->funcs->connector_attach)
+			continue;
+		ret = bridge->funcs->connector_attach(bridge, connector);
+		if (ret)
+			break;
+	}
+	if (!ret)
+		return connector;
+
+	/* on error, detach any previously successfully attached connectors */
+	list_for_each_entry_continue_reverse(bridge, &(encoder)->bridge_chain,
+					     chain_node)
+		if (bridge->funcs->connector_detach)
+			bridge->funcs->connector_detach(bridge, connector);
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 2195daa289d2..333fbc3a03e9 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -629,6 +629,33 @@ struct drm_bridge_funcs {
 	 * the DRM_BRIDGE_OP_HPD flag in their &drm_bridge->ops.
 	 */
 	void (*hpd_disable)(struct drm_bridge *bridge);
+
+	/**
+	 * @connector_attach:
+	 *
+	 * This callback is invoked whenever our bridge is being attached to a
+	 * &drm_connector. This is where an HDMI CEC adapter can be registered.
+	 *
+	 * The @connector_attach callback is optional.
+	 *
+	 * RETURNS:
+	 *
+	 * Zero on success, error code on failure.
+	 */
+	int (*connector_attach)(struct drm_bridge *bridge,
+				struct drm_connector *conn);
+
+	/**
+	 * @connector_detach:
+	 *
+	 * This callback is invoked whenever our bridge is being detached from a
+	 * &drm_connector. This is where an HDMI CEC adapter can be
+	 * unregistered.
+	 *
+	 * The @connector_detach callback is optional.
+	 */
+	void (*connector_detach)(struct drm_bridge *bridge,
+				 struct drm_connector *conn);
 };
 
 /**
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
