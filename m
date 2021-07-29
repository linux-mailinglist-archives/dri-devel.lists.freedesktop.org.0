Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CE13DA467
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 15:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679D86EDA9;
	Thu, 29 Jul 2021 13:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834596ECAB;
 Thu, 29 Jul 2021 13:34:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="209769972"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="209769972"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 06:34:33 -0700
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="438420097"
Received: from eoghanru-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.215.170])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 06:34:30 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Use Transparent Hugepages when IOMMU is enabled
Date: Thu, 29 Jul 2021 14:34:20 +0100
Message-Id: <20210729133420.770672-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210729133420.770672-1-tvrtko.ursulin@linux.intel.com>
References: <20210729133420.770672-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Eero Tamminen <eero.t.tamminen@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Usage of Transparent Hugepages was disabled in 9987da4b5dcf
("drm/i915: Disable THP until we have a GPU read BW W/A"), but since it
appears majority of performance regressions reported with an enabled IOMMU
can be almost eliminated by turning them on, lets just do that.

To err on the side of safety we keep the current default in cases where
IOMMU is not active, and only when it is default to the "huge=within_size"
mode. Although there probably would be wins to enable them throughout,
more extensive testing across benchmarks and platforms would need to be
done.

With the patch and IOMMU enabled my local testing on a small Skylake part
shows OglVSTangent regression being reduced from ~14% (IOMMU on versus
IOMMU off) to ~2% (same comparison but with THP on).

v2:
 * Add Kconfig dependency to transparent hugepages and some help text.
 * Move to helper for easier handling of kernel build options.

v3:
 * Drop Kconfig. (Daniel)

References: b901bb89324a ("drm/i915/gemfs: enable THP")
References: 9987da4b5dcf ("drm/i915: Disable THP until we have a GPU read BW W/A")
References: https://gitlab.freedesktop.org/drm/intel/-/issues/430
Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Eero Tamminen <eero.t.tamminen@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1
---
 drivers/gpu/drm/i915/gem/i915_gemfs.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915/gem/i915_gemfs.c
index 5e6e8c91ab38..dbdbdc344d87 100644
--- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
+++ b/drivers/gpu/drm/i915/gem/i915_gemfs.c
@@ -6,7 +6,6 @@
 
 #include <linux/fs.h>
 #include <linux/mount.h>
-#include <linux/pagemap.h>
 
 #include "i915_drv.h"
 #include "i915_gemfs.h"
@@ -15,6 +14,7 @@ int i915_gemfs_init(struct drm_i915_private *i915)
 {
 	struct file_system_type *type;
 	struct vfsmount *gemfs;
+	char *opts;
 
 	type = get_fs_type("tmpfs");
 	if (!type)
@@ -26,10 +26,26 @@ int i915_gemfs_init(struct drm_i915_private *i915)
 	 *
 	 * One example, although it is probably better with a per-file
 	 * control, is selecting huge page allocations ("huge=within_size").
-	 * Currently unused due to bandwidth issues (slow reads) on Broadwell+.
+	 * However, we only do so to offset the overhead of iommu lookups
+	 * due to bandwidth issues (slow reads) on Broadwell+.
 	 */
 
-	gemfs = kern_mount(type);
+	opts = NULL;
+	if (intel_vtd_active()) {
+		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
+			static char huge_opt[] = "huge=within_size"; /* r/w */
+
+			opts = huge_opt;
+			drm_info(&i915->drm,
+				 "Transparent Hugepage mode '%s'\n",
+				 opts);
+		} else {
+			drm_notice(&i915->drm,
+				   "Transparent Hugepage support is recommended for optimal performance when IOMMU is enabled!\n");
+		}
+	}
+
+	gemfs = vfs_kern_mount(type, SB_KERNMOUNT, type->name, opts);
 	if (IS_ERR(gemfs))
 		return PTR_ERR(gemfs);
 
-- 
2.30.2

