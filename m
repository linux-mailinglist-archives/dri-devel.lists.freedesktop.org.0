Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58859522660
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 23:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F126B10E1B1;
	Tue, 10 May 2022 21:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7134710E1B1;
 Tue, 10 May 2022 21:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652218419; x=1683754419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8Lg/qFI8YCDh3drp3SQBXA/kUsVpG1F4olW0foZVpH0=;
 b=nMuj23UjjbINZ12b5AcbeIvEDxGeop3pApxxJPTkBEKSFvwhdJZB32N8
 Qtzo1GqJb3nEIP+jd9RXIDfaS5ATfVGJlresgSkCqlrwsADzgTrdTPLn1
 XTqJlpV8xBjnonNaeLk7I0s85+hySdAQisYhcapRsYkZUUcO6EBjs6i7/
 cU2y1gUg1M5QlSlYCTRmSlfpJbrUdoPDGZiBl0Ze1PVPZ5tN9LUvNiTLT
 jbSVkoPXr9vJsxK9vk1sC08knGPShSVIjeEIyrgoLxD53pgtQ3Mf4N/H5
 NT9b68heqYZ14Lt7660wJPUKklMZPZoMvrAwexTRm7AZkrAsmeaJjjqE/ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="250042705"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="250042705"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 14:33:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="565851352"
Received: from brauta-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.50.37])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 14:33:35 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/3] drm/i915/gem: Flush TLBs for all the tiles when
 clearing an obj
Date: Tue, 10 May 2022 23:33:03 +0200
Message-Id: <20220510213304.101055-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220510213304.101055-1-andi.shyti@linux.intel.com>
References: <20220510213304.101055-1-andi.shyti@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Andi Shyti <andi@etezian.org>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During object cleanup we invalidate the TLBs but we do it only
for gt0. Invalidate the caches for all the tiles.

Reported-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_pages.c | 12 +++++++++---
 drivers/gpu/drm/i915/gt/intel_gt_pm.h     |  2 +-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 97c820eee115a..37d23e328bd0c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -13,6 +13,7 @@
 #include "i915_gem_mman.h"
 
 #include "gt/intel_gt.h"
+#include "gt/intel_gt_pm.h"
 
 void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
 				 struct sg_table *pages,
@@ -217,10 +218,15 @@ __i915_gem_object_unset_pages(struct drm_i915_gem_object *obj)
 
 	if (test_and_clear_bit(I915_BO_WAS_BOUND_BIT, &obj->flags)) {
 		struct drm_i915_private *i915 = to_i915(obj->base.dev);
-		intel_wakeref_t wakeref;
+		struct intel_gt *gt;
+		int i;
 
-		with_intel_runtime_pm_if_active(&i915->runtime_pm, wakeref)
-			intel_gt_invalidate_tlbs(to_gt(i915));
+		for_each_gt(gt, i915, i) {
+			int tmp;
+
+			with_intel_gt_pm_if_awake(gt, tmp)
+				intel_gt_invalidate_tlbs(gt);
+		}
 	}
 
 	return pages;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
index 2654133b39f22..3b1fbce7ea369 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
@@ -55,7 +55,7 @@ static inline void intel_gt_pm_might_put(struct intel_gt *gt)
 	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
 	     intel_gt_pm_put(gt), tmp = 0)
 
-#define with_intel_gt_pm_if_awake(gt, wf) \
+#define with_intel_gt_pm_if_awake(gt, tmp) \
 	for (tmp = 1, intel_gt_pm_get_if_awake(gt); tmp; \
 	     intel_gt_pm_put(gt), tmp = 0)
 
-- 
2.36.0

