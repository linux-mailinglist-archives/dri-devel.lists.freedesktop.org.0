Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD551723AC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 17:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002BF6E941;
	Thu, 27 Feb 2020 16:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEABB6E949
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 16:40:44 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.lab.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1j7Luq-0001sT-2X; Thu, 27 Feb 2020 17:21:36 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1j7Luk-0007w0-J7; Thu, 27 Feb 2020 17:21:30 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 shawnguo@kernel.org, stefan@agner.ch, rmk+kernel@armlinux.org.uk
Subject: [PATCH 11/17] drm/imx: imx-ldb: release ldb-channel resources within
 encoder destroy
Date: Thu, 27 Feb 2020 17:21:19 +0100
Message-Id: <20200227162125.10450-12-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200227162125.10450-1-m.felsch@pengutronix.de>
References: <20200227162125.10450-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
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
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no reason why the resoruces should be freed manually within the
component.unbind() call instead it is easier to use the drm-core destroy
helper. The destroy helper gets called for each registered encoder
during a drm_mode_config_cleanup() call.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/gpu/drm/imx/imx-ldb.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index 06b435f9b6c9..87bf659990da 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -155,6 +155,16 @@ static int imx_ldb_connector_get_modes(struct drm_connector *connector)
 	return num_modes;
 }
 
+static void imx_ldb_encoder_destroy(struct drm_encoder *encoder)
+{
+	struct imx_ldb_channel *channel = enc_to_imx_ldb_ch(encoder);
+
+	if (channel->panel)
+		drm_panel_detach(channel->panel);
+	drm_encoder_cleanup(encoder);
+	i2c_put_adapter(channel->ddc);
+}
+
 static void imx_ldb_set_clock(struct imx_ldb *ldb, int mux, int chno,
 		unsigned long serial_clk, unsigned long di_clk)
 {
@@ -385,7 +395,7 @@ static const struct drm_connector_helper_funcs imx_ldb_connector_helper_funcs =
 };
 
 static const struct drm_encoder_funcs imx_ldb_encoder_funcs = {
-	.destroy = imx_drm_encoder_destroy,
+	.destroy = imx_ldb_encoder_destroy,
 };
 
 static const struct drm_encoder_helper_funcs imx_ldb_encoder_helper_funcs = {
@@ -699,25 +709,8 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 	return ret;
 }
 
-static void imx_ldb_unbind(struct device *dev, struct device *master,
-	void *data)
-{
-	struct imx_ldb *imx_ldb = dev_get_drvdata(dev);
-	int i;
-
-	for (i = 0; i < 2; i++) {
-		struct imx_ldb_channel *channel = &imx_ldb->channel[i];
-
-		if (channel->panel)
-			drm_panel_detach(channel->panel);
-
-		i2c_put_adapter(channel->ddc);
-	}
-}
-
 static const struct component_ops imx_ldb_ops = {
 	.bind	= imx_ldb_bind,
-	.unbind	= imx_ldb_unbind,
 };
 
 static int imx_ldb_probe(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
