Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1195183AA6C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F420110F6E8;
	Wed, 24 Jan 2024 12:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5141610F6DD;
 Wed, 24 Jan 2024 12:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706101034; x=1737637034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rEsM9zg3uguPpEbZ+sFvUPkpWpGCxakQXbDodSEHzx4=;
 b=Xd8EmkgIg/t821lQzl74CI5re7MTh91K8auuY/eZGD0+gNw1EAMi+wZ3
 u0EKLFylxVKyTZp9n4oSQO1H7F7Snk9Nh5Cd1g2joHmp31qwIAOjAbuMF
 GOFZAJNZQ7UkaMvBYnMlclEPTzOEI0SsTD8A1rGHEPT7dMyJG0BLs3M2e
 KsL7KNYHwvPwFXtq2jcCGCOKApKGparRVEau24oM8wJZJzyG6rIYpkYWp
 Wa+elUujs88VHcSUanlDnoHMfmpZSOg/GnlYRwT6RX+jU7eeRn953AmUR
 CUuxVbm3xaVb/wxfb7FClmq57+tQzdXkPgw+pgwNv4nvgTM51OkajaU+M Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8594366"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8594366"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 04:57:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1898625"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.0.254])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 04:57:11 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 2/3] drm/i915: Remove extra multi-gt pm-references
Date: Wed, 24 Jan 2024 13:43:07 +0100
Message-ID: <20240124125643.590072-7-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124125643.590072-5-janusz.krzysztofik@linux.intel.com>
References: <20240124125643.590072-5-janusz.krzysztofik@linux.intel.com>
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
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Nirmoy Das <nirmoy.das@intel.com>
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

v2: Avoid the word "revert" in commit message (Rodrigo),
  - update commit description reusing relevant chunks dropped from the
    description of the proper fix (Rodrigo).

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index d3a771afb083e..cedca8fd8754d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2686,7 +2686,6 @@ static int
 eb_select_engine(struct i915_execbuffer *eb)
 {
 	struct intel_context *ce, *child;
-	struct intel_gt *gt;
 	unsigned int idx;
 	int err;
 
@@ -2710,17 +2709,10 @@ eb_select_engine(struct i915_execbuffer *eb)
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
@@ -2759,9 +2751,6 @@ eb_select_engine(struct i915_execbuffer *eb)
 	return err;
 
 err:
-	if (gt->info.id)
-		intel_gt_pm_put(to_gt(gt->i915), eb->wakeref_gt0);
-
 	intel_gt_pm_put(ce->engine->gt, eb->wakeref);
 	for_each_child(ce, child)
 		intel_context_put(child);
@@ -2775,12 +2764,6 @@ eb_put_engine(struct i915_execbuffer *eb)
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

