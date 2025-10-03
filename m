Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7988BB675F
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 12:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F5710E38F;
	Fri,  3 Oct 2025 10:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="p9TdMw1G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E1410E268
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 10:39:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id F0C7D4E40E8F;
 Fri,  3 Oct 2025 10:39:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BAA3660683;
 Fri,  3 Oct 2025 10:39:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2FEB4102F1C67; 
 Fri,  3 Oct 2025 12:39:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759487987; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=nYh+hMqLvgQPGb4l+T5RHzaDkje85oxW7gyHSJVOEyk=;
 b=p9TdMw1Gf8V95fW1JXIcKNKN7CwpKX7/i5q/eVjG4WlejLRCsdSFWXzXpIWbN1sfpLvo6I
 DndD/pIvCGMHlkQH0qXxLOZvsftvxA8d27USabCFYud25LKhrTYeYi0rL+VqXsDMOCsAeh
 DepIdILCD+6S5CuALcPvgEPF2TTsvA86rP8WabDAmh7oKVG58oNvdikoIEFgikLoYoQ8M9
 1UyC1Vhftgc2p2gYY1tFZsEGWXDqb7xuag1UUv21+89A6qdHX0nKFUP/xU9OQ2idVMIWKZ
 WoBRqvETRvS04TcXqDfHjnhpjgTYgT2BleVHC5y7WGkwoeGFMTQF/NVgNFMH6Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 03 Oct 2025 12:39:26 +0200
Subject: [PATCH v2 4/7] drm/bridge: lock the encoder chain in scoped
 for_each loops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-4-78bf61580a06@bootlin.com>
References: <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-0-78bf61580a06@bootlin.com>
In-Reply-To: <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-0-78bf61580a06@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
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

drm_for_each_bridge_in_chain_scoped() and
drm_for_each_bridge_in_chain_from() currently get/put the bridge at each
iteration. But they don't protect the encoder chain, so it could change
(bridges added/removed) while some code is iterating over the list
itself. To make iterations safe, change the logic of these for_each macros
to lock the encoder chain mutex at the beginning and unlock it at the end
of the loop (be it at the end of the list, or earlier due to a 'break' or
'return' statement).

Also remove the get/put on the current bridge because it is not needed
anymore. In fact all bridges in the encoder chain are refcounted already
thanks to the drm_bridge_get() in drm_bridge_attach() and the
drm_bridge_put() in drm_bridge_detach(). So while iterating with the mutex
held the list cannot change _and_ the refcount of all bridges in the list
cannot drop to zero.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v2:
- Fixed infinite loop in drm_for_each_bridge_in_chain_scoped() when
  encoder->bridge_chain is empty, reported here:
  https://lore.kernel.org/lkml/202509301358.38036b85-lkp@intel.com/
- Slightly improved commit message
---
 include/drm/drm_bridge.h | 62 ++++++++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 29 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 0ff7ab4aa8689a022458f935a7ffb23a2b715802..5a72817f04a78f5379f69e72fe519c5eb3ea043e 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1440,26 +1440,29 @@ drm_bridge_chain_get_last_bridge(struct drm_encoder *encoder)
 						      struct drm_bridge, chain_node));
 }
 
-/**
- * drm_bridge_get_next_bridge_and_put - Get the next bridge in the chain
- *                                      and put the previous
- * @bridge: bridge object
- *
- * Same as drm_bridge_get_next_bridge() but additionally puts the @bridge.
- *
- * RETURNS:
- * the next bridge in the chain after @bridge, or NULL if @bridge is the last.
- */
-static inline struct drm_bridge *
-drm_bridge_get_next_bridge_and_put(struct drm_bridge *bridge)
+static inline struct drm_bridge *drm_bridge_encoder_chain_lock(struct drm_bridge *bridge)
 {
-	struct drm_bridge *next = drm_bridge_get_next_bridge(bridge);
+	drm_encoder_chain_lock(bridge->encoder);
+
+	return bridge;
+}
 
-	drm_bridge_put(bridge);
+/* Internal to drm_for_each_bridge_in_chain*() */
+static inline struct drm_bridge *__drm_encoder_bridge_chain_next(struct drm_bridge *bridge)
+{
+	if (list_is_last(&bridge->chain_node, &bridge->encoder->bridge_chain)) {
+		drm_encoder_chain_unlock(bridge->encoder);
 
-	return next;
+		return NULL;
+	}
+
+	return list_next_entry(bridge, chain_node);
 }
 
+/* Internal to drm_for_each_bridge_in_chain*() */
+DEFINE_FREE(drm_bridge_encoder_chain_unlock, struct drm_bridge *,
+	    if (_T) drm_encoder_chain_unlock(_T->encoder);)
+
 /**
  * drm_for_each_bridge_in_chain_scoped - iterate over all bridges attached
  *                                       to an encoder
@@ -1469,14 +1472,15 @@ drm_bridge_get_next_bridge_and_put(struct drm_bridge *bridge)
  *
  * Iterate over all bridges present in the bridge chain attached to @encoder.
  *
- * Automatically gets/puts the bridge reference while iterating, and puts
- * the reference even if returning or breaking in the middle of the loop.
+ * Automatically locks the encoder chain mutex to prevent chain
+ * modifications while iterating.
  */
-#define drm_for_each_bridge_in_chain_scoped(encoder, bridge)		\
-	for (struct drm_bridge *bridge __free(drm_bridge_put) =		\
-	     drm_bridge_chain_get_first_bridge(encoder);		\
-	     bridge;							\
-	     bridge = drm_bridge_get_next_bridge_and_put(bridge))
+#define drm_for_each_bridge_in_chain_scoped(encoder, bridge)					\
+	for (struct drm_bridge *bridge __free(drm_bridge_encoder_chain_unlock) =		\
+		     list_first_entry_or_null(&drm_encoder_chain_lock(encoder)->bridge_chain,	\
+					      struct drm_bridge, chain_node);			\
+	     bridge;										\
+	     bridge = __drm_encoder_bridge_chain_next(bridge))					\
 
 /**
  * drm_for_each_bridge_in_chain_from - iterate over all bridges starting
@@ -1488,14 +1492,14 @@ drm_bridge_get_next_bridge_and_put(struct drm_bridge *bridge)
  * Iterate over all bridges in the encoder chain starting from
  * @first_bridge, included.
  *
- * Automatically gets/puts the bridge reference while iterating, and puts
- * the reference even if returning or breaking in the middle of the loop.
+ * Automatically locks the encoder chain mutex to prevent chain
+ * modifications while iterating.
  */
-#define drm_for_each_bridge_in_chain_from(first_bridge, bridge)		\
-	for (struct drm_bridge *bridge __free(drm_bridge_put) =		\
-		     drm_bridge_get(first_bridge);			\
-	     bridge;							\
-	     bridge = drm_bridge_get_next_bridge_and_put(bridge))
+#define drm_for_each_bridge_in_chain_from(first_bridge, bridge)				\
+	for (struct drm_bridge *bridge __free(drm_bridge_encoder_chain_unlock) =	\
+		     drm_bridge_encoder_chain_lock(first_bridge);			\
+	     bridge;									\
+	     bridge = __drm_encoder_bridge_chain_next(bridge))				\
 
 enum drm_mode_status
 drm_bridge_chain_mode_valid(struct drm_bridge *bridge,

-- 
2.51.0

