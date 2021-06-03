Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C2E39998D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 06:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147E96F3F4;
	Thu,  3 Jun 2021 04:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C636F3CE;
 Thu,  3 Jun 2021 04:58:44 +0000 (UTC)
IronPort-SDR: a/FTKHQS5NKl2wC8HwoyQJuQfC9xsCgpMoiR/WtEaZyUJVYKOXas5u/7AqFXQkOjvYc7XS0moB
 53RWYkDg5BzQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="203956526"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="203956526"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 21:58:41 -0700
IronPort-SDR: AbYO5MnyHAcHXS3/JZmqOLjm9ehOZig6J5sdC4IEOm9m0ZjS10xhfbcp2qmppFsoYiAGQBera+
 4WN8B89H3FAA==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="480020042"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 21:58:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 19/20] drm/i915/guc: Early initialization of GuC send registers
Date: Wed,  2 Jun 2021 22:16:29 -0700
Message-Id: <20210603051630.2635-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210603051630.2635-1-matthew.brost@intel.com>
References: <20210603051630.2635-1-matthew.brost@intel.com>
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
Cc: daniel.vetter@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

Base offset and count of the GuC scratch registers, used for
sending MMIO messages to GuC, can be initialized earlier with
other GuC members that also depends on platform.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 18da9ed15728..fcfa4fd93841 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -60,15 +60,8 @@ void intel_guc_init_send_regs(struct intel_guc *guc)
 	enum forcewake_domains fw_domains = 0;
 	unsigned int i;
 
-	if (INTEL_GEN(gt->i915) >= 11) {
-		guc->send_regs.base =
-				i915_mmio_reg_offset(GEN11_SOFT_SCRATCH(0));
-		guc->send_regs.count = GEN11_SOFT_SCRATCH_COUNT;
-	} else {
-		guc->send_regs.base = i915_mmio_reg_offset(SOFT_SCRATCH(0));
-		guc->send_regs.count = GUC_MAX_MMIO_MSG_LEN;
-		BUILD_BUG_ON(GUC_MAX_MMIO_MSG_LEN > SOFT_SCRATCH_COUNT);
-	}
+	GEM_BUG_ON(!guc->send_regs.base);
+	GEM_BUG_ON(!guc->send_regs.count);
 
 	for (i = 0; i < guc->send_regs.count; i++) {
 		fw_domains |= intel_uncore_forcewake_for_reg(gt->uncore,
@@ -172,11 +165,18 @@ void intel_guc_init_early(struct intel_guc *guc)
 		guc->interrupts.reset = gen11_reset_guc_interrupts;
 		guc->interrupts.enable = gen11_enable_guc_interrupts;
 		guc->interrupts.disable = gen11_disable_guc_interrupts;
+		guc->send_regs.base =
+			i915_mmio_reg_offset(GEN11_SOFT_SCRATCH(0));
+		guc->send_regs.count = GEN11_SOFT_SCRATCH_COUNT;
+
 	} else {
 		guc->notify_reg = GUC_SEND_INTERRUPT;
 		guc->interrupts.reset = gen9_reset_guc_interrupts;
 		guc->interrupts.enable = gen9_enable_guc_interrupts;
 		guc->interrupts.disable = gen9_disable_guc_interrupts;
+		guc->send_regs.base = i915_mmio_reg_offset(SOFT_SCRATCH(0));
+		guc->send_regs.count = GUC_MAX_MMIO_MSG_LEN;
+		BUILD_BUG_ON(GUC_MAX_MMIO_MSG_LEN > SOFT_SCRATCH_COUNT);
 	}
 }
 
-- 
2.28.0

