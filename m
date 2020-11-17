Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF082B62A9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 14:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738DD6E21D;
	Tue, 17 Nov 2020 13:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408406E20F;
 Tue, 17 Nov 2020 13:32:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A359FB0BE;
 Tue, 17 Nov 2020 13:31:58 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, yuq825@gmail.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, sean@poorly.run, eric@anholt.net,
 kraxel@redhat.com, rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, hdegoede@redhat.com
Subject: [PATCH v3 2/2] drm/shmem-helper: Removed
 drm_gem_shmem_create_object_cached()
Date: Tue, 17 Nov 2020 14:31:56 +0100
Message-Id: <20201117133156.26822-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201117133156.26822-1-tzimmermann@suse.de>
References: <20201117133156.26822-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, lima@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cached page mappings are now the default for SHMEM GEM objects. Remove
the obsolete create function for cached mappings.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 26 --------------------------
 drivers/gpu/drm/mgag200/mgag200_drv.c  |  1 -
 drivers/gpu/drm/udl/udl_drv.c          |  2 --
 drivers/gpu/drm/vkms/vkms_drv.c        |  1 -
 include/drm/drm_gem_shmem_helper.h     |  3 ---
 5 files changed, 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index b1c7a316f232..9825c378dfa6 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -479,32 +479,6 @@ bool drm_gem_shmem_purge(struct drm_gem_object *obj)
 }
 EXPORT_SYMBOL(drm_gem_shmem_purge);
 
-/**
- * drm_gem_shmem_create_object_cached - Create a shmem buffer object with
- *                                      cached mappings
- * @dev: DRM device
- * @size: Size of the object to allocate
- *
- * By default, shmem buffer objects use writecombine mappings. This
- * function implements struct drm_driver.gem_create_object for shmem
- * buffer objects with cached mappings.
- *
- * Returns:
- * A struct drm_gem_shmem_object * on success or NULL negative on failure.
- */
-struct drm_gem_object *
-drm_gem_shmem_create_object_cached(struct drm_device *dev, size_t size)
-{
-	struct drm_gem_shmem_object *shmem;
-
-	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
-	if (!shmem)
-		return NULL;
-
-	return &shmem->base;
-}
-EXPORT_SYMBOL(drm_gem_shmem_create_object_cached);
-
 /**
  * drm_gem_shmem_dumb_create - Create a dumb shmem buffer object
  * @file: DRM file structure to create the dumb buffer for
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 0f07f259503d..a977c9f49719 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -37,7 +37,6 @@ static const struct drm_driver mgag200_driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
-	.gem_create_object = drm_gem_shmem_create_object_cached,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 };
 
diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index b5a8dd9fdf02..9269092697d8 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -38,8 +38,6 @@ static const struct drm_driver driver = {
 	.driver_features = DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
 
 	/* GEM hooks */
-	.gem_create_object = drm_gem_shmem_create_object_cached,
-
 	.fops = &udl_driver_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 1a1b5bc8e121..d4d39227f2ed 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -82,7 +82,6 @@ static const struct drm_driver vkms_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
 	.release		= vkms_release,
 	.fops			= &vkms_driver_fops,
-	.gem_create_object = drm_gem_shmem_create_object_cached,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 
 	.name			= DRIVER_NAME,
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index f32801db3203..434328d8a0d9 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -133,9 +133,6 @@ drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
 				 struct drm_device *dev, size_t size,
 				 uint32_t *handle);
 
-struct drm_gem_object *
-drm_gem_shmem_create_object_cached(struct drm_device *dev, size_t size);
-
 int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			      struct drm_mode_create_dumb *args);
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
