Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ABC6F99F3
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6C910E2B7;
	Sun,  7 May 2023 16:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F081C10E222
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:39 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDR-0001e5-Mk; Sun, 07 May 2023 18:26:29 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDQ-001nBl-33; Sun, 07 May 2023 18:26:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDO-002Ag7-Tf; Sun, 07 May 2023 18:26:26 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 08/53] drm/bridge: display-connector: Convert to platform
 remove callback returning void
Date: Sun,  7 May 2023 18:25:31 +0200
Message-Id: <20230507162616.1368908-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1916;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=BttTyRX9EsgM5qX2qxFWRDeeP4XvZKsP9X9LPBgZiWo=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9Ds1h1MElY3E9cNEmrfBwm4U2DuCvNqsGLrR
 1BgGT5XR1qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfQ7AAKCRCPgPtYfRL+
 TrRSCACPCMMFTk2RkZ/fr/xeQkAUkxO4OgomQu02C8qTw6r5XbF0+r8C14Eiq+Fiz17F1UDqOg0
 tmWNj/sM38kFXSV5sUY1WHLZggXBXy/74XZhsiRMt5wysPCfOmnvUC8qpPdrcnDkGkdhGc4uwPU
 WLiJjrrSk2LHFGzyd3B6xm92PwyIM594hzmWu22gCOBe8DDIVHdjwGZJvwpTRsv/U14GK3pbO22
 tFyR4mbPz+L8WEhgKmnkMv8urKlSGowquQlAPZiJrsrpOmZWhTLUEXqj1R5jZa6UsRCNo1mxcvc
 i33F/edTV/OrORA1rMryxQQEKa0LLT8zAvchwPr57/W9Gz9w
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/bridge/display-connector.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 9a12449ad7b8..fbb3e102c02f 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -382,7 +382,7 @@ static int display_connector_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int display_connector_remove(struct platform_device *pdev)
+static void display_connector_remove(struct platform_device *pdev)
 {
 	struct display_connector *conn = platform_get_drvdata(pdev);
 
@@ -396,8 +396,6 @@ static int display_connector_remove(struct platform_device *pdev)
 
 	if (!IS_ERR(conn->bridge.ddc))
 		i2c_put_adapter(conn->bridge.ddc);
-
-	return 0;
 }
 
 static const struct of_device_id display_connector_match[] = {
@@ -426,7 +424,7 @@ MODULE_DEVICE_TABLE(of, display_connector_match);
 
 static struct platform_driver display_connector_driver = {
 	.probe	= display_connector_probe,
-	.remove	= display_connector_remove,
+	.remove_new = display_connector_remove,
 	.driver		= {
 		.name		= "display-connector",
 		.of_match_table	= display_connector_match,
-- 
2.39.2

