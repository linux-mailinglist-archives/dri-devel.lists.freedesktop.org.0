Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0061B6BFC3F
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 20:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A2A10E058;
	Sat, 18 Mar 2023 19:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25AD10E058
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 19:08:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbue-0001nr-K9; Sat, 18 Mar 2023 20:08:20 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbuc-0054Dj-LP; Sat, 18 Mar 2023 20:08:18 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbub-005wYv-QJ; Sat, 18 Mar 2023 20:08:17 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 04/19] drm/bridge: display-connector: Convert to platform
 remove callback returning void
Date: Sat, 18 Mar 2023 20:07:49 +0100
Message-Id: <20230318190804.234610-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
References: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1916;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=BttTyRX9EsgM5qX2qxFWRDeeP4XvZKsP9X9LPBgZiWo=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFgv+1h1MElY3E9cNEmrfBwm4U2DuCvNqsGLrR
 1BgGT5XR1qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBYL/gAKCRCPgPtYfRL+
 TgqKB/42DoA53uYAoB88ZP0HsuZ4cXKyTdyGkVVfngknS/WNptTw9Kr1OXhb3px37CmV4Sue4Pu
 eBfjIdpLseAzFvDbZQLZGU3h2z3YQECsi2N7L0YRuM1QVrfuCOC3KFf21XQ7GUFDBsUOh0uAzuv
 nOHTiwOR1DBZjdAui4KDFNSfKUm7ghw/dhvsZpNe1LfWxPVmkVy4lmpYx3lnf5B313i4CE1XD0P
 WvPJN9r3Ezpm3r4DGVnnJXHq+/m9HSFps1Cj1osdXiflliGYqW0X+BCAd6X5YnBRB+9/0gUS/ki
 hDKrA/iswlD8xhXbetBOHQgU6QdIq6nkPmDGXBpM5CooumQ7
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

