Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9718BB106
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 18:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3655F113142;
	Fri,  3 May 2024 16:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ID1+odDF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com
 [95.215.58.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591F7113142
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 16:41:30 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714754488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vO5DAzgmog7KilXxDbcqZljq54cRteB1aUJEF70aaEA=;
 b=ID1+odDFJLMZGM3SFRFN/it22j2tE6PB8T4rM5qgJNX0oYvgYzM229nYyPVDaM+LWJEZiu
 aHVmjFie4ANXab7sIeE9quZDhB2NVSjdJBo4woMpry27gi5oOReU3eUao5BRAGMTAM9YFL
 ScxEtD5r22quzhKe2nPrNu3rNo/gq+c=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v5 02/10] drm/bridge: Add a helper to setup both the of_node
 and fwnode of drm bridge
Date: Sat,  4 May 2024 00:40:58 +0800
Message-Id: <20240503164106.1172650-3-sui.jingfeng@linux.dev>
In-Reply-To: <20240503164106.1172650-1-sui.jingfeng@linux.dev>
References: <20240503164106.1172650-1-sui.jingfeng@linux.dev>
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

The newly added helper is drm_bridge_set_node(), the reason behind of this
introduction is that the name 'of_node' itself has a smell of DT dependent,
when we are going to make drivers truly DT independent, we have to has a
way to hide it from its user referencing and/or dereferencing.

Please note that the introduction of drm_bridge_set_node() is actually
trying to follow the convention used by driver core, see device_set_node()
for reference.

While at it, include the of.h header as the drm_bridge struct always has
the of_node as its member. Therefore drop the forward declaration.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 include/drm/drm_bridge.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index a1bb19425761..b18e7c2f62c9 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -26,14 +26,13 @@
 #include <linux/ctype.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_modes.h>
 
-struct device_node;
-
 struct drm_bridge;
 struct drm_bridge_timings;
 struct drm_connector;
@@ -790,6 +789,13 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      struct drm_bridge *previous,
 		      enum drm_bridge_attach_flags flags);
 
+static inline void
+drm_bridge_set_node(struct drm_bridge *bridge, struct fwnode_handle *fwnode)
+{
+	bridge->fwnode = fwnode;
+	bridge->of_node = to_of_node(fwnode);
+}
+
 #ifdef CONFIG_OF
 struct drm_bridge *of_drm_find_bridge(struct device_node *np);
 #else
-- 
2.34.1

