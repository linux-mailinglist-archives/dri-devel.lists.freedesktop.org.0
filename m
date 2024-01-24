Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A275E83AA6B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946AD10F6DD;
	Wed, 24 Jan 2024 12:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C480F10EA2B;
 Wed, 24 Jan 2024 12:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706101030; x=1737637030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RqGdVwm3R+6NLCtH9gYaNi/g56L0MhbyYXWvigbPTdE=;
 b=ANr+4FGHDSLFivuX04Hj4GjI9bnuzhrcPDq/CopXaoshzHauE79BS5JO
 5uCYoBKEokdJjbPsz/ANye5V2tMbqdYWkCHsuRgjpe/O2iq0//0uJhlXj
 2m5VO9RIR61Qv15KjgOYnYxHPMb4jIqiccWtr9Vwc0rLTIJy44BWnCcZO
 ZSPN6K+KvvW5EsHnlKngzq9e6e4uGYaG8DNfm+gOubDAmnxdqV+PFPvUr
 RNos+5BbtFc2fRU0zt8eZevhWPT0iiQXHF5FlG/bpmps7Iiv+QsWzedS7
 wu0WpPRDsJW6QIzQB11EJrZAVwyUuM7acSXXKhXHtKehr7ExrEkSwGmt3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8594346"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8594346"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 04:57:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1898586"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.0.254])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 04:57:07 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 1/3] drm/i915/vma: Fix UAF on destroy against retire race
Date: Wed, 24 Jan 2024 13:43:06 +0100
Message-ID: <20240124125643.590072-6-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124125643.590072-5-janusz.krzysztofik@linux.intel.com>
References: <20240124125643.590072-5-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Object debugging tools were sporadically reporting illegal attempts to
free a still active i915 VMA object when parking a GT believed to be idle.

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

That has been tracked down to be happening when another thread is
deactivating the VMA inside __active_retire() helper, after the VMA's
active counter has been already decremented to 0, but before deactivation
of the VMA's object is reported to the object debugging tool.

We could prevent from that race by serializing i915_active_fini() with
__active_retire() via ref->tree_lock, but that wouldn't stop the VMA from
being used, e.g. from __i915_vma_retire() called at the end of
__active_retire(), after that VMA has been already freed by a concurrent
i915_vma_destroy() on return from the i915_active_fini().  Then, we should
rather fix the issue at the VMA level, not in i915_active.

Since __i915_vma_parked() is called from __gt_park() on last put of the
GT's wakeref, the issue could be addressed by holding the GT wakeref long
enough for __active_retire() to complete before that wakeref is released
and the GT parked.

I believe the issue was introduced by commit d93939730347 ("drm/i915:
Remove the vma refcount") which moved a call to i915_active_fini() from
a dropped i915_vma_release(), called on last put of the removed VMA kref,
to i915_vma_parked() processing path called on last put of a GT wakeref.
However, its visibility to the object debugging tool was suppressed by a
bug in i915_active that was fixed two weeks later with commit e92eb246feb9
("drm/i915/active: Fix missing debug object activation").

A VMA associated with a request doesn't acquire a GT wakeref by itself.
Instead, it depends on a wakeref held directly by the request's active
intel_context for a GT associated with its VM, and indirectly on that
intel_context's engine wakeref if the engine belongs to the same GT as the
VMA's VM.  Those wakerefs are released asynchronously to VMA deactivation.

Fix the issue by getting a wakeref for the VMA's GT when activating it,
and putting that wakeref only after the VMA is deactivated.  However,
exclude global GTT from that processing path, otherwise the GPU never goes
idle.  Since __i915_vma_retire() may be called from atomic contexts, use
async variant of wakeref put.  Also, to avoid circular locking dependency,
take care of acquiring the wakeref before VM mutex when both are needed.

v5: Replace "tile" with "GT" across commit description (Rodrigo),
  - avoid mentioning multi-GT case in commit description (Rodrigo),
  - explain why we need to take a temporary wakeref unconditionally inside
    i915_vma_pin_ww() (Rodrigo).
v4: Refresh on top of commit 5e4e06e4087e ("drm/i915: Track gt pm
    wakerefs") (Andi),
  - for more easy backporting, split out removal of former insufficient
    workarounds and move them to separate patches (Nirmoy).
  - clean up commit message and description a bit.
v3: Identify root cause more precisely, and a commit to blame,
  - identify and drop former workarounds,
  - update commit message and description.
v2: Get the wakeref before VM mutex to avoid circular locking dependency,
  - drop questionable Fixes: tag.

Fixes: d93939730347 ("drm/i915: Remove the vma refcount")
Closes: https://gitlab.freedesktop.org/drm/intel/issues/8875
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: stable@vger.kernel.org # v5.19+
---
 drivers/gpu/drm/i915/i915_vma.c       | 26 +++++++++++++++++++-------
 drivers/gpu/drm/i915/i915_vma_types.h |  1 +
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index d09aad34ba37f..604d420b9e1fd 100644
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
+		vma->wakeref = intel_gt_pm_get(vma->vm->gt);
+
+	return 0;
 }
 
 static void __i915_vma_retire(struct i915_active *ref)
 {
-	i915_vma_put(active_to_vma(ref));
+	struct i915_vma *vma = active_to_vma(ref);
+
+	if (!i915_vma_is_ggtt(vma))
+		intel_gt_pm_put_async(vma->vm->gt, vma->wakeref);
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
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index 64472b7f0e770..f0086fadff4d3 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -264,6 +264,7 @@ struct i915_vma {
 #define I915_VMA_SCANOUT	((int)BIT(I915_VMA_SCANOUT_BIT))
 
 	struct i915_active active;
+	intel_wakeref_t wakeref;
 
 #define I915_VMA_PAGES_BIAS 24
 #define I915_VMA_PAGES_ACTIVE (BIT(24) | 1)
-- 
2.43.0

