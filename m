Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9763B716B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 13:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1806E86B;
	Tue, 29 Jun 2021 11:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826AA6E866;
 Tue, 29 Jun 2021 11:37:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="269259991"
X-IronPort-AV: E=Sophos;i="5.83,308,1616482800"; d="scan'208";a="269259991"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 04:37:36 -0700
X-IronPort-AV: E=Sophos;i="5.83,308,1616482800"; d="scan'208";a="625600037"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.141])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 04:37:34 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/3] drm/i915/display: Migrate objects to LMEM if possible
 for display
Date: Tue, 29 Jun 2021 13:37:13 +0200
Message-Id: <20210629113713.154654-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629113713.154654-1-thomas.hellstrom@linux.intel.com>
References: <20210629113713.154654-1-thomas.hellstrom@linux.intel.com>
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

Objects intended to be used as display framebuffers must reside in
LMEM for discrete. If they happen to not do that, migrate them to
LMEM before pinning.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |  5 ++++-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c   |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c     | 21 --------------------
 drivers/gpu/drm/i915/gem/i915_gem_object.h   |  2 --
 4 files changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index eec6c9e9cda7..026c28c612f0 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1331,6 +1331,9 @@ intel_pin_and_fence_fb_obj(struct drm_framebuffer *fb,
 	ret = i915_gem_object_lock(obj, &ww);
 	if (!ret && phys_cursor)
 		ret = i915_gem_object_attach_phys(obj, alignment);
+	else if (!ret && HAS_LMEM(dev_priv))
+		ret = i915_gem_object_migrate(obj, &ww, INTEL_REGION_LMEM);
+	/* TODO: Do we need to sync when migration becomes async? */
 	if (!ret)
 		ret = i915_gem_object_pin_pages(obj);
 	if (ret)
@@ -11778,7 +11781,7 @@ intel_user_framebuffer_create(struct drm_device *dev,
 
 	/* object is backed with LMEM for discrete */
 	i915 = to_i915(obj->base.dev);
-	if (HAS_LMEM(i915) && !i915_gem_object_validates_to_lmem(obj)) {
+	if (HAS_LMEM(i915) && !i915_gem_object_can_migrate(obj, INTEL_REGION_LMEM)) {
 		/* object is "remote", not in local memory */
 		i915_gem_object_put(obj);
 		return ERR_PTR(-EREMOTE);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 073822100da7..7d1400b13429 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -375,7 +375,7 @@ i915_gem_object_pin_to_display_plane(struct drm_i915_gem_object *obj,
 	struct i915_vma *vma;
 	int ret;
 
-	/* Frame buffer must be in LMEM (no migration yet) */
+	/* Frame buffer must be in LMEM */
 	if (HAS_LMEM(i915) && !i915_gem_object_is_lmem(obj))
 		return ERR_PTR(-EINVAL);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
index 41d5182cd367..be1d122574af 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
@@ -23,27 +23,6 @@ i915_gem_object_lmem_io_map(struct drm_i915_gem_object *obj,
 	return io_mapping_map_wc(&obj->mm.region->iomap, offset, size);
 }
 
-/**
- * i915_gem_object_validates_to_lmem - Whether the object is resident in
- * lmem when pages are present.
- * @obj: The object to check.
- *
- * Migratable objects residency may change from under us if the object is
- * not pinned or locked. This function is intended to be used to check whether
- * the object can only reside in lmem when pages are present.
- *
- * Return: Whether the object is always resident in lmem when pages are
- * present.
- */
-bool i915_gem_object_validates_to_lmem(struct drm_i915_gem_object *obj)
-{
-	struct intel_memory_region *mr = READ_ONCE(obj->mm.region);
-
-	return !i915_gem_object_migratable(obj) &&
-		mr && (mr->type == INTEL_MEMORY_LOCAL ||
-		       mr->type == INTEL_MEMORY_STOLEN_LOCAL);
-}
-
 /**
  * i915_gem_object_is_lmem - Whether the object is resident in
  * lmem
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 8cbd7a5334e2..d423d8cac4f2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -597,8 +597,6 @@ bool i915_gem_object_evictable(struct drm_i915_gem_object *obj);
 
 bool i915_gem_object_migratable(struct drm_i915_gem_object *obj);
 
-bool i915_gem_object_validates_to_lmem(struct drm_i915_gem_object *obj);
-
 int i915_gem_object_migrate(struct drm_i915_gem_object *obj,
 			    struct i915_gem_ww_ctx *ww,
 			    enum intel_region_id id);
-- 
2.31.1

