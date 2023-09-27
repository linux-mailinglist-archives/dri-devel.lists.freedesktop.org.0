Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7790A7B0DDC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 23:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB75410E0D5;
	Wed, 27 Sep 2023 21:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 423 seconds by postgrey-1.36 at gabe;
 Wed, 27 Sep 2023 21:11:10 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D1D10E0C5;
 Wed, 27 Sep 2023 21:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695849070; x=1727385070;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4AwzCmdIVsBShkNTVJTgG/O9iQ0HAbqAsMHzTJRLx5U=;
 b=LGEql6t37ZkyO354KX/yDgLjW0SgloiKQL5QlzFBd9xZy7CA9+DIk9eM
 uoKHdoCveJDCyWEgG0TmGMq3/Ks7UCwP8yyaT2vQvOZOReM7q8byolNT4
 D92ySJz9U6YAtmKpbqKXcLt+heWtFUlJJq6JdpiSfMdDgouFqZUdqv23p
 riTK3jn4PyQUtx7YVQcPF9RzLIWhvVZaRtKTgi0DK+Ah60h6efSi6L4C5
 JcJWRaYDwv0FRISiaV4amAf0fPFoaylc8GgJeOBfLPu0Um/4hKhNAi8eF
 cxFZ3vVKwp7T3Jha5A+Rn93FiffeJHjtG36lyIPc2Liho5aY304l03oWP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="3470802"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="3470802"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 14:04:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="864987665"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="864987665"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 14:04:05 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 1/4] drm/i915: Introduce intel_gt_mcr_lock_reset()
Date: Wed, 27 Sep 2023 23:03:54 +0200
Message-ID: <20230927210357.17461-1-nirmoy.das@intel.com>
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

Implement intel_gt_mcr_lock_reset() to provide a mechanism
for resetting the steer semaphore when absolutely necessary.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 29 ++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index bf4a933de03a..d98e0d2fc2ee 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -419,6 +419,35 @@ void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags)
 		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
 }
 
+/**
+ * intel_gt_mcr_lock_reset - Reset MCR steering lock
+ * @gt: GT structure
+ *
+ * Performs a steer semaphore reset operation. On MTL and beyond, a hardware
+ * lock will also be taken to serialize access not only for the driver,
+ * but also for external hardware and firmware agents.
+ * However, there may be situations where the driver must reset the semaphore
+ * but only when it is absolutely certain that no other agent should own the
+ * lock at that given time.
+ *
+ * Context: Takes gt->mcr_lock.  uncore->lock should *not* be held when this
+ *          function is called, although it may be acquired after this
+ *          function call.
+ */
+void intel_gt_mcr_lock_reset(struct intel_gt *gt)
+{
+	unsigned long __flags;
+
+	lockdep_assert_not_held(&gt->uncore->lock);
+
+	spin_lock_irqsave(&gt->mcr_lock, __flags);
+
+	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
+		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
+
+	spin_unlock_irqrestore(&gt->mcr_lock, __flags);
+}
+
 /**
  * intel_gt_mcr_read - read a specific instance of an MCR register
  * @gt: GT structure
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
index 41684495b7da..485c7711f2e8 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
@@ -11,6 +11,7 @@
 void intel_gt_mcr_init(struct intel_gt *gt);
 void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags);
 void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags);
+void intel_gt_mcr_lock_reset(struct intel_gt *gt);
 
 u32 intel_gt_mcr_read(struct intel_gt *gt,
 		      i915_mcr_reg_t reg,
-- 
2.41.0

