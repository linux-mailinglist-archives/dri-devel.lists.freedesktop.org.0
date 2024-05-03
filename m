Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 910348BB105
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 18:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A61113141;
	Fri,  3 May 2024 16:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="J8uOfXc+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04AC5113141
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 16:41:25 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714754484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7dZRACv1mGtltLnFfXv8cRlXiLzMJI2QNtXc82HhDoA=;
 b=J8uOfXc+V1d/2OHNoBJh0QiVOOgt9GA9OIEd1aUZ5VWGSJmCXprAyi9ir3LXP/5Yl94Hlk
 n7IHseMWoqYiOsRCm5b3N5pVN30mxkb4Gr5SA0mQsH1OvrhaH5KqRSm5Kx5dSDjas0iWDR
 y/ItN03ne4HYBH8tHUrfTJkUSwmldKY=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v5 01/10] drm/bridge: Allow using fwnode APIs to get the next
 bridge
Date: Sat,  4 May 2024 00:40:57 +0800
Message-Id: <20240503164106.1172650-2-sui.jingfeng@linux.dev>
In-Reply-To: <20240503164106.1172650-1-sui.jingfeng@linux.dev>
References: <20240503164106.1172650-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The various display bridge drivers rely on 'OF' infrastructures to
works very well, yet there are some platforms and/or devices lack of
'OF' support. Such as virtual display drivers, USB display apapters
and ACPI based systems etc.

Add fwnode based helpers to fill the niche, this allows part of display
bridge drivers to work across systems. As the fwnode APIs has wider
coverage than DT counterpart, and fwnode graphs are compatible with
OF graphs. So the newly created helpers can be used on all systems
in theory, assumed that there has valid OF/fwnode graphs established.

Note, the involved drm bridge instance should also has the fwnode
assigned, so that the user of it could find it via the fwnode handle.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/drm_bridge.c | 74 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     |  8 ++++
 2 files changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 28abe9aa99ca..fc1a314140e7 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1368,6 +1368,80 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 EXPORT_SYMBOL(of_drm_find_bridge);
 #endif
 
+/**
+ * drm_bridge_find_by_fwnode - Find the bridge corresponding to the fwnode
+ *
+ * @fwnode: fwnode for which to find the matching drm_bridge
+ *
+ * This function looks up a drm_bridge in the global bridge list, based on
+ * its associated fwnode. Drivers who want to use this function should has
+ * fwnode handle assigned to the fwnode member of the struct drm_bridge
+ * instance.
+ *
+ * Returns:
+ *  * A reference to the requested drm_bridge object on success, or
+ *  * %NULL otherwise (object does not exist or the driver of requested
+ *    bridge not probed yet).
+ */
+struct drm_bridge *drm_bridge_find_by_fwnode(struct fwnode_handle *fwnode)
+{
+	struct drm_bridge *ret = NULL;
+	struct drm_bridge *bridge;
+
+	if (!fwnode)
+		return NULL;
+
+	mutex_lock(&bridge_lock);
+
+	list_for_each_entry(bridge, &bridge_list, list) {
+		if (bridge->fwnode == fwnode) {
+			ret = bridge;
+			break;
+		}
+	}
+
+	mutex_unlock(&bridge_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_bridge_find_by_fwnode);
+
+/**
+ * drm_bridge_find_next_bridge_by_fwnode - Find the next bridge by fwnode
+ * @fwnode: fwnode pointer to the current device.
+ * @port: identifier of the port node of the next bridge is connected.
+ *
+ * This function find the next bridge at the current node, it assumed that
+ * there has valid fwnode graph established.
+ *
+ * Returns:
+ *  * A reference to the requested drm_bridge object on success, or
+ *  * -%EINVAL or -%ENODEV if the fwnode graph or OF graph is not complete, or
+ *  * %NULL if object does not exist or the next bridge is not probed yet.
+ */
+struct drm_bridge *
+drm_bridge_find_next_bridge_by_fwnode(struct fwnode_handle *fwnode, u32 port)
+{
+	struct drm_bridge *bridge;
+	struct fwnode_handle *ep;
+	struct fwnode_handle *remote;
+
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, port, 0, 0);
+	if (!ep)
+		return ERR_PTR(-EINVAL);
+
+	remote = fwnode_graph_get_remote_port_parent(ep);
+	fwnode_handle_put(ep);
+	if (!remote)
+		return ERR_PTR(-ENODEV);
+
+	bridge = drm_bridge_find_by_fwnode(remote);
+	fwnode_handle_put(remote);
+
+	return bridge;
+}
+EXPORT_SYMBOL_GPL(drm_bridge_find_next_bridge_by_fwnode);
+
 MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
 MODULE_DESCRIPTION("DRM bridge infrastructure");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4baca0d9107b..a1bb19425761 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -721,6 +721,8 @@ struct drm_bridge {
 	struct list_head chain_node;
 	/** @of_node: device node pointer to the bridge */
 	struct device_node *of_node;
+	/** @fwnode: fwnode pointer to the bridge */
+	struct fwnode_handle *fwnode;
 	/** @list: to keep track of all added bridges */
 	struct list_head list;
 	/**
@@ -797,6 +799,12 @@ static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 }
 #endif
 
+struct drm_bridge *
+drm_bridge_find_by_fwnode(struct fwnode_handle *fwnode);
+
+struct drm_bridge *
+drm_bridge_find_next_bridge_by_fwnode(struct fwnode_handle *fwnode, u32 port);
+
 /**
  * drm_bridge_get_next_bridge() - Get the next bridge in the chain
  * @bridge: bridge object
-- 
2.34.1

