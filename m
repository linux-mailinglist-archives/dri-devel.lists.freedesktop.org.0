Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E3F70AE5A
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 16:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DC610E0F7;
	Sun, 21 May 2023 14:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F7810E0F7
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 14:39:02 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1q0kCx-0000WF-Jh; Sun, 21 May 2023 16:38:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1q0kCv-001n1b-Bp; Sun, 21 May 2023 16:38:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1q0kCu-006ar6-Ap; Sun, 21 May 2023 16:38:48 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH] backlight: Switch i2c drivers back to use .probe()
Date: Sun, 21 May 2023 16:38:44 +0200
Message-Id: <20230521143844.375244-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5809;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=+dU7PzvnlvS3rvTzPB6NXh0DmH/h+jeVTGaagubZFjk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkaizx3+8RiuUjIzru0N8z7QZl4+OH3+cWJhxo/
 ery5RD54ESJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGos8QAKCRCPgPtYfRL+
 TijCCACYFGmvEZZL7FENGVpwYJ60d/+2mZTQ1XnRNX6u0xl5peaeTjARiGkzNd/kurFm+YsgUpi
 nfjHf7eZzyxjDtWYp81ObwDUf/Q1K0Vy+hUKRtN8aCEr39qAy50K8y0EokxJM8sNKofBHPEjehh
 kMnOIBLU3vIBDUp8k7VR4/szxrxbZhlksaqi6uXOUrxB6KyA6lqEeU5GXVg9UtK6hctuGohQbVC
 7VqBPWu42loN833KJDORU5wOOeS23p9Jj1I9enpkgBMXD4LqneMEpRJ9TaxurOEi+xhjQGPxUWX
 4dKX15lHlTWa06mrMVMbs9liZ0+PLWcO/gk85+h62vNrmS42
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
Cc: linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, Jianhua Lu <lujianhua000@gmail.com>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
back to (the new) .probe() to be able to eventually drop .probe_new() from
struct i2c_driver.

Also fix two indention inconsistencies in the neighbourhood.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

this patch was generated using coccinelle, but I aligned the result to
the per-file indention.

This is one patch for the whole backlight subsystem. If you want it
split per driver for improved patch count numbers, please tell me.

Currently there are no changes to drivers/video/backlight in next, so
the change should apply fine. If however there are other changes that
result in conflicts, feel free to just drop the hunks in the relevant
files and apply anyhow. I'll care about the fallout later.

Best regards
Uwe


 drivers/video/backlight/adp8860_bl.c | 4 ++--
 drivers/video/backlight/adp8870_bl.c | 4 ++--
 drivers/video/backlight/arcxcnn_bl.c | 2 +-
 drivers/video/backlight/bd6107.c     | 2 +-
 drivers/video/backlight/ktz8866.c    | 2 +-
 drivers/video/backlight/lm3630a_bl.c | 2 +-
 drivers/video/backlight/lm3639_bl.c  | 2 +-
 drivers/video/backlight/lp855x_bl.c  | 2 +-
 drivers/video/backlight/lv5207lp.c   | 2 +-
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/video/backlight/adp8860_bl.c b/drivers/video/backlight/adp8860_bl.c
index a479aab90f78..f51ada4795e8 100644
--- a/drivers/video/backlight/adp8860_bl.c
+++ b/drivers/video/backlight/adp8860_bl.c
@@ -803,8 +803,8 @@ static struct i2c_driver adp8860_driver = {
 		.name	= KBUILD_MODNAME,
 		.pm	= &adp8860_i2c_pm_ops,
 	},
-	.probe_new = adp8860_probe,
-	.remove   = adp8860_remove,
+	.probe = adp8860_probe,
+	.remove = adp8860_remove,
 	.id_table = adp8860_id,
 };
 
diff --git a/drivers/video/backlight/adp8870_bl.c b/drivers/video/backlight/adp8870_bl.c
index d6b0007db649..6bb18dc970e9 100644
--- a/drivers/video/backlight/adp8870_bl.c
+++ b/drivers/video/backlight/adp8870_bl.c
@@ -973,8 +973,8 @@ static struct i2c_driver adp8870_driver = {
 		.name	= KBUILD_MODNAME,
 		.pm	= &adp8870_i2c_pm_ops,
 	},
-	.probe_new = adp8870_probe,
-	.remove   = adp8870_remove,
+	.probe = adp8870_probe,
+	.remove = adp8870_remove,
 	.id_table = adp8870_id,
 };
 
diff --git a/drivers/video/backlight/arcxcnn_bl.c b/drivers/video/backlight/arcxcnn_bl.c
index 088bcca547dd..1d5a570cfe02 100644
--- a/drivers/video/backlight/arcxcnn_bl.c
+++ b/drivers/video/backlight/arcxcnn_bl.c
@@ -392,7 +392,7 @@ static struct i2c_driver arcxcnn_driver = {
 		.name = "arcxcnn_bl",
 		.of_match_table = arcxcnn_dt_ids,
 	},
-	.probe_new = arcxcnn_probe,
+	.probe = arcxcnn_probe,
 	.remove = arcxcnn_remove,
 	.id_table = arcxcnn_ids,
 };
diff --git a/drivers/video/backlight/bd6107.c b/drivers/video/backlight/bd6107.c
index f4db6c064635..7df25faa07a5 100644
--- a/drivers/video/backlight/bd6107.c
+++ b/drivers/video/backlight/bd6107.c
@@ -192,7 +192,7 @@ static struct i2c_driver bd6107_driver = {
 	.driver = {
 		.name = "bd6107",
 	},
-	.probe_new = bd6107_probe,
+	.probe = bd6107_probe,
 	.remove = bd6107_remove,
 	.id_table = bd6107_ids,
 };
diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
index d38c13ad39c7..9c980f2571ee 100644
--- a/drivers/video/backlight/ktz8866.c
+++ b/drivers/video/backlight/ktz8866.c
@@ -196,7 +196,7 @@ static struct i2c_driver ktz8866_driver = {
 		.name = "ktz8866",
 		.of_match_table = ktz8866_match_table,
 	},
-	.probe_new = ktz8866_probe,
+	.probe = ktz8866_probe,
 	.remove = ktz8866_remove,
 	.id_table = ktz8866_ids,
 };
diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index d8c42acecb5d..74d4269d5be5 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -616,7 +616,7 @@ static struct i2c_driver lm3630a_i2c_driver = {
 		   .name = LM3630A_NAME,
 		   .of_match_table = lm3630a_match_table,
 		   },
-	.probe_new = lm3630a_probe,
+	.probe = lm3630a_probe,
 	.remove = lm3630a_remove,
 	.id_table = lm3630a_id,
 };
diff --git a/drivers/video/backlight/lm3639_bl.c b/drivers/video/backlight/lm3639_bl.c
index a836628ce06e..5246c171497d 100644
--- a/drivers/video/backlight/lm3639_bl.c
+++ b/drivers/video/backlight/lm3639_bl.c
@@ -411,7 +411,7 @@ static struct i2c_driver lm3639_i2c_driver = {
 	.driver = {
 		   .name = LM3639_NAME,
 		   },
-	.probe_new = lm3639_probe,
+	.probe = lm3639_probe,
 	.remove = lm3639_remove,
 	.id_table = lm3639_id,
 };
diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index a57c9ef3b1cc..caac1cfacbe8 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -587,7 +587,7 @@ static struct i2c_driver lp855x_driver = {
 		   .of_match_table = of_match_ptr(lp855x_dt_ids),
 		   .acpi_match_table = ACPI_PTR(lp855x_acpi_match),
 		   },
-	.probe_new = lp855x_probe,
+	.probe = lp855x_probe,
 	.remove = lp855x_remove,
 	.id_table = lp855x_ids,
 };
diff --git a/drivers/video/backlight/lv5207lp.c b/drivers/video/backlight/lv5207lp.c
index 00673c8b66ac..56695ce67e48 100644
--- a/drivers/video/backlight/lv5207lp.c
+++ b/drivers/video/backlight/lv5207lp.c
@@ -141,7 +141,7 @@ static struct i2c_driver lv5207lp_driver = {
 	.driver = {
 		.name = "lv5207lp",
 	},
-	.probe_new = lv5207lp_probe,
+	.probe = lv5207lp_probe,
 	.remove = lv5207lp_remove,
 	.id_table = lv5207lp_ids,
 };

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

