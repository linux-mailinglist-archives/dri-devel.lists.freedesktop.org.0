Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFE6A1A7CD
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 17:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B9E10E87A;
	Thu, 23 Jan 2025 16:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KMx5/SnE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249EE10E877;
 Thu, 23 Jan 2025 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737649437; x=1769185437;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YTgP40cI81G5n6maiGL9JhuNqPSJ2j6D3P7ZPdla1sg=;
 b=KMx5/SnEbxZGFa73B3WAlxxTsPM2gv4L0DqHoVyhsd6RcVuIuOAv129u
 jPFXfPOonG4x1MTYu0oztrpMBPupkzXfW7S5/7xVo2z+sNGX2p0wUiRDO
 bkjzGQLajy/O6ML0J9rMP41jUAp4N+yz2o5nSM6sH5CX9zm0KMzJZIaEU
 1+ynJQtma/aWuRtMUdIW8vkBhcFvEuXklY8VOoKU5GNjXM1w2AfoTHyBg
 MXCnwtcZWZUJNla16A79uLLdkAzCC3hDzzN73Xcdsxj1YSuWlXyHqbH9Q
 WHgmJ3NG93gHaxm4ofFji0iYIs7Iq39HULfHWecgG8KX7AdfeEHgyVMaY w==;
X-CSE-ConnectionGUID: 7HCnpCnPTXWEE0QYoLUmgg==
X-CSE-MsgGUID: 8p9aoARiTIWqCpo3ugsqDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55572639"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="55572639"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 08:23:56 -0800
X-CSE-ConnectionGUID: 2Q3zx59uRduvqMyYowj1UA==
X-CSE-MsgGUID: drxUALqwRKeyPeoKVtgjkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="107625295"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa008.fm.intel.com with ESMTP; 23 Jan 2025 08:23:55 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Andi Shyti <andi.shyti@intel.com>
Subject: [PATCH v1] drm/i915/guc: Always disable interrupt ahead of
 synchronize_irq
Date: Thu, 23 Jan 2025 08:23:51 -0800
Message-Id: <20250123162351.1364395-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The purpose of synchronize_irq is to wait for any pending IRQ handlers for the
interrupt to complete, if synchronize_irq called before interrupt disabled, an
tiny timing window created, where no more pending IRQ, but interrupt not
disabled yet. Meanwhile, if the interrupt event happened in this timing window,
an unexpected IRQ handling will be triggered.

Fixed by always disable interrupt ahead of synchronize_irq.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13454
Fixes: 26705e20752a ("drm/i915: Support for GuC interrupts")
Fixes: 54c52a841250 ("drm/i915/guc: Correctly handle GuC interrupts on Gen11")
Fixes: 2ae096872a2c ("drm/i915/pxp: Implement PXP irq handler")
Fixes: 3e7abf814193 ("drm/i915: Extract GT render power state management")

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

---
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Andi Shyti <andi.shyti@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c      | 3 +--
 drivers/gpu/drm/i915/gt/uc/intel_guc.c   | 4 ++--
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index fa304ea088e4..0fe7a8d7f460 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -244,8 +244,8 @@ static void rps_disable_interrupts(struct intel_rps *rps)
 	gen6_gt_pm_disable_irq(gt, GEN6_PM_RPS_EVENTS);
 	spin_unlock_irq(gt->irq_lock);
 
+	rps_reset_interrupts(rps);
 	intel_synchronize_irq(gt->i915);
-
 	/*
 	 * Now that we will not be generating any more work, flush any
 	 * outstanding tasks. As we are called on the RPS idle path,
@@ -254,7 +254,6 @@ static void rps_disable_interrupts(struct intel_rps *rps)
 	 */
 	cancel_work_sync(&rps->work);
 
-	rps_reset_interrupts(rps);
 	GT_TRACE(gt, "interrupts:off\n");
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 5949ff0b0161..3e7b2c6cdca4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -116,9 +116,9 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
 	gen6_gt_pm_disable_irq(gt, gt->pm_guc_events);
 
 	spin_unlock_irq(gt->irq_lock);
-	intel_synchronize_irq(gt->i915);
 
 	gen9_reset_guc_interrupts(guc);
+	intel_synchronize_irq(gt->i915);
 }
 
 static bool __gen11_reset_guc_interrupts(struct intel_gt *gt)
@@ -154,9 +154,9 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
 	struct intel_gt *gt = guc_to_gt(guc);
 
 	guc->interrupts.enabled = false;
-	intel_synchronize_irq(gt->i915);
 
 	gen11_reset_guc_interrupts(guc);
+	intel_synchronize_irq(gt->i915);
 }
 
 static void guc_dead_worker_func(struct work_struct *w)
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
index d81750b9bdda..b82a667e7ac0 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
@@ -101,9 +101,9 @@ void intel_pxp_irq_disable(struct intel_pxp *pxp)
 	__pxp_set_interrupts(gt, 0);
 
 	spin_unlock_irq(gt->irq_lock);
-	intel_synchronize_irq(gt->i915);
 
 	pxp_irq_reset(gt);
+	intel_synchronize_irq(gt->i915);
 
 	flush_work(&pxp->session_work);
 }
-- 
2.34.1

