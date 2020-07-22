Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4CA229877
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 14:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0443A6E1C0;
	Wed, 22 Jul 2020 12:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BDE6E14B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 12:48:09 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jyEAJ-0006bq-NR; Wed, 22 Jul 2020 14:48:07 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/imx: imx-tve: remove redundant enable tracking
Date: Wed, 22 Jul 2020 14:48:03 +0200
Message-Id: <20200722124803.12043-2-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200722124803.12043-1-p.zabel@pengutronix.de>
References: <20200722124803.12043-1-p.zabel@pengutronix.de>
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

The DRM core already takes care that encoder enable and disable calls
are balanced.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/imx/imx-tve.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.c
index 854f56603210..ef3c25d87d87 100644
--- a/drivers/gpu/drm/imx/imx-tve.c
+++ b/drivers/gpu/drm/imx/imx-tve.c
@@ -103,7 +103,6 @@ struct imx_tve {
 	struct drm_connector connector;
 	struct drm_encoder encoder;
 	struct device *dev;
-	bool enabled;
 	int mode;
 	int di_hsync_pin;
 	int di_vsync_pin;
@@ -129,12 +128,8 @@ static inline struct imx_tve *enc_to_tve(struct drm_encoder *e)
 
 static void tve_enable(struct imx_tve *tve)
 {
-	if (!tve->enabled) {
-		tve->enabled = true;
-		clk_prepare_enable(tve->clk);
-		regmap_update_bits(tve->regmap, TVE_COM_CONF_REG,
-				   TVE_EN, TVE_EN);
-	}
+	clk_prepare_enable(tve->clk);
+	regmap_update_bits(tve->regmap, TVE_COM_CONF_REG, TVE_EN, TVE_EN);
 
 	/* clear interrupt status register */
 	regmap_write(tve->regmap, TVE_STAT_REG, 0xffffffff);
@@ -151,11 +146,8 @@ static void tve_enable(struct imx_tve *tve)
 
 static void tve_disable(struct imx_tve *tve)
 {
-	if (tve->enabled) {
-		tve->enabled = false;
-		regmap_update_bits(tve->regmap, TVE_COM_CONF_REG, TVE_EN, 0);
-		clk_disable_unprepare(tve->clk);
-	}
+	regmap_update_bits(tve->regmap, TVE_COM_CONF_REG, TVE_EN, 0);
+	clk_disable_unprepare(tve->clk);
 }
 
 static int tve_setup_tvout(struct imx_tve *tve)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
