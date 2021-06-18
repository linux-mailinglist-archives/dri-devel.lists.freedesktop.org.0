Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D323AC625
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 10:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B01D6E987;
	Fri, 18 Jun 2021 08:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83CE6E841;
 Fri, 18 Jun 2021 08:31:32 +0000 (UTC)
IronPort-SDR: /rn+ZTWrPAT38lZcXcqwQKCfCwbs1VQoRaqSKGBGHsi67hA8ew1Ad72xWBFWgjK/8KSFQXz/EA
 XKmFnYgxDnuw==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="204689094"
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="204689094"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 01:31:31 -0700
IronPort-SDR: qu5/NKVZLN2eS0CYpr1BxnA8ENYRLHB/xFhOcb58yhBEbSB3xxTaLLZP4m86G1t7JO+wb+hRWC
 NezK20j2T1hw==
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="479759540"
Received: from jhogberg-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.60])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 01:31:29 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/ttm: Fix incorrect assumptions about
 ttm_bo_validate() semantics
Date: Fri, 18 Jun 2021 10:31:17 +0200
Message-Id: <20210618083117.158081-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have assumed that if the current placement was not the requested
placement, but instead one of the busy placements, a TTM move would have
been triggered. That is not the case.

So when we initially place LMEM objects in "Limbo", (that is system
placement without any pages allocated), to be able to defer clearing
objects until first get_pages(), the first get_pages() would happily keep
objects in system memory if that is one of the allowed placements. And
since we don't yet support i915 GEM system memory from TTM, everything
breaks apart.

So make sure we try the requested placement first, if no eviction is
needed. If that fails, retry with all allowed placements also allowing
evictions. Also make sure we handle TTM failure codes correctly.

Also temporarily (until we support i915 GEM system on TTM), restrict
allowed placements to the requested placement to avoid things falling
apart should LMEM be full.

Fixes: 38f28c0695c0 ("drm/i915/ttm: Calculate the object placement at get_pages time)
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 61 +++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index df46535cca47..4bb0440f693c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -64,6 +64,30 @@ static struct ttm_placement i915_sys_placement = {
 	.busy_placement = &sys_placement_flags,
 };
 
+static int i915_ttm_err_to_gem(int err)
+{
+	/* Fastpath */
+	if (likely(!err))
+		return 0;
+
+	switch (err) {
+	case -EBUSY:
+		/*
+		 * TTM likes to convert -EDEADLK to -EBUSY, and wants us to
+		 * restart the operation, since we don't record the contending
+		 * lock. We use -EAGAIN to restart.
+		 */
+		return -EAGAIN;
+	case -ENOSPC:
+		/* Memory type / region is full, and we can't evict. */
+		return -ENXIO;
+	default:
+		break;
+	}
+
+	return err;
+}
+
 static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj);
 
 static enum ttm_caching
@@ -522,15 +546,46 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
 	struct sg_table *st;
 	struct ttm_place requested, busy[I915_TTM_MAX_PLACEMENTS];
 	struct ttm_placement placement;
+	int real_num_busy;
 	int ret;
 
 	GEM_BUG_ON(obj->mm.n_placements > I915_TTM_MAX_PLACEMENTS);
 
 	/* Move to the requested placement. */
 	i915_ttm_placement_from_obj(obj, &requested, busy, &placement);
+
+	/*
+	 * For now we support LMEM only with TTM.
+	 * TODO: Remove with system support
+	 */
+	GEM_BUG_ON(requested.mem_type < I915_PL_LMEM0 ||
+		   busy[0].mem_type < I915_PL_LMEM0);
+
+	/* First try only the requested placement. No eviction. */
+	real_num_busy = fetch_and_zero(&placement.num_busy_placement);
 	ret = ttm_bo_validate(bo, &placement, &ctx);
-	if (ret)
-		return ret == -ENOSPC ? -ENXIO : ret;
+	if (ret) {
+		ret = i915_ttm_err_to_gem(ret);
+		/*
+		 * Anything that wants to restart the operation gets to
+		 * do that.
+		 */
+		if (ret == -EDEADLK || ret == -EINTR || ret == -ERESTARTSYS ||
+		    ret == -EAGAIN)
+			return ret;
+
+		/* TODO: Remove this when we support system as TTM. */
+		real_num_busy = 1;
+
+		/*
+		 * If the initial attempt fails, allow all accepted placements,
+		 * evicting if necessary.
+		 */
+		placement.num_busy_placement = real_num_busy;
+		ret = ttm_bo_validate(bo, &placement, &ctx);
+		if (ret)
+			return i915_ttm_err_to_gem(ret);
+	}
 
 	/* Object either has a page vector or is an iomem object */
 	st = bo->ttm ? i915_ttm_tt_get_st(bo->ttm) : obj->ttm.cached_io_st;
@@ -741,5 +796,5 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 		obj->ttm.created = true;
 
 	/* i915 wants -ENXIO when out of memory region space. */
-	return (ret == -ENOSPC) ? -ENXIO : ret;
+	return i915_ttm_err_to_gem(ret);
 }
-- 
2.31.1

