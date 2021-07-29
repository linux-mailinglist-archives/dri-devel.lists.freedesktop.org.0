Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 566B63DA08B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 11:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0536E084;
	Thu, 29 Jul 2021 09:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B66D6E084;
 Thu, 29 Jul 2021 09:48:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="298427069"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="298427069"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 02:48:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="666344146"
Received: from badunne-mobl5.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.9.201])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 02:48:49 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/selftests: prefer the create_user helper
Date: Thu, 29 Jul 2021 10:47:31 +0100
Message-Id: <20210729094731.1953091-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No need to hand roll the set_placements stuff, now that that we have a
helper for this.

v2: add back the -ENODEV checking since it's possible for stolen to be
probed, and yet still be non-functional

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
---
 .../drm/i915/gem/selftests/i915_gem_mman.c    | 34 +++----------------
 1 file changed, 4 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 0b2b73d8a364..b20f5621f62b 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -860,24 +860,6 @@ static bool can_mmap(struct drm_i915_gem_object *obj, enum i915_mmap_type type)
 	return !no_map;
 }
 
-static void object_set_placements(struct drm_i915_gem_object *obj,
-				  struct intel_memory_region **placements,
-				  unsigned int n_placements)
-{
-	GEM_BUG_ON(!n_placements);
-
-	if (n_placements == 1) {
-		struct drm_i915_private *i915 = to_i915(obj->base.dev);
-		struct intel_memory_region *mr = placements[0];
-
-		obj->mm.placements = &i915->mm.regions[mr->id];
-		obj->mm.n_placements = 1;
-	} else {
-		obj->mm.placements = placements;
-		obj->mm.n_placements = n_placements;
-	}
-}
-
 #define expand32(x) (((x) << 0) | ((x) << 8) | ((x) << 16) | ((x) << 24))
 static int __igt_mmap(struct drm_i915_private *i915,
 		      struct drm_i915_gem_object *obj,
@@ -972,15 +954,13 @@ static int igt_mmap(void *arg)
 			struct drm_i915_gem_object *obj;
 			int err;
 
-			obj = i915_gem_object_create_region(mr, sizes[i], 0, I915_BO_ALLOC_USER);
+			obj = __i915_gem_object_create_user(i915, sizes[i], &mr, 1);
 			if (obj == ERR_PTR(-ENODEV))
 				continue;
 
 			if (IS_ERR(obj))
 				return PTR_ERR(obj);
 
-			object_set_placements(obj, &mr, 1);
-
 			err = __igt_mmap(i915, obj, I915_MMAP_TYPE_GTT);
 			if (err == 0)
 				err = __igt_mmap(i915, obj, I915_MMAP_TYPE_WC);
@@ -1101,15 +1081,13 @@ static int igt_mmap_access(void *arg)
 		struct drm_i915_gem_object *obj;
 		int err;
 
-		obj = i915_gem_object_create_region(mr, PAGE_SIZE, 0, I915_BO_ALLOC_USER);
+		obj = __i915_gem_object_create_user(i915, PAGE_SIZE, &mr, 1);
 		if (obj == ERR_PTR(-ENODEV))
 			continue;
 
 		if (IS_ERR(obj))
 			return PTR_ERR(obj);
 
-		object_set_placements(obj, &mr, 1);
-
 		err = __igt_mmap_access(i915, obj, I915_MMAP_TYPE_GTT);
 		if (err == 0)
 			err = __igt_mmap_access(i915, obj, I915_MMAP_TYPE_WB);
@@ -1248,15 +1226,13 @@ static int igt_mmap_gpu(void *arg)
 		struct drm_i915_gem_object *obj;
 		int err;
 
-		obj = i915_gem_object_create_region(mr, PAGE_SIZE, 0, I915_BO_ALLOC_USER);
+		obj = __i915_gem_object_create_user(i915, PAGE_SIZE, &mr, 1);
 		if (obj == ERR_PTR(-ENODEV))
 			continue;
 
 		if (IS_ERR(obj))
 			return PTR_ERR(obj);
 
-		object_set_placements(obj, &mr, 1);
-
 		err = __igt_mmap_gpu(i915, obj, I915_MMAP_TYPE_GTT);
 		if (err == 0)
 			err = __igt_mmap_gpu(i915, obj, I915_MMAP_TYPE_WC);
@@ -1405,15 +1381,13 @@ static int igt_mmap_revoke(void *arg)
 		struct drm_i915_gem_object *obj;
 		int err;
 
-		obj = i915_gem_object_create_region(mr, PAGE_SIZE, 0, I915_BO_ALLOC_USER);
+		obj = __i915_gem_object_create_user(i915, PAGE_SIZE, &mr, 1);
 		if (obj == ERR_PTR(-ENODEV))
 			continue;
 
 		if (IS_ERR(obj))
 			return PTR_ERR(obj);
 
-		object_set_placements(obj, &mr, 1);
-
 		err = __igt_mmap_revoke(i915, obj, I915_MMAP_TYPE_GTT);
 		if (err == 0)
 			err = __igt_mmap_revoke(i915, obj, I915_MMAP_TYPE_WC);
-- 
2.26.3

