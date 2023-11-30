Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E82F7FE4B9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 01:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C8010E69B;
	Thu, 30 Nov 2023 00:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E56110E69B;
 Thu, 30 Nov 2023 00:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701303625; x=1732839625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o82GL61sMcpg8Mp6hDi9PDPoJiKJ+r1YJKZQkIvEAuU=;
 b=EmyRX90SxgwlDJtzXlbV4e+FKR9wIQpuWfwYR4Iv9pBEC7oXgYx7fQp9
 BRwCijdPbbwDWay+0ESr32iWB4XDeIBmFqLWXYxOuPNCbYemd8miz2I2H
 k0hYUrXMBjT50FHuvo01k/upF5CkVUxScft244PxxY0mCikVotVQHEwpY
 xI/Pgq/YVxRNf2mhn9j2199OxnFvGw57QkyLfk7crJ/8TGmKJL3f/ZC5P
 E6sUNWW8e380KLnPGacmEt29nOFFtD6B3uJMFYe/HInT9/fJNv73q7KGO
 QrkWNmL3hFzZ+PlfYH5o78csJ5whe6MXNKi+mnO3/EDT7UthnMqevqmQ4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373429290"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="373429290"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 16:20:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798099358"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="798099358"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga008.jf.intel.com with ESMTP; 29 Nov 2023 16:20:16 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 1/2] drm/i915/guc: Flush context destruction worker at
 suspend
Date: Wed, 29 Nov 2023 16:20:12 -0800
Message-Id: <20231130002013.282804-2-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231130002013.282804-1-alan.previn.teres.alexis@intel.com>
References: <20231130002013.282804-1-alan.previn.teres.alexis@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mousumi Jana <mousumi.jana@intel.com>,
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
index 04f8377fd7a3..6e3fb2fcce4f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1613,6 +1613,11 @@ static void guc_flush_submissions(struct intel_guc *guc)
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
index 3872d309ed31..b8b09b1bee3e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -690,6 +690,8 @@ void intel_uc_suspend(struct intel_uc *uc)
 		return;
 	}
 
+	intel_guc_submission_flush_work(guc);
+
 	with_intel_runtime_pm(&uc_to_gt(uc)->i915->runtime_pm, wakeref) {
 		err = intel_guc_suspend(guc);
 		if (err)
-- 
2.39.0

