Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 780DE93951D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 23:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBDB10E323;
	Mon, 22 Jul 2024 21:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gTiyCCZm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92D010E334;
 Mon, 22 Jul 2024 21:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721682424; x=1753218424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o4lTucE/YybaswT34FevEnarms9wVB2T0SXwubW+jOY=;
 b=gTiyCCZm+EjKLCcscghEJrEVBFxu9Ev15dgZOD3TPQW/qP8Uul19GmzJ
 ddqMchjW8BIUQF72TmaE1uXHoMOo+C1fOk1Ic4Cl/ZiQihuZ1vZLbSYdr
 aP1AazVtO+gg4ajQa71St9ii/vk9QdhMiON4r+AnS+Il3IxCdx/OzsVCH
 KlWLAyyjWDVTQnCkP7gDVHXnJUofwzeE6wEiJaPIBGtfk7r+FnnRmLpzu
 XNbgxT5nZ7cRigE7mPFG5RNpqVM/PWnsNlW6j07syta7F672qeiU2Wb4W
 jTKK+tq6zCmzxQQj1GJmwO4fpGXuCrfKsSzMxykf2ylgNOiepw7tGDZ1W g==;
X-CSE-ConnectionGUID: l/IcHFuoRXCRE4JqsgdzJA==
X-CSE-MsgGUID: j3bm0aS0R/GjNfLnrErG5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30428328"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="30428328"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 14:07:03 -0700
X-CSE-ConnectionGUID: 2LXmSF7dQTaMagER66M4bw==
X-CSE-MsgGUID: WLvDDELxSzq0X9+MrTcTRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="51653313"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 14:07:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	linux-perf-users@vger.kernel.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 7/7] drm/i915/pmu: Do not set event_init to NULL
Date: Mon, 22 Jul 2024 14:06:48 -0700
Message-ID: <20240722210648.80892-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722210648.80892-1-lucas.demarchi@intel.com>
References: <20240722210648.80892-1-lucas.demarchi@intel.com>
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

event_init is not an optional function pointer from perf events. Now
that pmu unregister happens only when freeing i915, setting it to NULL
only protects other functions in i915. Replace that by checking
pmu->closed.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index df53a8fe53ec..c5738035bc2f 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -303,7 +303,7 @@ void i915_pmu_gt_parked(struct intel_gt *gt)
 {
 	struct i915_pmu *pmu = &gt->i915->pmu;
 
-	if (!pmu->base.event_init)
+	if (pmu->closed)
 		return;
 
 	spin_lock_irq(&pmu->lock);
@@ -325,7 +325,7 @@ void i915_pmu_gt_unparked(struct intel_gt *gt)
 {
 	struct i915_pmu *pmu = &gt->i915->pmu;
 
-	if (!pmu->base.event_init)
+	if (pmu->closed)
 		return;
 
 	spin_lock_irq(&pmu->lock);
@@ -1325,12 +1325,12 @@ void i915_pmu_register(struct drm_i915_private *i915)
 err_groups:
 	kfree(pmu->base.attr_groups);
 err_attr:
-	pmu->base.event_init = NULL;
 	free_event_attributes(pmu);
 err_name:
 	if (IS_DGFX(i915))
 		kfree(pmu->name);
 err:
+	pmu->closed = true;
 	drm_notice(&i915->drm, "Failed to register PMU!\n");
 }
 
@@ -1346,6 +1346,4 @@ void i915_pmu_unregister(struct drm_i915_private *i915)
 
 	hrtimer_cancel(&pmu->timer);
 	i915_pmu_unregister_cpuhp_state(pmu);
-
-	pmu->base.event_init = NULL;
 }
-- 
2.43.0

