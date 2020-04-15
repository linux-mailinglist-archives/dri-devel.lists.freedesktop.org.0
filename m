Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FDE1A94B1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECE189B57;
	Wed, 15 Apr 2020 07:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED33E6E8A1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:17 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a81so17655799wmf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PxVTSouR1TyBKjD4k/5dVEyIh4AxWSKjDZy7rMGX8Zk=;
 b=hDK+BiDRX4sM7nRmRqepvD3umIcWmlVjpGfir3xtaBEtgOWJhlAIQL1AUMiXtAAP1W
 iI1APD9u2+w7Whw7HXiI4hhORf7md0zywZsUKatRhaeCQCq+J2sEqKRF/DdfR5WT8TgW
 XDmAh0DKD8bTIwcRpoQNnQ+ClSQN4Vw/26qA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PxVTSouR1TyBKjD4k/5dVEyIh4AxWSKjDZy7rMGX8Zk=;
 b=fd/hRca1PwvMjtXzEcVV3brCYyxhvXhv1jle8mBpmOA3xVROC5aAXnvw/GramriD5e
 tRpohYu0cUq/3OCREjR2D23lEaB49N+u3Rn9K2DEOO5+xnUAVGQlevZkpLNwgHdHVkai
 lxF0STMRLPgLGEiTxexdpPsBEmR6IAq8LCawLmxEWbkxske/bmDF6bICm+6Zu87l5Dsh
 rRYZ94nNoEepm+KGNcOw0iZdw/ZggOn+R2ccgNCSxYrJEgVM+/Tm98iEGEdXcHF+DSAG
 ILhtyOiEXzSwSzXnESo9urQZIzOnvYWrsUSq0wFLIndQvxivZ0xMs2BZ8PhE0Mw2cb3g
 FLyQ==
X-Gm-Message-State: AGi0PuYQgDMZZBx1JxBwee8DAXO4Tiy1AKDqYSzrFaTNBXmXIRvkwe8N
 oE9PiSoUimzFast7z2pW0Yr/ow==
X-Google-Smtp-Source: APiQypKbTcknJ3S+rY5DwcekGtyrccMLDhhhwYrlpUkTnQVB4HoT91V9IsPE9VFGrPYQMbg5Fu3VYA==
X-Received: by 2002:a1c:4d18:: with SMTP id o24mr3568827wmh.141.1586936476542; 
 Wed, 15 Apr 2020 00:41:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:15 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 34/59] drm/armada: Don't use drm_device->dev_private
Date: Wed, 15 Apr 2020 09:40:09 +0200
Message-Id: <20200415074034.175360-35-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
 Russell King <linux@armlinux.org.uk>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Upcasting using a container_of macro is more typesafe, faster and
easier for the compiler to optimize.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Russell King <linux@armlinux.org.uk>
---
 drivers/gpu/drm/armada/armada_crtc.c    | 4 ++--
 drivers/gpu/drm/armada/armada_debugfs.c | 2 +-
 drivers/gpu/drm/armada/armada_drm.h     | 2 ++
 drivers/gpu/drm/armada/armada_drv.c     | 4 +---
 drivers/gpu/drm/armada/armada_fbdev.c   | 4 ++--
 drivers/gpu/drm/armada/armada_gem.c     | 4 ++--
 drivers/gpu/drm/armada/armada_overlay.c | 8 ++++----
 7 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
index c2b92acd1e9a..8686e50226a5 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -757,7 +757,7 @@ static int armada_drm_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 static void armada_drm_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct armada_crtc *dcrtc = drm_to_armada_crtc(crtc);
-	struct armada_private *priv = crtc->dev->dev_private;
+	struct armada_private *priv = drm_to_armada_dev(crtc->dev);
 
 	if (dcrtc->cursor_obj)
 		drm_gem_object_put_unlocked(&dcrtc->cursor_obj->obj);
@@ -901,7 +901,7 @@ static int armada_drm_crtc_create(struct drm_device *drm, struct device *dev,
 	struct resource *res, int irq, const struct armada_variant *variant,
 	struct device_node *port)
 {
-	struct armada_private *priv = drm->dev_private;
+	struct armada_private *priv = drm_to_armada_dev(drm);
 	struct armada_crtc *dcrtc;
 	struct drm_plane *primary;
 	void __iomem *base;
diff --git a/drivers/gpu/drm/armada/armada_debugfs.c b/drivers/gpu/drm/armada/armada_debugfs.c
index c6fc2f1d58e9..29f4b52e3c8d 100644
--- a/drivers/gpu/drm/armada/armada_debugfs.c
+++ b/drivers/gpu/drm/armada/armada_debugfs.c
@@ -19,7 +19,7 @@ static int armada_debugfs_gem_linear_show(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = m->private;
 	struct drm_device *dev = node->minor->dev;
-	struct armada_private *priv = dev->dev_private;
+	struct armada_private *priv = drm_to_armada_dev(dev);
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	mutex_lock(&priv->linear_lock);
diff --git a/drivers/gpu/drm/armada/armada_drm.h b/drivers/gpu/drm/armada/armada_drm.h
index a11bdaccbb33..6a5a87932576 100644
--- a/drivers/gpu/drm/armada/armada_drm.h
+++ b/drivers/gpu/drm/armada/armada_drm.h
@@ -73,6 +73,8 @@ struct armada_private {
 #endif
 };
 
+#define drm_to_armada_dev(dev) container_of(dev, struct armada_private, drm)
+
 int armada_fbdev_init(struct drm_device *);
 void armada_fbdev_fini(struct drm_device *);
 
diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 2546ff9d1c92..2a9ee76ee585 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -106,8 +106,6 @@ static int armada_drm_bind(struct device *dev)
 		return ret;
 	}
 
-	priv->drm.dev_private = priv;
-
 	dev_set_drvdata(dev, &priv->drm);
 
 	/* Mode setting support */
@@ -169,7 +167,7 @@ static int armada_drm_bind(struct device *dev)
 static void armada_drm_unbind(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
-	struct armada_private *priv = drm->dev_private;
+	struct armada_private *priv = drm_to_armada_dev(drm);
 
 	drm_kms_helper_poll_fini(&priv->drm);
 	armada_fbdev_fini(&priv->drm);
diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index f2dc371bd8e5..c9a414b3a8c4 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -117,7 +117,7 @@ static const struct drm_fb_helper_funcs armada_fb_helper_funcs = {
 
 int armada_fbdev_init(struct drm_device *dev)
 {
-	struct armada_private *priv = dev->dev_private;
+	struct armada_private *priv = drm_to_armada_dev(dev);
 	struct drm_fb_helper *fbh;
 	int ret;
 
@@ -151,7 +151,7 @@ int armada_fbdev_init(struct drm_device *dev)
 
 void armada_fbdev_fini(struct drm_device *dev)
 {
-	struct armada_private *priv = dev->dev_private;
+	struct armada_private *priv = drm_to_armada_dev(dev);
 	struct drm_fb_helper *fbh = priv->fbdev;
 
 	if (fbh) {
diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 976685f2939e..2c7d5f71e715 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -39,7 +39,7 @@ static size_t roundup_gem_size(size_t size)
 void armada_gem_free_object(struct drm_gem_object *obj)
 {
 	struct armada_gem_object *dobj = drm_to_armada_gem(obj);
-	struct armada_private *priv = obj->dev->dev_private;
+	struct armada_private *priv = drm_to_armada_dev(obj->dev);
 
 	DRM_DEBUG_DRIVER("release obj %p\n", dobj);
 
@@ -77,7 +77,7 @@ void armada_gem_free_object(struct drm_gem_object *obj)
 int
 armada_gem_linear_back(struct drm_device *dev, struct armada_gem_object *obj)
 {
-	struct armada_private *priv = dev->dev_private;
+	struct armada_private *priv = drm_to_armada_dev(dev);
 	size_t size = obj->obj.size;
 
 	if (obj->page || obj->linear)
diff --git a/drivers/gpu/drm/armada/armada_overlay.c b/drivers/gpu/drm/armada/armada_overlay.c
index 07f0da4d9ba1..30e01101f59e 100644
--- a/drivers/gpu/drm/armada/armada_overlay.c
+++ b/drivers/gpu/drm/armada/armada_overlay.c
@@ -344,7 +344,7 @@ static int armada_overlay_set_property(struct drm_plane *plane,
 	struct drm_plane_state *state, struct drm_property *property,
 	uint64_t val)
 {
-	struct armada_private *priv = plane->dev->dev_private;
+	struct armada_private *priv = drm_to_armada_dev(plane->dev);
 
 #define K2R(val) (((val) >> 0) & 0xff)
 #define K2G(val) (((val) >> 8) & 0xff)
@@ -412,7 +412,7 @@ static int armada_overlay_get_property(struct drm_plane *plane,
 	const struct drm_plane_state *state, struct drm_property *property,
 	uint64_t *val)
 {
-	struct armada_private *priv = plane->dev->dev_private;
+	struct armada_private *priv = drm_to_armada_dev(plane->dev);
 
 #define C2K(c,s)	(((c) >> (s)) & 0xff)
 #define R2BGR(r,g,b,s)	(C2K(r,s) << 0 | C2K(g,s) << 8 | C2K(b,s) << 16)
@@ -505,7 +505,7 @@ static const struct drm_prop_enum_list armada_drm_colorkey_enum_list[] = {
 
 static int armada_overlay_create_properties(struct drm_device *dev)
 {
-	struct armada_private *priv = dev->dev_private;
+	struct armada_private *priv = drm_to_armada_dev(dev);
 
 	if (priv->colorkey_prop)
 		return 0;
@@ -539,7 +539,7 @@ static int armada_overlay_create_properties(struct drm_device *dev)
 
 int armada_overlay_plane_create(struct drm_device *dev, unsigned long crtcs)
 {
-	struct armada_private *priv = dev->dev_private;
+	struct armada_private *priv = drm_to_armada_dev(dev);
 	struct drm_mode_object *mobj;
 	struct drm_plane *overlay;
 	int ret;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
