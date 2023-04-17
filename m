Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B1A6E5574
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 01:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16EC10E63F;
	Mon, 17 Apr 2023 23:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3399510E63F;
 Mon, 17 Apr 2023 23:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681775706; x=1713311706;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P5nsdCapQkR/n9EkkMwrCqHuJZihy7FtDH+0lq06Cr8=;
 b=B4Fxp9ahwf05844BMU2r2UEeKMISw+5jEpe5ICczBHWhhOmprpq4NpgH
 rNVkziGt3LdqLUgcf+9U9cA8TL73rhiByIJTKmkbStBlDyfqP13n8U49j
 RSumNuf/VUkyPmhDOpXaCvbk0QxipE39bprhn0CYp97KiqXplUcuG+0hN
 X8jp3+RTc24itg59G7VP8KSkDMHMH7G/HPMpLCo1fnwoXGi6KuBM7vOUt
 DVPmrbtMgSM1CMhvg3hfFZZxTk796ku2bjgoU5f5wYCGQs5zvMAnHHCeT
 F0ouguAzfJVlDKatrWZEjUia8SAXtL5xAyFq+wLom4XnIHgekrF9V88+D w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="325373884"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; d="scan'208";a="325373884"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 16:54:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="693423450"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; d="scan'208";a="693423450"
Received: from sslose-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.56.168])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 16:54:55 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5] drm/i915: Make IRQ reset and postinstall multi-gt aware
Date: Tue, 18 Apr 2023 01:53:56 +0200
Message-Id: <20230417235356.1291060-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In multi-gt systems IRQs need to be reset and enabled per GT.

This might add some redundancy when handling interrupts for
engines that might not exist in every tile, but helps to keep the
code cleaner and more understandable.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
Hi,

thanks Matt for the review.

Andi

Changelog
=========
v4 -> v5
 - Another little cosmetic on the variable declaration. Go back
   to v3 but using "&dev_priv->uncore" instead of
   "to_gt(dev_priv)->uncore", which is much cleaner.
 - Add Matt's r-b.
v3 -> v4
 - do not change the initial gt and uncore initialization in
   order to gain a better understanding at a glance of the
   purpose of all the local variables.
v2 -> v3
 - keep GUnit irq initialization out of the for_each_gt() loop as
   the media GT doesn't have a GUnit.
v1 -> v2
 - improve description in the commit log.

 drivers/gpu/drm/i915/i915_irq.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

 drivers/gpu/drm/i915/i915_irq.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index dea1a117f3fa1..eead067f18c7a 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -2856,12 +2856,15 @@ static void gen11_irq_reset(struct drm_i915_private *dev_priv)
 
 static void dg1_irq_reset(struct drm_i915_private *dev_priv)
 {
-	struct intel_gt *gt = to_gt(dev_priv);
-	struct intel_uncore *uncore = gt->uncore;
+	struct intel_uncore *uncore = &dev_priv->uncore;
+	struct intel_gt *gt;
+	unsigned int i;
 
 	dg1_master_intr_disable(dev_priv->uncore.regs);
 
-	gen11_gt_irq_reset(gt);
+	for_each_gt(gt, dev_priv, i)
+		gen11_gt_irq_reset(gt);
+
 	gen11_display_irq_reset(dev_priv);
 
 	GEN3_IRQ_RESET(uncore, GEN11_GU_MISC_);
@@ -3643,11 +3646,13 @@ static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
 
 static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
 {
-	struct intel_gt *gt = to_gt(dev_priv);
-	struct intel_uncore *uncore = gt->uncore;
+	struct intel_uncore *uncore = &dev_priv->uncore;
 	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
+	struct intel_gt *gt;
+	unsigned int i;
 
-	gen11_gt_irq_postinstall(gt);
+	for_each_gt(gt, dev_priv, i)
+		gen11_gt_irq_postinstall(gt);
 
 	GEN3_IRQ_INIT(uncore, GEN11_GU_MISC_, ~gu_misc_masked, gu_misc_masked);
 
-- 
2.39.2

