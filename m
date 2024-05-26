Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6038CF5E3
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 22:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A6A10F601;
	Sun, 26 May 2024 20:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="kZgaaq2L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [95.215.58.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4EA10F601
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 20:21:53 +0000 (UTC)
X-Envelope-To: rfoss@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716754912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ax3mzsSKWaKtO/VKspU0u4aFE2YRX4lxmc4yisd0VCk=;
 b=kZgaaq2LcKIAVWpj5LqUOOMVFWZhtAPBeHsUIDVQkz2GEttX32HFWx9ChsUdE8US81w1lZ
 bkQQ97MJJ/UYmNfkfjaSv9SgEIdq53QccscD5/BJcNv9RL94Vk3CIWl8sFfZHjifaEgmCQ
 gOxaSv9XgpGdq5GKUC0yNCawxD4p5io=
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: sui.jingfeng@linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v6 03/10] drm/bridge: Implement of_drm_find_bridge() on the
 top of drm_bridge_find_by_fwnode()
Date: Mon, 27 May 2024 04:21:08 +0800
Message-Id: <20240526202115.129049-4-sui.jingfeng@linux.dev>
In-Reply-To: <20240526202115.129049-1-sui.jingfeng@linux.dev>
References: <20240526202115.129049-1-sui.jingfeng@linux.dev>
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

Before applying this patch, people may worry about the OF and non-OF API
will have a risk to diverge. Eliminate the risk by reimplement the
of_drm_find_bridge() on the top of drm_bridge_find_by_fwnode(). As for now
the fundamental searching method is unique.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/drm_bridge.c | 29 -----------------------------
 include/drm/drm_bridge.h     | 14 +++++---------
 2 files changed, 5 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 7759ca066db4..4c5584922d3c 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1346,35 +1346,6 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
 
-#ifdef CONFIG_OF
-/**
- * of_drm_find_bridge - find the bridge corresponding to the device node in
- *			the global bridge list
- *
- * @np: device node
- *
- * RETURNS:
- * drm_bridge control struct on success, NULL on failure
- */
-struct drm_bridge *of_drm_find_bridge(struct device_node *np)
-{
-	struct drm_bridge *bridge;
-
-	mutex_lock(&bridge_lock);
-
-	list_for_each_entry(bridge, &bridge_list, list) {
-		if (bridge->of_node == np) {
-			mutex_unlock(&bridge_lock);
-			return bridge;
-		}
-	}
-
-	mutex_unlock(&bridge_lock);
-	return NULL;
-}
-EXPORT_SYMBOL(of_drm_find_bridge);
-#endif
-
 /**
  * drm_bridge_find_by_fwnode - Find the bridge corresponding to the fwnode
  *
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 7b592cf30340..8d743dfe782c 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -791,21 +791,17 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      struct drm_bridge *previous,
 		      enum drm_bridge_attach_flags flags);
 
-#ifdef CONFIG_OF
-struct drm_bridge *of_drm_find_bridge(struct device_node *np);
-#else
-static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
-{
-	return NULL;
-}
-#endif
-
 struct drm_bridge *
 drm_bridge_find_by_fwnode(struct fwnode_handle *fwnode);
 
 struct drm_bridge *
 drm_bridge_find_next_bridge_by_fwnode(struct fwnode_handle *fwnode, u32 port);
 
+static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
+{
+	return drm_bridge_find_by_fwnode(of_fwnode_handle(np));
+}
+
 /**
  * drm_bridge_get_next_bridge() - Get the next bridge in the chain
  * @bridge: bridge object
-- 
2.34.1

