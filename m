Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FF93D2377
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 14:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7A66EC15;
	Thu, 22 Jul 2021 12:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253AC6EBA6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 12:41:33 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id n1so5766664wri.10
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 05:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rbhWlOsRYjtf/L4HdnCRmDzC2QwfIEQShNHakcq6e0g=;
 b=IUw5io0rG9xjNvR51ghbPngLFL6D+uza1hxyrTcWekIfcs6CuIt3GLkZhBrwuW5T7U
 arauzS2NhTjimdLVjlrb7AZK5yxnea/zatBasA6NwtG16LVr43z8becFrOjRQlQeXHED
 aqLr+4/ead0PYahVND03WOgijtxNiOF8XhCwiQBrmMvjx2dLpAgQDzNKcIEQS3d8XOVw
 rJj3sVJ03DLYka314l9Ry2zDu9WAeq6frHKIU5HmUBc+q2DZTlATG3f82DDn4XdenxXT
 a4p8Bu4vSyaYWhvOhdwvLa2GKr0dZt4lMnBbcnebmaLST7rdSjCndGVb5ZyvEnFU5TnW
 ReOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rbhWlOsRYjtf/L4HdnCRmDzC2QwfIEQShNHakcq6e0g=;
 b=dKOO9r9beFz4UiFEqPTzVDkO7BdruuwF3Yohz9KI0lqY07E8QQ/HYeObS7ujFaW+Og
 yuBmMa0ndT82Ecj1Tw2Gav43QPl4G0J82Al45dLAIo0FUBZJjG6PxKgQ0gM03DLwjcm6
 EEMy2h2DIeU65iU3cse9hZD2rz9wonGwH7T7t4VprWrc+n+KHa0UNKG1a5DRxsvCbf4k
 Kze5x67nO45lgYmVfE+d3ywg59DDAbisZy/LdLCDOq8AkTGN2dzySwOVK5IKlvauzB1x
 eiBHFToiPb0sNM8dkq9PzeluAQetIDR1sVVAuzOAfqIpSBTV0B0hpSkHuAUCu6Ty8AGQ
 W/pw==
X-Gm-Message-State: AOAM531FslGFRAxdHtAC9D+xPGSuquH52i3sxcqz6JYTHZZ5TXnaMtFo
 YvveU8csSV1rL4BAdTlCgQ6l5Y7qPhU=
X-Google-Smtp-Source: ABdhPJzZjoLoF4ARdOW5j0bUcAUPHxfv6jaLigZp7eqKNTdLYCL9hXRahJbbuNfaHfvXozVlik/FuA==
X-Received: by 2002:a05:6000:1001:: with SMTP id
 a1mr48823879wrx.121.1626957691803; 
 Thu, 22 Jul 2021 05:41:31 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6c5:784c:9ce7:760b])
 by smtp.gmail.com with ESMTPSA id w8sm18545133wrk.10.2021.07.22.05.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 05:41:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH 5/5] drm/ttm: revert "flip tt destroy ordering."
Date: Thu, 22 Jul 2021 14:41:27 +0200
Message-Id: <20210722124127.17901-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722124127.17901-1-christian.koenig@amd.com>
References: <20210722124127.17901-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It turned out that this is not a good idea at all because it leaves pointers
to freed up system memory pages in the GART tables of the drivers.

Instead change the drivers to unbind their page tables during unpopulate and
merge those things back into ttm_tt_destroy() again.

This reverts commit 7626168fd132009c79a0457bccc58014abc738f5.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 1 -
 drivers/gpu/drm/drm_gem_vram_helper.c      | 1 -
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 1 -
 drivers/gpu/drm/nouveau/nouveau_bo.c       | 1 -
 drivers/gpu/drm/nouveau/nouveau_sgdma.c    | 1 -
 drivers/gpu/drm/qxl/qxl_ttm.c              | 1 -
 drivers/gpu/drm/radeon/radeon_ttm.c        | 2 --
 drivers/gpu/drm/ttm/ttm_tt.c               | 7 +------
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 1 -
 include/drm/ttm/ttm_tt.h                   | 7 -------
 10 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 42b5162814b1..6a6e04b64a80 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1070,7 +1070,6 @@ static void amdgpu_ttm_backend_destroy(struct ttm_device *bdev,
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
index 5f309a4ec211..3177f89cf000 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1291,7 +1291,6 @@ nouveau_ttm_tt_destroy(struct ttm_device *bdev,
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
index 19fd39d9a00c..e91d8154143e 100644
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
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 24031a8acd2d..41f38d9c3e1c 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -123,7 +123,7 @@ static int ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)
 	return 0;
 }
 
-void ttm_tt_destroy_common(struct ttm_device *bdev, struct ttm_tt *ttm)
+void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
 {
 	ttm_tt_unpopulate(bdev, ttm);
 
@@ -131,11 +131,6 @@ void ttm_tt_destroy_common(struct ttm_device *bdev, struct ttm_tt *ttm)
 		fput(ttm->swap_storage);
 
 	ttm->swap_storage = NULL;
-}
-EXPORT_SYMBOL(ttm_tt_destroy_common);
-
-void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
-{
 	bdev->funcs->ttm_tt_destroy(bdev, ttm);
 }
 
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

