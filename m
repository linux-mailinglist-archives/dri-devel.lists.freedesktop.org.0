Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B867F3D8E82
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6236E8AC;
	Wed, 28 Jul 2021 13:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02756E8AC
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:05:57 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id g15so2476896wrd.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 06:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B+CqSLmNsPvxU6ZvOM1U+mn9J3RpCBzv3z3howTAwSE=;
 b=WSZAMHoD7/Gv9HdTK74PLo0wTkapdrw20KZrT5JM+WO3wlONloQgnqsl8Afm1vBjXO
 tQkEj0FruoTVcoRyqBCNmhxmPyNcvOvraT9uoe5JeMf4+tn2J2O0MXyOpXSZh1FVYaDX
 fk7hbNScXSIGriNsOht27v6MjgBdnZWeiZfVsnjl3KBZN3z1DMiURY1HZmfjqxLm5ett
 mYldf18hns7zl2L8iTr3cEzFOE7OVLBR/dyOxqRikFnPAYSMccpuESBNOgSWdDLKtNEu
 mmWvp1kUGMLeD7HrhpU8FGYmCmWH93PhsngiFpu5vywrrUrMjWfH70bkysgrbd+iviNL
 oHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B+CqSLmNsPvxU6ZvOM1U+mn9J3RpCBzv3z3howTAwSE=;
 b=fJwaPtDMxly8xH/c5IiE3ic6K33NqHfAukeoV+/RhfvqAH6ztDbVs1FU0TrPk77yLV
 KGkcWHYz/fiLVGW6kZWHNb01d3HIIwWakyTAUJgr+wGm/m6gVINnSmrzV5yyvWFFsI35
 6FacqZEsVDiPixAkz8aQmrIDaweOQMYEylUCiDQ0CzRHUkBha/TybNq7AIvjvPMdAMot
 HpVCb7QINtMiyguGVtO+E7ABLUGlPQCsCyJzlltNQ4guCwLM1Z5qEqWLaiQ6J3r584Pq
 iWk3ZxuHn963H4E5uIph4fu6k+2XIu8pK+zAsZPIt8iJw/g2zC5TJvvLC6GZmQvhOM+g
 ZXew==
X-Gm-Message-State: AOAM5318UrezfP7fCO8nb7IbElz6Vng87Z8WW/y6GTxOFPQ9h2rNJFCn
 t02Xp7uuP9yzafcmzSoGVKU=
X-Google-Smtp-Source: ABdhPJz+iOUXT2GKfRkBOwVLJEJrH7gZX6iKsXpMShnxwUEA646MQpEyH4JStC1/BJl/WvLfhhn/XA==
X-Received: by 2002:a5d:68cb:: with SMTP id p11mr2654313wrw.364.1627477556236; 
 Wed, 28 Jul 2021 06:05:56 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6a03:ba57:3127:59bd])
 by smtp.gmail.com with ESMTPSA id o17sm5867374wmp.31.2021.07.28.06.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 06:05:55 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 5/5] drm/ttm: remove ttm_tt_destroy_common v2
Date: Wed, 28 Jul 2021 15:05:52 +0200
Message-Id: <20210728130552.2074-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728130552.2074-1-christian.koenig@amd.com>
References: <20210728130552.2074-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the functionality into ttm_tt_fini and ttm_bo_tt_destroy instead.

We don't need this any more since we removed the unbind from the destroy
code paths in the drivers.

Also add a warning to ttm_tt_fini() if we try to fini a still populated TT
object.

v2: instead of reverting the patch move the functionality to different
places.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  1 -
 drivers/gpu/drm/drm_gem_vram_helper.c      |  1 -
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  1 -
 drivers/gpu/drm/nouveau/nouveau_bo.c       |  1 -
 drivers/gpu/drm/nouveau/nouveau_sgdma.c    |  1 -
 drivers/gpu/drm/qxl/qxl_ttm.c              |  1 -
 drivers/gpu/drm/radeon/radeon_ttm.c        |  2 --
 drivers/gpu/drm/ttm/ttm_bo.c               |  1 +
 drivers/gpu/drm/ttm/ttm_tt.c               | 17 ++++++-----------
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  1 -
 include/drm/ttm/ttm_tt.h                   |  7 -------
 11 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 2a57076c5233..3e89a26cb63d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1066,7 +1066,6 @@ static void amdgpu_ttm_backend_destroy(struct ttm_device *bdev,
 {
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 
-	ttm_tt_destroy_common(bdev, ttm);
 	if (gtt->usertask)
 		put_task_struct(gtt->usertask);
 
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 1e9b82e51a07..cc81fbac1a13 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -846,7 +846,6 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs = {
 
 static void bo_driver_ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *tt)
 {
-	ttm_tt_destroy_common(bdev, tt);
 	ttm_tt_fini(tt);
 	kfree(tt);
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index bf33724bed5c..e646aac9d7a4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -118,7 +118,6 @@ static void i915_ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
 {
 	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
 
-	ttm_tt_destroy_common(bdev, ttm);
 	kfree(i915_tt);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index c33a56c2f068..33dca2565cca 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1292,7 +1292,6 @@ nouveau_ttm_tt_destroy(struct ttm_device *bdev,
 #if IS_ENABLED(CONFIG_AGP)
 	struct nouveau_drm *drm = nouveau_bdev(bdev);
 	if (drm->agp.bridge) {
-		ttm_tt_destroy_common(bdev, ttm);
 		ttm_agp_destroy(ttm);
 		return;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
index bde92a9dae7a..85c03c83259b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -21,7 +21,6 @@ nouveau_sgdma_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
 	struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
 
 	if (ttm) {
-		ttm_tt_destroy_common(bdev, ttm);
 		ttm_tt_fini(&nvbe->ttm);
 		kfree(nvbe);
 	}
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 37a1b6a6ad6d..b2e33d5ba5d0 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -101,7 +101,6 @@ int qxl_ttm_io_mem_reserve(struct ttm_device *bdev,
  */
 static void qxl_ttm_backend_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
 {
-	ttm_tt_destroy_common(bdev, ttm);
 	ttm_tt_fini(ttm);
 	kfree(ttm);
 }
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index ee343b76db54..7793249bc549 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -488,7 +488,6 @@ static void radeon_ttm_backend_destroy(struct ttm_device *bdev, struct ttm_tt *t
 {
 	struct radeon_ttm_tt *gtt = (void *)ttm;
 
-	ttm_tt_destroy_common(bdev, ttm);
 	ttm_tt_fini(&gtt->ttm);
 	kfree(gtt);
 }
@@ -651,7 +650,6 @@ static void radeon_ttm_tt_destroy(struct ttm_device *bdev,
 	struct radeon_device *rdev = radeon_get_rdev(bdev);
 
 	if (rdev->flags & RADEON_IS_AGP) {
-		ttm_tt_destroy_common(bdev, ttm);
 		ttm_agp_destroy(ttm);
 		return;
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index ea4add2b9717..49f4bc97c35a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1224,6 +1224,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
 	if (bo->ttm == NULL)
 		return;
 
+	ttm_tt_unpopulate(bo->bdev, bo->ttm);
 	ttm_tt_destroy(bo->bdev, bo->ttm);
 	bo->ttm = NULL;
 }
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 24031a8acd2d..506b3c926a68 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -123,17 +123,6 @@ static int ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)
 	return 0;
 }
 
-void ttm_tt_destroy_common(struct ttm_device *bdev, struct ttm_tt *ttm)
-{
-	ttm_tt_unpopulate(bdev, ttm);
-
-	if (ttm->swap_storage)
-		fput(ttm->swap_storage);
-
-	ttm->swap_storage = NULL;
-}
-EXPORT_SYMBOL(ttm_tt_destroy_common);
-
 void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
 {
 	bdev->funcs->ttm_tt_destroy(bdev, ttm);
@@ -168,6 +157,12 @@ EXPORT_SYMBOL(ttm_tt_init);
 
 void ttm_tt_fini(struct ttm_tt *ttm)
 {
+	WARN_ON(ttm->page_flags & TTM_PAGE_FLAG_PRIV_POPULATED);
+
+	if (ttm->swap_storage)
+		fput(ttm->swap_storage);
+	ttm->swap_storage = NULL;
+
 	if (ttm->pages)
 		kvfree(ttm->pages);
 	else
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 904031d03dbe..f35bdc1cb197 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -526,7 +526,6 @@ static void vmw_ttm_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
 	struct vmw_ttm_tt *vmw_be =
 		container_of(ttm, struct vmw_ttm_tt, dma_ttm);
 
-	ttm_tt_destroy_common(bdev, ttm);
 	vmw_ttm_unmap_dma(vmw_be);
 	ttm_tt_fini(ttm);
 	if (vmw_be->mob)
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 818680c6a8ed..e402dab1d0f6 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -134,13 +134,6 @@ void ttm_tt_fini(struct ttm_tt *ttm);
  */
 void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm);
 
-/**
- * ttm_tt_destroy_common:
- *
- * Called from driver to destroy common path.
- */
-void ttm_tt_destroy_common(struct ttm_device *bdev, struct ttm_tt *ttm);
-
 /**
  * ttm_tt_swapin:
  *
-- 
2.25.1

