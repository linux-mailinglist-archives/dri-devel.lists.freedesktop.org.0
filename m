Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B01016B167F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 00:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4CE10E75B;
	Wed,  8 Mar 2023 23:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD3610E75A;
 Wed,  8 Mar 2023 23:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678318002; x=1709854002;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8rM4PkkqkuOyk+npwJMLFoGxt+MQmeGmfcAenhHlzDY=;
 b=LACgnnQOUsjrnrYchbTB/Y369ctQ4nxYPn30X3I4F4wzxdqCYX2bEgRc
 /Dr43DPhWoD6PeGeXHalaX9TjXDvrhjdKBizPeObbTosOmfNZhgUYE7pY
 2eZarz/FWiPuGxtG9nR12QOE7FRnu0DjVkvb2DpgqRYXE4DmlBty4w++x
 rlM2haFe4c2rVWOwEaxlWaNCj227GJu1PFtLE1KI886A2Fjzevan3llCw
 qy2KLEro+cytgpYYmRRsIPCgai+mWNxFgxKl5iZALQNd0BHlVMrT5spMq
 1D87FNKRPLRnMmiRici5qOf4m+qzvP4EJ05IH/zrvnWd6d+6JMKOsWpc4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="320131760"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="320131760"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 15:26:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="654529155"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="654529155"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 15:26:41 -0800
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/selftests: keep same cache settings as timeline
Date: Wed,  8 Mar 2023 15:28:26 -0800
Message-Id: <20230308232826.1542846-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, Fei Yang <fei.yang@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

On MTL, objects allocated through i915_gem_object_create_internal() are
mapped as uncached in GPU by default because HAS_LLC is false. However
in the live_hwsp_read selftest these watcher objects are mapped as WB
on CPU side. The conseqence is that the updates done by the GPU are not
immediately visible to CPU, thus the selftest is randomly failing due to
the stale data in CPU cache. Solution can be either setting WC for CPU +
UC for GPU, or WB for CPU + 1-way coherent WB for GPU.
To keep the consistency, let's simply inherit the same cache settings
from the timeline, which is WB for CPU + 1-way coherent WB for GPU,
because this test is supposed to emulate the behavior of the timeline
anyway.

v2: copy cache settings from timeline instead of setting it to WC
    (Suggested by Chris)

Signed-off-by: Fei Yang <fei.yang@intel.com>
Reviewed-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Acked-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_timeline.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c b/drivers/gpu/drm/i915/gt/selftest_timeline.c
index 522d0190509c..631aaed9bc3d 100644
--- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
+++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
@@ -825,7 +825,8 @@ static bool cmp_gte(u32 a, u32 b)
 	return a >= b;
 }
 
-static int setup_watcher(struct hwsp_watcher *w, struct intel_gt *gt)
+static int setup_watcher(struct hwsp_watcher *w, struct intel_gt *gt,
+			 struct intel_timeline *tl)
 {
 	struct drm_i915_gem_object *obj;
 	struct i915_vma *vma;
@@ -834,7 +835,10 @@ static int setup_watcher(struct hwsp_watcher *w, struct intel_gt *gt)
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
-	w->map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
+	/* keep the same cache settings as timeline */
+	i915_gem_object_set_cache_coherency(obj, tl->hwsp_ggtt->obj->cache_level);
+	w->map = i915_gem_object_pin_map_unlocked(obj,
+			page_unmask_bits(tl->hwsp_ggtt->obj->mm.mapping));
 	if (IS_ERR(w->map)) {
 		i915_gem_object_put(obj);
 		return PTR_ERR(w->map);
@@ -1004,8 +1008,10 @@ static int live_hwsp_read(void *arg)
 	if (!tl->has_initial_breadcrumb)
 		goto out_free;
 
+	selftest_tl_pin(tl);
+
 	for (i = 0; i < ARRAY_SIZE(watcher); i++) {
-		err = setup_watcher(&watcher[i], gt);
+		err = setup_watcher(&watcher[i], gt, tl);
 		if (err)
 			goto out;
 	}
@@ -1160,6 +1166,8 @@ static int live_hwsp_read(void *arg)
 	for (i = 0; i < ARRAY_SIZE(watcher); i++)
 		cleanup_watcher(&watcher[i]);
 
+	intel_timeline_unpin(tl);
+
 	if (igt_flush_test(gt->i915))
 		err = -EIO;
 
-- 
2.25.1

