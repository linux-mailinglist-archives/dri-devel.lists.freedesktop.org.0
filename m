Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8B825DBF4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C006EBB5;
	Fri,  4 Sep 2020 14:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575656EBA8
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 14:39:54 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g4so7002858wrs.5
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 07:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ngnjw4b87FVgLFp3DG4dqI3ag9bSR6/o9qW3jrTvImw=;
 b=iusnaNwzP82/3qnV7GWoGzjQ94PS7jXmiALsczDhqaf5b+1A4F3oMX2eU0hPUWBd4g
 /fVHOf0swr5JImJQAfCcBErJaXbdHgOr79by8x5dskpBPDvBILzY0wl56t9ZFlPKaI6T
 o2oJ5Yk5yZjPjyGaY1Q3NZGtwgkDTJ4S0WFsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ngnjw4b87FVgLFp3DG4dqI3ag9bSR6/o9qW3jrTvImw=;
 b=iUY1u1nFtoSZoduffYWpatuDJwdWNRoVJuNHn8XR9YrHo0AAohDP1SibgkwX/aTjQO
 bpr6c27eOk5KvEyuTY1ZzJsVvzcySjt38uO8ISMD9Iw/FWbeXoAGYiccip9VWC6wjjJ2
 rjrem7EmSM53mm6BiC517qsBSFPcFoDz5EAlUZVnbJe/ozXsoal29FwTuF1ZCynExzcW
 CO5u+GZSLHVPcbv92usgSVCkXwN3YNzh1lQr1/lMvOLbAol12HylK1ECu9ETATq7FvVR
 BHHhZy5Z79h6boLJElpGppAtSmL3piJRg7zYYiZUmONaATMyRbW0z3hFZa/aWVWFY9+e
 4c7A==
X-Gm-Message-State: AOAM532rBtaFEe6kCBcqLEsBlrmY1qDqkoetOZ2gpGuwQarxx99/c/1q
 XBeuRn4vQaeo8yIwtvGPyuGnkmzhoQ0PBJs5
X-Google-Smtp-Source: ABdhPJziaZxOJ45OfjXUJhXcP4OWSmPIFKK6VOsyQijukyJyq+HxLnVHl20unrzpOlRuua/wl5lhZQ==
X-Received: by 2002:adf:9bc9:: with SMTP id e9mr7879847wrc.123.1599230392688; 
 Fri, 04 Sep 2020 07:39:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm11597949wrv.94.2020.09.04.07.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 07:39:52 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/24] drm/armada: Don't use drm_device->dev_private
Date: Fri,  4 Sep 2020 16:39:19 +0200
Message-Id: <20200904143941.110665-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, Daniel Vetter <daniel.vetter@intel.com>
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
index 38dfaa46d306..a887b6a5f8bd 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -757,7 +757,7 @@ static int armada_drm_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 static void armada_drm_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct armada_crtc *dcrtc = drm_to_armada_crtc(crtc);
-	struct armada_private *priv = crtc->dev->dev_private;
+	struct armada_private *priv = drm_to_armada_dev(crtc->dev);
 
 	if (dcrtc->cursor_obj)
 		drm_gem_object_put(&dcrtc->cursor_obj->obj);
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
index a8d5908b3922..980d3f1f8f16 100644
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
index 0c4601275507..38f5170c0fea 100644
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
index 8005614d2e6b..ecf8a55e93d9 100644
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
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
