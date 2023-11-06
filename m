Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 664417E1D13
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 10:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEE610E2A0;
	Mon,  6 Nov 2023 09:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3EE10E29F;
 Mon,  6 Nov 2023 09:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699262202; x=1730798202;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zHSMpzxpJFy5oTJzzT+/fsEd0KEXzbHoFBvQdW09Pcs=;
 b=HYvLr4UUvWIIQU3cfHFwGPWP0DOK1Va6F9MLcwdqYpQ2+cvFxXfAJkZw
 gqcwXJJa31RTn+F+sRelmZaBHtiJV6tYqNJUKciQUfyat5u4Wp0KNsvYe
 7A9GuYG33h1yP+TEgwliWwKNdM7hiBj/OxK0f8gyqOnxzK6a8y+omyQUN
 Mv0tE4nMw8aoq0ffIryjPmy6749wXEm008hzBxYqS1c/DlXV3OZlf1HWS
 V1MeAscrN5oDsAvBIohz6MpFLGeaiQgfyRIkWhn6O40NVmG0jHgn+WKx6
 cJ+uSZOCf6OsmgjY6Cv4MHLPzdCWhC+C3oUVK6JjBpKPT9mtvgIuG4tQU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="10774177"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; d="scan'208";a="10774177"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 01:16:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="712143288"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; d="scan'208";a="712143288"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.8.129])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 01:16:37 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/vma: Fix potential UAF on multi-tile platforms
Date: Mon,  6 Nov 2023 10:16:04 +0100
Message-ID: <20231106091603.231100-2-janusz.krzysztofik@linux.intel.com>
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

In case of single tile platforms, an engine associated with a request that
uses the VMA is keeping the tile's wakeref long enough for that VMA to be
deactivated on time, before it is going to be freed.  However, on multi-
tile platforms, a request may use a VMA from a tile other than the one
that hosts the request's engine, then, not protected with the engine's
wakeref.

Get an extra wakeref for the VMA's tile when activating it, and put that
wakeref only after the VMA is deactivated.  However, exclude GGTT from
that processing path, otherwise the GPU never goes idle.  Since
__i915_vma_retire() may be called from atomic contexts, use async variant
of wakeref put.

Closes: https://gitlab.freedesktop.org/drm/intel/issues/8875
Fixes: Fixes: 213c43676beb ("drm/i915/mtl: Remove the 'force_probe' requirement for Meteor Lake")
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index d09aad34ba37f..70c68f614c6db 100644
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
-- 
2.42.0

