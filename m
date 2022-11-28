Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEA863B5EF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 00:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9F310E357;
	Mon, 28 Nov 2022 23:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398CD10E34A;
 Mon, 28 Nov 2022 23:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669678224; x=1701214224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=td16JQiPsJ8OBHO9W5dFJlaHCubMvr8VCLxiucPhkm8=;
 b=HnsDLsONCXGO1aXZjTsjhj5I8GFUgPM/jvSMCHMvcjn+Wj5G59Snp4cz
 IeURULHsmHNKCd2PbUMOb1Y/3meuLqQ2Bwocbu/QFb82ym79im2c1qnP2
 6S+2EEf89rqUvHFaHQm67xj9YEf0iXQaAqI6UwmKVAQK54r3xjGYtXAGB
 rfPBW83FOH4iPECYlV3o6pi3sM+krVSqx2DsZIEwdm/vuRoYLKGDoJHN6
 +KPo8UO/JoEUQ4JUBC08yDj3R3AmE0x8cmXHzPzPzLymTM30qpUskx+7r
 L2vBMtvvN28Y7MTmLHtUJadFycjpk9ggR/Pk2U/u5N5euaLgXNq1Mi9V3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="302556673"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; d="scan'208";a="302556673"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 15:30:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="706982255"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; d="scan'208";a="706982255"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 15:30:23 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/5] drm/i915/mtl: Add hardware-level lock for steering
Date: Mon, 28 Nov 2022 15:30:13 -0800
Message-Id: <20221128233014.4000136-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128233014.4000136-1-matthew.d.roper@intel.com>
References: <20221128233014.4000136-1-matthew.d.roper@intel.com>
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Starting with MTL, the driver needs to not only protect the steering
control register from simultaneous software accesses, but also protect
against races with hardware/firmware agents.  The hardware provides a
dedicated locking mechanism to support this via the MTL_STEER_SEMAPHORE
register.  Reading the register acts as a 'trylock' operation; the read
will return 0x1 if the lock is acquired or 0x0 if something else is
already holding the lock; once acquired, writing 0x1 to the register
will release the lock.

We'll continue to grab the software lock as well, just so lockdep can
track our locking; assuming the hardware lock is behaving properly,
there should never be any contention on the software lock in this case.

v2:
 - Extend hardware semaphore timeout and add a taint for CI if it ever
   happens (this would imply misbehaving hardware/firmware).  (Mika)
 - Add "MTL_" prefix to new steering semaphore register.  (Mika)

Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c  | 38 ++++++++++++++++++++++---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  1 +
 2 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index aa070ae57f11..087e4ac5b68d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -347,10 +347,9 @@ static u32 rw_with_mcr_steering(struct intel_gt *gt,
  * @flags: storage to save IRQ flags to
  *
  * Performs locking to protect the steering for the duration of an MCR
- * operation.  Depending on the platform, this may be a software lock
- * (gt->mcr_lock) or a hardware lock (i.e., a register that synchronizes
- * access not only for the driver, but also for external hardware and
- * firmware agents).
+ * operation.  On MTL and beyond, a hardware lock will also be taken to
+ * serialize access not only for the driver, but also for external hardware and
+ * firmware agents.
  *
  * Context: Takes gt->mcr_lock.  uncore->lock should *not* be held when this
  *          function is called, although it may be acquired after this
@@ -359,12 +358,40 @@ static u32 rw_with_mcr_steering(struct intel_gt *gt,
 void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
 {
 	unsigned long __flags;
+	int err = 0;
 
 	lockdep_assert_not_held(&gt->uncore->lock);
 
+	/*
+	 * Starting with MTL, we need to coordinate not only with other
+	 * driver threads, but also with hardware/firmware agents.  A dedicated
+	 * locking register is used.
+	 */
+	if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
+		err = wait_for(intel_uncore_read_fw(gt->uncore,
+						    MTL_STEER_SEMAPHORE) == 0x1, 100);
+
+	/*
+	 * Even on platforms with a hardware lock, we'll continue to grab
+	 * a software spinlock too for lockdep purposes.  If the hardware lock
+	 * was already acquired, there should never be contention on the
+	 * software lock.
+	 */
 	spin_lock_irqsave(&gt->mcr_lock, __flags);
 
 	*flags = __flags;
+
+	/*
+	 * In theory we should never fail to acquire the HW semaphore; this
+	 * would indicate some hardware/firmware is misbehaving and not
+	 * releasing it properly.
+	 */
+	if (err == -ETIMEDOUT) {
+		drm_err_ratelimited(&gt->i915->drm,
+				    "GT%u hardware MCR steering semaphore timed out",
+				    gt->info.id);
+		add_taint_for_CI(gt->i915, TAINT_WARN);  /* CI is now unreliable */
+	}
 }
 
 /**
@@ -379,6 +406,9 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
 void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags)
 {
 	spin_unlock_irqrestore(&gt->mcr_lock, flags);
+
+	if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
+		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 784152548472..1618d46cb8c7 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -67,6 +67,7 @@
 #define GMD_ID_MEDIA				_MMIO(MTL_MEDIA_GSI_BASE + 0xd8c)
 
 #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
+#define MTL_STEER_SEMAPHORE			_MMIO(0xfd0)
 #define MTL_MCR_SELECTOR			_MMIO(0xfd4)
 #define SF_MCR_SELECTOR				_MMIO(0xfd8)
 #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
-- 
2.38.1

