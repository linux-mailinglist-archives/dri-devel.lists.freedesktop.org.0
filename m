Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DC68721A4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 15:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879E0112B5B;
	Tue,  5 Mar 2024 14:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ga+LoB2F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626DE112B5B;
 Tue,  5 Mar 2024 14:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709649498; x=1741185498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yg/LtYE+QEWnAIXNEkyIh5Dyq6a0eGNeFz37g0Ly9J4=;
 b=ga+LoB2FIPCKFd7mCooOUgVzY+bSnwgV8l/ZukkFoSJL6iZBMf5Od4m/
 EnAMjdnk68gJQsASqzMDFfADDlm5t1sOyqgZzvw8l3cTL89I/35TDiQPG
 b89un1lH+ULamfegoj76YRoONTv/mecuqOy/otC91ou03uCVPZQzSsQF4
 0+2bx5fsC/RfvGI+ihXCCNY6f04URBBnQb4FU8u3BzH+mPIGQ+pIVvqIV
 GixQoahTOFVHxBCUzm6LsXOCuPr+mv39Q3SyFzI5QZBvzSBeY6jD5v8Yi
 ySFAQYjoDD/Xy8rUxluq2AQp34x2eKWGbThDatttkZBgbO0gvovJN+8E5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21662446"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="21662446"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 06:38:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="13959940"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.25.18])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 06:38:15 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH v7 2/3] drm/i915: Remove extra multi-gt pm-references
Date: Tue,  5 Mar 2024 15:35:07 +0100
Message-ID: <20240305143747.335367-7-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240305143747.335367-5-janusz.krzysztofik@linux.intel.com>
References: <20240305143747.335367-5-janusz.krzysztofik@linux.intel.com>
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

There was an attempt to fix an issue of illegal attempts to free a still
active i915 VMA object when parking a GT believed to be idle, reported by
CI on 2-GT Meteor Lake.  As a solution, an extra wakeref for a Primary GT
was acquired from i915_gem_do_execbuffer() -- see commit f56fe3e91787
("drm/i915: Fix a VMA UAF for multi-gt platform").

However, that fix occurred insufficient -- the issue was still reported by
CI.  That wakeref was released on exit from i915_gem_do_execbuffer(), then
potentially before completion of the request and deactivation of its
associated VMAs.  Moreover, CI reports indicated that single-GT platforms
also suffered sporadically from the same race.

Since the issue has now been fixed by a preceding patch "drm/i915/vma: Fix
UAF on destroy against retire race", drop the no longer useful changes
introduced by that insufficient fix.

v3: Also drop the no longer used .wakeref_gt0 field from struct
    i915_execbuffer.
v2: Avoid the word "revert" in commit message (Rodrigo),
  - update commit description reusing relevant chunks dropped from the
    description of the proper fix (Rodrigo).

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index d3a771afb083e..3f20fe3811999 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -255,7 +255,6 @@ struct i915_execbuffer {
 	struct intel_context *context; /* logical state for the request */
 	struct i915_gem_context *gem_context; /** caller's context */
 	intel_wakeref_t wakeref;
-	intel_wakeref_t wakeref_gt0;
 
 	/** our requests to build */
 	struct i915_request *requests[MAX_ENGINE_INSTANCE + 1];
@@ -2686,7 +2685,6 @@ static int
 eb_select_engine(struct i915_execbuffer *eb)
 {
 	struct intel_context *ce, *child;
-	struct intel_gt *gt;
 	unsigned int idx;
 	int err;
 
@@ -2710,17 +2708,10 @@ eb_select_engine(struct i915_execbuffer *eb)
 		}
 	}
 	eb->num_batches = ce->parallel.number_children + 1;
-	gt = ce->engine->gt;
 
 	for_each_child(ce, child)
 		intel_context_get(child);
 	eb->wakeref = intel_gt_pm_get(ce->engine->gt);
-	/*
-	 * Keep GT0 active on MTL so that i915_vma_parked() doesn't
-	 * free VMAs while execbuf ioctl is validating VMAs.
-	 */
-	if (gt->info.id)
-		eb->wakeref_gt0 = intel_gt_pm_get(to_gt(gt->i915));
 
 	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
 		err = intel_context_alloc_state(ce);
@@ -2759,9 +2750,6 @@ eb_select_engine(struct i915_execbuffer *eb)
 	return err;
 
 err:
-	if (gt->info.id)
-		intel_gt_pm_put(to_gt(gt->i915), eb->wakeref_gt0);
-
 	intel_gt_pm_put(ce->engine->gt, eb->wakeref);
 	for_each_child(ce, child)
 		intel_context_put(child);
@@ -2775,12 +2763,6 @@ eb_put_engine(struct i915_execbuffer *eb)
 	struct intel_context *child;
 
 	i915_vm_put(eb->context->vm);
-	/*
-	 * This works in conjunction with eb_select_engine() to prevent
-	 * i915_vma_parked() from interfering while execbuf validates vmas.
-	 */
-	if (eb->gt->info.id)
-		intel_gt_pm_put(to_gt(eb->gt->i915), eb->wakeref_gt0);
 	intel_gt_pm_put(eb->context->engine->gt, eb->wakeref);
 	for_each_child(eb->context, child)
 		intel_context_put(child);
-- 
2.43.0

