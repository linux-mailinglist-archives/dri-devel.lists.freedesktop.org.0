Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F55267E96C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 16:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A5110E03E;
	Fri, 27 Jan 2023 15:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8EE10E03E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 15:26:51 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pLQcp-0008Gy-IM; Fri, 27 Jan 2023 16:26:47 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pLQco-000oYE-Bq; Fri, 27 Jan 2023 16:26:45 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pLQcm-00GKNz-KC; Fri, 27 Jan 2023 16:26:44 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH] backlight: ktz8866: Convert to i2c's .probe_new()
Date: Fri, 27 Jan 2023 16:26:39 +0100
Message-Id: <20230127152639.1347229-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1678;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=JXtZ4qJr03XIJEN/NC/CjrKnv/yRwNzHlZOJzDM53xc=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj0+0rNOc160XeoRr7LxSatRqJfKYd1KE6/Tsl2e0c
 elW62ReJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY9PtKwAKCRDB/BR4rcrsCSUMB/
 9xLXXSL15X4ypEseaYZr92wu6i466BC+9VPXcxKWgDq/KlXLfGaA58OGc7xM7wWdoZcJ4o4sOGhV3a
 fQTd/pifx+ycW9PdiXRnQoWuAfwZggdFVnWz0Kl2UCPO4qN8/cWSMdmE1GdjM9OUQCHfA3YxbQpaUQ
 LHogqJ3ZtjDCkHJavLAdO4GF2GL7tnAyaPy7v67+PTmHbRdR4ttKwtrLRAvtkLuJ/1zedbyA2D40B8
 Lgjcx11+QChGVpRH2SsnL5kI+FG69xtOjixTWnfrCpPohXb8FjVGDsnNNO4boaI6hfbpOq3IKHOsWo
 t3w1FWA29OjIAE2/ggfMJ++H0t/Jyi
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The probe function doesn't make use of the i2c_device_id * parameter so
it can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

there is an ongoing effort to convert all drivers to .probe_new to
eventually drop .probe with the i2c_device_id parameter. This driver
currently sits in next so wasn't on my radar before.

My plan is to tackle that after the next merge window. So I ask you to
either apply this patch during the next merge window or accept that it
will go in via the i2c tree together with the patch that drops .probe().

Best regards
Uwe

 drivers/video/backlight/ktz8866.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
index 97b723719e13..d38c13ad39c7 100644
--- a/drivers/video/backlight/ktz8866.c
+++ b/drivers/video/backlight/ktz8866.c
@@ -124,8 +124,7 @@ static void ktz8866_init(struct ktz8866 *ktz)
 		ktz8866_write(ktz, LCD_BIAS_CFG1, LCD_BIAS_EN);
 }
 
-static int ktz8866_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int ktz8866_probe(struct i2c_client *client)
 {
 	struct backlight_device *backlight_dev;
 	struct backlight_properties props;
@@ -197,7 +196,7 @@ static struct i2c_driver ktz8866_driver = {
 		.name = "ktz8866",
 		.of_match_table = ktz8866_match_table,
 	},
-	.probe = ktz8866_probe,
+	.probe_new = ktz8866_probe,
 	.remove = ktz8866_remove,
 	.id_table = ktz8866_ids,
 };

base-commit: 2241ab53cbb5cdb08a6b2d4688feb13971058f65
prerequisite-patch-id: 2e7d7db8c0a90b8cd1deb6bbc51ead4c89c89b62
-- 
2.39.0

