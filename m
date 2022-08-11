Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BA85907D9
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 23:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294C518B723;
	Thu, 11 Aug 2022 21:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1949518B5A2;
 Thu, 11 Aug 2022 21:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660252112; x=1691788112;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VNi1/5JGKDD2w03JIs2UoFJvnRyEt00JKmBug4Ih8IE=;
 b=nnnlQ6FrFC86rdwD/fw7e7hR32Uc3NTk2EVslYISwYUr+spOIo1mGqFF
 w5mEKgR96hhjjGg/ndjYTH/1Yi7FvhOM/srpXbdf1k/eocdin7vFB1NQx
 LR0l06RmRTWjv+3CHQ1k87HY9xFoJtU/0PLBKCiePLWeQl65BEisbUryn
 MQuj0/6LscERv2kg9GYToXi+LxFr0dbeuKV8xpOvYjZV8m/+WStmI+gfn
 KwG/n1DKxGMxuUzhLYe6Lbj1vMXlU7z49PP4Jq6+OZgsIFNFaYUvd75Bc
 +ekOz9BphtE+Qh5sBy4CsoFVrJ6LQsp1fw7Q43Rky1O5LSFePeavTWfKr w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="271235705"
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; d="scan'208";a="271235705"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2022 14:08:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; d="scan'208";a="708768758"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2022 14:08:31 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: clear stalled request after a reset
Date: Thu, 11 Aug 2022 14:08:12 -0700
Message-Id: <20220811210812.3239621-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the GuC CTs are full and we need to stall the request submission
while waiting for space, we save the stalled request and where the stall
occurred; when the CTs have space again we pick up the request submission
from where we left off.

If a full GT reset occurs, the state of all contexts is cleared and all
non-guilty requests are unsubmitted, therefore we need to restart the
stalled request submission from scratch. To make sure that we do so,
clear the saved request after a reset.

Fixes note: the patch that introduced the bug is in 5.15, but no
officially supported platform had GuC submission enabled by default
in that kernel, so the backport to that particular version (and only
that one) can potentially be skipped.

Fixes: 925dc1cf58ed ("drm/i915/guc: Implement GuC submission tasklet")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: <stable@vger.kernel.org> # v5.15+
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 0d17da77e787..0d56b615bf78 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4002,6 +4002,13 @@ static inline void guc_init_lrc_mapping(struct intel_guc *guc)
 	/* make sure all descriptors are clean... */
 	xa_destroy(&guc->context_lookup);
 
+	/*
+	 * A reset might have occurred while we had a pending stalled request,
+	 * so make sure we clean that up.
+	 */
+	guc->stalled_request = NULL;
+	guc->submission_stall_reason = STALL_NONE;
+
 	/*
 	 * Some contexts might have been pinned before we enabled GuC
 	 * submission, so we need to add them to the GuC bookeeping.
-- 
2.25.1

