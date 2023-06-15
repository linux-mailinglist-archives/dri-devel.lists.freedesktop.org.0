Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8225A7320CA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 22:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E986A10E539;
	Thu, 15 Jun 2023 20:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE9D10E536
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 20:19:17 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9ABC086065;
 Thu, 15 Jun 2023 22:19:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1686860356;
 bh=kskVxjT2uIMftorJT4/0zbnO7c8FH5ZfOQ578YyVApM=;
 h=From:To:Cc:Subject:Date:From;
 b=uVAG6DpdZxZczP/OBnYkbnzSWdpV28Xw4BZH9QYK5aijGkQVV9ERAJAd+cAWp0Epb
 uGenU0XZFMVJjUNvJQz9DjUe5Ski8X2pr7Bolqjte2QoojHgSm6e0oE2Y6SzXQF+EF
 XxQ9dNOwj4UAW23SBJg6pQbX9zhg0ExvDFctgT+GXKPGrzD0XCu2NFd2mX6JRFdMbt
 PnQQv9BsAGq0OxcLvbYv2Ja7i2PBow92Uf7ezwVmV2iwHfMz9u8IY1XtI10goLTdbp
 owd3l3v2/GYT9vPc3COJpOPsnp20twhh+kPUgwI+gniRzVTOrfKCU08Z8beMGqAny/
 swPeoRtnHcAEg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/bridge: tc358762: Split register programming from
 pre-enable to enable
Date: Thu, 15 Jun 2023 22:18:58 +0200
Message-Id: <20230615201902.566182-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the register programming part, which actually enables the bridge and
makes it push data out of its DPI side, into the enable callback. The DSI
host like DSIM may not be able to transmit commands in pre_enable, moving
the register programming into enable assures it can transmit commands.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/tc358762.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 5641395fd310e..df9703eacab1f 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -162,11 +162,17 @@ static void tc358762_pre_enable(struct drm_bridge *bridge)
 		usleep_range(5000, 10000);
 	}
 
+	ctx->pre_enabled = true;
+}
+
+static void tc358762_enable(struct drm_bridge *bridge)
+{
+	struct tc358762 *ctx = bridge_to_tc358762(bridge);
+	int ret;
+
 	ret = tc358762_init(ctx);
 	if (ret < 0)
 		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
-
-	ctx->pre_enabled = true;
 }
 
 static int tc358762_attach(struct drm_bridge *bridge,
@@ -181,6 +187,7 @@ static int tc358762_attach(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs tc358762_bridge_funcs = {
 	.post_disable = tc358762_post_disable,
 	.pre_enable = tc358762_pre_enable,
+	.enable = tc358762_enable,
 	.attach = tc358762_attach,
 };
 
-- 
2.39.2

