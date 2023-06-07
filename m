Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF89C725702
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AC110E457;
	Wed,  7 Jun 2023 08:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BBA10E457;
 Wed,  7 Jun 2023 08:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686125445; x=1717661445;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eyBUcZq82tJ89/u6a6llTwo7T9befTamyLsljEKH8DI=;
 b=bacKfRHLgeesuKidjbCL5SEZAzJqoy9zafm5ydiqDlbF5+W+B0xusCOr
 WCagy3GURPiDrIpgJfIN081UG3GhKiJThglwk5cWFc7LrkqPFvgPBIirA
 cctDvS8ZIvCSpruMEg1NH2HhaQ2nB3QIPhO68iZuPB8nxP5GabMN8V7oC
 diWfCn24k3IGLs9sbpfpg3HXMjJxrX9QSbEgZBQVoeh0/ZIX7P5qGpIkv
 Uer8/28IgY1rxL9C+hA4J6I85RLnzbqyOVxRo5s95dwQGeuoCQGOVE7DY
 bPJzxTry1Vxhyg2hfGPGuk5Pzdy7gHCR8EWnHWf0z22xh0goHc4wxSrrv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="443287513"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="443287513"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 01:10:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="774410151"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="774410151"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 01:10:42 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3] drm/i915: Fix a VMA UAF for multi-gt platform
Date: Wed,  7 Jun 2023 10:10:32 +0200
Message-Id: <20230607081032.19275-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ensure correct handling of closed VMAs on multi-gt platforms to prevent
Use-After-Free. Currently, when GT0 goes idle, closed VMAs that are
exclusively added to GT0's closed_vma link (gt->closed_vma) and
subsequently freed by i915_vma_parked(), which assumes the entire GPU is
idle. However, on platforms with multiple GTs, such as MTL, GT1 may
remain active while GT0 is idle. This causes GT0 to mistakenly consider
the closed VMAs in its closed_vma list as unnecessary, potentially
leading to Use-After-Free issues if a job for GT1 attempts to access a
freed VMA.

Although we do take a wakeref for GT0 but it happens later, after
evaluating VMAs. To mitigate this, it is necessary to hold a GT0 wakeref
early.

v2: Use gt id to detect multi-tile(Andi)
    Fix the incorrect error path.
v3: Add more comment(Andi)
    Use the new gt var when possible(Andrzej)

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Tested-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 5fb459ea4294..1de9de1e4782 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2692,6 +2692,7 @@ static int
 eb_select_engine(struct i915_execbuffer *eb)
 {
 	struct intel_context *ce, *child;
+	struct intel_gt *gt;
 	unsigned int idx;
 	int err;
 
@@ -2715,10 +2716,17 @@ eb_select_engine(struct i915_execbuffer *eb)
 		}
 	}
 	eb->num_batches = ce->parallel.number_children + 1;
+	gt = ce->engine->gt;
 
 	for_each_child(ce, child)
 		intel_context_get(child);
-	intel_gt_pm_get(ce->engine->gt);
+	intel_gt_pm_get(gt);
+	/*
+	 * Keep GT0 active on MTL so that i915_vma_parked() doesn't
+	 * free VMAs while execbuf ioctl is validating VMAs.
+	 */
+	if (gt->info.id)
+		intel_gt_pm_get(to_gt(gt->i915));
 
 	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
 		err = intel_context_alloc_state(ce);
@@ -2757,7 +2765,10 @@ eb_select_engine(struct i915_execbuffer *eb)
 	return err;
 
 err:
-	intel_gt_pm_put(ce->engine->gt);
+	if (gt->info.id)
+		intel_gt_pm_put(to_gt(gt->i915));
+
+	intel_gt_pm_put(gt);
 	for_each_child(ce, child)
 		intel_context_put(child);
 	intel_context_put(ce);
@@ -2770,6 +2781,12 @@ eb_put_engine(struct i915_execbuffer *eb)
 	struct intel_context *child;
 
 	i915_vm_put(eb->context->vm);
+	/*
+	 * This works in conjunction with eb_select_engine() to prevent
+	 * i915_vma_parked() from interfering while execbuf validates vmas.
+	 */
+	if (eb->gt->info.id)
+		intel_gt_pm_put(to_gt(eb->gt->i915));
 	intel_gt_pm_put(eb->gt);
 	for_each_child(eb->context, child)
 		intel_context_put(child);
-- 
2.39.0

