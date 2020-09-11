Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26454266060
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3606EA39;
	Fri, 11 Sep 2020 13:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DD26E952
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:39:12 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kGjGg-0005Is-Ps; Fri, 11 Sep 2020 15:39:10 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/21] drm/imx: imx-ldb: use drm managed resources
Date: Fri, 11 Sep 2020 15:38:41 +0200
Message-Id: <20200911133855.29801-7-p.zabel@pengutronix.de>
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

Use drmm_kzalloc() to align encoder memory lifetime with the drm device,
and use drmm_add_action_or_reset() to make sure drm_encoder_cleanup() is
called before the memory is freed.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/imx/imx-ldb.c | 43 +++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index c3639cc32ddf..d4beb58f509d 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -22,6 +22,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
@@ -47,12 +48,18 @@
 #define LDB_DI1_VS_POL_ACT_LOW		(1 << 10)
 #define LDB_BGREF_RMODE_INT		(1 << 15)
 
+struct imx_ldb_channel;
+
+struct imx_ldb_encoder {
+	struct drm_connector connector;
+	struct drm_encoder encoder;
+	struct imx_ldb_channel *channel;
+};
+
 struct imx_ldb;
 
 struct imx_ldb_channel {
 	struct imx_ldb *ldb;
-	struct drm_connector connector;
-	struct drm_encoder encoder;
 
 	/* Defines what is connected to the ldb, only one at a time */
 	struct drm_panel *panel;
@@ -70,12 +77,12 @@ struct imx_ldb_channel {
 
 static inline struct imx_ldb_channel *con_to_imx_ldb_ch(struct drm_connector *c)
 {
-	return container_of(c, struct imx_ldb_channel, connector);
+	return container_of(c, struct imx_ldb_encoder, connector)->channel;
 }
 
 static inline struct imx_ldb_channel *enc_to_imx_ldb_ch(struct drm_encoder *e)
 {
-	return container_of(e, struct imx_ldb_channel, encoder);
+	return container_of(e, struct imx_ldb_encoder, encoder)->channel;
 }
 
 struct bus_mux {
@@ -407,16 +414,35 @@ static int imx_ldb_get_clk(struct imx_ldb *ldb, int chno)
 	return PTR_ERR_OR_ZERO(ldb->clk_pll[chno]);
 }
 
+static void imx_ldb_encoder_cleanup(struct drm_device *drm, void *data)
+{
+	struct drm_encoder *encoder = data;
+
+	drm_encoder_cleanup(encoder);
+}
+
 static int imx_ldb_register(struct drm_device *drm,
 	struct imx_ldb_channel *imx_ldb_ch)
 {
 	struct imx_ldb *ldb = imx_ldb_ch->ldb;
-	struct drm_connector *connector = &imx_ldb_ch->connector;
-	struct drm_encoder *encoder = &imx_ldb_ch->encoder;
+	struct imx_ldb_encoder *ldb_encoder;
+	struct drm_connector *connector;
+	struct drm_encoder *encoder;
 	int ret;
 
-	memset(connector, 0, sizeof(*connector));
-	memset(encoder, 0, sizeof(*encoder));
+	ldb_encoder = drmm_kzalloc(drm, sizeof(*ldb_encoder), GFP_KERNEL);
+	if (!ldb_encoder)
+		return -ENOMEM;
+
+	ldb_encoder->channel = imx_ldb_ch;
+	connector = &ldb_encoder->connector;
+	encoder = &ldb_encoder->encoder;
+
+	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_LVDS);
+
+	ret = drmm_add_action_or_reset(drm, imx_ldb_encoder_cleanup, encoder);
+	if (ret)
+		return ret;
 
 	ret = imx_drm_encoder_parse_of(drm, encoder, imx_ldb_ch->child);
 	if (ret)
@@ -433,7 +459,6 @@ static int imx_ldb_register(struct drm_device *drm,
 	}
 
 	drm_encoder_helper_add(encoder, &imx_ldb_encoder_helper_funcs);
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_LVDS);
 
 	if (imx_ldb_ch->bridge) {
 		ret = drm_bridge_attach(encoder, imx_ldb_ch->bridge, NULL, 0);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
