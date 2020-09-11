Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CA52660B0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080406EA59;
	Fri, 11 Sep 2020 13:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D05C6EA58
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:54:24 +0000 (UTC)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kGjVN-0007wY-Ql; Fri, 11 Sep 2020 15:54:22 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
 id 1kGjVH-00FKnt-OQ; Fri, 11 Sep 2020 15:54:15 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Date: Fri, 11 Sep 2020 15:54:08 +0200
Message-Id: <20200911135413.3654800-12-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911135413.3654800-1-m.tretter@pengutronix.de>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
 SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
 version=3.4.2
Subject: [PATCH v2 11/16] drm/exynos: convert encoder functions to bridge
 function
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
Cc: jy0922.shim@samsung.com, b.zolnierkie@samsung.com, narmstrong@baylibre.com,
 sw0312.kim@samsung.com, Michael Tretter <m.tretter@pengutronix.de>,
 krzk@kernel.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 kernel@pengutronix.de, sylvester.nawrocki@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If other drivers use the exynos_dsi driver as a bridge, they might bring
their own encoder. Enable and disable the MIPI-DSI bridge using the
bridge functions instead of the encoder functions.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
v2: none
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 33 +++++++++++++++----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 5e7c1a99a3ee..a4f17d50d1d8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1455,9 +1455,8 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
 	}
 }
 
-static void exynos_dsi_enable(struct drm_encoder *encoder)
+static void exynos_dsi_enable(struct exynos_dsi *dsi)
 {
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 	struct drm_bridge *iter;
 	int ret;
 
@@ -1505,9 +1504,8 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 	pm_runtime_put(dsi->dev);
 }
 
-static void exynos_dsi_disable(struct drm_encoder *encoder)
+static void exynos_dsi_disable(struct exynos_dsi *dsi)
 {
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 	struct drm_bridge *iter;
 
 	if (!(dsi->state & DSIM_STATE_ENABLED))
@@ -1598,11 +1596,6 @@ static int exynos_dsi_create_connector(struct drm_encoder *encoder)
 	return 0;
 }
 
-static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
-	.enable = exynos_dsi_enable,
-	.disable = exynos_dsi_disable,
-};
-
 static int exynos_dsi_bridge_attach(struct drm_bridge *bridge,
 				    enum drm_bridge_attach_flags flags)
 {
@@ -1640,7 +1633,7 @@ static void exynos_dsi_bridge_detach(struct drm_bridge *bridge)
 
 	if (dsi->panel) {
 		mutex_lock(&drm->mode_config.mutex);
-		exynos_dsi_disable(&dsi->encoder);
+		exynos_dsi_disable(dsi);
 		dsi->panel = NULL;
 		dsi->connector.status = connector_status_disconnected;
 		mutex_unlock(&drm->mode_config.mutex);
@@ -1652,9 +1645,25 @@ static void exynos_dsi_bridge_detach(struct drm_bridge *bridge)
 	}
 }
 
+static void exynos_dsi_bridge_enable(struct drm_bridge *bridge)
+{
+	struct exynos_dsi *dsi = bridge->driver_private;
+
+	exynos_dsi_enable(dsi);
+}
+
+static void exynos_dsi_bridge_disable(struct drm_bridge *bridge)
+{
+	struct exynos_dsi *dsi = bridge->driver_private;
+
+	exynos_dsi_disable(dsi);
+}
+
 static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
 	.attach = exynos_dsi_bridge_attach,
 	.detach = exynos_dsi_bridge_detach,
+	.enable = exynos_dsi_bridge_enable,
+	.disable = exynos_dsi_bridge_disable,
 };
 
 MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
@@ -1800,8 +1809,6 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 
 	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
 
-	drm_encoder_helper_add(encoder, &exynos_dsi_encoder_helper_funcs);
-
 	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
 	if (ret < 0)
 		return ret;
@@ -1831,7 +1838,7 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 	struct exynos_dsi *dsi = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &dsi->encoder;
 
-	exynos_dsi_disable(encoder);
+	exynos_dsi_disable(dsi);
 
 	drm_encoder_cleanup(encoder);
 }
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
