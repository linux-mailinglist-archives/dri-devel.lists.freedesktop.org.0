Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 660F82A9883
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 16:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC9E6EA9B;
	Fri,  6 Nov 2020 15:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDA66EA9C;
 Fri,  6 Nov 2020 15:26:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 409C6ABAE;
 Fri,  6 Nov 2020 15:26:35 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, yuq825@gmail.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, sean@poorly.run, eric@anholt.net,
 kraxel@redhat.com, rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com
Subject: [PATCH v2 1/2] drm/shmem-helper: Use cached mappings by default
Date: Fri,  6 Nov 2020 16:26:31 +0100
Message-Id: <20201106152632.26530-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201106152632.26530-1-tzimmermann@suse.de>
References: <20201106152632.26530-1-tzimmermann@suse.de>
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

v2:
	* recreate patch on top of latest SHMEM helpers
	* update lima, panfrost, v3d to select writecombine (Daniel, Rob)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c  | 11 ++++++-----
 drivers/gpu/drm/lima/lima_gem.c         |  2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c |  2 +-
 drivers/gpu/drm/v3d/v3d_bo.c            |  2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c |  1 -
 include/drm/drm_gem_shmem_helper.h      |  4 ++--
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 8233bda4692f..ddec0e190f29 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -54,10 +54,12 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
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
 
@@ -278,7 +280,7 @@ static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
 		if (ret)
 			goto err_zero_use;
 
-		if (!shmem->map_cached)
+		if (shmem->map_wc)
 			prot = pgprot_writecombine(prot);
 		shmem->vaddr = vmap(shmem->pages, obj->size >> PAGE_SHIFT,
 				    VM_MAP, prot);
@@ -487,7 +489,6 @@ drm_gem_shmem_create_object_cached(struct drm_device *dev, size_t size)
 	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
 	if (!shmem)
 		return NULL;
-	shmem->map_cached = true;
 
 	return &shmem->base;
 }
@@ -616,7 +617,7 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 
 	vma->vm_flags |= VM_MIXEDMAP | VM_DONTEXPAND;
 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
-	if (!shmem->map_cached)
+	if (shmem->map_wc)
 		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
 	vma->vm_ops = &drm_gem_shmem_vm_ops;
 
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 11223fe348df..bbab1413eb0c 100644
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
index fb9f7334ce18..f77b72d995f9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -230,7 +230,7 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
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
index 2d3aa7baffe4..47e3b69c3927 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -144,7 +144,6 @@ struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 
 	dshmem = &shmem->base.base;
 	dshmem->base.funcs = &virtio_gpu_shmem_funcs;
-	dshmem->map_cached = true;
 	return &dshmem->base;
 }
 
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 5381f0c8cf6f..268d0284ae02 100644
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
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
