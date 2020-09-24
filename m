Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14391276843
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE6B6EA88;
	Thu, 24 Sep 2020 05:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A146EA7B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:18 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-OSZc3kRyMACFRLOP_nBbiA-1; Thu, 24 Sep 2020 01:19:13 -0400
X-MC-Unique: OSZc3kRyMACFRLOP_nBbiA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92D3A1891E80;
 Thu, 24 Sep 2020 05:19:12 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96CA219D7D;
 Thu, 24 Sep 2020 05:19:11 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 17/45] drm/amdgpu/ttm: handle invalidation in move callback.
Date: Thu, 24 Sep 2020 15:18:17 +1000
Message-Id: <20200924051845.397177-18-airlied@gmail.com>
In-Reply-To: <20200924051845.397177-1-airlied@gmail.com>
References: <20200924051845.397177-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Leave the delete path alone (new_mem == NULL), but otherwise
do all the invalidate and accounting in the move callback.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 35 ++++++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 13 ++++++--
 3 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 63e9c5793c30..42d530e2351a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1246,6 +1246,19 @@ int amdgpu_bo_get_metadata(struct amdgpu_bo *bo, void *buffer,
 	return 0;
 }
 
+void amdgpu_bo_move_invalidate(struct amdgpu_bo *abo,
+			       bool evict)
+{
+	struct amdgpu_device *adev = amdgpu_ttm_adev(abo->tbo.bdev);
+
+	amdgpu_vm_bo_invalidate(adev, abo, evict);
+	amdgpu_bo_kunmap(abo);
+
+	if (abo->tbo.base.dma_buf && !abo->tbo.base.import_attach &&
+	    abo->tbo.mem.mem_type != TTM_PL_SYSTEM)
+		dma_buf_move_notify(abo->tbo.base.dma_buf);
+
+}
 /**
  * amdgpu_bo_move_notify - notification about a memory move
  * @bo: pointer to a buffer object
@@ -1260,32 +1273,14 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
 			   bool evict,
 			   struct ttm_resource *new_mem)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	struct amdgpu_bo *abo;
-	struct ttm_resource *old_mem = &bo->mem;
 
 	if (!amdgpu_bo_is_amdgpu_bo(bo))
 		return;
 
-	abo = ttm_to_amdgpu_bo(bo);
-	amdgpu_vm_bo_invalidate(adev, abo, evict);
-
-	amdgpu_bo_kunmap(abo);
-
-	if (abo->tbo.base.dma_buf && !abo->tbo.base.import_attach &&
-	    bo->mem.mem_type != TTM_PL_SYSTEM)
-		dma_buf_move_notify(abo->tbo.base.dma_buf);
-
-	/* remember the eviction */
-	if (evict)
-		atomic64_inc(&adev->num_evictions);
-
-	/* update statistics */
+	/* new_mem path is handled in move */
 	if (!new_mem)
-		return;
-
-	/* move_notify is called before move happens */
-	trace_amdgpu_bo_move(abo, new_mem->mem_type, old_mem->mem_type);
+		amdgpu_bo_move_invalidate(abo, false);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index e91750e43448..53d980661410 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -283,6 +283,8 @@ int amdgpu_bo_get_metadata(struct amdgpu_bo *bo, void *buffer,
 void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
 			   bool evict,
 			   struct ttm_resource *new_mem);
+void amdgpu_bo_move_invalidate(struct amdgpu_bo *abo,
+			       bool evict);
 void amdgpu_bo_release_notify(struct ttm_buffer_object *bo);
 int amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo);
 void amdgpu_bo_fence(struct amdgpu_bo *bo, struct dma_fence *fence,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index d165edacc347..38ddced2775d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -679,6 +679,12 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	adev = amdgpu_ttm_adev(bo->bdev);
 
+	amdgpu_bo_move_invalidate(abo, evict);
+	/* remember the eviction */
+	if (evict)
+		atomic64_inc(&adev->num_evictions);
+	trace_amdgpu_bo_move(abo, new_mem->mem_type, bo->mem.mem_type);
+
 	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
 		ttm_bo_move_null(bo, new_mem);
 		return 0;
@@ -726,12 +732,12 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 		if (!amdgpu_mem_visible(adev, old_mem) ||
 		    !amdgpu_mem_visible(adev, new_mem)) {
 			pr_err("Move buffer fallback to memcpy unavailable\n");
-			return r;
+			goto out_invalidate;
 		}
 
 		r = ttm_bo_move_memcpy(bo, ctx, new_mem);
 		if (r)
-			return r;
+			goto out_invalidate;
 	}
 
 	if (bo->type == ttm_bo_type_device &&
@@ -746,6 +752,9 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 	/* update statistics */
 	atomic64_add((u64)bo->num_pages << PAGE_SHIFT, &adev->num_bytes_moved);
 	return 0;
+out_invalidate:
+	amdgpu_bo_move_invalidate(abo, evict);
+	return r;
 }
 
 /**
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
