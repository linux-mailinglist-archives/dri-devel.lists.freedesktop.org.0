Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266656C236A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 22:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5DC10E061;
	Mon, 20 Mar 2023 21:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1766B10E31B;
 Mon, 20 Mar 2023 21:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679346655; x=1710882655;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4TSzp8geWYSH3t3Cz3M+99l/my3RnfC3wA0zNkbDmAQ=;
 b=ZEZxSiRY/0dA/pSvTEGQox9WFkFDIw9FQ0IUGwXxLEAfUAIKnlmGWUCq
 +I8/3O75rKsHl74ZkRA8kAkXmgoGgJ/03VXRHPzHGYGb1Z2AV3Su5PDjY
 s9skeqJWQyHCxSgw93TAPuOXPb0MkKXOfuYQYqsZLwSWNeASirb8Y4jrX
 hQaUupgOdj6z8dOIeHRkwgdXFSvhoSyFN7eT9XLJJ0y77kY81FUyj4X7a
 HgoPycWUjlFXabT/IzEi1+1mnSkmZnVF4pQUdSdvH93qbqC52W+MFXmRS
 jvLVGOubS1z7nIczOLl0NC9meZQmV9rlQfhBIdYWsERR99n7HokX18WKx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="337497116"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="337497116"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 14:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="674559616"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="674559616"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 14:10:54 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: limit double GT reset to pre-MTL
Date: Mon, 20 Mar 2023 14:10:38 -0700
Message-Id: <20230320211039.1513368-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 3db9d590557d ("drm/i915/gt: Reset twice") modified the code to
always hit the GDRST register twice when doing a reset, with the
reported aim to fix invalid post-reset engine state on some platforms
(Jasperlake being the only one actually mentioned).

This is a problem on MTL, due to the fact that we have to apply a time
consuming WA (coming in the next patch) every time we hit the GDRST
register in a way that can include the GSC engine. Even post MTL, the
expectation is that we'll have some work to do before and after hitting
the GDRST if the GSC is involved.

Since the issue requiring the double reset seems to be limited to older
platforms, instead of trying to handle the double-reset on MTL and
future platforms it is just easier to turn it off. The default on MTL is
also for GuC to own engine reset, with i915 only covering full-GT reset.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 35 +++++++++++++++------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 0bb9094fdacd..2c3463f77e5c 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -268,9 +268,27 @@ static int ilk_do_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask,
 static int gen6_hw_domain_reset(struct intel_gt *gt, u32 hw_domain_mask)
 {
 	struct intel_uncore *uncore = gt->uncore;
-	int loops = 2;
+	int loops;
 	int err;
 
+	/*
+	 * On some platforms, e.g. Jasperlake, we see that the engine register
+	 * state is not cleared until shortly after GDRST reports completion,
+	 * causing a failure as we try to immediately resume while the internal
+	 * state is still in flux. If we immediately repeat the reset, the
+	 * second reset appears to serialise with the first, and since it is a
+	 * no-op, the registers should retain their reset value. However, there
+	 * is still a concern that upon leaving the second reset, the internal
+	 * engine state is still in flux and not ready for resuming.
+	 *
+	 * Starting on MTL, there are some prep steps that we need to do when
+	 * resetting some engines that need to be applied every time we write to
+	 * GEN6_GDRST. As those are time consuming (tens of ms), we don't want
+	 * to perform that twice, so, since the Jasperlake issue hasn't been
+	 * observed on MTL, we avoid repeating the reset on newer platforms.
+	 */
+	loops = GRAPHICS_VER_FULL(gt->i915) < IP_VER(12, 70) ? 2 : 1;
+
 	/*
 	 * GEN6_GDRST is not in the gt power well, no need to check
 	 * for fifo space for the write or forcewake the chip for
@@ -279,20 +297,7 @@ static int gen6_hw_domain_reset(struct intel_gt *gt, u32 hw_domain_mask)
 	do {
 		intel_uncore_write_fw(uncore, GEN6_GDRST, hw_domain_mask);
 
-		/*
-		 * Wait for the device to ack the reset requests.
-		 *
-		 * On some platforms, e.g. Jasperlake, we see that the
-		 * engine register state is not cleared until shortly after
-		 * GDRST reports completion, causing a failure as we try
-		 * to immediately resume while the internal state is still
-		 * in flux. If we immediately repeat the reset, the second
-		 * reset appears to serialise with the first, and since
-		 * it is a no-op, the registers should retain their reset
-		 * value. However, there is still a concern that upon
-		 * leaving the second reset, the internal engine state
-		 * is still in flux and not ready for resuming.
-		 */
+		/* Wait for the device to ack the reset requests. */
 		err = __intel_wait_for_register_fw(uncore, GEN6_GDRST,
 						   hw_domain_mask, 0,
 						   2000, 0,
-- 
2.37.3

