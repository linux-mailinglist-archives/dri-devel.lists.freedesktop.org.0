Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6757B276830
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA0389B12;
	Thu, 24 Sep 2020 05:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CB76EA70
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:03 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-UQA41IxhPAS1HnQmAcHm8A-1; Thu, 24 Sep 2020 01:19:00 -0400
X-MC-Unique: UQA41IxhPAS1HnQmAcHm8A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C6E5800460;
 Thu, 24 Sep 2020 05:18:59 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4248027CCD;
 Thu, 24 Sep 2020 05:18:58 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/45] drm/vmwgfx: add a move callback.
Date: Thu, 24 Sep 2020 15:18:07 +1000
Message-Id: <20200924051845.397177-8-airlied@gmail.com>
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
