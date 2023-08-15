Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F87677C4EA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 03:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B5710E23E;
	Tue, 15 Aug 2023 01:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6DC10E236;
 Tue, 15 Aug 2023 01:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692061933; x=1723597933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ITevjLj8nkfkuRNU5hSm2nyH+FwL27XsPoYGn1vugF4=;
 b=Lyd6qEX4uefrGyTZexMs5I1/u3DyJAv25acTrzh9P/So74sUa1iqOPNO
 H2Ld2M0ncja6lMoWY0cM1pJ6fidKpMGVLPEF9l8/8BY1HFnulTTQ8L9eX
 Eek/N0ryCZvFYbGVZu0/Ris1PqbMV+puyizlWI6kNRfClEKyzjntvj/5J
 sCR7IQrgSV+PxwFBAyMkQxVaXHFaaowlq5b6NF6kkDdJUqZ+p5XaMF9Y0
 sbdgwKH0HSXPTCMFfHV/X7Kh2/rtP7zJvBfUUrtbACib9B5GJskJflXcG
 xr9Rncr0sKHHHo8nBKz4FcuJq4bFaiBURhbxMQngkjBzHSNBGLllYluz1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403155166"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="403155166"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 18:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="803637041"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="803637041"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 14 Aug 2023 18:12:12 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/i915/guc: Flush context destruction worker at
 suspend
Date: Mon, 14 Aug 2023 18:12:08 -0700
Message-Id: <20230815011210.1188379-2-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230815011210.1188379-1-alan.previn.teres.alexis@intel.com>
References: <20230815011210.1188379-1-alan.previn.teres.alexis@intel.com>
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
Cc: John Harrison <john.c.harrison@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When suspending, flush the context-guc-id
deregistration worker at the final stages of
intel_gt_suspend_late when we finally call gt_sanitize
that eventually leads down to __uc_sanitize so that
the deregistration worker doesn't fire off later as
we reset the GuC microcontroller.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 +++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h | 2 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c             | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index a0e3ef1c65d2..050572bb8dbe 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1578,6 +1578,11 @@ static void guc_flush_submissions(struct intel_guc *guc)
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

