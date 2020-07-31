Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 579F0233E10
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76D76E9C9;
	Fri, 31 Jul 2020 04:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AD06E9BD
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:07:17 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-XHdIQGg0MBaWYgkPPAYQow-1; Fri, 31 Jul 2020 00:07:11 -0400
X-MC-Unique: XHdIQGg0MBaWYgkPPAYQow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05FC618839C1;
 Fri, 31 Jul 2020 04:07:10 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B146100238C;
 Fri, 31 Jul 2020 04:07:08 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 46/49] drm/ttm: drop man->bdev link.
Date: Fri, 31 Jul 2020 14:05:17 +1000
Message-Id: <20200731040520.3701599-47-airlied@gmail.com>
In-Reply-To: <20200731040520.3701599-1-airlied@gmail.com>
References: <20200731040520.3701599-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: christian.koenig@amd.com, sroland@vmware.com, bskeggs@redhat.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This link isn't needed anymore, drop it from the init interface.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         | 6 ++----
 drivers/gpu/drm/ttm/ttm_bo.c                  | 6 ++----
 drivers/gpu/drm/ttm/ttm_bo_manager.c          | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           | 2 +-
 include/drm/ttm/ttm_bo_api.h                  | 3 +--
 include/drm/ttm/ttm_bo_driver.h               | 2 --
 9 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 83d88ee73468..b4480ca30988 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -108,7 +108,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 	man->available_caching = TTM_PL_MASK_CACHING;
 	man->default_caching = TTM_PL_FLAG_CACHED;
 
-	ttm_bo_init_mm_base(&adev->mman.bdev, man, gtt_size >> PAGE_SHIFT);
+	ttm_bo_init_mm_base(man, gtt_size >> PAGE_SHIFT);
 
 	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
 	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index d451851c8689..f0e65a6fdf88 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -190,7 +190,7 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 	man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
 	man->default_caching = TTM_PL_FLAG_WC;
 
-	ttm_bo_init_mm_base(&adev->mman.bdev, man, adev->gmc.real_vram_size >> PAGE_SHIFT);
+	ttm_bo_init_mm_base(man, adev->gmc.real_vram_size >> PAGE_SHIFT);
 
 	man->func = &amdgpu_vram_mgr_func;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 5b0af2065ad9..89521d3ed9da 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -174,8 +174,7 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
 
 		man->func = &nouveau_vram_manager;
 		man->use_io_reserve_lru = true;
-		ttm_bo_init_mm_base(&drm->ttm.bdev, man,
-				    drm->gem.vram_available >> PAGE_SHIFT);
+		ttm_bo_init_mm_base(man, drm->gem.vram_available >> PAGE_SHIFT);
 		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, man);
 		ttm_bo_use_mm(man);
 		return 0;
@@ -236,8 +235,7 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 	man->available_caching = available_caching;
 	man->default_caching = default_caching;
 	man->use_tt = true;
-	ttm_bo_init_mm_base(&drm->ttm.bdev, man,
-			    size_pages);
+	ttm_bo_init_mm_base(man, size_pages);
 	ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, man);
 	ttm_bo_use_mm(man);
 	return 0;
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 1e8fda1c9b3a..f2b41c4d7d51 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1464,8 +1464,7 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 }
 EXPORT_SYMBOL(ttm_bo_evict_mm);
 
-void ttm_bo_init_mm_base(struct ttm_bo_device *bdev,
-			 struct ttm_mem_type_manager *man,
+void ttm_bo_init_mm_base(struct ttm_mem_type_manager *man,
 			 unsigned long p_size)
 {
 	unsigned i;
@@ -1475,7 +1474,6 @@ void ttm_bo_init_mm_base(struct ttm_bo_device *bdev,
 	mutex_init(&man->io_reserve_mutex);
 	spin_lock_init(&man->move_lock);
 	INIT_LIST_HEAD(&man->io_reserve_lru);
-	man->bdev = bdev;
 	man->size = p_size;
 
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
@@ -1588,7 +1586,7 @@ static void ttm_bo_init_sysman(struct ttm_bo_device *bdev)
 	man->available_caching = TTM_PL_MASK_CACHING;
 	man->default_caching = TTM_PL_FLAG_CACHED;
 
-	ttm_bo_init_mm_base(bdev, man, 0);
+	ttm_bo_init_mm_base(man, 0);
 	ttm_bo_use_mm(man);
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/ttm/ttm_bo_manager.c
index 2782ccff9b66..6c6eedf84ca6 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_manager.c
@@ -133,7 +133,7 @@ int ttm_bo_man_init(struct ttm_bo_device *bdev,
 
 	man->func = &ttm_bo_manager_func;
 
-	ttm_bo_init_mm_base(bdev, man, p_size);
+	ttm_bo_init_mm_base(man, p_size);
 
 	drm_mm_init(&rman->mm, 0, p_size);
 	spin_lock_init(&rman->lock);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index 14430c243ce5..2b60957f7c4a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -116,7 +116,7 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
 	man->default_caching = TTM_PL_FLAG_CACHED;
 	/* TODO: This is most likely not correct */
 	man->use_tt = true;
-	ttm_bo_init_mm_base(&dev_priv->bdev, man, 0);
+	ttm_bo_init_mm_base(man, 0);
 	spin_lock_init(&gman->lock);
 	gman->used_gmr_pages = 0;
 	ida_init(&gman->gmr_ida);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index d2dde8159c3d..d5a3eb709384 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -134,7 +134,7 @@ int vmw_thp_init(struct vmw_private *dev_priv)
 	man->available_caching = TTM_PL_FLAG_CACHED;
 	man->default_caching = TTM_PL_FLAG_CACHED;
 
-	ttm_bo_init_mm_base(&dev_priv->bdev, man,
+	ttm_bo_init_mm_base(man,
 			    dev_priv->vram_size >> PAGE_SHIFT);
 
 
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 27dde1371376..d6938133535a 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -547,8 +547,7 @@ int ttm_bo_create(struct ttm_bo_device *bdev, unsigned long size,
  * May also return driver-specified errors.
  */
 struct ttm_mem_type_manager;
-void ttm_bo_init_mm_base(struct ttm_bo_device *bdev,
-			 struct ttm_mem_type_manager *man,
+void ttm_bo_init_mm_base(struct ttm_mem_type_manager *man,
 			 unsigned long p_size);
 
 /**
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index a38704fe0737..bfc549782775 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -138,8 +138,6 @@ struct ttm_mem_type_manager_func {
 
 
 struct ttm_mem_type_manager {
-	struct ttm_bo_device *bdev;
-
 	/*
 	 * No protection. Constant from start.
 	 */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
