Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779D19283B3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 10:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE07110E0F9;
	Fri,  5 Jul 2024 08:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4SVip75";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5171A10E0F9;
 Fri,  5 Jul 2024 08:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720168348; x=1751704348;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mqLRPh53x9W+uD0JW3Eqwkg1JtY32i/PPHv1dQBflH4=;
 b=j4SVip75Fx0TV5LHwE/YWOUOz77912SwCQ3hLEtCqrm+0KnstLoWGbs8
 yI+QP2aanmZj3HqlBuagx6AVLerxgB1yVfBizH8VM6KaKtmNpEw5av5nw
 geDUynLvDa9+HbrRIpK3uUJQlHw2FEm73c2o8ndiDNlUrmRvz7IPbT4ah
 QHTB/mevPsP2Q63CL0kJART+0yQLYYYCu0IFFc+JcOWSp3MW7/wmEeH3O
 wpmsfE9/CIsqtPTHl2t5ZPSwb/hzCtwjOqYMLiXfkx5/l9IbHZ5oERWhJ
 F378HK0huGuJ4RB1637830gtIvSLr+YV1TM6GEwV/pP2NNwUYku7YJwIM Q==;
X-CSE-ConnectionGUID: 58tsmNwZSMqH9S2l4JOoig==
X-CSE-MsgGUID: hFSlNRUWQPq0ENEcxhVc9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17272221"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="17272221"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 01:32:28 -0700
X-CSE-ConnectionGUID: 6LVlaDtqTq+gqddt/CTvGA==
X-CSE-MsgGUID: hGq/FCZDS5Sta886KSqOGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="51768616"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.166])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 01:32:25 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Pallavi Mishra <pallavi.mishra@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Effie Yu <effie.yu@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jose Souza <jose.souza@intel.com>, Michal Mrozek <michal.mrozek@intel.com>,
 stable@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/xe: Use write-back caching mode for system memory on
 DGFX
Date: Fri,  5 Jul 2024 10:32:14 +0200
Message-ID: <20240705083214.307860-1-thomas.hellstrom@linux.intel.com>
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

v2:
- Update RB- and Ack tags.
- Rephrase wording in xe_drm.h (Matt Roper)

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
Acked-by: Matthew Auld <matthew.auld@intel.com>
Acked-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Fixes: 622f709ca629 ("drm/xe/uapi: Add support for CPU caching mode")
Acked-by: Michal Mrozek <michal.mrozek@intel.com>
Acked-by: Effie Yu <effie.yu@intel.com> #On chat
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
index 02d68873558a..ebc8abf7930a 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -68,7 +68,8 @@ struct xe_bo {
 
 	/**
 	 * @cpu_caching: CPU caching mode. Currently only used for userspace
-	 * objects.
+	 * objects. Exceptions are system memory on DGFX, which is always
+	 * WB.
 	 */
 	u16 cpu_caching;
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 33544ef78d3e..83474125f3db 100644
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

