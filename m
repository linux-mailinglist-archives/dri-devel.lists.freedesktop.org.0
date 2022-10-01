Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB1D5F1794
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 02:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0116110EDF5;
	Sat,  1 Oct 2022 00:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B32E10E4A7;
 Sat,  1 Oct 2022 00:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664585183; x=1696121183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zxCyASFbj71ZpPe16+aNvvynmFM0KTbbX96HLla1SlI=;
 b=c6bFHeLYmR0cYDoFqFLJLvSAChxPDIrcdO/8MJ/0ZkacHltP5XvvCZnz
 ujXbsnWSkCUiHRRwRFtMiETMWbrBMtG1GRg2s3YuGeuKLnST85ZnvDOkK
 lr1GIinU857bTHb6qR7YWLiy7nGDvpE9gC0brKvK7I02ff6jGIJngtt8s
 brDSsKpsXw1N0ZOnpOq1GMXr/laG/WvvaQFBun8pV/1C/FBla55xUwqRx
 63IpUycTGUx6UWph+xjfV38ehedGqaYSGM7IU5l+oFYCeKdQ+aFvfr++a
 j5E/il6y6OqcXOxbHRflzNm9//m+6t7iO3fB3Y45rk5msn3Fsi1ZjZOfS w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="388607927"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="388607927"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 17:46:12 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="685477625"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="685477625"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 17:46:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 05/14] drm/i915/gt: Add intel_gt_mcr_multicast_rmw()
 operation
Date: Fri, 30 Sep 2022 17:45:41 -0700
Message-Id: <20221001004550.3031431-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001004550.3031431-1-matthew.d.roper@intel.com>
References: <20221001004550.3031431-1-matthew.d.roper@intel.com>
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
Cc: ravi.kumar.vodapalli@intel.com, balasubramani.vivekanandan@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are cases where we wish to read from any non-terminated MCR
register instance (or the primary instance in the case of GAM ranges),
clear/set some bits, and then write the value back out to the register
in a multicast manner.  Adding a "multicast RMW" will avoid the need to
open-code this.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h |  3 +++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index a2047a68ea7a..962d3e974384 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -302,6 +302,30 @@ void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt, i915_reg_t reg, u32 va
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
+ */
+void intel_gt_mcr_multicast_rmw(struct intel_gt *gt, i915_reg_t reg,
+				u32 clear, u32 set)
+{
+	u32 val = intel_gt_mcr_read_any(gt, reg);
+
+	intel_gt_mcr_multicast_write(gt, reg, (val & ~clear) | set);
+}
+
 /*
  * reg_needs_read_steering - determine whether a register read requires
  *     explicit steering
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
index 77a8b11c287d..e47e75e66835 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
@@ -24,6 +24,9 @@ void intel_gt_mcr_multicast_write(struct intel_gt *gt,
 void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt,
 				     i915_reg_t reg, u32 value);
 
+void intel_gt_mcr_multicast_rmw(struct intel_gt *gt, i915_reg_t reg,
+				u32 clear, u32 set);
+
 void intel_gt_mcr_get_nonterminated_steering(struct intel_gt *gt,
 					     i915_reg_t reg,
 					     u8 *group, u8 *instance);
-- 
2.37.3

