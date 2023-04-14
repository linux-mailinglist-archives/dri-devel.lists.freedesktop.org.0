Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 133606E2845
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 18:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A1810EDB1;
	Fri, 14 Apr 2023 16:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39DC10EE16;
 Fri, 14 Apr 2023 16:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681489578; x=1713025578;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OUq9ymCfV3fZgwbPaXefBZdmcX5UxooRepJ9IT24pJ4=;
 b=hWXnv0jSrEY6BLlA338WGq+3oNiyflEfAG8YeOWNQCR/Pvfnp9w4V3hX
 TawLLkqN51U5LzislOuAt3ZZ0skgz1JM8RtpfBa3ACGUfThH0Yd8A6mmX
 D04HdTz2Pt5WFZM1HuiHMP+4iU8sXSOSILZi8IIwqVffF+/OP/dGarayJ
 HOjnmPlg0MHRn9RbLKaKJshylEzUGh5DMEXr6rIZC/KnUy8fstuad/LoQ
 T0ERDAgwmynBfkJ6orl8kxEUSI6GN3rU8ZIb6Oylg4BLGMd0TQPLyFK50
 qTeb74Xiq+aGU8bk+40yXn4hdYvW1tZIBc6yRC0LD7QzcOGtU4ggIefdw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="333278879"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="333278879"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 09:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="640148565"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="640148565"
Received: from hubehann-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.212.141])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 09:26:14 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/gt: Mask media GuC interrupts
Date: Fri, 14 Apr 2023 18:25:40 +0200
Message-Id: <20230414162540.1042889-1-andi.shyti@linux.intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Andi Shyti <andi.shyti@kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTL features a dedicated media engine that operates on its
independent GT, requiring activation of its specific interrupt
set.

Enable the necessary interrupts in a single action when the media
engine is present, bypassing the need to iterate through all the
GTs.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
Hi,

I'm starting with v0 as this patch is very different from the
ones proposed recently.

After all the discussions on this patch, I took Matt's suggestion
since it seemed the most immediate.

However, in the long run, I agree that we should have a
specific mtl_ function for enabling interrupts.

Thank you Matt and Daniele for your input.

If this patch hasn't missed anything, is it too optimistic to
expect MTL to boot? :-)

Andi

 drivers/gpu/drm/i915/gt/intel_gt_irq.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index 1b25a60391522..162a27b4c4095 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -254,7 +254,6 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 {
 	struct intel_uncore *uncore = gt->uncore;
 	u32 irqs = GT_RENDER_USER_INTERRUPT;
-	u32 guc_mask = intel_uc_wants_guc(&gt->uc) ? GUC_INTR_GUC2HOST : 0;
 	u32 gsc_mask = 0;
 	u32 dmask;
 	u32 smask;
@@ -309,17 +308,20 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 	if (gsc_mask)
 		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~gsc_mask);
 
-	if (guc_mask) {
+	if (intel_uc_wants_guc(&gt->uc)) {
+		u32 guc_mask = GUC_INTR_GUC2HOST;
 		/* the enable bit is common for both GTs but the masks are separate */
-		u32 mask = gt->type == GT_MEDIA ?
-			REG_FIELD_PREP(ENGINE0_MASK, guc_mask) :
-			REG_FIELD_PREP(ENGINE1_MASK, guc_mask);
+		u32 mask = REG_FIELD_PREP(ENGINE1_MASK, guc_mask);
+
+		/* Mask the GuC interrupts of media engine if present */
+		if (MEDIA_VER(gt->i915) >= 13)
+			mask |= REG_FIELD_PREP(ENGINE0_MASK, guc_mask);
 
 		intel_uncore_write(uncore, GEN11_GUC_SG_INTR_ENABLE,
 				   REG_FIELD_PREP(ENGINE1_MASK, guc_mask));
 
 		/* we might not be the first GT to write this reg */
-		intel_uncore_rmw(uncore, MTL_GUC_MGUC_INTR_MASK, mask, 0);
+		intel_uncore_write(uncore, MTL_GUC_MGUC_INTR_MASK, mask);
 	}
 
 	/*
-- 
2.39.2

