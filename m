Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEC16F0BAC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 20:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE8410E0C7;
	Thu, 27 Apr 2023 18:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DAD10E0C7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 18:00:07 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ps5uU-00087D-0S; Thu, 27 Apr 2023 20:00:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ps5uS-00ECXm-Hx; Thu, 27 Apr 2023 20:00:00 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ps5uR-00GhbH-Q4; Thu, 27 Apr 2023 19:59:59 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: Switch i2c drivers back to use .probe()
Date: Thu, 27 Apr 2023 19:59:54 +0200
Message-Id: <20230427175954.666464-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=19498;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=dE89i91hHMfI9pbClmpBDROsRiypUvhYLS0AG1ZQT0c=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkSrgZo2vF3t9sApBFJXnjCL8ABTR/QNborwFMC
 5XSU68UzzmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZEq4GQAKCRCPgPtYfRL+
 TvnDB/40U7O5V7leMOC6DWlkueuQ7J73GizWC5gxl6qsmGF+Ao/SVU2XNyIGei73hbJJ1V7zAzA
 0B6XSEHw0WFTzNgddQdF1+7xRG/Ua0gw+seqDVE5Fw7nBfsAHlfeKMjam0ghkEwWqT1dwDNxxLb
 is/Z5l/NWY+Ix3dPSci9RqgX+/CyRDpvC/rcUlxm9XCs7wJCc6lxN5p6jxFmemeE+mvUkIbp1n4
 4gK98WwkUP6I05ZpZpORa/4pZwgg6C+b/P/jw7pSpEjB9lKeGnk4k37rVMsOoFbvpjTkPawElj3
 pu27ncfIi5udsBeI4F+KzaUnK2jO1O5+bG0ZiXsOTN4WW7lt
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
back to (the new) .probe() to be able to eventually drop .probe_new() from
struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c             | 2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c       | 2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c       | 2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c                | 2 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c                 | 2 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c                 | 2 +-
 drivers/gpu/drm/bridge/cros-ec-anx7688.c                 | 2 +-
 drivers/gpu/drm/bridge/ite-it6505.c                      | 2 +-
 drivers/gpu/drm/bridge/ite-it66121.c                     | 2 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c                 | 2 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c                  | 2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c                  | 2 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c               | 2 +-
 drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 4 ++--
 drivers/gpu/drm/bridge/nxp-ptn3460.c                     | 2 +-
 drivers/gpu/drm/bridge/parade-ps8622.c                   | 2 +-
 drivers/gpu/drm/bridge/parade-ps8640.c                   | 2 +-
 drivers/gpu/drm/bridge/sii902x.c                         | 2 +-
 drivers/gpu/drm/bridge/sii9234.c                         | 2 +-
 drivers/gpu/drm/bridge/sil-sii8620.c                     | 2 +-
 drivers/gpu/drm/bridge/tc358767.c                        | 2 +-
 drivers/gpu/drm/bridge/tc358768.c                        | 2 +-
 drivers/gpu/drm/bridge/tc358775.c                        | 2 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c                     | 2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c                    | 2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c                    | 2 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                       | 2 +-
 drivers/gpu/drm/i2c/tda9950.c                            | 2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                        | 2 +-
 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c       | 2 +-
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c    | 2 +-
 drivers/gpu/drm/solomon/ssd130x-i2c.c                    | 2 +-
 32 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index ddceafa7b637..2254457ab5d0 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1393,7 +1393,7 @@ static struct i2c_driver adv7511_driver = {
 		.of_match_table = adv7511_of_ids,
 	},
 	.id_table = adv7511_i2c_ids,
-	.probe_new = adv7511_probe,
+	.probe = adv7511_probe,
 	.remove = adv7511_remove,
 };
 
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index 3577c532abb4..72ab2ab77081 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -815,7 +815,7 @@ static struct i2c_driver anx6345_driver = {
 		   .name = "anx6345",
 		   .of_match_table = of_match_ptr(anx6345_match_table),
 		  },
-	.probe_new = anx6345_i2c_probe,
+	.probe = anx6345_i2c_probe,
 	.remove = anx6345_i2c_remove,
 	.id_table = anx6345_id,
 };
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index a3a38bbe2786..06a3e3243e19 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -1389,7 +1389,7 @@ static struct i2c_driver anx78xx_driver = {
 		   .name = "anx7814",
 		   .of_match_table = of_match_ptr(anx78xx_match_table),
 		  },
-	.probe_new = anx78xx_i2c_probe,
+	.probe = anx78xx_i2c_probe,
 	.remove = anx78xx_i2c_remove,
 	.id_table = anx78xx_id,
 };
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 6846199a2ee1..0a97364ba8ea 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2753,7 +2753,7 @@ static struct i2c_driver anx7625_driver = {
 		.of_match_table = anx_match_table,
 		.pm = &anx7625_pm_ops,
 	},
-	.probe_new = anx7625_i2c_probe,
+	.probe = anx7625_i2c_probe,
 	.remove = anx7625_i2c_remove,
 
 	.id_table = anx7625_id,
diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 0e37840cd7a8..8bfce21d6b90 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -795,7 +795,7 @@ static struct i2c_device_id chipone_i2c_id[] = {
 MODULE_DEVICE_TABLE(i2c, chipone_i2c_id);
 
 static struct i2c_driver chipone_i2c_driver = {
-	.probe_new = chipone_i2c_probe,
+	.probe = chipone_i2c_probe,
 	.id_table = chipone_i2c_id,
 	.driver = {
 		.name = "chipone-icn6211-i2c",
diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index 339b759e4c81..a854eb84e399 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -603,7 +603,7 @@ static const struct i2c_device_id ch7033_ids[] = {
 MODULE_DEVICE_TABLE(i2c, ch7033_ids);
 
 static struct i2c_driver ch7033_driver = {
-	.probe_new = ch7033_probe,
+	.probe = ch7033_probe,
 	.remove = ch7033_remove,
 	.driver = {
 		.name = "ch7033",
diff --git a/drivers/gpu/drm/bridge/cros-ec-anx7688.c b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
index fa91bdeddef0..c8abd9920fee 100644
--- a/drivers/gpu/drm/bridge/cros-ec-anx7688.c
+++ b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
@@ -173,7 +173,7 @@ static const struct of_device_id cros_ec_anx7688_bridge_match_table[] = {
 MODULE_DEVICE_TABLE(of, cros_ec_anx7688_bridge_match_table);
 
 static struct i2c_driver cros_ec_anx7688_bridge_driver = {
-	.probe_new = cros_ec_anx7688_bridge_probe,
+	.probe = cros_ec_anx7688_bridge_probe,
 	.remove = cros_ec_anx7688_bridge_remove,
 	.driver = {
 		.name = "cros-ec-anx7688-bridge",
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index bc451b2a77c2..5fa9b9b644f7 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3466,7 +3466,7 @@ static struct i2c_driver it6505_i2c_driver = {
 		.of_match_table = it6505_of_match,
 		.pm = &it6505_bridge_pm_ops,
 	},
-	.probe_new = it6505_i2c_probe,
+	.probe = it6505_i2c_probe,
 	.remove = it6505_i2c_remove,
 	.shutdown = it6505_shutdown,
 	.id_table = it6505_id,
diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index a2d723d6a4be..466641c77fe9 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1640,7 +1640,7 @@ static struct i2c_driver it66121_driver = {
 		.name	= "it66121",
 		.of_match_table = it66121_dt_match,
 	},
-	.probe_new = it66121_probe,
+	.probe = it66121_probe,
 	.remove = it66121_remove,
 	.id_table = it66121_id,
 };
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index b40baced1331..6b0cd7736085 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -774,7 +774,7 @@ static struct i2c_driver lt8912_i2c_driver = {
 		.name = "lt8912",
 		.of_match_table = lt8912_dt_match,
 	},
-	.probe_new = lt8912_probe,
+	.probe = lt8912_probe,
 	.remove = lt8912_remove,
 	.id_table = lt8912_id,
 };
diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index 3e19fff6547a..0ab7c07c2c84 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -785,7 +785,7 @@ static const struct of_device_id lt9211_match_table[] = {
 MODULE_DEVICE_TABLE(of, lt9211_match_table);
 
 static struct i2c_driver lt9211_driver = {
-	.probe_new = lt9211_probe,
+	.probe = lt9211_probe,
 	.remove = lt9211_remove,
 	.id_table = lt9211_id,
 	.driver = {
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a25d21a7d5c1..9663601ce098 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1190,7 +1190,7 @@ static struct i2c_driver lt9611_driver = {
 		.name = "lt9611",
 		.of_match_table = lt9611_match_table,
 	},
-	.probe_new = lt9611_probe,
+	.probe = lt9611_probe,
 	.remove = lt9611_remove,
 	.id_table = lt9611_id,
 };
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 583daacf3705..2a57e804ea02 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -1011,7 +1011,7 @@ static struct i2c_driver lt9611uxc_driver = {
 		.of_match_table = lt9611uxc_match_table,
 		.dev_groups = lt9611uxc_attr_groups,
 	},
-	.probe_new = lt9611uxc_probe,
+	.probe = lt9611uxc_probe,
 	.remove = lt9611uxc_remove,
 	.id_table = lt9611uxc_id,
 };
diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 4fc494d9084b..460db3c8a08c 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -375,7 +375,7 @@ MODULE_DEVICE_TABLE(of, stdp4028_ge_b850v3_fw_match);
 
 static struct i2c_driver stdp4028_ge_b850v3_fw_driver = {
 	.id_table	= stdp4028_ge_b850v3_fw_i2c_table,
-	.probe_new	= stdp4028_ge_b850v3_fw_probe,
+	.probe		= stdp4028_ge_b850v3_fw_probe,
 	.remove		= stdp4028_ge_b850v3_fw_remove,
 	.driver		= {
 		.name		= "stdp4028-ge-b850v3-fw",
@@ -422,7 +422,7 @@ MODULE_DEVICE_TABLE(of, stdp2690_ge_b850v3_fw_match);
 
 static struct i2c_driver stdp2690_ge_b850v3_fw_driver = {
 	.id_table	= stdp2690_ge_b850v3_fw_i2c_table,
-	.probe_new	= stdp2690_ge_b850v3_fw_probe,
+	.probe		= stdp2690_ge_b850v3_fw_probe,
 	.remove		= stdp2690_ge_b850v3_fw_remove,
 	.driver		= {
 		.name		= "stdp2690-ge-b850v3-fw",
diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index cd292a2f894c..d81920227a8a 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -335,7 +335,7 @@ MODULE_DEVICE_TABLE(of, ptn3460_match);
 
 static struct i2c_driver ptn3460_driver = {
 	.id_table	= ptn3460_i2c_table,
-	.probe_new	= ptn3460_probe,
+	.probe		= ptn3460_probe,
 	.remove		= ptn3460_remove,
 	.driver		= {
 		.name	= "nxp,ptn3460",
diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index 530ee6a19e7e..027a453306db 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -538,7 +538,7 @@ MODULE_DEVICE_TABLE(i2c, ps8622_i2c_table);
 
 static struct i2c_driver ps8622_driver = {
 	.id_table	= ps8622_i2c_table,
-	.probe_new	= ps8622_probe,
+	.probe		= ps8622_probe,
 	.remove		= ps8622_remove,
 	.driver		= {
 		.name	= "ps8622",
diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 4b361d7d5e44..676a317ac147 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -773,7 +773,7 @@ static const struct of_device_id ps8640_match[] = {
 MODULE_DEVICE_TABLE(of, ps8640_match);
 
 static struct i2c_driver ps8640_driver = {
-	.probe_new = ps8640_probe,
+	.probe = ps8640_probe,
 	.driver = {
 		.name = "ps8640",
 		.of_match_table = ps8640_match,
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index ef66461e7f7c..aac239729a1d 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -1151,7 +1151,7 @@ static const struct i2c_device_id sii902x_i2c_ids[] = {
 MODULE_DEVICE_TABLE(i2c, sii902x_i2c_ids);
 
 static struct i2c_driver sii902x_driver = {
-	.probe_new = sii902x_probe,
+	.probe = sii902x_probe,
 	.remove = sii902x_remove,
 	.driver = {
 		.name = "sii902x",
diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index 099b510ff285..c8366ce6f585 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -960,7 +960,7 @@ static struct i2c_driver sii9234_driver = {
 		.name	= "sii9234",
 		.of_match_table = sii9234_dt_match,
 	},
-	.probe_new = sii9234_probe,
+	.probe = sii9234_probe,
 	.remove = sii9234_remove,
 	.id_table = sii9234_id,
 };
diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index b96d03cd878d..79b09ccd1353 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -2378,7 +2378,7 @@ static struct i2c_driver sii8620_driver = {
 		.name	= "sii8620",
 		.of_match_table = of_match_ptr(sii8620_dt_match),
 	},
-	.probe_new	= sii8620_probe,
+	.probe		= sii8620_probe,
 	.remove		= sii8620_remove,
 	.id_table = sii8620_id,
 };
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 6d16ec45ea61..b7391bca72b2 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2209,7 +2209,7 @@ static struct i2c_driver tc358767_driver = {
 		.of_match_table = tc358767_of_ids,
 	},
 	.id_table = tc358767_i2c_ids,
-	.probe_new = tc_probe,
+	.probe = tc_probe,
 	.remove	= tc_remove,
 };
 module_i2c_driver(tc358767_driver);
diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 7c0cbe84611b..783c3fd896ca 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -1083,7 +1083,7 @@ static struct i2c_driver tc358768_driver = {
 		.of_match_table = tc358768_of_ids,
 	},
 	.id_table = tc358768_i2c_ids,
-	.probe_new = tc358768_i2c_probe,
+	.probe = tc358768_i2c_probe,
 	.remove	= tc358768_i2c_remove,
 };
 module_i2c_driver(tc358768_driver);
diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 19316994ddd1..90a89d70d832 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -728,7 +728,7 @@ static struct i2c_driver tc358775_driver = {
 		.of_match_table = tc358775_of_ids,
 	},
 	.id_table = tc358775_i2c_ids,
-	.probe_new = tc_probe,
+	.probe = tc_probe,
 	.remove	= tc_remove,
 };
 module_i2c_driver(tc358775_driver);
diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridge/ti-dlpc3433.c
index 186a9e2ff24d..b65632ec7e7d 100644
--- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
+++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
@@ -400,7 +400,7 @@ static const struct of_device_id dlpc3433_match_table[] = {
 MODULE_DEVICE_TABLE(of, dlpc3433_match_table);
 
 static struct i2c_driver dlpc3433_driver = {
-	.probe_new = dlpc3433_probe,
+	.probe = dlpc3433_probe,
 	.remove = dlpc3433_remove,
 	.id_table = dlpc3433_id,
 	.driver = {
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 91ecfbe45bf9..4ea7ac1b7220 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -730,7 +730,7 @@ static const struct of_device_id sn65dsi83_match_table[] = {
 MODULE_DEVICE_TABLE(of, sn65dsi83_match_table);
 
 static struct i2c_driver sn65dsi83_driver = {
-	.probe_new = sn65dsi83_probe,
+	.probe = sn65dsi83_probe,
 	.remove = sn65dsi83_remove,
 	.id_table = sn65dsi83_id,
 	.driver = {
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 1e26fa63845a..2142d520a79f 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1951,7 +1951,7 @@ static struct i2c_driver ti_sn65dsi86_driver = {
 		.of_match_table = ti_sn65dsi86_match_table,
 		.pm = &ti_sn65dsi86_pm_ops,
 	},
-	.probe_new = ti_sn65dsi86_probe,
+	.probe = ti_sn65dsi86_probe,
 	.id_table = ti_sn65dsi86_id,
 };
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 6db69df0e18b..1e9f4af33e6a 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -410,7 +410,7 @@ static struct i2c_driver tfp410_i2c_driver = {
 		.of_match_table = of_match_ptr(tfp410_match),
 	},
 	.id_table	= tfp410_i2c_ids,
-	.probe_new	= tfp410_i2c_probe,
+	.probe		= tfp410_i2c_probe,
 	.remove		= tfp410_i2c_remove,
 };
 #endif /* IS_ENABLED(CONFIG_I2C) */
diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/i2c/tda9950.c
index b8c143e573e0..82d618c40dce 100644
--- a/drivers/gpu/drm/i2c/tda9950.c
+++ b/drivers/gpu/drm/i2c/tda9950.c
@@ -492,7 +492,7 @@ static struct i2c_device_id tda9950_ids[] = {
 MODULE_DEVICE_TABLE(i2c, tda9950_ids);
 
 static struct i2c_driver tda9950_driver = {
-	.probe_new = tda9950_probe,
+	.probe = tda9950_probe,
 	.remove = tda9950_remove,
 	.driver = {
 		.name = "tda9950",
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index db5c9343a3d2..40bcd9067e69 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -2099,7 +2099,7 @@ static const struct i2c_device_id tda998x_ids[] = {
 MODULE_DEVICE_TABLE(i2c, tda998x_ids);
 
 static struct i2c_driver tda998x_driver = {
-	.probe_new = tda998x_probe,
+	.probe = tda998x_probe,
 	.remove = tda998x_remove,
 	.driver = {
 		.name = "tda998x",
diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
index aba556c98300..4819ada69482 100644
--- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
+++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
@@ -308,7 +308,7 @@ static struct i2c_driver lcd_olinuxino_driver = {
 		.name = "lcd_olinuxino",
 		.of_match_table = lcd_olinuxino_of_ids,
 	},
-	.probe_new = lcd_olinuxino_probe,
+	.probe = lcd_olinuxino_probe,
 	.remove = lcd_olinuxino_remove,
 };
 
diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 11d6ca276c1e..90ea91e4311d 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -489,7 +489,7 @@ static struct i2c_driver rpi_touchscreen_driver = {
 		.name = "rpi_touchscreen",
 		.of_match_table = rpi_touchscreen_of_ids,
 	},
-	.probe_new = rpi_touchscreen_probe,
+	.probe = rpi_touchscreen_probe,
 	.remove = rpi_touchscreen_remove,
 };
 
diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
index ddfa0bb5d9c9..b4eb2d64bf6e 100644
--- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
+++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
@@ -100,7 +100,7 @@ static struct i2c_driver ssd130x_i2c_driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = ssd130x_of_match,
 	},
-	.probe_new = ssd130x_i2c_probe,
+	.probe = ssd130x_i2c_probe,
 	.remove = ssd130x_i2c_remove,
 	.shutdown = ssd130x_i2c_shutdown,
 };
-- 
2.39.2

