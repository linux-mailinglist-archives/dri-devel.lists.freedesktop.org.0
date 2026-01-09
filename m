Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A583D0A385
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 14:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA8510E8B8;
	Fri,  9 Jan 2026 13:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BjPQmrNL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E2910E2C8
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 13:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767964096;
 bh=AFDUto1YO2XeUN5kY/GcKXwlft1MwAA5BhIOG2NM0zg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BjPQmrNL1dPtoE9yjDSet8lKsbEfPHQHJOkSci/um0dDnr4JRWbWpzirDfAXFpRu6
 TvrIPFviJJhkzWAFSWFRYq+BZsQUxcKYIEGtW0JacZjQgDTEvZ1T6dkFZ8QKVl0FZU
 KUt44ZjEs8jJoSm/THNDTDAXOtH6TOMaCLcCzZjriqhnySBxjVh+ROiuD8R98eCxhq
 TWdUcc6A19TYBhc7T8m9C8qIxvgoLtDIppevtSNBL2YbGeUI7tKA/hobrRk0ybai1p
 PxOX66py6S0+tsXgdJlw9Ib1YpiunUT1XqMFOonJlB1OT5/bDd3ZVuATtajnxCR5Ny
 52t05Nl5PTzTw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 27ED517E1529;
 Fri,  9 Jan 2026 14:08:16 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
Subject: [PATCH v1 5/9] drm/panthor: Part ways with drm_gem_shmem_object
Date: Fri,  9 Jan 2026 14:07:57 +0100
Message-ID: <20260109130801.1239558-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109130801.1239558-1-boris.brezillon@collabora.com>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While drm_gem_shmem_object does most of the job we need it to do, the
way sub-resources (pages, sgt, vmap) are handled and their lifetimes
gets in the way of BO reclaim. There has been attempts to address
that [1], but in the meantime, new gem_shmem users were introduced
(accel drivers), and some of them manually free some of these resources.
This makes things harder to control/sanitize/validate.

Thomas Zimmerman is not a huge fan of enforcing lifetimes of sub-resources
and forcing gem_shmem users to go through new gem_shmem helpers when they
need manual control of some sort, and I believe this is a dead end if
we don't force users to follow some stricter rules through carefully
designed helpers, because there will always be one user doing crazy things
with gem_shmem_object internals, which ends up tripping out the common
helpers when they are called.

The consensus we reached was that we would be better off forking
gem_shmem in panthor. So here we are, parting ways with gem_shmem. The
current transition tries to minimize the changes, but there are still
some aspects that are different, the main one being that we no longer
have a pages_use_count, and pages stays around until the GEM object is
destroyed (or when evicted once we've added a shrinker). The sgt also
no longer retains pages. This is losely based on how msm does things by
the way.

If there's any interest in sharing code (probably with msm, since the
panthor shrinker is going to be losely based on the msm implementation),
we can always change gears and do that once we have everything
working/merged.

[1]https://patchwork.kernel.org/project/dri-devel/patch/20240105184624.508603-1-dmitry.osipenko@collabora.com/

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/Kconfig         |   1 -
 drivers/gpu/drm/panthor/panthor_drv.c   |   7 +-
 drivers/gpu/drm/panthor/panthor_fw.c    |  16 +-
 drivers/gpu/drm/panthor/panthor_gem.c   | 696 ++++++++++++++++++++----
 drivers/gpu/drm/panthor/panthor_gem.h   |  62 ++-
 drivers/gpu/drm/panthor/panthor_mmu.c   |  49 +-
 drivers/gpu/drm/panthor/panthor_sched.c |   9 +-
 7 files changed, 666 insertions(+), 174 deletions(-)

diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
index 55b40ad07f3b..911e7f4810c3 100644
--- a/drivers/gpu/drm/panthor/Kconfig
+++ b/drivers/gpu/drm/panthor/Kconfig
@@ -8,7 +8,6 @@ config DRM_PANTHOR
 	depends on MMU
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select DRM_EXEC
-	select DRM_GEM_SHMEM_HELPER
 	select DRM_GPUVM
 	select DRM_SCHED
 	select IOMMU_IO_PGTABLE_LPAE
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 52c27a60c84a..90e9abc22d9e 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -19,6 +19,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_exec.h>
+#include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_print.h>
 #include <drm/drm_syncobj.h>
@@ -1457,7 +1458,7 @@ static int panthor_ioctl_bo_query_info(struct drm_device *ddev, void *data,
 	args->create_flags = bo->flags;
 
 	args->extra_flags = 0;
-	if (drm_gem_is_imported(&bo->base.base))
+	if (drm_gem_is_imported(&bo->base))
 		args->extra_flags |= DRM_PANTHOR_BO_IS_IMPORTED;
 
 	drm_gem_object_put(obj);
@@ -1671,8 +1672,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.major = 1,
 	.minor = 7,
 
-	.gem_create_object = panthor_gem_create_object,
-	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
+	.gem_prime_import_sg_table = panthor_gem_prime_import_sg_table,
 	.gem_prime_import = panthor_gem_prime_import,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init = panthor_debugfs_init,
@@ -1822,3 +1822,4 @@ module_exit(panthor_exit);
 MODULE_AUTHOR("Panthor Project Developers");
 MODULE_DESCRIPTION("Panthor DRM Driver");
 MODULE_LICENSE("Dual MIT/GPL");
+MODULE_IMPORT_NS("DMA_BUF");
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index a64ec8756bed..f135cf2130b8 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -627,7 +627,6 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 		u32 cache_mode = hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_MASK;
 		struct panthor_gem_object *bo;
 		u32 vm_map_flags = 0;
-		struct sg_table *sgt;
 		u64 va = hdr.va.start;
 
 		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_WR))
@@ -665,11 +664,12 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 		panthor_fw_init_section_mem(ptdev, section);
 
 		bo = to_panthor_bo(section->mem->obj);
-		sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
-		if (IS_ERR(sgt))
-			return PTR_ERR(sgt);
 
-		dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
+		/* An sgt should have been requested when the kernel BO was GPU-mapped. */
+		if (drm_WARN_ON_ONCE(&ptdev->base, !bo->dmap.sgt))
+			return -EINVAL;
+
+		dma_sync_sgtable_for_device(ptdev->base.dev, bo->dmap.sgt, DMA_TO_DEVICE);
 	}
 
 	if (hdr.va.start == CSF_MCU_SHARED_REGION_START)
@@ -729,8 +729,10 @@ panthor_reload_fw_sections(struct panthor_device *ptdev, bool full_reload)
 			continue;
 
 		panthor_fw_init_section_mem(ptdev, section);
-		sgt = drm_gem_shmem_get_pages_sgt(&to_panthor_bo(section->mem->obj)->base);
-		if (!drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(sgt)))
+
+		/* An sgt should have been requested when the kernel BO was GPU-mapped. */
+		sgt = to_panthor_bo(section->mem->obj)->dmap.sgt;
+		if (!drm_WARN_ON_ONCE(&ptdev->base, !sgt))
 			dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
 	}
 }
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 4b3d82f001d8..0e52c7a07c87 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -8,9 +8,11 @@
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/slab.h>
+#include <linux/vmalloc.h>
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_file.h>
+#include <drm/drm_prime.h>
 #include <drm/drm_print.h>
 #include <drm/panthor_drm.h>
 
@@ -44,7 +46,7 @@ static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo)
 
 static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
 {
-	struct panthor_device *ptdev = container_of(bo->base.base.dev,
+	struct panthor_device *ptdev = container_of(bo->base.dev,
 						    struct panthor_device, base);
 
 	bo->debugfs.creator.tgid = current->group_leader->pid;
@@ -57,7 +59,7 @@ static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
 
 static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
 {
-	struct panthor_device *ptdev = container_of(bo->base.base.dev,
+	struct panthor_device *ptdev = container_of(bo->base.dev,
 						    struct panthor_device, base);
 
 	if (list_empty(&bo->debugfs.node))
@@ -80,9 +82,9 @@ static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) {}
 #endif
 
 static bool
-should_map_wc(struct panthor_gem_object *bo, struct panthor_vm *exclusive_vm)
+should_map_wc(struct panthor_gem_object *bo)
 {
-	struct panthor_device *ptdev = container_of(bo->base.base.dev, struct panthor_device, base);
+	struct panthor_device *ptdev = container_of(bo->base.dev, struct panthor_device, base);
 
 	/* We can't do uncached mappings if the device is coherent,
 	 * because the zeroing done by the shmem layer at page allocation
@@ -112,6 +114,208 @@ should_map_wc(struct panthor_gem_object *bo, struct panthor_vm *exclusive_vm)
 	return true;
 }
 
+static void
+panthor_gem_backing_cleanup(struct panthor_gem_object *bo)
+{
+	if (!bo->backing.pages)
+		return;
+
+	drm_gem_put_pages(&bo->base, bo->backing.pages, true, false);
+	bo->backing.pages = NULL;
+}
+
+static int
+panthor_gem_backing_get_pages_locked(struct panthor_gem_object *bo)
+{
+	dma_resv_assert_held(bo->base.resv);
+
+	if (bo->backing.pages)
+		return 0;
+
+	bo->backing.pages = drm_gem_get_pages(&bo->base);
+	if (IS_ERR(bo->backing.pages)) {
+		drm_dbg_kms(bo->base.dev, "Failed to get pages (%pe)\n",
+			    bo->backing.pages);
+		return PTR_ERR(bo->backing.pages);
+	}
+
+	return 0;
+}
+
+static int panthor_gem_backing_pin_locked(struct panthor_gem_object *bo)
+{
+	int ret;
+
+	dma_resv_assert_held(bo->base.resv);
+	drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base));
+
+	if (refcount_inc_not_zero(&bo->backing.pin_count))
+		return 0;
+
+	ret = panthor_gem_backing_get_pages_locked(bo);
+	if (!ret)
+		refcount_set(&bo->backing.pin_count, 1);
+
+	return ret;
+}
+
+static void panthor_gem_backing_unpin_locked(struct panthor_gem_object *bo)
+{
+	dma_resv_assert_held(bo->base.resv);
+	drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base));
+
+	/* We don't release anything when pin_count drops to zero.
+	 * Pages stay there until an explicit cleanup is requested.
+	 */
+	if (!refcount_dec_not_one(&bo->backing.pin_count))
+		refcount_set(&bo->backing.pin_count, 0);
+}
+
+static void
+panthor_gem_dev_map_cleanup(struct panthor_gem_object *bo)
+{
+	if (!bo->dmap.sgt)
+		return;
+
+	dma_unmap_sgtable(drm_dev_dma_dev(bo->base.dev), bo->dmap.sgt, DMA_BIDIRECTIONAL, 0);
+	sg_free_table(bo->dmap.sgt);
+	kfree(bo->dmap.sgt);
+	bo->dmap.sgt = NULL;
+}
+
+static struct sg_table *
+panthor_gem_dev_map_get_sgt_locked(struct panthor_gem_object *bo)
+{
+	struct sg_table *sgt;
+	int ret;
+
+	dma_resv_assert_held(bo->base.resv);
+
+	if (bo->dmap.sgt)
+		return bo->dmap.sgt;
+
+	if (drm_WARN_ON_ONCE(bo->base.dev, !bo->backing.pages))
+		return ERR_PTR(-EINVAL);
+
+	/* Pages stay around after they've been allocated. At least that stands
+	 * until we add a shrinker.
+	 */
+	ret = panthor_gem_backing_get_pages_locked(bo);
+	if (ret)
+		return ERR_PTR(ret);
+
+	sgt = drm_prime_pages_to_sg(bo->base.dev, bo->backing.pages,
+				    bo->base.size >> PAGE_SHIFT);
+	if (IS_ERR(sgt))
+		return sgt;
+
+	/* Map the pages for use by the h/w. */
+	ret = dma_map_sgtable(drm_dev_dma_dev(bo->base.dev), sgt, DMA_BIDIRECTIONAL, 0);
+	if (ret)
+		goto err_free_sgt;
+
+	bo->dmap.sgt = sgt;
+	return sgt;
+
+err_free_sgt:
+	sg_free_table(sgt);
+	kfree(sgt);
+	return ERR_PTR(ret);
+}
+
+struct sg_table *
+panthor_gem_get_dev_sgt(struct panthor_gem_object *bo)
+{
+	struct sg_table *sgt;
+
+	dma_resv_lock(bo->base.resv, NULL);
+	sgt = panthor_gem_dev_map_get_sgt_locked(bo);
+	dma_resv_unlock(bo->base.resv);
+
+	return sgt;
+}
+
+static void
+panthor_gem_vmap_cleanup(struct panthor_gem_object *bo)
+{
+	if (!bo->cmap.vaddr)
+		return;
+
+	vunmap(bo->cmap.vaddr);
+	bo->cmap.vaddr = NULL;
+	panthor_gem_backing_unpin_locked(bo);
+}
+
+static int
+panthor_gem_prep_for_cpu_map_locked(struct panthor_gem_object *bo)
+{
+	if (should_map_wc(bo)) {
+		struct sg_table *sgt;
+
+		sgt = panthor_gem_dev_map_get_sgt_locked(bo);
+		if (IS_ERR(sgt))
+			return PTR_ERR(sgt);
+	}
+
+	return 0;
+}
+
+static void *
+panthor_gem_vmap_get_locked(struct panthor_gem_object *bo)
+{
+	pgprot_t prot = PAGE_KERNEL;
+	void *vaddr;
+	int ret;
+
+	dma_resv_assert_held(bo->base.resv);
+
+	if (drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base)))
+		return ERR_PTR(-EINVAL);
+
+	if (refcount_inc_not_zero(&bo->cmap.vaddr_use_count)) {
+		drm_WARN_ON_ONCE(bo->base.dev, !bo->cmap.vaddr);
+		return bo->cmap.vaddr;
+	}
+
+	ret = panthor_gem_backing_pin_locked(bo);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = panthor_gem_prep_for_cpu_map_locked(bo);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (should_map_wc(bo))
+		prot = pgprot_writecombine(prot);
+
+	vaddr = vmap(bo->backing.pages, bo->base.size >> PAGE_SHIFT, VM_MAP, prot);
+	if (!vaddr) {
+		ret = -ENOMEM;
+		goto err_unpin;
+	}
+
+	bo->cmap.vaddr = vaddr;
+	refcount_set(&bo->cmap.vaddr_use_count, 1);
+	return vaddr;
+
+err_unpin:
+	panthor_gem_backing_unpin_locked(bo);
+	return ERR_PTR(ret);
+}
+
+static void
+panthor_gem_vmap_put_locked(struct panthor_gem_object *bo)
+{
+	if (drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base)))
+		return;
+
+	if (refcount_dec_not_one(&bo->cmap.vaddr_use_count))
+		return;
+
+	refcount_set(&bo->cmap.vaddr_use_count, 0);
+	panthor_gem_vmap_cleanup(bo);
+}
+
 static void panthor_gem_free_object(struct drm_gem_object *obj)
 {
 	struct panthor_gem_object *bo = to_panthor_bo(obj);
@@ -127,8 +331,17 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
 
 	mutex_destroy(&bo->label.lock);
 
-	drm_gem_free_mmap_offset(&bo->base.base);
-	drm_gem_shmem_free(&bo->base);
+	if (drm_gem_is_imported(obj)) {
+		drm_prime_gem_destroy(obj, bo->dmap.sgt);
+	} else {
+		panthor_gem_vmap_cleanup(bo);
+		panthor_gem_dev_map_cleanup(bo);
+		panthor_gem_backing_cleanup(bo);
+	}
+
+	drm_gem_object_release(obj);
+
+	kfree(bo);
 	drm_gem_object_put(vm_root_gem);
 }
 
@@ -159,15 +372,15 @@ panthor_gem_prime_begin_cpu_access(struct dma_buf *dma_buf,
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 	struct drm_device *dev = obj->dev;
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	struct panthor_gem_object *bo = to_panthor_bo(obj);
 	struct dma_buf_attachment *attach;
 
 	dma_resv_lock(obj->resv, NULL);
-	if (shmem->sgt)
-		dma_sync_sgtable_for_cpu(dev->dev, shmem->sgt, dir);
+	if (bo->dmap.sgt)
+		dma_sync_sgtable_for_cpu(drm_dev_dma_dev(dev), bo->dmap.sgt, dir);
 
-	if (shmem->vaddr)
-		invalidate_kernel_vmap_range(shmem->vaddr, shmem->base.size);
+	if (bo->cmap.vaddr)
+		invalidate_kernel_vmap_range(bo->cmap.vaddr, bo->base.size);
 
 	list_for_each_entry(attach, &dma_buf->attachments, node) {
 		struct sg_table *sgt = attach->priv;
@@ -186,7 +399,7 @@ panthor_gem_prime_end_cpu_access(struct dma_buf *dma_buf,
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 	struct drm_device *dev = obj->dev;
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	struct panthor_gem_object *bo = to_panthor_bo(obj);
 	struct dma_buf_attachment *attach;
 
 	dma_resv_lock(obj->resv, NULL);
@@ -197,11 +410,11 @@ panthor_gem_prime_end_cpu_access(struct dma_buf *dma_buf,
 			dma_sync_sgtable_for_device(attach->dev, sgt, dir);
 	}
 
-	if (shmem->vaddr)
-		flush_kernel_vmap_range(shmem->vaddr, shmem->base.size);
+	if (bo->cmap.vaddr)
+		flush_kernel_vmap_range(bo->cmap.vaddr, bo->base.size);
 
-	if (shmem->sgt)
-		dma_sync_sgtable_for_device(dev->dev, shmem->sgt, dir);
+	if (bo->dmap.sgt)
+		dma_sync_sgtable_for_device(drm_dev_dma_dev(dev), bo->dmap.sgt, dir);
 
 	dma_resv_unlock(obj->resv);
 	return 0;
@@ -258,53 +471,339 @@ panthor_gem_prime_import(struct drm_device *dev,
 	return drm_gem_prime_import(dev, dma_buf);
 }
 
+static void panthor_gem_print_info(struct drm_printer *p, unsigned int indent,
+				   const struct drm_gem_object *obj)
+{
+	const struct panthor_gem_object *bo = to_panthor_bo(obj);
+
+	if (drm_gem_is_imported(&bo->base))
+		return;
+
+	drm_printf_indent(p, indent, "resident=%s\n", str_true_false(bo->backing.pages));
+	drm_printf_indent(p, indent, "pages_pin_count=%u\n", refcount_read(&bo->backing.pin_count));
+	drm_printf_indent(p, indent, "vmap_use_count=%u\n",
+			  refcount_read(&bo->cmap.vaddr_use_count));
+	drm_printf_indent(p, indent, "vaddr=%p\n", bo->cmap.vaddr);
+}
+
+static int panthor_gem_pin_locked(struct drm_gem_object *obj)
+{
+	if (drm_gem_is_imported(obj))
+		return 0;
+
+	return panthor_gem_backing_pin_locked(to_panthor_bo(obj));
+}
+
+static void panthor_gem_unpin_locked(struct drm_gem_object *obj)
+{
+	if (!drm_gem_is_imported(obj))
+		panthor_gem_backing_unpin_locked(to_panthor_bo(obj));
+}
+
+int panthor_gem_pin(struct panthor_gem_object *bo)
+{
+	int ret = 0;
+
+	if (drm_gem_is_imported(&bo->base))
+		return 0;
+
+	if (refcount_inc_not_zero(&bo->backing.pin_count))
+		return 0;
+
+	dma_resv_lock(bo->base.resv, NULL);
+	ret = panthor_gem_pin_locked(&bo->base);
+	dma_resv_unlock(bo->base.resv);
+
+	return ret;
+}
+
+void panthor_gem_unpin(struct panthor_gem_object *bo)
+{
+	if (drm_gem_is_imported(&bo->base))
+		return;
+
+	if (refcount_dec_not_one(&bo->backing.pin_count))
+		return;
+
+	dma_resv_lock(bo->base.resv, NULL);
+	panthor_gem_unpin_locked(&bo->base);
+	dma_resv_unlock(bo->base.resv);
+}
+
+static struct sg_table *panthor_gem_get_sg_table(struct drm_gem_object *obj)
+{
+	struct panthor_gem_object *bo = to_panthor_bo(obj);
+
+	drm_WARN_ON_ONCE(obj->dev, drm_gem_is_imported(obj));
+	drm_WARN_ON_ONCE(obj->dev, !bo->backing.pages);
+	drm_WARN_ON_ONCE(obj->dev, !refcount_read(&bo->backing.pin_count));
+
+	return drm_prime_pages_to_sg(obj->dev, bo->backing.pages, obj->size >> PAGE_SHIFT);
+}
+
+static int panthor_gem_vmap_locked(struct drm_gem_object *obj,
+				   struct iosys_map *map)
+{
+	struct panthor_gem_object *bo = to_panthor_bo(obj);
+	void *vaddr;
+
+	dma_resv_assert_held(obj->resv);
+
+	if (drm_gem_is_imported(obj))
+		return dma_buf_vmap(obj->import_attach->dmabuf, map);
+
+	vaddr = panthor_gem_vmap_get_locked(bo);
+	if (IS_ERR(vaddr))
+		return PTR_ERR(vaddr);
+
+	iosys_map_set_vaddr(map, vaddr);
+	return 0;
+}
+
+static void panthor_gem_vunmap_locked(struct drm_gem_object *obj,
+				      struct iosys_map *map)
+{
+	struct panthor_gem_object *bo = to_panthor_bo(obj);
+
+	dma_resv_assert_held(obj->resv);
+
+	if (drm_gem_is_imported(obj)) {
+		dma_buf_vunmap(obj->import_attach->dmabuf, map);
+	} else {
+		drm_WARN_ON_ONCE(obj->dev, bo->cmap.vaddr != map->vaddr);
+		panthor_gem_vmap_put_locked(bo);
+	}
+}
+
+static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct panthor_gem_object *bo = to_panthor_bo(obj);
+	int ret;
+
+	if (drm_gem_is_imported(obj)) {
+		/* Reset both vm_ops and vm_private_data, so we don't end up with
+		 * vm_ops pointing to our implementation if the dma-buf backend
+		 * doesn't set those fields.
+		 */
+		vma->vm_private_data = NULL;
+		vma->vm_ops = NULL;
+
+		ret = dma_buf_mmap(obj->dma_buf, vma, 0);
+
+		/* Drop the reference drm_gem_mmap_obj() acquired.*/
+		if (!ret)
+			drm_gem_object_put(obj);
+
+		return ret;
+	}
+
+	if (is_cow_mapping(vma->vm_flags))
+		return -EINVAL;
+
+	dma_resv_lock(obj->resv, NULL);
+	ret = panthor_gem_backing_get_pages_locked(bo);
+	if (!ret)
+		ret = panthor_gem_prep_for_cpu_map_locked(bo);
+	dma_resv_unlock(obj->resv);
+
+	if (ret)
+		return ret;
+
+	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
+	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+	if (should_map_wc(bo))
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+
+	return 0;
+}
+
 static enum drm_gem_object_status panthor_gem_status(struct drm_gem_object *obj)
 {
 	struct panthor_gem_object *bo = to_panthor_bo(obj);
 	enum drm_gem_object_status res = 0;
 
-	if (drm_gem_is_imported(&bo->base.base) || bo->base.pages)
+	if (drm_gem_is_imported(&bo->base) || bo->backing.pages)
 		res |= DRM_GEM_OBJECT_RESIDENT;
 
 	return res;
 }
 
-static const struct drm_gem_object_funcs panthor_gem_funcs = {
-	.free = panthor_gem_free_object,
-	.print_info = drm_gem_shmem_object_print_info,
-	.pin = drm_gem_shmem_object_pin,
-	.unpin = drm_gem_shmem_object_unpin,
-	.get_sg_table = drm_gem_shmem_object_get_sg_table,
-	.vmap = drm_gem_shmem_object_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
-	.mmap = drm_gem_shmem_object_mmap,
-	.status = panthor_gem_status,
-	.export = panthor_gem_prime_export,
-	.vm_ops = &drm_gem_shmem_vm_ops,
+static bool try_map_pmd(struct vm_fault *vmf, unsigned long addr, struct page *page)
+{
+#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
+	unsigned long pfn = page_to_pfn(page);
+	unsigned long paddr = pfn << PAGE_SHIFT;
+	bool aligned = (addr & ~PMD_MASK) == (paddr & ~PMD_MASK);
+
+	if (aligned &&
+	    pmd_none(*vmf->pmd) &&
+	    folio_test_pmd_mappable(page_folio(page))) {
+		pfn &= PMD_MASK >> PAGE_SHIFT;
+		if (vmf_insert_pfn_pmd(vmf, pfn, false) == VM_FAULT_NOPAGE)
+			return true;
+	}
+#endif
+
+	return false;
+}
+
+static vm_fault_t panthor_gem_fault(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct drm_gem_object *obj = vma->vm_private_data;
+	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
+	loff_t num_pages = obj->size >> PAGE_SHIFT;
+	vm_fault_t ret;
+	pgoff_t page_offset;
+	unsigned long pfn;
+
+	/* Offset to faulty address in the VMA. */
+	page_offset = vmf->pgoff - vma->vm_pgoff;
+
+	dma_resv_lock(bo->base.resv, NULL);
+
+	if (page_offset >= num_pages ||
+	    drm_WARN_ON_ONCE(obj->dev, !bo->backing.pages)) {
+		ret = VM_FAULT_SIGBUS;
+		goto out;
+	}
+
+	if (try_map_pmd(vmf, vmf->address, bo->backing.pages[page_offset])) {
+		ret = VM_FAULT_NOPAGE;
+		goto out;
+	}
+
+	pfn = page_to_pfn(bo->backing.pages[page_offset]);
+	ret = vmf_insert_pfn(vma, vmf->address, pfn);
+
+ out:
+	dma_resv_unlock(bo->base.resv);
+
+	return ret;
+}
+
+static void panthor_gem_vm_open(struct vm_area_struct *vma)
+{
+	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
+
+	drm_WARN_ON(bo->base.dev, drm_gem_is_imported(&bo->base));
+
+	dma_resv_lock(bo->base.resv, NULL);
+
+	/* We should have already pinned the pages when the buffer was first
+	 * mmap'd, vm_open() just grabs an additional reference for the new
+	 * mm the vma is getting copied into (ie. on fork()).
+	 */
+	drm_WARN_ON_ONCE(bo->base.dev, !bo->backing.pages);
+
+	dma_resv_unlock(bo->base.resv);
+
+	drm_gem_vm_open(vma);
+}
+
+const struct vm_operations_struct panthor_gem_vm_ops = {
+	.fault = panthor_gem_fault,
+	.open = panthor_gem_vm_open,
+	.close = drm_gem_vm_close,
 };
 
-/**
- * panthor_gem_create_object - Implementation of driver->gem_create_object.
- * @ddev: DRM device
- * @size: Size in bytes of the memory the object will reference
- *
- * This lets the GEM helpers allocate object structs for us, and keep
- * our BO stats correct.
- */
-struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t size)
-{
-	struct panthor_gem_object *obj;
+static const struct drm_gem_object_funcs panthor_gem_funcs = {
+	.free = panthor_gem_free_object,
+	.print_info = panthor_gem_print_info,
+	.pin = panthor_gem_pin_locked,
+	.unpin = panthor_gem_unpin_locked,
+	.get_sg_table = panthor_gem_get_sg_table,
+	.vmap = panthor_gem_vmap_locked,
+	.vunmap = panthor_gem_vunmap_locked,
+	.mmap = panthor_gem_mmap,
+	.status = panthor_gem_status,
+	.export = panthor_gem_prime_export,
+	.vm_ops = &panthor_gem_vm_ops,
+};
 
-	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
-	if (!obj)
+static struct panthor_gem_object *
+panthor_gem_alloc_object(uint32_t flags)
+{
+	struct panthor_gem_object *bo;
+
+	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
+	if (!bo)
 		return ERR_PTR(-ENOMEM);
 
-	obj->base.base.funcs = &panthor_gem_funcs;
-	mutex_init(&obj->label.lock);
+	bo->base.funcs = &panthor_gem_funcs;
+	bo->flags = flags;
+	mutex_init(&bo->label.lock);
+	panthor_gem_debugfs_bo_init(bo);
+	return bo;
+}
 
-	panthor_gem_debugfs_bo_init(obj);
+static struct panthor_gem_object *
+panthor_gem_create(struct drm_device *dev, size_t size, uint32_t flags,
+		   struct panthor_vm *exclusive_vm, u32 usage_flags)
+{
+	struct panthor_gem_object *bo;
+	int ret;
 
-	return &obj->base.base;
+	bo = panthor_gem_alloc_object(flags);
+	if (IS_ERR(bo))
+		return bo;
+
+	size = PAGE_ALIGN(size);
+	ret = drm_gem_object_init(dev, &bo->base, size);
+	if (ret)
+		goto err_put;
+
+	/* Our buffers are kept pinned, so allocating them
+	 * from the MOVABLE zone is a really bad idea, and
+	 * conflicts with CMA. See comments above new_inode()
+	 * why this is required _and_ expected if you're
+	 * going to pin these pages.
+	 */
+	mapping_set_gfp_mask(bo->base.filp->f_mapping,
+			     GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
+
+	ret = drm_gem_create_mmap_offset(&bo->base);
+	if (ret)
+		goto err_put;
+
+	if (exclusive_vm) {
+		bo->exclusive_vm_root_gem = panthor_vm_root_gem(exclusive_vm);
+		drm_gem_object_get(bo->exclusive_vm_root_gem);
+		bo->base.resv = bo->exclusive_vm_root_gem->resv;
+	}
+
+	panthor_gem_debugfs_set_usage_flags(bo, usage_flags);
+	return bo;
+
+err_put:
+	drm_gem_object_put(&bo->base);
+	return ERR_PTR(ret);
+}
+
+struct drm_gem_object *
+panthor_gem_prime_import_sg_table(struct drm_device *dev,
+				  struct dma_buf_attachment *attach,
+				  struct sg_table *sgt)
+{
+	struct panthor_gem_object *bo;
+	int ret;
+
+	bo = panthor_gem_alloc_object(0);
+	if (IS_ERR(bo))
+		return &bo->base;
+
+	drm_gem_private_object_init(dev, &bo->base, attach->dmabuf->size);
+
+	ret = drm_gem_create_mmap_offset(&bo->base);
+	if (ret)
+		goto err_put;
+
+	bo->dmap.sgt = sgt;
+	return &bo->base;
+
+err_put:
+	drm_gem_object_put(&bo->base);
+	return ERR_PTR(ret);
 }
 
 /**
@@ -325,54 +824,22 @@ panthor_gem_create_with_handle(struct drm_file *file,
 			       u64 *size, u32 flags, u32 *handle)
 {
 	int ret;
-	struct drm_gem_shmem_object *shmem;
 	struct panthor_gem_object *bo;
 
-	shmem = drm_gem_shmem_create(ddev, *size);
-	if (IS_ERR(shmem))
-		return PTR_ERR(shmem);
-
-	bo = to_panthor_bo(&shmem->base);
-	bo->flags = flags;
-	bo->base.map_wc = should_map_wc(bo, exclusive_vm);
-
-	if (exclusive_vm) {
-		bo->exclusive_vm_root_gem = panthor_vm_root_gem(exclusive_vm);
-		drm_gem_object_get(bo->exclusive_vm_root_gem);
-		bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
-	}
-
-	panthor_gem_debugfs_set_usage_flags(bo, 0);
-
-	/* If this is a write-combine mapping, we query the sgt to force a CPU
-	 * cache flush (dma_map_sgtable() is called when the sgt is created).
-	 * This ensures the zero-ing is visible to any uncached mapping created
-	 * by vmap/mmap.
-	 * FIXME: Ideally this should be done when pages are allocated, not at
-	 * BO creation time.
-	 */
-	if (shmem->map_wc) {
-		struct sg_table *sgt;
-
-		sgt = drm_gem_shmem_get_pages_sgt(shmem);
-		if (IS_ERR(sgt)) {
-			ret = PTR_ERR(sgt);
-			goto out_put_gem;
-		}
-	}
+	bo = panthor_gem_create(ddev, *size, flags, exclusive_vm, 0);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
 
 	/*
 	 * Allocate an id of idr table where the obj is registered
 	 * and handle has the id what user can see.
 	 */
-	ret = drm_gem_handle_create(file, &shmem->base, handle);
+	ret = drm_gem_handle_create(file, &bo->base, handle);
 	if (!ret)
-		*size = bo->base.base.size;
+		*size = bo->base.size;
 
-out_put_gem:
 	/* drop reference from allocate - handle holds it now. */
-	drm_gem_object_put(&shmem->base);
-
+	drm_gem_object_put(&bo->base);
 	return ret;
 }
 
@@ -417,18 +884,17 @@ panthor_gem_sync(struct drm_gem_object *obj, u32 type,
 		 u64 offset, u64 size)
 {
 	struct panthor_gem_object *bo = to_panthor_bo(obj);
-	struct drm_gem_shmem_object *shmem = &bo->base;
-	const struct drm_device *dev = shmem->base.dev;
+	struct device *dma_dev = drm_dev_dma_dev(bo->base.dev);
 	struct sg_table *sgt;
 	struct scatterlist *sgl;
 	unsigned int count;
 
 	/* Make sure the range is in bounds. */
-	if (offset + size < offset || offset + size > shmem->base.size)
+	if (offset + size < offset || offset + size > bo->base.size)
 		return -EINVAL;
 
 	/* Disallow CPU-cache maintenance on imported buffers. */
-	if (drm_gem_is_imported(&shmem->base))
+	if (drm_gem_is_imported(&bo->base))
 		return -EINVAL;
 
 	switch (type) {
@@ -441,14 +907,14 @@ panthor_gem_sync(struct drm_gem_object *obj, u32 type,
 	}
 
 	/* Don't bother if it's WC-mapped */
-	if (shmem->map_wc)
+	if (should_map_wc(bo))
 		return 0;
 
 	/* Nothing to do if the size is zero. */
 	if (size == 0)
 		return 0;
 
-	sgt = drm_gem_shmem_get_pages_sgt(shmem);
+	sgt = panthor_gem_get_dev_sgt(bo);
 	if (IS_ERR(sgt))
 		return PTR_ERR(sgt);
 
@@ -489,9 +955,9 @@ panthor_gem_sync(struct drm_gem_object *obj, u32 type,
 		 *
 		 * for the flush+invalidate case.
 		 */
-		dma_sync_single_for_device(dev->dev, paddr, len, DMA_TO_DEVICE);
+		dma_sync_single_for_device(dma_dev, paddr, len, DMA_TO_DEVICE);
 		if (type == DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE)
-			dma_sync_single_for_cpu(dev->dev, paddr, len, DMA_FROM_DEVICE);
+			dma_sync_single_for_cpu(dma_dev, paddr, len, DMA_FROM_DEVICE);
 	}
 
 	return 0;
@@ -541,7 +1007,6 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 			 size_t size, u32 bo_flags, u32 vm_map_flags,
 			 u64 gpu_va, const char *name)
 {
-	struct drm_gem_shmem_object *obj;
 	struct panthor_kernel_bo *kbo;
 	struct panthor_gem_object *bo;
 	u32 debug_flags = PANTHOR_DEBUGFS_GEM_USAGE_FLAG_KERNEL;
@@ -554,25 +1019,18 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	if (!kbo)
 		return ERR_PTR(-ENOMEM);
 
-	obj = drm_gem_shmem_create(&ptdev->base, size);
-	if (IS_ERR(obj)) {
-		ret = PTR_ERR(obj);
-		goto err_free_bo;
-	}
-
-	bo = to_panthor_bo(&obj->base);
-	kbo->obj = &obj->base;
-	bo->flags = bo_flags;
-	bo->base.map_wc = should_map_wc(bo, vm);
-	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
-	drm_gem_object_get(bo->exclusive_vm_root_gem);
-	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
-
 	if (vm == panthor_fw_vm(ptdev))
 		debug_flags |= PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED;
 
+	bo = panthor_gem_create(&ptdev->base, size, bo_flags, vm, debug_flags);
+	if (IS_ERR(bo)) {
+		ret = PTR_ERR(bo);
+		goto err_free_kbo;
+	}
+
+	kbo->obj = &bo->base;
+
 	panthor_gem_kernel_bo_set_label(kbo, name);
-	panthor_gem_debugfs_set_usage_flags(to_panthor_bo(kbo->obj), debug_flags);
 
 	/* The system and GPU MMU page size might differ, which becomes a
 	 * problem for FW sections that need to be mapped at explicit address
@@ -596,9 +1054,9 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	panthor_vm_free_va(vm, &kbo->va_node);
 
 err_put_obj:
-	drm_gem_object_put(&obj->base);
+	drm_gem_object_put(&bo->base);
 
-err_free_bo:
+err_free_kbo:
 	kfree(kbo);
 	return ERR_PTR(ret);
 }
@@ -646,7 +1104,7 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
 					 struct seq_file *m,
 					 struct gem_size_totals *totals)
 {
-	unsigned int refcount = kref_read(&bo->base.base.refcount);
+	unsigned int refcount = kref_read(&bo->base.refcount);
 	char creator_info[32] = {};
 	size_t resident_size;
 	u32 gem_usage_flags = bo->debugfs.flags;
@@ -656,21 +1114,21 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
 	if (!refcount)
 		return;
 
-	resident_size = bo->base.pages ? bo->base.base.size : 0;
+	resident_size = bo->backing.pages ? bo->base.size : 0;
 
 	snprintf(creator_info, sizeof(creator_info),
 		 "%s/%d", bo->debugfs.creator.process_name, bo->debugfs.creator.tgid);
 	seq_printf(m, "%-32s%-16d%-16d%-16zd%-16zd0x%-16lx",
 		   creator_info,
-		   bo->base.base.name,
+		   bo->base.name,
 		   refcount,
-		   bo->base.base.size,
+		   bo->base.size,
 		   resident_size,
-		   drm_vma_node_start(&bo->base.base.vma_node));
+		   drm_vma_node_start(&bo->base.vma_node));
 
-	if (bo->base.base.import_attach)
+	if (bo->base.import_attach)
 		gem_state_flags |= PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED;
-	if (bo->base.base.dma_buf)
+	if (bo->base.dma_buf)
 		gem_state_flags |= PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED;
 
 	seq_printf(m, "0x%-8x 0x%-10x", gem_state_flags, gem_usage_flags);
@@ -679,10 +1137,8 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
 		seq_printf(m, "%s\n", bo->label.str ? : "");
 	}
 
-	totals->size += bo->base.base.size;
+	totals->size += bo->base.size;
 	totals->resident += resident_size;
-	if (bo->base.madv > 0)
-		totals->reclaimable += resident_size;
 }
 
 static void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 94b2d17cf032..b66478c9590c 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -5,7 +5,7 @@
 #ifndef __PANTHOR_GEM_H__
 #define __PANTHOR_GEM_H__
 
-#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_mm.h>
 
 #include <linux/iosys-map.h>
@@ -60,12 +60,51 @@ struct panthor_gem_debugfs {
 	u32 flags;
 };
 
+/**
+ * struct panthor_gem_backing - GEM memory backing related data
+ */
+struct panthor_gem_backing {
+	/** @pages: Pages requested with drm_gem_get_pages() */
+	struct page **pages;
+
+	/** @pin_count: Number of active pin requests on this GEM */
+	refcount_t pin_count;
+};
+
+/**
+ * struct panthor_gem_cpu_map - GEM CPU mapping related data
+ */
+struct panthor_gem_cpu_map {
+	/** @vaddr: Address returned by vmap() */
+	void *vaddr;
+
+	/** @vaddr_use_count: Number of active vmap() requests on this GEM */
+	refcount_t vaddr_use_count;
+};
+
+/**
+ * struct panthor_gem_dev_map - GEM device mapping related data
+ */
+struct panthor_gem_dev_map {
+	/** @sgt: Device mapped sg_table for this GEM */
+	struct sg_table *sgt;
+};
+
 /**
  * struct panthor_gem_object - Driver specific GEM object.
  */
 struct panthor_gem_object {
-	/** @base: Inherit from drm_gem_shmem_object. */
-	struct drm_gem_shmem_object base;
+	/** @base: Inherit from drm_gem_object. */
+	struct drm_gem_object base;
+
+	/** @backing: Memory backing state */
+	struct panthor_gem_backing backing;
+
+	/** @cmap: CPU mapping state */
+	struct panthor_gem_cpu_map cmap;
+
+	/** @dmap: Device mapping state */
+	struct panthor_gem_dev_map dmap;
 
 	/**
 	 * @exclusive_vm_root_gem: Root GEM of the exclusive VM this GEM object
@@ -130,22 +169,25 @@ struct panthor_kernel_bo {
 	void *kmap;
 };
 
-static inline
-struct panthor_gem_object *to_panthor_bo(struct drm_gem_object *obj)
-{
-	return container_of(to_drm_gem_shmem_obj(obj), struct panthor_gem_object, base);
-}
+#define to_panthor_bo(obj) container_of_const(obj, struct panthor_gem_object, base)
 
 void panthor_gem_init(struct panthor_device *ptdev);
 
-struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t size);
-
+struct drm_gem_object *
+panthor_gem_prime_import_sg_table(struct drm_device *dev,
+				  struct dma_buf_attachment *attach,
+				  struct sg_table *sgt);
 int
 panthor_gem_create_with_handle(struct drm_file *file,
 			       struct drm_device *ddev,
 			       struct panthor_vm *exclusive_vm,
 			       u64 *size, u32 flags, uint32_t *handle);
 
+struct sg_table *
+panthor_gem_get_dev_sgt(struct panthor_gem_object *bo);
+int panthor_gem_pin(struct panthor_gem_object *bo);
+void panthor_gem_unpin(struct panthor_gem_object *bo);
+
 void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label);
 void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label);
 int panthor_gem_sync(struct drm_gem_object *obj,
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index b888fff05efe..c323b7123713 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -5,6 +5,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_exec.h>
+#include <drm/drm_file.h>
 #include <drm/drm_gpuvm.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
@@ -1073,8 +1074,7 @@ static void panthor_vm_bo_free(struct drm_gpuvm_bo *vm_bo)
 {
 	struct panthor_gem_object *bo = to_panthor_bo(vm_bo->obj);
 
-	if (!drm_gem_is_imported(&bo->base.base))
-		drm_gem_shmem_unpin(&bo->base);
+	panthor_gem_unpin(bo);
 	kfree(vm_bo);
 }
 
@@ -1196,7 +1196,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 		return -EINVAL;
 
 	/* Make sure the VA and size are in-bounds. */
-	if (size > bo->base.base.size || offset > bo->base.base.size - size)
+	if (size > bo->base.size || offset > bo->base.size - size)
 		return -EINVAL;
 
 	/* If the BO has an exclusive VM attached, it can't be mapped to other VMs. */
@@ -1213,33 +1213,25 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	if (ret)
 		goto err_cleanup;
 
-	if (!drm_gem_is_imported(&bo->base.base)) {
-		/* Pre-reserve the BO pages, so the map operation doesn't have to
-		 * allocate. This pin is dropped in panthor_vm_bo_free(), so
-		 * once we have successfully called drm_gpuvm_bo_create(),
-		 * GPUVM will take care of dropping the pin for us.
-		 */
-		ret = drm_gem_shmem_pin(&bo->base);
-		if (ret)
-			goto err_cleanup;
-	}
+	/* Pre-reserve the BO pages, so the map operation doesn't have to
+	 * allocate.
+	 */
+	ret = panthor_gem_pin(bo);
+	if (ret)
+		goto err_cleanup;
 
-	sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
+	sgt = panthor_gem_get_dev_sgt(bo);
 	if (IS_ERR(sgt)) {
-		if (!drm_gem_is_imported(&bo->base.base))
-			drm_gem_shmem_unpin(&bo->base);
-
+		panthor_gem_unpin(bo);
 		ret = PTR_ERR(sgt);
 		goto err_cleanup;
 	}
 
 	op_ctx->map.sgt = sgt;
 
-	preallocated_vm_bo = drm_gpuvm_bo_create(&vm->base, &bo->base.base);
+	preallocated_vm_bo = drm_gpuvm_bo_create(&vm->base, &bo->base);
 	if (!preallocated_vm_bo) {
-		if (!drm_gem_is_imported(&bo->base.base))
-			drm_gem_shmem_unpin(&bo->base);
-
+		panthor_gem_unpin(bo);
 		ret = -ENOMEM;
 		goto err_cleanup;
 	}
@@ -1251,9 +1243,9 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	 * calling this function.
 	 */
 	dma_resv_lock(panthor_vm_resv(vm), NULL);
-	mutex_lock(&bo->base.base.gpuva.lock);
+	mutex_lock(&bo->base.gpuva.lock);
 	op_ctx->map.vm_bo = drm_gpuvm_bo_obtain_prealloc(preallocated_vm_bo);
-	mutex_unlock(&bo->base.base.gpuva.lock);
+	mutex_unlock(&bo->base.gpuva.lock);
 	dma_resv_unlock(panthor_vm_resv(vm));
 
 	op_ctx->map.bo_offset = offset;
@@ -2063,9 +2055,9 @@ static void panthor_vma_link(struct panthor_vm *vm,
 {
 	struct panthor_gem_object *bo = to_panthor_bo(vma->base.gem.obj);
 
-	mutex_lock(&bo->base.base.gpuva.lock);
+	mutex_lock(&bo->base.gpuva.lock);
 	drm_gpuva_link(&vma->base, vm_bo);
-	mutex_unlock(&bo->base.base.gpuva.lock);
+	mutex_unlock(&bo->base.gpuva.lock);
 }
 
 static void panthor_vma_unlink(struct panthor_vma *vma)
@@ -2117,11 +2109,12 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
 static bool
 iova_mapped_as_huge_page(struct drm_gpuva_op_map *op, u64 addr)
 {
+	struct panthor_gem_object *bo = to_panthor_bo(op->gem.obj);
 	const struct page *pg;
 	pgoff_t bo_offset;
 
 	bo_offset = addr - op->va.addr + op->gem.offset;
-	pg = to_panthor_bo(op->gem.obj)->base.pages[bo_offset >> PAGE_SHIFT];
+	pg = bo->backing.pages[bo_offset >> PAGE_SHIFT];
 
 	return folio_size(page_folio(pg)) >= SZ_2M;
 }
@@ -2190,7 +2183,7 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
 		u64 size = op->remap.prev->va.addr + op->remap.prev->va.range - unmap_start;
 
 		ret = panthor_vm_map_pages(vm, unmap_start, flags_to_prot(unmap_vma->flags),
-					   bo->base.sgt, offset, size);
+					   bo->dmap.sgt, offset, size);
 		if (ret)
 			return ret;
 
@@ -2204,7 +2197,7 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
 		u64 size = unmap_start + unmap_range - op->remap.next->va.addr;
 
 		ret = panthor_vm_map_pages(vm, addr, flags_to_prot(unmap_vma->flags),
-					   bo->base.sgt, op->remap.next->gem.offset, size);
+					   bo->dmap.sgt, op->remap.next->gem.offset, size);
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index ca272dbae14d..2ddf64870d85 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3,7 +3,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_exec.h>
-#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_file.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
@@ -871,8 +871,7 @@ panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue
 	int ret;
 
 	if (queue->syncwait.kmap) {
-		bo = container_of(queue->syncwait.obj,
-				  struct panthor_gem_object, base.base);
+		bo = to_panthor_bo(queue->syncwait.obj);
 		goto out_sync;
 	}
 
@@ -882,7 +881,7 @@ panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue
 	if (drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(bo)))
 		goto err_put_syncwait_obj;
 
-	queue->syncwait.obj = &bo->base.base;
+	queue->syncwait.obj = &bo->base;
 	ret = drm_gem_vmap(queue->syncwait.obj, &map);
 	if (drm_WARN_ON(&ptdev->base, ret))
 		goto err_put_syncwait_obj;
@@ -896,7 +895,7 @@ panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue
 	 * drm_gem_shmem_sync() is a NOP if map_wc=true, so no need to check
 	 * it here.
 	 */
-	panthor_gem_sync(&bo->base.base, queue->syncwait.offset,
+	panthor_gem_sync(&bo->base, queue->syncwait.offset,
 			 queue->syncwait.sync64 ?
 			 sizeof(struct panthor_syncobj_64b) :
 			 sizeof(struct panthor_syncobj_32b),
-- 
2.52.0

