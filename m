Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986E1230461
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 09:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395786E1D5;
	Tue, 28 Jul 2020 07:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4BA6E1D7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 07:44:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 27107AE18;
 Tue, 28 Jul 2020 07:44:41 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.l.velikov@gmail.com, kraxel@redhat.com, yc_chen@aspeedtech.com
Subject: [PATCH 03/13] drm/ast: Embed I2C fields in struct ast_connector
Date: Tue, 28 Jul 2020 09:44:15 +0200
Message-Id: <20200728074425.2749-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728074425.2749-1-tzimmermann@suse.de>
References: <20200728074425.2749-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the I2C fields embedded in struct ast_connector, the related call
to kzalloc() can be removed.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  3 +--
 drivers/gpu/drm/ast/ast_mode.c | 33 ++++++++++-----------------------
 2 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index e3a264ac7ee2..d303df568099 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -98,7 +98,6 @@ enum ast_tx_chip {
 #define AST_HWC_SIGNATURE_HOTSPOTX	0x14
 #define AST_HWC_SIGNATURE_HOTSPOTY	0x18
 
-
 struct ast_private {
 	struct drm_device *dev;
 
@@ -234,7 +233,7 @@ struct ast_i2c_chan {
 
 struct ast_connector {
 	struct drm_connector base;
-	struct ast_i2c_chan *i2c;
+	struct ast_i2c_chan i2c;
 };
 
 #define to_ast_connector(x) container_of(x, struct ast_connector, base)
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 45be020afcad..f421a60d8a96 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -591,15 +591,10 @@ static void ast_i2c_setsda(void *i2c_priv, int data)
 	}
 }
 
-static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
+static int ast_i2c_init(struct ast_i2c_chan *i2c, struct drm_device *dev)
 {
-	struct ast_i2c_chan *i2c;
 	int ret;
 
-	i2c = kzalloc(sizeof(struct ast_i2c_chan), GFP_KERNEL);
-	if (!i2c)
-		return NULL;
-
 	i2c->adapter.owner = THIS_MODULE;
 	i2c->adapter.class = I2C_CLASS_DDC;
 	i2c->adapter.dev.parent = &dev->pdev->dev;
@@ -618,20 +613,17 @@ static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
 	ret = i2c_bit_add_bus(&i2c->adapter);
 	if (ret) {
 		drm_err(dev, "Failed to register bit i2c\n");
-		goto out_free;
+		return ret;
 	}
 
 	i2c->dev = dev; /* signals presence of I2C support */
 
-	return i2c;
-out_free:
-	kfree(i2c);
-	return NULL;
+	return 0;
 }
 
 static bool ast_i2c_is_initialized(struct ast_i2c_chan *i2c)
 {
-	return i2c && !!i2c->dev;
+	return !!i2c->dev;
 }
 
 static void ast_i2c_fini(struct ast_i2c_chan *i2c)
@@ -642,12 +634,6 @@ static void ast_i2c_fini(struct ast_i2c_chan *i2c)
 	i2c->dev = NULL; /* clear to signal absence of I2C support */
 }
 
-static void ast_i2c_destroy(struct ast_i2c_chan *i2c)
-{
-	ast_i2c_fini(i2c);
-	kfree(i2c);
-}
-
 /*
  * Primary plane
  */
@@ -1066,7 +1052,7 @@ static int ast_get_modes(struct drm_connector *connector)
 {
 	struct ast_connector *ast_connector = to_ast_connector(connector);
 	struct ast_private *ast = to_ast_private(connector->dev);
-	struct ast_i2c_chan *i2c = ast_connector->i2c;
+	struct ast_i2c_chan *i2c = &ast_connector->i2c;
 	struct edid *edid;
 	int ret;
 	bool flags = false;
@@ -1154,7 +1140,7 @@ static enum drm_mode_status ast_mode_valid(struct drm_connector *connector,
 static void ast_connector_destroy(struct drm_connector *connector)
 {
 	struct ast_connector *ast_connector = to_ast_connector(connector);
-	ast_i2c_destroy(ast_connector->i2c);
+	ast_i2c_fini(&ast_connector->i2c);
 	drm_connector_cleanup(connector);
 	kfree(connector);
 }
@@ -1177,20 +1163,21 @@ static int ast_connector_init(struct drm_device *dev)
 	struct ast_connector *ast_connector;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
+	int ret;
 
 	ast_connector = kzalloc(sizeof(struct ast_connector), GFP_KERNEL);
 	if (!ast_connector)
 		return -ENOMEM;
 
 	connector = &ast_connector->base;
-	ast_connector->i2c = ast_i2c_create(dev);
-	if (!ast_connector->i2c)
+	ret = ast_i2c_init(&ast_connector->i2c, dev);
+	if (ret)
 		drm_err(dev, "failed to add ddc bus for connector\n");
 
 	drm_connector_init_with_ddc(dev, connector,
 				    &ast_connector_funcs,
 				    DRM_MODE_CONNECTOR_VGA,
-				    &ast_connector->i2c->adapter);
+				    &ast_connector->i2c.adapter);
 
 	drm_connector_helper_add(connector, &ast_connector_helper_funcs);
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
