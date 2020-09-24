Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F620276848
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B3A6EA90;
	Thu, 24 Sep 2020 05:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B15E6EA89
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:56 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-l3LF-_0YO-KYtbZg-a7Yeg-1; Thu, 24 Sep 2020 01:19:52 -0400
X-MC-Unique: l3LF-_0YO-KYtbZg-a7Yeg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43ABD802B68;
 Thu, 24 Sep 2020 05:19:51 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A6EF19D7C;
 Thu, 24 Sep 2020 05:19:50 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 44/45] drm/ttm: move more functionality into helper function.
Date: Thu, 24 Sep 2020 15:18:44 +1000
Message-Id: <20200924051845.397177-45-airlied@gmail.com>
In-Reply-To: <20200924051845.397177-1-airlied@gmail.com>
References: <20200924051845.397177-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 10 ----------
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  7 -------
 drivers/gpu/drm/radeon/radeon_ttm.c     |  8 --------
 drivers/gpu/drm/ttm/ttm_bo.c            |  4 ++++
 4 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 099752bc42e9..efb74ddc1877 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -534,11 +534,6 @@ static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
 		return r;
 	}
 
-	/* set caching flags */
-	r = ttm_bo_move_to_new_tt_mem(bo, ctx, &tmp_mem);
-	if (unlikely(r))
-		goto out_cleanup;
-
 	/* Bind the memory to the GTT space */
 	r = amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, &tmp_mem);
 	if (unlikely(r)) {
@@ -588,11 +583,6 @@ static int amdgpu_move_ram_vram(struct ttm_buffer_object *bo, bool evict,
 		return r;
 	}
 
-	/* move/bind old memory to GTT space */
-	r = ttm_bo_move_to_new_tt_mem(bo, ctx, &tmp_mem);
-	if (unlikely(r)) {
-		goto out_cleanup;
-	}
 	r = amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, &tmp_mem);
 	if (unlikely(r))
 		goto out_cleanup;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 1786c92bf3fc..08beb92b0571 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -891,10 +891,6 @@ nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict,
 	if (ret)
 		return ret;
 
-	ret = ttm_bo_move_to_new_tt_mem(bo, ctx, &tmp_reg);
-	if (ret)
-		return ret;
-
 	ret = nouveau_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_reg);
 	if (ret)
 		goto out;
@@ -931,9 +927,6 @@ nouveau_bo_move_flips(struct ttm_buffer_object *bo, bool evict,
 	if (ret)
 		return ret;
 
-	ret = ttm_bo_move_to_new_tt_mem(bo, ctx, &tmp_reg);
-	if (ret)
-		goto out;
 	ret = nouveau_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_reg);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index ccd588bd4ea5..6698e288cfbc 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -220,10 +220,6 @@ static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
 	if (unlikely(r)) {
 		return r;
 	}
-	r = ttm_bo_move_to_new_tt_mem(bo, ctx, &tmp_mem);
-	if (unlikely(r)) {
-		goto out_cleanup;
-	}
 
 	r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem);
 	if (unlikely(r)) {
@@ -260,10 +256,6 @@ static int radeon_move_ram_vram(struct ttm_buffer_object *bo,
 	int r;
 
 	r = ttm_bo_create_tt_tmp(bo, ctx, new_mem, &tmp_mem);
-	if (unlikely(r)) {
-		return r;
-	}
-	r = ttm_bo_move_to_new_tt_mem(bo, ctx, &tmp_mem);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 358d1580dc16..7ea7ed85e289 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1566,6 +1566,10 @@ int ttm_bo_create_tt_tmp(struct ttm_buffer_object *bo,
 	if (ret)
 		return ret;
 
+	ret  = ttm_bo_move_to_new_tt_mem(bo, ctx, new_temp);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 EXPORT_SYMBOL(ttm_bo_create_tt_tmp);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
