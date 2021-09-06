Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C28D4402364
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 08:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B2489301;
	Tue,  7 Sep 2021 06:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 505 seconds by postgrey-1.36 at gabe;
 Mon, 06 Sep 2021 22:05:48 UTC
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F17E89C6C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 22:05:48 +0000 (UTC)
From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
 s=mail; t=1630965441;
 bh=TBejuk5tqxeDF6kzvgEoVLlD9PzQKnYZHfHp2go1+m0=;
 h=From:To:Cc:Subject:Date:From;
 b=shQLHPvHG8+XyfIILO61kyyNG/BROBofAliqcMYmkCUaLfm8HZHAJviNKtZ7hMEmy
 DHiJe+9HFHypMP2UtGvEWf+3kxmPh/PNqAGqtVGOPpr7UbLPjKVJOobRUqoJEKMTVS
 05/jvbADBFSRMZGQdtRjveq4E4vXVYzHIUKr1L0U=
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] backlight: propagate errors from get_brightness()
Date: Mon,  6 Sep 2021 23:55:25 +0200
Message-Id: <20210906215525.15418-1-linux@weissschuh.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 07 Sep 2021 06:27:04 +0000
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

backlight.h documents "struct backlight_ops->get_brightness()" to return
a negative errno on failure.
So far these errors have not been handled in the backlight core.
This leads to negative values being exposed through sysfs although only
positive values are documented to be reported.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/video/backlight/backlight.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 537fe1b376ad..d681962f8509 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -292,10 +292,13 @@ static ssize_t actual_brightness_show(struct device *dev,
 	struct backlight_device *bd = to_backlight_device(dev);
 
 	mutex_lock(&bd->ops_lock);
-	if (bd->ops && bd->ops->get_brightness)
-		rc = sprintf(buf, "%d\n", bd->ops->get_brightness(bd));
-	else
+	if (bd->ops && bd->ops->get_brightness) {
+		rc = bd->ops->get_brightness(bd);
+		if (rc >= 0)
+			rc = sprintf(buf, "%d\n", rc);
+	} else {
 		rc = sprintf(buf, "%d\n", bd->props.brightness);
+	}
 	mutex_unlock(&bd->ops_lock);
 
 	return rc;
@@ -381,9 +384,18 @@ ATTRIBUTE_GROUPS(bl_device);
 void backlight_force_update(struct backlight_device *bd,
 			    enum backlight_update_reason reason)
 {
+	int brightness;
+
 	mutex_lock(&bd->ops_lock);
-	if (bd->ops && bd->ops->get_brightness)
-		bd->props.brightness = bd->ops->get_brightness(bd);
+	if (bd->ops && bd->ops->get_brightness) {
+		brightness = bd->ops->get_brightness(bd);
+		if (brightness >= 0)
+			bd->props.brightness = brightness;
+		else
+			dev_warn(&bd->dev,
+				 "Could not update brightness from device: errno = %d",
+				 -brightness);
+	}
 	mutex_unlock(&bd->ops_lock);
 	backlight_generate_event(bd, reason);
 }

base-commit: 79fad92f2e596f5a8dd085788a24f540263ef887
-- 
2.33.0

