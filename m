Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4818D276837
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E456EA7E;
	Thu, 24 Sep 2020 05:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D433F6EA7A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:13 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-jHHvT6vrPV-GsSEr_22DMA-1; Thu, 24 Sep 2020 01:19:08 -0400
X-MC-Unique: jHHvT6vrPV-GsSEr_22DMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E0F1800FFF;
 Thu, 24 Sep 2020 05:19:07 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44F3926352;
 Thu, 24 Sep 2020 05:19:06 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/45] drm/ttm: use new move interface for known system->ttm
 moves
Date: Thu, 24 Sep 2020 15:18:13 +1000
Message-Id: <20200924051845.397177-14-airlied@gmail.com>
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

In all 3 drivers there is a case where the driver knows the
bo is in SYSTEM so don't call the api that checks that.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 3 ++-
 drivers/gpu/drm/radeon/radeon_ttm.c     | 3 ++-
 drivers/gpu/drm/ttm/ttm_bo_util.c       | 1 +
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index d3bd2fd448be..960a99d6793a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -607,11 +607,11 @@ static int amdgpu_move_ram_vram(struct ttm_buffer_object *bo, bool evict,
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
index 2c10a84b2cc0..2cb61eea9481 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -945,10 +945,11 @@ nouveau_bo_move_flips(struct ttm_buffer_object *bo, bool evict,
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
index df5cedb2b632..7b778fc74f7b 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -280,10 +280,11 @@ static int radeon_move_ram_vram(struct ttm_buffer_object *bo,
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
index daf9a91857f8..e76883836e6e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -67,6 +67,7 @@ int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
 	}
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
