Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB5FBB6762
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 12:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEE910E390;
	Fri,  3 Oct 2025 10:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="qrfYhE/2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1063E10E233
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 10:39:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C4FF6C00D98;
 Fri,  3 Oct 2025 10:39:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C566960683;
 Fri,  3 Oct 2025 10:39:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5D3DE102F1C6B; 
 Fri,  3 Oct 2025 12:39:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759487990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Zmn0YvDl/BoxozrvJssctltfT6XEmoHzgDyceLIjDFM=;
 b=qrfYhE/2ATcIGh6d/xFu0jQfqV3erjx060Rp0WfllFSTeCYQwjgB3VIigkT/muGVfI0gZF
 WDImGR2LHN/STRTNm40jEMQHN2EBdyP8W3YKyvvY9gkMpjYdtuxFK104Fn3YvzsETrTa18
 +U9spZV7bZ/+hoJwR5lqINg9QKqR1k9+Nbvup6p7BwX/sMBJ/o9CXv7AJx0Rv87AHsXsJH
 muWizwpYO1RXxyv6obtlPnExnK65ibt8srcgzdmYVGAaDbFcArduLljfui23ak18A7huCF
 nN0clzArTsU9l3OXvTNL8FFjdACp0UtQyLGZZEkx1ibgpLM8WkhNxI705dIzqA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 03 Oct 2025 12:39:27 +0200
Subject: [PATCH v2 5/7] drm/bridge: prevent encoder chain changes while
 iterating with list_for_each_entry_from()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-5-78bf61580a06@bootlin.com>
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

These loops in drm_bridge.c iterate over the encoder chain using
list_for_each_entry_from(), which does not prevent changes to the bridge
chain while iterating over it.

Convert most of those loops to instead use
drm_for_each_bridge_in_chain_from(), which locks the chain.

This also simplifies code.

All the "simple" loops are converted here. The only ones not touched are
those in drm_atomic_bridge_chain_pre_enable() and
drm_atomic_bridge_chain_post_disable(), because they have nested loops
which are not well handled by drm_for_each_bridge_in_chain_from(). These
two functions are handled by a separate commit.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 35 ++++++++++++-----------------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d2ab7cef0b768b0ff674a77977833da27133912f..be38dd7eefed0539795f721738e1f1df324d9a6f 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -618,7 +618,7 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 /**
  * drm_bridge_chain_mode_valid - validate the mode against all bridges in the
  *				 encoder chain.
- * @bridge: bridge control structure
+ * @first_bridge: bridge control structure
  * @info: display info against which the mode shall be validated
  * @mode: desired mode to be validated
  *
@@ -632,17 +632,14 @@ void drm_bridge_detach(struct drm_bridge *bridge)
  * MODE_OK on success, drm_mode_status Enum error code on failure
  */
 enum drm_mode_status
-drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
+drm_bridge_chain_mode_valid(struct drm_bridge *first_bridge,
 			    const struct drm_display_info *info,
 			    const struct drm_display_mode *mode)
 {
-	struct drm_encoder *encoder;
-
-	if (!bridge)
+	if (!first_bridge)
 		return MODE_OK;
 
-	encoder = bridge->encoder;
-	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
+	drm_for_each_bridge_in_chain_from(first_bridge, bridge) {
 		enum drm_mode_status ret;
 
 		if (!bridge->funcs->mode_valid)
@@ -660,7 +657,7 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_valid);
 /**
  * drm_bridge_chain_mode_set - set proposed mode for all bridges in the
  *			       encoder chain
- * @bridge: bridge control structure
+ * @first_bridge: bridge control structure
  * @mode: desired mode to be set for the encoder chain
  * @adjusted_mode: updated mode that works for this encoder chain
  *
@@ -669,20 +666,16 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_valid);
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
-void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
+void drm_bridge_chain_mode_set(struct drm_bridge *first_bridge,
 			       const struct drm_display_mode *mode,
 			       const struct drm_display_mode *adjusted_mode)
 {
-	struct drm_encoder *encoder;
-
-	if (!bridge)
+	if (!first_bridge)
 		return;
 
-	encoder = bridge->encoder;
-	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
+	drm_for_each_bridge_in_chain_from(first_bridge, bridge)
 		if (bridge->funcs->mode_set)
 			bridge->funcs->mode_set(bridge, mode, adjusted_mode);
-	}
 }
 EXPORT_SYMBOL(drm_bridge_chain_mode_set);
 
@@ -906,7 +899,7 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
 
 /**
  * drm_atomic_bridge_chain_enable - enables all bridges in the encoder chain
- * @bridge: bridge control structure
+ * @first_bridge: bridge control structure
  * @state: atomic state being committed
  *
  * Calls &drm_bridge_funcs.atomic_enable (falls back on
@@ -916,22 +909,18 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
-void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
+void drm_atomic_bridge_chain_enable(struct drm_bridge *first_bridge,
 				    struct drm_atomic_state *state)
 {
-	struct drm_encoder *encoder;
-
-	if (!bridge)
+	if (!first_bridge)
 		return;
 
-	encoder = bridge->encoder;
-	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
+	drm_for_each_bridge_in_chain_from(first_bridge, bridge)
 		if (bridge->funcs->atomic_enable) {
 			bridge->funcs->atomic_enable(bridge, state);
 		} else if (bridge->funcs->enable) {
 			bridge->funcs->enable(bridge);
 		}
-	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
 

-- 
2.51.0

