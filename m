Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7C2B9A801
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 17:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DAC10E74C;
	Wed, 24 Sep 2025 15:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VrFz0L9o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A3510E74B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 15:11:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 200CBC011C4;
 Wed, 24 Sep 2025 15:11:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3C47B60634;
 Wed, 24 Sep 2025 15:11:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B0B6D102F1979; 
 Wed, 24 Sep 2025 17:11:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758726702; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=Oyd7mxpQpGZEIT9VImfQifpqR5vXWnAg+ZLzNdsxxOI=;
 b=VrFz0L9oXdbzHIZes4H5QrDxYUlAy2Qzm+Z/NhnMLWEdU4API5rygTdulKqxWVexsjNIFc
 E3djMhjEJsCQ+QYP0ADdnZg+zmxYYLmhg3alE7ER1PyEgGDpE7mdQqIFtOHe02nHnzUyZX
 RFpiTZ7p5bfZzIGBAhJLlGO3eTAXqdAbq2QwzYQJxvC93xbgfG1ZEP8VIA3vd+2LocyrnF
 97DYBTx5E/Q0m99xVJnMZNuTYdflr4bJXuCcbSW66q4xeUmGnt0vaif94U7/ruyCesI4u0
 KdkuipB4Pd+ymjzBwovh23xiAc6QCyGUJ/z1jy20wbkTNA84w3jAiVXfurM3ww==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 24 Sep 2025 17:11:01 +0200
Subject: [PATCH] drm/bridge: refcount last_bridge in
 drm_atomic_bridge_chain_select_bus_fmts()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-b4-drm-bridge-alloc-getput-drm_atomic_bridge_chain_select_bus_fmts-v1-1-f8c2efdb783f@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAQK1GgC/yWO2wrCMBBEf6Xk2UCMUdRfkbLksq0LuZRsKkLpv
 xv18cyBmdkEYyVkcR82UfFFTCV3OB4G4Z82zygpdBZa6bO6aSOdkaEm6SqFLm2MxcsZ27K2bw6
 2lUQe/hp6BWVgjOgbuJVhSo3lFU/uopTxDrXoQ0vFid6/E49x3z/NJuQUlAAAAA==
X-Change-ID: 20250924-b4-drm-bridge-alloc-getput-drm_atomic_bridge_chain_select_bus_fmts-8e3b6004cbe2
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

Get a reference for the last_bridge when it is obtained and release it
using a cleanup action.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 630b5e6594e0affad9ba48791207c7b403da5db8..53e7ece36dd940aabd1c0880f296fce7224a12ac 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1086,12 +1086,12 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_bridge_state *last_bridge_state;
 	unsigned int i, num_out_bus_fmts = 0;
-	struct drm_bridge *last_bridge;
 	u32 *out_bus_fmts;
 	int ret = 0;
 
-	last_bridge = list_last_entry(&encoder->bridge_chain,
-				      struct drm_bridge, chain_node);
+	struct drm_bridge *last_bridge __free(drm_bridge_put) =
+		drm_bridge_get(list_last_entry(&encoder->bridge_chain,
+					       struct drm_bridge, chain_node));
 	last_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
 							    last_bridge);
 

---
base-commit: 90315cd293f321ada7bbd43a59636716e102d68a
change-id: 20250924-b4-drm-bridge-alloc-getput-drm_atomic_bridge_chain_select_bus_fmts-8e3b6004cbe2

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

