Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D0B8C1EB7
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 09:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF4010E651;
	Fri, 10 May 2024 07:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="S8MGmZjU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D00C10E5A9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 07:11:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 359FF1C0002;
 Fri, 10 May 2024 07:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715325095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sI8WmkUUHY9Zro8RyMVYK+yqLrqdOum7SUJ1HQ/OZVw=;
 b=S8MGmZjUpe2CwX481FBG08hduF7uyIkuMveONJYOOLVTHn6h+mgL63gD/zfNDOh/ulPrNJ
 QjXcTH0wLhv67CnH9sQYqNwkDGm1ZJFXlJxWjDUKc+019PVKtdH/vJ6+pIqBQwgxMopRqO
 uljWnYosVZ+6K4vRpwWQvruErgAmv4wTQaIfralTFZnbvarNOW39D1Cum+mw055ClKcjVe
 4d2GqJwpPNDGxX4z6DdYKyNApEbprbbgbbarmspN75ih1dWPtW2kxSVXLum/vxlXeEYazZ
 MdziLkwmauv5sc4QC9Rq9de8a2r230b4+KF27fXXUUlq3ikUzpn0jkvSeIbXew==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 10 May 2024 09:10:38 +0200
Subject: [PATCH v2 2/5] drm/bridge: add bridge notifier to be notified of
 bridge addition and removal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-hotplug-drm-bridge-v2-2-ec32f2c66d56@bootlin.com>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
In-Reply-To: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: luca.ceresoli@bootlin.com
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

From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

In preparation for allowing bridges to be added to and removed from a DRM
card without destroying the whole card, add a DRM bridge notifier. Notified
events are addition and removal to/from the global bridge list.

Co-developed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 35 +++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     | 19 +++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 521a71c61b16..245f7fa4ea22 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -25,6 +25,7 @@
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/notifier.h>
 
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
@@ -197,6 +198,36 @@
 
 static DEFINE_MUTEX(bridge_lock);
 static LIST_HEAD(bridge_list);
+static BLOCKING_NOTIFIER_HEAD(bridge_notifier);
+
+/**
+ * drm_bridge_notifier_register - add a DRM bridge notifier
+ * @nb: the notifier block to be registered
+ *
+ * The notifier block will be notified of events defined in
+ * &drm_bridge_notifier_event
+ */
+int drm_bridge_notifier_register(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&bridge_notifier, nb);
+}
+EXPORT_SYMBOL(drm_bridge_notifier_register);
+
+/**
+ * drm_bridge_notifier_unregister - remove a DRM bridge notifier
+ * @nb: the notifier block to be unregistered
+ */
+int drm_bridge_notifier_unregister(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&bridge_notifier, nb);
+}
+EXPORT_SYMBOL(drm_bridge_notifier_unregister);
+
+static void drm_bridge_notifier_notify(unsigned long event,
+				       struct drm_bridge *bridge)
+{
+	blocking_notifier_call_chain(&bridge_notifier, event, bridge);
+}
 
 /**
  * drm_bridge_add - add the given bridge to the global bridge list
@@ -210,6 +241,8 @@ void drm_bridge_add(struct drm_bridge *bridge)
 	mutex_lock(&bridge_lock);
 	list_add_tail(&bridge->list, &bridge_list);
 	mutex_unlock(&bridge_lock);
+
+	drm_bridge_notifier_notify(DRM_BRIDGE_NOTIFY_ADD, bridge);
 }
 EXPORT_SYMBOL(drm_bridge_add);
 
@@ -243,6 +276,8 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
  */
 void drm_bridge_remove(struct drm_bridge *bridge)
 {
+	drm_bridge_notifier_notify(DRM_BRIDGE_NOTIFY_REMOVE, bridge);
+
 	mutex_lock(&bridge_lock);
 	list_del_init(&bridge->list);
 	mutex_unlock(&bridge_lock);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4baca0d9107b..ee48c1eb76ae 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -43,6 +43,22 @@ struct drm_panel;
 struct edid;
 struct i2c_adapter;
 
+/**
+ * enum drm_bridge_notifier_event - DRM bridge events
+ */
+enum drm_bridge_notifier_event {
+	/**
+	 * @DRM_BRIDGE_NOTIFY_ADD: A bridge has just been added to the
+	 * global bridge list. See drm_bridge_add().
+	 */
+	DRM_BRIDGE_NOTIFY_ADD,
+	/**
+	 * @DRM_BRIDGE_NOTIFY_REMOVE: A bridge is about to be removed from
+	 * the global bridge list. See drm_bridge_remove().
+	 */
+	DRM_BRIDGE_NOTIFY_REMOVE,
+};
+
 /**
  * enum drm_bridge_attach_flags - Flags for &drm_bridge_funcs.attach
  */
@@ -781,6 +797,9 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
 	return container_of(priv, struct drm_bridge, base);
 }
 
+int drm_bridge_notifier_register(struct notifier_block *nb);
+int drm_bridge_notifier_unregister(struct notifier_block *nb);
+
 void drm_bridge_add(struct drm_bridge *bridge);
 int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge);
 void drm_bridge_remove(struct drm_bridge *bridge);

-- 
2.34.1

