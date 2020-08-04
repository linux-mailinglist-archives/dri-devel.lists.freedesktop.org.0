Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D61223B2EA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EAC6E3A4;
	Tue,  4 Aug 2020 02:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443306E3A0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:57:18 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-hc-LO5xrP6GqtwyRI4K82Q-1; Mon, 03 Aug 2020 22:57:13 -0400
X-MC-Unique: hc-LO5xrP6GqtwyRI4K82Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EC178017FB;
 Tue,  4 Aug 2020 02:57:12 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5D828AD1C;
 Tue,  4 Aug 2020 02:57:10 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/59] drm/ttm: split the mm manager init code (v2)
Date: Tue,  4 Aug 2020 12:55:46 +1000
Message-Id: <20200804025632.3868079-14-airlied@gmail.com>
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

This will allow the driver to control the ordering here better.

Eventually the old path will be removed.

v2: add docs for new APIs.
rename new path to ttm_mem_type_manager_init/set_used(for now)

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c    | 34 +++++++++++++++++++--------------
 include/drm/ttm/ttm_bo_api.h    | 15 +++++++++++++++
 include/drm/ttm/ttm_bo_driver.h | 15 +++++++++++++++
 3 files changed, 50 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 2ac70ec1f37d..300bcc10696a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1509,35 +1509,41 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 }
 EXPORT_SYMBOL(ttm_bo_evict_mm);
 
-int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned type,
-			unsigned long p_size)
+void ttm_mem_type_manager_init(struct ttm_bo_device *bdev,
+			       struct ttm_mem_type_manager *man,
+			       unsigned long p_size)
 {
-	int ret;
-	struct ttm_mem_type_manager *man;
 	unsigned i;
 
-	BUG_ON(type >= TTM_NUM_MEM_TYPES);
-	man = &bdev->man[type];
 	BUG_ON(man->has_type);
 	man->use_io_reserve_lru = false;
 	mutex_init(&man->io_reserve_mutex);
 	spin_lock_init(&man->move_lock);
 	INIT_LIST_HEAD(&man->io_reserve_lru);
 	man->bdev = bdev;
-
-	if (type != TTM_PL_SYSTEM) {
-		ret = (*man->func->init)(man, p_size);
-		if (ret)
-			return ret;
-	}
-	man->has_type = true;
-	man->use_type = true;
 	man->size = p_size;
 
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		INIT_LIST_HEAD(&man->lru[i]);
 	man->move = NULL;
+}
+EXPORT_SYMBOL(ttm_mem_type_manager_init);
 
+int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned type,
+			unsigned long p_size)
+{
+	int ret;
+	struct ttm_mem_type_manager *man;
+
+	BUG_ON(type >= TTM_NUM_MEM_TYPES);
+	ttm_mem_type_manager_init(bdev, &bdev->man[type], p_size);
+
+	if (type != TTM_PL_SYSTEM) {
+		ret = (*man->func->init)(man, p_size);
+		if (ret)
+			return ret;
+	}
+	ttm_mem_type_manager_set_used(man, true);
 	return 0;
 }
 EXPORT_SYMBOL(ttm_bo_init_mm);
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index a9e13b252820..89053e761a69 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -54,6 +54,8 @@ struct ttm_place;
 
 struct ttm_lru_bulk_move;
 
+struct ttm_mem_type_manager;
+
 /**
  * struct ttm_bus_placement
  *
@@ -531,6 +533,19 @@ int ttm_bo_create(struct ttm_bo_device *bdev, unsigned long size,
 		  uint32_t page_alignment, bool interruptible,
 		  struct ttm_buffer_object **p_bo);
 
+/**
+ * ttm_mem_type_manager_init
+ *
+ * @bdev: Pointer to a ttm_bo_device struct.
+ * @man: memory manager object to init
+ * @p_size: size managed area in pages.
+ *
+ * Initialise core parts of a a manager object.
+ */
+void ttm_mem_type_manager_init(struct ttm_bo_device *bdev,
+			       struct ttm_mem_type_manager *man,
+			       unsigned long p_size);
+
 /**
  * ttm_bo_init_mm
  *
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 73f5d9c766cc..6b49c0356343 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -678,6 +678,21 @@ static inline void ttm_bo_unreserve(struct ttm_buffer_object *bo)
 	dma_resv_unlock(bo->base.resv);
 }
 
+/**
+ * ttm_mem_type_manager_set_used
+ *
+ * @man: A memory manager object.
+ * @used: usage state to set.
+ *
+ * Set the manager in use flag. If disabled the manager is no longer
+ * used for object placement.
+ */
+static inline void ttm_mem_type_manager_set_used(struct ttm_mem_type_manager *man, bool used)
+{
+	man->has_type = true;
+	man->use_type = used;
+}
+
 /*
  * ttm_bo_util.c
  */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
