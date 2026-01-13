Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3B1D1AE29
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 19:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6593610E531;
	Tue, 13 Jan 2026 18:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DJ5CPyEL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919C110E530
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 18:47:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 854DA1A283E;
 Tue, 13 Jan 2026 18:47:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 553936075F;
 Tue, 13 Jan 2026 18:47:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7F57B103C8707; Tue, 13 Jan 2026 19:47:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768330052; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7WXp3t4en/N2gz9isbtng0HaQOEi821ijFkC1dJtqcU=;
 b=DJ5CPyEL4Mz72zlKR+8bHlU0UapbFLkbYAYVOFmYVcoam1pZMGozm6WFWTG9IJZtbvDNMy
 ia60mf5yPZlnc9jSEZxz/m5bXbR0CwEEqgpGRaFbbh9eRU8YWFRNVoJcpGvZBK/Ig7fgBp
 1JTDmpoYCybdJzAlUQuFn5UjwY09+WuDByWdCuTI6k8Lq1LIl6sxbD6cyDvApOJaZkX3gJ
 JCa2Ooa9rp4K/tVBWzjeDXhUEjld36IeCvNzXrFLoDr20T4B8rMO1bEQd9Ab6wQt23GmNh
 hJRKRihMlUQDe7uu2vmEncojpoc6NrxRqVWoJ3WTiBuz0fb/ExRjChxcUl1OHQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 13 Jan 2026 19:47:15 +0100
Subject: [PATCH RESEND v4 4/7] drm/bridge: lock the encoder chain in scoped
 for_each loops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-drm-bridge-alloc-encoder-chain-mutex-v4-4-60f3135adc45@bootlin.com>
References: <20260113-drm-bridge-alloc-encoder-chain-mutex-v4-0-60f3135adc45@bootlin.com>
In-Reply-To: <20260113-drm-bridge-alloc-encoder-chain-mutex-v4-0-60f3135adc45@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Ian Ray <ian.ray@gehealthcare.com>
X-Mailer: b4 0.14.3
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
itself. Such code can then derail on incorrect pointers.

To make iterations safe, augment these for_each macros to lock the encoder
chain mutex at the beginning and unlock it at the end of the loop (be it at
the end of the list, or earlier due to a 'break' or 'return' statement).

This change requires more operations when starting and ending the loop. To
avoid making the macros even more complex, move these operations to helper
functions. Also remname some of the existing helper functions for
consistency.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v4:
- Slightly improve kerneldoc to clarify a bridge reference is held in
  addition to the mutex

Changed in v3:
- Re-add drm_bridge_get/put()

Changed in v2:
- Fixed infinite loop in drm_for_each_bridge_in_chain_scoped() when
  encoder->bridge_chain is empty, reported here:
  https://lore.kernel.org/lkml/202509301358.38036b85-lkp@intel.com/
- Slightly improved commit message
---
 include/drm/drm_bridge.h | 73 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 47 insertions(+), 26 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 0ff7ab4aa868..3d26dde1ac81 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1440,26 +1440,37 @@ drm_bridge_chain_get_last_bridge(struct drm_encoder *encoder)
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
+/* Internal to drm_for_each_bridge_in_chain*() */
+static inline struct drm_bridge *__drm_for_each_bridge_in_chain_next(struct drm_bridge *bridge)
 {
 	struct drm_bridge *next = drm_bridge_get_next_bridge(bridge);
 
+	if (!next)
+		mutex_unlock(&bridge->encoder->bridge_chain_mutex);
+
 	drm_bridge_put(bridge);
 
 	return next;
 }
 
+/* Internal to drm_for_each_bridge_in_chain*() */
+DEFINE_FREE(__drm_for_each_bridge_in_chain_cleanup, struct drm_bridge *,
+	if (_T) { mutex_unlock(&_T->encoder->bridge_chain_mutex); drm_bridge_put(_T); })
+
+/* Internal to drm_for_each_bridge_in_chain_scoped() */
+static inline struct drm_bridge *
+__drm_for_each_bridge_in_chain_scoped_start(struct drm_encoder *encoder)
+{
+	mutex_lock(&encoder->bridge_chain_mutex);
+
+	struct drm_bridge *bridge = drm_bridge_chain_get_first_bridge(encoder);
+
+	if (!bridge)
+		mutex_unlock(&encoder->bridge_chain_mutex);
+
+	return bridge;
+}
+
 /**
  * drm_for_each_bridge_in_chain_scoped - iterate over all bridges attached
  *                                       to an encoder
@@ -1469,14 +1480,24 @@ drm_bridge_get_next_bridge_and_put(struct drm_bridge *bridge)
  *
  * Iterate over all bridges present in the bridge chain attached to @encoder.
  *
- * Automatically gets/puts the bridge reference while iterating, and puts
- * the reference even if returning or breaking in the middle of the loop.
+ * Automatically gets/puts the bridge reference while iterating and locks
+ * the encoder chain mutex to prevent chain modifications while iterating.
  */
-#define drm_for_each_bridge_in_chain_scoped(encoder, bridge)		\
-	for (struct drm_bridge *bridge __free(drm_bridge_put) =		\
-	     drm_bridge_chain_get_first_bridge(encoder);		\
-	     bridge;							\
-	     bridge = drm_bridge_get_next_bridge_and_put(bridge))
+#define drm_for_each_bridge_in_chain_scoped(encoder, bridge)				\
+	for (struct drm_bridge *bridge __free(__drm_for_each_bridge_in_chain_cleanup) =	\
+		__drm_for_each_bridge_in_chain_scoped_start((encoder));			\
+	     bridge;									\
+	     bridge = __drm_for_each_bridge_in_chain_next(bridge))			\
+
+/* Internal to drm_for_each_bridge_in_chain_from() */
+static inline struct drm_bridge *
+__drm_for_each_bridge_in_chain_from_start(struct drm_bridge *bridge)
+{
+	drm_bridge_get(bridge);
+	mutex_lock(&bridge->encoder->bridge_chain_mutex);
+
+	return bridge;
+}
 
 /**
  * drm_for_each_bridge_in_chain_from - iterate over all bridges starting
@@ -1488,14 +1509,14 @@ drm_bridge_get_next_bridge_and_put(struct drm_bridge *bridge)
  * Iterate over all bridges in the encoder chain starting from
  * @first_bridge, included.
  *
- * Automatically gets/puts the bridge reference while iterating, and puts
- * the reference even if returning or breaking in the middle of the loop.
+ * Automatically gets/puts the bridge reference while iterating and locks
+ * the encoder chain mutex to prevent chain modifications while iterating.
  */
-#define drm_for_each_bridge_in_chain_from(first_bridge, bridge)		\
-	for (struct drm_bridge *bridge __free(drm_bridge_put) =		\
-		     drm_bridge_get(first_bridge);			\
-	     bridge;							\
-	     bridge = drm_bridge_get_next_bridge_and_put(bridge))
+#define drm_for_each_bridge_in_chain_from(first_bridge, bridge)				\
+	for (struct drm_bridge *bridge __free(__drm_for_each_bridge_in_chain_cleanup) =	\
+		__drm_for_each_bridge_in_chain_from_start(first_bridge);		\
+	     bridge;									\
+	     bridge = __drm_for_each_bridge_in_chain_next(bridge))			\
 
 enum drm_mode_status
 drm_bridge_chain_mode_valid(struct drm_bridge *bridge,

-- 
2.52.0

