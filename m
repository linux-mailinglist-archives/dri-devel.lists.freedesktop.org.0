Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17384DEAC1
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 21:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F4610EE95;
	Sat, 19 Mar 2022 20:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C4D10EE95;
 Sat, 19 Mar 2022 20:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647722532; x=1679258532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jJGJM1cl0CwVLyP5HdISCyaVwedg8PsN2zQaA21I82w=;
 b=mUnHt4mDWq4S/vgztJowYqh0EvLK9HJnK1W8q6NfmG9hmFnlpbjcsBte
 82R/0KwTxDd0IpyHTshbRj1/WRzA0rZ46t5yKF1lM/g7UFjvLWrTl1D/0
 TpvJcpEqxNU9lVsTbLpnsem05RVR6042Mvh6zKXz/6GZV6SuEDps4GaYf
 WvFDE8EJHLGMyPWmdsbSf9LHaobxglNRPTRetDkocbfLZagMG4anD19IJ
 az5Fv7vcj40kU2WA7u0mP8Eg/ZPiZyasrdIQkzUKjx9ivq5spF3YuY1bJ
 rbkI+nxcOl/+o8rkxEfeqmPDl+mfrfdIliVS7/0iA8rvJ7J9BsMmkeEAm A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="237270104"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="237270104"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 13:42:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="559245131"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 13:42:09 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 7/8] drm/i915/gem: Add extra pages in ttm_tt for ccs data
Date: Sun, 20 Mar 2022 02:12:28 +0530
Message-Id: <20220319204229.9846-8-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220319204229.9846-1-ramalingam.c@intel.com>
References: <20220319204229.9846-1-ramalingam.c@intel.com>
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
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Xe-HP and later devices, dedicated compression control state (CCS)
stored in local memory is used for each surface, to support the
3D and media compression formats.

The memory required for the CCS of the entire local memory is 1/256 of
the local memory size. So before the kernel boot, the required memory
is reserved for the CCS data and a secure register will be programmed
with the CCS base address

So when an object is allocated in local memory, dont need to explicitly
allocate the space for ccs data. But when the obj is evicted into the
smem, to hold the compression related data along with the obj extra space
is needed in smem. i.e obj_size + (obj_size/256).

Hence when a smem pages are allocated for an obj with lmem placement
possibility we create with the extra pages required for the ccs data for
the obj size.

v2:
  Used imperative wording [Thomas]
v3:
  Inflate the pages only when obj's placement is lmem only

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Christian Koenig <christian.koenig@amd.com>
cc: Hellstrom Thomas <thomas.hellstrom@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 29 ++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 3b9f99c765c4..0305a150b9d4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -20,6 +20,7 @@
 #include "gem/i915_gem_ttm.h"
 #include "gem/i915_gem_ttm_move.h"
 #include "gem/i915_gem_ttm_pm.h"
+#include "gt/intel_gpu_commands.h"
 
 #define I915_TTM_PRIO_PURGE     0
 #define I915_TTM_PRIO_NO_PAGES  1
@@ -262,12 +263,33 @@ static const struct i915_refct_sgt_ops tt_rsgt_ops = {
 	.release = i915_ttm_tt_release
 };
 
+static inline bool
+i915_gem_object_needs_ccs_pages(struct drm_i915_gem_object *obj)
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
 static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 					 uint32_t page_flags)
 {
+	struct drm_i915_private *i915 = container_of(bo->bdev, typeof(*i915),
+						     bdev);
 	struct ttm_resource_manager *man =
 		ttm_manager_type(bo->bdev, bo->resource->mem_type);
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
+	unsigned long ccs_pages = 0;
 	enum ttm_caching caching;
 	struct i915_ttm_tt *i915_tt;
 	int ret;
@@ -290,7 +312,12 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 		i915_tt->is_shmem = true;
 	}
 
-	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching, 0);
+	if (HAS_FLAT_CCS(i915) && i915_gem_object_needs_ccs_pages(obj))
+		ccs_pages = DIV_ROUND_UP(DIV_ROUND_UP(bo->base.size,
+						      NUM_BYTES_PER_CCS_BYTE),
+					 PAGE_SIZE);
+
+	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching, ccs_pages);
 	if (ret)
 		goto err_free;
 
-- 
2.20.1

