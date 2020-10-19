Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEFA2922D9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 09:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703526E8E8;
	Mon, 19 Oct 2020 07:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8246E8E2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 07:13:28 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-rXK_EloEOAyZg2JoIlP8lg-1; Mon, 19 Oct 2020 03:13:23 -0400
X-MC-Unique: rXK_EloEOAyZg2JoIlP8lg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59E6C10E2180;
 Mon, 19 Oct 2020 07:13:22 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 652371992D;
 Mon, 19 Oct 2020 07:13:21 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/ttm: use new move interface for known system->ttm
 moves
Date: Mon, 19 Oct 2020 17:13:12 +1000
Message-Id: <20201019071314.1671485-4-airlied@gmail.com>
In-Reply-To: <20201019071314.1671485-1-airlied@gmail.com>
References: <20201019071314.1671485-1-airlied@gmail.com>
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
Cc: christian.koenig@amd.com, rscheidegger.oss@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

In all 3 drivers there is a case where the driver knows the
bo is in SYSTEM so don't call the api that checks that.

Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 3 ++-
 drivers/gpu/drm/radeon/radeon_ttm.c     | 3 ++-
 drivers/gpu/drm/ttm/ttm_bo_util.c       | 1 +
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 8cdec58b9106..f8c9d66d3ef7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -601,11 +601,11 @@ static int amdgpu_move_ram_vram(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	/* move/bind old memory to GTT space */
-	r = ttm_bo_move_ttm(bo, ctx, &tmp_mem);
+	r = ttm_bo_move_to_new_tt_mem(bo, ctx, &tmp_mem);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
-
+	ttm_bo_assign_mem(bo, &tmp_mem);
 	/* copy to VRAM */
 	r = amdgpu_move_blit(bo, evict, new_mem, old_mem);
 	if (unlikely(r)) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 4ccb3329014b..63baa9367851 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -927,10 +927,11 @@ nouveau_bo_move_flips(struct ttm_buffer_object *bo, bool evict,
 	if (ret)
 		return ret;
 
-	ret = ttm_bo_move_ttm(bo, ctx, &tmp_reg);
+	ret = ttm_bo_move_to_new_tt_mem(bo, ctx, &tmp_reg);
 	if (ret)
 		goto out;
 
+	ttm_bo_assign_mem(bo, &tmp_reg);
 	ret = nouveau_bo_move_m2mf(bo, true, ctx, new_reg);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index d6f42fbc81f4..9437d29248fd 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -275,10 +275,11 @@ static int radeon_move_ram_vram(struct ttm_buffer_object *bo,
 	if (unlikely(r)) {
 		return r;
 	}
-	r = ttm_bo_move_ttm(bo, ctx, &tmp_mem);
+	r = ttm_bo_move_to_new_tt_mem(bo, ctx, &tmp_mem);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
+	ttm_bo_assign_mem(bo, &tmp_mem);
 	r = radeon_move_blit(bo, true, new_mem, old_mem);
 	if (unlikely(r)) {
 		goto out_cleanup;
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 29726652fef7..39e03d99a377 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -64,6 +64,7 @@ int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
 
 	return 0;
 }
+EXPORT_SYMBOL(ttm_bo_move_to_new_tt_mem);
 
 static int ttm_bo_move_old_to_system(struct ttm_buffer_object *bo,
 				     struct ttm_operation_ctx *ctx)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
