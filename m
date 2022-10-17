Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5824B60180B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 21:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A47610E6C8;
	Mon, 17 Oct 2022 19:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BD610E6C8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 19:52:56 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1okWAQ-0005ME-Jt; Mon, 17 Oct 2022 21:52:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1okWAO-0028W1-Te; Mon, 17 Oct 2022 21:52:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1okWAO-008dZK-6I; Mon, 17 Oct 2022 21:52:52 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] fbdev: da8xx-fb: Fix error handling in .remove()
Date: Mon, 17 Oct 2022 21:52:50 +0200
Message-Id: <20221017195250.1425468-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=211NpPft75bVP6ZTs9mho2EPhLj/8WbMQSxQydBDikc=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjTbKPlBUZa8W6oRW42Ti+Zdd3PLBRrwixBCIeO3Ea
 2UwYPliJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY02yjwAKCRDB/BR4rcrsCflxB/
 907K56Omk0YSNyvTc//006BdH39B7oSe2d0NdwpcsyknoqVuONm1hRtoMO1hCaZNlHXWfPBmyhvvTT
 iPYDJDF+fP3p19lHb++d1UBiFUmmLW7q30krAviTZZ2Ki3IXI+BICOtAHKfBGqqV4roNnVA0tKFLMe
 FJJYX4o5sugIjEYgORwqgJGZwmcnWXq1RGdzJ1FLJxf47Pdohn5Gzga4hp1F4p2NKFcXf3hm/FTnNR
 FXFQuZcphhXWeF7pn9Aqdf+rTZgbWGPjUS6CbtA7AzN459oJNZyVXN/zu6STZZWFmRy80z6jj5znsL
 3VYom50UgkMgbfGSGBLnifaZVyZz/t
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
Cc: linux-fbdev@vger.kernel.org, Cai Huoqing <cai.huoqing@linux.dev>,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even in the presence of problems (here: regulator_disable() might fail),
it's important to unregister all resources acquired during .probe() and
disable the device (i.e. DMA activity) because even if .remove() returns
an error code, the device is removed and the .remove() callback is never
called again later to catch up.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/fbdev/da8xx-fb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-fb.c
index ae76a2111c77..11922b009ed7 100644
--- a/drivers/video/fbdev/da8xx-fb.c
+++ b/drivers/video/fbdev/da8xx-fb.c
@@ -1076,7 +1076,8 @@ static int fb_remove(struct platform_device *dev)
 	if (par->lcd_supply) {
 		ret = regulator_disable(par->lcd_supply);
 		if (ret)
-			return ret;
+			dev_warn(&dev->dev, "Failed to disable regulator (%pe)\n",
+				 ERR_PTR(ret));
 	}
 
 	lcd_disable_raster(DA8XX_FRAME_WAIT);

base-commit: 4fe89d07dcc2804c8b562f6c7896a45643d34b2f
-- 
2.37.2

