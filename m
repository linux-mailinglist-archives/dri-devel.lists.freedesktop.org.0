Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598FD8C58F5
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 17:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0D510EADC;
	Tue, 14 May 2024 15:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="b83KCb1T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEB610E401
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 15:40:59 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715701257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+05gkzCN5mCB4ObLHZD3qVmOLfaIYvz5ahLIgbHM3dE=;
 b=b83KCb1Tg0IIJh0e+PTZYsvu7sHmyZ4628WaUjPak1hG/ZRyuUFvR1VUsHAjehi6J8w9qx
 dwr1xixVGf18AG0ajiDQLreUdugxBgiy670YKjD/OnIwyo8WHskKETATD4OA1isHD5uGBW
 FALM0ULUBiAVMAthwhdJMzKbtD5A8xI=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH 1/2] drm/bridge: Support finding bridge with struct device
Date: Tue, 14 May 2024 23:40:44 +0800
Message-ID: <20240514154045.309925-2-sui.jingfeng@linux.dev>
In-Reply-To: <20240514154045.309925-1-sui.jingfeng@linux.dev>
References: <20240514154045.309925-1-sui.jingfeng@linux.dev>
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

The pointer of 'struct device' can also be used as a key to search drm
bridge instance from the global bridge list, traditionally, fwnode and
'OF' based APIs requires the system has decent fwnode/OF Graph support.
While the drm_find_bridge_by_dev() function introduced in this series
don't has such a restriction. It only require you has a pointer to the
backing device. Hence, it may suitable for some small and/or limited
display subsystems.

Also add the drm_bridge_add_with_dev() as a helper, which automatically
set the .of_node field of drm_bridge instances if you call it. But it
suitable for simple bridge drivers which one device backing one drm_bridge
instance.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/drm_bridge.c | 39 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     |  5 +++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 584d109330ab..1928d9d0dd3c 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -213,6 +213,23 @@ void drm_bridge_add(struct drm_bridge *bridge)
 }
 EXPORT_SYMBOL(drm_bridge_add);
 
+/**
+ * drm_bridge_add_with_dev - add the given bridge to the global bridge list
+ *
+ * @bridge: bridge control structure
+ * @dev: pointer to the kernel device that this bridge is backed.
+ */
+void drm_bridge_add_with_dev(struct drm_bridge *bridge, struct device *dev)
+{
+	if (dev) {
+		bridge->kdev = dev;
+		bridge->of_node = dev->of_node;
+	}
+
+	drm_bridge_add(bridge);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_add_with_dev);
+
 static void drm_bridge_remove_void(void *bridge)
 {
 	drm_bridge_remove(bridge);
@@ -1334,6 +1351,27 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
 
+struct drm_bridge *drm_find_bridge_by_dev(struct device *kdev)
+{
+	struct drm_bridge *bridge;
+
+	if (!kdev)
+		return NULL;
+
+	mutex_lock(&bridge_lock);
+
+	list_for_each_entry(bridge, &bridge_list, list) {
+		if (bridge->kdev == kdev) {
+			mutex_unlock(&bridge_lock);
+			return bridge;
+		}
+	}
+
+	mutex_unlock(&bridge_lock);
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(drm_find_bridge_by_dev);
+
 #ifdef CONFIG_OF
 /**
  * of_drm_find_bridge - find the bridge corresponding to the device node in
@@ -1361,6 +1399,7 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 	return NULL;
 }
 EXPORT_SYMBOL(of_drm_find_bridge);
+
 #endif
 
 MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4baca0d9107b..70d8393bbd9c 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -715,6 +715,8 @@ struct drm_bridge {
 	struct drm_private_obj base;
 	/** @dev: DRM device this bridge belongs to */
 	struct drm_device *dev;
+	/** @kdev: pointer to the kernel device backing this bridge */
+	struct device *kdev;
 	/** @encoder: encoder to which this bridge is connected */
 	struct drm_encoder *encoder;
 	/** @chain_node: used to form a bridge chain */
@@ -782,12 +784,15 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
 }
 
 void drm_bridge_add(struct drm_bridge *bridge);
+void drm_bridge_add_with_dev(struct drm_bridge *bridge, struct device *dev);
 int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge);
 void drm_bridge_remove(struct drm_bridge *bridge);
 int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      struct drm_bridge *previous,
 		      enum drm_bridge_attach_flags flags);
 
+struct drm_bridge *drm_find_bridge_by_dev(struct device *kdev);
+
 #ifdef CONFIG_OF
 struct drm_bridge *of_drm_find_bridge(struct device_node *np);
 #else
-- 
2.43.0

