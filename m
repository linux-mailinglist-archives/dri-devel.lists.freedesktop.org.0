Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 657EB836ABF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 17:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C318610F5F3;
	Mon, 22 Jan 2024 16:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [95.215.58.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E116910F5F3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:33:05 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1705941154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zOQVFSKw3j/viuJ1r9uwPrf0VlEptyybu7p5hJGtU4I=;
 b=L7/FAapq5/GA78moIR9tbDqaLl+KwawdazCvL79VK9uJYNJjZeHurgVE3jowYQvTiIOyFV
 GSBgDlmh2QUmpkYssS3+2mBzDVU7Ns2GYjvfvVs9cAaa+EBtpknfHqgWfkkT9sBJFoXNEz
 wcaIH5I6UVRBIFL9gZo/ycf5uHSXYKw=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH 2/5] drm/bridge: simple-bridge: Extend match support for
 non-DT based systems
Date: Tue, 23 Jan 2024 00:32:17 +0800
Message-Id: <20240122163220.110788-3-sui.jingfeng@linux.dev>
In-Reply-To: <20240122163220.110788-1-sui.jingfeng@linux.dev>
References: <20240122163220.110788-1-sui.jingfeng@linux.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Which is intended to be used on non-DT environment, where the simple-bridge
platform device is created by either the display controller driver side or
platform firmware subsystem. To avoid duplication and to keep consistent,
we choose to reuse the OF match tables. Because the potentional user may
not has a of_node attached, nor a ACPI match id. If this is the case,
a software node string property can be provide to fill the niche.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index cbe8e778d7c7..595f672745b9 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -166,6 +166,24 @@ static const struct drm_bridge_funcs simple_bridge_bridge_funcs = {
 	.disable	= simple_bridge_disable,
 };
 
+static const void *simple_bridge_get_match_data(const struct device *dev)
+{
+	const struct of_device_id *matches = dev->driver->of_match_table;
+
+	/* Try to get the match data by software node */
+	while (matches) {
+		if (!matches->compatible[0])
+			break;
+
+		if (device_is_compatible(dev, matches->compatible))
+			return matches->data;
+
+		matches++;
+	}
+
+	return NULL;
+}
+
 static int simple_bridge_probe(struct platform_device *pdev)
 {
 	struct simple_bridge *sbridge;
@@ -176,7 +194,10 @@ static int simple_bridge_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, sbridge);
 
-	sbridge->info = of_device_get_match_data(&pdev->dev);
+	if (pdev->dev.of_node)
+		sbridge->info = of_device_get_match_data(&pdev->dev);
+	else
+		sbridge->info = simple_bridge_get_match_data(&pdev->dev);
 
 	/* Get the next bridge in the pipeline. */
 	remote = of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
@@ -309,3 +330,4 @@ module_platform_driver(simple_bridge_driver);
 MODULE_AUTHOR("Maxime Ripard <maxime.ripard@free-electrons.com>");
 MODULE_DESCRIPTION("Simple DRM bridge driver");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:simple-bridge");
-- 
2.25.1

