Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3640825A7D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 19:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A665E10E689;
	Fri,  5 Jan 2024 18:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF8D10E67B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 18:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704480439;
 bh=+8e0QAeKAWDBfpes0Dqwf0VnZLjXx9G444D968I2fOI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=3haU1VzjiBYVCarIGUakr2cPP97B4ZrpxiDTsmjhgRsC4N6e8qO2TyoeuSmGxDDCn
 YCl5LMfBbq8VjgfjS1yd/QrvLSYDLzVuZv6q4UuN/JnltttGSWq3VAOQLPRUSFuO32
 q6XEZmc8TXvUW9WRmaYFTjAJFwy6tu7Etry0bCyt6XedUF86Sfb6npmJgMjGnMxQ6X
 gi87KyfWeR5PU0ry+gZcFDUX64BmipkGJE1pYQNoUs3PzYmGVXxvoRo/CKmJFxqIqL
 INhA67o0INXx6Pfaid3M+ahikGRv2hdBzeSALCH8kUgg2uMnBjjxxxhUo3A8c4sh63
 hCITK/u09S3GQ==
Received: from workpc.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7476C3782064;
 Fri,  5 Jan 2024 18:47:18 +0000 (UTC)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH v19 22/30] drm/shmem-helper: Add common memory shrinker
Date: Fri,  5 Jan 2024 21:46:16 +0300
Message-ID: <20240105184624.508603-23-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce common drm-shmem shrinker for DRM drivers.

To start using drm-shmem shrinker drivers should do the following:

1. Implement evict() callback of GEM object where driver should check
   whether object is purgeable or evictable using drm-shmem helpers and
   perform the shrinking action

2. Initialize drm-shmem internals using drmm_gem_shmem_init(drm_device),
   which will register drm-shmem shrinker

3. Implement madvise IOCTL that will use drm_gem_shmem_madvise()

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c        | 365 +++++++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_gem.c       |   3 +-
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |  13 +-
 include/drm/drm_device.h                      |  10 +-
 include/drm/drm_gem_shmem_helper.h            |  68 +++-
 5 files changed, 433 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index ff5437ab2c95..59cebd1e35af 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -20,6 +20,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_print.h>
 
@@ -128,11 +129,49 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
 
+static bool drm_gem_shmem_is_evictable(struct drm_gem_shmem_object *shmem)
+{
+	return (shmem->madv >= 0) && shmem->base.funcs->evict &&
+		refcount_read(&shmem->pages_use_count) &&
+		!refcount_read(&shmem->pages_pin_count) &&
+		!shmem->base.dma_buf && !shmem->base.import_attach &&
+		!shmem->evicted;
+}
+
+static void
+drm_gem_shmem_shrinker_update_lru_locked(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	struct drm_gem_shmem *shmem_mm = obj->dev->shmem_mm;
+	struct drm_gem_shmem_shrinker *shmem_shrinker = &shmem_mm->shrinker;
+
+	dma_resv_assert_held(shmem->base.resv);
+
+	if (!shmem_shrinker || obj->import_attach)
+		return;
+
+	if (shmem->madv < 0)
+		drm_gem_lru_remove(&shmem->base);
+	else if (drm_gem_shmem_is_evictable(shmem) || drm_gem_shmem_is_purgeable(shmem))
+		drm_gem_lru_move_tail(&shmem_shrinker->lru_evictable, &shmem->base);
+	else if (shmem->evicted)
+		drm_gem_lru_move_tail(&shmem_shrinker->lru_evicted, &shmem->base);
+	else if (!shmem->pages)
+		drm_gem_lru_remove(&shmem->base);
+	else
+		drm_gem_lru_move_tail(&shmem_shrinker->lru_pinned, &shmem->base);
+}
+
 static void
 drm_gem_shmem_free_pages(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
+	if (!shmem->pages) {
+		drm_WARN_ON(obj->dev, !shmem->evicted && shmem->madv >= 0);
+		return;
+	}
+
 	if (shmem->sgt) {
 		dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
 				  DMA_BIDIRECTIONAL, 0);
@@ -175,15 +214,26 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
 
-static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
+static int
+drm_gem_shmem_acquire_pages(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	struct page **pages;
 
+	if (drm_WARN_ON(obj->dev, obj->import_attach))
+		return -EINVAL;
+
 	dma_resv_assert_held(shmem->base.resv);
 
-	if (refcount_inc_not_zero(&shmem->pages_use_count))
+	if (shmem->madv < 0) {
+		drm_WARN_ON(obj->dev, shmem->pages);
+		return -ENOMEM;
+	}
+
+	if (shmem->pages) {
+		drm_WARN_ON(obj->dev, !shmem->evicted);
 		return 0;
+	}
 
 	pages = drm_gem_get_pages(obj);
 	if (IS_ERR(pages)) {
@@ -204,8 +254,29 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
 
 	shmem->pages = pages;
 
+	return 0;
+}
+
+static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
+{
+	int err;
+
+	dma_resv_assert_held(shmem->base.resv);
+
+	if (shmem->madv < 0)
+		return -ENOMEM;
+
+	if (refcount_inc_not_zero(&shmem->pages_use_count))
+		return 0;
+
+	err = drm_gem_shmem_acquire_pages(shmem);
+	if (err)
+		return err;
+
 	refcount_set(&shmem->pages_use_count, 1);
 
+	drm_gem_shmem_shrinker_update_lru_locked(shmem);
+
 	return 0;
 }
 
@@ -222,6 +293,8 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 
 	if (refcount_dec_and_test(&shmem->pages_use_count))
 		drm_gem_shmem_free_pages(shmem);
+
+	drm_gem_shmem_shrinker_update_lru_locked(shmem);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
 
@@ -266,6 +339,11 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages);
  *
  * This function Increases the use count and allocates the backing pages if
  * use-count equals to zero.
+ *
+ * Note that this function doesn't pin pages in memory. If your driver
+ * uses drm-shmem shrinker, then it's free to relocate pages to swap.
+ * Getting pages only guarantees that pages are allocated, and not that
+ * pages reside in memory. In order to pin pages use drm_gem_shmem_pin().
  */
 int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 {
@@ -291,6 +369,10 @@ static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 	if (refcount_inc_not_zero(&shmem->pages_pin_count))
 		return 0;
 
+	ret = drm_gem_shmem_swapin_locked(shmem);
+	if (ret)
+		return ret;
+
 	ret = drm_gem_shmem_get_pages_locked(shmem);
 	if (!ret)
 		refcount_set(&shmem->pages_pin_count, 1);
@@ -489,29 +571,48 @@ int drm_gem_shmem_madvise_locked(struct drm_gem_shmem_object *shmem, int madv)
 
 	madv = shmem->madv;
 
+	drm_gem_shmem_shrinker_update_lru_locked(shmem);
+
 	return (madv >= 0);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_madvise_locked);
 
-void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
+int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
 {
 	struct drm_gem_object *obj = &shmem->base;
-	struct drm_device *dev = obj->dev;
+	int ret;
 
-	dma_resv_assert_held(shmem->base.resv);
+	ret = dma_resv_lock_interruptible(obj->resv, NULL);
+	if (ret)
+		return ret;
 
-	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_purgeable(shmem));
+	ret = drm_gem_shmem_madvise_locked(shmem, madv);
+	dma_resv_unlock(obj->resv);
 
-	dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
-	sg_free_table(shmem->sgt);
-	kfree(shmem->sgt);
-	shmem->sgt = NULL;
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_madvise);
 
-	drm_gem_shmem_put_pages_locked(shmem);
+static void
+drm_gem_shmem_shrinker_put_pages_locked(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	struct drm_device *dev = obj->dev;
 
-	shmem->madv = -1;
+	dma_resv_assert_held(shmem->base.resv);
 
+	if (shmem->evicted)
+		return;
+
+	drm_gem_shmem_free_pages(shmem);
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
+}
+
+void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+
+	drm_gem_shmem_shrinker_put_pages_locked(shmem);
 	drm_gem_free_mmap_offset(obj);
 
 	/* Our goal here is to return as much of the memory as
@@ -522,9 +623,45 @@ void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
 	shmem_truncate_range(file_inode(obj->filp), 0, (loff_t)-1);
 
 	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping, 0, (loff_t)-1);
+
+	shmem->madv = -1;
+	shmem->evicted = false;
+	drm_gem_shmem_shrinker_update_lru_locked(shmem);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_purge_locked);
 
+/**
+ * drm_gem_shmem_swapin_locked() - Moves shmem GEM back to memory and enables
+ *                                 hardware access to the memory.
+ * @shmem: shmem GEM object
+ *
+ * This function moves shmem GEM back to memory if it was previously evicted
+ * by the memory shrinker. The GEM is ready to use on success.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_shmem_swapin_locked(struct drm_gem_shmem_object *shmem)
+{
+	int err;
+
+	dma_resv_assert_held(shmem->base.resv);
+
+	if (!shmem->evicted)
+		return 0;
+
+	err = drm_gem_shmem_acquire_pages(shmem);
+	if (err)
+		return err;
+
+	shmem->evicted = false;
+
+	drm_gem_shmem_shrinker_update_lru_locked(shmem);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_swapin_locked);
+
 /**
  * drm_gem_shmem_dumb_create - Create a dumb shmem buffer object
  * @file: DRM file structure to create the dumb buffer for
@@ -571,22 +708,32 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	vm_fault_t ret;
 	struct page *page;
 	pgoff_t page_offset;
+	int err;
 
 	/* We don't use vmf->pgoff since that has the fake offset */
 	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
 
 	dma_resv_lock(shmem->base.resv, NULL);
 
-	if (page_offset >= num_pages ||
-	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
-	    shmem->madv < 0) {
+	err = drm_gem_shmem_swapin_locked(shmem);
+	if (err) {
+		ret = VM_FAULT_OOM;
+		goto unlock;
+	}
+
+	if (page_offset >= num_pages || !shmem->pages) {
 		ret = VM_FAULT_SIGBUS;
 	} else {
+		/*
+		 * shmem->pages is guaranteed to be valid while reservation
+		 * lock is held and drm_gem_shmem_swapin_locked() succeeds.
+		 */
 		page = shmem->pages[page_offset];
 
 		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
 	}
 
+unlock:
 	dma_resv_unlock(shmem->base.resv);
 
 	return ret;
@@ -609,6 +756,7 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 	drm_WARN_ON_ONCE(obj->dev,
 			 !refcount_inc_not_zero(&shmem->pages_use_count));
 
+	drm_gem_shmem_shrinker_update_lru_locked(shmem);
 	dma_resv_unlock(shmem->base.resv);
 
 	drm_gem_vm_open(vma);
@@ -694,7 +842,9 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 	drm_printf_indent(p, indent, "pages_pin_count=%u\n", refcount_read(&shmem->pages_pin_count));
 	drm_printf_indent(p, indent, "pages_use_count=%u\n", refcount_read(&shmem->pages_use_count));
 	drm_printf_indent(p, indent, "vmap_use_count=%u\n", refcount_read(&shmem->vmap_use_count));
+	drm_printf_indent(p, indent, "evicted=%d\n", shmem->evicted);
 	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
+	drm_printf_indent(p, indent, "madv=%d\n", shmem->madv);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_print_info);
 
@@ -784,8 +934,13 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
  */
 struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 {
-	int ret;
+	struct drm_gem_object *obj = &shmem->base;
 	struct sg_table *sgt;
+	int ret;
+
+	if (drm_WARN_ON(obj->dev, drm_gem_shmem_is_evictable(shmem)) ||
+	    drm_WARN_ON(obj->dev, drm_gem_shmem_is_purgeable(shmem)))
+		return ERR_PTR(-EBUSY);
 
 	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
 	if (ret)
@@ -832,6 +987,184 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
 
+static unsigned long
+drm_gem_shmem_shrinker_count_objects(struct shrinker *shrinker,
+				     struct shrink_control *sc)
+{
+	struct drm_gem_shmem_shrinker *shmem_shrinker = shrinker->private_data;
+	unsigned long count = shmem_shrinker->lru_evictable.count;
+
+	if (count >= SHRINK_EMPTY)
+		return SHRINK_EMPTY - 1;
+
+	return count ?: SHRINK_EMPTY;
+}
+
+void drm_gem_shmem_evict_locked(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+
+	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_evictable(shmem));
+	drm_WARN_ON(obj->dev, shmem->evicted);
+
+	drm_gem_shmem_shrinker_put_pages_locked(shmem);
+
+	shmem->evicted = true;
+	drm_gem_shmem_shrinker_update_lru_locked(shmem);
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_evict_locked);
+
+static bool drm_gem_shmem_shrinker_evict_locked(struct drm_gem_object *obj)
+{
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	int err;
+
+	if (!drm_gem_shmem_is_evictable(shmem) ||
+	    get_nr_swap_pages() < obj->size >> PAGE_SHIFT)
+		return false;
+
+	err = drm_gem_evict_locked(obj);
+	if (err)
+		return false;
+
+	return true;
+}
+
+static bool drm_gem_shmem_shrinker_purge_locked(struct drm_gem_object *obj)
+{
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	int err;
+
+	if (!drm_gem_shmem_is_purgeable(shmem))
+		return false;
+
+	err = drm_gem_evict_locked(obj);
+	if (err)
+		return false;
+
+	return true;
+}
+
+static unsigned long
+drm_gem_shmem_shrinker_scan_objects(struct shrinker *shrinker,
+				    struct shrink_control *sc)
+{
+	struct drm_gem_shmem_shrinker *shmem_shrinker = shrinker->private_data;
+	unsigned long nr_to_scan = sc->nr_to_scan;
+	unsigned long remaining = 0;
+	unsigned long freed = 0;
+
+	/* purge as many objects as we can */
+	freed += drm_gem_lru_scan(&shmem_shrinker->lru_evictable,
+				  nr_to_scan, &remaining,
+				  drm_gem_shmem_shrinker_purge_locked);
+
+	/* evict as many objects as we can */
+	if (freed < nr_to_scan)
+		freed += drm_gem_lru_scan(&shmem_shrinker->lru_evictable,
+					  nr_to_scan - freed, &remaining,
+					  drm_gem_shmem_shrinker_evict_locked);
+
+	return (freed > 0 && remaining > 0) ? freed : SHRINK_STOP;
+}
+
+static int drm_gem_shmem_shrinker_init(struct drm_gem_shmem *shmem_mm,
+				       const char *shrinker_name)
+{
+	struct drm_gem_shmem_shrinker *shmem_shrinker = &shmem_mm->shrinker;
+	struct shrinker *shrinker;
+
+	shrinker = shrinker_alloc(0, shrinker_name);
+	if (!shrinker)
+		return -ENOMEM;
+
+	shrinker->count_objects = drm_gem_shmem_shrinker_count_objects;
+	shrinker->scan_objects = drm_gem_shmem_shrinker_scan_objects;
+	shrinker->private_data = shmem_shrinker;
+	shrinker->seeks = DEFAULT_SEEKS;
+
+	mutex_init(&shmem_shrinker->lock);
+	shmem_shrinker->shrinker = shrinker;
+	drm_gem_lru_init(&shmem_shrinker->lru_evictable, &shmem_shrinker->lock);
+	drm_gem_lru_init(&shmem_shrinker->lru_evicted, &shmem_shrinker->lock);
+	drm_gem_lru_init(&shmem_shrinker->lru_pinned, &shmem_shrinker->lock);
+
+	shrinker_register(shrinker);
+
+	return 0;
+}
+
+static void drm_gem_shmem_shrinker_release(struct drm_device *dev,
+					   struct drm_gem_shmem *shmem_mm)
+{
+	struct drm_gem_shmem_shrinker *shmem_shrinker = &shmem_mm->shrinker;
+
+	shrinker_free(shmem_shrinker->shrinker);
+	drm_WARN_ON(dev, !list_empty(&shmem_shrinker->lru_evictable.list));
+	drm_WARN_ON(dev, !list_empty(&shmem_shrinker->lru_evicted.list));
+	drm_WARN_ON(dev, !list_empty(&shmem_shrinker->lru_pinned.list));
+	mutex_destroy(&shmem_shrinker->lock);
+}
+
+static int drm_gem_shmem_init(struct drm_device *dev)
+{
+	int err;
+
+	if (drm_WARN_ON(dev, dev->shmem_mm))
+		return -EBUSY;
+
+	dev->shmem_mm = kzalloc(sizeof(*dev->shmem_mm), GFP_KERNEL);
+	if (!dev->shmem_mm)
+		return -ENOMEM;
+
+	err = drm_gem_shmem_shrinker_init(dev->shmem_mm, dev->unique);
+	if (err)
+		goto free_gem_shmem;
+
+	return 0;
+
+free_gem_shmem:
+	kfree(dev->shmem_mm);
+	dev->shmem_mm = NULL;
+
+	return err;
+}
+
+static void drm_gem_shmem_release(struct drm_device *dev, void *ptr)
+{
+	struct drm_gem_shmem *shmem_mm = dev->shmem_mm;
+
+	drm_gem_shmem_shrinker_release(dev, shmem_mm);
+	dev->shmem_mm = NULL;
+	kfree(shmem_mm);
+}
+
+/**
+ * drmm_gem_shmem_init() - Initialize drm-shmem internals
+ * @dev: DRM device
+ *
+ * Cleanup is automatically managed as part of DRM device releasing.
+ * Calling this function multiple times will result in a error.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drmm_gem_shmem_init(struct drm_device *dev)
+{
+	int err;
+
+	err = drm_gem_shmem_init(dev);
+	if (err)
+		return err;
+
+	err = drmm_add_action_or_reset(dev, drm_gem_shmem_release, NULL);
+	if (err)
+		return err;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drmm_gem_shmem_init);
+
 MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
 MODULE_IMPORT_NS(DMA_BUF);
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 7edfc12f7c1f..8c26b7e41b95 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -99,8 +99,7 @@ static void panfrost_gem_mapping_release(struct kref *kref)
 	 * time, and heap BOs may have acquired pages if the fault handler
 	 * was called, in which case bo->sgts should be non-NULL.
 	 */
-	if (!bo->base.base.import_attach && (!bo->is_heap || bo->sgts) &&
-	    bo->base.madv >= 0) {
+	if (!bo->base.base.import_attach && (!bo->is_heap || bo->sgts)) {
 		drm_gem_shmem_put_pages(&bo->base);
 		bo->sgts = NULL;
 	}
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
index d4fb0854cf2f..7b4deba803ed 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
@@ -15,6 +15,13 @@
 #include "panfrost_gem.h"
 #include "panfrost_mmu.h"
 
+static bool panfrost_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
+{
+	return (shmem->madv > 0) &&
+		!refcount_read(&shmem->pages_pin_count) && shmem->sgt &&
+		!shmem->base.dma_buf && !shmem->base.import_attach;
+}
+
 static unsigned long
 panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
@@ -26,7 +33,7 @@ panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc
 		return 0;
 
 	list_for_each_entry(shmem, &pfdev->shrinker_list, madv_list) {
-		if (drm_gem_shmem_is_purgeable(shmem))
+		if (panfrost_gem_shmem_is_purgeable(shmem))
 			count += shmem->base.size >> PAGE_SHIFT;
 	}
 
@@ -53,7 +60,7 @@ static bool panfrost_gem_purge(struct drm_gem_object *obj)
 	/* BO might have become unpurgeable if the last pages_use_count ref
 	 * was dropped, but the BO hasn't been destroyed yet.
 	 */
-	if (!drm_gem_shmem_is_purgeable(shmem))
+	if (!panfrost_gem_shmem_is_purgeable(shmem))
 		goto unlock_mappings;
 
 	panfrost_gem_teardown_mappings_locked(bo);
@@ -80,7 +87,7 @@ panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	list_for_each_entry_safe(shmem, tmp, &pfdev->shrinker_list, madv_list) {
 		if (freed >= sc->nr_to_scan)
 			break;
-		if (drm_gem_shmem_is_purgeable(shmem) &&
+		if (panfrost_gem_shmem_is_purgeable(shmem) &&
 		    panfrost_gem_purge(&shmem->base)) {
 			freed += shmem->base.size >> PAGE_SHIFT;
 			list_del_init(&shmem->madv_list);
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 63767cf24371..6e729e716505 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -15,6 +15,7 @@ struct drm_vblank_crtc;
 struct drm_vma_offset_manager;
 struct drm_vram_mm;
 struct drm_fb_helper;
+struct drm_gem_shmem_shrinker;
 
 struct inode;
 
@@ -289,8 +290,13 @@ struct drm_device {
 	/** @vma_offset_manager: GEM information */
 	struct drm_vma_offset_manager *vma_offset_manager;
 
-	/** @vram_mm: VRAM MM memory manager */
-	struct drm_vram_mm *vram_mm;
+	union {
+		/** @vram_mm: VRAM MM memory manager */
+		struct drm_vram_mm *vram_mm;
+
+		/** @shmem_mm: SHMEM GEM memory manager */
+		struct drm_gem_shmem *shmem_mm;
+	};
 
 	/**
 	 * @switch_power_state:
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 525480488451..df97c11fc99a 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -6,6 +6,7 @@
 #include <linux/fs.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
+#include <linux/shrinker.h>
 
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
@@ -13,6 +14,7 @@
 #include <drm/drm_prime.h>
 
 struct dma_buf_attachment;
+struct drm_device;
 struct drm_mode_create_dumb;
 struct drm_printer;
 struct sg_table;
@@ -54,8 +56,8 @@ struct drm_gem_shmem_object {
 	 * @madv: State for madvise
 	 *
 	 * 0 is active/inuse.
+	 * 1 is not-needed/can-be-purged
 	 * A negative value is the object is purged.
-	 * Positive values are driver specific and not used by the helpers.
 	 */
 	int madv;
 
@@ -102,6 +104,14 @@ struct drm_gem_shmem_object {
 	 * @map_wc: map object write-combined (instead of using shmem defaults).
 	 */
 	bool map_wc : 1;
+
+	/**
+	 * @evicted: True if shmem pages are evicted by the memory shrinker.
+	 * Used internally by memory shrinker. The evicted pages can be
+	 * moved back to memory using drm_gem_shmem_swapin_locked(), unlike
+	 * the purged pages (madv < 0) that are destroyed permanently.
+	 */
+	bool evicted : 1;
 };
 
 #define to_drm_gem_shmem_obj(obj) \
@@ -122,14 +132,19 @@ void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
 
 int drm_gem_shmem_madvise_locked(struct drm_gem_shmem_object *shmem, int madv);
+int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv);
 
 static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
 {
-	return (shmem->madv > 0) &&
-		!refcount_read(&shmem->pages_pin_count) && shmem->sgt &&
+	return (shmem->madv > 0) && shmem->base.funcs->evict &&
+		refcount_read(&shmem->pages_use_count) &&
+		!refcount_read(&shmem->pages_pin_count) &&
 		!shmem->base.dma_buf && !shmem->base.import_attach;
 }
 
+int drm_gem_shmem_swapin_locked(struct drm_gem_shmem_object *shmem);
+
+void drm_gem_shmem_evict_locked(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem);
 
 struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
@@ -273,6 +288,53 @@ static inline int drm_gem_shmem_object_mmap(struct drm_gem_object *obj, struct v
 	return drm_gem_shmem_mmap(shmem, vma);
 }
 
+/**
+ * drm_gem_shmem_object_madvise - unlocked GEM object function for drm_gem_shmem_madvise_locked()
+ * @obj: GEM object
+ * @madv: Madvise value
+ *
+ * This function wraps drm_gem_shmem_madvise_locked(), providing unlocked variant.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+static inline int drm_gem_shmem_object_madvise(struct drm_gem_object *obj, int madv)
+{
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+
+	return drm_gem_shmem_madvise(shmem, madv);
+}
+
+/**
+ * struct drm_gem_shmem_shrinker - Memory shrinker of GEM shmem memory manager
+ */
+struct drm_gem_shmem_shrinker {
+	/** @lock: Protects @lru_* */
+	struct mutex lock;
+
+	/** @shrinker: Shrinker for purging shmem GEM objects */
+	struct shrinker *shrinker;
+
+	/** @lru_pinned: List of pinned shmem GEM objects */
+	struct drm_gem_lru lru_pinned;
+
+	/** @lru_evictable: List of shmem GEM objects to be evicted */
+	struct drm_gem_lru lru_evictable;
+
+	/** @lru_evicted: List of evicted shmem GEM objects */
+	struct drm_gem_lru lru_evicted;
+};
+
+/**
+ * struct drm_gem_shmem - GEM shmem memory manager
+ */
+struct drm_gem_shmem {
+	/** @shrinker: GEM shmem shrinker */
+	struct drm_gem_shmem_shrinker shrinker;
+};
+
+int drmm_gem_shmem_init(struct drm_device *dev);
+
 /*
  * Driver ops
  */
-- 
2.43.0

