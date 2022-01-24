Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 990C9497F63
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 13:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0734610EA87;
	Mon, 24 Jan 2022 12:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4F510E8BC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 12:25:23 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id k18so13244043wrg.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 04:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ypeiZpV86bu1C1eyehMZYIostfkHLRM2UAhnnAFqCmI=;
 b=EkPOdEFEZf0j1qkBs5iBbOBUW46ulxjGaBLHcxCvJ7AKIhbeRPHAcGwirQOzI+LBhs
 x1RnRNiG3yQB9NrtNbB6Ot4GiT2Af1EBjBUNuHlExX4AnyAsTu6VG055kHDrxCmjF9nC
 9CnVADFP8IV5lK+dSbvJyfnnugkrHC+2n3XJS4eEtAOHm00xR4EkFfaaR9SPZEaXbedv
 vjA7qAqm5sfW6ujEa+Ei8NZYKdoUQ1bxeHzahk9wq/hNtp+vQh7R9VUNuP+U7jwDEUO0
 kTXWVLVfqHbXtxL/NtHl/i3xL+p3kpHOd5zjZDD5V2JERdqSlUmR5ELv4+34MoUcVIPd
 6byQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ypeiZpV86bu1C1eyehMZYIostfkHLRM2UAhnnAFqCmI=;
 b=cOkEa/0+3dudZSm8ePYKcchHVa6F7n627hI4+RnvHfMCjJtC0RAOndMlAPyb52D/ON
 4cUqn6TYCUH8tmwWsDKPL5Xl1P/O0OogMBJdlWqiigk6WgdHYLu7jLOq/qLTJ2W4gZqb
 gm7BOXCVzsc9lXdwi1x4OccQhpcsA4Q9sGlj+HADsLQ414LDWzijeQ3QTaw15BEaVaM+
 mALIz/x1WNaEYCiHtRaw3Y5VH2N71kslOwc4xfs95ePULIl56QNQnkDXUWljKpcssv5s
 mACQg3EGpeuTWW1Nq6aLlCLM+ASqDBccQ0c17urkVe+7saJWY8mQ0AG/h60izUkx5LEr
 UL0Q==
X-Gm-Message-State: AOAM5328/vDkz8rDicPxapg2gLoOWHW5hhc3I/TjGeZd5AzCViu6eUVI
 h2wShWNgLjBrI5y/dfUOdTZA7pmHE9Q=
X-Google-Smtp-Source: ABdhPJwfO+nJmIVuz18434aXfdFq8pIwE6CvAC8E1xCpN77kthuX9KY9ogeRHeuM6myB3r5y54XA/w==
X-Received: by 2002:a05:6000:15c9:: with SMTP id
 y9mr9801179wry.121.1643027121914; 
 Mon, 24 Jan 2022 04:25:21 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id 1sm12830516wmo.37.2022.01.24.04.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 04:25:21 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ray.huang@amd.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, bas@basnieuwenhuizen.nl
Subject: [PATCH 07/12] drm/radeon: remove resource accounting
Date: Mon, 24 Jan 2022 13:25:09 +0100
Message-Id: <20220124122514.1832-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124122514.1832-1-christian.koenig@amd.com>
References: <20220124122514.1832-1-christian.koenig@amd.com>
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

Use the one provided by TTM instead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon.h        |  2 --
 drivers/gpu/drm/radeon/radeon_kms.c    |  7 ++++--
 drivers/gpu/drm/radeon/radeon_object.c | 30 +++-----------------------
 drivers/gpu/drm/radeon/radeon_object.h |  1 -
 drivers/gpu/drm/radeon/radeon_ttm.c    | 18 ++--------------
 5 files changed, 10 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 895776c421d4..08f83bf2c330 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -2462,8 +2462,6 @@ struct radeon_device {
 	struct radeon_vm_manager	vm_manager;
 	struct mutex			gpu_clock_mutex;
 	/* memory stats */
-	atomic64_t			vram_usage;
-	atomic64_t			gtt_usage;
 	atomic64_t			num_bytes_moved;
 	atomic_t			gpu_reset_counter;
 	/* ACPI interface */
diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index 7afe28408085..3a9226d0cb05 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -241,6 +241,7 @@ int radeon_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	struct drm_radeon_info *info = data;
 	struct radeon_mode_info *minfo = &rdev->mode_info;
 	uint32_t *value, value_tmp, *value_ptr, value_size;
+	struct ttm_resource_manager *man;
 	uint64_t value64;
 	struct drm_crtc *crtc;
 	int i, found;
@@ -550,12 +551,14 @@ int radeon_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	case RADEON_INFO_VRAM_USAGE:
 		value = (uint32_t*)&value64;
 		value_size = sizeof(uint64_t);
-		value64 = atomic64_read(&rdev->vram_usage);
+		man = ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM);
+		value64 = ttm_resource_manager_usage(man);
 		break;
 	case RADEON_INFO_GTT_USAGE:
 		value = (uint32_t*)&value64;
 		value_size = sizeof(uint64_t);
-		value64 = atomic64_read(&rdev->gtt_usage);
+		man = ttm_manager_type(&rdev->mman.bdev, TTM_PL_TT);
+		value64 = ttm_resource_manager_usage(man);
 		break;
 	case RADEON_INFO_ACTIVE_CU_COUNT:
 		if (rdev->family >= CHIP_BONAIRE)
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 56ede9d63b12..c9bbed2a25ad 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -49,27 +49,6 @@ static void radeon_bo_clear_surface_reg(struct radeon_bo *bo);
  * function are calling it.
  */
 
-static void radeon_update_memory_usage(struct ttm_buffer_object *bo,
-				       unsigned int mem_type, int sign)
-{
-	struct radeon_device *rdev = radeon_get_rdev(bo->bdev);
-
-	switch (mem_type) {
-	case TTM_PL_TT:
-		if (sign > 0)
-			atomic64_add(bo->base.size, &rdev->gtt_usage);
-		else
-			atomic64_sub(bo->base.size, &rdev->gtt_usage);
-		break;
-	case TTM_PL_VRAM:
-		if (sign > 0)
-			atomic64_add(bo->base.size, &rdev->vram_usage);
-		else
-			atomic64_sub(bo->base.size, &rdev->vram_usage);
-		break;
-	}
-}
-
 static void radeon_ttm_bo_destroy(struct ttm_buffer_object *tbo)
 {
 	struct radeon_bo *bo;
@@ -434,7 +413,9 @@ void radeon_bo_fini(struct radeon_device *rdev)
 static u64 radeon_bo_get_threshold_for_moves(struct radeon_device *rdev)
 {
 	u64 real_vram_size = rdev->mc.real_vram_size;
-	u64 vram_usage = atomic64_read(&rdev->vram_usage);
+	struct ttm_resource_manager *man =
+		ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM);
+	u64 vram_usage = ttm_resource_manager_usage(man);
 
 	/* This function is based on the current VRAM usage.
 	 *
@@ -725,15 +706,10 @@ int radeon_bo_check_tiling(struct radeon_bo *bo, bool has_moved,
 }
 
 void radeon_bo_move_notify(struct ttm_buffer_object *bo,
-			   unsigned int old_type,
 			   struct ttm_resource *new_mem)
 {
 	struct radeon_bo *rbo;
 
-	radeon_update_memory_usage(bo, old_type, -1);
-	if (new_mem)
-		radeon_update_memory_usage(bo, new_mem->mem_type, 1);
-
 	if (!radeon_ttm_bo_is_radeon_bo(bo))
 		return;
 
diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
index 1afc7992ef91..0b64e202577b 100644
--- a/drivers/gpu/drm/radeon/radeon_object.h
+++ b/drivers/gpu/drm/radeon/radeon_object.h
@@ -161,7 +161,6 @@ extern void radeon_bo_get_tiling_flags(struct radeon_bo *bo,
 extern int radeon_bo_check_tiling(struct radeon_bo *bo, bool has_moved,
 				bool force_drop);
 extern void radeon_bo_move_notify(struct ttm_buffer_object *bo,
-				  unsigned int old_type,
 				  struct ttm_resource *new_mem);
 extern vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo);
 extern int radeon_bo_get_surface_reg(struct radeon_bo *bo);
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 0d1283cdc8fb..ae09a91a486a 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -199,7 +199,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct ttm_resource *old_mem = bo->resource;
 	struct radeon_device *rdev;
 	struct radeon_bo *rbo;
-	int r, old_type;
+	int r;
 
 	if (new_mem->mem_type == TTM_PL_TT) {
 		r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, new_mem);
@@ -216,9 +216,6 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	if (WARN_ON_ONCE(rbo->tbo.pin_count > 0))
 		return -EINVAL;
 
-	/* Save old type for statistics update */
-	old_type = old_mem->mem_type;
-
 	rdev = radeon_get_rdev(bo->bdev);
 	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
 		ttm_bo_move_null(bo, new_mem);
@@ -264,7 +261,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 out:
 	/* update statistics */
 	atomic64_add(bo->base.size, &rdev->num_bytes_moved);
-	radeon_bo_move_notify(bo, old_type, new_mem);
+	radeon_bo_move_notify(bo, new_mem);
 	return 0;
 }
 
@@ -679,16 +676,6 @@ bool radeon_ttm_tt_is_readonly(struct radeon_device *rdev,
 	return !!(gtt->userflags & RADEON_GEM_USERPTR_READONLY);
 }
 
-static void
-radeon_bo_delete_mem_notify(struct ttm_buffer_object *bo)
-{
-	unsigned int old_type = TTM_PL_SYSTEM;
-
-	if (bo->resource)
-		old_type = bo->resource->mem_type;
-	radeon_bo_move_notify(bo, old_type, NULL);
-}
-
 static struct ttm_device_funcs radeon_bo_driver = {
 	.ttm_tt_create = &radeon_ttm_tt_create,
 	.ttm_tt_populate = &radeon_ttm_tt_populate,
@@ -697,7 +684,6 @@ static struct ttm_device_funcs radeon_bo_driver = {
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = &radeon_evict_flags,
 	.move = &radeon_bo_move,
-	.delete_mem_notify = &radeon_bo_delete_mem_notify,
 	.io_mem_reserve = &radeon_ttm_io_mem_reserve,
 };
 
-- 
2.25.1

