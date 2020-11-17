Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 669762B62A6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 14:32:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E37E6E20F;
	Tue, 17 Nov 2020 13:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93786E212;
 Tue, 17 Nov 2020 13:32:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67719AF93;
 Tue, 17 Nov 2020 13:31:58 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, yuq825@gmail.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, sean@poorly.run, eric@anholt.net,
 kraxel@redhat.com, rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, hdegoede@redhat.com
Subject: [PATCH v3 1/2] drm/shmem-helper: Use cached mappings by default
Date: Tue, 17 Nov 2020 14:31:55 +0100
Message-Id: <20201117133156.26822-2-tzimmermann@suse.de>
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

SHMEM-buffer backing storage is allocated from system memory; which is
typically cachable. The default mode for SHMEM objects is writecombine
though.

Unify SHMEM semantics by defaulting to cached mappings. The exception
is pages imported via dma-buf. DMA memory is usually not cached.

DRM drivers that require write-combined mappings set the map_wc flag
in struct drm_gem_shmem_object to true. This currently affects lima,
panfrost and v3d.

The drivers mgag200, udl, virtio and vkms continue to use default
shmem mappings.

The drivers cirrus and gm12u320 change caching flags. Both used
writecombine and now switch over to shmem defaults. Both drivers use
SHMEM objects as shadow buffers for internal video memory, so cached
mappings will not affect them negatively.

v3:
	* set value of shmem pointer before dereferencing it in
	  __drm_gem_shmem_create() (Dan, kernel test robot)
v2:
	* recreate patch on top of latest SHMEM helpers
	* update lima, panfrost, v3d to select writecombine (Daniel, Rob)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c  | 14 ++++++++------
 drivers/gpu/drm/lima/lima_gem.c         |  2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c |  2 +-
 drivers/gpu/drm/v3d/v3d_bo.c            |  2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c |  1 -
 include/drm/drm_gem_shmem_helper.h      |  4 ++--
 6 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 499189c48f0b..b1c7a316f232 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -51,13 +51,17 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
 	if (!obj)
 		return ERR_PTR(-ENOMEM);
 
+	shmem = to_drm_gem_shmem_obj(obj);
+
 	if (!obj->funcs)
 		obj->funcs = &drm_gem_shmem_funcs;
 
-	if (private)
+	if (private) {
 		drm_gem_private_object_init(dev, obj, size);
-	else
+		shmem->map_wc = false; /* dma-buf mappings use always writecombine */
+	} else {
 		ret = drm_gem_object_init(dev, obj, size);
+	}
 	if (ret)
 		goto err_free;
 
@@ -65,7 +69,6 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
 	if (ret)
 		goto err_release;
 
-	shmem = to_drm_gem_shmem_obj(obj);
 	mutex_init(&shmem->pages_lock);
 	mutex_init(&shmem->vmap_lock);
 	INIT_LIST_HEAD(&shmem->madv_list);
@@ -284,7 +287,7 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem, struct
 		if (ret)
 			goto err_zero_use;
 
-		if (!shmem->map_cached)
+		if (shmem->map_wc)
 			prot = pgprot_writecombine(prot);
 		shmem->vaddr = vmap(shmem->pages, obj->size >> PAGE_SHIFT,
 				    VM_MAP, prot);
@@ -497,7 +500,6 @@ drm_gem_shmem_create_object_cached(struct drm_device *dev, size_t size)
 	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
 	if (!shmem)
 		return NULL;
-	shmem->map_cached = true;
 
 	return &shmem->base;
 }
@@ -626,7 +628,7 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 
 	vma->vm_flags |= VM_MIXEDMAP | VM_DONTEXPAND;
 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
-	if (!shmem->map_cached)
+	if (shmem->map_wc)
 		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
 	vma->vm_ops = &drm_gem_shmem_vm_ops;
 
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 832e5280a6ed..de62966243cd 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -225,7 +225,7 @@ struct drm_gem_object *lima_gem_create_object(struct drm_device *dev, size_t siz
 
 	mutex_init(&bo->lock);
 	INIT_LIST_HEAD(&bo->va);
-
+	bo->base.map_wc = true;
 	bo->base.base.funcs = &lima_gem_funcs;
 
 	return &bo->base.base;
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 57a31dd0ffed..3e0723bc36bd 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -228,7 +228,7 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
 	INIT_LIST_HEAD(&obj->mappings.list);
 	mutex_init(&obj->mappings.lock);
 	obj->base.base.funcs = &panfrost_gem_funcs;
-	obj->base.map_cached = pfdev->coherent;
+	obj->base.map_wc = !pfdev->coherent;
 
 	return &obj->base.base;
 }
diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index 8b52cb25877c..6a8731ab9d7d 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -78,7 +78,7 @@ struct drm_gem_object *v3d_create_object(struct drm_device *dev, size_t size)
 	obj = &bo->base.base;
 
 	obj->funcs = &v3d_gem_funcs;
-
+	bo->base.map_wc = true;
 	INIT_LIST_HEAD(&bo->unref_head);
 
 	return &bo->base.base;
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index d9ad27e00905..d69a5b6da553 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -144,7 +144,6 @@ struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 
 	dshmem = &shmem->base.base;
 	dshmem->base.funcs = &virtio_gpu_shmem_funcs;
-	dshmem->map_cached = true;
 	return &dshmem->base;
 }
 
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 3449a0353fe0..f32801db3203 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -98,9 +98,9 @@ struct drm_gem_shmem_object {
 	unsigned int vmap_use_count;
 
 	/**
-	 * @map_cached: map object cached (instead of using writecombine).
+	 * @map_wc: map object write-combined (instead of using shmem defaults).
 	 */
-	bool map_cached;
+	bool map_wc;
 };
 
 #define to_drm_gem_shmem_obj(obj) \
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
