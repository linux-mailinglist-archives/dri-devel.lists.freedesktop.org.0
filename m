Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEF78CF5EE
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 22:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B07510F608;
	Sun, 26 May 2024 20:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="RswYs/pC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D677C10F609
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 20:22:17 +0000 (UTC)
X-Envelope-To: rfoss@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716754936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sHEGEyR5HKYcrfD9JBIV0ziW1Rx1W7V/ic0nMRKrGeo=;
 b=RswYs/pCIv6lZwAAqKNacSfmf+2Q8+53Xm8HjQQyAgDzWNkXljRxyLKTiti8KPHXvk/06H
 GMWBhTIghuoScRfT7eBtzJKFsl7wWFWHDyvCrlKIzF31M6rtWRFo78I4JHixpOasmTqgF8
 TmZmtGzjItU+Eu169oGIzVKSaiwaJA4=
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
Subject: [PATCH v6 10/10] drm/bridge: ch7033: Switch to use fwnode based APIs
Date: Mon, 27 May 2024 04:21:15 +0800
Message-Id: <20240526202115.129049-11-sui.jingfeng@linux.dev>
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

Use the freshly created helper to replace the use of DT-dependent APIs,
also print error log if the fwnode graph is not complete which is benefit
to debug.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index c6374440af7f..35dd2e6ba6c0 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -531,6 +531,7 @@ static const struct regmap_config ch7033_regmap_config = {
 static int ch7033_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct ch7033_priv *priv;
 	unsigned int val;
 	int ret;
@@ -541,10 +542,15 @@ static int ch7033_probe(struct i2c_client *client)
 
 	dev_set_drvdata(dev, priv);
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1, NULL,
-					  &priv->next_bridge);
-	if (ret)
+	priv->next_bridge = drm_bridge_find_next_bridge_by_fwnode(fwnode, 1);
+	if (IS_ERR(priv->next_bridge)) {
+		ret = PTR_ERR(priv->next_bridge);
+		dev_err(dev, "Error in founding the next bridge: %d\n", ret);
 		return ret;
+	} else if (!priv->next_bridge) {
+		dev_dbg(dev, "Next bridge not found, deferring probe\n");
+		return -EPROBE_DEFER;
+	}
 
 	priv->regmap = devm_regmap_init_i2c(client, &ch7033_regmap_config);
 	if (IS_ERR(priv->regmap)) {
-- 
2.34.1

