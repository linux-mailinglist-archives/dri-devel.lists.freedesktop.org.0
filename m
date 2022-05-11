Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA795228BB
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 03:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE3610E2E9;
	Wed, 11 May 2022 01:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706CC10E270;
 Wed, 11 May 2022 01:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652231511; x=1683767511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UyVcf5nZHWO8xkKbUWH9mwih+BrTrIcz4jn40EOW78E=;
 b=hEfb45cPvAlbXRVJ/qJtk0AsvVGfHeqZLELA5klKljXb0VlXTgN2g/fI
 8UV+7vQta1uMbx0AXmPEfFuBXKgmTbLUEe8l5AMF+o0wUAiB0pdfZ/ifp
 MXFCcldy8e12mELItT2jh2HkVD0i2+FZ1ZttFLyXbSj+vnSHTq/yvglFm
 crYByTYkBwUrfK/9LuDoDdzb5gFVx/71Vvj0sWETBan5f6Clu4XNK3S4l
 xVpex1SQlccG1HeO3vuf6HhyQhihy5Gig0iL3Trb5cpKtP1k/dfAyGB3R
 +U55K5e+/7woUldriochs3akhdI/4rLrk60qPmu6fdvWG/7gxRJ/7Vsol w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="249446395"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="249446395"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 18:11:47 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="542067952"
Received: from ymmonter-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.249.32.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 18:11:44 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 2/3] drm/i915/gem: Flush TLBs for all the tiles when
 clearing an obj
Date: Wed, 11 May 2022 03:11:20 +0200
Message-Id: <20220511011121.114226-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511011121.114226-1-andi.shyti@linux.intel.com>
References: <20220511011121.114226-1-andi.shyti@linux.intel.com>
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
 1 file changed, 9 insertions(+), 3 deletions(-)

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
-- 
2.36.1

