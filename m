Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E9017671F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455C26E89E;
	Mon,  2 Mar 2020 22:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848B06E8A5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:27:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x7so1915400wrr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rk9iTrN8/Bv4mQt4SyS/7jsoLVRCP0eELsXRpTf0WzU=;
 b=fm3/pwHsWUA9uRxtp6ZUAHQDNT9+xlAOPlZT7hj1QMwSx9KyE4+GCuu782v/XbHXRF
 BKuvFP89yTwsv0pNzB7dILGP5EJO5E7sPZkw4Mcx9PR2By9ZoKIvY6YzLO9a8J6l/Tl/
 sdz0XeQ11sVzEGnLO3lVQGxGTkBHzDECsY96M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rk9iTrN8/Bv4mQt4SyS/7jsoLVRCP0eELsXRpTf0WzU=;
 b=G8ZA/9DpnDo8lzVUcsbUc73hrlbluq9FazmHAT5Bil6LGIXNp4exJ298LCNwk1VoPt
 XkNU97G/S1cnh4NYz+I3SWwLNUpojYWzWJaXvOe0piwf/fSxAj1D5CBHvo70ogcqR+kt
 aLfhh+5WCvM5iOM6JgRmihRbwrn36KcaX6sWEnqpKlnsQyXEtnD2k8IZ9z8Kip9LBKfZ
 1OEfvvS+DvoRuY74BblZ554tLMjcsXhv6OHFbH7aL5G66PBAu2VRRYzGDQqM77Wet9wn
 t3Vcu9jQWOUarMrGdIRAx8XjqwUXf+pyyOm97T6gcQ0jZ+KAfySFH0NZIujCwlkvZ7yC
 DoyQ==
X-Gm-Message-State: ANhLgQ36/oMx/6H3P8XLlvPuo8DKfvL/u/0AtypSxFOn1Vzj5F2CDbga
 tBxiirUT8ACFW/dpTt5x6SswaVwAJoI=
X-Google-Smtp-Source: ADFU+vuPCe+vcsMpit+SB85uR4pFwwErb3S2ZhLIkGVVIl3k77d2tGNJcDC2dqBWJ580VnczVAuiow==
X-Received: by 2002:adf:f349:: with SMTP id e9mr1755379wrp.56.1583188030880;
 Mon, 02 Mar 2020 14:27:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:27:09 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 24/51] drm: Manage drm_vblank_cleanup with drmm_
Date: Mon,  2 Mar 2020 23:26:04 +0100
Message-Id: <20200302222631.3861340-25-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nothing special here, except that this is the first time that we
automatically clean up something that's initialized with an explicit
driver call. But the cleanup was done at the very of the release
sequence for all drivers, and that's still the case. At least without
more uses of drmm_ through explicit driver calls.

Also for this one we need drmm_kcalloc, so lets add those

v2: Sort includes (Laurent)

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_drv.c      |  1 -
 drivers/gpu/drm/drm_internal.h |  1 -
 drivers/gpu/drm/drm_vblank.c   | 31 ++++++++++++-------------------
 include/drm/drm_managed.h      | 16 ++++++++++++++++
 4 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 9a646155dfc6..90b6ae81d431 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -752,7 +752,6 @@ EXPORT_SYMBOL(devm_drm_dev_init);
  */
 void drm_dev_fini(struct drm_device *dev)
 {
-	drm_vblank_cleanup(dev);
 }
 EXPORT_SYMBOL(drm_dev_fini);
 
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index cb09e95a795e..e67015d07c4c 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -94,7 +94,6 @@ void drm_managed_release(struct drm_device *dev);
 
 /* drm_vblank.c */
 void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe);
-void drm_vblank_cleanup(struct drm_device *dev);
 
 /* IOCTLS */
 int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 47fc4339ec7f..5a6ec8aa0873 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -30,6 +30,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
@@ -425,14 +426,10 @@ static void vblank_disable_fn(struct timer_list *t)
 	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
 }
 
-void drm_vblank_cleanup(struct drm_device *dev)
+static void drm_vblank_init_release(struct drm_device *dev, void *ptr)
 {
 	unsigned int pipe;
 
-	/* Bail if the driver didn't call drm_vblank_init() */
-	if (dev->num_crtcs == 0)
-		return;
-
 	for (pipe = 0; pipe < dev->num_crtcs; pipe++) {
 		struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 
@@ -441,10 +438,6 @@ void drm_vblank_cleanup(struct drm_device *dev)
 
 		del_timer_sync(&vblank->disable_timer);
 	}
-
-	kfree(dev->vblank);
-
-	dev->num_crtcs = 0;
 }
 
 /**
@@ -453,25 +446,29 @@ void drm_vblank_cleanup(struct drm_device *dev)
  * @num_crtcs: number of CRTCs supported by @dev
  *
  * This function initializes vblank support for @num_crtcs display pipelines.
- * Cleanup is handled by the DRM core, or through calling drm_dev_fini() for
- * drivers with a &drm_driver.release callback.
+ * Cleanup is handled automatically through a cleanup function added with
+ * drmm_add_action().
  *
  * Returns:
  * Zero on success or a negative error code on failure.
  */
 int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
 {
-	int ret = -ENOMEM;
+	int ret;
 	unsigned int i;
 
 	spin_lock_init(&dev->vbl_lock);
 	spin_lock_init(&dev->vblank_time_lock);
 
+	dev->vblank = drmm_kcalloc(dev, num_crtcs, sizeof(*dev->vblank), GFP_KERNEL);
+	if (!dev->vblank)
+		return -ENOMEM;
+
 	dev->num_crtcs = num_crtcs;
 
-	dev->vblank = kcalloc(num_crtcs, sizeof(*dev->vblank), GFP_KERNEL);
-	if (!dev->vblank)
-		goto err;
+	ret = drmm_add_action(dev, drm_vblank_init_release, NULL);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < num_crtcs; i++) {
 		struct drm_vblank_crtc *vblank = &dev->vblank[i];
@@ -486,10 +483,6 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
 	DRM_INFO("Supports vblank timestamp caching Rev 2 (21.10.2013).\n");
 
 	return 0;
-
-err:
-	dev->num_crtcs = 0;
-	return ret;
 }
 EXPORT_SYMBOL(drm_vblank_init);
 
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index 5280209dff92..2b1ba2ad5582 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -4,6 +4,7 @@
 #define _DRM_MANAGED_H_
 
 #include <linux/gfp.h>
+#include <linux/overflow.h>
 #include <linux/types.h>
 
 struct drm_device;
@@ -28,6 +29,21 @@ static inline void *drmm_kzalloc(struct drm_device *dev, size_t size, gfp_t gfp)
 {
 	return drmm_kmalloc(dev, size, gfp | __GFP_ZERO);
 }
+static inline void *drmm_kmalloc_array(struct drm_device *dev,
+				       size_t n, size_t size, gfp_t flags)
+{
+	size_t bytes;
+
+	if (unlikely(check_mul_overflow(n, size, &bytes)))
+		return NULL;
+
+	return drmm_kmalloc(dev, bytes, flags);
+}
+static inline void *drmm_kcalloc(struct drm_device *dev,
+				 size_t n, size_t size, gfp_t flags)
+{
+	return drmm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
+}
 char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
 
 void drmm_kfree(struct drm_device *dev, void *data);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
