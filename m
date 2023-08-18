Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B42A781108
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 18:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AEAE10E0CF;
	Fri, 18 Aug 2023 16:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CAF5610E0AA
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 16:55:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.01,183,1684767600"; d="scan'208";a="176985264"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 19 Aug 2023 01:55:05 +0900
Received: from localhost.localdomain (unknown [10.226.93.81])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id B938D4021B55;
 Sat, 19 Aug 2023 01:55:00 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/2] drm: bridge: it66121: Extend match support for OF
 tables
Date: Fri, 18 Aug 2023 17:54:51 +0100
Message-Id: <20230818165452.320984-2-biju.das.jz@bp.renesas.com>
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

The driver has OF match table, still it uses ID lookup table for
retrieving match data. Currently the driver is working on the
assumption that a I2C device registered via OF will always match a
legacy I2C device ID. The correct approach is to have an OF device ID
table using of_device_match_data() if the devices are registered via OF.

Fixes: 9a9f4a01bdae ("drm: bridge: it66121: Move VID/PID to new it66121_chip_info structure")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch.
---
 drivers/gpu/drm/bridge/ite-it66121.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 466641c77fe9..ba95ad46e259 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1523,7 +1523,10 @@ static int it66121_probe(struct i2c_client *client)
 
 	ctx->dev = dev;
 	ctx->client = client;
-	ctx->info = (const struct it66121_chip_info *) id->driver_data;
+	if (dev_fwnode(&client->dev))
+		ctx->info = of_device_get_match_data(&client->dev);
+	else
+		ctx->info = (const struct it66121_chip_info *) id->driver_data;
 
 	of_property_read_u32(ep, "bus-width", &ctx->bus_width);
 	of_node_put(ep);
@@ -1609,13 +1612,6 @@ static void it66121_remove(struct i2c_client *client)
 	mutex_destroy(&ctx->lock);
 }
 
-static const struct of_device_id it66121_dt_match[] = {
-	{ .compatible = "ite,it66121" },
-	{ .compatible = "ite,it6610" },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, it66121_dt_match);
-
 static const struct it66121_chip_info it66121_chip_info = {
 	.id = ID_IT66121,
 	.vid = 0x4954,
@@ -1628,6 +1624,13 @@ static const struct it66121_chip_info it6610_chip_info = {
 	.pid = 0x0611,
 };
 
+static const struct of_device_id it66121_dt_match[] = {
+	{ .compatible = "ite,it66121", &it66121_chip_info },
+	{ .compatible = "ite,it6610", &it6610_chip_info },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, it66121_dt_match);
+
 static const struct i2c_device_id it66121_id[] = {
 	{ "it66121", (kernel_ulong_t) &it66121_chip_info },
 	{ "it6610", (kernel_ulong_t) &it6610_chip_info },
-- 
2.25.1

