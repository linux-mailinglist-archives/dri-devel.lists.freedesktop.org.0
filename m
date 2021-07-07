Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B153BEDBE
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 20:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F2B6E871;
	Wed,  7 Jul 2021 18:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2B36E1A4;
 Wed,  7 Jul 2021 18:13:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="209316966"
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; d="scan'208";a="209316966"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 11:13:46 -0700
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; d="scan'208";a="457570323"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 11:13:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915: finish INTEL_GEN and friends conversion
Date: Wed,  7 Jul 2021 11:13:24 -0700
Message-Id: <20210707181325.2130821-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707181325.2130821-1-lucas.demarchi@intel.com>
References: <20210707181325.2130821-1-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 161058fb899e ("drm/i915: Add remaining conversions to GRAPHICS_VER")
did the last conversions to the new macros for version checks, but some
some changes sneaked in to use INTEL_GEN. Remove the last users so
we can remove the macros.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 3 ++-
 drivers/gpu/drm/i915/i915_debugfs.c                  | 2 +-
 drivers/gpu/drm/i915/intel_uncore.c                  | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index af9e58619667..d5af5708c9da 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -544,7 +544,8 @@ static int i915_dmc_info(struct seq_file *m, void *unused)
 
 	seq_printf(m, "fw loaded: %s\n", yesno(intel_dmc_has_payload(dev_priv)));
 	seq_printf(m, "path: %s\n", dmc->fw_path);
-	seq_printf(m, "Pipe A fw support: %s\n", yesno(INTEL_GEN(dev_priv) >= 12));
+	seq_printf(m, "Pipe A fw support: %s\n",
+		   yesno(GRAPHICS_VER(dev_priv) >= 12));
 	seq_printf(m, "Pipe A fw loaded: %s\n", yesno(dmc->dmc_info[DMC_FW_PIPEA].payload));
 	seq_printf(m, "Pipe B fw support: %s\n", yesno(IS_ALDERLAKE_P(dev_priv)));
 	seq_printf(m, "Pipe B fw loaded: %s\n", yesno(dmc->dmc_info[DMC_FW_PIPEB].payload));
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index cc745751ac53..0529576f069c 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -636,7 +636,7 @@ static int i915_swizzle_info(struct seq_file *m, void *data)
 			   intel_uncore_read16(uncore, C0DRB3_BW));
 		seq_printf(m, "C1DRB3 = 0x%04x\n",
 			   intel_uncore_read16(uncore, C1DRB3_BW));
-	} else if (INTEL_GEN(dev_priv) >= 6) {
+	} else if (GRAPHICS_VER(dev_priv) >= 6) {
 		seq_printf(m, "MAD_DIMM_C0 = 0x%08x\n",
 			   intel_uncore_read(uncore, MAD_DIMM_C0));
 		seq_printf(m, "MAD_DIMM_C1 = 0x%08x\n",
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index d067524f9162..ee1c6fbc3d97 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -1929,7 +1929,7 @@ int intel_uncore_init_mmio(struct intel_uncore *uncore)
 		return -ENODEV;
 	}
 
-	if (INTEL_GEN(i915) > 5 && !intel_vgpu_active(i915))
+	if (GRAPHICS_VER(i915) > 5 && !intel_vgpu_active(i915))
 		uncore->flags |= UNCORE_HAS_FORCEWAKE;
 
 	if (!intel_uncore_has_forcewake(uncore)) {
-- 
2.31.1

