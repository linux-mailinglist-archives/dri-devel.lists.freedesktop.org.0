Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16966695AC4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 08:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14E110E7FB;
	Tue, 14 Feb 2023 07:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893DE10E7EE;
 Tue, 14 Feb 2023 07:42:44 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id k3so7034015wrv.5;
 Mon, 13 Feb 2023 23:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VJcYwsYAXbDZie3h/U5uPdvDTCfa7cGCraXZW9wLkas=;
 b=QkjW7ocNAXD4a1SlnGCn6j3l0LFfMrXU8ACts9gV39M2YfTBYl5AZeSiGabgsavK9l
 Ica6uq59VLs+29CZrYW3Afi806D/CgomcYXxEyqpeODqOsNCHhE2gUeTTAuMa7CsaDs4
 gAbXdxhvCOO7tMbWlakfixBhHmUt6994TpAhLL++WAFiKKgNdfac8dCm0Xbp4nGx7emI
 I+8ihJ4VawQx4qmvR3MFZ7g0JY3zOH869tc7aCpSDJzjoAHZAsWVV6FWX59PDIa+xvWn
 OOi2lL9GDXVwTS8N1W60+E0Qo85XOwHJlqARBWOag+UkUNT4TCCIqb8GuBBFkPQigTTp
 dpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VJcYwsYAXbDZie3h/U5uPdvDTCfa7cGCraXZW9wLkas=;
 b=34dU3dgcD3D9lasypC3oOeEn7eYdd5Hx/qsrgxZ4TKVsM2a3sT18nJqBkAQ9iTEykO
 B6q+Z65GnlamiEd2IMy7MpHI5lTMGZMDW3wSvwwwZjJ96Cx/WmwZCeleFZPM0JXcNAEb
 9+JNUvtBzl110sBf7oHFBmDDUw3TFEwRwH2u0nzsU9tiQz6f20jxTd2celeyyksO/oHV
 m4GliGyFKpwg4anQi1psEiXXggVppen5AFq8gSRqrtqZmrqS3yFmplPhI0jyNidF6cF9
 5kbPgLLRZw3IqwVmWqHTLQ13w/ZsZZFElVvJxP31C9LfVjz0ldI/Q/6W5u6pcJwse1WL
 HaTA==
X-Gm-Message-State: AO0yUKXZuTmu97GzLFe6/QhysLj8OInRAgb63rYHwe0XrPQ3UKigKckI
 zqOiLpOG827QpOSHlmJFJa+TgdERkRs=
X-Google-Smtp-Source: AK7set9FHucIM88s+DLeGFDtSQnMRBnQFDglmTapyX0bo7H0FzIL8K1gVBii7MGgLLgMjEg/UV0cOw==
X-Received: by 2002:adf:de8d:0:b0:2c5:588f:84a0 with SMTP id
 w13-20020adfde8d000000b002c5588f84a0mr1251931wrl.3.1676360563022; 
 Mon, 13 Feb 2023 23:42:43 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a5d65ce000000b002c561805a4csm1679855wrw.45.2023.02.13.23.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 23:42:42 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/ttm: Change the parameters of ttm_range_man_init()
 from pages to bytes
Date: Tue, 14 Feb 2023 08:42:37 +0100
Message-Id: <20230214074238.65865-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214074238.65865-1-christian.koenig@amd.com>
References: <20230214074238.65865-1-christian.koenig@amd.com>
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
Cc: Amaranath.Somalapuram@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>

Change the parameters of ttm_range_man_init_nocheck()
size from page size to byte size.
Cleanup the PAGE_SHIFT operation on the depended caller functions.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 ++--
 drivers/gpu/drm/drm_gem_vram_helper.c   | 2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c     | 4 ++--
 drivers/gpu/drm/ttm/ttm_range_manager.c | 8 ++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     | 2 +-
 include/drm/ttm/ttm_range_manager.h     | 6 +++---
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index f62e5398e620..77c2da886f5b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -75,10 +75,10 @@ static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
 
 static int amdgpu_ttm_init_on_chip(struct amdgpu_device *adev,
 				    unsigned int type,
-				    uint64_t size_in_page)
+				    uint64_t size)
 {
 	return ttm_range_man_init(&adev->mman.bdev, type,
-				  false, size_in_page);
+				  false, size << PAGE_SHIFT);
 }
 
 /**
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index d40b3edb52d0..f70d11e1cd47 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -999,7 +999,7 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
 		return ret;
 
 	ret = ttm_range_man_init(&vmm->bdev, TTM_PL_VRAM,
-				 false, vram_size >> PAGE_SHIFT);
+				 false, vram_size);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 67075c85f847..78dd6a87fb65 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -70,13 +70,13 @@ struct radeon_device *radeon_get_rdev(struct ttm_device *bdev)
 static int radeon_ttm_init_vram(struct radeon_device *rdev)
 {
 	return ttm_range_man_init(&rdev->mman.bdev, TTM_PL_VRAM,
-				  false, rdev->mc.real_vram_size >> PAGE_SHIFT);
+				  false, rdev->mc.real_vram_size);
 }
 
 static int radeon_ttm_init_gtt(struct radeon_device *rdev)
 {
 	return ttm_range_man_init(&rdev->mman.bdev, TTM_PL_TT,
-				  true, rdev->mc.gtt_size >> PAGE_SHIFT);
+				  true, rdev->mc.gtt_size);
 }
 
 static void radeon_evict_flags(struct ttm_buffer_object *bo,
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index ae11d07eb63a..62fddcc59f02 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -169,7 +169,7 @@ static const struct ttm_resource_manager_func ttm_range_manager_func = {
  * @bdev: ttm device
  * @type: memory manager type
  * @use_tt: if the memory manager uses tt
- * @p_size: size of area to be managed in pages.
+ * @size: size of area to be managed in bytes.
  *
  * The range manager is installed for this device in the type slot.
  *
@@ -177,7 +177,7 @@ static const struct ttm_resource_manager_func ttm_range_manager_func = {
  */
 int ttm_range_man_init_nocheck(struct ttm_device *bdev,
 		       unsigned type, bool use_tt,
-		       unsigned long p_size)
+		       u64 size)
 {
 	struct ttm_resource_manager *man;
 	struct ttm_range_manager *rman;
@@ -191,9 +191,9 @@ int ttm_range_man_init_nocheck(struct ttm_device *bdev,
 
 	man->func = &ttm_range_manager_func;
 
-	ttm_resource_manager_init(man, bdev, p_size);
+	ttm_resource_manager_init(man, bdev, size);
 
-	drm_mm_init(&rman->mm, 0, p_size);
+	drm_mm_init(&rman->mm, 0, size);
 	spin_lock_init(&rman->lock);
 
 	ttm_set_driver_manager(bdev, type, &rman->manager);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 2588615a2a38..18cf4edea197 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -706,7 +706,7 @@ static int vmw_vram_manager_init(struct vmw_private *dev_priv)
 {
 	int ret;
 	ret = ttm_range_man_init(&dev_priv->bdev, TTM_PL_VRAM, false,
-				 dev_priv->vram_size >> PAGE_SHIFT);
+				 dev_priv->vram_size);
 	ttm_resource_manager_set_used(ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM), false);
 	return ret;
 }
diff --git a/include/drm/ttm/ttm_range_manager.h b/include/drm/ttm/ttm_range_manager.h
index 7963b957e9ef..05bffded1b53 100644
--- a/include/drm/ttm/ttm_range_manager.h
+++ b/include/drm/ttm/ttm_range_manager.h
@@ -36,15 +36,15 @@ to_ttm_range_mgr_node(struct ttm_resource *res)
 
 int ttm_range_man_init_nocheck(struct ttm_device *bdev,
 		       unsigned type, bool use_tt,
-		       unsigned long p_size);
+		       u64 size);
 int ttm_range_man_fini_nocheck(struct ttm_device *bdev,
 		       unsigned type);
 static __always_inline int ttm_range_man_init(struct ttm_device *bdev,
 		       unsigned int type, bool use_tt,
-		       unsigned long p_size)
+		       u64 size)
 {
 	BUILD_BUG_ON(__builtin_constant_p(type) && type >= TTM_NUM_MEM_TYPES);
-	return ttm_range_man_init_nocheck(bdev, type, use_tt, p_size);
+	return ttm_range_man_init_nocheck(bdev, type, use_tt, size);
 }
 
 static __always_inline int ttm_range_man_fini(struct ttm_device *bdev,
-- 
2.34.1

