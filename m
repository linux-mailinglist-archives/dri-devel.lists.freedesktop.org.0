Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B251BE104
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 16:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6087A6E04E;
	Wed, 29 Apr 2020 14:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7096ECB6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 14:32:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 36767AF62;
 Wed, 29 Apr 2020 14:32:40 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, john.p.donnelly@oracle.com
Subject: [PATCH 03/17] drm/mgag200: Embed connector instance in struct
 mga_device
Date: Wed, 29 Apr 2020 16:32:24 +0200
Message-Id: <20200429143238.10115-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200429143238.10115-1-tzimmermann@suse.de>
References: <20200429143238.10115-1-tzimmermann@suse.de>
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

Storing the connector instance in struct mga_device avoids some
dynamic memory allocation. Done im preparation of converting
mgag200 to simple-KMS helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  1 +
 drivers/gpu/drm/mgag200/mgag200_mode.c | 54 ++++++++++++++------------
 2 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index de3181bd63ca0..09b43a0ff6bbf 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -164,6 +164,7 @@ struct mga_device {
 	/* SE model number stored in reg 0x1e24 */
 	u32 unique_rev_id;
 
+	struct mga_connector connector;
 	struct drm_encoder encoder;
 };
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index ce41bebfdd1a2..eaa3fca7216ac 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1444,6 +1444,10 @@ static void mga_crtc_init(struct mga_device *mdev)
 	drm_crtc_helper_add(&mga_crtc->base, &mga_helper_funcs);
 }
 
+/*
+ * Connector
+ */
+
 static int mga_vga_get_modes(struct drm_connector *connector)
 {
 	struct mga_connector *mga_connector = to_mga_connector(connector);
@@ -1568,7 +1572,6 @@ static void mga_connector_destroy(struct drm_connector *connector)
 	struct mga_connector *mga_connector = to_mga_connector(connector);
 	mgag200_i2c_destroy(mga_connector->i2c);
 	drm_connector_cleanup(connector);
-	kfree(connector);
 }
 
 static const struct drm_connector_helper_funcs mga_vga_connector_helper_funcs = {
@@ -1582,37 +1585,39 @@ static const struct drm_connector_funcs mga_vga_connector_funcs = {
 	.destroy = mga_connector_destroy,
 };
 
-static struct drm_connector *mga_vga_init(struct drm_device *dev)
+static int mgag200_vga_connector_init(struct mga_device *mdev)
 {
-	struct drm_connector *connector;
-	struct mga_connector *mga_connector;
-
-	mga_connector = kzalloc(sizeof(struct mga_connector), GFP_KERNEL);
-	if (!mga_connector)
-		return NULL;
-
-	connector = &mga_connector->base;
-	mga_connector->i2c = mgag200_i2c_create(dev);
-	if (!mga_connector->i2c)
-		DRM_ERROR("failed to add ddc bus\n");
+	struct drm_device *dev = mdev->dev;
+	struct mga_connector *mconnector = &mdev->connector;
+	struct drm_connector *connector = &mconnector->base;
+	struct mga_i2c_chan *i2c;
+	int ret;
 
-	drm_connector_init_with_ddc(dev, connector,
-				    &mga_vga_connector_funcs,
-				    DRM_MODE_CONNECTOR_VGA,
-				    &mga_connector->i2c->adapter);
+	i2c = mgag200_i2c_create(dev);
+	if (!i2c)
+		drm_warn(dev, "failed to add DDC bus\n");
 
+	ret = drm_connector_init_with_ddc(dev, connector,
+					  &mga_vga_connector_funcs,
+					  DRM_MODE_CONNECTOR_VGA,
+					  &i2c->adapter);
+	if (ret)
+		goto err_mgag200_i2c_destroy;
 	drm_connector_helper_add(connector, &mga_vga_connector_helper_funcs);
 
-	drm_connector_register(connector);
+	mconnector->i2c = i2c;
 
-	return connector;
-}
+	return 0;
 
+err_mgag200_i2c_destroy:
+	mgag200_i2c_destroy(i2c);
+	return ret;
+}
 
 int mgag200_modeset_init(struct mga_device *mdev)
 {
 	struct drm_encoder *encoder = &mdev->encoder;
-	struct drm_connector *connector;
+	struct drm_connector *connector = &mdev->connector.base;
 	int ret;
 
 	mdev->dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
@@ -1632,9 +1637,10 @@ int mgag200_modeset_init(struct mga_device *mdev)
 	}
 	encoder->possible_crtcs = 0x1;
 
-	connector = mga_vga_init(mdev->dev);
-	if (!connector) {
-		DRM_ERROR("mga_vga_init failed\n");
+	ret = mgag200_vga_connector_init(mdev);
+	if (ret) {
+		drm_err(mdev->dev,
+			"mga_vga_connector_init() failed, error %d\n", ret);
 		return -1;
 	}
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
