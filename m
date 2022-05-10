Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E37D552258E
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 22:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B288410E129;
	Tue, 10 May 2022 20:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCA810E129;
 Tue, 10 May 2022 20:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652214853; x=1683750853;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Oy/++T9BHOur+7IdPgOPq1tdjlRJk7qojYZOvT6HYM=;
 b=JjIvrJ//PmgeoINw2hWsRk3vAytZDfvBVaxcORejrOVhxvSlTFz82H5c
 3cok0ECbcaQfs4XElDmnP2v4ZWYAxvzxG7jOMq+4D8cZOaE0BwBIWiDAm
 TOhmRrkv4qKvCoWNK2LSWbIZ+zNlNVLohv/YrLGyDUKToA1Xgwpp3NMxg
 ZeQ5zetFaFLHqazZwgtv1LxgF1WnIYRDoP265MLTIP70+a1m6SHu6SKoN
 yOZoVYJv15fj5cgpBq059mXBBxPVBiUIl3LE6udIhkEvnflEQFKx02h5u
 0CncjQuP9wpypoaxyOaOTflnG6SWswRhNLLn2dMpkqAZ84uJ7slXLlL2e A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="269633563"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="269633563"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 13:34:12 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="565829024"
Received: from brauta-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.50.37])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 13:34:09 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/gem: Flush TLBs for all the tiles
Date: Tue, 10 May 2022 22:33:59 +0200
Message-Id: <20220510203359.92530-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.36.0
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
 drivers/gpu/drm/i915/gem/i915_gem_pages.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 97c820eee115a..444b9f96ba77c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -217,10 +217,15 @@ __i915_gem_object_unset_pages(struct drm_i915_gem_object *obj)
 
 	if (test_and_clear_bit(I915_BO_WAS_BOUND_BIT, &obj->flags)) {
 		struct drm_i915_private *i915 = to_i915(obj->base.dev);
-		intel_wakeref_t wakeref;
+		struct intel_gt *gt;
+		int i;
 
-		with_intel_runtime_pm_if_active(&i915->runtime_pm, wakeref)
-			intel_gt_invalidate_tlbs(to_gt(i915));
+		for_each_gt(gt, i915, i) {
+			intel_wakeref_t w;
+
+			with_intel_runtime_pm_if_active(gt->uncore->rpm, w)
+				intel_gt_invalidate_tlbs(gt);
+		}
 	}
 
 	return pages;
-- 
2.36.0

