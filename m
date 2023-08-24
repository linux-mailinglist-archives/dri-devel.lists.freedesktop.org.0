Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8087078777D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 20:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECF210E127;
	Thu, 24 Aug 2023 18:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 01E4C10E127
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 18:10:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.02,195,1688396400"; d="scan'208";a="173861490"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 25 Aug 2023 03:10:38 +0900
Received: from localhost.localdomain (unknown [10.226.93.115])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2FD1940116D2;
 Fri, 25 Aug 2023 03:10:32 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/bridge/analogix/anx78xx: Extend match data support for
 ID table
Date: Thu, 24 Aug 2023 19:10:30 +0100
Message-Id: <20230824181030.389643-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Zhu Wang <wangzhu9@huawei.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver has an ID table, but it uses the wrong API for retrieving match
data and that will lead to a crash, if it is instantiated by user space or
using ID. From this, there is no user for the ID table and let's drop it
from the driver as it saves some memory.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped ID table support.
---
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index 800555aef97f..6169db73d2fe 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -1367,12 +1367,6 @@ static void anx78xx_i2c_remove(struct i2c_client *client)
 	kfree(anx78xx->edid);
 }
 
-static const struct i2c_device_id anx78xx_id[] = {
-	{ "anx7814", 0 },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(i2c, anx78xx_id);
-
 static const struct of_device_id anx78xx_match_table[] = {
 	{ .compatible = "analogix,anx7808", .data = anx7808_i2c_addresses },
 	{ .compatible = "analogix,anx7812", .data = anx781x_i2c_addresses },
@@ -1389,7 +1383,6 @@ static struct i2c_driver anx78xx_driver = {
 		  },
 	.probe = anx78xx_i2c_probe,
 	.remove = anx78xx_i2c_remove,
-	.id_table = anx78xx_id,
 };
 module_i2c_driver(anx78xx_driver);
 
-- 
2.25.1

