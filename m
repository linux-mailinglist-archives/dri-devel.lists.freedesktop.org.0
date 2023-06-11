Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A7072B3EE
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jun 2023 22:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A521A10E11E;
	Sun, 11 Jun 2023 20:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C9C10E063
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jun 2023 20:27:54 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1q8RfB-0000BS-Ps; Sun, 11 Jun 2023 22:27:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1q8Rf8-006jMI-Tu; Sun, 11 Jun 2023 22:27:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1q8Rf8-00DIEy-2d; Sun, 11 Jun 2023 22:27:46 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/i2c: Switch i2c drivers back to use .probe()
Date: Sun, 11 Jun 2023 22:27:40 +0200
Message-Id: <20230611202740.826120-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=SOgqQ3Gd1GqQHWwQbqPHbQTXauJPmyyzC0Sm2obYM3E=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhpQ2Peve2LryIt3AfP39Iovs+d93MVw3E9l7OoP3wd0Dr
 nvY4391MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjARh1j2f7arBNbPUDhsaT79
 mn6sscLNB+cz9WSX3zq5+IN8hK9nkN6eh1WrYhZ8nVbf0WHhquhXvWSCd1ngwWMzzG52Zu05eLC
 MrcH9yASF3tS6KKO1U43v9zC7TpDNuMrM0nNPYa/hdgFu9o2RhX41QS067RcEQqsKvTy/cT5UOh
 3nlH0vpM/5v85qrr06QYtvGUfOeaGUuPB45tWQh5tn/7tQc9gyoJYlc+K1ujT1C+vjNnw8rTMxp
 vSQQIOi5GTtn3dkH/KkzVgVe9tLQff4tpPWHK2VkxIkY7h6rV3/Cj5I1n14XXHK0bDd4Zl9694+
 aUgN+5EcLm0XyNAUZX4otP3IaVdR9ze+J951ydXMyU0AAA==
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
Cc: kernel@pengutronix.de, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
commit 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
convert back to (the new) .probe() to be able to eventually drop
.probe_new() from struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/i2c/ch7006_drv.c | 2 +-
 drivers/gpu/drm/i2c/sil164_drv.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index 521bdf656cca..131512a5f3bd 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -497,7 +497,7 @@ static const struct dev_pm_ops ch7006_pm_ops = {
 
 static struct drm_i2c_encoder_driver ch7006_driver = {
 	.i2c_driver = {
-		.probe_new = ch7006_probe,
+		.probe = ch7006_probe,
 		.remove = ch7006_remove,
 
 		.driver = {
diff --git a/drivers/gpu/drm/i2c/sil164_drv.c b/drivers/gpu/drm/i2c/sil164_drv.c
index f57f9a807542..ff23422727fc 100644
--- a/drivers/gpu/drm/i2c/sil164_drv.c
+++ b/drivers/gpu/drm/i2c/sil164_drv.c
@@ -420,7 +420,7 @@ MODULE_DEVICE_TABLE(i2c, sil164_ids);
 
 static struct drm_i2c_encoder_driver sil164_driver = {
 	.i2c_driver = {
-		.probe_new = sil164_probe,
+		.probe = sil164_probe,
 		.driver = {
 			.name = "sil164",
 		},

base-commit: 53ab6975c12d1ad86c599a8927e8c698b144d669
-- 
2.39.2

