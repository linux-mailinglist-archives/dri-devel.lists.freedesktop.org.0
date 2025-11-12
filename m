Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FC4C536B1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 17:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FE110E77C;
	Wed, 12 Nov 2025 16:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="N5q44cJc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1365310E77A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 16:34:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B06E31A1A42;
 Wed, 12 Nov 2025 16:34:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 801DF6070B;
 Wed, 12 Nov 2025 16:34:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0D1DD102F084F; Wed, 12 Nov 2025 17:34:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762965292; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=AbBF9YK95hha/G3M+Fz+28OT4bWjR1IMawslI9+BHEU=;
 b=N5q44cJcURD+I6ZaGZujoY1LJ5r+oAAO9Dn/gr8R9vqI56UPqbOCi5YrhPJwh9oijOD6Ay
 zoRctqubfuVasY/rqGGVY/SK55fhWBh/60qss3SrDtXSUUuPiKZj+cPsJz+qJ4QdrEL3tZ
 q4b3nra6CdfdshIGXnTN5oWiimBDKoP2045flPsJH6oKIim+a3EWx6xMRXsEj4fzSKiqbZ
 coxHQdv9wghleS1WepYu3/3pOBZUTHviW2Oinv3gSSFpnxK+fr21OezJU0sN8DV9gTeuTs
 a0MRxSR5/SMlTzDhxOh+3vNxMqOQOb4hUk83sgPpMFmk+h2m1FcoOntk/hvt9w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 12 Nov 2025 17:34:34 +0100
Subject: [PATCH v3 1/2] drm/bridge: add drm_bridge_unplug() and
 drm_bridge_enter/exit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-drm-bridge-atomic-vs-remove-v3-1-85db717ce094@bootlin.com>
References: <20251112-drm-bridge-atomic-vs-remove-v3-0-85db717ce094@bootlin.com>
In-Reply-To: <20251112-drm-bridge-atomic-vs-remove-v3-0-85db717ce094@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
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

Changes in v3:
- call drm_bridge_remove() in drm_bridge_unplug()
- Fixed kerneldoc variable names (reported here:
  https://lore.kernel.org/lkml/202509271654.j3IsjsAJ-lkp@intel.com/)
---
 drivers/gpu/drm/drm_bridge.c | 62 ++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     | 12 +++++++++
 2 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 8f355df883d8ac8de9d361ec302f4ccbf3bca0d6..db40c26d1cb354f818f12a5a53f9baa6a7fc3574 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -27,6 +27,7 @@
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/srcu.h>
 
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
@@ -202,6 +203,67 @@ static DEFINE_MUTEX(bridge_lock);
 static LIST_HEAD(bridge_list);
 static LIST_HEAD(bridge_lingering_list);
 
+DEFINE_STATIC_SRCU(drm_bridge_unplug_srcu);
+
+/**
+ * drm_bridge_enter - Enter DRM bridge critical section
+ * @bridge: DRM bridge
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
+ * drm_bridge_unplug - declare a DRM bridge was unplugged and remove it
+ * @bridge: DRM bridge
+ *
+ * This tells the bridge has been physically unplugged and no operations on
+ * device resources must be done anymore. Entry-points can use
+ * drm_bridge_enter() and drm_bridge_exit() to protect device resources in
+ * a race free manner.
+ *
+ * Also unregisters the bridge.
+ */
+void drm_bridge_unplug(struct drm_bridge *bridge)
+{
+	bridge->unplugged = true;
+
+	synchronize_srcu(&drm_bridge_unplug_srcu);
+
+	drm_bridge_remove(bridge);
+}
+EXPORT_SYMBOL(drm_bridge_unplug);
+
 static void __drm_bridge_free(struct kref *kref)
 {
 	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 0ff7ab4aa8689a022458f935a7ffb23a2b715802..d2683846cc619007f85a6f605b9d23ce971e04b3 100644
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
2.51.1

