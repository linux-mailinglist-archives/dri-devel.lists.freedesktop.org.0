Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7449634848
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 21:37:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9382C10E467;
	Tue, 22 Nov 2022 20:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9650210E1D6;
 Tue, 22 Nov 2022 20:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669149408; x=1700685408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K/t8Y42S5ULrx29M/w+fDQIrLq5NkA8HoaUrTiWM4fo=;
 b=IOohFP/1CLbTuJrJAhYrdvXRBKsO4AoVN5MW3dwkXCYQ9KBwQNqcASDf
 wCsnINtvdcGd2L1hGWIHefdq0H+ZU5tFWjHpJhwdjpJ4M8+I0OXs+amp/
 c1skis+IKsVWQ4D5gHk/e+5XxjMm5/xQDjI/zJyZHeQaFQIyy11mOwgIM
 WJu8ihC22XxrYmZY2j0ScP30l0TgA4Nm6kBf5f8kxNb9kcbWAZDYEEq27
 ecpXxlu1h6Xu3OsdAeNXoHGk34b5px0KW0sm4gD/wMSBiJZx2zfSITne8
 q4ivDtJKPL6J1/QHcpjIIXhCe40e+lO4xg8DelDhiBeHfxPxqI9UWpRw5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="294298886"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="294298886"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 12:34:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="730535766"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="730535766"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 12:34:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915/gt: Add dedicated MCR lock
Date: Tue, 22 Nov 2022 12:34:00 -0800
Message-Id: <20221122203401.3172897-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122203401.3172897-1-matthew.d.roper@intel.com>
References: <20221122203401.3172897-1-matthew.d.roper@intel.com>
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 dri-devel@lists.freedesktop.org, Mika Kuoppala <mika.kuoppala@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've been overloading uncore->lock to protect access to the MCR
steering register.  That's not really what uncore->lock is intended for,
and it would be better if we didn't need to hold such a high-traffic
spinlock for the whole sequence of (apply steering, access MCR register,
restore steering).  Let's create a dedicated MCR lock to protect the
steering control register over this critical section and stop relying on
the high-traffic uncore->lock.

For now the new lock is a software lock.  However some platforms (MTL
and beyond) have a hardware-provided locking mechanism that can be used
to serialize not only software accesses, but also hardware/firmware
accesses as well; support for that hardware level lock will be added in
a future patch.

Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c          |  2 +
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 66 ++++++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h      |  2 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |  8 +++
 drivers/gpu/drm/i915/gt/intel_mocs.c        |  2 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c |  4 ++
 6 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index b5ad9caa5537..f823fc0b3827 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -1094,6 +1094,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
 
 	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
 
+	intel_gt_mcr_lock(gt);
 	spin_lock_irq(&uncore->lock); /* serialise invalidate with GT reset */
 
 	awake = 0;
@@ -1129,6 +1130,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
 		intel_uncore_write_fw(uncore, GEN12_OA_TLB_INV_CR, 1);
 
 	spin_unlock_irq(&uncore->lock);
+	intel_gt_mcr_unlock(gt);
 
 	for_each_engine_masked(engine, gt, awake, tmp) {
 		struct reg_and_bit rb;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index f4484bb18ec9..f9e722d91904 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -143,6 +143,8 @@ void intel_gt_mcr_init(struct intel_gt *gt)
 	unsigned long fuse;
 	int i;
 
+	spin_lock_init(&gt->mcr_lock);
+
 	/*
 	 * An mslice is unavailable only if both the meml3 for the slice is
 	 * disabled *and* all of the DSS in the slice (quadrant) are disabled.
@@ -228,6 +230,7 @@ static i915_reg_t mcr_reg_cast(const i915_mcr_reg_t mcr)
  * @instance: instance number (documented as "subsliceid" on older platforms)
  * @value: register value to be written (ignored for read)
  *
+ * Context: The caller must hold the MCR lock
  * Return: 0 for write access. register value for read access.
  *
  * Caller needs to make sure the relevant forcewake wells are up.
@@ -239,7 +242,7 @@ static u32 rw_with_mcr_steering_fw(struct intel_gt *gt,
 	struct intel_uncore *uncore = gt->uncore;
 	u32 mcr_mask, mcr_ss, mcr, old_mcr, val = 0;
 
-	lockdep_assert_held(&uncore->lock);
+	lockdep_assert_held(&gt->mcr_lock);
 
 	if (GRAPHICS_VER_FULL(uncore->i915) >= IP_VER(12, 70)) {
 		/*
@@ -324,6 +327,7 @@ static u32 rw_with_mcr_steering(struct intel_gt *gt,
 						     GEN8_MCR_SELECTOR,
 						     FW_REG_READ | FW_REG_WRITE);
 
+	intel_gt_mcr_lock(gt);
 	spin_lock_irq(&uncore->lock);
 	intel_uncore_forcewake_get__locked(uncore, fw_domains);
 
@@ -331,10 +335,45 @@ static u32 rw_with_mcr_steering(struct intel_gt *gt,
 
 	intel_uncore_forcewake_put__locked(uncore, fw_domains);
 	spin_unlock_irq(&uncore->lock);
+	intel_gt_mcr_unlock(gt);
 
 	return val;
 }
 
+/**
+ * intel_gt_mcr_lock - Acquire MCR steering lock
+ * @gt: GT structure
+ *
+ * Performs locking to protect the steering for the duration of an MCR
+ * operation.  Depending on the platform, this may be a software lock
+ * (gt->mcr_lock) or a hardware lock (i.e., a register that synchronizes
+ * access not only for the driver, but also for external hardware and
+ * firmware agents).
+ *
+ * Context: Takes gt->mcr_lock.  uncore->lock should *not* be held when this
+ *          function is called, although it may be acquired after this
+ *          function call.
+ */
+void intel_gt_mcr_lock(struct intel_gt *gt)
+{
+	lockdep_assert_not_held(&gt->uncore->lock);
+
+	spin_lock(&gt->mcr_lock);
+}
+
+/**
+ * intel_gt_mcr_unlock - Release MCR steering lock
+ * @gt: GT structure
+ *
+ * Releases the lock acquired by intel_gt_mcr_lock().
+ *
+ * Context: Releases gt->mcr_lock
+ */
+void intel_gt_mcr_unlock(struct intel_gt *gt)
+{
+	spin_unlock(&gt->mcr_lock);
+}
+
 /**
  * intel_gt_mcr_read - read a specific instance of an MCR register
  * @gt: GT structure
@@ -342,6 +381,8 @@ static u32 rw_with_mcr_steering(struct intel_gt *gt,
  * @group: the MCR group
  * @instance: the MCR instance
  *
+ * Context: Takes and releases gt->mcr_lock
+ *
  * Returns the value read from an MCR register after steering toward a specific
  * group/instance.
  */
@@ -362,6 +403,8 @@ u32 intel_gt_mcr_read(struct intel_gt *gt,
  *
  * Write an MCR register in unicast mode after steering toward a specific
  * group/instance.
+ *
+ * Context: Calls a function that takes and releases gt->mcr_lock
  */
 void intel_gt_mcr_unicast_write(struct intel_gt *gt, i915_mcr_reg_t reg, u32 value,
 				int group, int instance)
@@ -376,10 +419,14 @@ void intel_gt_mcr_unicast_write(struct intel_gt *gt, i915_mcr_reg_t reg, u32 val
  * @value: value to write
  *
  * Write an MCR register in multicast mode to update all instances.
+ *
+ * Context: Takes and releases gt->mcr_lock
  */
 void intel_gt_mcr_multicast_write(struct intel_gt *gt,
 				  i915_mcr_reg_t reg, u32 value)
 {
+	intel_gt_mcr_lock(gt);
+
 	/*
 	 * Ensure we have multicast behavior, just in case some non-i915 agent
 	 * left the hardware in unicast mode.
@@ -388,6 +435,8 @@ void intel_gt_mcr_multicast_write(struct intel_gt *gt,
 		intel_uncore_write_fw(gt->uncore, MTL_MCR_SELECTOR, GEN11_MCR_MULTICAST);
 
 	intel_uncore_write(gt->uncore, mcr_reg_cast(reg), value);
+
+	intel_gt_mcr_unlock(gt);
 }
 
 /**
@@ -400,9 +449,13 @@ void intel_gt_mcr_multicast_write(struct intel_gt *gt,
  * function assumes the caller is already holding any necessary forcewake
  * domains; use intel_gt_mcr_multicast_write() in cases where forcewake should
  * be obtained automatically.
+ *
+ * Context: The caller must hold gt->mcr_lock.
  */
 void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt, i915_mcr_reg_t reg, u32 value)
 {
+	lockdep_assert_held(&gt->mcr_lock);
+
 	/*
 	 * Ensure we have multicast behavior, just in case some non-i915 agent
 	 * left the hardware in unicast mode.
@@ -429,6 +482,8 @@ void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt, i915_mcr_reg_t reg, u3
  * domains; use intel_gt_mcr_multicast_rmw() in cases where forcewake should
  * be obtained automatically.
  *
+ * Context: Calls functions that take and release gt->mcr_lock
+ *
  * Returns the old (unmodified) value read.
  */
 u32 intel_gt_mcr_multicast_rmw(struct intel_gt *gt, i915_mcr_reg_t reg,
@@ -580,6 +635,8 @@ void intel_gt_mcr_get_nonterminated_steering(struct intel_gt *gt,
  * domains; use intel_gt_mcr_read_any() in cases where forcewake should be
  * obtained automatically.
  *
+ * Context: The caller must hold gt->mcr_lock.
+ *
  * Returns the value from a non-terminated instance of @reg.
  */
 u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_mcr_reg_t reg)
@@ -587,6 +644,8 @@ u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_mcr_reg_t reg)
 	int type;
 	u8 group, instance;
 
+	lockdep_assert_held(&gt->mcr_lock);
+
 	for (type = 0; type < NUM_STEERING_TYPES; type++) {
 		if (reg_needs_read_steering(gt, reg, type)) {
 			get_nonterminated_steering(gt, type, &group, &instance);
@@ -607,6 +666,8 @@ u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_mcr_reg_t reg)
  * Reads a GT MCR register.  The read will be steered to a non-terminated
  * instance (i.e., one that isn't fused off or powered down by power gating).
  *
+ * Context: Calls a function that takes and releases gt->mcr_lock.
+ *
  * Returns the value from a non-terminated instance of @reg.
  */
 u32 intel_gt_mcr_read_any(struct intel_gt *gt, i915_mcr_reg_t reg)
@@ -730,6 +791,7 @@ void intel_gt_mcr_get_ss_steering(struct intel_gt *gt, unsigned int dss,
  * Note that this routine assumes the caller holds forcewake asserted, it is
  * not suitable for very long waits.
  *
+ * Context: Calls a function that takes and releases gt->mcr_lock
  * Return: 0 if the register matches the desired condition, or -ETIMEDOUT.
  */
 int intel_gt_mcr_wait_for_reg(struct intel_gt *gt,
@@ -741,7 +803,7 @@ int intel_gt_mcr_wait_for_reg(struct intel_gt *gt,
 {
 	int ret;
 
-	lockdep_assert_not_held(&gt->uncore->lock);
+	lockdep_assert_not_held(&gt->mcr_lock);
 
 #define done ((intel_gt_mcr_read_any(gt, reg) & mask) == value)
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
index ae93b20e1c17..bdcc07233778 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
@@ -9,6 +9,8 @@
 #include "intel_gt_types.h"
 
 void intel_gt_mcr_init(struct intel_gt *gt);
+void intel_gt_mcr_lock(struct intel_gt *gt);
+void intel_gt_mcr_unlock(struct intel_gt *gt);
 
 u32 intel_gt_mcr_read(struct intel_gt *gt,
 		      i915_mcr_reg_t reg,
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index c1d9cd255e06..76c34c4af867 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -233,6 +233,14 @@ struct intel_gt {
 		u8 instanceid;
 	} default_steering;
 
+	/**
+	 * @mcr_lock: Protects the MCR steering register
+	 *
+	 * Protects the MCR steering register (e.g., GEN8_MCR_SELECTOR).
+	 * Should be taken before uncore->lock in cases where both are desired.
+	 */
+	spinlock_t mcr_lock;
+
 	/*
 	 * Base of per-tile GTTMMADR where we can derive the MMIO and the GGTT.
 	 */
diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
index 49fdd509527a..6a68463e376d 100644
--- a/drivers/gpu/drm/i915/gt/intel_mocs.c
+++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
@@ -616,11 +616,13 @@ static void init_l3cc_table(struct intel_gt *gt,
 	unsigned int i;
 	u32 l3cc;
 
+	intel_gt_mcr_lock(gt);
 	for_each_l3cc(l3cc, table, i)
 		if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
 			intel_gt_mcr_multicast_write_fw(gt, XEHP_LNCFCMOCS(i), l3cc);
 		else
 			intel_uncore_write_fw(gt->uncore, GEN9_LNCFCMOCS(i), l3cc);
+	intel_gt_mcr_unlock(gt);
 }
 
 void intel_mocs_init_engine(struct intel_engine_cs *engine)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 2afb4f80a954..69285cb9e2d3 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1752,6 +1752,7 @@ static void wa_list_apply(const struct i915_wa_list *wal)
 
 	fw = wal_get_fw_for_rmw(uncore, wal);
 
+	intel_gt_mcr_lock(gt);
 	spin_lock_irqsave(&uncore->lock, flags);
 	intel_uncore_forcewake_get__locked(uncore, fw);
 
@@ -1782,6 +1783,7 @@ static void wa_list_apply(const struct i915_wa_list *wal)
 
 	intel_uncore_forcewake_put__locked(uncore, fw);
 	spin_unlock_irqrestore(&uncore->lock, flags);
+	intel_gt_mcr_unlock(gt);
 }
 
 void intel_gt_apply_workarounds(struct intel_gt *gt)
@@ -1802,6 +1804,7 @@ static bool wa_list_verify(struct intel_gt *gt,
 
 	fw = wal_get_fw_for_rmw(uncore, wal);
 
+	intel_gt_mcr_lock(gt);
 	spin_lock_irqsave(&uncore->lock, flags);
 	intel_uncore_forcewake_get__locked(uncore, fw);
 
@@ -1813,6 +1816,7 @@ static bool wa_list_verify(struct intel_gt *gt,
 
 	intel_uncore_forcewake_put__locked(uncore, fw);
 	spin_unlock_irqrestore(&uncore->lock, flags);
+	intel_gt_mcr_unlock(gt);
 
 	return ok;
 }
-- 
2.38.1

