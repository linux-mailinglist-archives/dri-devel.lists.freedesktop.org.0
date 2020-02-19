Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 792AE16419E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9616EB5B;
	Wed, 19 Feb 2020 10:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7E66EB55
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:22:01 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id b17so6179346wmb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=98aE60yYnvqzW8xAVh0+2yGWtNwIPCzdU/tOzXa3kuc=;
 b=Euxnz1rW+1YZ6oV7O8qJUk2x7/Tv6ajgmpY7CcH658SZfSsTHzokVyu72XXZpEJtvo
 8u6S3eZUq/SY5ztmCvW7FMYjv+XPXUjMG7EO5/0Ecn+3RsJ9Xt/tZ6N+w1Nb2XA8z2+8
 36cVkDFeV5EeTIO8CXOJJwkQlWmYPkYZLsqeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=98aE60yYnvqzW8xAVh0+2yGWtNwIPCzdU/tOzXa3kuc=;
 b=ClKd3n/oEOaeSw2QSOBSYIfJH+JkP3XaGzvHKrK4wi/N/PoQT8if8YecOaMCjIZAa2
 ClV9f76vaxZ05neKOEg2ELa9sSvT+JrQONONlYPPHL3JlJXyyd5qG3PFcYa+0j+oyUuC
 q6NJAzaVkfnwGTuEXmf8GCHxJaB08av4TbBp21SZ1FDlm7ZgjDuSBigpRiA9ob3oXO6G
 v+N9i9CEGVXj9MY6na0eIrk+8iG+ZfbK/GagROVozLs7/bz+nZ21ciXKYDvkKuIjrgJF
 kX6F5nzk/+fiNyLed2VBoHT17RN2wqucFBD+/uLEElxJWqLwJ0BN9oiI7TW9TsUi0L77
 TQzg==
X-Gm-Message-State: APjAAAVZyQdJ7YDTxZ4b3bzabz1s1pHhPZ/CPYgFgWY0zuylEO8MHABv
 zx+Ur/OreuECrxBSKVd+PBBwl27DJas=
X-Google-Smtp-Source: APXvYqxyU9HXvLDZUE+VZfVbP6h0+9rxj2yeM+hsCc/QpL89m/Tz6m3GWo/k8MfHjaqjdlMbxsNwaw==
X-Received: by 2002:a05:600c:414e:: with SMTP id
 h14mr1663456wmm.179.1582107720218; 
 Wed, 19 Feb 2020 02:22:00 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:21:59 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 24/52] drm: Manage drm_gem_init with drmm_
Date: Wed, 19 Feb 2020 11:20:54 +0100
Message-Id: <20200219102122.1607365-25-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
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

We might want to look into pushing this down into drm_mm_init, but
that would mean rolling out return codes to a pile of functions
unfortunately. So let's leave that for now.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_drv.c      |  8 +-------
 drivers/gpu/drm/drm_gem.c      | 21 ++++++++++-----------
 drivers/gpu/drm/drm_internal.h |  1 -
 3 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 03a1fb377830..7b3df1188da9 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -688,13 +688,10 @@ int drm_dev_init(struct drm_device *dev,
 
 	ret = drm_dev_set_unique(dev, dev_name(parent));
 	if (ret)
-		goto err_setunique;
+		goto err;
 
 	return 0;
 
-err_setunique:
-	if (drm_core_check_feature(dev, DRIVER_GEM))
-		drm_gem_destroy(dev);
 err:
 	drm_managed_release(dev);
 
@@ -756,9 +753,6 @@ EXPORT_SYMBOL(devm_drm_dev_init);
 void drm_dev_fini(struct drm_device *dev)
 {
 	drm_vblank_cleanup(dev);
-
-	if (drm_core_check_feature(dev, DRIVER_GEM))
-		drm_gem_destroy(dev);
 }
 EXPORT_SYMBOL(drm_dev_fini);
 
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 0b6e6623735e..31095e0f6b9f 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -44,6 +44,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vma_manager.h>
 
@@ -77,6 +78,12 @@
  * up at a later date, and as our interface with shmfs for memory allocation.
  */
 
+static void
+drm_gem_init_release(struct drm_device *dev, void *ptr)
+{
+	drm_vma_offset_manager_destroy(dev->vma_offset_manager);
+}
+
 /**
  * drm_gem_init - Initialize the GEM device fields
  * @dev: drm_devic structure to initialize
@@ -89,7 +96,8 @@ drm_gem_init(struct drm_device *dev)
 	mutex_init(&dev->object_name_lock);
 	idr_init_base(&dev->object_name_idr, 1);
 
-	vma_offset_manager = kzalloc(sizeof(*vma_offset_manager), GFP_KERNEL);
+	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
+					  GFP_KERNEL);
 	if (!vma_offset_manager) {
 		DRM_ERROR("out of memory\n");
 		return -ENOMEM;
@@ -100,16 +108,7 @@ drm_gem_init(struct drm_device *dev)
 				    DRM_FILE_PAGE_OFFSET_START,
 				    DRM_FILE_PAGE_OFFSET_SIZE);
 
-	return 0;
-}
-
-void
-drm_gem_destroy(struct drm_device *dev)
-{
-
-	drm_vma_offset_manager_destroy(dev->vma_offset_manager);
-	kfree(dev->vma_offset_manager);
-	dev->vma_offset_manager = NULL;
+	return drmm_add_action(dev, drm_gem_init_release, NULL);
 }
 
 /**
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 8c2628dfc6c7..cb09e95a795e 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -144,7 +144,6 @@ void drm_sysfs_lease_event(struct drm_device *dev);
 /* drm_gem.c */
 struct drm_gem_object;
 int drm_gem_init(struct drm_device *dev);
-void drm_gem_destroy(struct drm_device *dev);
 int drm_gem_handle_create_tail(struct drm_file *file_priv,
 			       struct drm_gem_object *obj,
 			       u32 *handlep);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
