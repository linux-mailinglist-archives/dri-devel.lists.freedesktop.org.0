Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B843BF941
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 13:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF5D6E8B1;
	Thu,  8 Jul 2021 11:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECD76E8B3
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 11:42:32 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so3275791wmi.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 04:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gp+6hcdG/tFCZ5+G1fPwdiPeMHwPT8RgQobewYL5A8I=;
 b=JUuFUQ6GvNMIqhVazlI3mdk1hk03aXxo40h2w8bEqRgSUuKzyzvNk9+XGXDM5oluCm
 uGtJkMvMNyCNkDJwSppWKtyNd3rkSKlhlp7O5N3f1ivP5yVfNP7daJVthQgwMoLsyFAB
 V1RRtFMAGTAPizMbAM+oyEyR1lO0MFIXz7+Pb18jz4eWMrnW42kiYg2HQJakr0chVepw
 aZctpmGVZYDTUJHifwO08YY1OqnIy8A1GXwtF0lJQrlhpZNIvJ/NCGgrSiI0k0ofWnQZ
 OSRvRS188v6xlqGyOqGr3arttLkHReUXevYDu/m0G8W9bBsa+JQ1mRExL/oEkznLR954
 rYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gp+6hcdG/tFCZ5+G1fPwdiPeMHwPT8RgQobewYL5A8I=;
 b=AdUb8RykMl1UcUMMT3zRd6Ti3/tpW3nQcJrsPyUiVyT95B/5e6J2mR1b/MamfmZnog
 9akNluPPc70XHa2Wvq0xI4nXceQn2Z+f6dRBRTteVi3lPY0wf9mxwRAQvS2ecPTQXVHz
 Yj65W555F4DzxtninNnUtIG0wIJZL735/MoY0TyZBpPn9bwpPqq0Iaj3bIL7+XPjn2mc
 XwXEBj5+4dUvxZvmKK+cRCIPUVVLM6MWrZqOE6+Y3IgR8kyOLbhGwOQTo8o30rK3LqFy
 Hw00QNp5nf6iS7MYVLcMd+duQ8VDM16yg7JewQdTbLX6y+8A6SjpMuBEjt61jJd4ZkUn
 s9BQ==
X-Gm-Message-State: AOAM532U1wi6L1994SsBl06Id17y9Dmbq3XGFipwwDN4mg9sLu3+VZIg
 5gPEIznnUUgB0aITU/RConiLEvyK4HQ=
X-Google-Smtp-Source: ABdhPJzaZxwhrepbW9u6t7Y7NBWKtHsEB7J51/ef0MGgjCUv3HEywJQy4Lblj/FoZA2aNjzpLYUsdw==
X-Received: by 2002:a1c:38c7:: with SMTP id f190mr32849673wma.30.1625744550923; 
 Thu, 08 Jul 2021 04:42:30 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:88a0:1bd:c5e1:444e])
 by smtp.gmail.com with ESMTPSA id l4sm1717779wme.26.2021.07.08.04.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 04:42:30 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	roberto.sassu@huawei.com
Subject: [PATCH] drm/radeon: Fix NULL dereference when updating memory stats
Date: Thu,  8 Jul 2021 13:42:29 +0200
Message-Id: <20210708114229.7535-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

From: Mikel Rychliski <mikel@mikelr.com>

radeon_ttm_bo_destroy() is attempting to access the resource object to
update memory counters. However, the resource object is already freed when
ttm calls this function via the destroy callback. This causes an oops when
a bo is freed:

	BUG: kernel NULL pointer dereference, address: 0000000000000010
	RIP: 0010:radeon_ttm_bo_destroy+0x2c/0x100 [radeon]
	Call Trace:
	 radeon_bo_unref+0x1a/0x30 [radeon]
	 radeon_gem_object_free+0x33/0x50 [radeon]
	 drm_gem_object_release_handle+0x69/0x70 [drm]
	 drm_gem_handle_delete+0x62/0xa0 [drm]
	 ? drm_mode_destroy_dumb+0x40/0x40 [drm]
	 drm_ioctl_kernel+0xb2/0xf0 [drm]
	 drm_ioctl+0x30a/0x3c0 [drm]
	 ? drm_mode_destroy_dumb+0x40/0x40 [drm]
	 radeon_drm_ioctl+0x49/0x80 [radeon]
	 __x64_sys_ioctl+0x8e/0xd0

Avoid the issue by updating the counters in the delete_mem_notify callback
instead. Also, fix memory statistic updating in radeon_bo_move() to
identify the source type correctly. The source type needs to be saved
before the move, because the moved from object may be altered by the move.

Fixes: bfa3357ef9ab ("drm/ttm: allocate resource object instead of embedding it v2")
Signed-off-by: Mikel Rychliski <mikel@mikelr.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210624045121.15643-1-mikel@mikelr.com
---
 drivers/gpu/drm/radeon/radeon_object.c | 29 +++++++++++---------------
 drivers/gpu/drm/radeon/radeon_object.h |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c    | 13 +++++++++---
 3 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index bfaaa3c969a3..56ede9d63b12 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -49,23 +49,23 @@ static void radeon_bo_clear_surface_reg(struct radeon_bo *bo);
  * function are calling it.
  */
 
-static void radeon_update_memory_usage(struct radeon_bo *bo,
-				       unsigned mem_type, int sign)
+static void radeon_update_memory_usage(struct ttm_buffer_object *bo,
+				       unsigned int mem_type, int sign)
 {
-	struct radeon_device *rdev = bo->rdev;
+	struct radeon_device *rdev = radeon_get_rdev(bo->bdev);
 
 	switch (mem_type) {
 	case TTM_PL_TT:
 		if (sign > 0)
-			atomic64_add(bo->tbo.base.size, &rdev->gtt_usage);
+			atomic64_add(bo->base.size, &rdev->gtt_usage);
 		else
-			atomic64_sub(bo->tbo.base.size, &rdev->gtt_usage);
+			atomic64_sub(bo->base.size, &rdev->gtt_usage);
 		break;
 	case TTM_PL_VRAM:
 		if (sign > 0)
-			atomic64_add(bo->tbo.base.size, &rdev->vram_usage);
+			atomic64_add(bo->base.size, &rdev->vram_usage);
 		else
-			atomic64_sub(bo->tbo.base.size, &rdev->vram_usage);
+			atomic64_sub(bo->base.size, &rdev->vram_usage);
 		break;
 	}
 }
@@ -76,8 +76,6 @@ static void radeon_ttm_bo_destroy(struct ttm_buffer_object *tbo)
 
 	bo = container_of(tbo, struct radeon_bo, tbo);
 
-	radeon_update_memory_usage(bo, bo->tbo.resource->mem_type, -1);
-
 	mutex_lock(&bo->rdev->gem.mutex);
 	list_del_init(&bo->list);
 	mutex_unlock(&bo->rdev->gem.mutex);
@@ -727,24 +725,21 @@ int radeon_bo_check_tiling(struct radeon_bo *bo, bool has_moved,
 }
 
 void radeon_bo_move_notify(struct ttm_buffer_object *bo,
-			   bool evict,
+			   unsigned int old_type,
 			   struct ttm_resource *new_mem)
 {
 	struct radeon_bo *rbo;
 
+	radeon_update_memory_usage(bo, old_type, -1);
+	if (new_mem)
+		radeon_update_memory_usage(bo, new_mem->mem_type, 1);
+
 	if (!radeon_ttm_bo_is_radeon_bo(bo))
 		return;
 
 	rbo = container_of(bo, struct radeon_bo, tbo);
 	radeon_bo_check_tiling(rbo, 0, 1);
 	radeon_vm_bo_invalidate(rbo->rdev, rbo);
-
-	/* update statistics */
-	if (!new_mem)
-		return;
-
-	radeon_update_memory_usage(rbo, bo->resource->mem_type, -1);
-	radeon_update_memory_usage(rbo, new_mem->mem_type, 1);
 }
 
 vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
index 1739c6a142cd..1afc7992ef91 100644
--- a/drivers/gpu/drm/radeon/radeon_object.h
+++ b/drivers/gpu/drm/radeon/radeon_object.h
@@ -161,7 +161,7 @@ extern void radeon_bo_get_tiling_flags(struct radeon_bo *bo,
 extern int radeon_bo_check_tiling(struct radeon_bo *bo, bool has_moved,
 				bool force_drop);
 extern void radeon_bo_move_notify(struct ttm_buffer_object *bo,
-				  bool evict,
+				  unsigned int old_type,
 				  struct ttm_resource *new_mem);
 extern vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo);
 extern int radeon_bo_get_surface_reg(struct radeon_bo *bo);
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index ad2a5a791bba..a06d4cc2fb1c 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -199,7 +199,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct ttm_resource *old_mem = bo->resource;
 	struct radeon_device *rdev;
 	struct radeon_bo *rbo;
-	int r;
+	int r, old_type;
 
 	if (new_mem->mem_type == TTM_PL_TT) {
 		r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, new_mem);
@@ -216,6 +216,9 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	if (WARN_ON_ONCE(rbo->tbo.pin_count > 0))
 		return -EINVAL;
 
+	/* Save old type for statistics update */
+	old_type = old_mem->mem_type;
+
 	rdev = radeon_get_rdev(bo->bdev);
 	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
 		ttm_bo_move_null(bo, new_mem);
@@ -261,7 +264,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 out:
 	/* update statistics */
 	atomic64_add(bo->base.size, &rdev->num_bytes_moved);
-	radeon_bo_move_notify(bo, evict, new_mem);
+	radeon_bo_move_notify(bo, old_type, new_mem);
 	return 0;
 }
 
@@ -682,7 +685,11 @@ bool radeon_ttm_tt_is_readonly(struct radeon_device *rdev,
 static void
 radeon_bo_delete_mem_notify(struct ttm_buffer_object *bo)
 {
-	radeon_bo_move_notify(bo, false, NULL);
+	unsigned int old_type = TTM_PL_SYSTEM;
+
+	if (bo->resource)
+		old_type = bo->resource->mem_type;
+	radeon_bo_move_notify(bo, old_type, NULL);
 }
 
 static struct ttm_device_funcs radeon_bo_driver = {
-- 
2.25.1

