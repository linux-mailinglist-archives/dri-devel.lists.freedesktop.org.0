Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5334383652A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 15:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E37C10EF70;
	Mon, 22 Jan 2024 14:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6CC10EF66;
 Mon, 22 Jan 2024 14:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705932640; x=1737468640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i6oPMu8f1VF/d2yiqAqgoNeURkenBK9X/0SyYUajYJw=;
 b=TJgKyX8iKkWeyY0ohYfkfgTyrDX+iGCG5/wL7xZ4/4a8/YTZPO3Y5vD9
 2yLtYCfYqNiKROzggmYh+6Nbc83oj/WYppCGz+8NE/xqlKYTfhHwfl2KQ
 25Wcuz3WkSymaBRTjGfnGiUVo2JIjO13+GizIw+gd2zFXWk6JulZvaQRp
 HodvY/ABDTm/lj/59cgWFRphxAALNJW5Z2hTtJgxzUgKZjjHgx2GGnJCs
 1tnNBba2+PhjaqK8pBJmGYUO8Amicx/+X2tq+h9wmF1EB2eNeEo8z9knl
 mVKrL/rxWWseZyL+2tjJ8F7ySuf46rhaYZ8uJ+RPaNIbvxFf3ceQqqt+b Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8313825"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8313825"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 06:10:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="855943828"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="855943828"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.20.214])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 06:10:34 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 2/3] Manually revert "drm/i915: Fix a VMA UAF for multi-gt
 platform"
Date: Mon, 22 Jan 2024 15:04:43 +0100
Message-ID: <20240122141007.401490-7-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122141007.401490-5-janusz.krzysztofik@linux.intel.com>
References: <20240122141007.401490-5-janusz.krzysztofik@linux.intel.com>
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

This reverts changes introduced by commit f56fe3e91787, obsoleted by
"drm/i915/vma: Fix UAF on destroy against retire race".

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
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

