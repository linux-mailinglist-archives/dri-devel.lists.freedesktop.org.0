Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7104C6E54B3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 00:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FD410E42F;
	Mon, 17 Apr 2023 22:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F4F10E42F;
 Mon, 17 Apr 2023 22:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681770938; x=1713306938;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3Qr0AiyF6y0NlYmNZ0wTO0qOwYCj7/Dl1l3+P9lPd1s=;
 b=Gg3ttURg+cS1TVOIdyvfKRTHP7Fr/dLeQnLQXRixv+j/kYHACd6vkbRd
 7nKXo07PKR5x2uijl5X9t7QCwHOA0s4dlS8J1+KAZfd9sLuFMJoM5ezL/
 qCSJcp9sw5WDjThdst0ztlOusZbywfCpYe7S78BP0jiTgmycpdrKP9GTe
 kQXAcjgtMoaVjjiaqD8jlEScRGScrOTBDlWM5KcASZ1hMED/iDItmK0rI
 /biXLyouoPUxUvNVUkNWvkQDWw15JvIdugiAVjJuzJgmxp9JzDI2tK2pr
 ldENpK7aydQq1oAtpdXIPCnZCFNJ/FFqkJFn8OBScArPnbFEx9NAeJfiN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="347770614"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; d="scan'208";a="347770614"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 15:35:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="721292607"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; d="scan'208";a="721292607"
Received: from sslose-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.56.168])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 15:35:33 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4] drm/i915: Make IRQ reset and postinstall multi-gt aware
Date: Tue, 18 Apr 2023 00:34:43 +0200
Message-Id: <20230417223443.1284617-1-andi.shyti@linux.intel.com>
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
---
Hi,

The rsults of this patch are more than promising as we are able
to have MTL booting and executing basic tests.(*)

Thank you Daniele and Matt for the valuable exchange of opinions.

Amdo

(*) https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_115465v5/index.html?

Changelog
=========
v3 -> v4
 - do not change the initial gt and uncore initialization in
   order to gain a better understanding at a glance of the
   purpose of all the local variables.
v2 -> v3
 - keep GUnit irq initialization out of the for_each_gt() loop as
   the media GT doesn't have a GUnit.
v1 -> v2
 - improve description in the commit log.

 drivers/gpu/drm/i915/i915_irq.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index dea1a117f3fa1..c027fd5189b85 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -2858,10 +2858,13 @@ static void dg1_irq_reset(struct drm_i915_private *dev_priv)
 {
 	struct intel_gt *gt = to_gt(dev_priv);
 	struct intel_uncore *uncore = gt->uncore;
+	unsigned int i;
 
 	dg1_master_intr_disable(dev_priv->uncore.regs);
 
-	gen11_gt_irq_reset(gt);
+	for_each_gt(gt, dev_priv, i)
+		gen11_gt_irq_reset(gt);
+
 	gen11_display_irq_reset(dev_priv);
 
 	GEN3_IRQ_RESET(uncore, GEN11_GU_MISC_);
@@ -3646,8 +3649,10 @@ static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
 	struct intel_gt *gt = to_gt(dev_priv);
 	struct intel_uncore *uncore = gt->uncore;
 	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
+	unsigned int i;
 
-	gen11_gt_irq_postinstall(gt);
+	for_each_gt(gt, dev_priv, i)
+		gen11_gt_irq_postinstall(gt);
 
 	GEN3_IRQ_INIT(uncore, GEN11_GU_MISC_, ~gu_misc_masked, gu_misc_masked);
 
-- 
2.39.2

