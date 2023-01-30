Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F283D680A9D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 11:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC79710E1E7;
	Mon, 30 Jan 2023 10:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8F210E0DA;
 Mon, 30 Jan 2023 10:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675073872; x=1706609872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oaX4uUHuqSO7za7eJrTcAk/Kkl3+rHdUxLZjodpBgnk=;
 b=M5R5dd272k0UzpJSlMRHvLBcp/Jb5xetTXDLX08rQje4iC90WvQOhB5N
 PApNU3zOrVv32J039ZeKxblY5iM7qahYDzDjUTLq9rCSRQNLURyzQOh0v
 aWJAl7VSil8UQEI7LijM85GM/T8cf0yXqNR7XK3SsEmsTI6ijF5k8bgYq
 CIVPocedacTST/OL87Lr7xEiTaHsHtlo5vSm27rjmnDCul+yGcTgw4nEB
 Of4/EFpmpxDFAKEh2AFAWtk+x919fLMrPMtWEIzaerkP3kW2RaFzDBcWQ
 hhTAFzX5YYsonMTPa3e5YWQ0E9rcuArhc8++ZIWBFmeSGTugQ7FZFDMu1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="328798965"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="328798965"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 02:17:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="696350131"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="696350131"
Received: from dscheepe-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.1.159])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 02:14:16 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/i915/ttm: audit remaining bo->resource
Date: Mon, 30 Jan 2023 10:12:26 +0000
Message-Id: <20230130101230.25347-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130101230.25347-1-matthew.auld@intel.com>
References: <20230130101230.25347-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the near future TTM will have NULL bo->resource when the object is
initially created, plus after calling into pipeline-gutting. Try to
handle the remaining cases. In practice NULL bo->resource should be
taken to mean swapped-out or purged object.

References: 516198d317d8 ("drm/i915: audit bo->resource usage v3")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 12 +++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c |  7 ++++++-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c   |  7 +++++--
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 4758f21c91e1..4ba1d7862ff9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -472,7 +472,7 @@ static int i915_ttm_shrink(struct drm_i915_gem_object *obj, unsigned int flags)
 	struct ttm_placement place = {};
 	int ret;
 
-	if (!bo->ttm || bo->resource->mem_type != TTM_PL_SYSTEM)
+	if (!bo->ttm || (bo->resource && bo->resource->mem_type != TTM_PL_SYSTEM))
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
@@ -1198,7 +1204,7 @@ static void i915_ttm_unmap_virtual(struct drm_i915_gem_object *obj)
 
 	assert_object_held_shared(obj);
 
-	if (i915_ttm_cpu_maps_iomem(bo->resource)) {
+	if (bo->resource && i915_ttm_cpu_maps_iomem(bo->resource)) {
 		wakeref = intel_runtime_pm_get(&to_i915(obj->base.dev)->runtime_pm);
 
 		/* userfault_count is protected by obj lock and rpm wakeref. */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 76dd9e5e1a8b..72953ebadfd8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -83,7 +83,8 @@ void i915_ttm_adjust_domains_after_move(struct drm_i915_gem_object *obj)
 {
 	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
 
-	if (i915_ttm_cpu_maps_iomem(bo->resource) || bo->ttm->caching != ttm_cached) {
+	if ((bo->resource && i915_ttm_cpu_maps_iomem(bo->resource)) ||
+	    bo->ttm->caching != ttm_cached) {
 		obj->write_domain = I915_GEM_DOMAIN_WC;
 		obj->read_domains = I915_GEM_DOMAIN_WC;
 	} else {
@@ -711,6 +712,10 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
 
 	assert_object_held(dst);
 	assert_object_held(src);
+
+	if (GEM_WARN_ON(!src_bo->resource || !dst_bo->resource))
+		return -EINVAL;
+
 	i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
 
 	ret = dma_resv_reserve_fences(src_bo->base.resv, 1);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
index 7e67742bc65e..be44e7eed892 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
@@ -53,7 +53,7 @@ static int i915_ttm_backup(struct i915_gem_apply_to_region *apply,
 	unsigned int flags;
 	int err = 0;
 
-	if (bo->resource->mem_type == I915_PL_SYSTEM || obj->ttm.backup)
+	if (!bo->resource || bo->resource->mem_type == I915_PL_SYSTEM || obj->ttm.backup)
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

