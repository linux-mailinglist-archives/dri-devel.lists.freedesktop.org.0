Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A176E3CB0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 00:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815F010E05A;
	Sun, 16 Apr 2023 22:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8656610E02C;
 Sun, 16 Apr 2023 22:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681685251; x=1713221251;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BGwvXPloCi/tkobyi27d6MRwiMh8UPHsPQgwvbLS5+0=;
 b=ONgQ6UnYn/4nP5+3zEEk/1jNQyW+6QgBH2qaohhCkk98CBJ3R3sVz73f
 GAqA7LsbHJFtrw1X6V0HM6471/CDU5DJn0x9lbqi4uLmDwhd4+IvnFe5U
 3QIU37WK8DSKe4hdaMbUJ8Bf8+owQfTSjP8JRUmm1PJjFvFIwJm1jwYZD
 Cq5P7quNDCihIikl8VIa3iwWR/PMAcURSgDbiVaqnIqL89EV7Lr8WHM1s
 uovCFN0DFzf41m08sA2Dh7jJJ6DWfeG9+gkbr6JVgDkCvevRg2CoqksLy
 ii00I+guZuLOQObwodSAjmDQz2R9tJ4K6smcx2h6gnvQRRg6D7IBcafOz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="407657010"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="407657010"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2023 15:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="864809920"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="864809920"
Received: from hhoroszy-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.55.122])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2023 15:47:27 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/i915: Make IRQ reset and postinstall multi-gt aware
Date: Mon, 17 Apr 2023 00:46:36 +0200
Message-Id: <20230416224636.1207298-1-andi.shyti@linux.intel.com>
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

Following the most recent discussions, it appears that the
cleanest method for handling multi-GT interrupts in MTL is to
utilize for_each_gt in the reset and post-install functions.

Attempting to configure everything in one go requires addressing
certain exceptions, which could ultimately make the code appear
more complex and hacky. Moreover, the media-GT is managed while
configuring a different GT.

Thank you Daniele and Matt for the valuable exchange of opinions.

This patch has been tested on trybot and allows MTL to boot and
execute some BAT tests.

Andi

Changelog
=========
v2 -> v3
 - keep GUnit irq initialization out of the for_each_gt() loop as
   the media GT doesn't have a GUnit.
v1 -> v2
 - improve description in the commit log.

 drivers/gpu/drm/i915/i915_irq.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index b4dd6a5a536f9..eb185dc2e59a0 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -2856,12 +2856,15 @@ static void gen11_irq_reset(struct drm_i915_private *dev_priv)
 
 static void dg1_irq_reset(struct drm_i915_private *dev_priv)
 {
-	struct intel_gt *gt = to_gt(dev_priv);
-	struct intel_uncore *uncore = gt->uncore;
+	struct intel_uncore *uncore = to_gt(dev_priv)->uncore;
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
+	struct intel_uncore *uncore = to_gt(dev_priv)->uncore;
 	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
+	struct intel_gt *gt;
+	unsigned int i;
 
-	gen11_gt_irq_postinstall(gt);
+	for_each_gt(gt, dev_priv, i)
+		gen11_gt_irq_postinstall(gt);
 
 	GEN3_IRQ_INIT(uncore, GEN11_GU_MISC_, ~gu_misc_masked, gu_misc_masked);
 
-- 
2.39.2

