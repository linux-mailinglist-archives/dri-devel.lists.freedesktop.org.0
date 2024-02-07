Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D714C84D161
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 19:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A2710E5E6;
	Wed,  7 Feb 2024 18:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497CB10E5CA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 18:43:25 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rXmtD-00082i-BC; Wed, 07 Feb 2024 19:43:19 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rXmtC-0054Yb-Qo; Wed, 07 Feb 2024 19:43:18 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rXmtC-00HRth-2Q;
 Wed, 07 Feb 2024 19:43:18 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@pengutronix.de, Helge Deller <deller@gmx.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 28/32] video: fbdev: mmp: Follow renaming of SPI "master"
 to "controller"
Date: Wed,  7 Feb 2024 19:40:42 +0100
Message-ID: <136f59b6e272e5ff7ec210627c9c3ea27d066d51.1707324794.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2770;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=XCjKjslPjqHKRPhjAFqin0asrGjQXScMLqttnb/ERUQ=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlw87cfCDKPouSdyY/ruXPqXmi502nagTlT3Zz4
 C1qUXW8K0GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcPO3AAKCRCPgPtYfRL+
 TvX3CACqveA/rD7JWSIm5VWKcQuWk6O6yOGgjkNs3so17MGNpc9D3WJa+1Q3Fj9YswI/+mc2cvv
 lM7DaKL+zFnNP+sKDzyE86BmdsQTMXD9C446LLZJvrtEywze4r0dfh1bSHPB6t3g9TTIXE0E6e+
 5HD/C2dCcF/uquUYSd5burrHstyxfQJ2xooOfYph3zLZ4D/K+8PbcJV5XgEYdwQU2GRE+OOUEfl
 T/cPQMNlK0VlFMfaAl6UKj8ihO6jBXAyPc4LWnDgVfkKr+4gqogS30viLdt6DlnE9MNmKZB6fEj
 y2Xqa0X3zEvdPeLNY+ennxVjeiVzVibBGlODr4KPrxuLJAMR
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

In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
some functions and struct members were renamed. To not break all drivers
compatibility macros were provided.

To be able to remove these compatibility macros push the renaming into
this driver.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/fbdev/mmp/hw/mmp_spi.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/mmp/hw/mmp_spi.c b/drivers/video/fbdev/mmp/hw/mmp_spi.c
index 0f8f0312a7c4..cf23650d7f0b 100644
--- a/drivers/video/fbdev/mmp/hw/mmp_spi.c
+++ b/drivers/video/fbdev/mmp/hw/mmp_spi.c
@@ -32,7 +32,7 @@ static inline int lcd_spi_write(struct spi_device *spi, u32 data)
 	int timeout = 100000, isr, ret = 0;
 	u32 tmp;
 	void __iomem *reg_base = (void __iomem *)
-		*(void **)spi_master_get_devdata(spi->master);
+		*(void **) spi_controller_get_devdata(spi->controller);
 
 	/* clear ISR */
 	writel_relaxed(~SPI_IRQ_MASK, reg_base + SPU_IRQ_ISR);
@@ -81,7 +81,7 @@ static inline int lcd_spi_write(struct spi_device *spi, u32 data)
 static int lcd_spi_setup(struct spi_device *spi)
 {
 	void __iomem *reg_base = (void __iomem *)
-		*(void **)spi_master_get_devdata(spi->master);
+		*(void **) spi_controller_get_devdata(spi->controller);
 	u32 tmp;
 
 	tmp = CFG_SCLKCNT(16) |
@@ -136,32 +136,32 @@ static int lcd_spi_one_transfer(struct spi_device *spi, struct spi_message *m)
 
 int lcd_spi_register(struct mmphw_ctrl *ctrl)
 {
-	struct spi_master *master;
+	struct spi_controller *ctlr;
 	void **p_regbase;
 	int err;
 
-	master = spi_alloc_master(ctrl->dev, sizeof(void *));
-	if (!master) {
+	ctlr = spi_alloc_master(ctrl->dev, sizeof(void *));
+	if (!ctlr) {
 		dev_err(ctrl->dev, "unable to allocate SPI master\n");
 		return -ENOMEM;
 	}
-	p_regbase = spi_master_get_devdata(master);
+	p_regbase = spi_controller_get_devdata(ctlr);
 	*p_regbase = (void __force *)ctrl->reg_base;
 
 	/* set bus num to 5 to avoid conflict with other spi hosts */
-	master->bus_num = 5;
-	master->num_chipselect = 1;
-	master->setup = lcd_spi_setup;
-	master->transfer = lcd_spi_one_transfer;
+	ctlr->bus_num = 5;
+	ctlr->num_chipselect = 1;
+	ctlr->setup = lcd_spi_setup;
+	ctlr->transfer = lcd_spi_one_transfer;
 
-	err = spi_register_master(master);
+	err = spi_register_controller(ctlr);
 	if (err < 0) {
 		dev_err(ctrl->dev, "unable to register SPI master\n");
-		spi_master_put(master);
+		spi_controller_put(ctlr);
 		return err;
 	}
 
-	dev_info(&master->dev, "registered\n");
+	dev_info(&ctlr->dev, "registered\n");
 
 	return 0;
 }
-- 
2.43.0

