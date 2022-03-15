Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D924DA1EA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 19:05:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7632E10E43C;
	Tue, 15 Mar 2022 18:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3FB10E43C;
 Tue, 15 Mar 2022 18:05:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 4FEB01F43052
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647367506;
 bh=li5yvJTQb+uuRirbQROVb1o4GxJGvJ65W8dX02ajYJw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TR0nj7nScUIBbszSh1mu7bfxJOH4h5as3e6Qc5h7NMbt+0dnqa+HWqSGd1FCHSRR6
 VfsTs3A5ArrTmaw3Lp5EUBnqRh9e/f96py045supEnNw3B3ilZ1yR3MPWxtQws42fc
 GHizsPbyJArTR13ptzaLN7WR4zPM4FE7wy2gB1HWZvk38xBS+616rnemHdE7H/e34D
 3xv0bfQ5Cm74D+m9iu/tDsy4dRGQBpoA19gFNgdxVcgXYv6G6zcwHFzO75NJTC8Ds1
 d+PE/Ja/pUnoCXYMFnWW9PPayp9RxXXa3btaQfCDqxptQBVGJ/DtFxT0WvRvggwj+4
 Je9ys51gpb1HQ==
From: Robert Beckett <bob.beckett@collabora.com>
To: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC PATCH 1/7] drm/i915: instantiate ttm ranger manager for stolen
 memory
Date: Tue, 15 Mar 2022 18:04:38 +0000
Message-Id: <20220315180444.3327283-2-bob.beckett@collabora.com>
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

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/intel_region_ttm.c | 29 +++++++++++++++++++------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 737ef3f4ab54..bb564b830c96 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -57,11 +57,17 @@ int intel_region_to_ttm_type(const struct intel_memory_region *mem)
 
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
+		return TTM_PL_VRAM;
+
 	type = mem->instance + TTM_PL_PRIV;
 	GEM_BUG_ON(type >= TTM_NUM_MEM_TYPES);
 
@@ -85,10 +91,16 @@ int intel_region_ttm_init(struct intel_memory_region *mem)
 	int mem_type = intel_region_to_ttm_type(mem);
 	int ret;
 
-	ret = i915_ttm_buddy_man_init(bdev, mem_type, false,
-				      resource_size(&mem->region),
-				      mem->io_size,
-				      mem->min_page_size, PAGE_SIZE);
+	if (mem_type == TTM_PL_VRAM) {
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
 
@@ -108,6 +120,7 @@ int intel_region_ttm_init(struct intel_memory_region *mem)
 int intel_region_ttm_fini(struct intel_memory_region *mem)
 {
 	struct ttm_resource_manager *man = mem->region_private;
+	int mem_type = intel_region_to_ttm_type(mem);
 	int ret = -EBUSY;
 	int count;
 
@@ -138,8 +151,10 @@ int intel_region_ttm_fini(struct intel_memory_region *mem)
 	if (ret || !man)
 		return ret;
 
-	ret = i915_ttm_buddy_man_fini(&mem->i915->bdev,
-				      intel_region_to_ttm_type(mem));
+	if (mem_type == TTM_PL_VRAM)
+		ret = ttm_range_man_fini(&mem->i915->bdev, mem_type);
+	else
+		ret = i915_ttm_buddy_man_fini(&mem->i915->bdev, mem_type);
 	GEM_WARN_ON(ret);
 	mem->region_private = NULL;
 
-- 
2.25.1

