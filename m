Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 185FF2886C2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 12:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184FC6ECAE;
	Fri,  9 Oct 2020 10:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10356ECAC;
 Fri,  9 Oct 2020 10:21:42 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22666551-1500050 
 for multiple; Fri, 09 Oct 2020 11:21:33 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vgem: Replace vgem_object_funcs with the common drm shmem
 helper
Date: Fri,  9 Oct 2020 11:21:32 +0100
Message-Id: <20201009102132.22770-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vgem is a minimalistic driver that provides shmemfs objects to
userspace that may then be used as an in-memory surface and transported
across dma-buf to other drivers. Since it's introduction,
drm_gem_shmem_helper now provides the same shmemfs facilities and so we
can trim vgem to wrap the helper.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/Kconfig         |   1 +
 drivers/gpu/drm/vgem/vgem_drv.c | 281 ++------------------------------
 drivers/gpu/drm/vgem/vgem_drv.h |  11 --
 3 files changed, 13 insertions(+), 280 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 147d61b9674e..db2ff76638cd 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -278,6 +278,7 @@ source "drivers/gpu/drm/i915/Kconfig"
 config DRM_VGEM
 	tristate "Virtual GEM provider"
 	depends on DRM
+	select DRM_GEM_SHMEM_HELPER
 	help
 	  Choose this option to get a virtual graphics memory manager,
 	  as used by Mesa's software renderer for enhanced performance.
diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index fa54a6d1403d..73cb17c4f7a8 100644
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
@@ -159,41 +84,25 @@ static void vgem_postclose(struct drm_device *dev, struct drm_file *file)
 	kfree(vfile);
 }
 
-static struct drm_vgem_gem_object *__vgem_gem_create(struct drm_device *dev,
+static struct drm_gem_shmem_object *__vgem_gem_create(struct drm_device *dev,
 						unsigned long size)
 {
-	struct drm_vgem_gem_object *obj;
-	int ret;
-
-	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
-	if (!obj)
-		return ERR_PTR(-ENOMEM);
+	struct drm_gem_shmem_object *obj;
 
-	obj->base.funcs = &vgem_gem_object_funcs;
-
-	ret = drm_gem_object_init(dev, &obj->base, roundup(size, PAGE_SIZE));
-	if (ret) {
-		kfree(obj);
-		return ERR_PTR(ret);
-	}
-
-	mutex_init(&obj->pages_lock);
+	obj = drm_gem_shmem_create(dev, round_up(size, PAGE_SIZE));
+	if (IS_ERR(obj))
+		return obj;
 
+	obj->map_cached = true;
 	return obj;
 }
 
-static void __vgem_gem_destroy(struct drm_vgem_gem_object *obj)
-{
-	drm_gem_object_release(&obj->base);
-	kfree(obj);
-}
-
 static struct drm_gem_object *vgem_gem_create(struct drm_device *dev,
 					      struct drm_file *file,
 					      unsigned int *handle,
 					      unsigned long size)
 {
-	struct drm_vgem_gem_object *obj;
+	struct drm_gem_shmem_object *obj;
 	int ret;
 
 	obj = __vgem_gem_create(dev, size);
@@ -239,96 +148,9 @@ static struct drm_ioctl_desc vgem_ioctls[] = {
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
-
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
-{
-	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
-	long n_pages = obj->size >> PAGE_SHIFT;
-	struct page **pages;
+DEFINE_DRM_GEM_FOPS(vgem_driver_fops);
 
-	pages = vgem_pin_pages(bo);
-	if (IS_ERR(pages))
-		return PTR_ERR(pages);
-
-	/* Flush the object from the CPU cache so that importers can rely
-	 * on coherent indirect access via the exported dma-address.
-	 */
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
+static struct drm_gem_object *vgem_prime_import(struct drm_device *dev,
 						struct dma_buf *dma_buf)
 {
 	struct vgem_device *vgem = container_of(dev, typeof(*vgem), drm);
@@ -336,85 +158,6 @@ static struct drm_gem_object* vgem_prime_import(struct drm_device *dev,
 	return drm_gem_prime_import_dev(dev, dma_buf, &vgem->platform->dev);
 }
 
-static struct drm_gem_object *vgem_prime_import_sg_table(struct drm_device *dev,
-			struct dma_buf_attachment *attach, struct sg_table *sg)
-{
-	struct drm_vgem_gem_object *obj;
-	int npages;
-
-	obj = __vgem_gem_create(dev, attach->dmabuf->size);
-	if (IS_ERR(obj))
-		return ERR_CAST(obj);
-
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
-	drm_prime_sg_to_page_addr_arrays(obj->table, obj->pages, NULL,
-					npages);
-	return &obj->base;
-}
-
-static void *vgem_prime_vmap(struct drm_gem_object *obj)
-{
-	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
-	long n_pages = obj->size >> PAGE_SHIFT;
-	struct page **pages;
-
-	pages = vgem_pin_pages(bo);
-	if (IS_ERR(pages))
-		return NULL;
-
-	return vmap(pages, n_pages, 0, pgprot_writecombine(PAGE_KERNEL));
-}
-
-static void vgem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
-{
-	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
-
-	vunmap(vaddr);
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
-	fput(vma->vm_file);
-	vma->vm_file = get_file(obj->filp);
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
 static struct drm_driver vgem_driver = {
 	.driver_features		= DRIVER_GEM | DRIVER_RENDER,
 	.open				= vgem_open,
@@ -428,8 +171,8 @@ static struct drm_driver vgem_driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = vgem_prime_import,
-	.gem_prime_import_sg_table = vgem_prime_import_sg_table,
-	.gem_prime_mmap = vgem_prime_mmap,
+	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
+	.gem_prime_mmap = drm_gem_prime_mmap,
 
 	.name	= DRIVER_NAME,
 	.desc	= DRIVER_DESC,
diff --git a/drivers/gpu/drm/vgem/vgem_drv.h b/drivers/gpu/drm/vgem/vgem_drv.h
index 0ed300317f87..34cf63e6fb3d 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.h
+++ b/drivers/gpu/drm/vgem/vgem_drv.h
@@ -39,17 +39,6 @@ struct vgem_file {
 	struct mutex fence_mutex;
 };
 
-#define to_vgem_bo(x) container_of(x, struct drm_vgem_gem_object, base)
-struct drm_vgem_gem_object {
-	struct drm_gem_object base;
-
-	struct page **pages;
-	unsigned int pages_pin_count;
-	struct mutex pages_lock;
-
-	struct sg_table *table;
-};
-
 int vgem_fence_open(struct vgem_file *file);
 int vgem_fence_attach_ioctl(struct drm_device *dev,
 			    void *data,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
