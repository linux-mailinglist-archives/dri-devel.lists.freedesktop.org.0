Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 778957EB30F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 16:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD4810E21E;
	Tue, 14 Nov 2023 15:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEFD10E236
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 15:09:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1699974131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cnL8rRLdhxEUHMmzuPbpEqxboZkciFsFzGYdTqdV4zg=;
 b=PKDm94kMbgxgRSLDoJDDSVLVgpcMTPt7BhKDKq9u6fu0bN01BjveNYWGPsleYtML9yc6Vd
 eKvVW8SN4uT1AYUPGnTKzuZUQsbFIhPRfNrOrlPK588nvpPe3PyohC6pRUszauqnKiTdjK
 GJIH4tNSxWQ8DotrzwByn2N/K9Jo9og=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Phong LE <ple@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 3/8] drm/bridge: it66121: Add a helper function to read bus
 width
Date: Tue, 14 Nov 2023 23:01:25 +0800
Message-Id: <20231114150130.497915-4-sui.jingfeng@linux.dev>
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

Group those relavent code lines (which with common purpose) into one helper
function, suppress the dependency on DT to function level. Just trivial
cleanup, no functional change.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 32 ++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 83dbdbfc9ed8..0f78737adc83 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -320,6 +320,26 @@ static inline struct it66121_ctx *bridge_to_it66121(struct drm_bridge *bridge)
 	return container_of(bridge, struct it66121_ctx, bridge);
 }
 
+static int it66121_of_read_bus_width(struct device *dev, u32 *bus_width)
+{
+	struct device_node *np;
+	u32 bw;
+
+	np = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
+	if (!np)
+		return -EINVAL;
+
+	of_property_read_u32(np, "bus-width", &bw);
+	of_node_put(np);
+
+	if (bw != 12 && bw != 24)
+		return -EINVAL;
+
+	*bus_width = bw;
+
+	return 0;
+}
+
 static const struct regmap_range_cfg it66121_regmap_banks[] = {
 	{
 		.name = "it66121",
@@ -1525,19 +1545,13 @@ static int it66121_probe(struct i2c_client *client)
 	if (!ctx)
 		return -ENOMEM;
 
-	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
-	if (!ep)
-		return -EINVAL;
-
 	ctx->dev = dev;
 	ctx->client = client;
 	ctx->info = i2c_get_match_data(client);
 
-	of_property_read_u32(ep, "bus-width", &ctx->bus_width);
-	of_node_put(ep);
-
-	if (ctx->bus_width != 12 && ctx->bus_width != 24)
-		return -EINVAL;
+	ret = it66121_of_read_bus_width(dev, &ctx->bus_width);
+	if (ret)
+		return ret;
 
 	ep = of_graph_get_remote_node(dev->of_node, 1, -1);
 	if (!ep) {
-- 
2.34.1

