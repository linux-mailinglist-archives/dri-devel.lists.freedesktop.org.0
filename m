Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DCF836ABC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 17:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199F510F5ED;
	Mon, 22 Jan 2024 16:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com
 [95.215.58.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5221810F5ED
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:33:02 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1705941150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ZyqSCinvSiL4fDcqtQAts8Vz4wSQZ3zHH00t6lYeGc=;
 b=TfmmHLC0CAWOqzvzLqf1L/MTDspqvJzrDKRUwwMzj7inwa16XjnR2Tc2kGpy8/XOtAxC5y
 FZ/z5XqynfDN2uwB1h9t1103vC4umTIdhWDG2mMkQerFy1k2CqdwtFg5La3Azbyq64MW9l
 5EUs+pR2o4Mq+U2jhmcAvoamKOVYCRY=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH 1/5] drm/bridge: Add drm_bridge_find_by_fwnode() helper
Date: Tue, 23 Jan 2024 00:32:16 +0800
Message-Id: <20240122163220.110788-2-sui.jingfeng@linux.dev>
In-Reply-To: <20240122163220.110788-1-sui.jingfeng@linux.dev>
References: <20240122163220.110788-1-sui.jingfeng@linux.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because ACPI based systems only has the fwnode associated, the of_node
member of struct device is NULL. To order to move things forward, we add
drm_bridge_find_by_fwnode() to extend the support.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/drm_bridge.c | 33 +++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     |  4 ++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index cee3188adf3d..ffd969adc2fb 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1347,6 +1347,39 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 EXPORT_SYMBOL(of_drm_find_bridge);
 #endif
 
+/**
+ * drm_bridge_find_by_fwnode - Find the bridge corresponding to the associated fwnode
+ *
+ * @fwnode: fwnode for which to find the matching drm_bridge
+ *
+ * This function looks up a drm_bridge based on its associated fwnode.
+ *
+ * RETURNS:
+ * A reference to the drm_bridge control structure if found, NULL on failure.
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
+EXPORT_SYMBOL(drm_bridge_find_by_fwnode);
+
 MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
 MODULE_DESCRIPTION("DRM bridge infrastructure");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index e39da5807ba7..fe3d5f4bf37f 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -720,6 +720,8 @@ struct drm_bridge {
 	struct list_head chain_node;
 	/** @of_node: device node pointer to the bridge */
 	struct device_node *of_node;
+	/** @fwnode: associated fwnode supplied by platform firmware */
+	struct fwnode_handle *fwnode;
 	/** @list: to keep track of all added bridges */
 	struct list_head list;
 	/**
@@ -796,6 +798,8 @@ static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 }
 #endif
 
+struct drm_bridge *drm_bridge_find_by_fwnode(struct fwnode_handle *fwnode);
+
 /**
  * drm_bridge_get_next_bridge() - Get the next bridge in the chain
  * @bridge: bridge object
-- 
2.25.1

