Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D54514633
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 12:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C181910FB8D;
	Fri, 29 Apr 2022 10:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD96610FB8D;
 Fri, 29 Apr 2022 10:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651226665; x=1682762665;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CdM+3sV0FXH76vc5tAAtPkNhTSKpwpX1w4eS1I2HVws=;
 b=VLqdXh8dimbdfq721kudCGCJaZIexxPy4C35Wuc4YpXLlchWa73irqJ2
 GGT8YahzuqVm1Jq7EQV5FMnmD+QmSBUsyI6hS7TSuyhVaILL8+W8tNX9M
 n574kPDm+VtYogTPw5ZKK/6PB5/LS+YO9gFIGuO7CV/fDAEmgrFJBw8Q6
 tTiIDujOyA1RaDobrMkjTUAkRFzAOYYhzz1Yha7yDwXpdCQgN1fuq3fYL
 3hdJ4W7nqxmHhnea1f48xs72oq80UExtN3a3x7CF2vKqWTU+Y6zwUNjo+
 FMP9YoVmgPwgZnouKQsdn1ZQ/DQwNoHuNV7iKCQxzCOOm+EydYu3usyvz w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="246512546"
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="246512546"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 03:04:25 -0700
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="684516764"
Received: from pfowens-mobl2.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.234.194])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 03:04:23 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: Enable THP on Icelake and beyond
Date: Fri, 29 Apr 2022 11:04:13 +0100
Message-Id: <20220429100414.647857-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
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
Cc: Eero Tamminen <eero.t.tamminen@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

We have a statement from HW designers that the GPU read regression when
using 2M pages was fixed from Icelake onwards, which was also confirmed
by bencharking Eero did last year:

"""
When IOMMU is disabled, enabling THP causes following perf changes on
TGL-H (GT1):

    10-15% SynMark Batch[0-3]
    5-10% MemBW GPU texture, SynMark ShMapVsm
    3-5% SynMark TerrainFly* + Geom* + Fill* + CSCloth + Batch4
    1-3% GpuTest Triangle, SynMark TexMem* + DeferredAA + Batch[5-7]
          + few others
    -7% MemBW GPU blend

In the above 3D benchmark names, * means all the variants of tests with
the same prefix. For example "SynMark TexMem*", means both TexMem128 &
TexMem512 tests in the synthetic (Intel internal) SynMark test suite.

In the (public, but proprietary) GfxBench & GLB(enchmark) test suites,
there are both onscreen and offscreen variants of each test. Unless
explicitly stated otherwise, numbers are for both variants.

All tests are run with FullHD monitor. All tests are fullscreen except
for GLB and GpuTest ones, which are run in 1/2 screen window (GpuTest
triangle is run both in fullscreen and 1/2 screen window).
"""

Since the only regression is MemBW GPU blend, against many more gains,
it sounds it is time to enable THP on Gen11+.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
References: https://gitlab.freedesktop.org/drm/intel/-/issues/430
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Eero Tamminen <eero.t.tamminen@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gemfs.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915/gem/i915_gemfs.c
index ee87874e59dc..c5a6bbc842fc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
+++ b/drivers/gpu/drm/i915/gem/i915_gemfs.c
@@ -28,12 +28,14 @@ int i915_gemfs_init(struct drm_i915_private *i915)
 	 *
 	 * One example, although it is probably better with a per-file
 	 * control, is selecting huge page allocations ("huge=within_size").
-	 * However, we only do so to offset the overhead of iommu lookups
-	 * due to bandwidth issues (slow reads) on Broadwell+.
+	 * However, we only do so on platforms which benefit from it, or to
+	 * offset the overhead of iommu lookups, where with latter it is a net
+	 * win even on platforms which would otherwise see some performance
+	 * regressions such a slow reads issue on Broadwell and Skylake.
 	 */
 
 	opts = NULL;
-	if (i915_vtd_active(i915)) {
+	if (GRAPHICS_VER(i915) >= 11 || i915_vtd_active(i915)) {
 		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
 			opts = huge_opt;
 			drm_info(&i915->drm,
@@ -41,7 +43,10 @@ int i915_gemfs_init(struct drm_i915_private *i915)
 				 opts);
 		} else {
 			drm_notice(&i915->drm,
-				   "Transparent Hugepage support is recommended for optimal performance when IOMMU is enabled!\n");
+				   "Transparent Hugepage support is recommended for optimal performance%s\n",
+				   GRAPHICS_VER(i915) >= 11 ?
+				   " on this platform!" :
+				   " when IOMMU is enabled!");
 		}
 	}
 
-- 
2.32.0

