Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDC5233E04
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424C46E9B8;
	Fri, 31 Jul 2020 04:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522836E9A2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:06:57 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-fIs5qz0vMjCzyXdYZUvsVg-1; Fri, 31 Jul 2020 00:06:53 -0400
X-MC-Unique: fIs5qz0vMjCzyXdYZUvsVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47AE818839C1;
 Fri, 31 Jul 2020 04:06:52 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE3D4100238C;
 Fri, 31 Jul 2020 04:06:50 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 38/49] drm/amdgpu/ttm: use bo manager subclassing for vram/gtt
 mgrs
Date: Fri, 31 Jul 2020 14:05:09 +1000
Message-Id: <20200731040520.3701599-39-airlied@gmail.com>
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

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 35 +++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 36 +++++++++++++-------
 2 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 0b0d09d19b4f..83d88ee73468 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -25,11 +25,17 @@
 #include "amdgpu.h"
 
 struct amdgpu_gtt_mgr {
+	struct ttm_mem_type_manager manager;
 	struct drm_mm mm;
 	spinlock_t lock;
 	atomic64_t available;
 };
 
+static inline struct amdgpu_gtt_mgr *to_gtt_mgr(struct ttm_mem_type_manager *man)
+{
+	return container_of(man, struct amdgpu_gtt_mgr, manager);
+}
+
 struct amdgpu_gtt_node {
 	struct drm_mm_node node;
 	struct ttm_buffer_object *tbo;
@@ -87,11 +93,16 @@ static const struct ttm_mem_type_manager_func amdgpu_gtt_mgr_func;
  */
 int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
+	struct ttm_mem_type_manager *man;
 	struct amdgpu_gtt_mgr *mgr;
 	uint64_t start, size;
 	int ret;
 
+	mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
+	if (!mgr)
+		return -ENOMEM;
+
+	man = &mgr->manager;
 	man->use_tt = true;
 	man->func = &amdgpu_gtt_mgr_func;
 	man->available_caching = TTM_PL_MASK_CACHING;
@@ -99,16 +110,11 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 
 	ttm_bo_init_mm_base(&adev->mman.bdev, man, gtt_size >> PAGE_SHIFT);
 
-	mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
-	if (!mgr)
-		return -ENOMEM;
-
 	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
 	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
 	drm_mm_init(&mgr->mm, start, size);
 	spin_lock_init(&mgr->lock);
 	atomic64_set(&mgr->available, gtt_size >> PAGE_SHIFT);
-	man->priv = mgr;
 
 	ret = device_create_file(adev->dev, &dev_attr_mem_info_gtt_total);
 	if (ret) {
@@ -121,6 +127,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 		return ret;
 	}
 
+	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
 	ttm_bo_use_mm(man);
 	return 0;
 }
@@ -136,7 +143,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
 {
 	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
-	struct amdgpu_gtt_mgr *mgr = man->priv;
+	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
 	int ret;
 
 	ttm_bo_disable_mm(man);
@@ -148,13 +155,13 @@ void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
 	spin_lock(&mgr->lock);
 	drm_mm_takedown(&mgr->mm);
 	spin_unlock(&mgr->lock);
-	kfree(mgr);
-	man->priv = NULL;
 
 	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_total);
 	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_used);
 
 	ttm_bo_man_cleanup(man);
+	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, NULL);
+	kfree(mgr);
 }
 
 /**
@@ -184,7 +191,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_mem_type_manager *man,
 			      const struct ttm_place *place,
 			      struct ttm_mem_reg *mem)
 {
-	struct amdgpu_gtt_mgr *mgr = man->priv;
+	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
 	struct amdgpu_gtt_node *node;
 	int r;
 
@@ -245,7 +252,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_mem_type_manager *man,
 static void amdgpu_gtt_mgr_del(struct ttm_mem_type_manager *man,
 			       struct ttm_mem_reg *mem)
 {
-	struct amdgpu_gtt_mgr *mgr = man->priv;
+	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
 	struct amdgpu_gtt_node *node = mem->mm_node;
 
 	if (node) {
@@ -267,7 +274,7 @@ static void amdgpu_gtt_mgr_del(struct ttm_mem_type_manager *man,
  */
 uint64_t amdgpu_gtt_mgr_usage(struct ttm_mem_type_manager *man)
 {
-	struct amdgpu_gtt_mgr *mgr = man->priv;
+	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
 	s64 result = man->size - atomic64_read(&mgr->available);
 
 	return (result > 0 ? result : 0) * PAGE_SIZE;
@@ -275,7 +282,7 @@ uint64_t amdgpu_gtt_mgr_usage(struct ttm_mem_type_manager *man)
 
 int amdgpu_gtt_mgr_recover(struct ttm_mem_type_manager *man)
 {
-	struct amdgpu_gtt_mgr *mgr = man->priv;
+	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
 	struct amdgpu_gtt_node *node;
 	struct drm_mm_node *mm_node;
 	int r = 0;
@@ -303,7 +310,7 @@ int amdgpu_gtt_mgr_recover(struct ttm_mem_type_manager *man)
 static void amdgpu_gtt_mgr_debug(struct ttm_mem_type_manager *man,
 				 struct drm_printer *printer)
 {
-	struct amdgpu_gtt_mgr *mgr = man->priv;
+	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
 
 	spin_lock(&mgr->lock);
 	drm_mm_print(&mgr->mm, printer);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index d33a750e07a8..9d4a13926b8c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -29,12 +29,18 @@
 #include "atom.h"
 
 struct amdgpu_vram_mgr {
+	struct ttm_mem_type_manager manager;
 	struct drm_mm mm;
 	spinlock_t lock;
 	atomic64_t usage;
 	atomic64_t vis_usage;
 };
 
+static inline struct amdgpu_vram_mgr *to_vram_mgr(struct ttm_mem_type_manager *man)
+{
+	return container_of(man, struct amdgpu_vram_mgr, manager);
+}
+
 /**
  * DOC: mem_info_vram_total
  *
@@ -170,29 +176,32 @@ static const struct ttm_mem_type_manager_func amdgpu_vram_mgr_func;
  */
 int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
+	struct ttm_mem_type_manager *man;
 	struct amdgpu_vram_mgr *mgr;
 	int ret;
 
+	mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
+	if (!mgr)
+		return -ENOMEM;
+
+	man = &mgr->manager;
+
 	man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
 	man->default_caching = TTM_PL_FLAG_WC;
 
 	ttm_bo_init_mm_base(&adev->mman.bdev, man, adev->gmc.real_vram_size >> PAGE_SHIFT);
 
 	man->func = &amdgpu_vram_mgr_func;
-	mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
-	if (!mgr)
-		return -ENOMEM;
 
 	drm_mm_init(&mgr->mm, 0, man->size);
 	spin_lock_init(&mgr->lock);
-	man->priv = mgr;
 
 	/* Add the two VRAM-related sysfs files */
 	ret = sysfs_create_files(&adev->dev->kobj, amdgpu_vram_mgr_attributes);
 	if (ret)
 		DRM_ERROR("Failed to register sysfs\n");
 
+	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
 	ttm_bo_use_mm(man);
 	return 0;
 }
@@ -208,7 +217,7 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 {
 	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
-	struct amdgpu_vram_mgr *mgr = man->priv;
+	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	int ret;
 
 	ttm_bo_disable_mm(man);
@@ -220,11 +229,12 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 	spin_lock(&mgr->lock);
 	drm_mm_takedown(&mgr->mm);
 	spin_unlock(&mgr->lock);
-	kfree(mgr);
-	man->priv = NULL;
+
 	sysfs_remove_files(&adev->dev->kobj, amdgpu_vram_mgr_attributes);
 
 	ttm_bo_man_cleanup(man);
+	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, NULL);
+	kfree(mgr);
 }
 
 /**
@@ -314,7 +324,7 @@ static int amdgpu_vram_mgr_new(struct ttm_mem_type_manager *man,
 			       struct ttm_mem_reg *mem)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(man->bdev);
-	struct amdgpu_vram_mgr *mgr = man->priv;
+	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct drm_mm *mm = &mgr->mm;
 	struct drm_mm_node *nodes;
 	enum drm_mm_insert_mode mode;
@@ -430,7 +440,7 @@ static void amdgpu_vram_mgr_del(struct ttm_mem_type_manager *man,
 				struct ttm_mem_reg *mem)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(man->bdev);
-	struct amdgpu_vram_mgr *mgr = man->priv;
+	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct drm_mm_node *nodes = mem->mm_node;
 	uint64_t usage = 0, vis_usage = 0;
 	unsigned pages = mem->num_pages;
@@ -562,7 +572,7 @@ void amdgpu_vram_mgr_free_sgt(struct amdgpu_device *adev,
  */
 uint64_t amdgpu_vram_mgr_usage(struct ttm_mem_type_manager *man)
 {
-	struct amdgpu_vram_mgr *mgr = man->priv;
+	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 
 	return atomic64_read(&mgr->usage);
 }
@@ -576,7 +586,7 @@ uint64_t amdgpu_vram_mgr_usage(struct ttm_mem_type_manager *man)
  */
 uint64_t amdgpu_vram_mgr_vis_usage(struct ttm_mem_type_manager *man)
 {
-	struct amdgpu_vram_mgr *mgr = man->priv;
+	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 
 	return atomic64_read(&mgr->vis_usage);
 }
@@ -592,7 +602,7 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct ttm_mem_type_manager *man)
 static void amdgpu_vram_mgr_debug(struct ttm_mem_type_manager *man,
 				  struct drm_printer *printer)
 {
-	struct amdgpu_vram_mgr *mgr = man->priv;
+	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 
 	spin_lock(&mgr->lock);
 	drm_mm_print(&mgr->mm, printer);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
