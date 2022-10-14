Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC145FF680
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 01:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C955F10E152;
	Fri, 14 Oct 2022 23:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1D810E137;
 Fri, 14 Oct 2022 23:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665788584; x=1697324584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BLGNCU2YhyDAiodKVPKZH0H19KcfV50OrKRtiN5pkgk=;
 b=VL0LrLpNOObPwBaHvtuFB4/C22ZKh3DCMni9NJOhZ9lRTN7w0u29d6ce
 NiZc/ICkWgikEu3zG6VNZNzf30rqUMLwH9Wju8a0g87CzE+6tJjA6OVQl
 WuKLw4SCx0V8kqCJarDoDyhv8iTIc0goNDuWHE4SPKRiY2CDt8fzmp7TQ
 G3WdPblrR1X54kzYJC7QL10A1rBLrf8bG4VN0zg0sahyui3i7ORsYYzPB
 2QGfW8IM1bYAYtOTGz6lSePZAfPxBBWAGnq4kwi3y/EXGflacwUVeHdwt
 UsOYncquKSPrElL4yvoJX1cCeKOFSuXlKqoV9PS/Ja2Z3CHQS5NfV2Wtq A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="285216968"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="285216968"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 16:03:02 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="696471703"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="696471703"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 16:03:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 05/14] drm/i915/gt: Add intel_gt_mcr_multicast_rmw()
 operation
Date: Fri, 14 Oct 2022 16:02:30 -0700
Message-Id: <20221014230239.1023689-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014230239.1023689-1-matthew.d.roper@intel.com>
References: <20221014230239.1023689-1-matthew.d.roper@intel.com>
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

There are cases where we wish to read from any non-terminated MCR
register instance (or the primary instance in the case of GAM ranges),
clear/set some bits, and then write the value back out to the register
in a multicast manner.  Adding a "multicast RMW" will avoid the need to
open-code this.

v2:
 - Return a u32 to align with the recent change to intel_uncore_rmw.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 28 ++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h |  3 +++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index a2047a68ea7a..4dc360f4e344 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -302,6 +302,34 @@ void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt, i915_reg_t reg, u32 va
 	intel_uncore_write_fw(gt->uncore, reg, value);
 }
 
+/**
+ * intel_gt_mcr_multicast_rmw - Performs a multicast RMW operations
+ * @gt: GT structure
+ * @reg: the MCR register to read and write
+ * @clear: bits to clear during RMW
+ * @set: bits to set during RMW
+ *
+ * Performs a read-modify-write on an MCR register in a multicast manner.
+ * This operation only makes sense on MCR registers where all instances are
+ * expected to have the same value.  The read will target any non-terminated
+ * instance and the write will be applied to all instances.
+ *
+ * This function assumes the caller is already holding any necessary forcewake
+ * domains; use intel_gt_mcr_multicast_rmw() in cases where forcewake should
+ * be obtained automatically.
+ *
+ * Returns the old (unmodified) value read.
+ */
+u32 intel_gt_mcr_multicast_rmw(struct intel_gt *gt, i915_reg_t reg,
+			       u32 clear, u32 set)
+{
+	u32 val = intel_gt_mcr_read_any(gt, reg);
+
+	intel_gt_mcr_multicast_write(gt, reg, (val & ~clear) | set);
+
+	return val;
+}
+
 /*
  * reg_needs_read_steering - determine whether a register read requires
  *     explicit steering
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
index 77a8b11c287d..781b267478db 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
@@ -24,6 +24,9 @@ void intel_gt_mcr_multicast_write(struct intel_gt *gt,
 void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt,
 				     i915_reg_t reg, u32 value);
 
+u32 intel_gt_mcr_multicast_rmw(struct intel_gt *gt, i915_reg_t reg,
+			       u32 clear, u32 set);
+
 void intel_gt_mcr_get_nonterminated_steering(struct intel_gt *gt,
 					     i915_reg_t reg,
 					     u8 *group, u8 *instance);
-- 
2.37.3

