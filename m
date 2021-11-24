Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8C645BE63
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 13:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E00D6E434;
	Wed, 24 Nov 2021 12:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CC46E434
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 12:44:36 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id s13so4010993wrb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 04:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Vbi3EGJ3IEa7gSqOTF6Y+bRnnlf+Q186qcRdHYzVeLM=;
 b=qJF4WRCZoVt9OqJprat19XZrahuB+yHhXKUuM+tqqbVw6aIzW1mIvBbQFCDinz8Vxc
 LMsZWheG8LvM1XrpPUPNn1m85PXs97IZ/ODAM60KLqXsNG4cdKxBVSfTmOZBI8XGRxu9
 RyReDzGhm4KnJU026ERppybvPVLDqqba1UhiSwThKDmujK636B0SkoVaTtO/m5EfUhZf
 rUJjo/buA0icuYCYp0TzopHiSnGNt0c6es/4949A2bRzN74LjFbqeHFhgK7+W4Iv01o1
 qqImOKVW13Wo/K13suFmu5JdvrXrf0pV6Ku8GkJtJP+F7b1ysyrlTbADDAkRsoJctBNU
 krWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vbi3EGJ3IEa7gSqOTF6Y+bRnnlf+Q186qcRdHYzVeLM=;
 b=ZnhnwQUiin5E5X1w9lW+0JxVN3i9meEgpougS4OvpB6JYdwfGJnrliZpMkyP1h73YT
 9AFaHgrw658AOqirFPdAaRIRl8agAFGpAABb8cqXCgHWdfQn2ieKMIuDoHudQPBg61ms
 C4L57ofImD5m7hmyNb3rH4j6JzbrcNzfDlIk51EoTKDa1bHgsbs/zO9QtFWMPoRGvRtV
 w7lnx5+vxFCuN05/DDFC7asa6BnREC+9tJgwOnfOhDs460i7xrJntR0nPuAttdPPSjnj
 DG0EJCehNnoszI+wQqPwtlrnmOeB7k2cz1ikgnp9jncr8EpIPIKkSOFM8h0lu+nzaauH
 6kXQ==
X-Gm-Message-State: AOAM532rjcRfhrET6WnM8wJ3vMMhy/WmnsZyt1BzNLqKIxiRIx28k6Ic
 jg9owoyZqdnHnvqnKOvsnBG8uiybog8=
X-Google-Smtp-Source: ABdhPJzh+akXQ3KidhzDzJxQH0/IdcW3fYjIVVhPpNd92Y7U+EXDX8UbEBZHfvgIpSYkhxBCJOs/cg==
X-Received: by 2002:a5d:64eb:: with SMTP id g11mr18763474wri.438.1637757874810; 
 Wed, 24 Nov 2021 04:44:34 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id 38sm15583145wrc.1.2021.11.24.04.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 04:44:34 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, thomas.hellstrom@linux.intel.com, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 02/12] drm/ttm: add back a reference to the bdev to the res
 manager
Date: Wed, 24 Nov 2021 13:44:20 +0100
Message-Id: <20211124124430.20859-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124124430.20859-1-christian.koenig@amd.com>
References: <20211124124430.20859-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c     |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c    |  3 ++-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c   |  2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c           |  4 ++--
 drivers/gpu/drm/ttm/ttm_range_manager.c         |  2 +-
 drivers/gpu/drm/ttm/ttm_resource.c              |  3 +++
 drivers/gpu/drm/ttm/ttm_sys_manager.c           |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c   |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c             |  2 +-
 include/drm/ttm/ttm_resource.h                  | 16 +++++++++-------
 11 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index ea5470c8c921..9e7685a4878c 100644
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
index 55d68408951d..ddd0b6d74070 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -699,7 +699,8 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
 
-	ttm_resource_manager_init(man, adev->gmc.real_vram_size >> PAGE_SHIFT);
+	ttm_resource_manager_init(man, &adev->mman.bdev,
+				  adev->gmc.real_vram_size >> PAGE_SHIFT);
 
 	man->func = &amdgpu_vram_mgr_func;
 
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index ca3ca1f7f850..ef535e04a88a 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -203,7 +203,7 @@ int i915_ttm_buddy_man_init(struct ttm_device *bdev,
 	man = &bman->manager;
 	man->use_tt = use_tt;
 	man->func = &i915_ttm_buddy_manager_func;
-	ttm_resource_manager_init(man, bman->mm.size >> PAGE_SHIFT);
+	ttm_resource_manager_init(man, bdev, bman->mm.size >> PAGE_SHIFT);
 
 	ttm_resource_manager_set_used(man, true);
 	ttm_set_driver_manager(bdev, type, man);
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 91ef33f8f22c..85f1f5a0fe5d 100644
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
index 25fcf0d63c2d..062dabe6a10e 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -156,7 +156,7 @@ int ttm_range_man_init_nocheck(struct ttm_device *bdev,
 
 	man->func = &ttm_range_manager_func;
 
-	ttm_resource_manager_init(man, p_size);
+	ttm_resource_manager_init(man, bdev, p_size);
 
 	drm_mm_init(&rman->mm, 0, p_size);
 	spin_lock_init(&rman->lock);
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 89bcfe22a0ca..41e7bf195168 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -126,16 +126,19 @@ EXPORT_SYMBOL(ttm_resource_compat);
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
index df1f06b7b504..6bf37383002b 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -105,11 +105,11 @@ struct ttm_resource_manager_func {
  * @use_type: The memory type is enabled.
  * @use_tt: If a TT object should be used for the backing store.
  * @size: Size of the managed region.
+ * @bdev: ttm device this manager belongs to
  * @func: structure pointer implementing the range manager. See above
  * @move_lock: lock for move fence
- * static information. bdev::driver::io_mem_free is never used.
- * @lru: The lru list for this memory type.
  * @move: The fence of the last pipelined move operation.
+ * @lru: The lru list for this memory type.
  *
  * This structure is used to identify and manage memory types for a device.
  */
@@ -119,20 +119,21 @@ struct ttm_resource_manager {
 	 */
 	bool use_type;
 	bool use_tt;
+	struct ttm_device *bdev;
 	uint64_t size;
 	const struct ttm_resource_manager_func *func;
 	spinlock_t move_lock;
 
 	/*
-	 * Protected by the global->lru_lock.
+	 * Protected by @move_lock.
 	 */
-
-	struct list_head lru[TTM_MAX_BO_PRIORITY];
+	struct dma_fence *move;
 
 	/*
-	 * Protected by @move_lock.
+	 * Protected by the global->lru_lock.
 	 */
-	struct dma_fence *move;
+
+	struct list_head lru[TTM_MAX_BO_PRIORITY];
 };
 
 /**
@@ -272,6 +273,7 @@ bool ttm_resource_compat(struct ttm_resource *res,
 			 struct ttm_placement *placement);
 
 void ttm_resource_manager_init(struct ttm_resource_manager *man,
+			       struct ttm_device *bdev,
 			       unsigned long p_size);
 
 int ttm_resource_manager_evict_all(struct ttm_device *bdev,
-- 
2.25.1

