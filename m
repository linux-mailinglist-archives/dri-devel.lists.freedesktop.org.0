Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AE4480DC3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Dec 2021 23:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1ED892ED;
	Tue, 28 Dec 2021 22:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp10.smtpout.orange.fr
 [80.12.242.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F424892ED
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 22:37:32 +0000 (UTC)
Received: from pop-os.home ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id 2L5ynCkAhV2Y12L5zn4FXZ; Tue, 28 Dec 2021 23:37:30 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Tue, 28 Dec 2021 23:37:30 +0100
X-ME-IP: 86.243.171.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch, marex@denx.de,
 linus.walleij@linaro.org, frieder.schrempf@kontron.de
Subject: [PATCH] drm/bridge: sn65dsi83: Fix an error handling path in
 sn65dsi83_probe()
Date: Tue, 28 Dec 2021 23:37:25 +0100
Message-Id: <16e7c6e94a61e6fc2d65db61620955c388798dbb.1640730512.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sn65dsi83_parse_dt() takes a reference on 'ctx->host_node' that must be
released in the error handling path of the probe.
This is only done in the remove function up to now.

Fixes: ceb515ba29ba ("drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84 driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 945f08de45f1..6edea9f8f8c4 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -673,8 +673,10 @@ static int sn65dsi83_probe(struct i2c_client *client,
 		return ret;
 
 	ctx->regmap = devm_regmap_init_i2c(client, &sn65dsi83_regmap_config);
-	if (IS_ERR(ctx->regmap))
-		return PTR_ERR(ctx->regmap);
+	if (IS_ERR(ctx->regmap)) {
+		ret = PTR_ERR(ctx->regmap);
+		goto err_put_node;
+	}
 
 	dev_set_drvdata(dev, ctx);
 	i2c_set_clientdata(client, ctx);
@@ -691,6 +693,8 @@ static int sn65dsi83_probe(struct i2c_client *client,
 
 err_remove_bridge:
 	drm_bridge_remove(&ctx->bridge);
+err_put_node:
+	of_node_put(ctx->host_node);
 	return ret;
 }
 
-- 
2.32.0

