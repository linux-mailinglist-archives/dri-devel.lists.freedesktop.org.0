Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC453919BC
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 16:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA586ED84;
	Wed, 26 May 2021 14:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42736ED34;
 Wed, 26 May 2021 14:15:38 +0000 (UTC)
IronPort-SDR: 0QMqgINTT/1qM3CTiM2tnaJOxaE1qJD3vbO4GitMPwCtklkR91BV5hHyq6ZOKSWrD0DibD3A54
 gRVvPwQQYs7w==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223660634"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="223660634"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:18 -0700
IronPort-SDR: pzsEiLRPFQ645ohBVUQAFiHAsuf45wdADXz5z/9wVzdwZYtOnAOMaZezOB9HnDgqGFV9xUZUg2
 zGmO/MXzIXtA==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="547206392"
Received: from wardmich-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.209.181])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:16 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 08/12] drm/i915/selftests: Remove redundant set-to-gtt-domain
Date: Wed, 26 May 2021 15:14:52 +0100
Message-Id: <20210526141456.2334192-9-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
References: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Since the vma's backing store is flushed upon first creation, remove the
manual calls to set-to-gtt-domain.

v2 (Tvrtko):
 * Rebase.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com> # v1
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 .../gpu/drm/i915/gem/selftests/i915_gem_mman.c   | 16 ----------------
 drivers/gpu/drm/i915/selftests/i915_vma.c        |  6 ------
 2 files changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 05a3b29f545e..886e2446e081 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -104,14 +104,6 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
 	GEM_BUG_ON(i915_gem_object_get_tiling(obj) != tile->tiling);
 	GEM_BUG_ON(i915_gem_object_get_stride(obj) != tile->stride);
 
-	i915_gem_object_lock(obj, NULL);
-	err = i915_gem_object_set_to_gtt_domain(obj, true);
-	i915_gem_object_unlock(obj);
-	if (err) {
-		pr_err("Failed to flush to GTT write domain; err=%d\n", err);
-		return err;
-	}
-
 	page = i915_prandom_u32_max_state(npages, prng);
 	view = compute_partial_view(obj, page, MIN_CHUNK_PAGES);
 
@@ -189,14 +181,6 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
 	GEM_BUG_ON(i915_gem_object_get_tiling(obj) != tile->tiling);
 	GEM_BUG_ON(i915_gem_object_get_stride(obj) != tile->stride);
 
-	i915_gem_object_lock(obj, NULL);
-	err = i915_gem_object_set_to_gtt_domain(obj, true);
-	i915_gem_object_unlock(obj);
-	if (err) {
-		pr_err("Failed to flush to GTT write domain; err=%d\n", err);
-		return err;
-	}
-
 	for_each_prime_number_from(page, 1, npages) {
 		struct i915_ggtt_view view =
 			compute_partial_view(obj, page, MIN_CHUNK_PAGES);
diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index dd0607254a95..24a806801883 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -987,12 +987,6 @@ static int igt_vma_remapped_gtt(void *arg)
 			u32 __iomem *map;
 			unsigned int x, y;
 
-			i915_gem_object_lock(obj, NULL);
-			err = i915_gem_object_set_to_gtt_domain(obj, true);
-			i915_gem_object_unlock(obj);
-			if (err)
-				goto out;
-
 			if (!plane_info[0].dst_stride)
 				plane_info[0].dst_stride = *t == I915_GGTT_VIEW_ROTATED ?
 								 p->height : p->width;
-- 
2.30.2

