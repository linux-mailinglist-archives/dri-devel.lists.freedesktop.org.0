Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C2E7EB30E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 16:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FE410E21D;
	Tue, 14 Nov 2023 15:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com
 [95.215.58.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D41E10E430
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 15:09:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1699974120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RX2Fmd7n/lPyGrqbFE5Q/i0VXpKAAer+IRR7UyADmdM=;
 b=klKW73kaFsLVaV8jy29fj+SNcq26CObnK9T7ZK0lbfaiZ9pJIWcWc3+wTt5eXRI9KAA9IR
 rUls9elRnQaFDjw61cap3rSDs05hBsnaiPASNuG2NcT5drLy2PiqB1Qa4EAtQDJuokeQSz
 y7hD8OiSWR6bdBFVNwZjIHmcC2KkW3s=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Phong LE <ple@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 1/8] drm/bridge: it66121: Use dev replace ctx->dev in the
 it66121_probe()
Date: Tue, 14 Nov 2023 23:01:23 +0800
Message-Id: <20231114150130.497915-2-sui.jingfeng@linux.dev>
In-Reply-To: <20231114150130.497915-1-sui.jingfeng@linux.dev>
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
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
Cc: Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

As the value of 'ctx->dev' has already been cached to the local variable
'dev', so keep the usage consistent. Just trivial cleanup, no functional
change.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 1cf3fb1f13dc..6e5c10cfa0bc 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1536,20 +1536,20 @@ static int it66121_probe(struct i2c_client *client)
 
 	ep = of_graph_get_remote_node(dev->of_node, 1, -1);
 	if (!ep) {
-		dev_err(ctx->dev, "The endpoint is unconnected\n");
+		dev_err(dev, "The endpoint is unconnected\n");
 		return -EINVAL;
 	}
 
 	if (!of_device_is_available(ep)) {
 		of_node_put(ep);
-		dev_err(ctx->dev, "The remote device is disabled\n");
+		dev_err(dev, "The remote device is disabled\n");
 		return -ENODEV;
 	}
 
 	ctx->next_bridge = of_drm_find_bridge(ep);
 	of_node_put(ep);
 	if (!ctx->next_bridge) {
-		dev_dbg(ctx->dev, "Next bridge not found, deferring probe\n");
+		dev_dbg(dev, "Next bridge not found, deferring probe\n");
 		return -EPROBE_DEFER;
 	}
 
@@ -1599,7 +1599,7 @@ static int it66121_probe(struct i2c_client *client)
 
 	drm_bridge_add(&ctx->bridge);
 
-	dev_info(ctx->dev, "IT66121 revision %d probed\n", revision_id);
+	dev_info(dev, "IT66121 revision %d probed\n", revision_id);
 
 	return 0;
 }
-- 
2.34.1

