Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5327B56B6D6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E272010E1F8;
	Fri,  8 Jul 2022 10:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F5310E7E5
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 10:08:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o9kcA-00022S-7f; Fri, 08 Jul 2022 11:49:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o9kc5-00582B-Ej; Fri, 08 Jul 2022 11:49:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o9kc8-003kzq-Es; Fri, 08 Jul 2022 11:49:32 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 2/3] drm/panel-novatek-nt35510: Emit an error message if power
 off fails
Date: Fri,  8 Jul 2022 11:49:21 +0200
Message-Id: <20220708094922.1408248-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708094922.1408248-1-u.kleine-koenig@pengutronix.de>
References: <20220708094922.1408248-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=992; h=from:subject;
 bh=JI47z5FEP15rUWRcAxN97XuSQVkRWh2VPOcatDJ6qZU=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBix/2YCDxMC4Lf1vvN51a52UoPwyHba2J5eLik57bG
 xml2aLCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYsf9mAAKCRDB/BR4rcrsCaq6B/
 48XLrsBQjtt5vqZqvbn8WLVuHjsTd+7xW4rd3B2DRWVwjgnxJzOX9WcRfl0zZLBcgy6wdQd3Mfiffu
 SM/Qe8s3jea0nRoxdgbjxMS9qY2Sc89ipKXfGPwcrP0vMMSl/WpHxL/N/CuYrdnbizMQ5O+Jfa7Z/f
 1EzaZ0z0rFicv8RPjv6lDH878h48gfZer1wTIRksW6FpfMGDd7D72lxpM1mqpZiRD+o5Eu1tAwBodS
 rR65Zy4/Brz0h77e/O3dKX6ZhsNN/LJHNveFDnfEdd7KvbhR8xLGg7M1w2oq+M7oIewFASGinXvWPc
 +9G0/5G5ms7Bu+0kDrcyVtQHvXok7P
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
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Returning an error code from a mipi_dsi remove callback fails, this is
silently ignored. (mipi_dsi_drv_remove() propagates the return value to
device_remove() which ignores it.) So emit an error code in the driver
remove function and return 0.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index 873cbd38e6d3..672e49ced240 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -974,9 +974,12 @@ static int nt35510_remove(struct mipi_dsi_device *dsi)
 	mipi_dsi_detach(dsi);
 	/* Power off */
 	ret = nt35510_power_off(nt);
+	if (ret)
+		dev_err(&dsi->dev, "Failed to power off\n");
+
 	drm_panel_remove(&nt->panel);
 
-	return ret;
+	return 0;
 }
 
 /*
-- 
2.36.1

