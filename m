Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B2E7B1D2A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 15:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F3E10E63F;
	Thu, 28 Sep 2023 13:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB22D10E18A;
 Thu, 28 Sep 2023 13:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695906025; x=1727442025;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J8VU/xBIexsorbmUE+M1cXCeBSw+Z/ISliW+/qChUqk=;
 b=iwOOW+7t0nzQTx4KtMa8+2hS3WDUCqVY5Jjf/w5lqrb4aw47qHX+Wybi
 2OlaeX7eb9KvJBIxIrBgC50v+lxbdJxn60EIQn9LpMs+EOBzbNASghszx
 gNk+h2gAdqEcoLMu6f+XGi6W7QvHyPROWTVIC33VIVAZwM7W1BUo31KGn
 f2MYIXOea6Kf1tKYMX6ZlSZoG+Z9maiWybYw9AkQG0X7yxyqjg2NMrdLv
 K63aEm3/ztsMJBTn0WiXkEDtp0tuWsofl0VnDcBxQnfROVDCuBeHo1fwb
 1PISjoyKA2cBr2wA6l6LVm7VPnpgd5Ustekl7wGzUnnYO4dNeZP+ILpB2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="380925488"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="380925488"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 06:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="865247767"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="865247767"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 06:00:23 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 1/4] drm/i915: Introduce intel_gt_mcr_lock_sanitize()
Date: Thu, 28 Sep 2023 15:00:12 +0200
Message-ID: <20230928130015.6758-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: matthew.d.roper@intel.com, andi.shyti@linux.intel.com,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement intel_gt_mcr_lock_sanitize() to provide a mechanism
for cleaning the steer semaphore when absolutely necessary.

v2: remove unnecessary lock(Andi, Matt)
    improve the kernel doc(Matt)
    s/intel_gt_mcr_lock_clear/intel_gt_mcr_lock_sanitize

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index bf4a933de03a..326c2ed1d99b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -419,6 +419,28 @@ void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags)
 		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
 }
 
+/**
+ * intel_gt_mcr_lock_sanitize - Sanitize MCR steering lock
+ * @gt: GT structure
+ *
+ * This will be used to sanitize the initial status of the hardware lock
+ * during driver load and resume since there won't be any concurrent access
+ * from other agents at those times, but it's possible that boot firmware
+ * may have left the lock in a bad state.
+ *
+ */
+void intel_gt_mcr_lock_sanitize(struct intel_gt *gt)
+{
+	/*
+	 * This gets called at load/resume time, so we shouldn't be
+	 * racing with other driver threads grabbing the mcr lock.
+	 */
+	lockdep_assert_not_held(&gt->mcr_lock);
+
+	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
+		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
+}
+
 /**
  * intel_gt_mcr_read - read a specific instance of an MCR register
  * @gt: GT structure
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
index 41684495b7da..01ac565a56a4 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
@@ -11,6 +11,7 @@
 void intel_gt_mcr_init(struct intel_gt *gt);
 void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags);
 void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags);
+void intel_gt_mcr_lock_sanitize(struct intel_gt *gt);
 
 u32 intel_gt_mcr_read(struct intel_gt *gt,
 		      i915_mcr_reg_t reg,
-- 
2.41.0

