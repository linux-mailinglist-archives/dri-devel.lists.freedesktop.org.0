Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35863266072
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779736EA50;
	Fri, 11 Sep 2020 13:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A251A6E128
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:39:12 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kGjGg-0005Is-Ou; Fri, 11 Sep 2020 15:39:10 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/21] drm/imx: imx-ldb: use local encoder and connector
 variables
Date: Fri, 11 Sep 2020 15:38:39 +0200
Message-Id: <20200911133855.29801-5-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911133855.29801-1-p.zabel@pengutronix.de>
References: <20200911133855.29801-1-p.zabel@pengutronix.de>
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

Use local variables for encoder and connector.
This simplifies the following commits.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
New in v2.
---
 drivers/gpu/drm/imx/imx-ldb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index 41e2978cb1eb..288a81f134fe 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -411,6 +411,7 @@ static int imx_ldb_register(struct drm_device *drm,
 	struct imx_ldb_channel *imx_ldb_ch)
 {
 	struct imx_ldb *ldb = imx_ldb_ch->ldb;
+	struct drm_connector *connector = &imx_ldb_ch->connector;
 	struct drm_encoder *encoder = &imx_ldb_ch->encoder;
 	int ret;
 
@@ -432,8 +433,7 @@ static int imx_ldb_register(struct drm_device *drm,
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_LVDS);
 
 	if (imx_ldb_ch->bridge) {
-		ret = drm_bridge_attach(&imx_ldb_ch->encoder,
-					imx_ldb_ch->bridge, NULL, 0);
+		ret = drm_bridge_attach(encoder, imx_ldb_ch->bridge, NULL, 0);
 		if (ret) {
 			DRM_ERROR("Failed to initialize bridge with drm\n");
 			return ret;
@@ -445,13 +445,13 @@ static int imx_ldb_register(struct drm_device *drm,
 		 * historical reasons, the ldb driver can also work without
 		 * a panel.
 		 */
-		drm_connector_helper_add(&imx_ldb_ch->connector,
-				&imx_ldb_connector_helper_funcs);
-		drm_connector_init_with_ddc(drm, &imx_ldb_ch->connector,
+		drm_connector_helper_add(connector,
+					 &imx_ldb_connector_helper_funcs);
+		drm_connector_init_with_ddc(drm, connector,
 					    &imx_ldb_connector_funcs,
 					    DRM_MODE_CONNECTOR_LVDS,
 					    imx_ldb_ch->ddc);
-		drm_connector_attach_encoder(&imx_ldb_ch->connector, encoder);
+		drm_connector_attach_encoder(connector, encoder);
 	}
 
 	return 0;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
