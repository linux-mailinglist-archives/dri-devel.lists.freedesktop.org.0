Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7219A269BFD
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 04:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4086E831;
	Tue, 15 Sep 2020 02:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8C789C68
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 02:41:25 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-QsGcnfV2NaG9YS6kveAekA-1; Mon, 14 Sep 2020 22:40:18 -0400
X-MC-Unique: QsGcnfV2NaG9YS6kveAekA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 639B31007468;
 Tue, 15 Sep 2020 02:40:17 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-25.bne.redhat.com
 [10.64.54.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7177D7512A;
 Tue, 15 Sep 2020 02:40:16 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] drm/ttm: split populate out from binding.
Date: Tue, 15 Sep 2020 12:40:04 +1000
Message-Id: <20200915024007.67163-5-airlied@gmail.com>
In-Reply-To: <20200915024007.67163-1-airlied@gmail.com>
References: <20200915024007.67163-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0.001
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
Reply-To: , PATCH@freedesktop.org, drm@freedesktop.org
Cc: christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Drivers have to call populate themselves now before binding.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  7 ++++++-
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  6 +++++-
 drivers/gpu/drm/radeon/radeon_ttm.c     |  7 ++++++-
 drivers/gpu/drm/ttm/ttm_bo.c            |  6 +++++-
 drivers/gpu/drm/ttm/ttm_bo_util.c       |  7 ++++++-
 drivers/gpu/drm/ttm/ttm_tt.c            | 11 +++++------
 include/drm/ttm/ttm_tt.h                |  3 +--
 7 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 568cb75900a3..dc73cce515b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -548,8 +548,13 @@ static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
 		goto out_cleanup;
 	}
 
+	r = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
+	if (unlikely(r)) {
+		goto out_cleanup;
+	}
+
 	/* Bind the memory to the GTT space */
-	r = ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem, ctx);
+	r = ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 3ab9397fac40..3a1032d01808 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -904,7 +904,11 @@ nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict, bool intr,
 	if (ret)
 		return ret;
 
-	ret = ttm_tt_bind(bo->bdev, bo->ttm, &tmp_reg, &ctx);
+	ret = ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
+	if (ret)
+		goto out;
+
+	ret = ttm_tt_bind(bo->bdev, bo->ttm, &tmp_reg);
 	if (ret)
 		goto out;
 
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 7aa3d03ddeb9..2bc6991fb7e9 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -237,7 +237,12 @@ static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
 		goto out_cleanup;
 	}
 
-	r = ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem, &ctx);
+	r = ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
+	if (unlikely(r)) {
+		goto out_cleanup;
+	}
+
+	r = ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 9aae9e1bd8e8..32eaf809b7c9 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -260,7 +260,11 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 			goto out_err;
 
 		if (mem->mem_type != TTM_PL_SYSTEM) {
-			ret = ttm_tt_bind(bdev, bo->ttm, mem, ctx);
+			ret = ttm_tt_populate(bdev, bo->ttm, ctx);
+			if (ret)
+				goto out_err;
+
+			ret = ttm_tt_bind(bdev, bo->ttm, mem);
 			if (ret)
 				goto out_err;
 		}
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index f3452a1624fd..2354046bda9a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -77,7 +77,12 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 		return ret;
 
 	if (new_mem->mem_type != TTM_PL_SYSTEM) {
-		ret = ttm_tt_bind(bo->bdev, ttm, new_mem, ctx);
+
+		ret = ttm_tt_populate(bo->bdev, ttm, ctx);
+		if (unlikely(ret != 0))
+			return ret;
+
+		ret = ttm_tt_bind(bo->bdev, ttm, new_mem);
 		if (unlikely(ret != 0))
 			return ret;
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 381face3cedb..93d65e5e4205 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -312,8 +312,7 @@ void ttm_tt_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 }
 
 int ttm_tt_bind(struct ttm_bo_device *bdev,
-		struct ttm_tt *ttm, struct ttm_resource *bo_mem,
-		struct ttm_operation_ctx *ctx)
+		struct ttm_tt *ttm, struct ttm_resource *bo_mem)
 {
 	int ret = 0;
 
@@ -323,10 +322,6 @@ int ttm_tt_bind(struct ttm_bo_device *bdev,
 	if (ttm_tt_is_bound(ttm))
 		return 0;
 
-	ret = ttm_tt_populate(bdev, ttm, ctx);
-	if (ret)
-		return ret;
-
 	ret = bdev->driver->ttm_tt_bind(bdev, ttm, bo_mem);
 	if (unlikely(ret != 0))
 		return ret;
@@ -455,6 +450,9 @@ int ttm_tt_populate(struct ttm_bo_device *bdev,
 {
 	int ret;
 
+	if (!ttm)
+		return -EINVAL;
+
 	if (ttm_tt_is_populated(ttm))
 		return 0;
 
@@ -466,6 +464,7 @@ int ttm_tt_populate(struct ttm_bo_device *bdev,
 		ttm_tt_add_mapping(bdev, ttm);
 	return ret;
 }
+EXPORT_SYMBOL(ttm_tt_populate);
 
 static void ttm_tt_clear_mapping(struct ttm_tt *ttm)
 {
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 86ae759ff018..8f57d86ee67b 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -173,8 +173,7 @@ void ttm_dma_tt_fini(struct ttm_dma_tt *ttm_dma);
  * Bind the pages of @ttm to an aperture location identified by @bo_mem
  */
 int ttm_tt_bind(struct ttm_bo_device *bdev,
-		struct ttm_tt *ttm, struct ttm_resource *bo_mem,
-		struct ttm_operation_ctx *ctx);
+		struct ttm_tt *ttm, struct ttm_resource *bo_mem);
 
 /**
  * ttm_ttm_destroy:
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
