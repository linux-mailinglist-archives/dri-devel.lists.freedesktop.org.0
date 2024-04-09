Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D518989E0C8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 18:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3334610E8EA;
	Tue,  9 Apr 2024 16:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147FD10E8EA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 16:50:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ruEgJ-0005dI-4e; Tue, 09 Apr 2024 18:50:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ruEgI-00BKxU-8A; Tue, 09 Apr 2024 18:50:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1ruEgI-00H4Qx-0W;
 Tue, 09 Apr 2024 18:50:46 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 kernel@pengutronix.de
Subject: [PATCH] gpu: host1x: mipi: Benefit from devm_clk_get_prepared()
Date: Tue,  9 Apr 2024 18:50:43 +0200
Message-ID: <20240409165043.105137-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2095;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=/YHfO/08ZaKI8GNbh6zOvQnl/lLUDiS75hdRnhQTS1M=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmFXHkrfIBoRCWyZ/uiIHtF/8ynvJylfBk153+H
 cOU9jOCKvOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZhVx5AAKCRCPgPtYfRL+
 TiO4CAC74RxiU+wDornc+8rGg0vrWkQo5oUX1OmGngy1YWOb9kreuY9WfUYXcvfsZK9OqrA0tAm
 mdBEuiX26gIo7UIQYHzXE19S2oCalqX7m8f3zKd5o0RdNrls4lN8dHeeSH1jQ/9eL4wdmb7tof1
 9R/xfkR6ovMdCjwRoUqEhFHrSikTOrn2nuw1p/A2FxW+/QB9yxrB4RGyRu2YZV0C6NCMNd4d5so
 w/Xv1OVrn7av1rckoZuYA3sLwBcO0Z0RgTUPHXZY7w7+63MujxwOwxGPuzIYkX2MS7VT+DSZZ2U
 b+JQ3+NtXB+IJVk+GSlXnT4eF4N/JPpd1btjQGzOZ6qfac3T
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When using devm_clk_get_prepared() instead of devm_clk_get() the clock
is already returned prepared. So probe doesn't need to call
clk_prepare() and at remove time the call to clk_unprepare() can be
dropped. The latter makes the remove callback empty, so it can be
dropped, too.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

the motivation for this patch is that the driver uses struct
platform_driver::remove() which I plan to change the prototype of. Instead
of converting the driver to the temporal .remove_new() and then back to
the new .remove(), drop the remove callback completely.

Best regards
Uwe

 drivers/gpu/host1x/mipi.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 4dcec535ec21..e51b43dd15a3 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -501,7 +501,6 @@ static int tegra_mipi_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
 	struct tegra_mipi *mipi;
-	int err;
 
 	match = of_match_node(tegra_mipi_of_match, pdev->dev.of_node);
 	if (!match)
@@ -520,35 +519,21 @@ static int tegra_mipi_probe(struct platform_device *pdev)
 
 	mutex_init(&mipi->lock);
 
-	mipi->clk = devm_clk_get(&pdev->dev, NULL);
+	mipi->clk = devm_clk_get_prepared(&pdev->dev, NULL);
 	if (IS_ERR(mipi->clk)) {
 		dev_err(&pdev->dev, "failed to get clock\n");
 		return PTR_ERR(mipi->clk);
 	}
 
-	err = clk_prepare(mipi->clk);
-	if (err < 0)
-		return err;
-
 	platform_set_drvdata(pdev, mipi);
 
 	return 0;
 }
 
-static int tegra_mipi_remove(struct platform_device *pdev)
-{
-	struct tegra_mipi *mipi = platform_get_drvdata(pdev);
-
-	clk_unprepare(mipi->clk);
-
-	return 0;
-}
-
 struct platform_driver tegra_mipi_driver = {
 	.driver = {
 		.name = "tegra-mipi",
 		.of_match_table = tegra_mipi_of_match,
 	},
 	.probe = tegra_mipi_probe,
-	.remove = tegra_mipi_remove,
 };

base-commit: a053fd3ca5d1b927a8655f239c84b0d790218fda
-- 
2.43.0

