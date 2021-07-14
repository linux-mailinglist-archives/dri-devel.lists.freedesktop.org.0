Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ED73C84A3
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 14:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076386E250;
	Wed, 14 Jul 2021 12:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0776E24E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 12:45:36 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 m11-20020a05600c3b0bb0290228f19cb433so3829877wms.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 05:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H/PKPI6kUExpAHIORL0SiM/Tg0aXMOhRKnrcyoW3Wuk=;
 b=jdWiOEG5a/SH/Xy0UYVfU8DPsgzByzW5fDIxxX4hnL8jvlOBl17B9p+BdLFXFEfQrn
 byPqFzCO13OOvBimjFyhjUY92gGK8iL6SQO8G4HG2r5Jy0KoJEvifbcA8kRfaX8sNCaQ
 O+SzOceNh9ixT0Rx0CvvttcHnIR8m0DuNAAZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H/PKPI6kUExpAHIORL0SiM/Tg0aXMOhRKnrcyoW3Wuk=;
 b=hm5ukJ5eN4F0nsAgWR7J0lRYflltvtu+BwC2ybE0D4/qHc32Gkm19GJ6AHgoqO4tjU
 m+8Qg4SLlj0mgZIXBW+STAnL3mu34AcmvI63HlFYXTnoRD+c1gAQw3dknISnQl67POIp
 1iHFzgCEo+JBtaOdaQy5XwGumXo84LxOQal4lHzr+TlZ0n9DyE0jyuykGMUedEpGM4Sd
 SAQ0eS0WSNJ7NMyMKNzO+Nkn1MCGpFHuX7n6rtT+OPpZvj77DiadBH5/7wFMjfUjbQhk
 I4t18AYDRlWYIL1WWn9tQWJIVG9F8TiBHE4pC9t9kDkeDVu837fbtKTZ5OojDpC9+kK/
 fm8g==
X-Gm-Message-State: AOAM5315FmiQ13kstrX0sOmuNLAc/TgSFxRqQj5k97BeHJZo5yFzKOoc
 RXZ437YXDtbK9uzjVIXFgDfcchszKozUaw==
X-Google-Smtp-Source: ABdhPJwphwDY61a4nR44/4aM+s277rUQfIaJY4usxVnguArSjvmzi+va+kU8O6siLQAGMkyg2DZ63Q==
X-Received: by 2002:a05:600c:2f1a:: with SMTP id
 r26mr3835677wmn.41.1626266735414; 
 Wed, 14 Jul 2021 05:45:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 204sm2045763wma.30.2021.07.14.05.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 05:45:34 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/vgem: use shmem helpers
Date: Wed, 14 Jul 2021 14:45:29 +0200
Message-Id: <20210714124529.2056256-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713205153.1896059-5-daniel.vetter@ffwll.ch>
References: <20210713205153.1896059-5-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Aside from deleting lots of code the real motivation here is to switch
the mmap over to VM_PFNMAP, to be more consistent with what real gpu
drivers do. They're all VM_PFNMP, which means get_user_pages doesn't
work, and even if you try and there's a struct page behind that,
touching it and mucking around with its refcount can upset drivers
real bad.

v2: Review from Thomas:
- sort #include
- drop more dead code that I didn't spot somehow

v3: select DRM_GEM_SHMEM_HELPER to make it build (intel-gfx-ci)

v4: I got tricked by 0cf2ef46c6c0 ("drm/shmem-helper: Use cached
mappings by default"), and we need WC in vgem because vgem doesn't
have explicit begin/end cpu access ioctls.

Also add a comment why exactly vgem has to use wc.

v5: Don't set obj->base.funcs, it will default to drm_gem_shmem_funcs
(Thomas)

v6: vgem also needs an MMU for remapping

v7: I absolutely butchered the rebases over the vgem mmap change and
revert and broke the patch. Actually go back to v6 from before the
vgem mmap changes.

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/Kconfig         |   5 +-
 drivers/gpu/drm/vgem/vgem_drv.c | 342 ++------------------------------
 2 files changed, 16 insertions(+), 331 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 314eefa39892..28f7d2006e8b 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -272,7 +272,8 @@ source "drivers/gpu/drm/kmb/Kconfig"
 
 config DRM_VGEM
 	tristate "Virtual GEM provider"
-	depends on DRM
+	depends on DRM && MMU
+	select DRM_GEM_SHMEM_HELPER
 	help
 	  Choose this option to get a virtual graphics memory manager,
 	  as used by Mesa's software renderer for enhanced performance.
@@ -280,7 +281,7 @@ config DRM_VGEM
 
 config DRM_VKMS
 	tristate "Virtual KMS (EXPERIMENTAL)"
-	depends on DRM
+	depends on DRM && MMU
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
 	select CRC32
diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index bf38a7e319d1..a87eafa89e9f 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -38,6 +38,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_prime.h>
@@ -50,87 +51,11 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
-static const struct drm_gem_object_funcs vgem_gem_object_funcs;
-
 static struct vgem_device {
 	struct drm_device drm;
 	struct platform_device *platform;
 } *vgem_device;
 
-static void vgem_gem_free_object(struct drm_gem_object *obj)
-{
-	struct drm_vgem_gem_object *vgem_obj = to_vgem_bo(obj);
-
-	kvfree(vgem_obj->pages);
-	mutex_destroy(&vgem_obj->pages_lock);
-
-	if (obj->import_attach)
-		drm_prime_gem_destroy(obj, vgem_obj->table);
-
-	drm_gem_object_release(obj);
-	kfree(vgem_obj);
-}
-
-static vm_fault_t vgem_gem_fault(struct vm_fault *vmf)
-{
-	struct vm_area_struct *vma = vmf->vma;
-	struct drm_vgem_gem_object *obj = vma->vm_private_data;
-	/* We don't use vmf->pgoff since that has the fake offset */
-	unsigned long vaddr = vmf->address;
-	vm_fault_t ret = VM_FAULT_SIGBUS;
-	loff_t num_pages;
-	pgoff_t page_offset;
-	page_offset = (vaddr - vma->vm_start) >> PAGE_SHIFT;
-
-	num_pages = DIV_ROUND_UP(obj->base.size, PAGE_SIZE);
-
-	if (page_offset >= num_pages)
-		return VM_FAULT_SIGBUS;
-
-	mutex_lock(&obj->pages_lock);
-	if (obj->pages) {
-		get_page(obj->pages[page_offset]);
-		vmf->page = obj->pages[page_offset];
-		ret = 0;
-	}
-	mutex_unlock(&obj->pages_lock);
-	if (ret) {
-		struct page *page;
-
-		page = shmem_read_mapping_page(
-					file_inode(obj->base.filp)->i_mapping,
-					page_offset);
-		if (!IS_ERR(page)) {
-			vmf->page = page;
-			ret = 0;
-		} else switch (PTR_ERR(page)) {
-			case -ENOSPC:
-			case -ENOMEM:
-				ret = VM_FAULT_OOM;
-				break;
-			case -EBUSY:
-				ret = VM_FAULT_RETRY;
-				break;
-			case -EFAULT:
-			case -EINVAL:
-				ret = VM_FAULT_SIGBUS;
-				break;
-			default:
-				WARN_ON(PTR_ERR(page));
-				ret = VM_FAULT_SIGBUS;
-				break;
-		}
-
-	}
-	return ret;
-}
-
-static const struct vm_operations_struct vgem_gem_vm_ops = {
-	.fault = vgem_gem_fault,
-	.open = drm_gem_vm_open,
-	.close = drm_gem_vm_close,
-};
-
 static int vgem_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct vgem_file *vfile;
@@ -159,266 +84,30 @@ static void vgem_postclose(struct drm_device *dev, struct drm_file *file)
 	kfree(vfile);
 }
 
-static struct drm_vgem_gem_object *__vgem_gem_create(struct drm_device *dev,
-						unsigned long size)
-{
-	struct drm_vgem_gem_object *obj;
-	int ret;
-
-	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
-	if (!obj)
-		return ERR_PTR(-ENOMEM);
-
-	obj->base.funcs = &vgem_gem_object_funcs;
-
-	ret = drm_gem_object_init(dev, &obj->base, roundup(size, PAGE_SIZE));
-	if (ret) {
-		kfree(obj);
-		return ERR_PTR(ret);
-	}
-
-	mutex_init(&obj->pages_lock);
-
-	return obj;
-}
-
-static void __vgem_gem_destroy(struct drm_vgem_gem_object *obj)
-{
-	drm_gem_object_release(&obj->base);
-	kfree(obj);
-}
-
-static struct drm_gem_object *vgem_gem_create(struct drm_device *dev,
-					      struct drm_file *file,
-					      unsigned int *handle,
-					      unsigned long size)
-{
-	struct drm_vgem_gem_object *obj;
-	int ret;
-
-	obj = __vgem_gem_create(dev, size);
-	if (IS_ERR(obj))
-		return ERR_CAST(obj);
-
-	ret = drm_gem_handle_create(file, &obj->base, handle);
-	if (ret) {
-		drm_gem_object_put(&obj->base);
-		return ERR_PTR(ret);
-	}
-
-	return &obj->base;
-}
-
-static int vgem_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
-				struct drm_mode_create_dumb *args)
-{
-	struct drm_gem_object *gem_object;
-	u64 pitch, size;
-
-	pitch = args->width * DIV_ROUND_UP(args->bpp, 8);
-	size = args->height * pitch;
-	if (size == 0)
-		return -EINVAL;
-
-	gem_object = vgem_gem_create(dev, file, &args->handle, size);
-	if (IS_ERR(gem_object))
-		return PTR_ERR(gem_object);
-
-	args->size = gem_object->size;
-	args->pitch = pitch;
-
-	drm_gem_object_put(gem_object);
-
-	DRM_DEBUG("Created object of size %llu\n", args->size);
-
-	return 0;
-}
-
 static struct drm_ioctl_desc vgem_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(VGEM_FENCE_ATTACH, vgem_fence_attach_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(VGEM_FENCE_SIGNAL, vgem_fence_signal_ioctl, DRM_RENDER_ALLOW),
 };
 
-static int vgem_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	unsigned long flags = vma->vm_flags;
-	int ret;
-
-	ret = drm_gem_mmap(filp, vma);
-	if (ret)
-		return ret;
-
-	/* Keep the WC mmaping set by drm_gem_mmap() but our pages
-	 * are ordinary and not special.
-	 */
-	vma->vm_flags = flags | VM_DONTEXPAND | VM_DONTDUMP;
-	return 0;
-}
+DEFINE_DRM_GEM_FOPS(vgem_driver_fops);
 
-static const struct file_operations vgem_driver_fops = {
-	.owner		= THIS_MODULE,
-	.open		= drm_open,
-	.mmap		= vgem_mmap,
-	.poll		= drm_poll,
-	.read		= drm_read,
-	.unlocked_ioctl = drm_ioctl,
-	.compat_ioctl	= drm_compat_ioctl,
-	.release	= drm_release,
-};
-
-static struct page **vgem_pin_pages(struct drm_vgem_gem_object *bo)
-{
-	mutex_lock(&bo->pages_lock);
-	if (bo->pages_pin_count++ == 0) {
-		struct page **pages;
-
-		pages = drm_gem_get_pages(&bo->base);
-		if (IS_ERR(pages)) {
-			bo->pages_pin_count--;
-			mutex_unlock(&bo->pages_lock);
-			return pages;
-		}
-
-		bo->pages = pages;
-	}
-	mutex_unlock(&bo->pages_lock);
-
-	return bo->pages;
-}
-
-static void vgem_unpin_pages(struct drm_vgem_gem_object *bo)
-{
-	mutex_lock(&bo->pages_lock);
-	if (--bo->pages_pin_count == 0) {
-		drm_gem_put_pages(&bo->base, bo->pages, true, true);
-		bo->pages = NULL;
-	}
-	mutex_unlock(&bo->pages_lock);
-}
-
-static int vgem_prime_pin(struct drm_gem_object *obj)
+static struct drm_gem_object *vgem_gem_create_object(struct drm_device *dev, size_t size)
 {
-	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
-	long n_pages = obj->size >> PAGE_SHIFT;
-	struct page **pages;
+	struct drm_gem_shmem_object *obj;
 
-	pages = vgem_pin_pages(bo);
-	if (IS_ERR(pages))
-		return PTR_ERR(pages);
+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+	if (!obj)
+		return NULL;
 
-	/* Flush the object from the CPU cache so that importers can rely
-	 * on coherent indirect access via the exported dma-address.
+	/*
+	 * vgem doesn't have any begin/end cpu access ioctls, therefore must use
+	 * coherent memory or dma-buf sharing just wont work.
 	 */
-	drm_clflush_pages(pages, n_pages);
-
-	return 0;
-}
-
-static void vgem_prime_unpin(struct drm_gem_object *obj)
-{
-	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
-
-	vgem_unpin_pages(bo);
-}
-
-static struct sg_table *vgem_prime_get_sg_table(struct drm_gem_object *obj)
-{
-	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
-
-	return drm_prime_pages_to_sg(obj->dev, bo->pages, bo->base.size >> PAGE_SHIFT);
-}
-
-static struct drm_gem_object* vgem_prime_import(struct drm_device *dev,
-						struct dma_buf *dma_buf)
-{
-	struct vgem_device *vgem = container_of(dev, typeof(*vgem), drm);
-
-	return drm_gem_prime_import_dev(dev, dma_buf, &vgem->platform->dev);
-}
-
-static struct drm_gem_object *vgem_prime_import_sg_table(struct drm_device *dev,
-			struct dma_buf_attachment *attach, struct sg_table *sg)
-{
-	struct drm_vgem_gem_object *obj;
-	int npages;
-
-	obj = __vgem_gem_create(dev, attach->dmabuf->size);
-	if (IS_ERR(obj))
-		return ERR_CAST(obj);
+	obj->map_wc = true;
 
-	npages = PAGE_ALIGN(attach->dmabuf->size) / PAGE_SIZE;
-
-	obj->table = sg;
-	obj->pages = kvmalloc_array(npages, sizeof(struct page *), GFP_KERNEL);
-	if (!obj->pages) {
-		__vgem_gem_destroy(obj);
-		return ERR_PTR(-ENOMEM);
-	}
-
-	obj->pages_pin_count++; /* perma-pinned */
-	drm_prime_sg_to_page_array(obj->table, obj->pages, npages);
 	return &obj->base;
 }
 
-static int vgem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
-{
-	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
-	long n_pages = obj->size >> PAGE_SHIFT;
-	struct page **pages;
-	void *vaddr;
-
-	pages = vgem_pin_pages(bo);
-	if (IS_ERR(pages))
-		return PTR_ERR(pages);
-
-	vaddr = vmap(pages, n_pages, 0, pgprot_writecombine(PAGE_KERNEL));
-	if (!vaddr)
-		return -ENOMEM;
-	dma_buf_map_set_vaddr(map, vaddr);
-
-	return 0;
-}
-
-static void vgem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
-{
-	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
-
-	vunmap(map->vaddr);
-	vgem_unpin_pages(bo);
-}
-
-static int vgem_prime_mmap(struct drm_gem_object *obj,
-			   struct vm_area_struct *vma)
-{
-	int ret;
-
-	if (obj->size < vma->vm_end - vma->vm_start)
-		return -EINVAL;
-
-	if (!obj->filp)
-		return -ENODEV;
-
-	ret = call_mmap(obj->filp, vma);
-	if (ret)
-		return ret;
-
-	vma_set_file(vma, obj->filp);
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
-	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
-
-	return 0;
-}
-
-static const struct drm_gem_object_funcs vgem_gem_object_funcs = {
-	.free = vgem_gem_free_object,
-	.pin = vgem_prime_pin,
-	.unpin = vgem_prime_unpin,
-	.get_sg_table = vgem_prime_get_sg_table,
-	.vmap = vgem_prime_vmap,
-	.vunmap = vgem_prime_vunmap,
-	.vm_ops = &vgem_gem_vm_ops,
-};
-
 static const struct drm_driver vgem_driver = {
 	.driver_features		= DRIVER_GEM | DRIVER_RENDER,
 	.open				= vgem_open,
@@ -427,13 +116,8 @@ static const struct drm_driver vgem_driver = {
 	.num_ioctls 			= ARRAY_SIZE(vgem_ioctls),
 	.fops				= &vgem_driver_fops,
 
-	.dumb_create			= vgem_gem_dumb_create,
-
-	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_import = vgem_prime_import,
-	.gem_prime_import_sg_table = vgem_prime_import_sg_table,
-	.gem_prime_mmap = vgem_prime_mmap,
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	.gem_create_object		= vgem_gem_create_object,
 
 	.name	= DRIVER_NAME,
 	.desc	= DRIVER_DESC,
-- 
2.32.0

