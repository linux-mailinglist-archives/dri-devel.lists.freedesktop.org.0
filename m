Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D742F8BD450
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 20:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8AA10E9CD;
	Mon,  6 May 2024 18:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DRi9Ig3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9BC10E77F;
 Mon,  6 May 2024 18:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715018591; x=1746554591;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WA7gpQ5/qfbvyVtG/DErm9fN33Xlo9wpJfnFBInPi3Q=;
 b=DRi9Ig3zePvKNTihfXSIuZPJ9rJJfZe0Cs3OYrMCmgzR6sB9/ULMlh5k
 VXUfjC1ADixdcHUt5ZENmMEkJ3jS2MbOqFtSQbcxFqibDc53mfKPu4hbn
 IbabAmVXYhqYlyBV2UW1Hnl+Uc75LOchhVvNPMj5QrHXPMX96fsSfSix4
 t+41lk/OJoUOxwYpjXiTuzFZ0o/tosh98G+1qI3EWAm816pwkynrIo1iD
 F8KBxuhvFCrvMRe9YDxiMZ2VijfYOzkavobW6hkZcShONhW1DKAdbLE69
 BQV435REqdavg7UQ3Htc6qRR9hpMMgRU5A+d9VG3/C0HTtYZZz4qOFEon Q==;
X-CSE-ConnectionGUID: S5MQmKQiSl+sK024cTDDNQ==
X-CSE-MsgGUID: 4bDlN0wPRfCsGa6nCIaW+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="14561875"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="14561875"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 11:03:10 -0700
X-CSE-ConnectionGUID: FF9EackjSrSqgWEH1CEqMQ==
X-CSE-MsgGUID: Xxvn9M6fSfmyGc6e/ns1Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="59097542"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.17.128])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 11:03:08 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH] Revert "drm/i915: Remove extra multi-gt pm-references"
Date: Mon,  6 May 2024 20:02:50 +0200
Message-ID: <20240506180253.96858-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.45.0
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

This reverts commit 1f33dc0c1189efb9ae19c6fc22b64dd3e26261fb.

There was a patch supposed to fix an issue of illegal attempts to free a
still active i915 VMA object when parking a GT believed to be idle,
reported by CI on 2-GT Meteor Lake.  As a solution, an extra wakeref for
a Primary GT was acquired from i915_gem_do_execbuffer() -- see commit
f56fe3e91787 ("drm/i915: Fix a VMA UAF for multi-gt platform").

However, that fix occurred insufficient -- the issue was still reported by
CI.  That wakeref was released on exit from i915_gem_do_execbuffer(), then
potentially before completion of the request and deactivation of its
associated VMAs.  Moreover, CI reports indicated that single-GT platforms
also suffered sporadically from the same race.

Since that issue was fixed by another commit f3c71b2ded5c ("drm/i915/vma:
Fix UAF on destroy against retire race"), the changes introduced by that
insufficient fix were dropped as no longer useful.  However, that series
resulted in another VMA UAF scenario now being triggered in CI.

<4> [260.290809] ------------[ cut here ]------------
<4> [260.290988] list_del corruption. prev->next should be ffff888118c5d990, but was ffff888118c5a510. (prev=ffff888118c5a510)
<4> [260.291004] WARNING: CPU: 2 PID: 1143 at lib/list_debug.c:62 __list_del_entry_valid_or_report+0xb7/0xe0
..
<4> [260.291055] CPU: 2 PID: 1143 Comm: kms_plane Not tainted 6.9.0-rc2-CI_DRM_14524-ga25d180c6853+ #1
<4> [260.291058] Hardware name: Intel Corporation Meteor Lake Client Platform/MTL-P LP5x T3 RVP, BIOS MTLPFWI1.R00.3471.D91.2401310918 01/31/2024
<4> [260.291060] RIP: 0010:__list_del_entry_valid_or_report+0xb7/0xe0
...
<4> [260.291087] Call Trace:
<4> [260.291089]  <TASK>
<4> [260.291124]  i915_vma_reopen+0x43/0x80 [i915]
<4> [260.291298]  eb_lookup_vmas+0x9cb/0xcc0 [i915]
<4> [260.291579]  i915_gem_do_execbuffer+0xc9a/0x26d0 [i915]
<4> [260.291883]  i915_gem_execbuffer2_ioctl+0x123/0x2a0 [i915]
...
<4> [260.292301]  </TASK>
...
<4> [260.292506] ---[ end trace 0000000000000000 ]---
<4> [260.292782] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6ca3: 0000 [#1] PREEMPT SMP NOPTI
<4> [260.303575] CPU: 2 PID: 1143 Comm: kms_plane Tainted: G        W          6.9.0-rc2-CI_DRM_14524-ga25d180c6853+ #1
<4> [260.313851] Hardware name: Intel Corporation Meteor Lake Client Platform/MTL-P LP5x T3 RVP, BIOS MTLPFWI1.R00.3471.D91.2401310918 01/31/2024
<4> [260.326359] RIP: 0010:eb_validate_vmas+0x114/0xd80 [i915]
...
<4> [260.428756] Call Trace:
<4> [260.431192]  <TASK>
<4> [639.283393]  i915_gem_do_execbuffer+0xd05/0x26d0 [i915]
<4> [639.305245]  i915_gem_execbuffer2_ioctl+0x123/0x2a0 [i915]
...
<4> [639.411134]  </TASK>
...
<4> [639.449979] ---[ end trace 0000000000000000 ]---

We defer actually closing, unbinding and destroying a VMA until next idle
point, or until the object is freed in the meantime.  By postponing the
unbind, we allow for the VMA to be reopened by the client, avoiding the
work required to rebind the VMA.

Starting from commit b0647a5e79b1 ("drm/i915: Avoid live-lock with
i915_vma_parked()"), we assume that as long as a GT is held idle, no VMA
would be reopened while we destroy them.  That assumption is no longer
true in multi-GT configurations, where a VMA we reopen may be handled by a
GT different from the one that we already keep active via its engine while
we set up an execbuf request.

Restoring the extra GT0 PM wakeref removed from i915_gem_do_execbuffer()
processing path seems to fix this issue.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10608
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 42619fc05de48..090724fa766c9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -255,6 +255,7 @@ struct i915_execbuffer {
 	struct intel_context *context; /* logical state for the request */
 	struct i915_gem_context *gem_context; /** caller's context */
 	intel_wakeref_t wakeref;
+	intel_wakeref_t wakeref_gt0;
 
 	/** our requests to build */
 	struct i915_request *requests[MAX_ENGINE_INSTANCE + 1];
@@ -2685,6 +2686,7 @@ static int
 eb_select_engine(struct i915_execbuffer *eb)
 {
 	struct intel_context *ce, *child;
+	struct intel_gt *gt;
 	unsigned int idx;
 	int err;
 
@@ -2708,10 +2710,17 @@ eb_select_engine(struct i915_execbuffer *eb)
 		}
 	}
 	eb->num_batches = ce->parallel.number_children + 1;
+	gt = ce->engine->gt;
 
 	for_each_child(ce, child)
 		intel_context_get(child);
 	eb->wakeref = intel_gt_pm_get(ce->engine->gt);
+	/*
+	 * Keep GT0 active on MTL so that i915_vma_parked() doesn't
+	 * free VMAs while execbuf ioctl is validating VMAs.
+	 */
+	if (gt->info.id)
+		eb->wakeref_gt0 = intel_gt_pm_get(to_gt(gt->i915));
 
 	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
 		err = intel_context_alloc_state(ce);
@@ -2750,6 +2759,9 @@ eb_select_engine(struct i915_execbuffer *eb)
 	return err;
 
 err:
+	if (gt->info.id)
+		intel_gt_pm_put(to_gt(gt->i915), eb->wakeref_gt0);
+
 	intel_gt_pm_put(ce->engine->gt, eb->wakeref);
 	for_each_child(ce, child)
 		intel_context_put(child);
@@ -2763,6 +2775,12 @@ eb_put_engine(struct i915_execbuffer *eb)
 	struct intel_context *child;
 
 	i915_vm_put(eb->context->vm);
+	/*
+	 * This works in conjunction with eb_select_engine() to prevent
+	 * i915_vma_parked() from interfering while execbuf validates vmas.
+	 */
+	if (eb->gt->info.id)
+		intel_gt_pm_put(to_gt(eb->gt->i915), eb->wakeref_gt0);
 	intel_gt_pm_put(eb->context->engine->gt, eb->wakeref);
 	for_each_child(eb->context, child)
 		intel_context_put(child);
-- 
2.45.0

