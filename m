Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFEA634846
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 21:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA3B10E462;
	Tue, 22 Nov 2022 20:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D744B10E45F;
 Tue, 22 Nov 2022 20:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669149408; x=1700685408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tJLrhBNDTemD6s+CNa2Np4kWl++A0kGZ0zLE1jEAMXw=;
 b=OQNf2mOpL3dVWA1faaiK7HyNxi3aqFc2VL4338aBmWmpWS2tiAXBRXtP
 +sU4Gt7m5Dt7CK89FwukGVRnnUepoVKzti13dqxS+/MrpkQAp5Qw7ws/j
 zSg90KpLwJM+9ldFb6w9YjT1iLDSXd17xcCMF8DbHYIUDcsKL4Jga+Sqj
 kmSHsnq9CS2ffpuSJSnwAZFp4Vq1ZEnQAYjHyuAKa4XF/lwCblZ6/xUCE
 4/iN6Q/etdLzerKyUosOZbC+T9nWQoYiomtMSl1ogrGTdtsUE/i1NblJr
 y+n3T4i1RR7WwVpdvz5vOVBA3vM8i2asJl8UO4u1d96roOS5At3iOgqOk Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="294298888"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="294298888"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 12:34:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="730535768"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="730535768"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 12:34:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915/mtl: Add hardware-level lock for steering
Date: Tue, 22 Nov 2022 12:34:01 -0800
Message-Id: <20221122203401.3172897-5-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Starting with MTL, the driver needs to not only protect the steering
control register from simultaneous software accesses, but also protect
against races with hardware/firmware agents.  The hardware provides a
dedicated locking mechanism to support this via the STEER_SEMAPHORE
register.  Reading the register acts as a 'trylock' operation; the read
will return 0x1 if the lock is acquired or 0x0 if something else is
already holding the lock; once acquired, writing 0x1 to the register
will release the lock.

We'll continue to grab the software lock as well, just so lockdep can
track our locking; assuming the hardware lock is behaving properly,
there should never be any contention on the software lock in this case.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c  | 29 +++++++++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  1 +
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index f9e722d91904..fe5f5e0affdf 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -345,10 +345,9 @@ static u32 rw_with_mcr_steering(struct intel_gt *gt,
  * @gt: GT structure
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
@@ -356,9 +355,28 @@ static u32 rw_with_mcr_steering(struct intel_gt *gt,
  */
 void intel_gt_mcr_lock(struct intel_gt *gt)
 {
+	int err = 0;
+
 	lockdep_assert_not_held(&gt->uncore->lock);
 
+	/*
+	 * Starting with MTL, we need to coordinate not only with other
+	 * driver threads, but also with hardware/firmware agents.  A dedicated
+	 * locking register is used.
+	 */
+	if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
+		err = wait_for(intel_uncore_read_fw(gt->uncore,
+						    STEER_SEMAPHORE) == 0x1, 1);
+
+	/*
+	 * Even on platforms with a hardware lock, we'll continue to grab
+	 * a software spinlock too for lockdep purposes.  If the hardware lock
+	 * was already acquired, there should never be contention on the
+	 * software lock.
+	 */
 	spin_lock(&gt->mcr_lock);
+
+	drm_WARN_ON_ONCE(&gt->i915->drm, err == -ETIMEDOUT);
 }
 
 /**
@@ -372,6 +390,9 @@ void intel_gt_mcr_lock(struct intel_gt *gt)
 void intel_gt_mcr_unlock(struct intel_gt *gt)
 {
 	spin_unlock(&gt->mcr_lock);
+
+	if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
+		intel_uncore_write_fw(gt->uncore, STEER_SEMAPHORE, 0x1);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 80a979e6f6be..412c0b399ebd 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -67,6 +67,7 @@
 #define GMD_ID_MEDIA				_MMIO(MTL_MEDIA_GSI_BASE + 0xd8c)
 
 #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
+#define STEER_SEMAPHORE				_MMIO(0xfd0)
 #define MTL_MCR_SELECTOR			_MMIO(0xfd4)
 #define SF_MCR_SELECTOR				_MMIO(0xfd8)
 #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
-- 
2.38.1

