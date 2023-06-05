Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A347A7230BC
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 22:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50D310E023;
	Mon,  5 Jun 2023 20:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A45510E023;
 Mon,  5 Jun 2023 20:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685995833; x=1717531833;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hLwisyULdhNBdeB6X2y5EN5644QKNMsAYwDgMiAFebA=;
 b=EeGpCH3MvU/LkvRa451R4v0RzUZVGIatZkl8tu72lqm+mgivrGR0fF+5
 hD8oCQ3zX6gn/iwbrgrwXHEDCKjcyWw6yya25gV55XiXnyhzCgoJnVLN0
 SHV4InuP2CLY1KaRKWTs3UTbXTX7mNSzpiz05TrxiiQdnykDwUmi3F2vo
 yeDUG8VdQfvaFDHLm2Juvi+Vg/KvQPfUsg79qQi1TLVUEOFYve5XuNN6j
 bm+V6o5yTdN+82jkBegK1kiA493I46e4JOnTeisAdJl7U2M4ioH4OhkGj
 KCFpjE/abi+8RkQH2vGMOf/FyZmi+F45Ow5eJPh/Nc1D4cOaFtHga9FiE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="355324338"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="355324338"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 13:10:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="738472750"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="738472750"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 13:10:29 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Fix a VMA UAF for multi-gt platform
Date: Mon,  5 Jun 2023 22:10:21 +0200
Message-Id: <20230605201021.13928-1-nirmoy.das@intel.com>
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

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 5fb459ea4294..adcf8837dfe6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2692,6 +2692,7 @@ static int
 eb_select_engine(struct i915_execbuffer *eb)
 {
 	struct intel_context *ce, *child;
+	struct intel_gt *gt;
 	unsigned int idx;
 	int err;
 
@@ -2715,10 +2716,16 @@ eb_select_engine(struct i915_execbuffer *eb)
 		}
 	}
 	eb->num_batches = ce->parallel.number_children + 1;
+	gt = ce->engine->gt;
 
 	for_each_child(ce, child)
 		intel_context_get(child);
 	intel_gt_pm_get(ce->engine->gt);
+	/* Keep GT0 active on MTL so that i915_vma_parked() doesn't
+	 * free VMAs while execbuf ioctl is validating VMAs.
+	 */
+	if (gt != to_gt(gt->i915))
+		intel_gt_pm_get(to_gt(ce->engine->gt->i915));
 
 	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
 		err = intel_context_alloc_state(ce);
@@ -2757,6 +2764,9 @@ eb_select_engine(struct i915_execbuffer *eb)
 	return err;
 
 err:
+	if (ce->engine->gt != to_gt(ce->engine->gt->i915))
+		intel_gt_pm_get(to_gt(ce->engine->gt->i915));
+
 	intel_gt_pm_put(ce->engine->gt);
 	for_each_child(ce, child)
 		intel_context_put(child);
@@ -2770,6 +2780,8 @@ eb_put_engine(struct i915_execbuffer *eb)
 	struct intel_context *child;
 
 	i915_vm_put(eb->context->vm);
+	if (eb->gt != to_gt(eb->gt->i915))
+		intel_gt_pm_put(to_gt(eb->gt->i915));
 	intel_gt_pm_put(eb->gt);
 	for_each_child(eb->context, child)
 		intel_context_put(child);
-- 
2.39.0

