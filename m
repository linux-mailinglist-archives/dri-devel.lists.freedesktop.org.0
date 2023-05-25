Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B907E7106FE
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 10:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275A410E842;
	Thu, 25 May 2023 08:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF11110E7ED;
 Thu, 25 May 2023 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685002324; x=1716538324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b8PFk1db7qRA/Sx9j33l/xEeSFSE6Uz3x7Ra6fQOEqQ=;
 b=hNgFAWdSss1yXA+8t//TVAHNBuczzjKd6RazoOOcvZyAq9EMO1Gzy5bg
 3BzN0B1BWk2Ou+B9L3Mz11GNPW+cu/HiCWDdWJqPj2r20oMz36DLrAjOb
 5s59v12+8OexyUciFyp6b6GJ2Z34dq7WFqzpMg9+9O1aVN9gGd4gdyKgS
 H7BtzKMoW3rt6Nw73xC+Q/OzmWMGW02XS9Pd57RCI+fe2N/oI4AHExEyA
 abGIGj3UrmTgxhu1iFXYySuZaG8g81ckqP1slDpQSa0B04el0AoF6vD2b
 COnn/UXwY6L9T/L5Qdz0j/+s5wE64YnAI6/5T1AGrd7eGNsYVkqKt/ZeU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="417288516"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="417288516"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:11:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="655123009"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="655123009"
Received: from moiraric-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.234.103])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:11:51 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/i915: Include RPS threshold in error state
Date: Thu, 25 May 2023 09:11:33 +0100
Message-Id: <20230525081133.215292-6-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525081133.215292-1-tvrtko.ursulin@linux.intel.com>
References: <20230525081133.215292-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Now that we allow them to be modified, lets include them in the error
state so it is visible when they have been modified in GPU hang triage.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 5 +++++
 drivers/gpu/drm/i915/i915_gpu_error.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index ec368e700235..f9733c159b9b 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -740,6 +740,8 @@ static void err_print_gt_global_nonguc(struct drm_i915_error_state_buf *m,
 	err_printf(m, "GT awake: %s\n", str_yes_no(gt->awake));
 	err_printf(m, "CS timestamp frequency: %u Hz, %d ns\n",
 		   gt->clock_frequency, gt->clock_period_ns);
+	err_printf(m, "RPS thresholds up/down: %u/%u %%\n",
+		   gt->rps.up_threshold, gt->rps.down_threshold);
 	err_printf(m, "EIR: 0x%08x\n", gt->eir);
 	err_printf(m, "PGTBL_ER: 0x%08x\n", gt->pgtbl_er);
 
@@ -2025,6 +2027,9 @@ intel_gt_coredump_alloc(struct intel_gt *gt, gfp_t gfp, u32 dump_flags)
 	gc->_gt = gt;
 	gc->awake = intel_gt_pm_is_awake(gt);
 
+	gc->rps.up_threshold = gt->rps.power.up_threshold;
+	gc->rps.down_threshold = gt->rps.power.down_threshold;
+
 	gt_record_display_regs(gc);
 	gt_record_global_nonguc_regs(gc);
 
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
index a78c061ce26f..6d2996ad2abb 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.h
+++ b/drivers/gpu/drm/i915/i915_gpu_error.h
@@ -140,6 +140,11 @@ struct intel_gt_coredump {
 	bool awake;
 	bool simulated;
 
+	struct {
+		u8 up_threshold;
+		u8 down_threshold;
+	} rps;
+
 	struct intel_gt_info info;
 
 	/* Generic register state */
-- 
2.39.2

