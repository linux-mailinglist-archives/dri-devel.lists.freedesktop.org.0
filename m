Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A484D35E7E9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 22:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31E16E24D;
	Tue, 13 Apr 2021 20:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC2C6E24D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 20:59:41 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 13 Apr 2021 13:59:37 -0700
Received: from vertex.vmware.com (unknown [10.21.245.5])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id 7FC1D20403;
 Tue, 13 Apr 2021 13:59:38 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3] drm/vmwgfx: Make sure bo's are unpinned before putting
 them back
Date: Tue, 13 Apr 2021 16:59:38 -0400
Message-ID: <20210413205938.788366-1-zackr@vmware.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During cotable resize we pin the backup buffer to make sure the
trylock doesn't fail. We were never unpinning the backup buffer
resulting in every subsequent cotable resize trying to release a
pinned bo. After we copy the old backup to the new we can release
the pin.
Mob's are always pinned so we just have to make sure we unpin
them before releasing them.

Cc: Martin Krastev <krastevm@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Fixes: d1a73c641afd ("drm/vmwgfx: Make sure we unpin no longer needed buffers")
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c |  4 ++++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  5 +----
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c     | 18 ++++++++++++++----
 3 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
index ba658fa9cf6c..183571c387b7 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
@@ -481,11 +481,15 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
 	vmw_bo_unreference(&old_buf);
 	res->id = vcotbl->type;
 
+	/* Release the pin acquired in vmw_bo_init */
+	ttm_bo_unpin(bo);
+
 	return 0;
 
 out_map_new:
 	ttm_bo_kunmap(&old_map);
 out_wait:
+	ttm_bo_unpin(bo);
 	ttm_bo_unreserve(bo);
 	vmw_bo_unreference(&buf);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 8087a9013455..eb76a6b9ebca 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1522,11 +1522,8 @@ static inline void vmw_bo_unreference(struct vmw_buffer_object **buf)
 	struct vmw_buffer_object *tmp_buf = *buf;
 
 	*buf = NULL;
-	if (tmp_buf != NULL) {
-		if (tmp_buf->base.pin_count > 0)
-			ttm_bo_unpin(&tmp_buf->base);
+	if (tmp_buf != NULL)
 		ttm_bo_put(&tmp_buf->base);
-	}
 }
 
 static inline struct vmw_buffer_object *
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
index a0b53141dded..f2d625415458 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
@@ -94,6 +94,16 @@ static void vmw_mob_pt_setup(struct vmw_mob *mob,
 			     struct vmw_piter data_iter,
 			     unsigned long num_data_pages);
 
+
+static inline void vmw_bo_unpin_unlocked(struct ttm_buffer_object *bo)
+{
+	int ret = ttm_bo_reserve(bo, false, true, NULL);
+	BUG_ON(ret != 0);
+	ttm_bo_unpin(bo);
+	ttm_bo_unreserve(bo);
+}
+
+
 /*
  * vmw_setup_otable_base - Issue an object table base setup command to
  * the device
@@ -277,7 +287,7 @@ static int vmw_otable_batch_setup(struct vmw_private *dev_priv,
 						 &batch->otables[i]);
 	}
 
-	ttm_bo_unpin(batch->otable_bo);
+	vmw_bo_unpin_unlocked(batch->otable_bo);
 	ttm_bo_put(batch->otable_bo);
 	batch->otable_bo = NULL;
 	return ret;
@@ -341,9 +351,9 @@ static void vmw_otable_batch_takedown(struct vmw_private *dev_priv,
 	BUG_ON(ret != 0);
 
 	vmw_bo_fence_single(bo, NULL);
+	ttm_bo_unpin(bo);
 	ttm_bo_unreserve(bo);
 
-	ttm_bo_unpin(batch->otable_bo);
 	ttm_bo_put(batch->otable_bo);
 	batch->otable_bo = NULL;
 }
@@ -530,7 +540,7 @@ static void vmw_mob_pt_setup(struct vmw_mob *mob,
 void vmw_mob_destroy(struct vmw_mob *mob)
 {
 	if (mob->pt_bo) {
-		ttm_bo_unpin(mob->pt_bo);
+		vmw_bo_unpin_unlocked(mob->pt_bo);
 		ttm_bo_put(mob->pt_bo);
 		mob->pt_bo = NULL;
 	}
@@ -646,7 +656,7 @@ int vmw_mob_bind(struct vmw_private *dev_priv,
 out_no_cmd_space:
 	vmw_fifo_resource_dec(dev_priv);
 	if (pt_set_up) {
-		ttm_bo_unpin(mob->pt_bo);
+		vmw_bo_unpin_unlocked(mob->pt_bo);
 		ttm_bo_put(mob->pt_bo);
 		mob->pt_bo = NULL;
 	}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
