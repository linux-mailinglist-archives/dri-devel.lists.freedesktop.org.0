Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D143B975F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A7C6EC3A;
	Thu,  1 Jul 2021 20:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFA66EBF6;
 Thu,  1 Jul 2021 20:25:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208436153"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="208436153"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:20 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564443"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 18/53] drm/i915/xehpsdv: Add maximum sseu limits
Date: Thu,  1 Jul 2021 13:23:52 -0700
Message-Id: <20210701202427.1547543-19-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210701202427.1547543-1-matthew.d.roper@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
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

Due to the removal of legacy slices and the transition to a
gslice/cslice/mslice/etc. design, we'll internally store all DSS under
"slice0."

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_sseu.c         | 5 ++++-
 drivers/gpu/drm/i915/gt/intel_sseu.h         | 2 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index 5d1b7d06c96b..16c0552fcd1d 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -145,7 +145,10 @@ static void gen12_sseu_info_init(struct intel_gt *gt)
 	 * across the entire device. Then calculate out the DSS for each
 	 * workload type within that software slice.
 	 */
-	intel_sseu_set_info(sseu, 1, 6, 16);
+	if (IS_XEHPSDV(gt->i915))
+		intel_sseu_set_info(sseu, 1, 32, 16);
+	else
+		intel_sseu_set_info(sseu, 1, 6, 16);
 
 	/*
 	 * As mentioned above, Xe_HP does not have the concept of a slice.
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
index 74487650b08f..204ea6709460 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.h
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
@@ -16,7 +16,7 @@ struct intel_gt;
 struct drm_printer;
 
 #define GEN_MAX_SLICES		(6) /* CNL upper bound */
-#define GEN_MAX_SUBSLICES	(8) /* ICL upper bound */
+#define GEN_MAX_SUBSLICES	(32) /* XEHPSDV upper bound */
 #define GEN_SSEU_STRIDE(max_entries) DIV_ROUND_UP(max_entries, BITS_PER_BYTE)
 #define GEN_MAX_SUBSLICE_STRIDE GEN_SSEU_STRIDE(GEN_MAX_SUBSLICES)
 #define GEN_MAX_EUS		(16) /* TGL upper bound */
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
index 714fe8495775..a424150b052e 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
@@ -53,7 +53,7 @@ static void cherryview_sseu_device_status(struct intel_gt *gt,
 static void gen10_sseu_device_status(struct intel_gt *gt,
 				     struct sseu_dev_info *sseu)
 {
-#define SS_MAX 6
+#define SS_MAX 8
 	struct intel_uncore *uncore = gt->uncore;
 	const struct intel_gt_info *info = &gt->info;
 	u32 s_reg[SS_MAX], eu_reg[2 * SS_MAX], eu_mask[2];
-- 
2.25.4

