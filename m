Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064F5274F62
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 05:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918C86E416;
	Wed, 23 Sep 2020 03:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428B76E40F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 03:05:11 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-LYYs5QXTNeq7N0Vp5Vt-Mg-1; Tue, 22 Sep 2020 23:05:08 -0400
X-MC-Unique: LYYs5QXTNeq7N0Vp5Vt-Mg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92E8A85C708;
 Wed, 23 Sep 2020 03:05:07 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AED45D9CC;
 Wed, 23 Sep 2020 03:05:06 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/10] drm/ttm: add bo wait that takes a ctx wrapper.
Date: Wed, 23 Sep 2020 13:04:49 +1000
Message-Id: <20200923030454.362731-6-airlied@gmail.com>
In-Reply-To: <20200923030454.362731-1-airlied@gmail.com>
References: <20200923030454.362731-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

I'm thinking of pushing the wait into the drivers.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ++--
 drivers/gpu/drm/qxl/qxl_ttm.c        | 2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c  | 2 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c    | 4 ++--
 include/drm/ttm/ttm_bo_api.h         | 5 +++++
 5 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 8a90b07f17a4..8d51cfca07c8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1038,7 +1038,7 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct nouveau_drm_tile *new_tile = NULL;
 	int ret = 0;
 
-	ret = ttm_bo_wait(bo, ctx->interruptible, ctx->no_wait_gpu);
+	ret = ttm_bo_wait_ctx(bo, ctx);
 	if (ret)
 		return ret;
 
@@ -1073,7 +1073,7 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	/* Fallback to software copy. */
-	ret = ttm_bo_wait(bo, ctx->interruptible, ctx->no_wait_gpu);
+	ret = ttm_bo_wait_ctx(bo, ctx);
 	if (ret == 0)
 		ret = ttm_bo_move_memcpy(bo, ctx, new_reg);
 
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 01fe0c3a3d9a..2c35ca4270c6 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -160,7 +160,7 @@ static int qxl_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct ttm_resource *old_mem = &bo->mem;
 	int ret;
 
-	ret = ttm_bo_wait(bo, ctx->interruptible, ctx->no_wait_gpu);
+	ret = ttm_bo_wait_ctx(bo, ctx);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 9ff8c81d7784..ea9ffa6198da 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -302,7 +302,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct ttm_resource *old_mem = &bo->mem;
 	int r;
 
-	r = ttm_bo_wait(bo, ctx->interruptible, ctx->no_wait_gpu);
+	r = ttm_bo_wait_ctx(bo, ctx);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 1968df9743fc..bdee4df1f3f2 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -59,7 +59,7 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 	int ret;
 
 	if (old_mem->mem_type != TTM_PL_SYSTEM) {
-		ret = ttm_bo_wait(bo, ctx->interruptible, ctx->no_wait_gpu);
+		ret = ttm_bo_wait_ctx(bo, ctx);
 
 		if (unlikely(ret != 0)) {
 			if (ret != -ERESTARTSYS)
@@ -231,7 +231,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	unsigned long add = 0;
 	int dir;
 
-	ret = ttm_bo_wait(bo, ctx->interruptible, ctx->no_wait_gpu);
+	ret = ttm_bo_wait_ctx(bo, ctx);
 	if (ret)
 		return ret;
 
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 6cbe59bc97ab..b840756dbcca 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -262,6 +262,11 @@ ttm_bo_get_unless_zero(struct ttm_buffer_object *bo)
  */
 int ttm_bo_wait(struct ttm_buffer_object *bo, bool interruptible, bool no_wait);
 
+static inline int ttm_bo_wait_ctx(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
+{
+	return ttm_bo_wait(bo, ctx->interruptible, ctx->no_wait_gpu);
+}
+
 /**
  * ttm_bo_mem_compat - Check if proposed placement is compatible with a bo
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
