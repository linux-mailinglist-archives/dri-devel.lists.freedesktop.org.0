Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0DF1182BB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410276E864;
	Tue, 10 Dec 2019 08:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2306E863
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:49:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 64D01AF83;
 Tue, 10 Dec 2019 08:49:07 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org, zboszor@pr.hu
Subject: [PATCH v3 1/9] drm/udl: Init connector before encoder and CRTC
Date: Tue, 10 Dec 2019 09:48:57 +0100
Message-Id: <20191210084905.5570-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210084905.5570-1-tzimmermann@suse.de>
References: <20191210084905.5570-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To mimic simple-pipe, we initialize the connector before the rest of
the display pipeline.

v2:
	* remove unnecessary calls to drm_connector_{register,unregister}()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/udl/udl_connector.c |  9 +++------
 drivers/gpu/drm/udl/udl_drv.h       |  2 +-
 drivers/gpu/drm/udl/udl_modeset.c   | 16 ++++++++++++++--
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/udl_connector.c
index b4ae3e89a7b4..b1d2f38e37e0 100644
--- a/drivers/gpu/drm/udl/udl_connector.c
+++ b/drivers/gpu/drm/udl/udl_connector.c
@@ -104,7 +104,6 @@ static void udl_connector_destroy(struct drm_connector *connector)
 					struct udl_drm_connector,
 					connector);
 
-	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 	kfree(udl_connector->edid);
 	kfree(connector);
@@ -123,24 +122,22 @@ static const struct drm_connector_funcs udl_connector_funcs = {
 	.set_property = udl_connector_set_property,
 };
 
-int udl_connector_init(struct drm_device *dev, struct drm_encoder *encoder)
+struct drm_connector *udl_connector_init(struct drm_device *dev)
 {
 	struct udl_drm_connector *udl_connector;
 	struct drm_connector *connector;
 
 	udl_connector = kzalloc(sizeof(struct udl_drm_connector), GFP_KERNEL);
 	if (!udl_connector)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	connector = &udl_connector->connector;
 	drm_connector_init(dev, connector, &udl_connector_funcs,
 			   DRM_MODE_CONNECTOR_DVII);
 	drm_connector_helper_add(connector, &udl_connector_helper_funcs);
 
-	drm_connector_register(connector);
-	drm_connector_attach_encoder(connector, encoder);
 	connector->polled = DRM_CONNECTOR_POLL_HPD |
 		DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
-	return 0;
+	return connector;
 }
diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index 4de00bddef39..e6a669f6f204 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -73,7 +73,7 @@ struct udl_device {
 int udl_modeset_init(struct drm_device *dev);
 void udl_modeset_restore(struct drm_device *dev);
 void udl_modeset_cleanup(struct drm_device *dev);
-int udl_connector_init(struct drm_device *dev, struct drm_encoder *encoder);
+struct drm_connector *udl_connector_init(struct drm_device *dev);
 
 struct drm_encoder *udl_encoder_init(struct drm_device *dev);
 
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 91af25caed64..5bb1522036c7 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -421,7 +421,10 @@ static const struct drm_mode_config_funcs udl_mode_funcs = {
 
 int udl_modeset_init(struct drm_device *dev)
 {
+	struct drm_connector *connector;
 	struct drm_encoder *encoder;
+	int ret;
+
 	drm_mode_config_init(dev);
 
 	dev->mode_config.min_width = 640;
@@ -435,13 +438,22 @@ int udl_modeset_init(struct drm_device *dev)
 
 	dev->mode_config.funcs = &udl_mode_funcs;
 
+	connector = udl_connector_init(dev);
+	if (IS_ERR(connector)) {
+		ret = PTR_ERR(connector);
+		goto err_drm_mode_config_cleanup;
+	}
+
 	udl_crtc_init(dev);
 
 	encoder = udl_encoder_init(dev);
-
-	udl_connector_init(dev, encoder);
+	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;
+
+err_drm_mode_config_cleanup:
+	drm_mode_config_cleanup(dev);
+	return ret;
 }
 
 void udl_modeset_restore(struct drm_device *dev)
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
