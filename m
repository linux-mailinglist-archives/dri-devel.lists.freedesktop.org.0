Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51E04D5B76
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 07:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CF510E368;
	Fri, 11 Mar 2022 06:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114A610E22D;
 Fri, 11 Mar 2022 06:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646979355; x=1678515355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SweCQKQpJ8nzFPVZTn+F+67Vc3pdTHsJccHrZnoXbgw=;
 b=YEMpKOx34o7qgLnIdalgnyRYQ8VbIkOLCjl+3e/mSild1YY8EQLZ5x70
 HksmWWV0EMjTVK5svqrBzkfeaQyZWPMEJNAHxS6/yMmcRC/jBT2iTmfWZ
 ZJcQFXsxsyWuRnMyiRClx82MGbRIZ2srWNrweptZDTkRXu1PoYtXft80s
 YjDpso3Hm5qpKKi4ZDFb2LEp1fUPiIKMX4cPKbJK4KnB2LhqtD2/Z8+H6
 7fG0CPUaQD+N4S4gVK3UbI/433Kk/Xk4Wmh00HngkdDxIkFDzsdK0/G/K
 K+7Bl7y0FtJxes4mCmAIoVOc7GzSuQrU4/iiiygxx+3zLVkNLlQBqE9Ns Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="316231250"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; d="scan'208";a="316231250"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 22:15:54 -0800
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; d="scan'208";a="538885124"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 22:15:54 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/xehp: Update topology dumps for Xe_HP
Date: Thu, 10 Mar 2022 22:15:43 -0800
Message-Id: <20220311061543.153611-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311061543.153611-1-matthew.d.roper@intel.com>
References: <20220311061543.153611-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When running on Xe_HP or beyond, let's use an updated format for
describing topology in our error state dumps and debugfs to give a
more accurate view of the hardware:

 - Just report DSS directly without the legacy "slice0" output that's no
   longer meaningful.
 - Indicate whether each DSS is accessible for geometry and/or compute.
 - Rename "rcs_topology" to "sseu_topology" since the information
   reported is common to both RCS and CCS engines now.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_sseu.c         | 48 +++++++++++++++++---
 drivers/gpu/drm/i915/gt/intel_sseu.h         |  3 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c |  8 ++--
 drivers/gpu/drm/i915/i915_gpu_error.c        |  2 +-
 4 files changed, 48 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index 614915ffbd37..4d28458ab768 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -10,6 +10,8 @@
 #include "intel_gt_regs.h"
 #include "intel_sseu.h"
 
+#include "linux/string_helpers.h"
+
 void intel_sseu_set_info(struct sseu_dev_info *sseu, u8 max_slices,
 			 u8 max_subslices, u8 max_eus_per_subslice)
 {
@@ -54,6 +56,11 @@ u32 intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice)
 	return _intel_sseu_get_subslices(sseu, sseu->subslice_mask, slice);
 }
 
+u32 intel_sseu_get_geometry_subslices(const struct sseu_dev_info *sseu)
+{
+	return _intel_sseu_get_subslices(sseu, sseu->geometry_subslice_mask, 0);
+}
+
 u32 intel_sseu_get_compute_subslices(const struct sseu_dev_info *sseu)
 {
 	return _intel_sseu_get_subslices(sseu, sseu->compute_subslice_mask, 0);
@@ -720,16 +727,11 @@ void intel_sseu_dump(const struct sseu_dev_info *sseu, struct drm_printer *p)
 		   str_yes_no(sseu->has_eu_pg));
 }
 
-void intel_sseu_print_topology(const struct sseu_dev_info *sseu,
-			       struct drm_printer *p)
+static void intel_sseu_print_legacy_topology(const struct sseu_dev_info *sseu,
+					     struct drm_printer *p)
 {
 	int s, ss;
 
-	if (sseu->max_slices == 0) {
-		drm_printf(p, "Unavailable\n");
-		return;
-	}
-
 	for (s = 0; s < sseu->max_slices; s++) {
 		drm_printf(p, "slice%d: %u subslice(s) (0x%08x):\n",
 			   s, intel_sseu_subslices_per_slice(sseu, s),
@@ -744,6 +746,38 @@ void intel_sseu_print_topology(const struct sseu_dev_info *sseu,
 	}
 }
 
+static void intel_sseu_print_xehp_topology(const struct sseu_dev_info *sseu,
+					   struct drm_printer *p)
+{
+	u32 g_dss_mask = intel_sseu_get_geometry_subslices(sseu);
+	u32 c_dss_mask = intel_sseu_get_compute_subslices(sseu);
+	int dss;
+
+	for (dss = 0; dss < sseu->max_subslices; dss++) {
+		u16 enabled_eus = sseu_get_eus(sseu, 0, dss);
+
+		drm_printf(p, "DSS%02d: G:%3s C:%3s, %2u EUs (0x%04hx)\n", dss,
+			   str_yes_no(g_dss_mask & BIT(dss)),
+			   str_yes_no(c_dss_mask & BIT(dss)),
+			   hweight16(enabled_eus), enabled_eus);
+	}
+}
+
+
+void intel_sseu_print_topology(struct drm_i915_private *i915,
+			       const struct sseu_dev_info *sseu,
+			       struct drm_printer *p)
+{
+	if (sseu->max_slices == 0) {
+		drm_printf(p, "Unavailable\n");
+		return;
+	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
+		intel_sseu_print_xehp_topology(sseu, p);
+	} else {
+		intel_sseu_print_legacy_topology(sseu, p);
+	}
+}
+
 u16 intel_slicemask_from_dssmask(u64 dss_mask, int dss_per_slice)
 {
 	u16 slice_mask = 0;
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
index 4f59eadbb61a..fe22ea9bb213 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.h
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
@@ -139,7 +139,8 @@ u32 intel_sseu_make_rpcs(struct intel_gt *gt,
 			 const struct intel_sseu *req_sseu);
 
 void intel_sseu_dump(const struct sseu_dev_info *sseu, struct drm_printer *p);
-void intel_sseu_print_topology(const struct sseu_dev_info *sseu,
+void intel_sseu_print_topology(struct drm_i915_private *i915,
+			       const struct sseu_dev_info *sseu,
 			       struct drm_printer *p);
 
 u16 intel_slicemask_from_dssmask(u64 dss_mask, int dss_per_slice);
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
index a9d5bc49f361..6b944de48666 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
@@ -287,22 +287,22 @@ static int sseu_status_show(struct seq_file *m, void *unused)
 }
 DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(sseu_status);
 
-static int rcs_topology_show(struct seq_file *m, void *unused)
+static int sseu_topology_show(struct seq_file *m, void *unused)
 {
 	struct intel_gt *gt = m->private;
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	intel_sseu_print_topology(&gt->info.sseu, &p);
+	intel_sseu_print_topology(gt->i915, &gt->info.sseu, &p);
 
 	return 0;
 }
-DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(rcs_topology);
+DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(sseu_topology);
 
 void intel_sseu_debugfs_register(struct intel_gt *gt, struct dentry *root)
 {
 	static const struct intel_gt_debugfs_file files[] = {
 		{ "sseu_status", &sseu_status_fops, NULL },
-		{ "rcs_topology", &rcs_topology_fops, NULL },
+		{ "sseu_topology", &sseu_topology_fops, NULL },
 	};
 
 	intel_gt_debugfs_register_files(root, files, ARRAY_SIZE(files), gt);
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 5e09a4e4b01a..44ff2b899893 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -712,7 +712,7 @@ static void err_print_gt_info(struct drm_i915_error_state_buf *m,
 	struct drm_printer p = i915_error_printer(m);
 
 	intel_gt_info_print(&gt->info, &p);
-	intel_sseu_print_topology(&gt->info.sseu, &p);
+	intel_sseu_print_topology(gt->_gt->i915, &gt->info.sseu, &p);
 }
 
 static void err_print_gt(struct drm_i915_error_state_buf *m,
-- 
2.34.1

