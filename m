Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D951182C0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:49:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C3F6E869;
	Tue, 10 Dec 2019 08:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8B86E860
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:49:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 19317B039;
 Tue, 10 Dec 2019 08:49:08 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org, zboszor@pr.hu
Subject: [PATCH v3 3/9] drm/udl: Switch to atomic suspend/resume helpers
Date: Tue, 10 Dec 2019 09:48:59 +0100
Message-Id: <20191210084905.5570-4-tzimmermann@suse.de>
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can use the generic suspend/resume helpers for atomic modesetting.
Switch udl over.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/udl/udl_drv.c     |  7 ++-----
 drivers/gpu/drm/udl/udl_drv.h     |  1 -
 drivers/gpu/drm/udl/udl_modeset.c | 14 --------------
 3 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index aeb96920757c..b3fa6bf41acc 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -21,17 +21,14 @@ static int udl_usb_suspend(struct usb_interface *interface,
 {
 	struct drm_device *dev = usb_get_intfdata(interface);
 
-	drm_kms_helper_poll_disable(dev);
-	return 0;
+	return drm_mode_config_helper_suspend(dev);
 }
 
 static int udl_usb_resume(struct usb_interface *interface)
 {
 	struct drm_device *dev = usb_get_intfdata(interface);
 
-	drm_kms_helper_poll_enable(dev);
-	udl_modeset_restore(dev);
-	return 0;
+	return drm_mode_config_helper_resume(dev);
 }
 
 DEFINE_DRM_GEM_FOPS(udl_driver_fops);
diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index c7f32c41f649..e98d70487eab 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -72,7 +72,6 @@ struct udl_device {
 
 /* modeset */
 int udl_modeset_init(struct drm_device *dev);
-void udl_modeset_restore(struct drm_device *dev);
 void udl_modeset_cleanup(struct drm_device *dev);
 struct drm_connector *udl_connector_init(struct drm_device *dev);
 
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 36b7844e8cf4..cde6b7ff9599 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -438,20 +438,6 @@ int udl_modeset_init(struct drm_device *dev)
 	return ret;
 }
 
-void udl_modeset_restore(struct drm_device *dev)
-{
-	struct udl_device *udl = dev->dev_private;
-	struct drm_crtc *crtc = &udl->display_pipe.crtc;
-	struct drm_plane *primary = &udl->display_pipe.plane;
-	struct drm_framebuffer *fb = primary->fb;
-
-	if (!fb)
-		return;
-
-	udl_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
-	udl_handle_damage(fb, 0, 0, fb->width, fb->height);
-}
-
 void udl_modeset_cleanup(struct drm_device *dev)
 {
 	drm_mode_config_cleanup(dev);
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
