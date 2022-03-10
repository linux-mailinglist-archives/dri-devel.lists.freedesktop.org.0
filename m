Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95854D46EC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 13:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB1910EAF2;
	Thu, 10 Mar 2022 12:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBEA10EAC2;
 Thu, 10 Mar 2022 12:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646915309; x=1678451309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bWnB1eeU4C7I17oPteuIHEN4bwXKfJOkVRL1nnP6O3o=;
 b=Q+CrfatQqYvAxzp5COyraf+lrs63GLMyuyfVagLE5/Y7WQLRVLkcJoU1
 ZtoWRlnuULy7hLawKJdp1cAieJnGEE2wR6zTa7XFZGyDvA85F+zYVyaDg
 KU2JWFaAtiOLQulZ0OkSsdac0HdtfBDx7IcJ8P5HoWdBHsBAiz2uI4IK/
 ziqPW0pRq9F4BjcIjFD70WBm5N0/OdUcn0eO5pa/UyeIomfeG/7EE2FMy
 yoaD6Z6fZkx1vcUruPHyxxmQpGHF1RCcZzyZmEeTq8lemATdFIrCItWvM
 Ha0lsuFhG7kobY8BOUWXVd7cIKSVw8sVOLwhShrGjCV0x8Wr6W+7PJOwW A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="341665182"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="341665182"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 04:28:29 -0800
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="496237745"
Received: from tcuddihy-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.3.1])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 04:28:28 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 7/8] drm/i915: fixup the initial fb base on DG1
Date: Thu, 10 Mar 2022 12:27:50 +0000
Message-Id: <20220310122751.89693-8-matthew.auld@intel.com>
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

The offset we get looks to be the exact start of DSM, but the
inital_plane_vma expects the address to be relative.

v2(Ville):
  - The base is actually the pre-programmed GGTT address, which is then
    meant to 1:1 map to somewhere inside dsm. In the case of dgpu the
    base looks to just be some offset within lmem, but this also happens
    to be the exact dsm start, on dg1. Therefore we should only need to
    fudge the physical address, before allocating from stolen.
  - Bail if it's not located in dsm.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/intel_plane_initial.c    | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index f797fcef18fc..2aebde02ff57 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -50,7 +50,7 @@ initial_plane_vma(struct drm_i915_private *i915,
 	struct intel_memory_region *mem = i915->mm.stolen_region;
 	struct drm_i915_gem_object *obj;
 	struct i915_vma *vma;
-	u32 base, size;
+	u32 base, phys_base, size;
 	u64 pinctl;
 
 	if (!mem || plane_config->size == 0)
@@ -71,8 +71,25 @@ initial_plane_vma(struct drm_i915_private *i915,
 	    size * 2 > i915->stolen_usable_size)
 		return NULL;
 
+	/*
+	 * On discrete, it looks like the GGTT base address should 1:1 map to
+	 * somewhere in lmem. On DG1 for some reason this intersects with the
+	 * exact start of DSM(possibly due to small lmem size), in which case we
+	 * need to allocate it directly from stolen, which means fudging the
+	 * physical address to be relative to the start of DSM.  In such cases
+	 * we might also need to choose between initial fb vs fbc, if space is
+	 * limited.
+	 */
+	phys_base = base;
+	if (IS_DG1(i915)) {
+		if (WARN_ON(phys_base < i915->dsm.start))
+			return NULL;
+
+		phys_base -= i915->dsm.start;
+	}
+
 	obj = i915_gem_object_create_region_at(i915->mm.stolen_region,
-					       base, size, 0);
+					       phys_base, size, 0);
 	if (IS_ERR(obj))
 		return NULL;
 
-- 
2.34.1

