Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC894276846
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B106EA89;
	Thu, 24 Sep 2020 05:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C3D6EA78
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:18 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-mJhHojWXO_ODYKOcfDASfA-1; Thu, 24 Sep 2020 01:19:14 -0400
X-MC-Unique: mJhHojWXO_ODYKOcfDASfA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E48D285B66C;
 Thu, 24 Sep 2020 05:19:13 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBF7019930;
 Thu, 24 Sep 2020 05:19:12 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 18/45] drm/nouveau: handle move notify inside move callback.
Date: Thu, 24 Sep 2020 15:18:18 +1000
Message-Id: <20200924051845.397177-19-airlied@gmail.com>
In-Reply-To: <20200924051845.397177-1-airlied@gmail.com>
References: <20200924051845.397177-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Don't use explicit move notify for moves just do it in the driver side.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 62 ++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 1e6c2561d692..144b82db16ac 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -970,38 +970,42 @@ nouveau_bo_move_flips(struct ttm_buffer_object *bo, bool evict,
 }
 
 static void
-nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, bool evict,
-		     struct ttm_resource *new_reg)
+nouveau_bo_vma_map_update(struct nouveau_bo *nvbo,
+			  uint32_t mem_type,
+			  struct nouveau_mem *mem)
 {
-	struct nouveau_mem *mem = new_reg ? nouveau_mem(new_reg) : NULL;
-	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	struct nouveau_vma *vma;
 
-	/* ttm can now (stupidly) pass the driver bos it didn't create... */
-	if (bo->destroy != nouveau_bo_del_ttm)
-		return;
-
-	nouveau_bo_del_io_reserve_lru(bo);
-
-	if (mem && new_reg->mem_type != TTM_PL_SYSTEM &&
+	if (mem && mem_type != TTM_PL_SYSTEM &&
 	    mem->mem.page == nvbo->page) {
 		list_for_each_entry(vma, &nvbo->vma_list, head) {
 			nouveau_vma_map(vma, mem);
 		}
 	} else {
 		list_for_each_entry(vma, &nvbo->vma_list, head) {
-			WARN_ON(ttm_bo_wait(bo, false, false));
+			WARN_ON(ttm_bo_wait(&nvbo->bo, false, false));
 			nouveau_vma_unmap(vma);
 		}
 	}
+}
 
-	if (new_reg) {
-		if (new_reg->mm_node)
-			nvbo->offset = (new_reg->start << PAGE_SHIFT);
-		else
-			nvbo->offset = 0;
-	}
+static void
+nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, bool evict,
+		     struct ttm_resource *new_reg)
+{
+	struct nouveau_bo *nvbo = nouveau_bo(bo);
+
+	/* ttm can now (stupidly) pass the driver bos it didn't create... */
+	if (bo->destroy != nouveau_bo_del_ttm)
+		return;
+
+	/* handle new_reg path in move */
+	if (new_reg)
+		return;
+
+	nouveau_bo_del_io_reserve_lru(bo);
 
+	nouveau_bo_vma_map_update(nvbo, 0, NULL);
 }
 
 static int
@@ -1038,6 +1042,20 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
 	*old_tile = new_tile;
 }
 
+
+static void
+nouveau_bo_update_mem(struct nouveau_bo *nvbo,
+		      struct ttm_resource *new_reg)
+{
+	nouveau_bo_vma_map_update(nvbo, new_reg->mem_type, nouveau_mem(new_reg));
+	if (new_reg) {
+		if (new_reg->mm_node)
+			nvbo->offset = (new_reg->start << PAGE_SHIFT);
+		else
+			nvbo->offset = 0;
+	}
+}
+
 static int
 nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 		struct ttm_operation_ctx *ctx,
@@ -1053,6 +1071,9 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	if (ret)
 		return ret;
 
+	nouveau_bo_del_io_reserve_lru(bo);
+	nouveau_bo_update_mem(nvbo, new_reg);
+
 	if (nvbo->bo.pin_count)
 		NV_WARN(drm, "Moving pinned object %p!\n", nvbo);
 
@@ -1108,6 +1129,11 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 			nouveau_bo_vm_cleanup(bo, new_tile, &nvbo->tile);
 	}
 
+	if (ret) {
+		nouveau_bo_del_io_reserve_lru(bo);
+		nouveau_bo_update_mem(nvbo, &bo->mem);
+	}
+
 	return ret;
 }
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
