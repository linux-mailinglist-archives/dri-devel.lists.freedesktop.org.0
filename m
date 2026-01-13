Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B03D1AE3E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 19:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A9710E535;
	Tue, 13 Jan 2026 18:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="zxn3en61";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE12010E535
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 18:47:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DB3341A283C;
 Tue, 13 Jan 2026 18:47:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B20E260701;
 Tue, 13 Jan 2026 18:47:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 107E1103C871A; Tue, 13 Jan 2026 19:47:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768330056; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dzUppabWL92ubQUZhFXAzHoT9lyZRb6BD9mDAHq16fA=;
 b=zxn3en61kmIXe5o7kG+ogBYNR2D5f5ro+DjUuhOwDxpPo3DOgAosWK/FgKPfA4ZHXWs0re
 voQAP48dEbd5eGLs5X7IC+0a9pXu3Ourep5bMMIpVkJrTzGUr6LuVCsCUTYOubpv85tWHl
 0NIMoSYny9DtRF6NZVr3L/6twQKa+zPgMFaI0rc5f4n06YopOwqG8SLl/r2hYBuNOYQG9f
 h9QrT5aezVUaqFo/NFpt6pvbhbkH/eg7pdQvcfLJ8W84P//v3YWz/9ZJwnKnoUMlmGaP/y
 iECmH9glhdK4I64pQFrzKU/IE6ZSetdq+u7jS3aZn5KmGzfBaTLw3Fs7DF+5jQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 13 Jan 2026 19:47:17 +0100
Subject: [PATCH RESEND v4 6/7] drm/bridge: prevent encoder chain changes
 while iterating with list_for_each_entry_reverse()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-drm-bridge-alloc-encoder-chain-mutex-v4-6-60f3135adc45@bootlin.com>
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

These loops in drm_bridge.c iterate over the encoder chain using
list_for_each_entry_reverse(), which does not prevent changes to the bridge
chain while iterating over it.

Take the encoder chain mutex while iterating to avoid chain changes while
iterating.

All the "simple" loops are converted. drm_atomic_bridge_chain_pre_enable()
and drm_atomic_bridge_chain_post_disable() are handled by a separate
commit.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- Lock encoder->bridge_chain_mutex directly, no wrappers

Changes in v2: none
---
 drivers/gpu/drm/drm_bridge.c | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 9b4a075b5361..eca138eadbc5 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -710,6 +710,7 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 		return;
 
 	encoder = bridge->encoder;
+	mutex_lock(&encoder->bridge_chain_mutex);
 	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
 		if (iter->funcs->atomic_disable) {
 			iter->funcs->atomic_disable(iter, state);
@@ -720,6 +721,7 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 		if (iter == bridge)
 			break;
 	}
+	mutex_unlock(&encoder->bridge_chain_mutex);
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
 
@@ -1224,25 +1226,27 @@ int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
 		return ret;
 
 	encoder = bridge->encoder;
-	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		int ret;
-
-		/*
-		 * Bus flags are propagated by default. If a bridge needs to
-		 * tweak the input bus flags for any reason, it should happen
-		 * in its &drm_bridge_funcs.atomic_check() implementation such
-		 * that preceding bridges in the chain can propagate the new
-		 * bus flags.
-		 */
-		drm_atomic_bridge_propagate_bus_flags(iter, conn,
-						      crtc_state->state);
-
-		ret = drm_atomic_bridge_check(iter, crtc_state, conn_state);
-		if (ret)
-			return ret;
+	scoped_guard(mutex, &encoder->bridge_chain_mutex) {
+		list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
+			int ret;
+
+			/*
+			 * Bus flags are propagated by default. If a bridge needs to
+			 * tweak the input bus flags for any reason, it should happen
+			 * in its &drm_bridge_funcs.atomic_check() implementation such
+			 * that preceding bridges in the chain can propagate the new
+			 * bus flags.
+			 */
+			drm_atomic_bridge_propagate_bus_flags(iter, conn,
+							      crtc_state->state);
+
+			ret = drm_atomic_bridge_check(iter, crtc_state, conn_state);
+			if (ret)
+				return ret;
 
-		if (iter == bridge)
-			break;
+			if (iter == bridge)
+				break;
+		}
 	}
 
 	return 0;

-- 
2.52.0

