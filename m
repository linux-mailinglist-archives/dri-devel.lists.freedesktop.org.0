Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52825561053
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 06:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0645D10E1A1;
	Thu, 30 Jun 2022 04:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8DE10E1A1;
 Thu, 30 Jun 2022 04:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656564004; x=1688100004;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BNNjYYEtM5z3M5vjTMPm7UWl8H2siGQIvl8490CfHco=;
 b=cFWpfHs9oLkd64PMl8LGsJlx3Vnx63oxQMPjkHt85qCB0PQm4Yl4IH2O
 5TsJGWkE6315/w+itWKS83y/4aV7ueGWXV682wctE+VkDPuA9KmRJuyON
 yEGxcqNfqYAwhdJiqPNfuN4dUC0vxoAO0soRjF5GE/w4nCM3wLPWnaBFo
 jX6Tua5sTCg2jz3ssQBZ0x/i0WtGv5Y4wyuqU4n4W0auzLjQolu27veXb
 vlaXRkpVg2Q/ZzcD4wJnXtDHDBu31dm/EI2Nd07ZFBEXVC04BWIJxrzKi
 g1Hsh0crdLKkqKZClevI3rapaKEhhPVcf6G2J8qI2K+5rnKEj6RNxieMM w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="346231443"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="346231443"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 21:40:04 -0700
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="693892389"
Received: from orsosgc001.jf.intel.com ([10.165.21.135])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 21:40:03 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/reset: Handle reset timeouts under unrelated kernel
 hangs
Date: Wed, 29 Jun 2022 21:39:59 -0700
Message-Id: <20220630043959.5708-1-ashutosh.dixit@intel.com>
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
 Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

When resuming after hibernate sometimes we see hangs in unrelated kernel
subsystems. These hangs often result in the following i915 trace:

i915 0000:00:02.0: [drm] *ERROR* \
	intel_gt_reset_global timed out, cancelling all in-flight rendering

implying our reset task has been starved by the hanging kernel subsystem,
causing us to inappropiately declare the system as wedged beyond recovery.

The trace would be caused by our synchronize_srcu_expedited() taking more
than the allowed 5s due to the unrelated kernel hang. But we neither need
to perform that synchronisation inside the reset watchdog, nor do we need
such a short timeout before declaring the device as unrecoverable.

v2: Restore watchdog timeout to the previous 5 seconds (Ashutosh)

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/3575
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index a5338c3fde7a..1cbe65a5b0fd 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1262,9 +1262,6 @@ static void intel_gt_reset_global(struct intel_gt *gt,
 	intel_wedge_on_timeout(&w, gt, 5 * HZ) {
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
2.34.1

