Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EFB233DF0
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32CF6E9AA;
	Fri, 31 Jul 2020 04:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E3C6E9A5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:06:14 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-lyYG9nJAMLe8vRG-jXy6bQ-1; Fri, 31 Jul 2020 00:06:09 -0400
X-MC-Unique: lyYG9nJAMLe8vRG-jXy6bQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFD9E10059A7;
 Fri, 31 Jul 2020 04:06:07 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FB75100238C;
 Fri, 31 Jul 2020 04:06:03 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 17/49] drm/amdgpu/ttm: use new takedown path
Date: Fri, 31 Jul 2020 14:04:48 +1000
Message-Id: <20200731040520.3701599-18-airlied@gmail.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 15 +++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c      | 10 +++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 15 +++++++++++----
 4 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 5f58aa2eac4a..f4c870b2f348 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -133,10 +133,18 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
  * Destroy and free the GTT manager, returns -EBUSY if ranges are still
  * allocated inside it.
  */
-static int amdgpu_gtt_mgr_fini(struct ttm_mem_type_manager *man)
+void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(man->bdev);
+	struct ttm_mem_type_manager *man = &adev->mman.bdev.man[TTM_PL_TT];
 	struct amdgpu_gtt_mgr *mgr = man->priv;
+	int ret;
+
+	ttm_bo_disable_mm(man);
+
+	ret = ttm_bo_force_list_clean(&adev->mman.bdev, man);
+	if (ret)
+		return;
+
 	spin_lock(&mgr->lock);
 	drm_mm_takedown(&mgr->mm);
 	spin_unlock(&mgr->lock);
@@ -146,7 +154,7 @@ static int amdgpu_gtt_mgr_fini(struct ttm_mem_type_manager *man)
 	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_total);
 	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_used);
 
-	return 0;
+	ttm_bo_man_cleanup(man);
 }
 
 /**
@@ -307,7 +315,6 @@ static void amdgpu_gtt_mgr_debug(struct ttm_mem_type_manager *man,
 }
 
 static const struct ttm_mem_type_manager_func amdgpu_gtt_mgr_func = {
-	.takedown = amdgpu_gtt_mgr_fini,
 	.get_node = amdgpu_gtt_mgr_new,
 	.put_node = amdgpu_gtt_mgr_del,
 	.debug = amdgpu_gtt_mgr_debug
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index f1bf86b8de14..b1452df8fce9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2012,11 +2012,11 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 		iounmap(adev->mman.aper_base_kaddr);
 	adev->mman.aper_base_kaddr = NULL;
 
-	ttm_bo_clean_mm(&adev->mman.bdev, TTM_PL_VRAM);
-	ttm_bo_clean_mm(&adev->mman.bdev, TTM_PL_TT);
-	ttm_bo_clean_mm(&adev->mman.bdev, AMDGPU_PL_GDS);
-	ttm_bo_clean_mm(&adev->mman.bdev, AMDGPU_PL_GWS);
-	ttm_bo_clean_mm(&adev->mman.bdev, AMDGPU_PL_OA);
+	amdgpu_vram_mgr_fini(adev);
+	amdgpu_gtt_mgr_fini(adev);
+	ttm_bo_man_takedown(&adev->mman.bdev, &adev->mman.bdev.man[AMDGPU_PL_GDS]);
+	ttm_bo_man_takedown(&adev->mman.bdev, &adev->mman.bdev.man[AMDGPU_PL_GWS]);
+	ttm_bo_man_takedown(&adev->mman.bdev, &adev->mman.bdev.man[AMDGPU_PL_OA]);
 	ttm_bo_device_release(&adev->mman.bdev);
 	adev->mman.initialized = false;
 	DRM_INFO("amdgpu: ttm finalized\n");
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index fb45c0a323b0..c01fdb3f0458 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -68,7 +68,9 @@ struct amdgpu_copy_mem {
 };
 
 int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size);
+void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev);
 int amdgpu_vram_mgr_init(struct amdgpu_device *adev);
+void amdgpu_vram_mgr_fini(struct amdgpu_device *adev);
 
 bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_mem_reg *mem);
 uint64_t amdgpu_gtt_mgr_usage(struct ttm_mem_type_manager *man);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 1bc04835c24f..cc45be8ccb0f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -205,10 +205,17 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
  * Destroy and free the VRAM manager, returns -EBUSY if ranges are still
  * allocated inside it.
  */
-static int amdgpu_vram_mgr_fini(struct ttm_mem_type_manager *man)
+void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(man->bdev);
+	struct ttm_mem_type_manager *man = &adev->mman.bdev.man[TTM_PL_VRAM];
 	struct amdgpu_vram_mgr *mgr = man->priv;
+	int ret;
+
+	ttm_bo_disable_mm(man);
+
+	ret = ttm_bo_force_list_clean(&adev->mman.bdev, man);
+	if (ret)
+		return;
 
 	spin_lock(&mgr->lock);
 	drm_mm_takedown(&mgr->mm);
@@ -216,7 +223,8 @@ static int amdgpu_vram_mgr_fini(struct ttm_mem_type_manager *man)
 	kfree(mgr);
 	man->priv = NULL;
 	sysfs_remove_files(&adev->dev->kobj, amdgpu_vram_mgr_attributes);
-	return 0;
+
+	ttm_bo_man_cleanup(man);
 }
 
 /**
@@ -596,7 +604,6 @@ static void amdgpu_vram_mgr_debug(struct ttm_mem_type_manager *man,
 }
 
 static const struct ttm_mem_type_manager_func amdgpu_vram_mgr_func = {
-	.takedown	= amdgpu_vram_mgr_fini,
 	.get_node	= amdgpu_vram_mgr_new,
 	.put_node	= amdgpu_vram_mgr_del,
 	.debug		= amdgpu_vram_mgr_debug
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
