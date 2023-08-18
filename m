Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BD5781109
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 18:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5D110E09E;
	Fri, 18 Aug 2023 16:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 25D4C10E09E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 16:55:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.01,183,1684767600"; d="scan'208";a="176985276"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 19 Aug 2023 01:55:10 +0900
Received: from localhost.localdomain (unknown [10.226.93.81])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1246B4021B55;
 Sat, 19 Aug 2023 01:55:05 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/2] drm: bridge: it66121: Simplify probe()
Date: Fri, 18 Aug 2023 17:54:52 +0100
Message-Id: <20230818165452.320984-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230818165452.320984-1-biju.das.jz@bp.renesas.com>
References: <20230818165452.320984-1-biju.das.jz@bp.renesas.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify probe() by replacing of_device_get_match_data() and ID lookup
for retrieving match data by i2c_get_match_data().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped sentence for dropping local variable as it is integral part of
   the patch.
---
 drivers/gpu/drm/bridge/ite-it66121.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index ba95ad46e259..a80246ef4ffe 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1501,7 +1501,6 @@ static const char * const it66121_supplies[] = {
 
 static int it66121_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
 	struct device_node *ep;
 	int ret;
@@ -1523,10 +1522,7 @@ static int it66121_probe(struct i2c_client *client)
 
 	ctx->dev = dev;
 	ctx->client = client;
-	if (dev_fwnode(&client->dev))
-		ctx->info = of_device_get_match_data(&client->dev);
-	else
-		ctx->info = (const struct it66121_chip_info *) id->driver_data;
+	ctx->info = i2c_get_match_data(client);
 
 	of_property_read_u32(ep, "bus-width", &ctx->bus_width);
 	of_node_put(ep);
-- 
2.25.1

