Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E934D46EB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 13:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011EC10EACC;
	Thu, 10 Mar 2022 12:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3660C10EABF;
 Thu, 10 Mar 2022 12:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646915311; x=1678451311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qmPwzLect6BPSdyLUsUjAi8QUMEtHnoA2JlsTM0zXq0=;
 b=mBw9TvwDT3eGBNp7zw4ELpfp92D0E4h5W7OOoKhTo5Ajz3CnPb5r7xNy
 0XJRM5fO75xCf8gPOYsPtga2PGrLHIpDOQlEcdSQ7STcGF9O1Wx8s1dBS
 w4N4/JwU7WV7JrvtVPRQbd7EqW/QJdlVyLBbIxy8/LEE0o73JJ2JCty1y
 qIYan5RMXxWVTQmUgFcRTi8MteazFtWeXBRtT3ecpqiYZlj8DHqzdaWz4
 Xos+xCNgZGgkwa1zIOnRbyubG+DRm9FRPgq9VjZLa8OAMBDTrk9VDskcn
 tUXIOr7M8EZ5Gk4iKIYCnn9c6uHUzO3iblbEX6TS9iL9ydmZ/weHc7OQe Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="341665185"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="341665185"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 04:28:31 -0800
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="496237753"
Received: from tcuddihy-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.3.1])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 04:28:29 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 8/8] drm/i915: fixup the initial fb on DG2
Date: Thu, 10 Mar 2022 12:27:51 +0000
Message-Id: <20220310122751.89693-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310122751.89693-1-matthew.auld@intel.com>
References: <20220310122751.89693-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On DG2+ the initial fb shouldn't be placed anywhere close to DSM, and so
should just be allocated directly from LMEM.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 .../drm/i915/display/intel_plane_initial.c    | 46 +++++++++++--------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index 2aebde02ff57..12bda6604a1b 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -58,6 +58,31 @@ initial_plane_vma(struct drm_i915_private *i915,
 
 	base = round_down(plane_config->base,
 			  I915_GTT_MIN_ALIGNMENT);
+	phys_base = base;
+	if (IS_DGFX(i915)) {
+		/*
+		 * On discrete, it looks like the GGTT base address should 1:1
+		 * map to somewhere in lmem. On DG1 for some reason this
+		 * intersects with the exact start of DSM(possibly due to small
+		 * lmem size), in which case we need to allocate it directly
+		 * from stolen, which means fudging the physical address to be
+		 * relative to the start of DSM.  In such cases we might also
+		 * need to choose between initial fb vs fbc, if space is
+		 * limited.
+		 *
+		 * On future discrete HW, like DG2, we should be able to just
+		 * allocate directly from lmem it seems.
+		 */
+		if (IS_DG1(i915)) {
+			if (WARN_ON(phys_base < i915->dsm.start))
+				return NULL;
+
+			phys_base -= i915->dsm.start;
+		} else {
+			mem = i915->mm.regions[INTEL_REGION_LMEM];
+		}
+	}
+
 	size = round_up(plane_config->base + plane_config->size,
 			mem->min_page_size);
 	size -= base;
@@ -68,28 +93,11 @@ initial_plane_vma(struct drm_i915_private *i915,
 	 * features.
 	 */
 	if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
+	    mem == i915->mm.stolen_region &&
 	    size * 2 > i915->stolen_usable_size)
 		return NULL;
 
-	/*
-	 * On discrete, it looks like the GGTT base address should 1:1 map to
-	 * somewhere in lmem. On DG1 for some reason this intersects with the
-	 * exact start of DSM(possibly due to small lmem size), in which case we
-	 * need to allocate it directly from stolen, which means fudging the
-	 * physical address to be relative to the start of DSM.  In such cases
-	 * we might also need to choose between initial fb vs fbc, if space is
-	 * limited.
-	 */
-	phys_base = base;
-	if (IS_DG1(i915)) {
-		if (WARN_ON(phys_base < i915->dsm.start))
-			return NULL;
-
-		phys_base -= i915->dsm.start;
-	}
-
-	obj = i915_gem_object_create_region_at(i915->mm.stolen_region,
-					       phys_base, size, 0);
+	obj = i915_gem_object_create_region_at(mem, phys_base, size, 0);
 	if (IS_ERR(obj))
 		return NULL;
 
-- 
2.34.1

