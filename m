Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A66680CF5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 13:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E91D10E229;
	Mon, 30 Jan 2023 12:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E63A10E217;
 Mon, 30 Jan 2023 12:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675080430; x=1706616430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OwK3D4DZ3f/ShgdvaZbVYusJxtLvjgeoP4IOPJTIuos=;
 b=C20cEIJ+ZS8ukPlUgxTTt4l14p85Txppz5D++ZNBBGa33ytlaAJ5ZimK
 7WPOolxIt5OuxcB7Ua41/DG5KLTAWfTPqW8/EZDRNJ1CmmesjKQnc5Ytw
 kCM3KVwzMVKzfqLlEJK/cVgzgXjCR3BWKNc6SFbX6/WIli4g2n2IYDB5n
 09ks0Vyej22SjkTCT8tjbNXBpWU1nRVN0Hmo6tQAA9EArGreUdktPcGEN
 jcZcYM5+1PP71kQ/SNKWYiVLjwbQfJXQ/ZSLlMl1wPihl7N6YnZkZ+cwN
 CfhHZnYrZgEP7oRXLU2THJGwQJVpsAJF7EuFunMo7FwIQm9UsDtixRqcL Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="328816287"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="328816287"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 04:07:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="641521118"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="641521118"
Received: from dscheepe-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.1.159])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 04:07:04 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/6] drm/i915/ttm: audit remaining bo->resource
Date: Mon, 30 Jan 2023 12:06:32 +0000
Message-Id: <20230130120636.63765-2-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the near future TTM will have NULL bo->resource when the object is
initially created, plus after calling into pipeline-gutting. Try to
handle the remaining cases. In practice NULL bo->resource should be
taken to mean swapped-out or purged object.

v2 (Andrzej):
  - Rather make i915_ttm_cpu_maps_iomem() return false with NULL
    resource.

References: 516198d317d8 ("drm/i915: audit bo->resource usage v3")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 10 ++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h      |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c |  4 ++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c   |  7 +++++--
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 4758f21c91e1..341b94672abc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -472,7 +472,7 @@ static int i915_ttm_shrink(struct drm_i915_gem_object *obj, unsigned int flags)
 	struct ttm_placement place = {};
 	int ret;
 
-	if (!bo->ttm || bo->resource->mem_type != TTM_PL_SYSTEM)
+	if (!bo->ttm || i915_ttm_cpu_maps_iomem(bo->resource))
 		return 0;
 
 	GEM_BUG_ON(!i915_tt->is_shmem);
@@ -511,7 +511,13 @@ static void i915_ttm_delete_mem_notify(struct ttm_buffer_object *bo)
 {
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 
-	if (bo->resource && !i915_ttm_is_ghost_object(bo)) {
+	/*
+	 * This gets called twice by ttm, so long as we have a ttm resource or
+	 * ttm_tt then we can still safely call this. Due to pipeline-gutting,
+	 * we maybe have NULL bo->resource, but in that case we should always
+	 * have a ttm alive (like if the pages are swapped out).
+	 */
+	if ((bo->resource || bo->ttm) && !i915_ttm_is_ghost_object(bo)) {
 		__i915_gem_object_pages_fini(obj);
 		i915_ttm_free_cached_io_rsgt(obj);
 	}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
index 2a94a99ef76b..f8f6bed1b297 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
@@ -98,7 +98,7 @@ static inline bool i915_ttm_gtt_binds_lmem(struct ttm_resource *mem)
 static inline bool i915_ttm_cpu_maps_iomem(struct ttm_resource *mem)
 {
 	/* Once / if we support GGTT, this is also false for cached ttm_tts */
-	return mem->mem_type != I915_PL_SYSTEM;
+	return mem && mem->mem_type != I915_PL_SYSTEM;
 }
 
 bool i915_ttm_resource_mappable(struct ttm_resource *res);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 76dd9e5e1a8b..d030182ca176 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -711,6 +711,10 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
 
 	assert_object_held(dst);
 	assert_object_held(src);
+
+	if (GEM_WARN_ON(!src_bo->resource || !dst_bo->resource))
+		return -EINVAL;
+
 	i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
 
 	ret = dma_resv_reserve_fences(src_bo->base.resv, 1);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
index 7e67742bc65e..dfe39c8e74d8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
@@ -53,7 +53,7 @@ static int i915_ttm_backup(struct i915_gem_apply_to_region *apply,
 	unsigned int flags;
 	int err = 0;
 
-	if (bo->resource->mem_type == I915_PL_SYSTEM || obj->ttm.backup)
+	if (!i915_ttm_cpu_maps_iomem(bo->resource) || obj->ttm.backup)
 		return 0;
 
 	if (pm_apply->allow_gpu && i915_gem_object_evictable(obj))
@@ -187,7 +187,10 @@ static int i915_ttm_restore(struct i915_gem_apply_to_region *apply,
 		return err;
 
 	/* Content may have been swapped. */
-	err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);
+	if (!backup_bo->resource)
+		err = ttm_bo_validate(backup_bo, i915_ttm_sys_placement(), &ctx);
+	if (!err)
+		err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);
 	if (!err) {
 		err = i915_gem_obj_copy_ttm(obj, backup, pm_apply->allow_gpu,
 					    false);
-- 
2.39.1

