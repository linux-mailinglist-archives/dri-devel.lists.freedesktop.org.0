Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 944934D926E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 03:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C1510E30E;
	Tue, 15 Mar 2022 02:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9CD10E30D;
 Tue, 15 Mar 2022 02:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647310090; x=1678846090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GKfU3eLmQs9cLHtM0BU00uVIW1tjl9d3NTDc/WTsGQI=;
 b=aKCXJSPJ8x39WS2uYqIbhJATaD+4fGwalgHJKB3Wn3ysk1cgViVi3rvP
 aapn+sLJMMvuQ+BT3Mhd/ohzMicU3LOfNwI/8PCGbVoav1YQIPxfvipmn
 56qEEBJwNey1Ay3i8VsuGn+P9k7p0cZldFKiTqVdPBaTEBLANsqm/5fYD
 W/5IHZX9XAbre9IxUe5xPE567Y9d5pWuG3qQXyeUCdbeOH4AVlJMnG1Sd
 Y7I78ZEbOXKpQo8A8lC5k/zkhMdUofGbhj/k8ayYgxRdraIqy7zGdcK9H
 ru/+4J3eyDlkjwoJHlZAvqX4HX2sn5EwXLZDiCqpEVxzFfvJZwASbRaGa g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="280958623"
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; d="scan'208";a="280958623"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 19:08:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; d="scan'208";a="497847109"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 19:08:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Reduce stack usage in debugfs due to SSEU
Date: Mon, 14 Mar 2022 19:08:05 -0700
Message-Id: <20220315020805.844962-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

sseu_dev_info is already a pretty large structure which will likely
continue to grow when future platforms increase potential DSS and EU
counts.  Let's switch the stack placement of this structure in debugfs
with a dynamic allocation.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c | 22 +++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
index 6b944de48666..2d5d011e01db 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
@@ -248,7 +248,7 @@ int intel_sseu_status(struct seq_file *m, struct intel_gt *gt)
 {
 	struct drm_i915_private *i915 = gt->i915;
 	const struct intel_gt_info *info = &gt->info;
-	struct sseu_dev_info sseu;
+	struct sseu_dev_info *sseu;
 	intel_wakeref_t wakeref;
 
 	if (GRAPHICS_VER(i915) < 8)
@@ -258,23 +258,29 @@ int intel_sseu_status(struct seq_file *m, struct intel_gt *gt)
 	i915_print_sseu_info(m, true, HAS_POOLED_EU(i915), &info->sseu);
 
 	seq_puts(m, "SSEU Device Status\n");
-	memset(&sseu, 0, sizeof(sseu));
-	intel_sseu_set_info(&sseu, info->sseu.max_slices,
+
+	sseu = kzalloc(sizeof(*sseu), GFP_KERNEL);
+	if (!sseu)
+		return -ENOMEM;
+
+	intel_sseu_set_info(sseu, info->sseu.max_slices,
 			    info->sseu.max_subslices,
 			    info->sseu.max_eus_per_subslice);
 
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
 		if (IS_CHERRYVIEW(i915))
-			cherryview_sseu_device_status(gt, &sseu);
+			cherryview_sseu_device_status(gt, sseu);
 		else if (IS_BROADWELL(i915))
-			bdw_sseu_device_status(gt, &sseu);
+			bdw_sseu_device_status(gt, sseu);
 		else if (GRAPHICS_VER(i915) == 9)
-			gen9_sseu_device_status(gt, &sseu);
+			gen9_sseu_device_status(gt, sseu);
 		else if (GRAPHICS_VER(i915) >= 11)
-			gen11_sseu_device_status(gt, &sseu);
+			gen11_sseu_device_status(gt, sseu);
 	}
 
-	i915_print_sseu_info(m, false, HAS_POOLED_EU(i915), &sseu);
+	i915_print_sseu_info(m, false, HAS_POOLED_EU(i915), sseu);
+
+	kfree(sseu);
 
 	return 0;
 }
-- 
2.34.1

