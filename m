Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F198C314E
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 14:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D044F10E00D;
	Sat, 11 May 2024 12:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Rnl2UFX/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com
 [95.215.58.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F6C10E00D
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 12:42:56 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715431374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5Mlk8jFKvoypD9IZYpI3BVSdxetHEe1rriO0cIJzkmo=;
 b=Rnl2UFX/CCFkmjgSw8t9xem4X/DuUT4GTH4ZefCtr3W9ufq9lIMQAo9rMIqPcC7Z4lu/ke
 qkvjoTDCwgIO2jP4xHrEIajjK3jDOfLjDEWbOuTe7VyuJ0NeWV0MynxnFZFsbIL2g60lP9
 Q6VrTpvROk4YSvqllU8Vox+Q/1Y7ifU=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH] drm/bridge: Remove a small useless code snippet
Date: Sat, 11 May 2024 20:42:38 +0800
Message-ID: <20240511124238.297192-1-sui.jingfeng@linux.dev>
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

Because the check on the non-existence (encoder == NULL) has already been
done in the implementation of drm_bridge_attach() function, and
drm_bridge_attach() is called earlier. The driver won't get to check point
even if drm_bridge_attach() fails for some reasons, as it will clear the
bridge->encoder to NULL and return a negective error code.

Therefore, there is no need to check another again. Remove the redundant
codes at the later.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 28376d0ecd09..3caa918ac2e0 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -116,11 +116,6 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
 		return 0;
 
-	if (!bridge->encoder) {
-		DRM_ERROR("Missing encoder\n");
-		return -ENODEV;
-	}
-
 	drm_connector_helper_add(&sbridge->connector,
 				 &simple_bridge_con_helper_funcs);
 	ret = drm_connector_init_with_ddc(bridge->dev, &sbridge->connector,
-- 
2.43.0

