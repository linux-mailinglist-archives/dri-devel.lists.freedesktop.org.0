Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A49CCB0266
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B728E10E5DF;
	Tue,  9 Dec 2025 14:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB0310E5E8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 14:02:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1744D3381D;
 Tue,  9 Dec 2025 14:01:57 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D33333EA65;
 Tue,  9 Dec 2025 14:01:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EEpgMdMrOGm1OgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Dec 2025 14:01:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, ogabbay@kernel.org,
 mamin506@gmail.com, lizhi.hou@amd.com, maciej.falkowski@linux.intel.com,
 karol.wachowski@linux.intel.com, tomeu@tomeuvizoso.net,
 frank.binns@imgtec.com, matt.coster@imgtec.com, yuq825@gmail.com,
 robh@kernel.org, steven.price@arm.com, adrian.larumbe@collabora.com,
 liviu.dudau@arm.com, mwen@igalia.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-doc@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 07/13] drm/panfrost: Use GEM-UMA helpers for memory management
Date: Tue,  9 Dec 2025 14:42:04 +0100
Message-ID: <20251209140141.94407-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209140141.94407-1-tzimmermann@suse.de>
References: <20251209140141.94407-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 1744D3381D
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Rspamd-Action: no action
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

Convert panfrost from GEM-SHMEM to GEM-UMA. The latter is just a copy,
so this change it merely renaming symbols. No functional changes.

GEM-SHMEM will become more self-contained for drivers without specific
memory management. GEM-UMA's interfaces will remain flexible for drivers
with UMA hardware, such as panfrost.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/panfrost/Kconfig              |  2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c       | 30 +++++++++----------
 drivers/gpu/drm/panfrost/panfrost_gem.h       |  6 ++--
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 30 +++++++++----------
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  8 ++---
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |  6 ++--
 7 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/Kconfig b/drivers/gpu/drm/panfrost/Kconfig
index e6403a9d66ad..3e44858df0f3 100644
--- a/drivers/gpu/drm/panfrost/Kconfig
+++ b/drivers/gpu/drm/panfrost/Kconfig
@@ -6,10 +6,10 @@ config DRM_PANFROST
 	depends on ARM || ARM64 || COMPILE_TEST
 	depends on !GENERIC_ATOMIC64    # for IOMMU_IO_PGTABLE_LPAE
 	depends on MMU
+	select DRM_GEM_UMA_HELPER
 	select DRM_SCHED
 	select IOMMU_SUPPORT
 	select IOMMU_IO_PGTABLE_LPAE
-	select DRM_GEM_SHMEM_HELPER
 	select PM_DEVFREQ
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select WANT_DEV_COREDUMP
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7d8c7c337606..fe38aa354bcc 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -499,7 +499,7 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 		}
 	}
 
-	args->retained = drm_gem_shmem_madvise_locked(&bo->base, args->madv);
+	args->retained = drm_gem_uma_madvise_locked(&bo->base, args->madv);
 
 	if (args->retained) {
 		if (args->madv == PANFROST_MADV_DONTNEED)
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 8041b65c6609..17a5218c9aee 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -85,7 +85,7 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
 		kvfree(bo->sgts);
 	}
 
-	drm_gem_shmem_free(&bo->base);
+	drm_gem_uma_free(&bo->base);
 }
 
 struct panfrost_gem_mapping *
@@ -228,7 +228,7 @@ static int panfrost_gem_pin(struct drm_gem_object *obj)
 	if (bo->is_heap)
 		return -EINVAL;
 
-	return drm_gem_shmem_pin_locked(&bo->base);
+	return drm_gem_uma_pin_locked(&bo->base);
 }
 
 static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj)
@@ -263,16 +263,16 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
 	.free = panfrost_gem_free_object,
 	.open = panfrost_gem_open,
 	.close = panfrost_gem_close,
-	.print_info = drm_gem_shmem_object_print_info,
+	.print_info = drm_gem_uma_object_print_info,
 	.pin = panfrost_gem_pin,
-	.unpin = drm_gem_shmem_object_unpin,
-	.get_sg_table = drm_gem_shmem_object_get_sg_table,
-	.vmap = drm_gem_shmem_object_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
-	.mmap = drm_gem_shmem_object_mmap,
+	.unpin = drm_gem_uma_object_unpin,
+	.get_sg_table = drm_gem_uma_object_get_sg_table,
+	.vmap = drm_gem_uma_object_vmap,
+	.vunmap = drm_gem_uma_object_vunmap,
+	.mmap = drm_gem_uma_object_mmap,
 	.status = panfrost_gem_status,
 	.rss = panfrost_gem_rss,
-	.vm_ops = &drm_gem_shmem_vm_ops,
+	.vm_ops = &drm_gem_uma_vm_ops,
 };
 
 /**
@@ -306,18 +306,18 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
 struct panfrost_gem_object *
 panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags)
 {
-	struct drm_gem_shmem_object *shmem;
+	struct drm_gem_uma_object *uma;
 	struct panfrost_gem_object *bo;
 
 	/* Round up heap allocations to 2MB to keep fault handling simple */
 	if (flags & PANFROST_BO_HEAP)
 		size = roundup(size, SZ_2M);
 
-	shmem = drm_gem_shmem_create(dev, size);
-	if (IS_ERR(shmem))
-		return ERR_CAST(shmem);
+	uma = drm_gem_uma_create(dev, size);
+	if (IS_ERR(uma))
+		return ERR_CAST(uma);
 
-	bo = to_panfrost_bo(&shmem->base);
+	bo = to_panfrost_bo(&uma->base);
 	bo->noexec = !!(flags & PANFROST_BO_NOEXEC);
 	bo->is_heap = !!(flags & PANFROST_BO_HEAP);
 
@@ -332,7 +332,7 @@ panfrost_gem_prime_import_sg_table(struct drm_device *dev,
 	struct drm_gem_object *obj;
 	struct panfrost_gem_object *bo;
 
-	obj = drm_gem_shmem_prime_import_sg_table(dev, attach, sgt);
+	obj = drm_gem_uma_prime_import_sg_table(dev, attach, sgt);
 	if (IS_ERR(obj))
 		return ERR_CAST(obj);
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 8de3e76f2717..01a796a54340 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -4,7 +4,7 @@
 #ifndef __PANFROST_GEM_H__
 #define __PANFROST_GEM_H__
 
-#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem_uma_helper.h>
 #include <drm/drm_mm.h>
 
 struct panfrost_mmu;
@@ -50,7 +50,7 @@ struct panfrost_gem_debugfs {
 };
 
 struct panfrost_gem_object {
-	struct drm_gem_shmem_object base;
+	struct drm_gem_uma_object base;
 	struct sg_table *sgts;
 
 	/*
@@ -115,7 +115,7 @@ struct panfrost_gem_mapping {
 static inline
 struct  panfrost_gem_object *to_panfrost_bo(struct drm_gem_object *obj)
 {
-	return container_of(to_drm_gem_shmem_obj(obj), struct panfrost_gem_object, base);
+	return container_of(to_drm_gem_uma_obj(obj), struct panfrost_gem_object, base);
 }
 
 static inline struct panfrost_gem_mapping *
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
index 2fe967a90bcb..b55accfcbe0d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
@@ -9,7 +9,7 @@
 #include <linux/list.h>
 
 #include <drm/drm_device.h>
-#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem_uma_helper.h>
 
 #include "panfrost_device.h"
 #include "panfrost_gem.h"
@@ -19,15 +19,15 @@ static unsigned long
 panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
 	struct panfrost_device *pfdev = shrinker->private_data;
-	struct drm_gem_shmem_object *shmem;
+	struct drm_gem_uma_object *uma;
 	unsigned long count = 0;
 
 	if (!mutex_trylock(&pfdev->shrinker_lock))
 		return 0;
 
-	list_for_each_entry(shmem, &pfdev->shrinker_list, madv_list) {
-		if (drm_gem_shmem_is_purgeable(shmem))
-			count += shmem->base.size >> PAGE_SHIFT;
+	list_for_each_entry(uma, &pfdev->shrinker_list, madv_list) {
+		if (drm_gem_uma_is_purgeable(uma))
+			count += uma->base.size >> PAGE_SHIFT;
 	}
 
 	mutex_unlock(&pfdev->shrinker_lock);
@@ -37,7 +37,7 @@ panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc
 
 static bool panfrost_gem_purge(struct drm_gem_object *obj)
 {
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	struct drm_gem_uma_object *uma = to_drm_gem_uma_obj(obj);
 	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
 	bool ret = false;
 
@@ -47,14 +47,14 @@ static bool panfrost_gem_purge(struct drm_gem_object *obj)
 	if (!mutex_trylock(&bo->mappings.lock))
 		return false;
 
-	if (!dma_resv_trylock(shmem->base.resv))
+	if (!dma_resv_trylock(uma->base.resv))
 		goto unlock_mappings;
 
 	panfrost_gem_teardown_mappings_locked(bo);
-	drm_gem_shmem_purge_locked(&bo->base);
+	drm_gem_uma_purge_locked(&bo->base);
 	ret = true;
 
-	dma_resv_unlock(shmem->base.resv);
+	dma_resv_unlock(uma->base.resv);
 
 unlock_mappings:
 	mutex_unlock(&bo->mappings.lock);
@@ -65,19 +65,19 @@ static unsigned long
 panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 {
 	struct panfrost_device *pfdev = shrinker->private_data;
-	struct drm_gem_shmem_object *shmem, *tmp;
+	struct drm_gem_uma_object *uma, *tmp;
 	unsigned long freed = 0;
 
 	if (!mutex_trylock(&pfdev->shrinker_lock))
 		return SHRINK_STOP;
 
-	list_for_each_entry_safe(shmem, tmp, &pfdev->shrinker_list, madv_list) {
+	list_for_each_entry_safe(uma, tmp, &pfdev->shrinker_list, madv_list) {
 		if (freed >= sc->nr_to_scan)
 			break;
-		if (drm_gem_shmem_is_purgeable(shmem) &&
-		    panfrost_gem_purge(&shmem->base)) {
-			freed += shmem->base.size >> PAGE_SHIFT;
-			list_del_init(&shmem->madv_list);
+		if (drm_gem_uma_is_purgeable(uma) &&
+		    panfrost_gem_purge(&uma->base)) {
+			freed += uma->base.size >> PAGE_SHIFT;
+			list_del_init(&uma->madv_list);
 		}
 	}
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 8f3b7a7b6ad0..a19bf238ba21 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -461,8 +461,8 @@ static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
 int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 {
 	struct panfrost_gem_object *bo = mapping->obj;
-	struct drm_gem_shmem_object *shmem = &bo->base;
-	struct drm_gem_object *obj = &shmem->base;
+	struct drm_gem_uma_object *uma = &bo->base;
+	struct drm_gem_object *obj = &uma->base;
 	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
 	struct sg_table *sgt;
 	int prot = IOMMU_READ | IOMMU_WRITE | IOMMU_CACHE;
@@ -474,7 +474,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 	if (bo->noexec)
 		prot |= IOMMU_NOEXEC;
 
-	sgt = drm_gem_shmem_get_pages_sgt(shmem);
+	sgt = drm_gem_uma_get_pages_sgt(uma);
 	if (WARN_ON(IS_ERR(sgt)))
 		return PTR_ERR(sgt);
 
@@ -488,7 +488,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 	return 0;
 
 err_put_pages:
-	drm_gem_shmem_put_pages_locked(shmem);
+	drm_gem_uma_put_pages_locked(uma);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index 7020c0192e18..874c23c7c024 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -9,7 +9,7 @@
 #include <linux/uaccess.h>
 
 #include <drm/drm_file.h>
-#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem_uma_helper.h>
 #include <drm/panfrost_drm.h>
 
 #include "panfrost_device.h"
@@ -75,7 +75,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 	struct panfrost_file_priv *user = file_priv->driver_priv;
 	struct panfrost_perfcnt *perfcnt = pfdev->perfcnt;
 	struct iosys_map map;
-	struct drm_gem_shmem_object *bo;
+	struct drm_gem_uma_object *bo;
 	u32 cfg, as;
 	int ret;
 
@@ -88,7 +88,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 	if (ret < 0)
 		goto err_put_pm;
 
-	bo = drm_gem_shmem_create(&pfdev->base, perfcnt->bosize);
+	bo = drm_gem_uma_create(&pfdev->base, perfcnt->bosize);
 	if (IS_ERR(bo)) {
 		ret = PTR_ERR(bo);
 		goto err_put_pm;
-- 
2.52.0

