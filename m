Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E90C77A5A7
	for <lists+dri-devel@lfdr.de>; Sun, 13 Aug 2023 10:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62BE10E07D;
	Sun, 13 Aug 2023 08:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B78010E07D
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Aug 2023 08:51:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.01,169,1684767600"; d="scan'208";a="172815530"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 13 Aug 2023 17:51:44 +0900
Received: from localhost.localdomain (unknown [10.226.92.13])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2114740083E6;
 Sun, 13 Aug 2023 17:51:38 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge/analogix/anx78xx: Extend match data support for ID
 table
Date: Sun, 13 Aug 2023 09:51:37 +0100
Message-Id: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
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
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Zhu Wang <wangzhu9@huawei.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-renesas-soc@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver has ID  table, but still it uses device_get_match_data()
for retrieving match data. Replace device_get_match_data->
i2c_get_match_data() for retrieving OF/ACPI/I2C match data by adding
match data for ID table similar to OF table.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch is only compile tested
---
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index 800555aef97f..f56a46b993a7 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -1259,7 +1259,7 @@ static int anx78xx_i2c_probe(struct i2c_client *client)
 	}
 
 	/* Map slave addresses of ANX7814 */
-	i2c_addresses = device_get_match_data(&client->dev);
+	i2c_addresses = i2c_get_match_data(client);
 	for (i = 0; i < I2C_NUM_ADDRESSES; i++) {
 		struct i2c_client *i2c_dummy;
 
@@ -1368,7 +1368,7 @@ static void anx78xx_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id anx78xx_id[] = {
-	{ "anx7814", 0 },
+	{ "anx7814", (kernel_ulong_t)anx781x_i2c_addresses },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, anx78xx_id);
-- 
2.25.1

