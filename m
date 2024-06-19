Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F16590F444
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 18:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF2010ED3D;
	Wed, 19 Jun 2024 16:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SG879SSc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920EB10ED3D;
 Wed, 19 Jun 2024 16:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718815162; x=1750351162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nY7yJPzmSLfJ/mivxtbZ2fAN6/uXiLa7D2JywBJLExo=;
 b=SG879SSc++yZNkXS5fK0+35AS0fsf5eF6IOGYXPnjXdWLHzc3LLT3Aeh
 Dti0Xl64X/yrcbsg/93ZBGGxV/Qv6tO2Y5H5KPRHK09bke8kbYHGweP1s
 SIDqeRUNIuVkTDXUbvTCdAkstEC7Ayu3ACFerwc5jAEZoOiZvsX5V5yXk
 uVGseACWg59DxhFbFOh6U1ImnVnBLLrgd1fqi03zJ6HBHB0uaAjB+ix2u
 5j/thY1QPju7WUjONiAg6rlE+Iu+lpD3vcZh8GpBMcu3dYkUfcpddH/wC
 6wTvNj9KswXFr4wTU4Q2cdgktsvihOc65Hadck+t8VFqD3i4AnYunI9Qk w==;
X-CSE-ConnectionGUID: uufw+mXZSnCK8HxZsz8iDQ==
X-CSE-MsgGUID: dkzWZ1OESXqrKYUgBtF1EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="18679323"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="18679323"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 09:39:21 -0700
X-CSE-ConnectionGUID: oN1lX0aLR1GiO1Y1UCznuA==
X-CSE-MsgGUID: A9W/D1oNRMydMYKIX0UvYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="41929660"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.179])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 09:39:17 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Pallavi Mishra <pallavi.mishra@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Effie Yu <effie.yu@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jose Souza <jose.souza@intel.com>, Michal Mrozek <michal.mrozek@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/xe: Use write-back caching mode for system memory on DGFX
Date: Wed, 19 Jun 2024 18:39:04 +0200
Message-ID: <20240619163904.2935-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

The caching mode for buffer objects with VRAM as a possible
placement was forced to write-combined, regardless of placement.

However, write-combined system memory is expensive to allocate and
even though it is pooled, the pool is expensive to shrink, since
it involves global CPU TLB flushes.

Moreover write-combined system memory from TTM is only reliably
available on x86 and DGFX doesn't have an x86 restriction.

So regardless of the cpu caching mode selected for a bo,
internally use write-back caching mode for system memory on DGFX.

Coherency is maintained, but user-space clients may perceive a
difference in cpu access speeds.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Fixes: 622f709ca629 ("drm/xe/uapi: Add support for CPU caching mode")
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Effie Yu <effie.yu@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Jose Souza <jose.souza@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_bo.c       | 47 +++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_bo_types.h |  3 +-
 include/uapi/drm/xe_drm.h        |  8 +++++-
 3 files changed, 37 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 65c696966e96..31192d983d9e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -343,7 +343,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 	struct xe_device *xe = xe_bo_device(bo);
 	struct xe_ttm_tt *tt;
 	unsigned long extra_pages;
-	enum ttm_caching caching;
+	enum ttm_caching caching = ttm_cached;
 	int err;
 
 	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
@@ -357,26 +357,35 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 		extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, bo->size),
 					   PAGE_SIZE);
 
-	switch (bo->cpu_caching) {
-	case DRM_XE_GEM_CPU_CACHING_WC:
-		caching = ttm_write_combined;
-		break;
-	default:
-		caching = ttm_cached;
-		break;
-	}
-
-	WARN_ON((bo->flags & XE_BO_FLAG_USER) && !bo->cpu_caching);
-
 	/*
-	 * Display scanout is always non-coherent with the CPU cache.
-	 *
-	 * For Xe_LPG and beyond, PPGTT PTE lookups are also non-coherent and
-	 * require a CPU:WC mapping.
+	 * DGFX system memory is always WB / ttm_cached, since
+	 * other caching modes are only supported on x86. DGFX
+	 * GPU system memory accesses are always coherent with the
+	 * CPU.
 	 */
-	if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
-	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_FLAG_PAGETABLE))
-		caching = ttm_write_combined;
+	if (!IS_DGFX(xe)) {
+		switch (bo->cpu_caching) {
+		case DRM_XE_GEM_CPU_CACHING_WC:
+			caching = ttm_write_combined;
+			break;
+		default:
+			caching = ttm_cached;
+			break;
+		}
+
+		WARN_ON((bo->flags & XE_BO_FLAG_USER) && !bo->cpu_caching);
+
+		/*
+		 * Display scanout is always non-coherent with the CPU cache.
+		 *
+		 * For Xe_LPG and beyond, PPGTT PTE lookups are also
+		 * non-coherent and require a CPU:WC mapping.
+		 */
+		if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
+		    (xe->info.graphics_verx100 >= 1270 &&
+		     bo->flags & XE_BO_FLAG_PAGETABLE))
+			caching = ttm_write_combined;
+	}
 
 	if (bo->flags & XE_BO_FLAG_NEEDS_UC) {
 		/*
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 86422e113d39..10450f1fbbde 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -66,7 +66,8 @@ struct xe_bo {
 
 	/**
 	 * @cpu_caching: CPU caching mode. Currently only used for userspace
-	 * objects.
+	 * objects. Exceptions are system memory on DGFX, which is always
+	 * WB.
 	 */
 	u16 cpu_caching;
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 93e00be44b2d..1189b3044723 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -783,7 +783,13 @@ struct drm_xe_gem_create {
 #define DRM_XE_GEM_CPU_CACHING_WC                      2
 	/**
 	 * @cpu_caching: The CPU caching mode to select for this object. If
-	 * mmaping the object the mode selected here will also be used.
+	 * mmaping the object the mode selected here will also be used. The
+	 * exception is when mapping system memory (including evicted
+	 * system memory) on discrete GPUs. The caching mode selected will
+	 * then be overridden to DRM_XE_GEM_CPU_CACHING_WB, and coherency
+	 * between GPU- and CPU is guaranteed. The caching mode of
+	 * existing CPU-mappings will be updated transparently to
+	 * user-space clients.
 	 */
 	__u16 cpu_caching;
 	/** @pad: MBZ */
-- 
2.44.0

