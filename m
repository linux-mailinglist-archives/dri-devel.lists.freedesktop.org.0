Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AEE3F9CA8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 18:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CD26E994;
	Fri, 27 Aug 2021 16:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AE86E994
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 16:40:15 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Phong LE <ple@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 list@opendingux.net, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/2] drm/bridge: it66121: Wait for next bridge to be probed
Date: Fri, 27 Aug 2021 17:39:56 +0100
Message-Id: <20210827163956.27517-2-paul@crapouillou.net>
In-Reply-To: <20210827163956.27517-1-paul@crapouillou.net>
References: <20210827163956.27517-1-paul@crapouillou.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If run before the next bridge is initialized, of_drm_find_bridge() will
give us a NULL pointer.

If that's the case, return -EPROBE_DEFER; we may have more luck next
time.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index b130d01147c6..9dc41a7b9136 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -924,6 +924,9 @@ static int it66121_probe(struct i2c_client *client,
 	ctx->next_bridge = of_drm_find_bridge(ep);
 	of_node_put(ep);
 
+	if (!ctx->next_bridge)
+		return -EPROBE_DEFER;
+
 	i2c_set_clientdata(client, ctx);
 	mutex_init(&ctx->lock);
 
-- 
2.33.0

