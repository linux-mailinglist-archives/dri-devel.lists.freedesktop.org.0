Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29BF23B2E0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0156E384;
	Tue,  4 Aug 2020 02:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54D96E384
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:56:50 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-JkNDeFGOOqaWhTjSSxvjbA-1; Mon, 03 Aug 2020 22:56:45 -0400
X-MC-Unique: JkNDeFGOOqaWhTjSSxvjbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79DF41015DA1;
 Tue,  4 Aug 2020 02:56:44 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEF438FA30;
 Tue,  4 Aug 2020 02:56:42 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/59] drm/vmwgfx: drop bo map/unmap dma functions.
Date: Tue,  4 Aug 2020 12:55:35 +1000
Message-Id: <20200804025632.3868079-3-airlied@gmail.com>
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

The map one was used once, just inline it, and drop them both.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  2 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 46 +++-------------------
 2 files changed, 6 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index b7c763713b4c..65c414f119c0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1019,8 +1019,6 @@ extern struct ttm_placement vmw_mob_placement;
 extern struct ttm_placement vmw_mob_ne_placement;
 extern struct ttm_placement vmw_nonfixed_placement;
 extern struct ttm_bo_driver vmw_bo_driver;
-extern int vmw_bo_map_dma(struct ttm_buffer_object *bo);
-extern void vmw_bo_unmap_dma(struct ttm_buffer_object *bo);
 extern const struct vmw_sg_table *
 vmw_bo_sg_table(struct ttm_buffer_object *bo);
 extern int vmw_bo_create_and_populate(struct vmw_private *dev_priv,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 8e2a82ded900..3a141a08d4bd 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -519,43 +519,6 @@ static void vmw_ttm_unmap_dma(struct vmw_ttm_tt *vmw_tt)
 	vmw_tt->mapped = false;
 }
 
-
-/**
- * vmw_bo_map_dma - Make sure buffer object pages are visible to the device
- *
- * @bo: Pointer to a struct ttm_buffer_object
- *
- * Wrapper around vmw_ttm_map_dma, that takes a TTM buffer object pointer
- * instead of a pointer to a struct vmw_ttm_backend as argument.
- * Note that the buffer object must be either pinned or reserved before
- * calling this function.
- */
-int vmw_bo_map_dma(struct ttm_buffer_object *bo)
-{
-	struct vmw_ttm_tt *vmw_tt =
-		container_of(bo->ttm, struct vmw_ttm_tt, dma_ttm.ttm);
-
-	return vmw_ttm_map_dma(vmw_tt);
-}
-
-
-/**
- * vmw_bo_unmap_dma - Make sure buffer object pages are visible to the device
- *
- * @bo: Pointer to a struct ttm_buffer_object
- *
- * Wrapper around vmw_ttm_unmap_dma, that takes a TTM buffer object pointer
- * instead of a pointer to a struct vmw_ttm_backend as argument.
- */
-void vmw_bo_unmap_dma(struct ttm_buffer_object *bo)
-{
-	struct vmw_ttm_tt *vmw_tt =
-		container_of(bo->ttm, struct vmw_ttm_tt, dma_ttm.ttm);
-
-	vmw_ttm_unmap_dma(vmw_tt);
-}
-
-
 /**
  * vmw_bo_sg_table - Return a struct vmw_sg_table object for a
  * TTM buffer object
@@ -839,9 +802,12 @@ int vmw_bo_create_and_populate(struct vmw_private *dev_priv,
 
 	ret = ttm_bo_reserve(bo, false, true, NULL);
 	BUG_ON(ret != 0);
-	ret = vmw_bo_driver.ttm_tt_populate(bo->ttm, &ctx);
-	if (likely(ret == 0))
-		ret = vmw_bo_map_dma(bo);
+	ret = vmw_ttm_populate(bo->ttm, &ctx);
+	if (likely(ret == 0)) {
+		struct vmw_ttm_tt *vmw_tt =
+			container_of(bo->ttm, struct vmw_ttm_tt, dma_ttm.ttm);
+		ret = vmw_ttm_map_dma(vmw_tt);
+	}
 
 	ttm_bo_unreserve(bo);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
