Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2934223B2E3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5D36E38A;
	Tue,  4 Aug 2020 02:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71FC6E395
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:57:01 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-uoNXgQUfPKqzMYxLxujowQ-1; Mon, 03 Aug 2020 22:56:56 -0400
X-MC-Unique: uoNXgQUfPKqzMYxLxujowQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A4938015F7;
 Tue,  4 Aug 2020 02:56:55 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDF1190E68;
 Tue,  4 Aug 2020 02:56:53 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/59] drm/ttm: use a helper for unlocked moves to the lru tail
Date: Tue,  4 Aug 2020 12:55:39 +1000
Message-Id: <20200804025632.3868079-7-airlied@gmail.com>
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

The pattern was repeated a few times, just make an inline for it.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c    |  8 ++------
 drivers/gpu/drm/ttm/ttm_bo_vm.c |  4 +---
 include/drm/ttm/ttm_bo_driver.h | 11 ++++++++---
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 721ff546bf47..2b49037231eb 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1103,9 +1103,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 
 error:
 	if (bo->mem.mem_type == TTM_PL_SYSTEM && !list_empty(&bo->lru)) {
-		spin_lock(&ttm_bo_glob.lru_lock);
-		ttm_bo_move_to_lru_tail(bo, NULL);
-		spin_unlock(&ttm_bo_glob.lru_lock);
+		ttm_bo_move_to_lru_tail_unlocked(bo);
 	}
 
 	return ret;
@@ -1320,9 +1318,7 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
 		return ret;
 	}
 
-	spin_lock(&ttm_bo_glob.lru_lock);
-	ttm_bo_move_to_lru_tail(bo, NULL);
-	spin_unlock(&ttm_bo_glob.lru_lock);
+	ttm_bo_move_to_lru_tail_unlocked(bo);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index d7a6537dd6ee..468a0eb9e632 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -308,9 +308,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 		}
 
 		if (bo->moving != moving) {
-			spin_lock(&ttm_bo_glob.lru_lock);
-			ttm_bo_move_to_lru_tail(bo, NULL);
-			spin_unlock(&ttm_bo_glob.lru_lock);
+			ttm_bo_move_to_lru_tail_unlocked(bo);
 		}
 		dma_fence_put(moving);
 	}
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index c20fef4da1d3..7958e411269a 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -658,6 +658,13 @@ static inline int ttm_bo_reserve_slowpath(struct ttm_buffer_object *bo,
 	return 0;
 }
 
+static inline void ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_object *bo)
+{
+	spin_lock(&ttm_bo_glob.lru_lock);
+	ttm_bo_move_to_lru_tail(bo, NULL);
+	spin_unlock(&ttm_bo_glob.lru_lock);
+}
+
 /**
  * ttm_bo_unreserve
  *
@@ -667,9 +674,7 @@ static inline int ttm_bo_reserve_slowpath(struct ttm_buffer_object *bo,
  */
 static inline void ttm_bo_unreserve(struct ttm_buffer_object *bo)
 {
-	spin_lock(&ttm_bo_glob.lru_lock);
-	ttm_bo_move_to_lru_tail(bo, NULL);
-	spin_unlock(&ttm_bo_glob.lru_lock);
+	ttm_bo_move_to_lru_tail_unlocked(bo);
 	dma_resv_unlock(bo->base.resv);
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
