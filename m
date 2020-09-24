Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D3A276856
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC816EA9D;
	Thu, 24 Sep 2020 05:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5F06EA89
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:47 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-3MHQ4GXbMIqu4nHgeCnxVA-1; Thu, 24 Sep 2020 01:19:42 -0400
X-MC-Unique: 3MHQ4GXbMIqu4nHgeCnxVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E00971017DC1;
 Thu, 24 Sep 2020 05:19:41 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7F5119D7C;
 Thu, 24 Sep 2020 05:19:40 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 37/45] drm/ttm: add a helper to allocate a temp tt for copies.
Date: Thu, 24 Sep 2020 15:18:37 +1000
Message-Id: <20200924051845.397177-38-airlied@gmail.com>
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

All the accel moves do the same pattern here, provide a helper

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c    | 28 ++++++++++++++++++++++++++++
 include/drm/ttm/ttm_bo_driver.h |  5 +++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index eb76002aa53d..358d1580dc16 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1541,3 +1541,31 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
 	ttm_tt_destroy(bo->bdev, bo->ttm);
 	bo->ttm = NULL;
 }
+
+int ttm_bo_create_tt_tmp(struct ttm_buffer_object *bo,
+			 struct ttm_operation_ctx *ctx,
+			 struct ttm_resource *new_mem,
+			 struct ttm_resource *new_temp)
+{
+	struct ttm_place placement_memtype = {
+		.fpfn = 0,
+		.lpfn = 0,
+		.mem_type = TTM_PL_TT,
+		.flags = TTM_PL_MASK_CACHING
+	};
+	struct ttm_placement placement;
+	int ret;
+
+	placement.num_placement = placement.num_busy_placement = 1;
+	placement.placement = placement.busy_placement = &placement_memtype;
+
+	*new_temp = *new_mem;
+	new_temp->mm_node = NULL;
+
+	ret = ttm_bo_mem_space(bo, &placement, new_temp, ctx);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(ttm_bo_create_tt_tmp);
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 4a63fec24e90..a7507dfaa89d 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -558,6 +558,11 @@ void ttm_mem_io_free(struct ttm_bo_device *bdev,
 int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
 			      struct ttm_operation_ctx *ctx,
 			      struct ttm_resource *new_mem);
+
+int ttm_bo_create_tt_tmp(struct ttm_buffer_object *bo,
+			 struct ttm_operation_ctx *ctx,
+			 struct ttm_resource *new_mem,
+			 struct ttm_resource *new_temp);
 /**
  * ttm_bo_move_memcpy
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
