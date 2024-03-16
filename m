Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA5B87DAAD
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 17:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4249710F388;
	Sat, 16 Mar 2024 16:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="PQAfczqn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3966E10F388
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 16:05:53 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710605151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+Mq/6HxdR67XTNnr1mfKX0S56ljquTrLxh/6FJkkRZY=;
 b=PQAfczqnBDSKaqj6dXm4XielO0qFiCvfWtyR/Mz4cEKzUA9ou5mIouLXmoJXG5GcukQgU3
 /SUE7e5CAo6H4NYazTk/e90kUKva0CttZke1+fh9MSX0kHBZ5ZilWnKwStzD9ckXjCeXTw
 vg7Br6bwub5vXAhREs1k7YtDBDGbkSA=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Phong LE <ple@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH] drm/bridge: ite66121: Register HPD interrupt handler only
 when 'client->irq > 0'
Date: Sun, 17 Mar 2024 00:05:36 +0800
Message-Id: <20240316160536.1051513-1-sui.jingfeng@linux.dev>
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

If a specific design doesn't wire IT66121's interrupt signal output pin up
to the display controller side, then we should not register the interrupt
handler. Such a decision is valid usage, as we can fall back to polling
mode. So, don't make the assumption that a specific board always supports
HPD. Carry out a sanity check on 'client->irq' before using it, fall back
to polling mode if client->irq < 0 is true. Such a design increases the
overall flexibility.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 1c3433b5e366..052884058644 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1586,13 +1586,18 @@ static int it66121_probe(struct i2c_client *client)
 	ctx->bridge.funcs = &it66121_bridge_funcs;
 	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
-	ctx->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
-
-	ret = devm_request_threaded_irq(dev, client->irq, NULL,	it66121_irq_threaded_handler,
-					IRQF_ONESHOT, dev_name(dev), ctx);
-	if (ret < 0) {
-		dev_err(dev, "Failed to request irq %d:%d\n", client->irq, ret);
-		return ret;
+	ctx->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
+	if (client->irq > 0) {
+		ctx->bridge.ops |= DRM_BRIDGE_OP_HPD;
+
+		ret = devm_request_threaded_irq(dev, client->irq, NULL,
+						it66121_irq_threaded_handler,
+						IRQF_ONESHOT, dev_name(dev),
+						ctx);
+		if (ret < 0) {
+			dev_err(dev, "Failed to request irq %d:%d\n", client->irq, ret);
+			return ret;
+		}
 	}
 
 	it66121_audio_codec_init(ctx, dev);
-- 
2.34.1

