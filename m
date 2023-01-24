Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 905DD6798AD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 13:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621FF10E0B6;
	Tue, 24 Jan 2023 12:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BAD10E08F;
 Tue, 24 Jan 2023 12:57:29 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q5so9126869wrv.0;
 Tue, 24 Jan 2023 04:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=G2j1ILjaOd+GSihzIU1cOUV2OAUAr1XoHpXdJLsz5EA=;
 b=a00NB3Ru9yxmopxvJ1oNwZNV6YTZ4GEUe7aYHJeUta1mNdVvFWbXAgcIOqoInRhPQk
 tBhRnh+wuRvAmY/fO9GefO0pDlTUQQyBmn6+Ka447kWuemqdrBOyc+gzQhhW+X8M63DZ
 xHgT1NX/yG+BCptn1YyVBD6jAm5Ow4qXtejGwolK6yVgvpawv+NddSnHlH0B0pGvrb9s
 ieOBfdYEyKL8930KTKV8Q9x0nWW6FOn7INiMF+sBIJ6u0WpOccbu+ziCxZxLm1TU1U1A
 vlXmeNXJ7uFLePenPycEinmwe4BmfhZrOlwJsDiUXCxGtMUlCvlzDSzjoyUesvfSEAd4
 +EGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G2j1ILjaOd+GSihzIU1cOUV2OAUAr1XoHpXdJLsz5EA=;
 b=lZlaQEq6w3/xCRnag9f8/PjhmmirmfgmnWAGTATSq8aNqAamMOolHUPHXbFCM+KYCX
 6+JlaWzJhT4OCH6CZBjvp794ElZKEREEuRgjAfdYuq6QJpHDw58wBqQjEDIJGsU4oN0X
 dHpRzfxs1llon0zn2HG1dMdVaQf3YKF3lGPaKFZ+iOBOntMhSEdpAFTCG2ekDMPZMvcz
 TtPMq3cWMKIAvI3bBCFa1Bxt1VywYsiyr4vw2MOsCXU+gvLLpLRGqx6lYCiiL1TYKu+m
 rd9HTO7SVC6cYsIRXnza/5oeWAJRriP4MjF0gamXjJm6JmuyghXMJUpMOlRawVaW5HbL
 wf3A==
X-Gm-Message-State: AFqh2ko1Tn1gZDx/OQTQgF5JWeYSNSsfDusHX7U6MnLIyK6X1KCt+DPN
 OvBQAQnTP18IAPAPk1BvQGOktOs19Dc=
X-Google-Smtp-Source: AMrXdXum90/WiC82n7yd8te2OLT/LlfZiPKwU4PBE2vIOLQNPVfoB6e5WoWHE5A0lKBVfXPlL2U+XA==
X-Received: by 2002:a5d:5087:0:b0:2bd:e220:6b5 with SMTP id
 a7-20020a5d5087000000b002bde22006b5mr24712700wrt.1.1674565048361; 
 Tue, 24 Jan 2023 04:57:28 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a056000111200b002366dd0e030sm1820927wrw.68.2023.01.24.04.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 04:57:27 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/5] drm/i915: audit bo->resource usage v3
Date: Tue, 24 Jan 2023 13:57:22 +0100
Message-Id: <20230124125726.13323-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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

From: Christian König <ckoenig.leichtzumerken@gmail.com>

Make sure we can at least move and alloc TT objects without backing store.

v2: clear the tt object even when no resource is allocated.
v3: add Matthews changes for i915 as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 27 ++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 56 +++++++++++++++++---
 2 files changed, 71 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 8cfed1bef629..7420276827a5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -274,8 +274,6 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 {
 	struct drm_i915_private *i915 = container_of(bo->bdev, typeof(*i915),
 						     bdev);
-	struct ttm_resource_manager *man =
-		ttm_manager_type(bo->bdev, bo->resource->mem_type);
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 	unsigned long ccs_pages = 0;
 	enum ttm_caching caching;
@@ -289,8 +287,8 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 	if (!i915_tt)
 		return NULL;
 
-	if (obj->flags & I915_BO_ALLOC_CPU_CLEAR &&
-	    man->use_tt)
+	if (obj->flags & I915_BO_ALLOC_CPU_CLEAR && (!bo->resource ||
+	    ttm_manager_type(bo->bdev, bo->resource->mem_type)->use_tt))
 		page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
 
 	caching = i915_ttm_select_tt_caching(obj);
@@ -1058,7 +1056,26 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 		return VM_FAULT_SIGBUS;
 	}
 
-	if (!i915_ttm_resource_mappable(bo->resource)) {
+	/*
+	 * This must be swapped out with shmem ttm_tt (pipeline-gutting).
+	 * Calling ttm_bo_validate() here with TTM_PL_SYSTEM should only go as
+	 * far as far doing a ttm_bo_move_null(), which should skip all the
+	 * other junk.
+	 */
+	if (!bo->resource) {
+		struct ttm_operation_ctx ctx = {
+			.interruptible = true,
+			.no_wait_gpu = true, /* should be idle already */
+		};
+
+		GEM_BUG_ON(!bo->ttm || !(bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED));
+
+		ret = ttm_bo_validate(bo, i915_ttm_sys_placement(), &ctx);
+		if (ret) {
+			dma_resv_unlock(bo->base.resv);
+			return VM_FAULT_SIGBUS;
+		}
+	} else if (!i915_ttm_resource_mappable(bo->resource)) {
 		int err = -ENODEV;
 		int i;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 2ebaaf4d663c..76dd9e5e1a8b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -103,7 +103,27 @@ void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
 {
 	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
 	unsigned int cache_level;
+	unsigned int mem_flags;
 	unsigned int i;
+	int mem_type;
+
+	/*
+	 * We might have been purged (or swapped out) if the resource is NULL,
+	 * in which case the SYSTEM placement is the closest match to describe
+	 * the current domain. If the object is ever used in this state then we
+	 * will require moving it again.
+	 */
+	if (!bo->resource) {
+		mem_flags = I915_BO_FLAG_STRUCT_PAGE;
+		mem_type = I915_PL_SYSTEM;
+		cache_level = I915_CACHE_NONE;
+	} else {
+		mem_flags = i915_ttm_cpu_maps_iomem(bo->resource) ? I915_BO_FLAG_IOMEM :
+			I915_BO_FLAG_STRUCT_PAGE;
+		mem_type = bo->resource->mem_type;
+		cache_level = i915_ttm_cache_level(to_i915(bo->base.dev), bo->resource,
+						   bo->ttm);
+	}
 
 	/*
 	 * If object was moved to an allowable region, update the object
@@ -111,11 +131,11 @@ void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
 	 * in an allowable region, it's evicted and we don't update the
 	 * object region.
 	 */
-	if (intel_region_to_ttm_type(obj->mm.region) != bo->resource->mem_type) {
+	if (intel_region_to_ttm_type(obj->mm.region) != mem_type) {
 		for (i = 0; i < obj->mm.n_placements; ++i) {
 			struct intel_memory_region *mr = obj->mm.placements[i];
 
-			if (intel_region_to_ttm_type(mr) == bo->resource->mem_type &&
+			if (intel_region_to_ttm_type(mr) == mem_type &&
 			    mr != obj->mm.region) {
 				i915_gem_object_release_memory_region(obj);
 				i915_gem_object_init_memory_region(obj, mr);
@@ -125,12 +145,8 @@ void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
 	}
 
 	obj->mem_flags &= ~(I915_BO_FLAG_STRUCT_PAGE | I915_BO_FLAG_IOMEM);
+	obj->mem_flags |= mem_flags;
 
-	obj->mem_flags |= i915_ttm_cpu_maps_iomem(bo->resource) ? I915_BO_FLAG_IOMEM :
-		I915_BO_FLAG_STRUCT_PAGE;
-
-	cache_level = i915_ttm_cache_level(to_i915(bo->base.dev), bo->resource,
-					   bo->ttm);
 	i915_gem_object_set_cache_coherency(obj, cache_level);
 }
 
@@ -565,6 +581,32 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 		return 0;
 	}
 
+	if (!bo->resource) {
+		if (dst_mem->mem_type != TTM_PL_SYSTEM) {
+			hop->mem_type = TTM_PL_SYSTEM;
+			hop->flags = TTM_PL_FLAG_TEMPORARY;
+			return -EMULTIHOP;
+		}
+
+		/*
+		 * This is only reached when first creating the object, or if
+		 * the object was purged or swapped out (pipeline-gutting). For
+		 * the former we can safely skip all of the below since we are
+		 * only using a dummy SYSTEM placement here. And with the latter
+		 * we will always re-enter here with bo->resource set correctly
+		 * (as per the above), since this is part of a multi-hop
+		 * sequence, where at the end we can do the move for real.
+		 *
+		 * The special case here is when the dst_mem is TTM_PL_SYSTEM,
+		 * which doens't require any kind of move, so it should be safe
+		 * to skip all the below and call ttm_bo_move_null() here, where
+		 * the caller in __i915_ttm_get_pages() will take care of the
+		 * rest, since we should have a valid ttm_tt.
+		 */
+		ttm_bo_move_null(bo, dst_mem);
+		return 0;
+	}
+
 	ret = i915_ttm_move_notify(bo);
 	if (ret)
 		return ret;
-- 
2.34.1

