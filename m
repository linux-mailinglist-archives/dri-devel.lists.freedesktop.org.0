Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857248BB110
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 18:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEC4113151;
	Fri,  3 May 2024 16:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="NEh5VK6U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743BD11314D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 16:41:58 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714754516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xw1HArlIdRKgIvugHN5vPeChqMUP7aJKLbZfZnnuOgI=;
 b=NEh5VK6URle7xDiPprL0Jooz648LzGTbbYh6D1rPErTFpZyfQ/vsJcTcpu51dv7P0nRGCK
 eMZVwR8n8Rz3ZbJf8mlqVb+aYep2gjO1DfcZAWXtIXG2Q2ewq2u8Pmdyvigc9xX28h25Ag
 fIH/qk9lIHDM7oOUBXYlWlz4118anZ8=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v5 08/10] drm/bridge: sii9234: Use fwnode APIs to abstract DT
 dependent API away
Date: Sat,  4 May 2024 00:41:04 +0800
Message-Id: <20240503164106.1172650-9-sui.jingfeng@linux.dev>
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

Switch to use the freshly created drm_bridge_set_node() helper, no
functional changes. The reason behind of this introduction is that
the name 'of_node' itself has a smell of DT dependent, and it is a
internal memeber, when there has helper function, we should use the
revelant helper and avoid directly referencing and/or dereferencing
it.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/sii9234.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index d8373d918324..19b09634a134 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -817,10 +817,11 @@ static int sii9234_init_resources(struct sii9234 *ctx,
 				  struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
+	struct fwnode_handle *fwnode = dev_fwnode(ctx->dev);
 	int ret;
 
-	if (!ctx->dev->of_node) {
-		dev_err(ctx->dev, "not DT device\n");
+	if (!fwnode) {
+		dev_err(ctx->dev, "firmware data is missing\n");
 		return -ENODEV;
 	}
 
@@ -886,6 +887,7 @@ static int sii9234_probe(struct i2c_client *client)
 	struct i2c_adapter *adapter = client->adapter;
 	struct sii9234 *ctx;
 	struct device *dev = &client->dev;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	int ret;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
@@ -922,7 +924,7 @@ static int sii9234_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, ctx);
 
 	ctx->bridge.funcs = &sii9234_bridge_funcs;
-	ctx->bridge.of_node = dev->of_node;
+	drm_bridge_set_node(&ctx->bridge, fwnode);
 	drm_bridge_add(&ctx->bridge);
 
 	sii9234_cable_in(ctx);
-- 
2.34.1

