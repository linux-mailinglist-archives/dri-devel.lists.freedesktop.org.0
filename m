Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BB1680CF4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 13:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436E410E228;
	Mon, 30 Jan 2023 12:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7DE10E218;
 Mon, 30 Jan 2023 12:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675080432; x=1706616432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pLbEbTuQ7hqEcr6TdPo2XG/N7paBnTT2xqswALTRuF4=;
 b=dlMq8jpxmCvww1L7KImY1j3sqqljUfKl683kK93XPw68bSesMshBsiOV
 +brYMzthYKrid99qoiJZlyBiPa8AirJE41EycFuph/wkLa15FbbbNkf6Q
 QvsT+N6csBJYkq7CPrt+bCrAwdjff0RraRXsaNkM4c1dGDLzTlmZYxYxJ
 JmErf40tV3hxAoNM/F/E71cSZD2PGqxU1Ox1ns8QdtCfipilN5Kcchn3i
 D50OmDbV5VqCCaJZbljONQDvUA2TedbVM9n6ItYfVtzmnlc/VV87U3+sk
 pfpBuw9nJ9T9QKo/rueD8+62hKSdwaJrRz9olEmVjZppmF3Xzb3H0I8Sv g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="328816307"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="328816307"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 04:07:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="641521158"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="641521158"
Received: from dscheepe-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.1.159])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 04:07:10 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 6/6] drm/ttm: prevent moving of pinned BOs
Date: Mon, 30 Jan 2023 12:06:36 +0000
Message-Id: <20230130120636.63765-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130120636.63765-1-matthew.auld@intel.com>
References: <20230130120636.63765-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian König <christian.koenig@amd.com>

We have checks for this in the individual drivers move callback, but
it's probably better to generally forbid that on a higher level.

Also stops exporting ttm_resource_compat() since that's not necessary
any more after removing the extra checks in vmwgfx.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  4 ----
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  3 ---
 drivers/gpu/drm/radeon/radeon_ttm.c     |  4 ----
 drivers/gpu/drm/ttm/ttm_bo.c            | 20 ++++++++++++--------
 drivers/gpu/drm/ttm/ttm_resource.c      |  1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      | 19 ++-----------------
 6 files changed, 14 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index c5ef7f7bdc15..2cd081cbf706 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -466,11 +466,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 			return r;
 	}
 
-	/* Can't move a pinned BO */
 	abo = ttm_to_amdgpu_bo(bo);
-	if (WARN_ON_ONCE(abo->tbo.pin_count > 0))
-		return -EINVAL;
-
 	adev = amdgpu_ttm_adev(bo->bdev);
 
 	if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM &&
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 288eebc70a67..c2ec91cc845d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1015,9 +1015,6 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	if (ret)
 		goto out_ntfy;
 
-	if (nvbo->bo.pin_count)
-		NV_WARN(drm, "Moving pinned object %p!\n", nvbo);
-
 	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
 		ret = nouveau_bo_vm_bind(bo, new_reg, &new_tile);
 		if (ret)
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 1e8e287e113c..67075c85f847 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -211,11 +211,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	if (r)
 		return r;
 
-	/* Can't move a pinned BO */
 	rbo = container_of(bo, struct radeon_bo, tbo);
-	if (WARN_ON_ONCE(rbo->tbo.pin_count > 0))
-		return -EINVAL;
-
 	rdev = radeon_get_rdev(bo->bdev);
 	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
 		ttm_bo_move_null(bo, new_mem);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 169818b32be2..882c2fa346f3 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -893,14 +893,18 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	if (!placement->num_placement && !placement->num_busy_placement)
 		return ttm_bo_pipeline_gutting(bo);
 
-	/*
-	 * Check whether we need to move buffer.
-	 */
-	if (!bo->resource || !ttm_resource_compat(bo->resource, placement)) {
-		ret = ttm_bo_move_buffer(bo, placement, ctx);
-		if (ret)
-			return ret;
-	}
+	/* Check whether we need to move buffer. */
+	if (bo->resource && ttm_resource_compat(bo->resource, placement))
+		return 0;
+
+	/* Moving of pinned BOs is forbidden */
+	if (bo->pin_count)
+		return -EINVAL;
+
+	ret = ttm_bo_move_buffer(bo, placement, ctx);
+	if (ret)
+		return ret;
+
 	/*
 	 * We might need to add a TTM.
 	 */
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index b8a826a24fb2..7333f7a87a2f 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -361,7 +361,6 @@ bool ttm_resource_compat(struct ttm_resource *res,
 
 	return false;
 }
-EXPORT_SYMBOL(ttm_resource_compat);
 
 void ttm_resource_set_bo(struct ttm_resource *res,
 			 struct ttm_buffer_object *bo)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index aa1cd5126a32..9bf1f9d2f9b6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -87,12 +87,7 @@ int vmw_bo_pin_in_placement(struct vmw_private *dev_priv,
 	if (unlikely(ret != 0))
 		goto err;
 
-	if (buf->base.pin_count > 0)
-		ret = ttm_resource_compat(bo->resource, placement)
-			? 0 : -EINVAL;
-	else
-		ret = ttm_bo_validate(bo, placement, &ctx);
-
+	ret = ttm_bo_validate(bo, placement, &ctx);
 	if (!ret)
 		vmw_bo_pin_reserved(buf, true);
 
@@ -128,12 +123,6 @@ int vmw_bo_pin_in_vram_or_gmr(struct vmw_private *dev_priv,
 	if (unlikely(ret != 0))
 		goto err;
 
-	if (buf->base.pin_count > 0) {
-		ret = ttm_resource_compat(bo->resource, &vmw_vram_gmr_placement)
-			? 0 : -EINVAL;
-		goto out_unreserve;
-	}
-
 	ret = ttm_bo_validate(bo, &vmw_vram_gmr_placement, &ctx);
 	if (likely(ret == 0) || ret == -ERESTARTSYS)
 		goto out_unreserve;
@@ -218,11 +207,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
 		(void) ttm_bo_validate(bo, &vmw_sys_placement, &ctx);
 	}
 
-	if (buf->base.pin_count > 0)
-		ret = ttm_resource_compat(bo->resource, &placement)
-			? 0 : -EINVAL;
-	else
-		ret = ttm_bo_validate(bo, &placement, &ctx);
+	ret = ttm_bo_validate(bo, &placement, &ctx);
 
 	/* For some reason we didn't end up at the start of vram */
 	WARN_ON(ret == 0 && bo->resource->start != 0);
-- 
2.39.1

