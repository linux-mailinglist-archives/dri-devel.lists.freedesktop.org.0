Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C06D87DB14
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 18:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39A410E2CB;
	Sat, 16 Mar 2024 17:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Zy/cUnpk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com
 [95.215.58.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E5B10F821
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 17:28:18 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710610096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ceT0A5OpKZsmi5o1ZFkhltR2cGi15QKceRNYBtO/4yU=;
 b=Zy/cUnpk+3+aY0gUZps4ug+ZdXWwzfkIX6erIJnCile2KVmsc70ZSh2DH8hc+tudPd3s4m
 1usqtT6xHolvv2r4Gc4vWMpH7Kyk8LvlmYjNGL+x4Jn6D25Tu2PLhgoGa5XpHlEaQhc0V9
 ufG8jDPFoJkT4ie6NTooiG4gooiP71k=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH] drm: bridge: thc63lvd1024: Switch to use
 of_graph_get_remote_node()
Date: Sun, 17 Mar 2024 01:28:00 +0800
Message-Id: <20240316172800.1168390-1-sui.jingfeng@linux.dev>
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

To reduce boilerplate, use of_graph_get_remote_node() helper instead of
the hand-rolling code.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/thc63lvd1024.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
index d4c1a601bbb5..5f99f9724081 100644
--- a/drivers/gpu/drm/bridge/thc63lvd1024.c
+++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
@@ -123,28 +123,10 @@ static int thc63_parse_dt(struct thc63_dev *thc63)
 	struct device_node *endpoint;
 	struct device_node *remote;
 
-	endpoint = of_graph_get_endpoint_by_regs(thc63->dev->of_node,
-						 THC63_RGB_OUT0, -1);
-	if (!endpoint) {
-		dev_err(thc63->dev, "Missing endpoint in port@%u\n",
-			THC63_RGB_OUT0);
-		return -ENODEV;
-	}
-
-	remote = of_graph_get_remote_port_parent(endpoint);
-	of_node_put(endpoint);
-	if (!remote) {
-		dev_err(thc63->dev, "Endpoint in port@%u unconnected\n",
-			THC63_RGB_OUT0);
+	remote = of_graph_get_remote_node(thc63->dev->of_node,
+					  THC63_RGB_OUT0, -1);
+	if (!remote)
 		return -ENODEV;
-	}
-
-	if (!of_device_is_available(remote)) {
-		dev_err(thc63->dev, "port@%u remote endpoint is disabled\n",
-			THC63_RGB_OUT0);
-		of_node_put(remote);
-		return -ENODEV;
-	}
 
 	thc63->next = of_drm_find_bridge(remote);
 	of_node_put(remote);
-- 
2.34.1

