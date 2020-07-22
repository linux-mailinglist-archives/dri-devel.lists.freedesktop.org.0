Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34290229876
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 14:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04E16E14B;
	Wed, 22 Jul 2020 12:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530196E14B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 12:48:08 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jyEAI-0006bq-OV; Wed, 22 Jul 2020 14:48:06 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/imx: imx-tve: use regmap fast_io spinlock
Date: Wed, 22 Jul 2020 14:48:02 +0200
Message-Id: <20200722124803.12043-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the custom spinlock with the fast_io spinlock provided by
regmap.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/imx/imx-tve.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.c
index 813bb6156a68..854f56603210 100644
--- a/drivers/gpu/drm/imx/imx-tve.c
+++ b/drivers/gpu/drm/imx/imx-tve.c
@@ -13,7 +13,6 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
-#include <linux/spinlock.h>
 #include <linux/videodev2.h>
 
 #include <video/imx-ipu-v3.h>
@@ -104,7 +103,6 @@ struct imx_tve {
 	struct drm_connector connector;
 	struct drm_encoder encoder;
 	struct device *dev;
-	spinlock_t lock;	/* register lock */
 	bool enabled;
 	int mode;
 	int di_hsync_pin;
@@ -129,22 +127,6 @@ static inline struct imx_tve *enc_to_tve(struct drm_encoder *e)
 	return container_of(e, struct imx_tve, encoder);
 }
 
-static void tve_lock(void *__tve)
-__acquires(&tve->lock)
-{
-	struct imx_tve *tve = __tve;
-
-	spin_lock(&tve->lock);
-}
-
-static void tve_unlock(void *__tve)
-__releases(&tve->lock)
-{
-	struct imx_tve *tve = __tve;
-
-	spin_unlock(&tve->lock);
-}
-
 static void tve_enable(struct imx_tve *tve)
 {
 	if (!tve->enabled) {
@@ -500,8 +482,7 @@ static struct regmap_config tve_regmap_config = {
 
 	.readable_reg = imx_tve_readable_reg,
 
-	.lock = tve_lock,
-	.unlock = tve_unlock,
+	.fast_io = true,
 
 	.max_register = 0xdc,
 };
@@ -544,7 +525,6 @@ static int imx_tve_bind(struct device *dev, struct device *master, void *data)
 	memset(tve, 0, sizeof(*tve));
 
 	tve->dev = dev;
-	spin_lock_init(&tve->lock);
 
 	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
 	if (ddc_node) {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
