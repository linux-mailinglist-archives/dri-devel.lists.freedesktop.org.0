Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986CEBA4A8F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 18:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28BC10EAA3;
	Fri, 26 Sep 2025 16:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UQc9EmEw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A85910E18F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 16:35:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 686704E40E11;
 Fri, 26 Sep 2025 16:35:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3EBD9606B5;
 Fri, 26 Sep 2025 16:35:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 40313102F18CE; 
 Fri, 26 Sep 2025 18:35:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758904506; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6xVw/khtwiX9YEqRoJlZJqW1RWke6AJC8b2cUTe6EF4=;
 b=UQc9EmEwq8CeuvRpDVvNT+LRASjb0Nqr+P7f9zDqVMuUWvFi4hWxc1WDDzwGItwtZWJNdt
 TpFuTAAIbE+A5eO4BXnILDMzL5YC2H1dJUM6BEVk39vQ+gegdqm5HWRmCkr1o5X8J7q5+f
 kdq5fdMjbc/mQzZxLASB8sPjdXb9OhhSAsZ1+xOu54z3urts6qVMnfznsTEko9x9isPI8q
 6TKsKDQLmdm77Tzdq4S41ryzJ4KCXKn2SPmR88UXMGCntvX7kateFedm4jNV6ihl1JLh+P
 tZB2VUFFqKMv2F5VqNWygXcCtwP/ReY+ZqmE37GBiXbmVvaheCAa3ncm+mR1Yg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 26 Sep 2025 18:33:27 +0200
Subject: [PATCH v2 1/2] drm/bridge: add drm_bridge_unplug() and
 drm_bridge_enter/exit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-drm-bridge-atomic-vs-remove-v2-1-69f7d5ca1a92@bootlin.com>
References: <20250926-drm-bridge-atomic-vs-remove-v2-0-69f7d5ca1a92@bootlin.com>
In-Reply-To: <20250926-drm-bridge-atomic-vs-remove-v2-0-69f7d5ca1a92@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
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

To allow DRM bridges to be removable, add synchronization functions
allowing to tell when a bridge hardware has been physically unplugged and
to mark a critical section that should not be entered after that.

This is inspired by the drm_dev_unplugged/enter/exit() functions for struct
drm_device.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Link: https://lore.kernel.org/all/20250106-vigorous-talented-viper-fa49d9@houat/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 58 ++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     | 12 +++++++++
 2 files changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d031447eebc955efcf1e018d39c015b62b969eae..3ebf6cc820e058a67f712763c341a75c671c82d1 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -27,6 +27,7 @@
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/srcu.h>
 
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
@@ -200,6 +201,63 @@
 static DEFINE_MUTEX(bridge_lock);
 static LIST_HEAD(bridge_list);
 
+DEFINE_STATIC_SRCU(drm_bridge_unplug_srcu);
+
+/**
+ * drm_bridge_enter - Enter DRM bridge critical section
+ * @dev: DRM bridge
+ * @idx: Pointer to index that will be passed to the matching drm_bridge_exit()
+ *
+ * This function marks and protects the beginning of a section that should not
+ * be entered after the bridge has been unplugged. The section end is marked
+ * with drm_bridge_exit(). Calls to this function can be nested.
+ *
+ * Returns:
+ * True if it is OK to enter the section, false otherwise.
+ */
+bool drm_bridge_enter(struct drm_bridge *bridge, int *idx)
+{
+	*idx = srcu_read_lock(&drm_bridge_unplug_srcu);
+
+	if (bridge->unplugged) {
+		srcu_read_unlock(&drm_bridge_unplug_srcu, *idx);
+		return false;
+	}
+
+	return true;
+}
+EXPORT_SYMBOL(drm_bridge_enter);
+
+/**
+ * drm_bridge_exit - Exit DRM bridge critical section
+ * @idx: index returned by drm_bridge_enter()
+ *
+ * This function marks the end of a section that should not be entered after
+ * the bridge has been unplugged.
+ */
+void drm_bridge_exit(int idx)
+{
+	srcu_read_unlock(&drm_bridge_unplug_srcu, idx);
+}
+EXPORT_SYMBOL(drm_bridge_exit);
+
+/**
+ * drm_bridge_unplug - unplug a DRM bridge
+ * @dev: DRM bridge
+ *
+ * This tells the bridge has been physically unplugged and no operations on
+ * device resources must be done anymore. Entry-points can use
+ * drm_bridge_enter() and drm_bridge_exit() to protect device resources in
+ * a race free manner.
+ */
+void drm_bridge_unplug(struct drm_bridge *bridge)
+{
+	bridge->unplugged = true;
+
+	synchronize_srcu(&drm_bridge_unplug_srcu);
+}
+EXPORT_SYMBOL(drm_bridge_unplug);
+
 static void __drm_bridge_free(struct kref *kref)
 {
 	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 76e05930f50e00f6ef5999b3f5a476215951028d..6b325de9e41ba7ee3649eaa60dfe105d6155f824 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1143,6 +1143,14 @@ struct drm_bridge {
 	 */
 	struct kref refcount;
 
+	/**
+	 * @unplugged:
+	 *
+	 * Flag to tell if the bridge has been unplugged.
+	 * See drm_bridge_enter() and drm_bridge_unplug().
+	 */
+	bool unplugged;
+
 	/** @driver_private: pointer to the bridge driver's internal context */
 	void *driver_private;
 	/** @ops: bitmask of operations supported by the bridge */
@@ -1278,6 +1286,10 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
 	return container_of(priv, struct drm_bridge, base);
 }
 
+bool drm_bridge_enter(struct drm_bridge *bridge, int *idx);
+void drm_bridge_exit(int idx);
+void drm_bridge_unplug(struct drm_bridge *bridge);
+
 struct drm_bridge *drm_bridge_get(struct drm_bridge *bridge);
 void drm_bridge_put(struct drm_bridge *bridge);
 

-- 
2.51.0

