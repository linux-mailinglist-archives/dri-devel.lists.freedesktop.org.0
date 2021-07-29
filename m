Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 873143DA1F5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 13:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF846ED27;
	Thu, 29 Jul 2021 11:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C476ED27;
 Thu, 29 Jul 2021 11:19:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="193136694"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="193136694"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 04:19:00 -0700
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="438234708"
Received: from eoghanru-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.215.170])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 04:18:58 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Use Transparent Hugepages when IOMMU is enabled
Date: Thu, 29 Jul 2021 12:18:48 +0100
Message-Id: <20210729111848.729888-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210729111848.729888-1-tvrtko.ursulin@linux.intel.com>
References: <20210729111848.729888-1-tvrtko.ursulin@linux.intel.com>
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
can be almost eliminated by turning them on, lets do that by adding a
couple of Kconfig options.

To err on the side of safety we keep the current default in cases where
IOMMU is not active, and only when it is default to the "huge=within_size"
mode. Although there probably would be wins to enable them throughout,
more extensive testing across benchmarks and platforms would need to be
done.

With the patch and IOMMU enabled my local testing on a small Skylake part
shows OglVSTangent regression being reduced from ~14% to ~2%.

v2:
 * Add Kconfig dependency to transparent hugepages and some help text.
 * Move to helper for easier handling of kernel build options.

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
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1
---
 drivers/gpu/drm/i915/Kconfig.profile  | 73 +++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gemfs.c | 27 ++++++++--
 2 files changed, 97 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.profile b/drivers/gpu/drm/i915/Kconfig.profile
index 39328567c200..d49ee794732f 100644
--- a/drivers/gpu/drm/i915/Kconfig.profile
+++ b/drivers/gpu/drm/i915/Kconfig.profile
@@ -119,3 +119,76 @@ config DRM_I915_TIMESLICE_DURATION
 	  /sys/class/drm/card?/engine/*/timeslice_duration_ms
 
 	  May be 0 to disable timeslicing.
+
+choice
+	prompt "Transparent Hugepage Support (native)"
+	default DRM_I915_THP_NATIVE_NEVER
+	depends on TRANSPARENT_HUGEPAGE
+	help
+	  Select the preferred method for allocating from Transparent Hugepages
+	  when IOMMU is not enabled.
+
+	config DRM_I915_THP_NATIVE_NEVER
+	bool "Never"
+	help
+	  Disable using THP for system memory allocations, individually
+	  allocating each 4K chunk as a separate page. It is unlikely that such
+	  individual allocations will return contiguous memory.
+
+	config DRM_I915_THP_NATIVE_WITHIN
+	bool "Within size"
+	help
+	  Allocate whole 2M superpages while those chunks do not exceed the
+	  object size. The remainder of the object will be allocated from 4K
+	  pages. No overallocation.
+
+	config DRM_I915_THP_NATIVE_ALWAYS
+	bool "Always"
+	help
+	  Allocate the whole object using 2M superpages, even if the object does
+	  not require an exact number of superpages.
+
+endchoice
+
+config DRM_I915_THP_NATIVE
+	string
+	default "always" if DRM_I915_THP_NATIVE_ALWAYS
+	default "within_size" if DRM_I915_THP_NATIVE_WITHIN
+	default "never" if DRM_I915_THP_NATIVE_NEVER
+
+choice
+	prompt "Transparent Hugepage Support (IOMMU)"
+	default DRM_I915_THP_IOMMU_WITHIN if TRANSPARENT_HUGEPAGE=y
+	default DRM_I915_THP_IOMMU_NEVER if TRANSPARENT_HUGEPAGE=n
+	depends on TRANSPARENT_HUGEPAGE
+	help
+	  Select the preferred method for allocating from Transparent Hugepages
+	  with IOMMU active.
+
+	config DRM_I915_THP_IOMMU_NEVER
+	bool "Never"
+	help
+	  Disable using THP for system memory allocations, individually
+	  allocating each 4K chunk as a separate page. It is unlikely that such
+	  individual allocations will return contiguous memory.
+
+	config DRM_I915_THP_IOMMU_WITHIN
+	bool "Within size"
+	help
+	  Allocate whole 2M superpages while those chunks do not exceed the
+	  object size. The remainder of the object will be allocated from 4K
+	  pages. No overallocation.
+
+	config DRM_I915_THP_IOMMU_ALWAYS
+	bool "Always"
+	help
+	  Allocate the whole object using 2M superpages, even if the object does
+	  not require an exact number of superpages.
+
+endchoice
+
+config DRM_I915_THP_IOMMU
+	string
+	default "always" if DRM_I915_THP_IOMMU_ALWAYS
+	default "within_size" if DRM_I915_THP_IOMMU_WITHIN
+	default "never" if DRM_I915_THP_IOMMU_NEVER
diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915/gem/i915_gemfs.c
index 5e6e8c91ab38..871cbfb02fdf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
+++ b/drivers/gpu/drm/i915/gem/i915_gemfs.c
@@ -11,6 +11,26 @@
 #include "i915_drv.h"
 #include "i915_gemfs.h"
 
+#if defined(CONFIG_DRM_I915_THP_NATIVE) && defined(CONFIG_DRM_I915_THP_IOMMU)
+static char *gemfd_mount_opts(struct drm_i915_private *i915)
+{
+	static char thp_native[] = "huge=" CONFIG_DRM_I915_THP_NATIVE;
+	static char thp_iommu[] = "huge=" CONFIG_DRM_I915_THP_IOMMU;
+	char *opts;
+
+	opts = intel_vtd_active() ? thp_iommu : thp_native;
+	drm_info(&i915->drm, "Transparent Hugepage mode '%s'", opts);
+
+	return opts;
+}
+#else
+static char *gemfd_mount_opts(struct drm_i915_private *i915)
+{
+	return NULL;
+}
+#endif
+
+
 int i915_gemfs_init(struct drm_i915_private *i915)
 {
 	struct file_system_type *type;
@@ -26,10 +46,11 @@ int i915_gemfs_init(struct drm_i915_private *i915)
 	 *
 	 * One example, although it is probably better with a per-file
 	 * control, is selecting huge page allocations ("huge=within_size").
-	 * Currently unused due to bandwidth issues (slow reads) on Broadwell+.
+	 * However, we only do so to offset the overhead of iommu lookups
+	 * due to bandwidth issues (slow reads) on Broadwell+.
 	 */
-
-	gemfs = kern_mount(type);
+	gemfs = vfs_kern_mount(type, SB_KERNMOUNT, type->name,
+			       gemfd_mount_opts(i915));
 	if (IS_ERR(gemfs))
 		return PTR_ERR(gemfs);
 
-- 
2.30.2

