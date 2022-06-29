Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D52C055FF69
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EDF511AE14;
	Wed, 29 Jun 2022 12:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2440011A237;
 Wed, 29 Jun 2022 12:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656504917; x=1688040917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d6QkKgq0zRsU+57fjISIN59smVZ74v05vTDcBcMDgwU=;
 b=OuwiPLtpYcAGO9b3b/ftmh5YM6cUEZGUL/82fW75OKBW1lJ3s9D8IuRr
 XhHDQWsQLyEh7qP1wL4gDo60HcyzIhPmHnM+0S0z5U6CzDkGkXsPEgREu
 UeMK2sBIIhRb7mAnZkzbtYrURrtQoqm0VexnHNGc8MtcIXM1HGGd4kDuu
 5gcDvDroVS5svd2ngDMyBYH+z0uW/MJqkAU4PC4/orP1IUuOCC08ZLWdB
 4Z+KpifxnzTQSW65yI7TIPbEczkC9s+vSRR//KU6lB8a8+NYJ8D0geVsy
 Ef1Exaa+ePRdREvJLJX5LmYTpWogvUWw/ppsMV5a3IZeVgegK5DJKM5+X g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="262421487"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="262421487"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 05:15:17 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="595215162"
Received: from nwalsh-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.202.136])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 05:15:14 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 12/13] drm/i915/ttm: disallow CPU fallback mode for ccs
 pages
Date: Wed, 29 Jun 2022 13:14:26 +0100
Message-Id: <20220629121427.353800-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629121427.353800-1-matthew.auld@intel.com>
References: <20220629121427.353800-1-matthew.auld@intel.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Jordan Justen <jordan.l.justen@intel.com>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Falling back to memcpy/memset shouldn't be allowed if we know we have
CCS state to manage using the blitter. Otherwise we are potentially
leaving the aux CCS state in an unknown state, which smells like an info
leak.

Fixes: 48760ffe923a ("drm/i915/gt: Clear compress metadata for Flat-ccs objects")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c   | 26 ++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h   |  2 ++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 18 --------------
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c |  3 +++
 4 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 642a5d59ce26..ccec4055fde3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -717,6 +717,32 @@ bool i915_gem_object_placement_possible(struct drm_i915_gem_object *obj,
 	return false;
 }
 
+/**
+ * i915_gem_object_needs_ccs_pages - Check whether the object requires extra
+ * pages when placed in system-memory, in order to save and later restore the
+ * flat-CCS aux state when the object is moved between local-memory and
+ * system-memory
+ * @obj: Pointer to the object
+ *
+ * Return: True if the object needs extra ccs pages. False otherwise.
+ */
+bool i915_gem_object_needs_ccs_pages(struct drm_i915_gem_object *obj)
+{
+	bool lmem_placement = false;
+	int i;
+
+	for (i = 0; i < obj->mm.n_placements; i++) {
+		/* Compression is not allowed for the objects with smem placement */
+		if (obj->mm.placements[i]->type == INTEL_MEMORY_SYSTEM)
+			return false;
+		if (!lmem_placement &&
+		    obj->mm.placements[i]->type == INTEL_MEMORY_LOCAL)
+			lmem_placement = true;
+	}
+
+	return lmem_placement;
+}
+
 void i915_gem_init__objects(struct drm_i915_private *i915)
 {
 	INIT_DELAYED_WORK(&i915->mm.free_work, __i915_gem_free_work);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 0bf3ee27a2a8..6f0a3ce35567 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -618,6 +618,8 @@ int i915_gem_object_wait_migration(struct drm_i915_gem_object *obj,
 bool i915_gem_object_placement_possible(struct drm_i915_gem_object *obj,
 					enum intel_memory_type type);
 
+bool i915_gem_object_needs_ccs_pages(struct drm_i915_gem_object *obj);
+
 int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
 			 size_t size, struct intel_memory_region *mr,
 			 struct address_space *mapping,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 098409a33e10..7e1f8b83077f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -266,24 +266,6 @@ static const struct i915_refct_sgt_ops tt_rsgt_ops = {
 	.release = i915_ttm_tt_release
 };
 
-static inline bool
-i915_gem_object_needs_ccs_pages(struct drm_i915_gem_object *obj)
-{
-	bool lmem_placement = false;
-	int i;
-
-	for (i = 0; i < obj->mm.n_placements; i++) {
-		/* Compression is not allowed for the objects with smem placement */
-		if (obj->mm.placements[i]->type == INTEL_MEMORY_SYSTEM)
-			return false;
-		if (!lmem_placement &&
-		    obj->mm.placements[i]->type == INTEL_MEMORY_LOCAL)
-			lmem_placement = true;
-	}
-
-	return lmem_placement;
-}
-
 static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 					 uint32_t page_flags)
 {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 364e7fe8efb1..d22e38aad6b9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -429,6 +429,9 @@ i915_ttm_memcpy_work_arm(struct i915_ttm_memcpy_work *work,
 static bool i915_ttm_memcpy_allowed(struct ttm_buffer_object *bo,
 				    struct ttm_resource *dst_mem)
 {
+	if (i915_gem_object_needs_ccs_pages(i915_ttm_to_gem(bo)))
+		return false;
+
 	if (!(i915_ttm_resource_mappable(bo->resource) &&
 	      i915_ttm_resource_mappable(dst_mem)))
 		return false;
-- 
2.36.1

