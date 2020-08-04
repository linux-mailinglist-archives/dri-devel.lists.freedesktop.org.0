Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7F123B316
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9686E409;
	Tue,  4 Aug 2020 02:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDE76E408
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:59:00 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-_dCQKb5yMmSrMl-gXS8p0g-1; Mon, 03 Aug 2020 22:58:57 -0400
X-MC-Unique: _dCQKb5yMmSrMl-gXS8p0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D60B100CD01;
 Tue,  4 Aug 2020 02:58:56 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E341E8AD1C;
 Tue,  4 Aug 2020 02:58:54 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 55/59] drm/ttm: drop type manager has_type
Date: Tue,  4 Aug 2020 12:56:28 +1000
Message-Id: <20200804025632.3868079-56-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

under driver control, this flag isn't needed anymore,
remove the API that used to access it, and consoldiate
with the used api.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |  4 ++--
 drivers/gpu/drm/ttm/ttm_bo.c                  |  8 +++-----
 drivers/gpu/drm/ttm/ttm_bo_manager.c          |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           |  2 +-
 include/drm/ttm/ttm_bo_driver.h               | 17 -----------------
 8 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 9fc3d876ed38..71461d652fcc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -146,7 +146,7 @@ void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
 	int ret;
 
-	ttm_mem_type_manager_disable(man);
+	ttm_mem_type_manager_set_used(man, false);
 
 	ret = ttm_mem_type_manager_force_list_clean(&adev->mman.bdev, man);
 	if (ret)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 684698cdf772..8cc44c3d2fdd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -223,7 +223,7 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	int ret;
 
-	ttm_mem_type_manager_disable(man);
+	ttm_mem_type_manager_set_used(man, false);
 
 	ret = ttm_mem_type_manager_force_list_clean(&adev->mman.bdev, man);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index d408e1485cce..22185a8dcfa1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -194,7 +194,7 @@ nouveau_ttm_fini_vram(struct nouveau_drm *drm)
 	struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
 
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
-		ttm_mem_type_manager_disable(man);
+		ttm_mem_type_manager_set_used(man, false);
 		ttm_mem_type_manager_force_list_clean(&drm->ttm.bdev, man);
 		ttm_mem_type_manager_cleanup(man);
 		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, NULL);
@@ -253,7 +253,7 @@ nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
 	    drm->agp.bridge)
 		ttm_range_man_fini(&drm->ttm.bdev, TTM_PL_TT);
 	else {
-		ttm_mem_type_manager_disable(man);
+		ttm_mem_type_manager_set_used(man, false);
 		ttm_mem_type_manager_force_list_clean(&drm->ttm.bdev, man);
 		ttm_mem_type_manager_cleanup(man);
 		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, NULL);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 12abe46bfbc1..cda33b4af681 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -80,7 +80,6 @@ static inline int ttm_mem_type_from_place(const struct ttm_place *place,
 void ttm_mem_type_manager_debug(struct ttm_mem_type_manager *man,
 				struct drm_printer *p)
 {
-	drm_printf(p, "    has_type: %d\n", man->has_type);
 	drm_printf(p, "    use_type: %d\n", man->use_type);
 	drm_printf(p, "    use_tt: %d\n", man->use_tt);
 	drm_printf(p, "    size: %llu\n", man->size);
@@ -1003,7 +1002,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
 		return ret;
 
 	man = ttm_manager_type(bdev, mem_type);
-	if (!man->has_type || !man->use_type)
+	if (!man || !man->use_type)
 		return -EBUSY;
 
 	if (!ttm_bo_mt_compatible(man, mem_type, place, &cur_flags))
@@ -1462,7 +1461,7 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 		return -EINVAL;
 	}
 
-	if (!man->has_type) {
+	if (!man) {
 		pr_err("Memory type %u has not been initialized\n", mem_type);
 		return 0;
 	}
@@ -1476,7 +1475,6 @@ void ttm_mem_type_manager_init(struct ttm_mem_type_manager *man,
 {
 	unsigned i;
 
-	BUG_ON(man->has_type);
 	man->use_io_reserve_lru = false;
 	mutex_init(&man->io_reserve_mutex);
 	spin_lock_init(&man->move_lock);
@@ -1557,7 +1555,7 @@ int ttm_bo_device_release(struct ttm_bo_device *bdev)
 	struct ttm_mem_type_manager *man;
 
 	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
-	ttm_mem_type_manager_disable(man);
+	ttm_mem_type_manager_set_used(man, false);
 	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
 
 	mutex_lock(&ttm_global_mutex);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/ttm/ttm_bo_manager.c
index 1b7245ce3356..6679dc11934f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_manager.c
@@ -152,7 +152,7 @@ int ttm_range_man_fini(struct ttm_bo_device *bdev,
 	struct drm_mm *mm = &rman->mm;
 	int ret;
 
-	ttm_mem_type_manager_disable(man);
+	ttm_mem_type_manager_set_used(man, false);
 
 	ret = ttm_mem_type_manager_force_list_clean(bdev, man);
 	if (ret)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index c3fa25161fd0..ca5037184814 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -143,7 +143,7 @@ void vmw_gmrid_man_fini(struct vmw_private *dev_priv, int type)
 	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, type);
 	struct vmwgfx_gmrid_man *gman = to_gmrid_manager(man);
 
-	ttm_mem_type_manager_disable(man);
+	ttm_mem_type_manager_set_used(man, false);
 
 	ttm_mem_type_manager_force_list_clean(&dev_priv->bdev, man);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index 0b9c29249393..4110e8309188 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -152,7 +152,7 @@ void vmw_thp_fini(struct vmw_private *dev_priv)
 	struct drm_mm *mm = &rman->mm;
 	int ret;
 
-	ttm_mem_type_manager_disable(man);
+	ttm_mem_type_manager_set_used(man, false);
 
 	ret = ttm_mem_type_manager_force_list_clean(&dev_priv->bdev, man);
 	if (ret)
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index d5646d7cac60..300934289e64 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -111,7 +111,6 @@ struct ttm_mem_type_manager_func {
 /**
  * struct ttm_mem_type_manager
  *
- * @has_type: The memory type has been initialized.
  * @use_type: The memory type is enabled.
  * @flags: TTM_MEMTYPE_XX flags identifying the traits of the memory
  * managed by this memory type.
@@ -141,8 +140,6 @@ struct ttm_mem_type_manager {
 	/*
 	 * No protection. Constant from start.
 	 */
-
-	bool has_type;
 	bool use_type;
 	bool use_tt;
 	uint64_t size;
@@ -678,23 +675,9 @@ static inline void ttm_bo_unreserve(struct ttm_buffer_object *bo)
  */
 static inline void ttm_mem_type_manager_set_used(struct ttm_mem_type_manager *man, bool used)
 {
-	man->has_type = true;
 	man->use_type = used;
 }
 
-/**
- * ttm_mem_type_manager_disable.
- *
- * @man: A memory manager object.
- *
- * Indicate the manager is not to be used and deregistered. (temporary during rework).
- */
-static inline void ttm_mem_type_manager_disable(struct ttm_mem_type_manager *man)
-{
-	man->has_type = false;
-	man->use_type = false;
-}
-
 /**
  * ttm_mem_type_manager_cleanup
  *
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
