Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2556756A83F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 18:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF8E113C40;
	Thu,  7 Jul 2022 16:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D143113A72;
 Thu,  7 Jul 2022 16:36:47 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EB6E766019CE;
 Thu,  7 Jul 2022 17:36:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657211806;
 bh=4aLhOjNbnMWEd5TE2kdvFPY0DN2hydFT2IvNHlkBa+w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DwoP+4IhrKT7vq3Vo5jM/qc2rAFh0l9FBCDtg/2HE+OKfs9PmfthvYnROAvaaK4Hs
 Juz/X+WnNhDx7hackb/B8ljBrnHkQ+QOCLM3oBQbNholdiP5/WQb5Kvp3BTP88D94F
 JAYVtV8FMgg5+8wxNGwapLDgxdJ7kPG84RX8p+hs275Qv4mziRyikSekAQnteECVjG
 TvyIFRVy7dh7aBmNuY8xxV5/wUenBinSilZzuL5Fk2PUjZ0WF6VKoWCh+1QdRgSNU0
 HFH6x+NGEmFpS62ySx9vzij4KWKbbl9GuYtAK109W3ZOIOBZ7F7+TPP51FrWhehH8e
 acpC1segULhnw==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v9 05/11] drm/i915: instantiate ttm ranger manager for stolen
 memory
Date: Thu,  7 Jul 2022 16:36:00 +0000
Message-Id: <20220707163606.1474111-6-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707163606.1474111-1-bob.beckett@collabora.com>
References: <20220707163606.1474111-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 kernel@collabora.com, Matthew Auld <matthew.auld@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

prepare for ttm based stolen region by using ttm range manager
as the resource manager for stolen region.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c |  6 ++--
 drivers/gpu/drm/i915/intel_region_ttm.c      | 31 +++++++++++++++-----
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 40249fa28a7a..675e9ab30396 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -60,11 +60,13 @@ i915_ttm_region(struct ttm_device *bdev, int ttm_mem_type)
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
index fd2ecfdd8fa1..694e9acb69e2 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -54,7 +54,7 @@ void intel_region_ttm_device_fini(struct drm_i915_private *dev_priv)
 
 /*
  * Map the i915 memory regions to TTM memory types. We use the
- * driver-private types for now, reserving TTM_PL_VRAM for stolen
+ * driver-private types for now, reserving I915_PL_STOLEN for stolen
  * memory and TTM_PL_TT for GGTT use if decided to implement this.
  */
 int intel_region_to_ttm_type(const struct intel_memory_region *mem)
@@ -63,11 +63,17 @@ int intel_region_to_ttm_type(const struct intel_memory_region *mem)
 
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
 
@@ -91,10 +97,16 @@ int intel_region_ttm_init(struct intel_memory_region *mem)
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
 
@@ -114,6 +126,7 @@ int intel_region_ttm_init(struct intel_memory_region *mem)
 int intel_region_ttm_fini(struct intel_memory_region *mem)
 {
 	struct ttm_resource_manager *man = mem->region_private;
+	int mem_type = intel_region_to_ttm_type(mem);
 	int ret = -EBUSY;
 	int count;
 
@@ -144,8 +157,10 @@ int intel_region_ttm_fini(struct intel_memory_region *mem)
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

