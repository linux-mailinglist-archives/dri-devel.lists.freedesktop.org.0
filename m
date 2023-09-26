Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA26E7AF3B8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 21:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6460B8920D;
	Tue, 26 Sep 2023 19:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA45410E151;
 Tue, 26 Sep 2023 19:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695755121; x=1727291121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AfekdFrKU3cdNAhVVxMdnMQpqFC8ttKXXrL8KhghVHY=;
 b=lhLn208+KxQvKFlBwbylPZ/+60ITXyGQtdwmckyevVBWWB98+c4bQMiM
 63FCg/i7bGGHCeQyMzdMtUFYfH2sbP8d+Jsc6sbF0e6/xnyes5uLSQ0dn
 G7ohk+FwwR/cckL/p4pIhgNPgGa5BiWgWa0NpnXBgMa80bxzKFglTKhQD
 JJRRdtq+5JGDT2AGMesNMJOCBqjHLkhmjGRMKOUi557JoX6utL3v4/4KS
 AEyW3Iwb7XE4vhuB8EtKVCw/5RrzMjFJCVrQ2uuhhq0IKBVK2Q4wvwXzr
 1WGhX22C0cdamR9EHhUtCiowlh49Tsb93XkvTcN4H6fIpcL0KcuUcI/rx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="448141891"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="448141891"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 12:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="819142179"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="819142179"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 26 Sep 2023 12:05:19 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 1/3] drm/i915/guc: Flush context destruction worker at
 suspend
Date: Tue, 26 Sep 2023 12:05:16 -0700
Message-Id: <20230926190518.105393-2-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
References: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
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
Cc: , Alan Previn <alan.previn.teres.alexis@intel.com>,
	dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, intel.com@freedesktop.org,
	Mousumi Jana <mousumi.jana@intel.com>,
	John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When suspending, flush the context-guc-id
deregistration worker at the final stages of
intel_gt_suspend_late when we finally call gt_sanitize
that eventually leads down to __uc_sanitize so that
the deregistration worker doesn't fire off later as
we reset the GuC microcontroller.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Tested-by: Mousumi Jana <mousumi.jana@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 +++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h | 2 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c             | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index ae3495a9c814..fdd7179f502a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1610,6 +1610,11 @@ static void guc_flush_submissions(struct intel_guc *guc)
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
 
+void intel_guc_submission_flush_work(struct intel_guc *guc)
+{
+	flush_work(&guc->submission_state.destroyed_worker);
+}
+
 static void guc_flush_destroyed_contexts(struct intel_guc *guc);
 
 void intel_guc_submission_reset_prepare(struct intel_guc *guc)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
index c57b29cdb1a6..b6df75622d3b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
@@ -38,6 +38,8 @@ int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
 				   bool interruptible,
 				   long timeout);
 
+void intel_guc_submission_flush_work(struct intel_guc *guc);
+
 static inline bool intel_guc_submission_is_supported(struct intel_guc *guc)
 {
 	return guc->submission_supported;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 98b103375b7a..eb3554cb5ea4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -693,6 +693,8 @@ void intel_uc_suspend(struct intel_uc *uc)
 		return;
 	}
 
+	intel_guc_submission_flush_work(guc);
+
 	with_intel_runtime_pm(&uc_to_gt(uc)->i915->runtime_pm, wakeref) {
 		err = intel_guc_suspend(guc);
 		if (err)
-- 
2.39.0

