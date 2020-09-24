Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C4527683A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CA26EA80;
	Thu, 24 Sep 2020 05:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AE76EA77
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:14 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-H1QNpwY5MC-Ru1tERoUyLw-1; Thu, 24 Sep 2020 01:19:09 -0400
X-MC-Unique: H1QNpwY5MC-Ru1tERoUyLw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90F501891E91;
 Thu, 24 Sep 2020 05:19:08 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9984827CD3;
 Thu, 24 Sep 2020 05:19:07 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 14/45] drm/ttm: add move old to system to drivers.
Date: Thu, 24 Sep 2020 15:18:14 +1000
Message-Id: <20200924051845.397177-15-airlied@gmail.com>
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

Uninline ttm_bo_move_ttm. Eventually want to unhook the unbind out.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  9 ++++++++-
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  9 ++++++++-
 drivers/gpu/drm/radeon/radeon_ttm.c     | 10 +++++++++-
 drivers/gpu/drm/ttm/ttm_bo_util.c       |  5 +++--
 include/drm/ttm/ttm_bo_driver.h         |  2 ++
 5 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 960a99d6793a..e20ce380f627 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -568,7 +568,14 @@ static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	/* move BO (in tmp_mem) to new_mem */
-	r = ttm_bo_move_ttm(bo, ctx, new_mem);
+	r = ttm_bo_move_old_to_system(bo, ctx);
+	if (unlikely(r))
+		goto out_cleanup;
+
+	r = ttm_tt_set_placement_caching(bo->ttm, new_mem->placement);
+	if (unlikely(r))
+		goto out_cleanup;
+	ttm_bo_assign_mem(bo, new_mem);
 out_cleanup:
 	ttm_resource_free(bo, &tmp_mem);
 	return r;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 2cb61eea9481..a95d208c76a1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -915,7 +915,14 @@ nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict,
 	if (ret)
 		goto out;
 
-	ret = ttm_bo_move_ttm(bo, ctx, new_reg);
+	ret = ttm_bo_move_old_to_system(bo, ctx);
+	if (ret)
+		goto out;
+
+	ret = ttm_tt_set_placement_caching(bo->ttm, new_reg->placement);
+	if (ret)
+		goto out;
+	ttm_bo_assign_mem(bo, new_reg);
 out:
 	ttm_resource_free(bo, &tmp_reg);
 	return ret;
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 7b778fc74f7b..89455f2d3bb6 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -249,7 +249,15 @@ static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
-	r = ttm_bo_move_ttm(bo, ctx, new_mem);
+	r = ttm_bo_move_old_to_system(bo, ctx);
+	if (unlikely(r))
+		goto out_cleanup;
+
+	r = ttm_tt_set_placement_caching(bo->ttm, new_mem->placement);
+	if (unlikely(r))
+		goto out_cleanup;
+	ttm_bo_assign_mem(bo, new_mem);
+
 out_cleanup:
 	ttm_resource_free(bo, &tmp_mem);
 	return r;
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index e76883836e6e..1e701dd192d3 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -69,8 +69,8 @@ int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_move_to_new_tt_mem);
 
-static int ttm_bo_move_old_to_system(struct ttm_buffer_object *bo,
-				     struct ttm_operation_ctx *ctx)
+int ttm_bo_move_old_to_system(struct ttm_buffer_object *bo,
+			      struct ttm_operation_ctx *ctx)
 {
 	struct ttm_resource *old_mem = &bo->mem;
 	int ret;
@@ -90,6 +90,7 @@ static int ttm_bo_move_old_to_system(struct ttm_buffer_object *bo,
 	old_mem->mem_type = TTM_PL_SYSTEM;
 	return 0;
 }
+EXPORT_SYMBOL(ttm_bo_move_old_to_system);
 
 int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 		   struct ttm_operation_ctx *ctx,
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 6690ec5d90ec..65cf86b3ba0b 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -605,6 +605,8 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 		    struct ttm_operation_ctx *ctx,
 		    struct ttm_resource *new_mem);
 
+int ttm_bo_move_old_to_system(struct ttm_buffer_object *bo,
+			      struct ttm_operation_ctx *ctx);
 int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
 			      struct ttm_operation_ctx *ctx,
 			      struct ttm_resource *new_mem);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
