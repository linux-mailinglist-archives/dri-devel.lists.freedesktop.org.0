Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3850469AB4B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 13:22:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9502B10EF9B;
	Fri, 17 Feb 2023 12:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B865310EF8F;
 Fri, 17 Feb 2023 12:22:28 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id l11so4064207edb.11;
 Fri, 17 Feb 2023 04:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VJcYwsYAXbDZie3h/U5uPdvDTCfa7cGCraXZW9wLkas=;
 b=hUCg0aPmbyv/gk2E63rNx99Ln4o1Vj+2jbInxnnyt/IA2gcJRnQh2zkY/Amu14Ocg3
 zF4w25CWhBxbOn50jj8BJtXfXbd+Z+rx+OZ7OHcP4fz2Dm1LjKrcA9DF0KrjyARUNkZ0
 kMrwU7XHyOczrWc1/FzZk+yv/anqTNX6KRDdUHJeXGu+fSagl2KRzDbBmW5J88RZooll
 kP6DarVzdympRsIv03lQ7FqRPh01XjCvN1bAubxbg39Yf0zrKX48CFHK/HkJq3A6ABPy
 0cPwIOtkLY9tscNaSonG8q7JBcCZHIUls5X2ex50daIbL/OJbY4RC10cXpSDwiLvbPAM
 3LbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VJcYwsYAXbDZie3h/U5uPdvDTCfa7cGCraXZW9wLkas=;
 b=g03H8goZ7u/ApWqgCkkQLU0S6fGyAW0SgaArDJUzxa4GVudwiaDN0vbDEPmaN77zi2
 DEnLGDFQqDGmbOy/M9Wqapn6mR6V4wv2qnSIzl6JQ8b3+bv3Jz6zZ6aULVv7dhgV/JmU
 JazfCprbwduhZfUbboWsRzJEuv+FerjW9uXL0KXli9AAwcLMXfRe2tVp0nOZ13TyYSpG
 WFS5kJ3qdM5JThg8hEVuqlgr4n590xWHNlvgs9OxQjeXvJG+JNbsLleIYCajlPGYWTgH
 v0jGW/7OG2HjA0wNPEmHWnOw18+d+4g7d4Cz7x5CkMq8yYUa588817WqV7uU4ISn6eiB
 QpVQ==
X-Gm-Message-State: AO0yUKXotBQlfizXWUhffq4Fosthiqs0Bj8VeHL+D6gNNiTcLdRLqK/x
 bgEgVcqjiRL1EUoAQQnVUelYHgK6CuE=
X-Google-Smtp-Source: AK7set/xRgVDLhDM/NfJSpcbTUfe+EHoz/mphPMmkLr2MMO5soPB47tNHVQLk/iFxODzRR/IEW1s5A==
X-Received: by 2002:a17:906:aec9:b0:883:fe6b:814 with SMTP id
 me9-20020a170906aec900b00883fe6b0814mr8985071ejb.37.1676636547184; 
 Fri, 17 Feb 2023 04:22:27 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a50c38a000000b004ad75c5c0fdsm1373472edf.18.2023.02.17.04.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 04:22:26 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] drm/ttm: Change the parameters of ttm_range_man_init()
 from pages to bytes
Date: Fri, 17 Feb 2023 13:22:19 +0100
Message-Id: <20230217122224.29243-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230217122224.29243-1-christian.koenig@amd.com>
References: <20230217122224.29243-1-christian.koenig@amd.com>
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

