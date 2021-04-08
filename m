Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 391A7358B40
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 19:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96166EB7F;
	Thu,  8 Apr 2021 17:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A513F6EB7F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 17:22:50 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Thu, 8 Apr 2021 10:22:43 -0700
Received: from vertex.vmware.com (unknown [10.16.120.5])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id E42082033D;
 Thu,  8 Apr 2021 10:22:46 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/vmwgfx: Make sure unpinning handles reservations
Date: Thu, 8 Apr 2021 13:22:45 -0400
Message-ID: <20210408172245.673785-2-zackr@vmware.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210408172245.673785-1-zackr@vmware.com>
References: <20210408172245.673785-1-zackr@vmware.com>
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
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 17 ++++++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c |  8 ++++----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 8087a9013455..03bef9c17e56 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1517,6 +1517,21 @@ static inline struct vmw_surface *vmw_surface_reference(struct vmw_surface *srf)
 	return srf;
 }
 
+/*
+ * vmw_bo_unpin_safe - currently pinning requires a reservation to be held
+ * but sometimes it's hard to tell if we're in a callback whose parent
+ * is already holding a reservation, to avoid deadloacks we have to try
+ * to get a reservation explicitly to also try to avoid messing up the
+ * internal ttm lru bo list
+ */
+static inline void vmw_bo_unpin_safe(struct ttm_buffer_object *bo)
+{
+	bool locked = dma_resv_trylock(bo->base.resv);
+	ttm_bo_unpin(bo);
+	if (locked)
+		dma_resv_unlock(bo->base.resv);
+}
+
 static inline void vmw_bo_unreference(struct vmw_buffer_object **buf)
 {
 	struct vmw_buffer_object *tmp_buf = *buf;
@@ -1524,7 +1539,7 @@ static inline void vmw_bo_unreference(struct vmw_buffer_object **buf)
 	*buf = NULL;
 	if (tmp_buf != NULL) {
 		if (tmp_buf->base.pin_count > 0)
-			ttm_bo_unpin(&tmp_buf->base);
+			vmw_bo_unpin_safe(&tmp_buf->base);
 		ttm_bo_put(&tmp_buf->base);
 	}
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
index a0b53141dded..23ffeb2dd6e0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
@@ -277,7 +277,7 @@ static int vmw_otable_batch_setup(struct vmw_private *dev_priv,
 						 &batch->otables[i]);
 	}
 
-	ttm_bo_unpin(batch->otable_bo);
+	vmw_bo_unpin_safe(batch->otable_bo);
 	ttm_bo_put(batch->otable_bo);
 	batch->otable_bo = NULL;
 	return ret;
@@ -343,7 +343,7 @@ static void vmw_otable_batch_takedown(struct vmw_private *dev_priv,
 	vmw_bo_fence_single(bo, NULL);
 	ttm_bo_unreserve(bo);
 
-	ttm_bo_unpin(batch->otable_bo);
+	vmw_bo_unpin_safe(batch->otable_bo);
 	ttm_bo_put(batch->otable_bo);
 	batch->otable_bo = NULL;
 }
@@ -530,7 +530,7 @@ static void vmw_mob_pt_setup(struct vmw_mob *mob,
 void vmw_mob_destroy(struct vmw_mob *mob)
 {
 	if (mob->pt_bo) {
-		ttm_bo_unpin(mob->pt_bo);
+		vmw_bo_unpin_safe(mob->pt_bo);
 		ttm_bo_put(mob->pt_bo);
 		mob->pt_bo = NULL;
 	}
@@ -646,7 +646,7 @@ int vmw_mob_bind(struct vmw_private *dev_priv,
 out_no_cmd_space:
 	vmw_fifo_resource_dec(dev_priv);
 	if (pt_set_up) {
-		ttm_bo_unpin(mob->pt_bo);
+		vmw_bo_unpin_safe(mob->pt_bo);
 		ttm_bo_put(mob->pt_bo);
 		mob->pt_bo = NULL;
 	}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
