Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4899F7E5B2F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE1E10E171;
	Wed,  8 Nov 2023 16:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7092E10E16E;
 Wed,  8 Nov 2023 16:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699460966; x=1730996966;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WP3hI73rb8qnQjzi1+WK45dGVTYa9CIBpiKGbiPTRO8=;
 b=fTXsF9j+pfb8+gF2B0ktGxXBKQ94LkB0avW8YMWys2Thq7vk89db7N7q
 vK5DLfbfg99HObZA4vEVniEaedw/VxOOO18TaOtoWl8Yftfg9PGP1tWs/
 aH54xx6iv1+IhQFrR+jTotGNUjuEp+GYDhC0E+Cz8meq096nXFKlFkOU0
 Q5zjzRxO3fhj9Ql8eDqLWAy0Pfe9qThN0VstapPb0hozhzrNkdp5gF7mJ
 Gwwl4QEBgof1F3KQelLGKCEz2/SEc1drxBFRvInCxEVkCsiuMmrZtXuSz
 EEGw/HXDSIIYDqjKr0sRnw+CrT+TI2ljvuzpQ8C0t3cz2DWqtvKCbgn0y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="2756379"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="2756379"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 08:29:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="833530910"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="833530910"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.9.15])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 08:29:17 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/vma: Fix potential UAF on multi-tile platforms
Date: Wed,  8 Nov 2023 17:29:06 +0100
Message-ID: <20231108162905.77602-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Object debugging tools were sporadically reporting illegal attempts to
free a still active i915 VMA object from when parking a GPU tile believed
to be idle.

[161.359441] ODEBUG: free active (active state 0) object: ffff88811643b958 object type: i915_active hint: __i915_vma_active+0x0/0x50 [i915]
[161.360082] WARNING: CPU: 5 PID: 276 at lib/debugobjects.c:514 debug_print_object+0x80/0xb0
...
[161.360304] CPU: 5 PID: 276 Comm: kworker/5:2 Not tainted 6.5.0-rc1-CI_DRM_13375-g003f860e5577+ #1
[161.360314] Hardware name: Intel Corporation Rocket Lake Client Platform/RocketLake S UDIMM 6L RVP, BIOS RKLSFWI1.R00.3173.A03.2204210138 04/21/2022
[161.360322] Workqueue: i915-unordered __intel_wakeref_put_work [i915]
[161.360592] RIP: 0010:debug_print_object+0x80/0xb0
...
[161.361347] debug_object_free+0xeb/0x110
[161.361362] i915_active_fini+0x14/0x130 [i915]
[161.361866] release_references+0xfe/0x1f0 [i915]
[161.362543] i915_vma_parked+0x1db/0x380 [i915]
[161.363129] __gt_park+0x121/0x230 [i915]
[161.363515] ____intel_wakeref_put_last+0x1f/0x70 [i915]

That has been tracked down to be happening when another thread was
deactivating the VMA inside __active_retire() helper, after the VMA's
active counter was already decremented to 0, but before deactivation of
the VMA's object was reported to the object debugging tools.  Root cause
has been identified as premature release of last wakeref for the GPU tile
to which the active VMA belonged.

In case of single-tile platforms, an engine associated with a request that
uses the VMA is usually keeping the tile's wakeref long enough for that
VMA to be deactivated on time, before it is going to be freed on last put
of that wakeref.  However, on multi-tile platforms, a request may use a
VMA from a tile other than the one that hosts the request's engine, then,
not protected with the engine's wakeref.

Get an extra wakeref for the VMA's tile when activating it, and put that
wakeref only after the VMA is deactivated.  However, exclude GGTT from
that processing path, otherwise the GPU never goes idle.  Since
__i915_vma_retire() may be called from atomic contexts, use async variant
of wakeref put.

CI reports indicate that single-tile platforms also suffer sporadically
from the same race, however, unlike in case of multi-tile, exact scenario
when that happens hasn't been discovered yet.  Then, while I submit this
patch as fix for multi-tile cases, and in hope it also addresses single-
tile, I'm not able to blame any particular commit for that issue.
However, I'm going to ask i915 maintainers to include this fix, if
accepted, in the current rc cycle (6.7-rc) as important for the first
supported multi-tile platform -- Meteor Lake.

v2: Get the wakeref before vm mutex to avoid circular locking dependency,
  - drop questionable Fixes: tag.

Closes: https://gitlab.freedesktop.org/drm/intel/issues/8875
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index d09aad34ba37f..f56907f9bc756 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -34,6 +34,7 @@
 #include "gt/intel_engine.h"
 #include "gt/intel_engine_heartbeat.h"
 #include "gt/intel_gt.h"
+#include "gt/intel_gt_pm.h"
 #include "gt/intel_gt_requests.h"
 #include "gt/intel_tlb.h"
 
@@ -103,12 +104,25 @@ static inline struct i915_vma *active_to_vma(struct i915_active *ref)
 
 static int __i915_vma_active(struct i915_active *ref)
 {
-	return i915_vma_tryget(active_to_vma(ref)) ? 0 : -ENOENT;
+	struct i915_vma *vma = active_to_vma(ref);
+
+	if (!i915_vma_tryget(vma))
+		return -ENOENT;
+
+	if (!i915_vma_is_ggtt(vma))
+		intel_gt_pm_get(vma->vm->gt);
+
+	return 0;
 }
 
 static void __i915_vma_retire(struct i915_active *ref)
 {
-	i915_vma_put(active_to_vma(ref));
+	struct i915_vma *vma = active_to_vma(ref);
+
+	if (!i915_vma_is_ggtt(vma))
+		intel_gt_pm_put_async(vma->vm->gt);
+
+	i915_vma_put(vma);
 }
 
 static struct i915_vma *
@@ -1404,7 +1418,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	struct i915_vma_work *work = NULL;
 	struct dma_fence *moving = NULL;
 	struct i915_vma_resource *vma_res = NULL;
-	intel_wakeref_t wakeref = 0;
+	intel_wakeref_t wakeref;
 	unsigned int bound;
 	int err;
 
@@ -1424,8 +1438,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	if (err)
 		return err;
 
-	if (flags & PIN_GLOBAL)
-		wakeref = intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
+	wakeref = intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
 
 	if (flags & vma->vm->bind_async_flags) {
 		/* lock VM */
@@ -1561,8 +1574,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	if (work)
 		dma_fence_work_commit_imm(&work->base);
 err_rpm:
-	if (wakeref)
-		intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
+	intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
 
 	if (moving)
 		dma_fence_put(moving);
-- 
2.42.0

