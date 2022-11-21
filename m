Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C4F63271A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 15:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A063710E2E1;
	Mon, 21 Nov 2022 14:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA6710E2E1;
 Mon, 21 Nov 2022 14:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669042668; x=1700578668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/gk5YgJMWdIZCmvoPuQNxhekkoRPTbPYrEnLp+jttfI=;
 b=cdewYxH3Mtma2OCVxODOBKV911WRUYJ9Xi0W8IY4rLN3MkZt/Q3t3uHm
 KiShQJNdvaL4jhvxkGu2DWs17HB4jhQKXndVlQdn7vB77tM/P0OOMumT7
 f37yfbuUYJfDImPuCOyNGjfd2gC/mm7wbeI3jBTdyOyOOPONYa21Fcl6H
 uP9A9wHp/Yi7eLeph0orsoKsSEiMWnOhgoaxBiKeS9u3qILEtelgANEwH
 jnb5Ur85HjBh3b5pcVkdcNsgVRmX6Ui/EG2j0yJfNYiYNNupx85LtZH4N
 XL3It6OVF5X0HCfNQZqqgJJHRwAL1uDmlZG1rc7QXCJLc0DVZ81gqY2eR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="296930363"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="296930363"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 06:57:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="765985078"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="765985078"
Received: from jkrzyszt-mobl1.ger.corp.intel.com (HELO
 jkrzyszt-mobl1.intranet) ([10.213.16.21])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 06:57:43 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v3 1/2] drm/i915: Fix negative value passed as remaining time
Date: Mon, 21 Nov 2022 15:56:54 +0100
Message-Id: <20221121145655.75141-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221121145655.75141-1-janusz.krzysztofik@linux.intel.com>
References: <20221121145655.75141-1-janusz.krzysztofik@linux.intel.com>
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

If request retirement succeeds but an error code is passed back via
remaininig_timeout, we may have no clue on how much of the initial timeout
might have been left for spending it on waiting for GuC to become idle.
OTOH, since all pending requests have been successfully retired, that
error code has been already ignored by intel_gt_retire_requests_timeout(),
then we shouldn't fail.

Assume no more time has been left on error and pass 0 timeout value to
intel_uc_wait_for_idle() to give it a chance to return success if GuC is
already idle.

v3: Don't fail on any error passed back via remaining_timeout.

v2: Fix the issue on the caller side, not the provider.

Fixes: b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC")
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: stable@vger.kernel.org # v5.15+
---
 drivers/gpu/drm/i915/gt/intel_gt.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index b5ad9caa55372..7ef0edb2e37cd 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -677,8 +677,13 @@ int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout)
 			return -EINTR;
 	}
 
-	return timeout ? timeout : intel_uc_wait_for_idle(&gt->uc,
-							  remaining_timeout);
+	if (timeout)
+		return timeout;
+
+	if (remaining_timeout < 0)
+		remaining_timeout = 0;
+
+	return intel_uc_wait_for_idle(&gt->uc, remaining_timeout);
 }
 
 int intel_gt_init(struct intel_gt *gt)
-- 
2.25.1

