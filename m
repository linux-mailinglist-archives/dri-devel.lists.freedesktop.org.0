Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC863D2032
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 10:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCBB6EB50;
	Thu, 22 Jul 2021 08:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3046E49D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 08:55:59 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id g12so2872677wme.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 01:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rbhWlOsRYjtf/L4HdnCRmDzC2QwfIEQShNHakcq6e0g=;
 b=BWTn+Ls2MMGXgxWbWdobv00JzXqJBVHQ6Jw0+bEMFmYuW6c8w2ZTKDt9p3ad1r7kni
 Fqa9ZC2qdYN40M56a0KdqCAtM1WiwPhOJiwZR8vKa31fAnGfHdd0SIn1xheet6N148Fv
 6MUb/eT95Z5EU9AM6lbyhw7M78F5L34bnkmO2FDary59/YNvzzILL7sj6hTWLxczkj7V
 C76uYHkMICGhYr5I7WO3sKAO8lg5Y35S3rGiVtgVTbYrepii1I+m6hibfs/C6vKrR9VF
 Dm8L6tbirExAwPrHheLDLLLgm4NOn/p+JREFSSBuzTTnosD8XeiVuvNJM/wGuN2EmKmH
 GRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rbhWlOsRYjtf/L4HdnCRmDzC2QwfIEQShNHakcq6e0g=;
 b=aZyMFUXA20ZktNt5nhRGzjJMOCn7JjE5y8V2dsLDMwEMN+VlJmWulJZHQ/LsJAx7t2
 RABvZKyxI/E8KKb/uMGxzg5A/KYDOEAgTsE/p/tCfvZYucHGUzqsvL2J39fjiBJGfpHQ
 E5vvovENMKyowHaVueFX59nSaElK/a/uM28DPygVOmA5q1TrJ2uxdxFqxbLk9jLsXuNG
 NdbI7KCuHa2rnk+4CiYo13A4uAk5yw4dp9ypF6vr2GHrJ7XuTdjsA/EDfUccXZdD6ZOq
 07KfW7F7/+/iydHd4fbHFNs60kI/HSKUYOyCsWJ66XDSfbfV3Yiam7D2jJYCDFdnHI8V
 S67w==
X-Gm-Message-State: AOAM533yXpzoI6Q/dgJG+hiA1rX4HzrXhOU4Wpi1S7vvjFQkKIJavqJu
 zG8Ml064EjTAipWx2Uixqrx1KnNrp7o=
X-Google-Smtp-Source: ABdhPJxoCw2oyvb1T1Ffv0lFHnZJYxbKXIdQwQa88MJZcw5hW0MqKu0qs4jWxcdRt60c42hiLnKpFw==
X-Received: by 2002:a7b:c8d2:: with SMTP id f18mr40841395wml.135.1626944158336; 
 Thu, 22 Jul 2021 01:55:58 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:ee9:2117:be77:929c])
 by smtp.gmail.com with ESMTPSA id w3sm29130889wrt.55.2021.07.22.01.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 01:55:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com
Subject: [PATCH 5/5] drm/ttm: revert "flip tt destroy ordering."
Date: Thu, 22 Jul 2021 10:55:54 +0200
Message-Id: <20210722085554.1537-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722085554.1537-1-christian.koenig@amd.com>
References: <20210722085554.1537-1-christian.koenig@amd.com>
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

