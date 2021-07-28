Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4173B3D902A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 16:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA5F89C07;
	Wed, 28 Jul 2021 14:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B85689C07;
 Wed, 28 Jul 2021 14:13:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="276455058"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="276455058"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 07:13:03 -0700
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="499235136"
Received: from evancahi-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.200.34])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 07:12:56 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Use Transparent Hugepages when IOMMU is enabled
Date: Wed, 28 Jul 2021 15:12:49 +0100
Message-Id: <20210728141249.357067-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>
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

References: b901bb89324a ("drm/i915/gemfs: enable THP")
References: 9987da4b5dcf ("drm/i915: Disable THP until we have a GPU read BW W/A")
References: https://gitlab.freedesktop.org/drm/intel/-/issues/430
Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Eero Tamminen <eero.t.tamminen@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/Kconfig.profile  | 46 +++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gemfs.c | 11 +++++--
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.profile b/drivers/gpu/drm/i915/Kconfig.profile
index 39328567c200..c64c3d39a0f9 100644
--- a/drivers/gpu/drm/i915/Kconfig.profile
+++ b/drivers/gpu/drm/i915/Kconfig.profile
@@ -119,3 +119,49 @@ config DRM_I915_TIMESLICE_DURATION
 	  /sys/class/drm/card?/engine/*/timeslice_duration_ms
 
 	  May be 0 to disable timeslicing.
+
+choice
+	prompt "Transparent Hugepage Support (native)"
+	default DRM_I915_THP_NATIVE_NEVER
+	help
+	  Select the preferred method for allocating from Transparent Hugepages
+	  when IOMMU is not enabled.
+
+	config DRM_I915_THP_NATIVE_NEVER
+	bool "Never"
+
+	config DRM_I915_THP_NATIVE_WITHIN
+	bool "Within"
+
+	config DRM_I915_THP_NATIVE_ALWAYS
+	bool "Always"
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
+	default DRM_I915_THP_IOMMU_WITHIN
+	help
+	  Select the preferred method for allocating from Transparent Hugepages
+	  with IOMMU active.
+
+	config DRM_I915_THP_IOMMU_NEVER
+	bool "Never"
+
+	config DRM_I915_THP_IOMMU_WITHIN
+	bool "Within"
+
+	config DRM_I915_THP_IOMMU_ALWAYS
+	bool "Always"
+endchoice
+
+config DRM_I915_THP_IOMMU
+	string
+	default "always" if DRM_I915_THP_IOMMU_ALWAYS
+	default "within_size" if DRM_I915_THP_IOMMU_WITHIN
+	default "never" if DRM_I915_THP_IOMMU_NEVER
diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915/gem/i915_gemfs.c
index 5e6e8c91ab38..b71d2b2d2ada 100644
--- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
+++ b/drivers/gpu/drm/i915/gem/i915_gemfs.c
@@ -13,8 +13,11 @@
 
 int i915_gemfs_init(struct drm_i915_private *i915)
 {
+	char thp_native[] = "huge=" CONFIG_DRM_I915_THP_NATIVE;
+	char thp_iommu[] = "huge=" CONFIG_DRM_I915_THP_IOMMU;
 	struct file_system_type *type;
 	struct vfsmount *gemfs;
+	char *opts;
 
 	type = get_fs_type("tmpfs");
 	if (!type)
@@ -26,15 +29,19 @@ int i915_gemfs_init(struct drm_i915_private *i915)
 	 *
 	 * One example, although it is probably better with a per-file
 	 * control, is selecting huge page allocations ("huge=within_size").
-	 * Currently unused due to bandwidth issues (slow reads) on Broadwell+.
+	 * However, we only do so to offset the overhead of iommu lookups
+	 * due to bandwidth issues (slow reads) on Broadwell+.
 	 */
+	opts = intel_vtd_active() ? thp_iommu : thp_native;
 
-	gemfs = kern_mount(type);
+	gemfs = vfs_kern_mount(type, SB_KERNMOUNT, type->name, opts);
 	if (IS_ERR(gemfs))
 		return PTR_ERR(gemfs);
 
 	i915->mm.gemfs = gemfs;
 
+	drm_info(&i915->drm, "Transparent Hugepage mode '%s'", opts);
+
 	return 0;
 }
 
-- 
2.30.2

