Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E3822FFE7
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 05:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F926E125;
	Tue, 28 Jul 2020 03:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B018D6E125
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:01:28 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-Fg2aaR_XNru-z0GeTOGhQQ-1; Mon, 27 Jul 2020 23:01:25 -0400
X-MC-Unique: Fg2aaR_XNru-z0GeTOGhQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A90D58;
 Tue, 28 Jul 2020 03:01:24 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.32.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A06F69329;
 Tue, 28 Jul 2020 03:01:23 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: consolidate ttm object creation and populate
Date: Tue, 28 Jul 2020 13:01:21 +1000
Message-Id: <20200728030121.19453-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: sroland@vmware.com, linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

These two functions has the same code in them, create a common
helper function instead.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  4 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c        | 60 ++--------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 32 ++++++++++++
 3 files changed, 39 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 3596f3923ea3..b7c763713b4c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1023,6 +1023,10 @@ extern int vmw_bo_map_dma(struct ttm_buffer_object *bo);
 extern void vmw_bo_unmap_dma(struct ttm_buffer_object *bo);
 extern const struct vmw_sg_table *
 vmw_bo_sg_table(struct ttm_buffer_object *bo);
+extern int vmw_bo_create_and_populate(struct vmw_private *dev_priv,
+				      unsigned long bo_size,
+				      struct ttm_buffer_object **bo_p);
+
 extern void vmw_piter_start(struct vmw_piter *viter,
 			    const struct vmw_sg_table *vsgt,
 			    unsigned long p_offs);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
index e8eb42933ca2..7f95ed6aa224 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
@@ -238,10 +238,6 @@ static int vmw_otable_batch_setup(struct vmw_private *dev_priv,
 	unsigned long offset;
 	unsigned long bo_size;
 	struct vmw_otable *otables = batch->otables;
-	struct ttm_operation_ctx ctx = {
-		.interruptible = false,
-		.no_wait_gpu = false
-	};
 	SVGAOTableType i;
 	int ret;
 
@@ -255,24 +251,9 @@ static int vmw_otable_batch_setup(struct vmw_private *dev_priv,
 		bo_size += otables[i].size;
 	}
 
-	ret = ttm_bo_create(&dev_priv->bdev, bo_size,
-			    ttm_bo_type_device,
-			    &vmw_sys_ne_placement,
-			    0, false, &batch->otable_bo);
-
-	if (unlikely(ret != 0))
-		goto out_no_bo;
-
-	ret = ttm_bo_reserve(batch->otable_bo, false, true, NULL);
-	BUG_ON(ret != 0);
-	ret = vmw_bo_driver.ttm_tt_populate(batch->otable_bo->ttm, &ctx);
-	if (unlikely(ret != 0))
-		goto out_unreserve;
-	ret = vmw_bo_map_dma(batch->otable_bo);
+	ret = vmw_bo_create_and_populate(dev_priv, bo_size, &batch->otable_bo);
 	if (unlikely(ret != 0))
-		goto out_unreserve;
-
-	ttm_bo_unreserve(batch->otable_bo);
+		return ret;
 
 	offset = 0;
 	for (i = 0; i < batch->num_otables; ++i) {
@@ -289,8 +270,6 @@ static int vmw_otable_batch_setup(struct vmw_private *dev_priv,
 
 	return 0;
 
-out_unreserve:
-	ttm_bo_unreserve(batch->otable_bo);
 out_no_setup:
 	for (i = 0; i < batch->num_otables; ++i) {
 		if (batch->otables[i].enabled)
@@ -300,7 +279,6 @@ static int vmw_otable_batch_setup(struct vmw_private *dev_priv,
 
 	ttm_bo_put(batch->otable_bo);
 	batch->otable_bo = NULL;
-out_no_bo:
 	return ret;
 }
 
@@ -432,41 +410,9 @@ struct vmw_mob *vmw_mob_create(unsigned long data_pages)
 static int vmw_mob_pt_populate(struct vmw_private *dev_priv,
 			       struct vmw_mob *mob)
 {
-	int ret;
-	struct ttm_operation_ctx ctx = {
-		.interruptible = false,
-		.no_wait_gpu = false
-	};
-
 	BUG_ON(mob->pt_bo != NULL);
 
-	ret = ttm_bo_create(&dev_priv->bdev, mob->num_pages * PAGE_SIZE,
-			    ttm_bo_type_device,
-			    &vmw_sys_ne_placement,
-			    0, false, &mob->pt_bo);
-	if (unlikely(ret != 0))
-		return ret;
-
-	ret = ttm_bo_reserve(mob->pt_bo, false, true, NULL);
-
-	BUG_ON(ret != 0);
-	ret = vmw_bo_driver.ttm_tt_populate(mob->pt_bo->ttm, &ctx);
-	if (unlikely(ret != 0))
-		goto out_unreserve;
-	ret = vmw_bo_map_dma(mob->pt_bo);
-	if (unlikely(ret != 0))
-		goto out_unreserve;
-
-	ttm_bo_unreserve(mob->pt_bo);
-
-	return 0;
-
-out_unreserve:
-	ttm_bo_unreserve(mob->pt_bo);
-	ttm_bo_put(mob->pt_bo);
-	mob->pt_bo = NULL;
-
-	return ret;
+	return vmw_bo_create_and_populate(dev_priv, mob->num_pages * PAGE_SIZE, &mob->pt_bo);
 }
 
 /**
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 1d78187eaba6..d051b84aaeb5 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -854,3 +854,35 @@ struct ttm_bo_driver vmw_bo_driver = {
 	.swap_notify = vmw_swap_notify,
 	.io_mem_reserve = &vmw_ttm_io_mem_reserve,
 };
+
+int vmw_bo_create_and_populate(struct vmw_private *dev_priv,
+			       unsigned long bo_size,
+			       struct ttm_buffer_object **bo_p)
+{
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+		.no_wait_gpu = false
+	};
+	struct ttm_buffer_object *bo;
+	int ret;
+
+	ret = ttm_bo_create(&dev_priv->bdev, bo_size,
+			    ttm_bo_type_device,
+			    &vmw_sys_ne_placement,
+			    0, false, &bo);
+
+	if (unlikely(ret != 0))
+		return ret;
+
+	ret = ttm_bo_reserve(bo, false, true, NULL);
+	BUG_ON(ret != 0);
+	ret = vmw_bo_driver.ttm_tt_populate(bo->ttm, &ctx);
+	if (likely(ret == 0))
+		ret = vmw_bo_map_dma(bo);
+
+	ttm_bo_unreserve(bo);
+
+	if (likely(ret == 0))
+		*bo_p = bo;
+	return ret;
+}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
