Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA34E27684F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA3D6EA96;
	Thu, 24 Sep 2020 05:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD386EA7F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:27 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-Lk2PPVZAM6aIEDkBhZdawg-1; Thu, 24 Sep 2020 01:19:22 -0400
X-MC-Unique: Lk2PPVZAM6aIEDkBhZdawg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01A621091062;
 Thu, 24 Sep 2020 05:19:21 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 042FF19D7C;
 Thu, 24 Sep 2020 05:19:19 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 23/45] drm/ttm: move bind out of move_to_new_tt_mem
Date: Thu, 24 Sep 2020 15:18:23 +1000
Message-Id: <20200924051845.397177-24-airlied@gmail.com>
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

Move the bind out of this for now.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  4 ++++
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  4 +++-
 drivers/gpu/drm/radeon/radeon_ttm.c     |  4 ++++
 drivers/gpu/drm/ttm/ttm_bo.c            |  7 +++++++
 drivers/gpu/drm/ttm/ttm_bo_util.c       | 12 ++++++++----
 5 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 38ddced2775d..805730481c3f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -623,6 +623,10 @@ static int amdgpu_move_ram_vram(struct ttm_buffer_object *bo, bool evict,
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
+	r = amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, &tmp_mem);
+	if (unlikely(r))
+		goto out_cleanup;
+
 	ttm_bo_assign_mem(bo, &tmp_mem);
 	/* copy to VRAM */
 	r = amdgpu_move_blit(bo, evict, new_mem, old_mem);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 144b82db16ac..dde7d59f1168 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -958,7 +958,9 @@ nouveau_bo_move_flips(struct ttm_buffer_object *bo, bool evict,
 	ret = ttm_bo_move_to_new_tt_mem(bo, ctx, &tmp_reg);
 	if (ret)
 		goto out;
-
+	ret = nouveau_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_reg);
+	if (ret)
+		goto out;
 	ttm_bo_assign_mem(bo, &tmp_reg);
 	ret = nouveau_bo_move_m2mf(bo, true, ctx, new_reg);
 	if (ret)
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index e814b11187b3..2c7c11cd65d8 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -297,6 +297,10 @@ static int radeon_move_ram_vram(struct ttm_buffer_object *bo,
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
+	r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem);
+	if (unlikely(r))
+		goto out_cleanup;
+
 	ttm_bo_assign_mem(bo, &tmp_mem);
 	r = radeon_move_blit(bo, true, new_mem, old_mem);
 	if (unlikely(r)) {
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 3b07db525417..82ea0abb5070 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -255,6 +255,13 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 		ret = ttm_bo_move_to_new_tt_mem(bo, ctx, mem);
 		if (ret)
 			goto out_err;
+
+		if (mem->mem_type != TTM_PL_SYSTEM) {
+			ret = ttm_bo_tt_bind(bo, mem);
+			if (ret)
+				goto out_err;
+		}
+
 	}
 
 	ret = bdev->driver->move(bo, evict, ctx, mem);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 1e701dd192d3..2cf3c89e7944 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -60,11 +60,8 @@ int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
 		ret = ttm_tt_populate(bo->bdev, ttm, ctx);
 		if (unlikely(ret != 0))
 			return ret;
-
-		ret = ttm_bo_tt_bind(bo, new_mem);
-		if (unlikely(ret != 0))
-			return ret;
 	}
+
 	return 0;
 }
 EXPORT_SYMBOL(ttm_bo_move_to_new_tt_mem);
@@ -105,6 +102,13 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 	ret = ttm_bo_move_to_new_tt_mem(bo, ctx, new_mem);
 	if (ret)
 		return ret;
+
+	if (new_mem->mem_type != TTM_PL_SYSTEM) {
+		ret = ttm_bo_tt_bind(bo, new_mem);
+		if (unlikely(ret != 0))
+			return ret;
+	}
+
 	ttm_bo_assign_mem(bo, new_mem);
 	return 0;
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
