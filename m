Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932C62FC001
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 20:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFF06E0CE;
	Tue, 19 Jan 2021 19:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961EB6E0CE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 19:31:05 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 19 Jan 2021 11:31:01 -0800
Received: from vertex.vmware.com (unknown [10.21.245.145])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id 24E9F2059F;
 Tue, 19 Jan 2021 11:31:03 -0800 (PST)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/vmwgfx: Make sure we unpin no longer needed buffers
Date: Tue, 19 Jan 2021 14:31:02 -0500
Message-ID: <20210119193102.505691-1-zackr@vmware.com>
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

We were not correctly unpinning no longer needed buffers. In particular
vmw_buffer_object, which is internally often pinned on creation wasn't
unpinned on destruction and none of the internal MOB buffers were
unpinned before being put back. Technically this existed for a
long time but 57fcd550eb15bce14a7154736379dfd4ed60ae81 introduced
a WARN_ON which was filling up the kernel logs rather quickly.

Quite frankly internal usage of vmw_buffer_object and in general
pinning needs to be refactored in vmwgfx but for now this makes
it work.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
Fixes: 57fcd550eb15bce14a7154736379dfd4ed60ae81
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 2 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index b45becbb00f8..73225ab691e6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1554,6 +1554,8 @@ static inline void vmw_bo_unreference(struct vmw_buffer_object **buf)
 
 	*buf = NULL;
 	if (tmp_buf != NULL) {
+		if (tmp_buf->base.pin_count > 0)
+			ttm_bo_unpin(&tmp_buf->base);
 		ttm_bo_put(&tmp_buf->base);
 	}
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
index 7f95ed6aa224..3c6e69f36767 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
@@ -277,6 +277,7 @@ static int vmw_otable_batch_setup(struct vmw_private *dev_priv,
 						 &batch->otables[i]);
 	}
 
+	ttm_bo_unpin(batch->otable_bo);
 	ttm_bo_put(batch->otable_bo);
 	batch->otable_bo = NULL;
 	return ret;
@@ -342,6 +343,7 @@ static void vmw_otable_batch_takedown(struct vmw_private *dev_priv,
 	vmw_bo_fence_single(bo, NULL);
 	ttm_bo_unreserve(bo);
 
+	ttm_bo_unpin(batch->otable_bo);
 	ttm_bo_put(batch->otable_bo);
 	batch->otable_bo = NULL;
 }
@@ -528,6 +530,7 @@ static void vmw_mob_pt_setup(struct vmw_mob *mob,
 void vmw_mob_destroy(struct vmw_mob *mob)
 {
 	if (mob->pt_bo) {
+		ttm_bo_unpin(mob->pt_bo);
 		ttm_bo_put(mob->pt_bo);
 		mob->pt_bo = NULL;
 	}
@@ -643,6 +646,7 @@ int vmw_mob_bind(struct vmw_private *dev_priv,
 out_no_cmd_space:
 	vmw_fifo_resource_dec(dev_priv);
 	if (pt_set_up) {
+		ttm_bo_unpin(mob->pt_bo);
 		ttm_bo_put(mob->pt_bo);
 		mob->pt_bo = NULL;
 	}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
