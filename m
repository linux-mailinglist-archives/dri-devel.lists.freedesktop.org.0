Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0454F5FF688
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 01:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B82010E17A;
	Fri, 14 Oct 2022 23:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD7C10E13C;
 Fri, 14 Oct 2022 23:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665788584; x=1697324584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ci8RhjTKG3nJRDRpoGXJalJfRr2zjpDsNci2msxWB5M=;
 b=AUJ6Wo7u9V6tXpnoVn7UJX5gKakMbTXVt0p3xHxH5G+FCE5UP7CCwCtt
 xWrXxplP6U0WZs+8PhCgr61ey+LPpTs9Ypolp5BjY3Qg6nIPgUTL5uJC1
 IvsEUDb7/P+eQ2te1ymGbKLsUVVNO0dGdEHwZKXKsm27psGAUMn5zuNKD
 lW6liB6aT2TRRtmf0pox3fnP9YqWVJ6THMzLVt0XEUnl0+GCIYx1+kzU4
 lLDkZvAMCiae7XaBpTiwNEfTMn7ZjYY02h2PSoDc4MhkFr549UM3HDSc3
 DgrjlZSSECTmTuDCylH8GRNDcDVFmSKuf3ll5Sy0O04iRx0WWncxA0UPS w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="285216970"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="285216970"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 16:03:03 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="696471708"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="696471708"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 16:03:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 07/14] drm/i915/gt: Add intel_gt_mcr_wait_for_reg_fw()
Date: Fri, 14 Oct 2022 16:02:32 -0700
Message-Id: <20221014230239.1023689-8-matthew.d.roper@intel.com>
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

Xe_HP has some MCR registers that need to be polled for completion of
operations like TLB invalidation.  Those registers are in the GAM range,
which rolls up the status from each unit into the 'primary' instance's
value.  This makes it useful to have a dedicated 'wait for register'
function that handles this on MCR registers, similar to the
__intel_wait_for_register_fw() function we already have for regular
registers.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 55 ++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h |  7 ++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index 4dc360f4e344..1ed9bc4dccfd 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -568,3 +568,58 @@ void intel_gt_mcr_get_ss_steering(struct intel_gt *gt, unsigned int dss,
 		return;
 	}
 }
+
+/**
+ * intel_gt_mcr_wait_for_reg_fw - wait until MCR register matches expected state
+ * @gt: GT structure
+ * @reg: the register to read
+ * @mask: mask to apply to register value
+ * @value: value to wait for
+ * @fast_timeout_us: fast timeout in microsecond for atomic/tight wait
+ * @slow_timeout_ms: slow timeout in millisecond
+ *
+ * This routine waits until the target register @reg contains the expected
+ * @value after applying the @mask, i.e. it waits until ::
+ *
+ *     (intel_gt_mcr_read_any_fw(gt, reg) & mask) == value
+ *
+ * Otherwise, the wait will timeout after @slow_timeout_ms milliseconds.
+ * For atomic context @slow_timeout_ms must be zero and @fast_timeout_us
+ * must be not larger than 20,0000 microseconds.
+ *
+ * This function is basically an MCR-friendly version of
+ * __intel_wait_for_register_fw().  Generally this function will only be used
+ * on GAM registers which are a bit special --- although they're MCR registers,
+ * reads (e.g., waiting for status updates) are always directed to the primary
+ * instance.
+ *
+ * Note that this routine assumes the caller holds forcewake asserted, it is
+ * not suitable for very long waits.
+ *
+ * Return: 0 if the register matches the desired condition, or -ETIMEDOUT.
+ */
+int intel_gt_mcr_wait_for_reg_fw(struct intel_gt *gt,
+				 i915_reg_t reg,
+				 u32 mask,
+				 u32 value,
+				 unsigned int fast_timeout_us,
+				 unsigned int slow_timeout_ms)
+{
+	u32 reg_value = 0;
+#define done (((reg_value = intel_gt_mcr_read_any_fw(gt, reg)) & mask) == value)
+	int ret;
+
+	/* Catch any overuse of this function */
+	might_sleep_if(slow_timeout_ms);
+	GEM_BUG_ON(fast_timeout_us > 20000);
+	GEM_BUG_ON(!fast_timeout_us && !slow_timeout_ms);
+
+	ret = -ETIMEDOUT;
+	if (fast_timeout_us && fast_timeout_us <= 20000)
+		ret = _wait_for_atomic(done, fast_timeout_us, 0);
+	if (ret && slow_timeout_ms)
+		ret = wait_for(done, slow_timeout_ms);
+
+	return ret;
+#undef done
+}
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
index 781b267478db..548f922cd9fa 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
@@ -37,6 +37,13 @@ void intel_gt_mcr_report_steering(struct drm_printer *p, struct intel_gt *gt,
 void intel_gt_mcr_get_ss_steering(struct intel_gt *gt, unsigned int dss,
 				  unsigned int *group, unsigned int *instance);
 
+int intel_gt_mcr_wait_for_reg_fw(struct intel_gt *gt,
+				 i915_reg_t reg,
+				 u32 mask,
+				 u32 value,
+				 unsigned int fast_timeout_us,
+				 unsigned int slow_timeout_ms);
+
 /*
  * Helper for for_each_ss_steering loop.  On pre-Xe_HP platforms, subslice
  * presence is determined by using the group/instance as direct lookups in the
-- 
2.37.3

