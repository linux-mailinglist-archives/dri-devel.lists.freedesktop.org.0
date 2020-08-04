Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD7223B2EC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFCE6E3A6;
	Tue,  4 Aug 2020 02:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D3F6E3A6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:57:25 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-6UThaINGNFm7v8O2KT_OKg-1; Mon, 03 Aug 2020 22:57:20 -0400
X-MC-Unique: 6UThaINGNFm7v8O2KT_OKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D240800461;
 Tue,  4 Aug 2020 02:57:19 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E648E8AD1C;
 Tue,  4 Aug 2020 02:57:14 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 15/59] drm/amdgpu/ttm: init managers from the driver side.
Date: Tue,  4 Aug 2020 12:55:48 +1000
Message-Id: <20200804025632.3868079-16-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Use new init calls to unwrap manager init

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 19 ++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c      | 37 +++-----------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 19 ++++++----
 4 files changed, 33 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 77fae40197ab..9d05e1ab2048 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -76,6 +76,7 @@ static DEVICE_ATTR(mem_info_gtt_total, S_IRUGO,
 static DEVICE_ATTR(mem_info_gtt_used, S_IRUGO,
 	           amdgpu_mem_info_gtt_used_show, NULL);
 
+static const struct ttm_mem_type_manager_func amdgpu_gtt_mgr_func;
 /**
  * amdgpu_gtt_mgr_init - init GTT manager and DRM MM
  *
@@ -84,14 +85,20 @@ static DEVICE_ATTR(mem_info_gtt_used, S_IRUGO,
  *
  * Allocate and initialize the GTT manager.
  */
-static int amdgpu_gtt_mgr_init(struct ttm_mem_type_manager *man,
-			       unsigned long p_size)
+int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(man->bdev);
+	struct ttm_mem_type_manager *man = &adev->mman.bdev.man[TTM_PL_TT];
 	struct amdgpu_gtt_mgr *mgr;
 	uint64_t start, size;
 	int ret;
 
+	man->use_tt = true;
+	man->func = &amdgpu_gtt_mgr_func;
+	man->available_caching = TTM_PL_MASK_CACHING;
+	man->default_caching = TTM_PL_FLAG_CACHED;
+
+	ttm_mem_type_manager_init(&adev->mman.bdev, man, gtt_size >> PAGE_SHIFT);
+
 	mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
 	if (!mgr)
 		return -ENOMEM;
@@ -100,7 +107,7 @@ static int amdgpu_gtt_mgr_init(struct ttm_mem_type_manager *man,
 	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
 	drm_mm_init(&mgr->mm, start, size);
 	spin_lock_init(&mgr->lock);
-	atomic64_set(&mgr->available, p_size);
+	atomic64_set(&mgr->available, gtt_size >> PAGE_SHIFT);
 	man->priv = mgr;
 
 	ret = device_create_file(adev->dev, &dev_attr_mem_info_gtt_total);
@@ -114,6 +121,7 @@ static int amdgpu_gtt_mgr_init(struct ttm_mem_type_manager *man,
 		return ret;
 	}
 
+	ttm_mem_type_manager_set_used(man, true);
 	return 0;
 }
 
@@ -298,8 +306,7 @@ static void amdgpu_gtt_mgr_debug(struct ttm_mem_type_manager *man,
 		   amdgpu_gtt_mgr_usage(man) >> 20);
 }
 
-const struct ttm_mem_type_manager_func amdgpu_gtt_mgr_func = {
-	.init = amdgpu_gtt_mgr_init,
+static const struct ttm_mem_type_manager_func amdgpu_gtt_mgr_func = {
 	.takedown = amdgpu_gtt_mgr_fini,
 	.get_node = amdgpu_gtt_mgr_new,
 	.put_node = amdgpu_gtt_mgr_del,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index d3e3cad4d0cb..4a09a625e748 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -63,43 +63,16 @@
 
 #define AMDGPU_TTM_VRAM_MAX_DW_READ	(size_t)128
 
-static int amdgpu_ttm_init_vram(struct amdgpu_device *adev)
-{
-
-	struct ttm_mem_type_manager *man = &adev->mman.bdev.man[TTM_PL_VRAM];
-
-	man->func = &amdgpu_vram_mgr_func;
-	man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
-	man->default_caching = TTM_PL_FLAG_WC;
-
-	return ttm_bo_init_mm(&adev->mman.bdev, TTM_PL_VRAM,
-			      adev->gmc.real_vram_size >> PAGE_SHIFT);
-}
-
-static int amdgpu_ttm_init_gtt(struct amdgpu_device *adev, uint64_t gtt_size)
-{
-	struct ttm_mem_type_manager *man = &adev->mman.bdev.man[TTM_PL_TT];
-
-	man->use_tt = true;
-	man->func = &amdgpu_gtt_mgr_func;
-	man->available_caching = TTM_PL_MASK_CACHING;
-	man->default_caching = TTM_PL_FLAG_CACHED;
-
-	return ttm_bo_init_mm(&adev->mman.bdev, TTM_PL_TT,
-			      gtt_size >> PAGE_SHIFT);
-}
-
 static int amdgpu_ttm_init_on_chip(struct amdgpu_device *adev,
-				   unsigned int type,
-				   uint64_t size)
+				    unsigned int type,
+				    uint64_t size)
 {
 	struct ttm_mem_type_manager *man = &adev->mman.bdev.man[type];
 
-	man->func = &ttm_bo_manager_func;
 	man->available_caching = TTM_PL_FLAG_UNCACHED;
 	man->default_caching = TTM_PL_FLAG_UNCACHED;
 
-	return ttm_bo_init_mm(&adev->mman.bdev, type, size);
+	return ttm_range_man_init(&adev->mman.bdev, man, size >> PAGE_SHIFT);
 }
 
 /**
@@ -1915,7 +1888,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	adev->mman.bdev.no_retry = true;
 
 	/* Initialize VRAM pool with all of VRAM divided into pages */
-	r = amdgpu_ttm_init_vram(adev);
+	r = amdgpu_vram_mgr_init(adev);
 	if (r) {
 		DRM_ERROR("Failed initializing VRAM heap.\n");
 		return r;
@@ -1982,7 +1955,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 		gtt_size = (uint64_t)amdgpu_gtt_size << 20;
 
 	/* Initialize GTT memory pool */
-	r = amdgpu_ttm_init_gtt(adev, gtt_size);
+	r = amdgpu_gtt_mgr_init(adev, gtt_size);
 	if (r) {
 		DRM_ERROR("Failed initializing GTT heap.\n");
 		return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 17c8d0d7bcc3..fb45c0a323b0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -67,8 +67,8 @@ struct amdgpu_copy_mem {
 	unsigned long			offset;
 };
 
-extern const struct ttm_mem_type_manager_func amdgpu_gtt_mgr_func;
-extern const struct ttm_mem_type_manager_func amdgpu_vram_mgr_func;
+int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size);
+int amdgpu_vram_mgr_init(struct amdgpu_device *adev);
 
 bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_mem_reg *mem);
 uint64_t amdgpu_gtt_mgr_usage(struct ttm_mem_type_manager *man);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 134cc36e30c5..bef3497de2ae 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -158,6 +158,8 @@ static const struct attribute *amdgpu_vram_mgr_attributes[] = {
 	NULL
 };
 
+static const struct ttm_mem_type_manager_func amdgpu_vram_mgr_func;
+
 /**
  * amdgpu_vram_mgr_init - init VRAM manager and DRM MM
  *
@@ -166,18 +168,23 @@ static const struct attribute *amdgpu_vram_mgr_attributes[] = {
  *
  * Allocate and initialize the VRAM manager.
  */
-static int amdgpu_vram_mgr_init(struct ttm_mem_type_manager *man,
-				unsigned long p_size)
+int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(man->bdev);
+	struct ttm_mem_type_manager *man = &adev->mman.bdev.man[TTM_PL_VRAM];
 	struct amdgpu_vram_mgr *mgr;
 	int ret;
 
+	man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
+	man->default_caching = TTM_PL_FLAG_WC;
+
+	ttm_mem_type_manager_init(&adev->mman.bdev, man, adev->gmc.real_vram_size >> PAGE_SHIFT);
+
+	man->func = &amdgpu_vram_mgr_func;
 	mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
 	if (!mgr)
 		return -ENOMEM;
 
-	drm_mm_init(&mgr->mm, 0, p_size);
+	drm_mm_init(&mgr->mm, 0, man->size);
 	spin_lock_init(&mgr->lock);
 	man->priv = mgr;
 
@@ -186,6 +193,7 @@ static int amdgpu_vram_mgr_init(struct ttm_mem_type_manager *man,
 	if (ret)
 		DRM_ERROR("Failed to register sysfs\n");
 
+	ttm_mem_type_manager_set_used(man, true);
 	return 0;
 }
 
@@ -587,8 +595,7 @@ static void amdgpu_vram_mgr_debug(struct ttm_mem_type_manager *man,
 		   amdgpu_vram_mgr_vis_usage(man) >> 20);
 }
 
-const struct ttm_mem_type_manager_func amdgpu_vram_mgr_func = {
-	.init		= amdgpu_vram_mgr_init,
+static const struct ttm_mem_type_manager_func amdgpu_vram_mgr_func = {
 	.takedown	= amdgpu_vram_mgr_fini,
 	.get_node	= amdgpu_vram_mgr_new,
 	.put_node	= amdgpu_vram_mgr_del,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
