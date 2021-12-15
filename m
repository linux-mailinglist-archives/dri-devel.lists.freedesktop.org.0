Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFAB476625
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 23:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B03610FAFA;
	Wed, 15 Dec 2021 22:45:59 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FB810FAF9;
 Wed, 15 Dec 2021 22:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639608357; x=1671144357;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0g2Jv1KjEPZ8natHZs+NwzyA5ZFrdak+79Ky/GUByU8=;
 b=Sl1bnimgwWaTSD88WZpj/1J8k5OTo0VeFnGStScawxxutxPjR4m4V9u1
 8bkdpuV5UpVm8wJse3ykHwy7osq51lK+DoWjfhptUA/TM427nyCFPcDc3
 H2Xhv05Grwjr9FEMpI69mHtBmR/EBrx6bsewP8VEXOZmQi/zjRL/tctRZ
 k9W7luQ3+2bJXQIs6DTkJPYjpCWQ03aCj62oEVYQaU9/V6VgfSaQzXtnF
 N2JH76/mlaGGlG6LalhmlNnqpipzxbPs3N96B06sE1E38D+fCid3IOPZS
 385XL1Szy6Nq/nstIXsqfFUD1G5s4NAOAoJn4qXpDQ3rzunwOW1AXPeGK w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="300129574"
X-IronPort-AV: E=Sophos;i="5.88,209,1635231600"; d="scan'208";a="300129574"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 14:45:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,209,1635231600"; d="scan'208";a="545749968"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga001.jf.intel.com with ESMTP; 15 Dec 2021 14:45:56 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Check for wedged before doing stuff
Date: Wed, 15 Dec 2021 14:45:56 -0800
Message-Id: <20211215224556.3382217-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

A fault injection probe test hit a BUG_ON in a GuC error path. It
showed that the GuC code could potentially attempt to do many things
when the device is actually wedged. So, add a check in to prevent that.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 97311119da6f..88f002c4d41b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1350,7 +1350,8 @@ submission_disabled(struct intel_guc *guc)
 	struct i915_sched_engine * const sched_engine = guc->sched_engine;
 
 	return unlikely(!sched_engine ||
-			!__tasklet_is_enabled(&sched_engine->tasklet));
+			!__tasklet_is_enabled(&sched_engine->tasklet) ||
+			test_bit(I915_WEDGED, &guc_to_gt(guc)->reset.flags));
 }
 
 static void disable_submission(struct intel_guc *guc)
-- 
2.25.1

