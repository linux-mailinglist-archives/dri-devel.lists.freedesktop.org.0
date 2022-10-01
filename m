Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFD15F178B
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 02:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D203F10EDF6;
	Sat,  1 Oct 2022 00:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FCB10E4A4;
 Sat,  1 Oct 2022 00:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664585183; x=1696121183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZJij893k4g5E12XSKRc6qNWUUh0OXDrRnK9GCA9ePwc=;
 b=VLxCrpab5pZB2waJlr3vMyoUAXZjjiTTYk6Y53/n8QH+RA8Ppw+1QDPl
 W5oTBnRf+pQfr5izr/kXp1aIK4LXvIDqzXtHaNPbABJtkP7WRFM6lvk/i
 uTx9XUh56M6TYStJlaqjnI0gZUXL8mio0XwKxTUgciRqmk8pv60moBuM3
 iQw410MjJMni9ep2QlAgiuoDNJ/FJgRrwE2wFXKs5zZ4E97/XKgMHGsoa
 PS4Ir5R1hVwY3TXfpa4963xmR3/tZYIxUvMdPKwpqAQiI9kmJDucR1VAZ
 LwQdgtcEXGwkRaPt6s6ns6eFfB5u54dJ7yfK3YhZq6KxGMgChZRPdZgv3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="388607934"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="388607934"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 17:46:12 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="685477631"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="685477631"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 17:46:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 07/14] drm/i915/gt: Add intel_gt_mcr_wait_for_reg_fw()
Date: Fri, 30 Sep 2022 17:45:43 -0700
Message-Id: <20221001004550.3031431-8-matthew.d.roper@intel.com>
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
index 962d3e974384..a2bc77c33835 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -564,3 +564,58 @@ void intel_gt_mcr_get_ss_steering(struct intel_gt *gt, unsigned int dss,
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
index e47e75e66835..96979af01f2b 100644
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

