Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7625E54FD2C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 21:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D6610F447;
	Fri, 17 Jun 2022 19:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F69F10F32F;
 Fri, 17 Jun 2022 19:05:48 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 96C1466018AF;
 Fri, 17 Jun 2022 20:05:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655492746;
 bh=BJ87eisXj9Ppx4nwiDdWpEsHsZ0BoBn8nQEON2j1/N8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CwhRcRKbJuopMPiRZLEn/1R8Isag4LuaoXiTIJeBSKNA68rv9FAseSLrBlWy8yp/C
 v4yVg6d0nOSRIN0L7S7OMwMQIr8y/hdpN1quN+d/V8SRKHsL7s4mrpU6BtrnDb+PPO
 gr6v2MgM9SkQjxzO+rlANBJPKA68bwMDmMro7/L7MRdBV5d2F5/equfr7AH6dthOkW
 B+fN4nwgpAjcp5Doi439CZcvZjGH4QdL1rCNMFGcLbTXVPR34y2UbiQk4/LnCusShU
 DUVsPMTDFAJJSEAcVafmQFaqfLURqt2XRgO7TjjCAfzUOYjWjL8XP78qudQi8QB+aD
 JNi1jRZGgPU3w==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v6 09/10] drm/i915/ttm: add buffer pin on alloc flag
Date: Fri, 17 Jun 2022 19:05:15 +0000
Message-Id: <20220617190516.2805572-10-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220617190516.2805572-1-bob.beckett@collabora.com>
References: <20220617190516.2805572-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 kernel@collabora.com, Matthew Auld <matthew.auld@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For situations where allocations need to fail on alloc instead of
delayed get_pages, add a new alloc flag to pin the ttm bo.
This makes sure that the resource has been allocated during buffer
creation, allowing it to fail with an error if the placement is
exhausted.
This allows existing fallback options for stolen backend allocation like
create_ring_vma to work as expected.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 13 ++++++----
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 25 ++++++++++++++++++-
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 6632ed52e919..07bc11247a3e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -325,17 +325,20 @@ struct drm_i915_gem_object {
  * dealing with userspace objects the CPU fault handler is free to ignore this.
  */
 #define I915_BO_ALLOC_GPU_ONLY	  BIT(6)
+/* object should be pinned in destination region from allocation */
+#define I915_BO_ALLOC_PINNED	  BIT(7)
 #define I915_BO_ALLOC_FLAGS (I915_BO_ALLOC_CONTIGUOUS | \
 			     I915_BO_ALLOC_VOLATILE | \
 			     I915_BO_ALLOC_CPU_CLEAR | \
 			     I915_BO_ALLOC_USER | \
 			     I915_BO_ALLOC_PM_VOLATILE | \
 			     I915_BO_ALLOC_PM_EARLY | \
-			     I915_BO_ALLOC_GPU_ONLY)
-#define I915_BO_READONLY          BIT(7)
-#define I915_TILING_QUIRK_BIT     8 /* unknown swizzling; do not release! */
-#define I915_BO_PROTECTED         BIT(9)
-#define I915_BO_WAS_BOUND_BIT     10
+			     I915_BO_ALLOC_GPU_ONLY | \
+			     I915_BO_ALLOC_PINNED)
+#define I915_BO_READONLY          BIT(8)
+#define I915_TILING_QUIRK_BIT     9 /* unknown swizzling; do not release! */
+#define I915_BO_PROTECTED         BIT(10)
+#define I915_BO_WAS_BOUND_BIT     11
 	/**
 	 * @mem_flags - Mutable placement-related flags
 	 *
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 27d59639177f..bb988608296d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -998,6 +998,13 @@ static void i915_ttm_delayed_free(struct drm_i915_gem_object *obj)
 {
 	GEM_BUG_ON(!obj->ttm.created);
 
+	/* stolen objects are pinned for lifetime. Unpin before putting */
+	if (obj->flags & I915_BO_ALLOC_PINNED) {
+		ttm_bo_reserve(i915_gem_to_ttm(obj), true, false, NULL);
+		ttm_bo_unpin(i915_gem_to_ttm(obj));
+		ttm_bo_unreserve(i915_gem_to_ttm(obj));
+	}
+
 	ttm_bo_put(i915_gem_to_ttm(obj));
 }
 
@@ -1193,6 +1200,9 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 		.no_wait_gpu = false,
 	};
 	enum ttm_bo_type bo_type;
+	struct ttm_place _place;
+	struct ttm_placement _placement;
+	struct ttm_placement *placement;
 	int ret;
 
 	drm_gem_private_object_init(&i915->drm, &obj->base, size);
@@ -1222,6 +1232,17 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	 */
 	i915_gem_object_make_unshrinkable(obj);
 
+	if (obj->flags & I915_BO_ALLOC_PINNED) {
+		i915_ttm_place_from_region(mem, &_place, obj->bo_offset,
+					   obj->base.size, obj->flags);
+		_placement.num_placement = 1;
+		_placement.placement = &_place;
+		_placement.num_busy_placement = 0;
+		_placement.busy_placement = NULL;
+		placement = &_placement;
+	} else {
+		placement = &i915_sys_placement;
+	}
 	/*
 	 * If this function fails, it will call the destructor, but
 	 * our caller still owns the object. So no freeing in the
@@ -1230,7 +1251,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	 * until successful initialization.
 	 */
 	ret = ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), size,
-				   bo_type, &i915_sys_placement,
+				   bo_type, placement,
 				   page_size >> PAGE_SHIFT,
 				   &ctx, NULL, NULL, i915_ttm_bo_destroy);
 	if (ret)
@@ -1242,6 +1263,8 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	i915_ttm_adjust_domains_after_move(obj);
 	i915_ttm_adjust_gem_after_move(obj);
 	obj->ttm.cache_level_override = false;
+	if (obj->flags & I915_BO_ALLOC_PINNED)
+		ttm_bo_pin(i915_gem_to_ttm(obj));
 	i915_gem_object_unlock(obj);
 
 	return 0;
-- 
2.25.1

