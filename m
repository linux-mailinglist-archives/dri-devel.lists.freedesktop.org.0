Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 175F66BBBA9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 19:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893E110E2E8;
	Wed, 15 Mar 2023 18:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257E910EBBB;
 Wed, 15 Mar 2023 18:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678903579; x=1710439579;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iKIgqVSKtr+7rrXxJp8X+ouxwFqLjumi1sX/o/2bEGY=;
 b=LuzYJm/WDzhfHJ4Hapm8rxvi8KL342czNMgfRyaNHbt5djfbGwU62G6P
 hHXN2Hn8EZexToXI/hm18O5GNTYB74doZfuC50DdTWTN93asNs1HzRqs+
 62Tqu7B4VMfMNixzk4BJTgC4xmI81B5GXe+f0o5XQ37/2oNP4BiXeio/f
 LtOftN9khh7Pzv26oKvzQn6tQWAvpLUUKEa0AxunA3p1fvPPRm/PCTtcJ
 ryadEGKJl0W0/u/wP/H64FympGCd+0ZLUxAxLCpCMyZYPPv03NIooEbsA
 DK4Oy1UAsPdin2IHwpFMYN9lhlHzqYXtTi7uZnFEW4dFV5q6qqI7dHNzc g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="317437177"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="317437177"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 11:06:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="679589517"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="679589517"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 11:06:17 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/selftests: keep same cache settings as timeline
Date: Wed, 15 Mar 2023 11:08:00 -0700
Message-Id: <20230315180800.2632766-1-fei.yang@intel.com>
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
Cc: matthew.d.roper@intel.com, Fei Yang <fei.yang@intel.com>,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk
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

Signed-off-by: Fei Yang <fei.yang@intel.com>
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

