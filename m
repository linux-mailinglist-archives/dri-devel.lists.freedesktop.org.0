Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE194FE48A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 17:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A3E10E1FA;
	Tue, 12 Apr 2022 15:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EC510E13D;
 Tue, 12 Apr 2022 15:19:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id D6C311F42774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649776739;
 bh=4lkEaK+tGV/Iygaw6i15VKgZAMgQnTCuG7b9sgm7nuo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SIv4jq5sma57fREVY6NVRAljFw0ogXLXWOnpTPxLb/yxPZiHLe+ij6Icv1nlYS4bS
 ruSzWICs+MDWfW7cwkZQ/7ZqRlXI4iWJvl2rsrcQ1beebcUoPAPMp4xCu6Smzh177q
 Shp7l58FOJiB0w+f38CRAU9Bk4aYoJyid2F6peJ0rTwELnNz0QDzoiW0mFpx0SDVdd
 TAKUbRI1giZsX+kjQKz4cI2yjwl1UNpLsT6vyVWoqxIeXgSxJZIIYIXYKD9Cp8v+l/
 6nABXwHyoLtLYQ2aeLOecYexI1c3BmQJmtpqamPv1KrdTaKV0dsaeQGN/sSC514kZK
 sx6HGszOnUv9g==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/5] drm/i915: instantiate ttm ranger manager for stolen
 memory
Date: Tue, 12 Apr 2022 15:18:34 +0000
Message-Id: <20220412151838.1298956-2-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412151838.1298956-1-bob.beckett@collabora.com>
References: <20220412151838.1298956-1-bob.beckett@collabora.com>
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
 Matthew Auld <matthew.auld@intel.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

prepare for ttm based stolen region by using ttm range manager
as the resource manager for stolen region.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c |  6 ++--
 drivers/gpu/drm/i915/intel_region_ttm.c      | 31 +++++++++++++++-----
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index a10716f4e717..358f8a1a30ce 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -58,11 +58,13 @@ i915_ttm_region(struct ttm_device *bdev, int ttm_mem_type)
 	struct drm_i915_private *i915 = container_of(bdev, typeof(*i915), bdev);
 
 	/* There's some room for optimization here... */
-	GEM_BUG_ON(ttm_mem_type != I915_PL_SYSTEM &&
-		   ttm_mem_type < I915_PL_LMEM0);
+	GEM_BUG_ON(ttm_mem_type == I915_PL_GGTT);
+
 	if (ttm_mem_type == I915_PL_SYSTEM)
 		return intel_memory_region_lookup(i915, INTEL_MEMORY_SYSTEM,
 						  0);
+	if (ttm_mem_type == I915_PL_STOLEN)
+		return i915->mm.stolen_region;
 
 	return intel_memory_region_lookup(i915, INTEL_MEMORY_LOCAL,
 					  ttm_mem_type - I915_PL_LMEM0);
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 62ff77445b01..7d49ea72e33f 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -49,7 +49,7 @@ void intel_region_ttm_device_fini(struct drm_i915_private *dev_priv)
 
 /*
  * Map the i915 memory regions to TTM memory types. We use the
- * driver-private types for now, reserving TTM_PL_VRAM for stolen
+ * driver-private types for now, reserving I915_PL_STOLEN for stolen
  * memory and TTM_PL_TT for GGTT use if decided to implement this.
  */
 int intel_region_to_ttm_type(const struct intel_memory_region *mem)
@@ -58,11 +58,17 @@ int intel_region_to_ttm_type(const struct intel_memory_region *mem)
 
 	GEM_BUG_ON(mem->type != INTEL_MEMORY_LOCAL &&
 		   mem->type != INTEL_MEMORY_MOCK &&
-		   mem->type != INTEL_MEMORY_SYSTEM);
+		   mem->type != INTEL_MEMORY_SYSTEM &&
+		   mem->type != INTEL_MEMORY_STOLEN_SYSTEM &&
+		   mem->type != INTEL_MEMORY_STOLEN_LOCAL);
 
 	if (mem->type == INTEL_MEMORY_SYSTEM)
 		return TTM_PL_SYSTEM;
 
+	if (mem->type == INTEL_MEMORY_STOLEN_SYSTEM ||
+	    mem->type == INTEL_MEMORY_STOLEN_LOCAL)
+		return I915_PL_STOLEN;
+
 	type = mem->instance + TTM_PL_PRIV;
 	GEM_BUG_ON(type >= TTM_NUM_MEM_TYPES);
 
@@ -86,10 +92,16 @@ int intel_region_ttm_init(struct intel_memory_region *mem)
 	int mem_type = intel_region_to_ttm_type(mem);
 	int ret;
 
-	ret = i915_ttm_buddy_man_init(bdev, mem_type, false,
-				      resource_size(&mem->region),
-				      mem->io_size,
-				      mem->min_page_size, PAGE_SIZE);
+	if (mem_type == I915_PL_STOLEN) {
+		ret = ttm_range_man_init(bdev, mem_type, false,
+					 resource_size(&mem->region) >> PAGE_SHIFT);
+		mem->is_range_manager = true;
+	} else {
+		ret = i915_ttm_buddy_man_init(bdev, mem_type, false,
+					      resource_size(&mem->region),
+					      mem->io_size,
+					      mem->min_page_size, PAGE_SIZE);
+	}
 	if (ret)
 		return ret;
 
@@ -109,6 +121,7 @@ int intel_region_ttm_init(struct intel_memory_region *mem)
 int intel_region_ttm_fini(struct intel_memory_region *mem)
 {
 	struct ttm_resource_manager *man = mem->region_private;
+	int mem_type = intel_region_to_ttm_type(mem);
 	int ret = -EBUSY;
 	int count;
 
@@ -139,8 +152,10 @@ int intel_region_ttm_fini(struct intel_memory_region *mem)
 	if (ret || !man)
 		return ret;
 
-	ret = i915_ttm_buddy_man_fini(&mem->i915->bdev,
-				      intel_region_to_ttm_type(mem));
+	if (mem_type == I915_PL_STOLEN)
+		ret = ttm_range_man_fini(&mem->i915->bdev, mem_type);
+	else
+		ret = i915_ttm_buddy_man_fini(&mem->i915->bdev, mem_type);
 	GEM_WARN_ON(ret);
 	mem->region_private = NULL;
 
-- 
2.25.1

