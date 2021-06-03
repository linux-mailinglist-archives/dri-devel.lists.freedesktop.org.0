Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4F339A653
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 18:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229CE6F4CD;
	Thu,  3 Jun 2021 16:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053AF6E85E;
 Thu,  3 Jun 2021 16:55:04 +0000 (UTC)
IronPort-SDR: DkWxaDOs7pbFu+SR6FZf7YbvEhLoIBPGwSfHl5c9OqFPxIJvXItq/4t47jf4jjxjoUiDzNW0NK
 G3cMPQdhY4Yw==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="184464193"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="184464193"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 09:54:51 -0700
IronPort-SDR: /T2WvcZVHXHgk78TnYj/fAhcCUU9UTVAHzzOsgSPglpjfgFKCPUOdsdVn6s57sGSflvokPRwGh
 RoeIXHGDgUvQ==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="400643672"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 09:54:50 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/7] drm/i915/gt: Add remaining conversions to GRAPHICS_VER
Date: Thu,  3 Jun 2021 09:54:23 -0700
Message-Id: <20210603165428.3625495-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603165428.3625495-1-lucas.demarchi@intel.com>
References: <20210603165428.3625495-1-lucas.demarchi@intel.com>
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

For some reason coccinelle misses a few cases in gt with calls to
INTEL_GEN()/IS_GEN(). Do a manual conversion for those.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/debugfs_gt_pm.c      | 2 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h | 4 ++--
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c b/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
index 0389bceebd06..4270b5a34a83 100644
--- a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
@@ -230,7 +230,7 @@ static int drpc_show(struct seq_file *m, void *unused)
 	with_intel_runtime_pm(gt->uncore->rpm, wakeref) {
 		if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
 			err = vlv_drpc(m);
-		else if (INTEL_GEN(i915) >= 6)
+		else if (GRAPHICS_VER(i915) >= 6)
 			err = gen6_drpc(m);
 		else
 			err = ilk_drpc(m);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 9ef349cd5cea..e113f93b3274 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -606,10 +606,10 @@ intel_engine_has_relative_mmio(const struct intel_engine_cs * const engine)
 }
 
 #define instdone_has_slice(dev_priv___, sseu___, slice___) \
-	((IS_GEN(dev_priv___, 7) ? 1 : ((sseu___)->slice_mask)) & BIT(slice___))
+	((GRAPHICS_VER(dev_priv___) == 7 ? 1 : ((sseu___)->slice_mask)) & BIT(slice___))
 
 #define instdone_has_subslice(dev_priv__, sseu__, slice__, subslice__) \
-	(IS_GEN(dev_priv__, 7) ? (1 & BIT(subslice__)) : \
+	(GRAPHICS_VER(dev_priv__) == 7 ? (1 & BIT(subslice__)) : \
 	 intel_sseu_has_subslice(sseu__, 0, subslice__))
 
 #define for_each_instdone_slice_subslice(dev_priv_, sseu_, slice_, subslice_) \
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
index 51780282d872..714fe8495775 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
@@ -248,7 +248,7 @@ int intel_sseu_status(struct seq_file *m, struct intel_gt *gt)
 	struct sseu_dev_info sseu;
 	intel_wakeref_t wakeref;
 
-	if (INTEL_GEN(i915) < 8)
+	if (GRAPHICS_VER(i915) < 8)
 		return -ENODEV;
 
 	seq_puts(m, "SSEU Device Info\n");
@@ -265,9 +265,9 @@ int intel_sseu_status(struct seq_file *m, struct intel_gt *gt)
 			cherryview_sseu_device_status(gt, &sseu);
 		else if (IS_BROADWELL(i915))
 			bdw_sseu_device_status(gt, &sseu);
-		else if (IS_GEN(i915, 9))
+		else if (GRAPHICS_VER(i915) == 9)
 			gen9_sseu_device_status(gt, &sseu);
-		else if (INTEL_GEN(i915) >= 10)
+		else if (GRAPHICS_VER(i915) >= 10)
 			gen10_sseu_device_status(gt, &sseu);
 	}
 
-- 
2.31.1

