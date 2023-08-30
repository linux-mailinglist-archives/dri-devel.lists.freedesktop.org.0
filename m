Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6EE78D7C7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 19:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD1510E564;
	Wed, 30 Aug 2023 17:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1272410E564
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 17:08:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.02,214,1688396400"; d="scan'208";a="178203450"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 31 Aug 2023 02:08:33 +0900
Received: from localhost.localdomain (unknown [10.226.92.150])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1462D4005B33;
 Thu, 31 Aug 2023 02:08:27 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v5 1/3] drm/bridge/analogix/anx78xx: Drop ID table
Date: Wed, 30 Aug 2023 18:08:17 +0100
Message-Id: <20230830170819.309269-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230830170819.309269-1-biju.das.jz@bp.renesas.com>
References: <20230830170819.309269-1-biju.das.jz@bp.renesas.com>
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Helen Koike <helen.koike@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver has an ID table, but it uses the wrong API for retrieving match
data and that will lead to a crash, if it is instantiated by user space or
using ID. From this, there is no user for the ID table and let's drop it
from the driver as it saves some memory.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Helen Koike <helen.koike@collabora.com>
---
v4->v5:
 * Added Rb tag from Andy and Helen.
v3->v4:
 * Added Rb tag from Laurent and Douglas Anderson.
v2->v3:
 * Updated commit header.
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

