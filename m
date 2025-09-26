Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D620BA4868
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 18:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1D910EA8F;
	Fri, 26 Sep 2025 16:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YPFU0VV8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FBF10EA92
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 16:00:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 557214E40E0D;
 Fri, 26 Sep 2025 16:00:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2A51E606B5;
 Fri, 26 Sep 2025 16:00:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A0758102F197D; 
 Fri, 26 Sep 2025 18:00:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758902448; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ff9fZeQb1F7MsGgDHiibGZyIrv+Z1+eAxMY8Mv7A+RM=;
 b=YPFU0VV8h/9XJmajQkQbiSnoYqjzbO/+CZRytTgjsHNm1mRgcjZoBdvtsRlhxghUlK58l1
 RqEbEpBV1lsTnUwOZXnDKfEJT+TP0UfzQLp5ucnmcC0T2DtKkO/Z3z896+/RUv2cDwf41I
 YmNUjxgdE2AF7cPDcc0QV5z4EVBzM1kWcZ/6o9uDCIIMomPYQgUO5gj1jRhMmvGgB2aJNu
 6XywxGEOd1EcoR3+dQsS1qDBCIuU1m+Q/SsT6+3wziFzDHmLmVLhXmcQV20QloNVhLvmd0
 FVeH6GXFPhoeMgJyYkGDnxuYNumPBDt0hampa7FY9HFMgWPLRBuGSIqevnJtmA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 26 Sep 2025 17:59:44 +0200
Subject: [PATCH 3/7] drm/bridge: lock the encoder bridge chain mutex during
 insertion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-3-23b62c47356a@bootlin.com>
References: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-0-23b62c47356a@bootlin.com>
In-Reply-To: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-0-23b62c47356a@bootlin.com>
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

drm_bridge_attach() modifies the encoder bridge chain, so take a mutex
around such operations to allow users of the chain to protect themselves
from chain modifications while iterating.

This change does not apply to drm_bridge_detach() because:
 * only the drm_encoder.c calls it, not bridge drivers (unlike
   drm_bridge_attach())
 * the only drm_bridge_detach() caller is drm_encoder_cleanup() which
   already locks the mutex for the entire cleanup loop, thus additionally
   locking it here would deadlock
 * drm_bridge_detach() is recursively calling itself along the chain, so
   care would be needed to avoid deadlocks
Add a comment to clarify that is intended.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 630b5e6594e0affad9ba48791207c7b403da5db8..90e467cf91a134342c80d2f958b928472aaf0d8b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -453,10 +453,12 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	bridge->dev = encoder->dev;
 	bridge->encoder = encoder;
 
+	drm_encoder_chain_lock(encoder);
 	if (previous)
 		list_add(&bridge->chain_node, &previous->chain_node);
 	else
 		list_add(&bridge->chain_node, &encoder->bridge_chain);
+	drm_encoder_chain_unlock(encoder);
 
 	if (bridge->funcs->attach) {
 		ret = bridge->funcs->attach(bridge, encoder, flags);
@@ -487,7 +489,9 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 err_reset_bridge:
 	bridge->dev = NULL;
 	bridge->encoder = NULL;
+	drm_encoder_chain_lock(encoder);
 	list_del(&bridge->chain_node);
+	drm_encoder_chain_unlock(encoder);
 
 	if (ret != -EPROBE_DEFER)
 		DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
@@ -503,6 +507,11 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_bridge_attach);
 
+/*
+ * Invoked by the encoder during encoder cleanup in drm_encoder_cleanup(),
+ * so should generally *not* be called by driver code. As opposed to
+ * drm_bridge_attach(), does not lock the encoder chain mutex.
+ */
 void drm_bridge_detach(struct drm_bridge *bridge)
 {
 	if (WARN_ON(!bridge))

-- 
2.51.0

