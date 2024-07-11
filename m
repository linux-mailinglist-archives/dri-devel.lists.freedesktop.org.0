Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A88492EC6F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 18:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F390510E2E3;
	Thu, 11 Jul 2024 16:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XY4nY7BZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DD210E2E3;
 Thu, 11 Jul 2024 16:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720714562; x=1752250562;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g+C4Z1uYirgb3hW9Ol5Td2idagm1RdThfrrZAow1pDk=;
 b=XY4nY7BZi+GUeeJxvIXHg3Gc8X5Tb8gsCzxRTegvwrZFIdFITGa5bguv
 DohPi1fGQj6wMvJclbAJK6UvMJbpiZ9UyagSKV/kmnD6pAnjd+nscSc5x
 AsrfGALiCoIdUUcJS6jDArxdwuoaiZVcAOAf1YzNkKKjBmW0t/6qtrIl+
 MjCKOsx/KSzyKVA4xHzLsRKUQNwrcvV6pPlgeHsKN2DRFJINxLPshs8ai
 RpdsVL1iuyCeXxELBGX9AnPlfztyNI0UDqfuo2oQZEB5+1zaPZk7A9CDz
 ca3Voxyo72NoTIg1tnbxPNW0B7ZLYaz2BJSZRiDQLOttoyBbtfYcabitb w==;
X-CSE-ConnectionGUID: 8ZbVVfW3QL6ho8JFQdap1A==
X-CSE-MsgGUID: Csn18AzMRCeClnRAFKOhbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17956517"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="17956517"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 09:16:01 -0700
X-CSE-ConnectionGUID: MHtwAUG1Qvaq8hf6jIRZwg==
X-CSE-MsgGUID: EbSsQSZhR2aa4AyQZz9lGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="71811711"
Received: from nitin-super-server.iind.intel.com ([10.145.169.70])
 by fmviesa002.fm.intel.com with ESMTP; 11 Jul 2024 09:15:59 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: chris.p.wilson@intel.com, tursulin@ursulin.net,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, andi.shyti@intel.com,
 nirmoy.das@intel.com, janusz.krzysztofik@linux.intel.com,
 nitin.r.gote@intel.com, Chris Wilson <chris.p.wilson@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH v3] drm/i915/gt: Do not consider preemption during
 execlists_dequeue for gen8
Date: Thu, 11 Jul 2024 22:02:08 +0530
Message-Id: <20240711163208.1355736-1-nitin.r.gote@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're seeing a GPU HANG issue on a CHV platform, which was caused by
bac24f59f454 ("drm/i915/execlists: Enable coarse preemption boundaries for gen8").

Gen8 platform has only timeslice and doesn't support a preemption mechanism
as engines do not have a preemption timer and doesn't send an irq if the
preemption timeout expires. So, add a fix to not consider preemption
during dequeuing for gen8 platforms.

v2: Simplify can_preempt() function (Tvrtko Ursulin)

v3:
 - Inside need_preempt(), condition of can_preempt() is not required
   as simplified can_preempt() is enough. (Chris Wilson)

Fixes: bac24f59f454 ("drm/i915/execlists: Enable coarse preemption boundaries for gen8")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11396
Suggested-by: Andi Shyti <andi.shyti@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
CC: <stable@vger.kernel.org> # v5.2+
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 21829439e686..72090f52fb85 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3315,11 +3315,7 @@ static void remove_from_engine(struct i915_request *rq)
 
 static bool can_preempt(struct intel_engine_cs *engine)
 {
-	if (GRAPHICS_VER(engine->i915) > 8)
-		return true;
-
-	/* GPGPU on bdw requires extra w/a; not implemented */
-	return engine->class != RENDER_CLASS;
+	return GRAPHICS_VER(engine->i915) > 8;
 }
 
 static void kick_execlists(const struct i915_request *rq, int prio)
-- 
2.25.1

