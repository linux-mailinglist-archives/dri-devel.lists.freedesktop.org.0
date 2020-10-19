Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5C629312F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 00:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA1F6EB4E;
	Mon, 19 Oct 2020 22:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCF86EB51
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 22:23:11 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-1K2rc0xtNHOxoHmQjZsQgw-1; Mon, 19 Oct 2020 18:23:08 -0400
X-MC-Unique: 1K2rc0xtNHOxoHmQjZsQgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36296186841A;
 Mon, 19 Oct 2020 22:23:07 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7075E1002391;
 Mon, 19 Oct 2020 22:23:06 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/ttm: get rid of storing size in ttm_resource
Date: Tue, 20 Oct 2020 08:22:57 +1000
Message-Id: <20201019222257.1684769-6-airlied@gmail.com>
In-Reply-To: <20201019222257.1684769-1-airlied@gmail.com>
References: <20201019222257.1684769-1-airlied@gmail.com>
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Just use num_pages and a shift directly.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 2 +-
 drivers/gpu/drm/nouveau/nv17_fence.c | 2 +-
 drivers/gpu/drm/nouveau/nv50_fence.c | 2 +-
 drivers/gpu/drm/ttm/ttm_bo.c         | 2 --
 include/drm/ttm/ttm_bo_api.h         | 2 +-
 include/drm/ttm/ttm_resource.h       | 2 --
 6 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 3c24873ae8e9..fec7a901865e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -994,7 +994,7 @@ nouveau_bo_vm_bind(struct ttm_buffer_object *bo, struct ttm_resource *new_reg,
 		return 0;
 
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_CELSIUS) {
-		*new_tile = nv10_bo_set_tiling(dev, offset, new_reg->size,
+		*new_tile = nv10_bo_set_tiling(dev, offset, new_reg->num_pages << PAGE_SHIFT,
 					       nvbo->mode, nvbo->zeta);
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nv17_fence.c b/drivers/gpu/drm/nouveau/nv17_fence.c
index 1253fdec712d..a6da8765f262 100644
--- a/drivers/gpu/drm/nouveau/nv17_fence.c
+++ b/drivers/gpu/drm/nouveau/nv17_fence.c
@@ -80,7 +80,7 @@ nv17_fence_context_new(struct nouveau_channel *chan)
 	struct nv10_fence_chan *fctx;
 	struct ttm_resource *reg = &priv->bo->bo.mem;
 	u32 start = reg->start * PAGE_SIZE;
-	u32 limit = start + reg->size - 1;
+	u32 limit = start + (reg->num_pages << PAGE_SHIFT) - 1;
 	int ret = 0;
 
 	fctx = chan->fence = kzalloc(sizeof(*fctx), GFP_KERNEL);
diff --git a/drivers/gpu/drm/nouveau/nv50_fence.c b/drivers/gpu/drm/nouveau/nv50_fence.c
index 447238e3cbe7..65d9a20f4e55 100644
--- a/drivers/gpu/drm/nouveau/nv50_fence.c
+++ b/drivers/gpu/drm/nouveau/nv50_fence.c
@@ -39,7 +39,7 @@ nv50_fence_context_new(struct nouveau_channel *chan)
 	struct nv10_fence_chan *fctx;
 	struct ttm_resource *reg = &priv->bo->bo.mem;
 	u32 start = reg->start * PAGE_SIZE;
-	u32 limit = start + reg->size - 1;
+	u32 limit = start + (reg->num_pages << PAGE_SHIFT) - 1;
 	int ret;
 
 	fctx = chan->fence = kzalloc(sizeof(*fctx), GFP_KERNEL);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index a9f184cdbe24..7602d7734d38 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -956,7 +956,6 @@ static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
 	dma_resv_assert_held(bo->base.resv);
 
 	mem.num_pages = bo->mem.num_pages;
-	mem.size = mem.num_pages << PAGE_SHIFT;
 	mem.page_alignment = bo->mem.page_alignment;
 	mem.bus.offset = 0;
 	mem.bus.addr = NULL;
@@ -1102,7 +1101,6 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
 	INIT_LIST_HEAD(&bo->swap);
 	bo->bdev = bdev;
 	bo->type = type;
-	bo->mem.size = num_pages << PAGE_SHIFT;
 	bo->mem.mem_type = TTM_PL_SYSTEM;
 	bo->mem.num_pages = num_pages;
 	bo->mem.mm_node = NULL;
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index f201ec42b90b..f98d14957869 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -614,7 +614,7 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 
 static inline unsigned long ttm_bo_size_bytes(struct ttm_buffer_object *bo)
 {
-	return bo->mem.size;
+	return bo->mem.num_pages << PAGE_SHIFT;
 }
 
 #endif
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index f48a70d39ac5..fc9d9d7f9f15 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -159,7 +159,6 @@ struct ttm_bus_placement {
  * struct ttm_resource
  *
  * @mm_node: Memory manager node.
- * @size: Requested size of memory region.
  * @num_pages: Actual size of memory region in pages.
  * @page_alignment: Page alignment.
  * @placement: Placement flags.
@@ -171,7 +170,6 @@ struct ttm_bus_placement {
 struct ttm_resource {
 	void *mm_node;
 	unsigned long start;
-	unsigned long size;
 	unsigned long num_pages;
 	uint32_t page_alignment;
 	uint32_t mem_type;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
