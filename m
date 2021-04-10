Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D64A35AFFD
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 21:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE52F6E096;
	Sat, 10 Apr 2021 19:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41586E096
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 18:59:59 +0000 (UTC)
Received: from sc9-mailhost2.vmware.com (10.113.161.72) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Sat, 10 Apr 2021 11:59:52 -0700
Received: from vertex.localdomain (unknown [10.16.119.48])
 by sc9-mailhost2.vmware.com (Postfix) with ESMTP id 401D82034C;
 Sat, 10 Apr 2021 11:59:57 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] drm/vmwgfx: Make sure unpinning handles reservations
Date: Sat, 10 Apr 2021 14:59:56 -0400
Message-ID: <20210410185956.720612-1-zackr@vmware.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-001.vmware.com: zackr@vmware.com does not
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

Quite often it's a little hard to tell if reservations are already held
in code paths that unpin bo's. While our pinning/unpinning code should
be more explicit that requires a substential amount of work so instead
we can avoid the issues by making sure we try to reserve before unpinning.
Because we unpin those bo's only on destruction/error paths just that check
tells us if we're already reserved or not and allows to cleanly unpin.

Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
Fixes: d1a73c641afd ("drm/vmwgfx: Make sure we unpin no longer needed buffers")
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 11 +++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c | 18 ++++++++++++++----
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 8087a9013455..9a3133cb5cc1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1523,8 +1523,19 @@ static inline void vmw_bo_unreference(struct vmw_buffer_object **buf)
 
 	*buf = NULL;
 	if (tmp_buf != NULL) {
+		/*
+		 * currently pinning requires a reservation to be held
+		 * but unreference can be called either reserved or not.
+		 * To avoid deadloacks we have to try to get a reservation.
+		 * This is exlusively to satisfy the requirements of the
+		 * unpin, ttm_bo_put will handle delayed deletion for us
+		 * in case the bo is really busy.
+		 */
+		bool locked = dma_resv_trylock(tmp_buf->base.base.resv);
 		if (tmp_buf->base.pin_count > 0)
 			ttm_bo_unpin(&tmp_buf->base);
+		if (locked)
+			dma_resv_unlock(tmp_buf->base.base.resv);
 		ttm_bo_put(&tmp_buf->base);
 	}
 }
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
