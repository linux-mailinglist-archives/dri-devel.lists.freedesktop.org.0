Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDB6233DF7
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5D26E9B0;
	Fri, 31 Jul 2020 04:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78CC6E9A9
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:06:28 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-ujdKXnBHM0-iSABvGEPrNw-1; Fri, 31 Jul 2020 00:06:23 -0400
X-MC-Unique: ujdKXnBHM0-iSABvGEPrNw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B229410059A7;
 Fri, 31 Jul 2020 04:06:22 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44F6F100238C;
 Fri, 31 Jul 2020 04:06:21 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 25/49] drm/ttm: make TTM responsible for cleaning system only.
Date: Fri, 31 Jul 2020 14:04:56 +1000
Message-Id: <20200731040520.3701599-26-airlied@gmail.com>
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

drivers should all be cleaning up their memory managers
themselves now, so let the core just clean the system one up.

Remove the legacy cleaning interface.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c    | 55 +++------------------------------
 include/drm/ttm/ttm_bo_api.h    | 28 -----------------
 include/drm/ttm/ttm_bo_driver.h | 10 ------
 3 files changed, 4 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index f0f0f3101bd1..07c653374f15 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1446,43 +1446,6 @@ int ttm_bo_force_list_clean(struct ttm_bo_device *bdev,
 }
 EXPORT_SYMBOL(ttm_bo_force_list_clean);
 
-int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type)
-{
-	struct ttm_mem_type_manager *man;
-	int ret = -EINVAL;
-
-	if (mem_type >= TTM_NUM_MEM_TYPES) {
-		pr_err("Illegal memory type %d\n", mem_type);
-		return ret;
-	}
-	man = &bdev->man[mem_type];
-
-	if (!man->has_type) {
-		pr_err("Trying to take down uninitialized memory manager type %u\n",
-		       mem_type);
-		return ret;
-	}
-
-	ttm_bo_disable_mm(man);
-
-	ret = 0;
-	if (mem_type > 0) {
-		ret = ttm_bo_force_list_clean(bdev, man);
-		if (ret) {
-			pr_err("Cleanup eviction failed\n");
-			return ret;
-		}
-
-		if (man->func->takedown)
-			ret = (*man->func->takedown)(man);
-	}
-
-	ttm_bo_man_cleanup(man);
-
-	return ret;
-}
-EXPORT_SYMBOL(ttm_bo_clean_mm);
-
 int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 {
 	struct ttm_mem_type_manager *man = &bdev->man[mem_type];
@@ -1585,21 +1548,11 @@ int ttm_bo_device_release(struct ttm_bo_device *bdev)
 {
 	struct ttm_bo_global *glob = &ttm_bo_glob;
 	int ret = 0;
-	unsigned i = TTM_NUM_MEM_TYPES;
+	unsigned i;
 	struct ttm_mem_type_manager *man;
 
-	while (i--) {
-		man = &bdev->man[i];
-		if (man->has_type) {
-			man->use_type = false;
-			if ((i != TTM_PL_SYSTEM) && ttm_bo_clean_mm(bdev, i)) {
-				ret = -EBUSY;
-				pr_err("DRM memory manager type %d is not clean\n",
-				       i);
-			}
-			man->has_type = false;
-		}
-	}
+	man = &bdev->man[TTM_PL_SYSTEM];
+	ttm_bo_disable_mm(man);
 
 	mutex_lock(&ttm_global_mutex);
 	list_del(&bdev->device_list);
@@ -1612,7 +1565,7 @@ int ttm_bo_device_release(struct ttm_bo_device *bdev)
 
 	spin_lock(&glob->lru_lock);
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
-		if (list_empty(&bdev->man[0].lru[0]))
+		if (list_empty(&man->lru[0]))
 			pr_debug("Swap list %d was clean\n", i);
 	spin_unlock(&glob->lru_lock);
 
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 6562d1c5ac59..27dde1371376 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -551,34 +551,6 @@ void ttm_bo_init_mm_base(struct ttm_bo_device *bdev,
 			 struct ttm_mem_type_manager *man,
 			 unsigned long p_size);
 
-/**
- * ttm_bo_clean_mm
- *
- * @bdev: Pointer to a ttm_bo_device struct.
- * @mem_type: The memory type.
- *
- * Take down a manager for a given memory type after first walking
- * the LRU list to evict any buffers left alive.
- *
- * Normally, this function is part of lastclose() or unload(), and at that
- * point there shouldn't be any buffers left created by user-space, since
- * there should've been removed by the file descriptor release() method.
- * However, before this function is run, make sure to signal all sync objects,
- * and verify that the delayed delete queue is empty. The driver must also
- * make sure that there are no NO_EVICT buffers present in this memory type
- * when the call is made.
- *
- * If this function is part of a VT switch, the caller must make sure that
- * there are no appications currently validating buffers before this
- * function is called. The caller can do that by first taking the
- * struct ttm_bo_device::ttm_lock in write mode.
- *
- * Returns:
- * -EINVAL: invalid or uninitialized memory type.
- * -EBUSY: There are still buffers left in this memory type.
- */
-int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type);
-
 /**
  * ttm_bo_evict_mm
  *
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 2ef33b407167..9d066529ca61 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -48,16 +48,6 @@
 struct ttm_mem_type_manager;
 
 struct ttm_mem_type_manager_func {
-	/**
-	 * struct ttm_mem_type_manager member takedown
-	 *
-	 * @man: Pointer to a memory type manager.
-	 *
-	 * Called to undo the setup done in init. All allocated resources
-	 * should be freed.
-	 */
-	int  (*takedown)(struct ttm_mem_type_manager *man);
-
 	/**
 	 * struct ttm_mem_type_manager member get_node
 	 *
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
