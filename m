Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 317A5284329
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 02:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD326E1BD;
	Tue,  6 Oct 2020 00:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B08D6E1BC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 00:06:59 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-NYQw5AeTMmufol9b3n_6LQ-1; Mon, 05 Oct 2020 20:06:54 -0400
X-MC-Unique: NYQw5AeTMmufol9b3n_6LQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 410D31DDF6;
 Tue,  6 Oct 2020 00:06:53 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BF2873687;
 Tue,  6 Oct 2020 00:06:52 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/vmwgfx: add a move callback.
Date: Tue,  6 Oct 2020 10:06:42 +1000
Message-Id: <20201006000644.1005758-4-airlied@gmail.com>
In-Reply-To: <20201006000644.1005758-1-airlied@gmail.com>
References: <20201006000644.1005758-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: christian.koenig@amd.com, rscheidegger.oss@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This just copies the fallback to vmwgfx, I'm going to iterate on this
a bit until it's not the same as the fallback path.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 2f88d2d79f9a..6e36fc932aeb 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -725,6 +725,23 @@ static void vmw_swap_notify(struct ttm_buffer_object *bo)
 	(void) ttm_bo_wait(bo, false, false);
 }
 
+static int vmw_move(struct ttm_buffer_object *bo,
+		     bool evict,
+		     struct ttm_operation_ctx *ctx,
+		     struct ttm_resource *new_mem)
+{
+	struct ttm_resource_manager *old_man = ttm_manager_type(bo->bdev, bo->mem.mem_type);
+	struct ttm_resource_manager *new_man = ttm_manager_type(bo->bdev, new_mem->mem_type);
+
+	if (old_man->use_tt && new_man->use_tt) {
+		if (bo->mem.mem_type == TTM_PL_SYSTEM) {
+			ttm_bo_assign_mem(bo, new_mem);
+			return 0;
+		}
+		return ttm_bo_move_ttm(bo, ctx, new_mem);
+	} else
+		return ttm_bo_move_memcpy(bo, ctx, new_mem);
+}
 
 struct ttm_bo_driver vmw_bo_driver = {
 	.ttm_tt_create = &vmw_ttm_tt_create,
@@ -735,7 +752,7 @@ struct ttm_bo_driver vmw_bo_driver = {
 	.ttm_tt_destroy = &vmw_ttm_destroy,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = vmw_evict_flags,
-	.move = NULL,
+	.move = vmw_move,
 	.verify_access = vmw_verify_access,
 	.move_notify = vmw_move_notify,
 	.swap_notify = vmw_swap_notify,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
