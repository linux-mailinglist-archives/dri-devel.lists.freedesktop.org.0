Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C503362F2CD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 11:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8928C10E231;
	Fri, 18 Nov 2022 10:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2394710E231;
 Fri, 18 Nov 2022 10:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668768196; x=1700304196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q3VwCvNwJ2g98vRpMFQwMrtaGF58hclagKL/V0R0kj8=;
 b=NVeA754xSsag2kNLUxu1DU4w4tE2ptOVKe1eghlfIM8HIyIoHdWHgnVG
 xrgJPWh2I5KikoqXIl0K3IphyRnAX/cdbfqQ+sy6i4yNp3VK0ilfRvKsh
 Zm8B1Viuxt4etFllXEW0GaDg5GCU0tVt0zno08FqDyz7+rIvDVf4mvWz9
 LQp0YvBeElGhNMPsnRL/p5CYrCkq82y6rlSVTC2qVy8JE+FgfMxB5R0J9
 sG2N2PF7tlmTOobZlqB9ErpqaBdtky1WQB7tuyE6BD5nf5Qc1FWBKHix8
 CFW/9hneopAAzvoiON7k/r2/cu4REkOchVDMrHqFUn7QMZP4HFP9I1PsF A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="311812868"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; d="scan'208";a="311812868"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 02:43:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="729188072"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; d="scan'208";a="729188072"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.29.15])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 02:43:11 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 1/2] drm/i915: Fix negative value passed as remaining time
Date: Fri, 18 Nov 2022 11:42:21 +0100
Message-Id: <20221118104222.57328-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118104222.57328-1-janusz.krzysztofik@linux.intel.com>
References: <20221118104222.57328-1-janusz.krzysztofik@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work
with GuC") extended the API of intel_gt_retire_requests_timeout() with an
extra argument 'remaining_timeout', intended for passing back unconsumed
portion of requested timeout when 0 (success) is returned.  However, when
request retirement happens to succeed despite an error returned by a call
to dma_fence_wait_timeout(), that error code (a negative value) is passed
back instead of remaining time.  If we then pass that negative value
forward as requested timeout to intel_uc_wait_for_idle(), an explicit BUG
will be triggered.

If request retirement succeeds but an error code other than -ETIME is
passed back via remaininig_timeout, we have no clue on how much of
the initial timeout might have been left for spending it on waiting for
GuC to become idle.  Then, we have no choice other than fail in that case
-- do it.  However, if -ETIME is returned via remaining_timeout then we
know that no more time has been left.  Then, pass 0 timeout value to
intel_uc_wait_for_idle() to give it a chance to return success if GuC is
already idle.

v2: Fix the issue on the caller side, not the provider.

Fixes: b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC")
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: stable@vger.kernel.org # v5.15+
---
 drivers/gpu/drm/i915/gt/intel_gt.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 0325f071046ca..5d612ba547d23 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -677,8 +677,15 @@ int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout)
 			return -EINTR;
 	}
 
-	return timeout ? timeout : intel_uc_wait_for_idle(&gt->uc,
-							  remaining_timeout);
+	if (timeout)
+		return timeout;
+
+	if (remaining_timeout == -ETIME)
+		remaining_timeout = 0;
+	else if (remaining_timeout < 0)
+		return remaining_timeout;
+
+	return intel_uc_wait_for_idle(&gt->uc, remaining_timeout);
 }
 
 int intel_gt_init(struct intel_gt *gt)
-- 
2.25.1

