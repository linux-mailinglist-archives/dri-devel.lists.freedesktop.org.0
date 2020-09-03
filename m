Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0001725C7AD
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 18:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C710D6EA18;
	Thu,  3 Sep 2020 16:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F1E6EA13
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 16:57:25 +0000 (UTC)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kDsY5-0003YF-GM; Thu, 03 Sep 2020 18:57:23 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
 id 1kDsY3-005L3f-N3; Thu, 03 Sep 2020 18:57:19 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Date: Thu,  3 Sep 2020 18:57:14 +0200
Message-Id: <20200903165717.1272492-14-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903165717.1272492-1-m.tretter@pengutronix.de>
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=4.0 tests=BAYES_00,RDNS_NONE,
 SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
 version=3.4.2
Subject: [PATCH 13/16] drm/exynos: add callback for tearing effect handler
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
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
Cc: Michael Tretter <m.tretter@pengutronix.de>, krzk@kernel.org,
 Laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tearing effect interrupts are not handled by the MIPI DSI bridge
driver, but the display controller driver.

Allow platforms to register a callback for the tearing effect interrupt.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 287bc6e9b3ca..993402f1f7c7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -254,6 +254,7 @@ struct exynos_dsi_driver_data {
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
 	const unsigned int *reg_values;
+	void (*te_handler)(struct drm_encoder *encoder);
 };
 
 struct exynos_dsi {
@@ -465,6 +466,11 @@ static const unsigned int exynos5433_reg_values[] = {
 	[PHYTIMING_HS_TRAIL] = 0x0c,
 };
 
+static void exynos_dsi_te_handler(struct drm_encoder *encoder)
+{
+	exynos_drm_crtc_te_handler(encoder->crtc);
+}
+
 static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
 	.reg_ofs = EXYNOS_REG_OFS,
 	.plltmr_reg = 0x50,
@@ -475,6 +481,7 @@ static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.te_handler = exynos_dsi_te_handler,
 };
 
 static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
@@ -487,6 +494,7 @@ static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.te_handler = exynos_dsi_te_handler,
 };
 
 static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
@@ -497,6 +505,7 @@ static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.te_handler = exynos_dsi_te_handler,
 };
 
 static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
@@ -508,6 +517,7 @@ static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	.reg_values = exynos5433_reg_values,
+	.te_handler = exynos_dsi_te_handler,
 };
 
 static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
@@ -519,6 +529,7 @@ static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
 	.reg_values = exynos5422_reg_values,
+	.te_handler = exynos_dsi_te_handler,
 };
 
 static const struct of_device_id exynos_dsi_of_match[] = {
@@ -1305,11 +1316,13 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
 
 static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_id)
 {
-	struct exynos_dsi *dsi = (struct exynos_dsi *)dev_id;
+	struct exynos_dsi *dsi = dev_id;
+	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	struct drm_encoder *encoder = dsi->bridge.encoder;
 
-	if (dsi->state & DSIM_STATE_VIDOUT_AVAILABLE)
-		exynos_drm_crtc_te_handler(encoder->crtc);
+	if (driver_data->te_handler &&
+	    (dsi->state & DSIM_STATE_VIDOUT_AVAILABLE))
+		driver_data->te_handler(encoder);
 
 	return IRQ_HANDLED;
 }
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
