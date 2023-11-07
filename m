Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 486097E376C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 10:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC29710E08D;
	Tue,  7 Nov 2023 09:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25E510E08D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 09:20:29 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r0IG1-0000Ib-7N; Tue, 07 Nov 2023 10:20:25 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r0IG0-007FlR-QR; Tue, 07 Nov 2023 10:20:24 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r0IG0-00ENWF-HE; Tue, 07 Nov 2023 10:20:24 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 03/22] fb: omapfb/analog-tv: Don't put .remove() in .exit.text
 and drop suppress_bind_attrs
Date: Tue,  7 Nov 2023 10:17:44 +0100
Message-ID: <20231107091740.3924258-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=6VdYr8cdlJJ63QMV/RkyaKWVaf+688YzUfimrg2v3tk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSgC4P2sDbLL3y6bXQTgb5LvLYRoJsZExJKfm9
 DA5RIcxcCWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUoAuAAKCRCPgPtYfRL+
 TrY1B/9ebuLqqfSO8Z7tgEuEXMFgL2weyds0kDru8kjmTEkzbpxDd4yaBm74d/gbtIKItSp12i2
 v4/9LngrEL3z0qjjjF71G5D3zU+Al9JhTX0iE+aOgWQ9N3RXSjYUzPuT5rt/R6qMhRMuCG9m8ZS
 lzZz85zCuxWEhCCBu3AyKAJS3ZHfJ60a/ZyYlSaD8LDXNkyDbuKCiKmZJVzCAFtq9XimCCtH5xi
 N2UjJGX0Xn7Mx5BdENDezFUhALm7DzHjJsWIc8AxM7HPjAsO6mFrKTr0iAoW2L1aYF5BW7K1o5U
 gPZ+8brn4LijTYETyFiQkjnxTgpaqvYGXbuevcCSjRPv/3nG
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Cc: kernel@pengutronix.de, linux-omap@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On today's platforms the memory savings of putting the remove function
in .exit isn't that relevant any more. It only matters for built-in
drivers and typically saves a few 100k.

The downside is that the driver cannot be unbound at runtime which is
ancient and also slightly complicates testing. Also it requires to mark
the driver struct with __refdata which is needed to suppress a (W=1)
modpost warning:

	WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv: section mismatch in reference: tvc_connector_driver+0x4 (section: .data) -> tvc_remove (section: .exit.text)

To simplify matters, move the remove callback to .text and drop
.suppress_bind_attrs = true.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 .../video/fbdev/omap2/omapfb/displays/connector-analog-tv.c  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c b/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c
index 0daaf9f89bab..85fa58f48a81 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c
@@ -221,7 +221,7 @@ static int tvc_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int __exit tvc_remove(struct platform_device *pdev)
+static int tvc_remove(struct platform_device *pdev)
 {
 	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
 	struct omap_dss_device *dssdev = &ddata->dssdev;
@@ -247,11 +247,10 @@ MODULE_DEVICE_TABLE(of, tvc_of_match);
 
 static struct platform_driver tvc_connector_driver = {
 	.probe	= tvc_probe,
-	.remove	= __exit_p(tvc_remove),
+	.remove	= tvc_remove,
 	.driver	= {
 		.name	= "connector-analog-tv",
 		.of_match_table = tvc_of_match,
-		.suppress_bind_attrs = true,
 	},
 };
 
-- 
2.42.0

