Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C20CF4DA1ED
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 19:05:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02E210E47A;
	Tue, 15 Mar 2022 18:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11A910E47A;
 Tue, 15 Mar 2022 18:05:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 0A0861F4304E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647367508;
 bh=pp4xEHtQJoUieP2EE+CD9Jk5LLU+pLZGq4j0nFjTOCI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fn15lH+yQHWych2xGbE+cbChMP5Y9HL4LBpuGJ1TQGV/XP/iwTpnaPe8XY+8k+Z9q
 3VoaMIzFxDGy9HF+NdiOfeM20/Dq5iEzVB/+jfOra4qsn2VZd8gBSxefXH1T3HkgCQ
 J2qTLW0UEuM+qkoYmJq39iaoETbQKJtyCIrYHkbHFKSh4vCg3BVUkfcdhzMQuX/weh
 nRYcH+13DUEaSXJQU1bYQaPuTQY96Pi/8G0Pl6ymbKjjcNoKnO3WOae+86QWstC27I
 IvcHrDIugjFtzFNXoGRsTKOVSHVlopOVZ1F/mO+6PNYHLdi0EVuYO9sJlAZwK87N6c
 9n8gV1RB3r0jA==
From: Robert Beckett <bob.beckett@collabora.com>
To: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC PATCH 3/7] drm/i915: use gem objects to track stolen nodes
Date: Tue, 15 Mar 2022 18:04:40 +0000
Message-Id: <20220315180444.3327283-4-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315180444.3327283-1-bob.beckett@collabora.com>
References: <20220315180444.3327283-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Construct gem objects around stolen nodes.
This stops the abuse of interfaces and aids future patches that done use
drm nodes for stolen areas.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c   | 72 ++++++++++++----------
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 60 ++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h |  7 +++
 3 files changed, 106 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 142280b6ce6d..9df64ecab70e 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -92,8 +92,8 @@ struct intel_fbc {
 	unsigned int possible_framebuffer_bits;
 	unsigned int busy_bits;
 
-	struct drm_mm_node compressed_fb;
-	struct drm_mm_node compressed_llb;
+	struct drm_i915_gem_object *compressed_fb;
+	struct drm_i915_gem_object *compressed_llb;
 
 	enum intel_fbc_id id;
 
@@ -331,16 +331,18 @@ static void i8xx_fbc_nuke(struct intel_fbc *fbc)
 static void i8xx_fbc_program_cfb(struct intel_fbc *fbc)
 {
 	struct drm_i915_private *i915 = fbc->i915;
+	u64 fb_offset = i915_gem_object_stolen_offset(fbc->compressed_fb);
+	u64 llb_offset = i915_gem_object_stolen_offset(fbc->compressed_llb);
 
 	GEM_BUG_ON(range_overflows_end_t(u64, i915->dsm.start,
-					 fbc->compressed_fb.start, U32_MAX));
+					 fb_offset, U32_MAX));
 	GEM_BUG_ON(range_overflows_end_t(u64, i915->dsm.start,
-					 fbc->compressed_llb.start, U32_MAX));
+					 llb_offset, U32_MAX));
 
 	intel_de_write(i915, FBC_CFB_BASE,
-		       i915->dsm.start + fbc->compressed_fb.start);
+		       i915->dsm.start + fb_offset);
 	intel_de_write(i915, FBC_LL_BASE,
-		       i915->dsm.start + fbc->compressed_llb.start);
+		       i915->dsm.start + llb_offset);
 }
 
 static const struct intel_fbc_funcs i8xx_fbc_funcs = {
@@ -449,7 +451,8 @@ static void g4x_fbc_program_cfb(struct intel_fbc *fbc)
 {
 	struct drm_i915_private *i915 = fbc->i915;
 
-	intel_de_write(i915, DPFC_CB_BASE, fbc->compressed_fb.start);
+	intel_de_write(i915, DPFC_CB_BASE,
+		       i915_gem_object_stolen_offset(fbc->compressed_fb));
 }
 
 static const struct intel_fbc_funcs g4x_fbc_funcs = {
@@ -500,7 +503,8 @@ static void ilk_fbc_program_cfb(struct intel_fbc *fbc)
 {
 	struct drm_i915_private *i915 = fbc->i915;
 
-	intel_de_write(i915, ILK_DPFC_CB_BASE(fbc->id), fbc->compressed_fb.start);
+	intel_de_write(i915, ILK_DPFC_CB_BASE(fbc->id),
+			i915_gem_object_stolen_offset(fbc->compressed_fb));
 }
 
 static const struct intel_fbc_funcs ilk_fbc_funcs = {
@@ -740,21 +744,24 @@ static int find_compression_limit(struct intel_fbc *fbc,
 {
 	struct drm_i915_private *i915 = fbc->i915;
 	u64 end = intel_fbc_stolen_end(i915);
-	int ret, limit = min_limit;
+	int limit = min_limit;
+	struct drm_i915_gem_object *obj;
 
 	size /= limit;
 
 	/* Try to over-allocate to reduce reallocations and fragmentation. */
-	ret = i915_gem_stolen_insert_node_in_range(i915, &fbc->compressed_fb,
-						   size <<= 1, 4096, 0, end);
-	if (ret == 0)
+	obj = i915_gem_object_create_stolen_in_range(i915, size <<= 1, 4096, 0, end);
+	if (!IS_ERR(obj)) {
+		fbc->compressed_fb = obj;
 		return limit;
+	}
 
 	for (; limit <= intel_fbc_max_limit(i915); limit <<= 1) {
-		ret = i915_gem_stolen_insert_node_in_range(i915, &fbc->compressed_fb,
-							   size >>= 1, 4096, 0, end);
-		if (ret == 0)
+		obj = i915_gem_object_create_stolen_in_range(i915, size >>= 1, 4096, 0, end);
+		if (!IS_ERR(obj)) {
+			fbc->compressed_fb = obj;
 			return limit;
+		}
 	}
 
 	return 0;
@@ -765,17 +772,19 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 {
 	struct drm_i915_private *i915 = fbc->i915;
 	int ret;
+	struct drm_i915_gem_object *obj;
 
-	drm_WARN_ON(&i915->drm,
-		    drm_mm_node_allocated(&fbc->compressed_fb));
-	drm_WARN_ON(&i915->drm,
-		    drm_mm_node_allocated(&fbc->compressed_llb));
+	drm_WARN_ON(&i915->drm, fbc->compressed_fb);
+	drm_WARN_ON(&i915->drm, fbc->compressed_llb);
 
 	if (DISPLAY_VER(i915) < 5 && !IS_G4X(i915)) {
-		ret = i915_gem_stolen_insert_node(i915, &fbc->compressed_llb,
-						  4096, 4096);
-		if (ret)
+		obj = i915_gem_object_create_stolen_in_range(i915, 4096, 4096,
+							     I915_GEM_STOLEN_BIAS, U64_MAX);
+		if (IS_ERR(obj)) {
+			ret = PTR_ERR(obj);
 			goto err;
+		}
+		fbc->compressed_llb = obj;
 	}
 
 	ret = find_compression_limit(fbc, size, min_limit);
@@ -788,14 +797,13 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 	fbc->limit = ret;
 
 	drm_dbg_kms(&i915->drm,
-		    "reserved %llu bytes of contiguous stolen space for FBC, limit: %d\n",
-		    fbc->compressed_fb.size, fbc->limit);
+		    "reserved %lu bytes of contiguous stolen space for FBC, limit: %d\n",
+		    fbc->compressed_fb->base.size, fbc->limit);
 
 	return 0;
 
 err_llb:
-	if (drm_mm_node_allocated(&fbc->compressed_llb))
-		i915_gem_stolen_remove_node(i915, &fbc->compressed_llb);
+	i915_gem_object_put(fetch_and_zero(&fbc->compressed_llb));
 err:
 	if (drm_mm_initialized(&i915->mm.stolen))
 		drm_info_once(&i915->drm, "not enough stolen space for compressed buffer (need %d more bytes), disabling. Hint: you may be able to increase stolen memory size in the BIOS to avoid this.\n", size);
@@ -809,15 +817,13 @@ static void intel_fbc_program_cfb(struct intel_fbc *fbc)
 
 static void __intel_fbc_cleanup_cfb(struct intel_fbc *fbc)
 {
-	struct drm_i915_private *i915 = fbc->i915;
-
 	if (WARN_ON(intel_fbc_hw_is_active(fbc)))
 		return;
 
-	if (drm_mm_node_allocated(&fbc->compressed_llb))
-		i915_gem_stolen_remove_node(i915, &fbc->compressed_llb);
-	if (drm_mm_node_allocated(&fbc->compressed_fb))
-		i915_gem_stolen_remove_node(i915, &fbc->compressed_fb);
+	if (fbc->compressed_llb)
+		i915_gem_object_put(fetch_and_zero(&fbc->compressed_llb));
+	if (fbc->compressed_fb)
+		i915_gem_object_put(fetch_and_zero(&fbc->compressed_fb));
 }
 
 void intel_fbc_cleanup(struct drm_i915_private *i915)
@@ -1023,7 +1029,7 @@ static bool intel_fbc_is_cfb_ok(const struct intel_plane_state *plane_state)
 	struct intel_fbc *fbc = plane->fbc;
 
 	return intel_fbc_min_limit(plane_state) <= fbc->limit &&
-		intel_fbc_cfb_size(plane_state) <= fbc->compressed_fb.size * fbc->limit;
+		intel_fbc_cfb_size(plane_state) <= fbc->compressed_fb->base.size * fbc->limit;
 }
 
 static bool intel_fbc_is_ok(const struct intel_plane_state *plane_state)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 0bf8f61134af..265133cb2a47 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -907,6 +907,66 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
 	return ERR_PTR(ret);
 }
 
+struct drm_i915_gem_object *
+i915_gem_object_create_stolen_in_range(struct drm_i915_private *i915,
+				       resource_size_t size,
+				       resource_size_t alignment,
+				       u64 start, u64 end)
+{
+	struct intel_memory_region *mem = i915->mm.stolen_region;
+	struct drm_i915_gem_object *obj;
+	struct drm_mm_node *stolen;
+	int ret;
+
+	if (!drm_mm_initialized(&i915->mm.stolen))
+		return ERR_PTR(-ENODEV);
+
+	/* KISS and expect everything to be page-aligned */
+	if (GEM_WARN_ON(size == 0) ||
+	    GEM_WARN_ON(!IS_ALIGNED(size, mem->min_page_size)) ||
+	    GEM_WARN_ON(!IS_ALIGNED(alignment, mem->min_page_size)))
+		return ERR_PTR(-EINVAL);
+
+	stolen = kzalloc(sizeof(*stolen), GFP_KERNEL);
+	if (!stolen)
+		return ERR_PTR(-ENOMEM);
+
+	ret = i915_gem_stolen_insert_node_in_range(i915, stolen, size,
+						   alignment, start, end);
+	if (ret)
+		goto err_free;
+
+	obj = i915_gem_object_alloc();
+	if (!obj) {
+		ret = -ENOMEM;
+		goto err_stolen;
+	}
+
+	ret = __i915_gem_object_create_stolen(mem, obj, stolen);
+	if (ret)
+		goto err_object_free;
+
+	i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
+	return obj;
+
+err_object_free:
+	i915_gem_object_free(obj);
+err_stolen:
+	i915_gem_stolen_remove_node(i915, stolen);
+err_free:
+	kfree(stolen);
+	return ERR_PTR(ret);
+}
+
+u64 i915_gem_object_stolen_offset(const struct drm_i915_gem_object *obj)
+{
+	if (!obj || !i915_gem_object_is_stolen(obj))
+		return 0;
+
+	return obj->stolen->start;
+}
+
+
 bool i915_gem_object_is_stolen(const struct drm_i915_gem_object *obj)
 {
 	return obj->ops == &i915_gem_object_stolen_ops;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.h b/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
index ccdf7befc571..494e90f130f4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
@@ -35,6 +35,13 @@ struct drm_i915_gem_object *
 i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *dev_priv,
 					       resource_size_t stolen_offset,
 					       resource_size_t size);
+struct drm_i915_gem_object *
+i915_gem_object_create_stolen_in_range(struct drm_i915_private *i915,
+				       resource_size_t size,
+				       resource_size_t alignment,
+				       u64 start, u64 end);
+u64 i915_gem_object_stolen_offset(const struct drm_i915_gem_object *obj);
+
 
 bool i915_gem_object_is_stolen(const struct drm_i915_gem_object *obj);
 
-- 
2.25.1

