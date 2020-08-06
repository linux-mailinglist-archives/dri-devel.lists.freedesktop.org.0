Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4184E23D62D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 06:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9065F898BC;
	Thu,  6 Aug 2020 04:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEDF898BC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 04:39:12 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-y6Tr42ONMECa9cDjWavYnA-1; Thu, 06 Aug 2020 00:39:09 -0400
X-MC-Unique: y6Tr42ONMECa9cDjWavYnA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2724C106B204
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 04:39:08 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-227.bne.redhat.com
 [10.64.54.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5097E6FEDC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 04:39:07 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/ttm: drop size from resource manager base class.
Date: Thu,  6 Aug 2020 14:39:02 +1000
Message-Id: <20200806043903.4024333-2-airlied@gmail.com>
In-Reply-To: <20200806043903.4024333-1-airlied@gmail.com>
References: <20200806043903.4024333-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This is a bit more involved that it looked, the range manager
needs accessors adding and amdgpu needs a bit of a refactor.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   | 17 +++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |  5 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 13 ++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       | 12 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 14 +++++--------
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |  5 ++---
 drivers/gpu/drm/radeon/radeon_gem.c           |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c           |  3 +--
 drivers/gpu/drm/ttm/ttm_bo.c                  |  7 ++-----
 drivers/gpu/drm/ttm/ttm_range_manager.c       | 21 +++++++++++++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           |  9 ++++----
 include/drm/ttm/ttm_bo_api.h                  |  4 +---
 include/drm/ttm/ttm_bo_driver.h               | 20 ++++++++++++++++--
 15 files changed, 84 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index ccc8b8196d26..db5c0d34daa1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -24,11 +24,6 @@
 
 #include "amdgpu.h"
 
-static inline struct amdgpu_gtt_mgr *to_gtt_mgr(struct ttm_resource_manager *man)
-{
-	return container_of(man, struct amdgpu_gtt_mgr, manager);
-}
-
 struct amdgpu_gtt_node {
 	struct drm_mm_node node;
 	struct ttm_buffer_object *tbo;
@@ -48,8 +43,9 @@ static ssize_t amdgpu_mem_info_gtt_total_show(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
+	struct amdgpu_gtt_mgr *gtt_mgr = to_gtt_mgr(man);
 	return snprintf(buf, PAGE_SIZE, "%llu\n",
-			man->size * PAGE_SIZE);
+			gtt_mgr->size * PAGE_SIZE);
 }
 
 /**
@@ -96,13 +92,14 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 	man->available_caching = TTM_PL_MASK_CACHING;
 	man->default_caching = TTM_PL_FLAG_CACHED;
 
-	ttm_resource_manager_init(man, gtt_size >> PAGE_SHIFT);
+	mgr->size = gtt_size >> PAGE_SHIFT;
+	ttm_resource_manager_init(man);
 
 	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
 	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
 	drm_mm_init(&mgr->mm, start, size);
 	spin_lock_init(&mgr->lock);
-	atomic64_set(&mgr->available, gtt_size >> PAGE_SHIFT);
+	atomic64_set(&mgr->available, mgr->size);
 
 	ret = device_create_file(adev->dev, &dev_attr_mem_info_gtt_total);
 	if (ret) {
@@ -262,7 +259,7 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 uint64_t amdgpu_gtt_mgr_usage(struct ttm_resource_manager *man)
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
-	s64 result = man->size - atomic64_read(&mgr->available);
+	s64 result = mgr->size - atomic64_read(&mgr->available);
 
 	return (result > 0 ? result : 0) * PAGE_SIZE;
 }
@@ -304,7 +301,7 @@ static void amdgpu_gtt_mgr_debug(struct ttm_resource_manager *man,
 	spin_unlock(&mgr->lock);
 
 	drm_printf(printer, "man size:%llu pages, gtt available:%lld pages, usage:%lluMB\n",
-		   man->size, (u64)atomic64_read(&mgr->available),
+		   mgr->size, (u64)atomic64_read(&mgr->available),
 		   amdgpu_gtt_mgr_usage(man) >> 20);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 2763bca163e3..8dcee654d7f5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -623,7 +623,7 @@ static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file
 			min(adev->gmc.visible_vram_size -
 			    atomic64_read(&adev->visible_pin_size),
 			    vram_gtt.vram_size);
-		vram_gtt.gtt_size = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT)->size;
+		vram_gtt.gtt_size = to_gtt_mgr(ttm_manager_type(&adev->mman.bdev, TTM_PL_TT))->size;
 		vram_gtt.gtt_size *= PAGE_SIZE;
 		vram_gtt.gtt_size -= atomic64_read(&adev->gart_pin_size);
 		return copy_to_user(out, &vram_gtt,
@@ -635,6 +635,7 @@ static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file
 			ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 		struct ttm_resource_manager *gtt_man =
 			ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
+		struct amdgpu_gtt_mgr *gtt_mgr = to_gtt_mgr(gtt_man);
 		memset(&mem, 0, sizeof(mem));
 		mem.vram.total_heap_size = adev->gmc.real_vram_size;
 		mem.vram.usable_heap_size = adev->gmc.real_vram_size -
@@ -655,7 +656,7 @@ static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file
 		mem.cpu_accessible_vram.max_allocation =
 			mem.cpu_accessible_vram.usable_heap_size * 3 / 4;
 
-		mem.gtt.total_heap_size = gtt_man->size;
+		mem.gtt.total_heap_size = gtt_mgr->size;
 		mem.gtt.total_heap_size *= PAGE_SIZE;
 		mem.gtt.usable_heap_size = mem.gtt.total_heap_size -
 			atomic64_read(&adev->gart_pin_size);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 43f4966331dd..33957d829197 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -442,25 +442,24 @@ void amdgpu_bo_free_kernel(struct amdgpu_bo **bo, u64 *gpu_addr,
 static bool amdgpu_bo_validate_size(struct amdgpu_device *adev,
 					  unsigned long size, u32 domain)
 {
-	struct ttm_resource_manager *man = NULL;
-
+	unsigned long mgr_size = 0;
 	/*
 	 * If GTT is part of requested domains the check must succeed to
 	 * allow fall back to GTT
 	 */
 	if (domain & AMDGPU_GEM_DOMAIN_GTT) {
-		man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
+		mgr_size = to_gtt_mgr(ttm_manager_type(&adev->mman.bdev, TTM_PL_TT))->size;
 
-		if (size < (man->size << PAGE_SHIFT))
+		if (size < (mgr_size << PAGE_SHIFT))
 			return true;
 		else
 			goto fail;
 	}
 
 	if (domain & AMDGPU_GEM_DOMAIN_VRAM) {
-		man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
+		mgr_size = to_vram_mgr(ttm_manager_type(&adev->mman.bdev, TTM_PL_TT))->size;
 
-		if (size < (man->size << PAGE_SHIFT))
+		if (size < (mgr_size << PAGE_SHIFT))
 			return true;
 		else
 			goto fail;
@@ -472,7 +471,7 @@ static bool amdgpu_bo_validate_size(struct amdgpu_device *adev,
 
 fail:
 	DRM_DEBUG("BO size %lu > total memory in domain: %llu\n", size,
-		  man->size << PAGE_SHIFT);
+		  mgr_size << PAGE_SHIFT);
 	return false;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 682172d59f60..8004acd2292a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2063,7 +2063,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		size = adev->gmc.real_vram_size;
 	else
 		size = adev->gmc.visible_vram_size;
-	man->size = size >> PAGE_SHIFT;
+	to_vram_mgr(man)->size = size >> PAGE_SHIFT;
 	adev->mman.buffer_funcs_enabled = enable;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 1fd7ed43be43..3db950ef2b86 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -46,16 +46,28 @@ struct amdgpu_gtt_mgr {
 	struct drm_mm mm;
 	spinlock_t lock;
 	atomic64_t available;
+	unsigned long size;
 };
 
+static inline struct amdgpu_gtt_mgr *to_gtt_mgr(struct ttm_resource_manager *man)
+{
+	return container_of(man, struct amdgpu_gtt_mgr, manager);
+}
+
 struct amdgpu_vram_mgr {
 	struct ttm_resource_manager manager;
 	struct drm_mm mm;
 	spinlock_t lock;
 	atomic64_t usage;
 	atomic64_t vis_usage;
+	unsigned long size;	
 };
 
+static inline struct amdgpu_vram_mgr *to_vram_mgr(struct ttm_resource_manager *man)
+{
+	return container_of(man, struct amdgpu_vram_mgr, manager);
+}
+
 struct amdgpu_mman {
 	struct ttm_bo_device		bdev;
 	bool				mem_global_referenced;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index d2f04abe3f81..adf582bbffed 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -28,11 +28,6 @@
 #include "amdgpu_atomfirmware.h"
 #include "atom.h"
 
-static inline struct amdgpu_vram_mgr *to_vram_mgr(struct ttm_resource_manager *man)
-{
-	return container_of(man, struct amdgpu_vram_mgr, manager);
-}
-
 static inline struct amdgpu_device *man_to_adev(struct ttm_resource_manager *man)
 {
 	return container_of(man, struct amdgpu_device, mman.vram_mgr.manager);
@@ -180,11 +175,12 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 	man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
 	man->default_caching = TTM_PL_FLAG_WC;
 
-	ttm_resource_manager_init(man, adev->gmc.real_vram_size >> PAGE_SHIFT);
+	ttm_resource_manager_init(man);
 
 	man->func = &amdgpu_vram_mgr_func;
 
-	drm_mm_init(&mgr->mm, 0, man->size);
+	mgr->size = adev->gmc.real_vram_size >> PAGE_SHIFT;
+	drm_mm_init(&mgr->mm, 0, mgr->size);
 	spin_lock_init(&mgr->lock);
 
 	/* Add the two VRAM-related sysfs files */
@@ -325,7 +321,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 
 	lpfn = place->lpfn;
 	if (!lpfn)
-		lpfn = man->size;
+		lpfn = mgr->size;
 
 	max_bytes = adev->gmc.mc_vram_size;
 	if (tbo->type != ttm_bo_type_kernel)
@@ -599,7 +595,7 @@ static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
 	spin_unlock(&mgr->lock);
 
 	drm_printf(printer, "man size:%llu pages, ram usage:%lluMB, vis usage:%lluMB\n",
-		   man->size, amdgpu_vram_mgr_usage(man) >> 20,
+		   mgr->size, amdgpu_vram_mgr_usage(man) >> 20,
 		   amdgpu_vram_mgr_vis_usage(man) >> 20);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 9e96b6ff24cf..2aba2e245548 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -175,8 +175,7 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
 		man->func = &nouveau_vram_manager;
 		man->use_io_reserve_lru = true;
 
-		ttm_resource_manager_init(man,
-					  drm->gem.vram_available >> PAGE_SHIFT);
+		ttm_resource_manager_init(man);
 		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, man);
 		ttm_resource_manager_set_used(man, true);
 		return 0;
@@ -237,7 +236,7 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 	man->available_caching = available_caching;
 	man->default_caching = default_caching;
 	man->use_tt = true;
-	ttm_resource_manager_init(man, size_pages);
+	ttm_resource_manager_init(man);
 	ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, man);
 	ttm_resource_manager_set_used(man, true);
 	return 0;
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 7f5dfe04789e..00258d158cfe 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -228,7 +228,7 @@ int radeon_gem_info_ioctl(struct drm_device *dev, void *data,
 
 	man = ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM);
 
-	args->vram_size = (u64)man->size << PAGE_SHIFT;
+	args->vram_size = (u64)ttm_range_man_size(man) << PAGE_SHIFT;
 	args->vram_visible = rdev->mc.visible_vram_size;
 	args->vram_visible -= rdev->vram_pin_size;
 	args->gart_size = rdev->mc.gtt_size;
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index a068d6960c23..1b96872cc756 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -841,9 +841,8 @@ void radeon_ttm_set_active_vram_size(struct radeon_device *rdev, u64 size)
 	if (!rdev->mman.initialized)
 		return;
 
-	man = ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM);
 	/* this just adjusts TTM size idea, which sets lpfn to the correct value */
-	man->size = size >> PAGE_SHIFT;
+	ttm_range_man_adjust_size(man, size >> PAGE_SHIFT);
 }
 
 static vm_fault_t radeon_ttm_fault(struct vm_fault *vmf)
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 1ea5de976ec3..74b7def25f91 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -82,7 +82,6 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 {
 	drm_printf(p, "    use_type: %d\n", man->use_type);
 	drm_printf(p, "    use_tt: %d\n", man->use_tt);
-	drm_printf(p, "    size: %llu\n", man->size);
 	drm_printf(p, "    available_caching: 0x%08X\n", man->available_caching);
 	drm_printf(p, "    default_caching: 0x%08X\n", man->default_caching);
 	if (man->func && man->func->debug)
@@ -1470,8 +1469,7 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 }
 EXPORT_SYMBOL(ttm_bo_evict_mm);
 
-void ttm_resource_manager_init(struct ttm_resource_manager *man,
-			       unsigned long p_size)
+void ttm_resource_manager_init(struct ttm_resource_manager *man)
 {
 	unsigned i;
 
@@ -1479,7 +1477,6 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
 	mutex_init(&man->io_reserve_mutex);
 	spin_lock_init(&man->move_lock);
 	INIT_LIST_HEAD(&man->io_reserve_lru);
-	man->size = p_size;
 
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		INIT_LIST_HEAD(&man->lru[i]);
@@ -1592,7 +1589,7 @@ static void ttm_bo_init_sysman(struct ttm_bo_device *bdev)
 	man->available_caching = TTM_PL_MASK_CACHING;
 	man->default_caching = TTM_PL_FLAG_CACHED;
 
-	ttm_resource_manager_init(man, 0);
+	ttm_resource_manager_init(man);
 	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, man);
 	ttm_resource_manager_set_used(man, true);
 }
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index 7442d811f867..0194967a7ec5 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -47,6 +47,7 @@ struct ttm_range_manager {
 	struct ttm_resource_manager manager;
 	struct drm_mm mm;
 	spinlock_t lock;
+	uint64_t size;
 };
 
 static inline struct ttm_range_manager *to_range_manager(struct ttm_resource_manager *man)
@@ -68,7 +69,7 @@ static int ttm_range_man_get_node(struct ttm_resource_manager *man,
 
 	lpfn = place->lpfn;
 	if (!lpfn)
-		lpfn = man->size;
+		lpfn = rman->size;
 
 	node = kzalloc(sizeof(*node), GFP_KERNEL);
 	if (!node)
@@ -133,8 +134,9 @@ int ttm_range_man_init(struct ttm_bo_device *bdev,
 
 	man->func = &ttm_range_manager_func;
 
-	ttm_resource_manager_init(man, p_size);
+	ttm_resource_manager_init(man);
 
+	rman->size = p_size;
 	drm_mm_init(&rman->mm, 0, p_size);
 	spin_lock_init(&rman->lock);
 
@@ -185,3 +187,18 @@ static const struct ttm_resource_manager_func ttm_range_manager_func = {
 	.put_node = ttm_range_man_put_node,
 	.debug = ttm_range_man_debug
 };
+
+void ttm_range_man_adjust_size(struct ttm_resource_manager *man,
+			       unsigned long size)
+{
+	struct ttm_range_manager *rman = to_range_manager(man);
+	rman->size = size;
+}
+EXPORT_SYMBOL(ttm_range_man_adjust_size);
+
+unsigned long ttm_range_man_size(struct ttm_resource_manager *man)
+{
+	struct ttm_range_manager *rman = to_range_manager(man);
+	return rman->size;
+}
+EXPORT_SYMBOL(ttm_range_man_size);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index 3fea7a6c7cfa..a7a2deae2277 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -116,7 +116,7 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
 	man->default_caching = TTM_PL_FLAG_CACHED;
 	/* TODO: This is most likely not correct */
 	man->use_tt = true;
-	ttm_resource_manager_init(man, 0);
+	ttm_resource_manager_init(man);
 	spin_lock_init(&gman->lock);
 	gman->used_gmr_pages = 0;
 	ida_init(&gman->gmr_ida);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index f594e2e6ab7e..74cdee48b191 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -19,6 +19,7 @@ struct vmw_thp_manager {
 	struct ttm_resource_manager manager;
 	struct drm_mm mm;
 	spinlock_t lock;
+	uint64_t size;
 };
 
 static struct vmw_thp_manager *to_thp_manager(struct ttm_resource_manager *man)
@@ -63,7 +64,7 @@ static int vmw_thp_get_node(struct ttm_resource_manager *man,
 
 	lpfn = place->lpfn;
 	if (!lpfn)
-		lpfn = man->size;
+		lpfn = rman->size;
 
 	mode = DRM_MM_INSERT_BEST;
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
@@ -134,10 +135,10 @@ int vmw_thp_init(struct vmw_private *dev_priv)
 	man->available_caching = TTM_PL_FLAG_CACHED;
 	man->default_caching = TTM_PL_FLAG_CACHED;
 
-	ttm_resource_manager_init(man,
-				  dev_priv->vram_size >> PAGE_SHIFT);
+	ttm_resource_manager_init(man);
 
-	drm_mm_init(&rman->mm, 0, man->size);
+	rman->size = dev_priv->vram_size >> PAGE_SHIFT;
+	drm_mm_init(&rman->mm, 0, rman->size);
 	spin_lock_init(&rman->lock);
 
 	ttm_set_driver_manager(&dev_priv->bdev, TTM_PL_VRAM, &rman->manager);
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 247d4f803443..9570ed7d01bf 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -537,12 +537,10 @@ int ttm_bo_create(struct ttm_bo_device *bdev, unsigned long size,
  * ttm_resource_manager_init
  *
  * @man: memory manager object to init
- * @p_size: size managed area in pages.
  *
  * Initialise core parts of a manager object.
  */
-void ttm_resource_manager_init(struct ttm_resource_manager *man,
-			       unsigned long p_size);
+void ttm_resource_manager_init(struct ttm_resource_manager *man);
 
 /**
  * ttm_bo_evict_mm
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 576c91c85a6b..dc57445f90e6 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -116,7 +116,6 @@ struct ttm_resource_manager_func {
  * managed by this memory type.
  * @gpu_offset: If used, the GPU offset of the first managed page of
  * fixed memory or the first managed location in an aperture.
- * @size: Size of the managed region.
  * @available_caching: A mask of available caching types, TTM_PL_FLAG_XX,
  * as defined in ttm_placement_common.h
  * @default_caching: The default caching policy used for a buffer object
@@ -142,7 +141,6 @@ struct ttm_resource_manager {
 	 */
 	bool use_type;
 	bool use_tt;
-	uint64_t size;
 	uint32_t available_caching;
 	uint32_t default_caching;
 	const struct ttm_resource_manager_func *func;
@@ -872,4 +870,22 @@ int ttm_range_man_fini(struct ttm_bo_device *bdev,
 void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 				struct drm_printer *p);
 
+/**
+ * ttm_range_man_adjust_size
+ *
+ * @man: manager to adjust size for
+ * @p_size: new size.
+ */
+void ttm_range_man_adjust_size(struct ttm_resource_manager *man,
+			       unsigned long p_size);
+
+/**
+ * ttm_range_man_size
+ *
+ * @man: manager to get size for
+ * Returns:
+ * size of range manager.
+ */
+unsigned long ttm_range_man_size(struct ttm_resource_manager *man);
+
 #endif
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
