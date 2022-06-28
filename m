Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C28A55EDC5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 21:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1213C112FA4;
	Tue, 28 Jun 2022 19:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A6E112FA4;
 Tue, 28 Jun 2022 19:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656443866; x=1687979866;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GQJlT7LBDNLEOqeFlK9Ew25UILRZOeGNtugMH6AqiAE=;
 b=BrBcxG06KvRWXoJk/Y417W4ve7QakTmkJwSGA/tQgAvpjsJZnxWwBcCp
 TAZ55JQJfUJH6oUUQKF8THPK1sh49WU7/t05o8rGeY/4rJumqk2PKAOWQ
 XA6TJFo5TM7GLE7gXaDFknat/zW4jRMF+roRKuaMrqlxceA/nJJyJSw1W
 FBP2H1qBF40SLZjaYMKpn4qRrTJQFw1YzeGapqj7rOvdrfSx0zJT6bK7l
 YMTXXQEeGtEBPdXmRb2zecUmfx4OZPPsBhrF47bl50dvzmDEr5DAxXHCF
 4jtZnMtow35mJZh+ADWI9V93XhBL4ZmOpCTdc/KmlhZYui2rp1dFgujAI g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="280590090"
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; d="scan'208";a="280590090"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 12:17:46 -0700
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; d="scan'208";a="647048082"
Received: from orsosgc001.jf.intel.com ([10.165.21.154])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 12:17:46 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/reset: Handle reset timeouts under unrelated kernel
 hangs
Date: Tue, 28 Jun 2022 12:17:41 -0700
Message-Id: <20220628191741.28866-1-ashutosh.dixit@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

When resuming after hibernate sometimes we see hangs in unrelated kernel
subsystems. These hangs often result in the following i915 trace:

i915 0000:00:02.0: [drm] \
	*ERROR* intel_gt_reset_global timed out, cancelling all in-flight rendering.

implying our reset task has been starved by the hanging kernel subsystem,
causing us to inappropiately declare the system as wedged beyond recovery.

The trace would be caused by our synchronize_srcu_expedited() taking more
than the allowed 5s due to the unrelated kernel hang. But we neither need
to perform that synchronisation inside the reset watchdog, nor do we need
such a short timeout before declaring the device as unrecoverable.

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/3575
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index a5338c3fde7a0..e72744f6faedc 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1259,12 +1259,9 @@ static void intel_gt_reset_global(struct intel_gt *gt,
 	kobject_uevent_env(kobj, KOBJ_CHANGE, reset_event);
 
 	/* Use a watchdog to ensure that our reset completes */
-	intel_wedge_on_timeout(&w, gt, 5 * HZ) {
+	intel_wedge_on_timeout(&w, gt, 60 * HZ) {
 		intel_display_prepare_reset(gt->i915);
 
-		/* Flush everyone using a resource about to be clobbered */
-		synchronize_srcu_expedited(&gt->reset.backoff_srcu);
-
 		intel_gt_reset(gt, engine_mask, reason);
 
 		intel_display_finish_reset(gt->i915);
@@ -1373,6 +1370,9 @@ void intel_gt_handle_error(struct intel_gt *gt,
 		}
 	}
 
+	/* Flush everyone using a resource about to be clobbered */
+	synchronize_srcu_expedited(&gt->reset.backoff_srcu);
+
 	intel_gt_reset_global(gt, engine_mask, msg);
 
 	if (!intel_uc_uses_guc_submission(&gt->uc)) {
-- 
2.36.1

