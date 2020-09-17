Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E7326D2A9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 06:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD6C6E081;
	Thu, 17 Sep 2020 04:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC5E6E08E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 04:32:02 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-Ff3o-_laO86luOeqOGMgew-1; Thu, 17 Sep 2020 00:30:50 -0400
X-MC-Unique: Ff3o-_laO86luOeqOGMgew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2D741007472;
 Thu, 17 Sep 2020 04:30:49 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-25.bne.redhat.com
 [10.64.54.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0875119D61;
 Thu, 17 Sep 2020 04:30:48 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/ttm: add a simple assign mem to bo wrapper
Date: Thu, 17 Sep 2020 14:30:38 +1000
Message-Id: <20200917043040.146575-6-airlied@gmail.com>
In-Reply-To: <20200917043040.146575-1-airlied@gmail.com>
References: <20200917043040.146575-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0.0
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This pattern is called in a few places, just clean it up.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 18 ++++++------------
 include/drm/ttm/ttm_bo_driver.h   | 10 ++++++++--
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 919489f6a5a3..5a8d77ef504f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -87,9 +87,7 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 			return ret;
 	}
 
-	*old_mem = *new_mem;
-	new_mem->mm_node = NULL;
-
+	ttm_bo_assign_mem(bo, new_mem);
 	return 0;
 }
 EXPORT_SYMBOL(ttm_bo_move_ttm);
@@ -299,8 +297,8 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	mb();
 out2:
 	old_copy = *old_mem;
-	*old_mem = *new_mem;
-	new_mem->mm_node = NULL;
+
+	ttm_bo_assign_mem(bo, new_mem);
 
 	if (!man->use_tt)
 		ttm_bo_tt_destroy(bo);
@@ -535,7 +533,6 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 {
 	struct ttm_bo_device *bdev = bo->bdev;
 	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
-	struct ttm_resource *old_mem = &bo->mem;
 	int ret;
 	struct ttm_buffer_object *ghost_obj;
 
@@ -582,8 +579,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 		ttm_bo_put(ghost_obj);
 	}
 
-	*old_mem = *new_mem;
-	new_mem->mm_node = NULL;
+	ttm_bo_assign_mem(bo, new_mem);
 
 	return 0;
 }
@@ -594,9 +590,8 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
 			 struct ttm_resource *new_mem)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
-	struct ttm_resource *old_mem = &bo->mem;
 
-	struct ttm_resource_manager *from = ttm_manager_type(bdev, old_mem->mem_type);
+	struct ttm_resource_manager *from = ttm_manager_type(bdev, bo->mem.mem_type);
 	struct ttm_resource_manager *to = ttm_manager_type(bdev, new_mem->mem_type);
 
 	int ret;
@@ -673,8 +668,7 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
 		ttm_bo_free_old_node(bo);
 	}
 
-	*old_mem = *new_mem;
-	new_mem->mm_node = NULL;
+	ttm_bo_assign_mem(bo, new_mem);
 
 	return 0;
 }
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 7846dfa507f7..25cc932d63f1 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -539,6 +539,13 @@ static inline void ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_object *bo
 	spin_unlock(&ttm_bo_glob.lru_lock);
 }
 
+static inline void ttm_bo_assign_mem(struct ttm_buffer_object *bo,
+				     struct ttm_resource *new_mem)
+{
+	bo->mem = *new_mem;
+	new_mem->mm_node = NULL;
+}
+
 /**
  * ttm_bo_move_null = assign memory for a buffer object.
  * @bo: The bo to assign the memory to
@@ -552,8 +559,7 @@ static inline void ttm_bo_move_null(struct ttm_buffer_object *bo,
 	struct ttm_resource *old_mem = &bo->mem;
 
 	WARN_ON(old_mem->mm_node != NULL);
-	*old_mem = *new_mem;
-	new_mem->mm_node = NULL;
+	ttm_bo_assign_mem(bo, new_mem);
 }
 
 /**
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
