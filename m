Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127703FB2BD
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 10:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1312D89C1F;
	Mon, 30 Aug 2021 08:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF50A89C1F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 08:57:11 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u16so21345908wrn.5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 01:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=q0OlNS0LSkpXgvHR+mVwwOaKy9gbdtsNwjOto1SH2o4=;
 b=dVvt/B60Ktmp+VqjMfVkjVSGGmMbpSAlnTK8jOulbTFiytl3+Z49Cxs59F0ZmqfO89
 tY9L6d1/T7qOdR/SCF9jm2mn083CzHLFm8Iekmji7LOBw2iA8hBg9KfkRKWaveH33lty
 UbOuNtBmKTCSP0e9wlV59Dq1OZOeGFK/5FZjzdXVhB0o+8/8fuOUYEvaM7hLofFD8n72
 4mgehiczA3K00YJrCAj8kLfW2R6OwS9kEtfIslfA26v+I7L2oD2GM8W9y7187Pxcjcxc
 ACqULKhg/eMKCu2lW5I4bO7t0Em1UZ3zQinKgibXTpiTG2wvkn8wTdj/6J0yhYKeSeUT
 /Mdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q0OlNS0LSkpXgvHR+mVwwOaKy9gbdtsNwjOto1SH2o4=;
 b=cdzzizYeeJ44zpKZu65co5QTwq6pmBxMgP6O6dZHptc/OsZusDWDQcvIl1QLNILrQP
 ZBmnSl1YqplignFXEKMAYT+3RPzZ+wR7FKZgHLinLVr+iVMK5rf/iMwLQz4M9MUUjTN4
 NzKXEO80t4tUIsuOm75wHxNmHx00I7DyMZU1qIbq5MSPW2gqnXVCTdVIB3umiDAENG6E
 nRvL1+yVuNcBnvyhBqoR0q3FfiPRfokEZApM03S6ZDWqgWkkiAAv9tUStruJmjvnvTOC
 sUsLQNf/ARbfaPFVMIVJdtsyYew60KxrUhZb4tDddd8wFK2zeFsNjkSRJtIIOlNT8F3z
 KP5Q==
X-Gm-Message-State: AOAM533jadtLFgORhX8LHYf1sz35oN/ZDSKV7K6WxprTZJA8//5CFedU
 weISxwz1ADFAq7WATvXX9F8=
X-Google-Smtp-Source: ABdhPJw6Xeez2G7ReVNZ+eHXK8TToiXBEZSExmLsJA0Rm/mMMd7jN6mUM4NptUJ884AlYfuxjkWkRw==
X-Received: by 2002:adf:9e48:: with SMTP id v8mr8061339wre.141.1630313830201; 
 Mon, 30 Aug 2021 01:57:10 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u2sm8843245wmj.29.2021.08.30.01.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 01:57:09 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org,
 andrey.grodzovsky@amd.com
Subject: [PATCH 02/12] drm/ttm: add back a reference to the bdev to the res
 manager
Date: Mon, 30 Aug 2021 10:56:57 +0200
Message-Id: <20210830085707.209508-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830085707.209508-1-christian.koenig@amd.com>
References: <20210830085707.209508-1-christian.koenig@amd.com>
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

It is simply a lot cleaner to have this around instead of adding
the device throughout the call chain.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c     | 3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c    | 3 ++-
 drivers/gpu/drm/nouveau/nouveau_ttm.c           | 4 ++--
 drivers/gpu/drm/ttm/ttm_range_manager.c         | 2 +-
 drivers/gpu/drm/ttm/ttm_resource.c              | 3 +++
 drivers/gpu/drm/ttm/ttm_sys_manager.c           | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c   | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c             | 2 +-
 include/drm/ttm/ttm_resource.h                  | 8 ++++----
 10 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 77cfb64dd312..1dae68caa974 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -293,7 +293,8 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 	man->use_tt = true;
 	man->func = &amdgpu_gtt_mgr_func;
 
-	ttm_resource_manager_init(man, gtt_size >> PAGE_SHIFT);
+	ttm_resource_manager_init(man, &adev->mman.bdev,
+				  gtt_size >> PAGE_SHIFT);
 
 	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
 	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
index ffddec08e931..6f7189d32f0a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
@@ -153,7 +153,7 @@ int amdgpu_preempt_mgr_init(struct amdgpu_device *adev)
 	man->use_tt = true;
 	man->func = &amdgpu_preempt_mgr_func;
 
-	ttm_resource_manager_init(man, (1 << 30));
+	ttm_resource_manager_init(man, &adev->mman.bdev, (1 << 30));
 
 	atomic64_set(&mgr->used, 0);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 0184210744a7..c1e97c865c2b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -699,7 +699,8 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
 
-	ttm_resource_manager_init(man, adev->gmc.real_vram_size >> PAGE_SHIFT);
+	ttm_resource_manager_init(man, &adev->mman.bdev,
+				  adev->gmc.real_vram_size >> PAGE_SHIFT);
 
 	man->func = &amdgpu_vram_mgr_func;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 34421174ed59..6adee64b2332 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -164,7 +164,7 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
 
 		man->func = &nouveau_vram_manager;
 
-		ttm_resource_manager_init(man,
+		ttm_resource_manager_init(man, &drm->ttm.bdev,
 					  drm->gem.vram_available >> PAGE_SHIFT);
 		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, man);
 		ttm_resource_manager_set_used(man, true);
@@ -211,7 +211,7 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 
 	man->func = func;
 	man->use_tt = true;
-	ttm_resource_manager_init(man, size_pages);
+	ttm_resource_manager_init(man, &drm->ttm.bdev, size_pages);
 	ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, man);
 	ttm_resource_manager_set_used(man, true);
 	return 0;
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index 69962b5769c5..5c62cbb2a205 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -156,7 +156,7 @@ int ttm_range_man_init(struct ttm_device *bdev,
 
 	man->func = &ttm_range_manager_func;
 
-	ttm_resource_manager_init(man, p_size);
+	ttm_resource_manager_init(man, bdev, p_size);
 
 	drm_mm_init(&rman->mm, 0, p_size);
 	spin_lock_init(&rman->lock);
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 2e0db43ff99c..122f19e6968b 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -77,16 +77,19 @@ EXPORT_SYMBOL(ttm_resource_free);
  * ttm_resource_manager_init
  *
  * @man: memory manager object to init
+ * @bdev: ttm device this manager belongs to
  * @p_size: size managed area in pages.
  *
  * Initialise core parts of a manager object.
  */
 void ttm_resource_manager_init(struct ttm_resource_manager *man,
+			       struct ttm_device *bdev,
 			       unsigned long p_size)
 {
 	unsigned i;
 
 	spin_lock_init(&man->move_lock);
+	man->bdev = bdev;
 	man->size = p_size;
 
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
diff --git a/drivers/gpu/drm/ttm/ttm_sys_manager.c b/drivers/gpu/drm/ttm/ttm_sys_manager.c
index 135394dcca95..2ced169513cb 100644
--- a/drivers/gpu/drm/ttm/ttm_sys_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_sys_manager.c
@@ -43,7 +43,7 @@ void ttm_sys_man_init(struct ttm_device *bdev)
 	man->use_tt = true;
 	man->func = &ttm_sys_manager_func;
 
-	ttm_resource_manager_init(man, 0);
+	ttm_resource_manager_init(man, bdev, 0);
 	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, man);
 	ttm_resource_manager_set_used(man, true);
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index bfd686bb8d19..4fe4eeb95bf3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -150,7 +150,7 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
 	man->func = &vmw_gmrid_manager_func;
 	/* TODO: This is most likely not correct */
 	man->use_tt = true;
-	ttm_resource_manager_init(man, 0);
+	ttm_resource_manager_init(man, &dev_priv->bdev, 0);
 	spin_lock_init(&gman->lock);
 	gman->used_gmr_pages = 0;
 	ida_init(&gman->gmr_ida);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index 4fcbd94ccc11..b8cd89cd624c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -135,7 +135,7 @@ int vmw_thp_init(struct vmw_private *dev_priv)
 	if (!rman)
 		return -ENOMEM;
 
-	ttm_resource_manager_init(&rman->manager,
+	ttm_resource_manager_init(&rman->manager, &dev_priv->bdev,
 				  dev_priv->vram_size >> PAGE_SHIFT);
 
 	rman->manager.func = &vmw_thp_func;
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index dd6929f0c4f6..c004672789b6 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -102,11 +102,9 @@ struct ttm_resource_manager_func {
  * struct ttm_resource_manager
  *
  * @use_type: The memory type is enabled.
- * @flags: TTM_MEMTYPE_XX flags identifying the traits of the memory
- * managed by this memory type.
- * @gpu_offset: If used, the GPU offset of the first managed page of
- * fixed memory or the first managed location in an aperture.
+ * @use_tt: allocate TTM object for this resources
  * @size: Size of the managed region.
+ * @bdev: ttm device this manager belongs to
  * @func: structure pointer implementing the range manager. See above
  * @move_lock: lock for move fence
  * static information. bdev::driver::io_mem_free is never used.
@@ -121,6 +119,7 @@ struct ttm_resource_manager {
 	 */
 	bool use_type;
 	bool use_tt;
+	struct ttm_device *bdev;
 	uint64_t size;
 	const struct ttm_resource_manager_func *func;
 	spinlock_t move_lock;
@@ -271,6 +270,7 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
 void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
 
 void ttm_resource_manager_init(struct ttm_resource_manager *man,
+			       struct ttm_device *bdev,
 			       unsigned long p_size);
 
 int ttm_resource_manager_evict_all(struct ttm_device *bdev,
-- 
2.25.1

