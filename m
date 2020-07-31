Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 530CC233DE3
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0936E998;
	Fri, 31 Jul 2020 04:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FEF6E998
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:05:39 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-eEostovOOAWtU2g8BYZ_ZA-1; Fri, 31 Jul 2020 00:05:35 -0400
X-MC-Unique: eEostovOOAWtU2g8BYZ_ZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E2BC1DE4;
 Fri, 31 Jul 2020 04:05:34 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 942CF100238C;
 Fri, 31 Jul 2020 04:05:32 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/49] drm/ttm: split the mm manager init code
Date: Fri, 31 Jul 2020 14:04:34 +1000
Message-Id: <20200731040520.3701599-4-airlied@gmail.com>
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

This will allow the driver to control the ordering here better.

Eventually the old path will be removed.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c    | 34 +++++++++++++++++++--------------
 include/drm/ttm/ttm_bo_api.h    |  4 ++++
 include/drm/ttm/ttm_bo_driver.h |  6 ++++++
 3 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 041a0e73cd1b..a658fd584c6d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1503,35 +1503,41 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 }
 EXPORT_SYMBOL(ttm_bo_evict_mm);
 
-int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned type,
-			unsigned long p_size)
+void ttm_bo_init_mm_base(struct ttm_bo_device *bdev,
+			 struct ttm_mem_type_manager *man,
+			 unsigned long p_size)
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
+EXPORT_SYMBOL(ttm_bo_init_mm_base);
 
+int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned type,
+			unsigned long p_size)
+{
+	int ret;
+	struct ttm_mem_type_manager *man;
+
+	BUG_ON(type >= TTM_NUM_MEM_TYPES);
+	ttm_bo_init_mm_base(bdev, &bdev->man[type], p_size);
+
+	if (type != TTM_PL_SYSTEM) {
+		ret = (*man->func->init)(man, p_size);
+		if (ret)
+			return ret;
+	}
+	ttm_bo_use_mm(man);
 	return 0;
 }
 EXPORT_SYMBOL(ttm_bo_init_mm);
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index a9e13b252820..0060925f507a 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -546,6 +546,10 @@ int ttm_bo_create(struct ttm_bo_device *bdev, unsigned long size,
  * -ENOMEM: Not enough memory.
  * May also return driver-specified errors.
  */
+struct ttm_mem_type_manager;
+void ttm_bo_init_mm_base(struct ttm_bo_device *bdev,
+			 struct ttm_mem_type_manager *man,
+			 unsigned long p_size);
 int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned type,
 		   unsigned long p_size);
 
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 7958e411269a..68e75c3b8c7a 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -678,6 +678,12 @@ static inline void ttm_bo_unreserve(struct ttm_buffer_object *bo)
 	dma_resv_unlock(bo->base.resv);
 }
 
+static inline void ttm_bo_use_mm(struct ttm_mem_type_manager *man)
+{
+	man->has_type = true;
+	man->use_type = true;
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
