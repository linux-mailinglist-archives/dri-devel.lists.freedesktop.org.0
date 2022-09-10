Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B1A5B4352
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 02:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4524410E1ED;
	Sat, 10 Sep 2022 00:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5BB10E1DA;
 Sat, 10 Sep 2022 00:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662768726; x=1694304726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=78RfWuUl0nTxwRUZXnD0wJgbJPFBhzAZveX8nYpaevI=;
 b=U8D4x53k1Fci7Dta62veE6HMjzqUNxIl/AUE0D0tkXNxgqwQvWZJAsax
 Lz95dbrtV5MeyZ6QXCGqfYij2++MnVf+HQygGHfN/vfQjtrJMxeQuWGqE
 JfwuNGYomrE2L6BtzZS31CetejJBGt2BafO+VJhHkmEB2hjGwDXVEtbAC
 Wy6cNBPo4runD5g7ut77LgUROoZtBltbsLkzDYNdTglPjI7HXO+3sMHWV
 mOAVojtxfv7tbxFi9VjEIN35bkh/lhvf+tGwAR7JVAv3ALMTA7nn9ItEc
 Y9QU27zGBKGX8Rzmtze97QYWuupLAxyTPE1iY4lu8wAatLDmpqgvTML4L w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="298931860"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="298931860"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 17:12:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="645737284"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 17:12:05 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915/debugfs: Add perf_limit_reasons in debugfs
Date: Fri,  9 Sep 2022 17:12:00 -0700
Message-Id: <20220910001202.1733349-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220910001202.1733349-1-ashutosh.dixit@intel.com>
References: <20220910001202.1733349-1-ashutosh.dixit@intel.com>
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
Cc: Tilak Tangudu <tilak.tangudu@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tilak Tangudu <tilak.tangudu@intel.com>

Add perf_limit_reasons in debugfs. The upper 16 perf_limit_reasons RW "log"
bits are identical to the lower 16 RO "status" bits except that the "log"
bits remain set until cleared, thereby ensuring the throttling occurrence
is not missed. The clear fop clears the upper 16 "log" bits, the get fop
gets all 32 "log" and "status" bits.

v2: Expand commit message and clarify "log" and "status" bits in
    comment (Rodrigo)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Tilak Tangudu <tilak.tangudu@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 31 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h               |  1 +
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 108b9e76c32e..a009cf69103a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -655,6 +655,36 @@ static bool rps_eval(void *data)
 
 DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(rps_boost);
 
+static int perf_limit_reasons_get(void *data, u64 *val)
+{
+	struct intel_gt *gt = data;
+	intel_wakeref_t wakeref;
+
+	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
+		*val = intel_uncore_read(gt->uncore, GT0_PERF_LIMIT_REASONS);
+
+	return 0;
+}
+
+static int perf_limit_reasons_clear(void *data, u64 val)
+{
+	struct intel_gt *gt = data;
+	intel_wakeref_t wakeref;
+
+	/*
+	 * Clear the upper 16 "log" bits, the lower 16 "status" bits are
+	 * read-only. The upper 16 "log" bits are identical to the lower 16
+	 * "status" bits except that the "log" bits remain set until cleared.
+	 */
+	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
+		intel_uncore_rmw(gt->uncore, GT0_PERF_LIMIT_REASONS,
+				 GT0_PERF_LIMIT_REASONS_LOG_MASK, 0);
+
+	return 0;
+}
+DEFINE_SIMPLE_ATTRIBUTE(perf_limit_reasons_fops, perf_limit_reasons_get,
+			perf_limit_reasons_clear, "%llu\n");
+
 void intel_gt_pm_debugfs_register(struct intel_gt *gt, struct dentry *root)
 {
 	static const struct intel_gt_debugfs_file files[] = {
@@ -664,6 +694,7 @@ void intel_gt_pm_debugfs_register(struct intel_gt *gt, struct dentry *root)
 		{ "forcewake_user", &forcewake_user_fops, NULL},
 		{ "llc", &llc_fops, llc_eval },
 		{ "rps_boost", &rps_boost_fops, rps_eval },
+		{ "perf_limit_reasons", &perf_limit_reasons_fops, NULL },
 	};
 
 	intel_gt_debugfs_register_files(root, files, ARRAY_SIZE(files), gt);
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 52462cbfdc66..58b0ed9dddd5 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1802,6 +1802,7 @@
 #define   POWER_LIMIT_4_MASK		REG_BIT(8)
 #define   POWER_LIMIT_1_MASK		REG_BIT(10)
 #define   POWER_LIMIT_2_MASK		REG_BIT(11)
+#define   GT0_PERF_LIMIT_REASONS_LOG_MASK REG_GENMASK(31, 16)
 
 #define CHV_CLK_CTL1			_MMIO(0x101100)
 #define VLV_CLK_CTL2			_MMIO(0x101104)
-- 
2.34.1

