Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 920FF3919AF
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 16:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3B26ED72;
	Wed, 26 May 2021 14:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656DF6ED24;
 Wed, 26 May 2021 14:15:38 +0000 (UTC)
IronPort-SDR: /pBJElmuUX04OQre/yHl3z4mOMXE3NIrZCwAHWC2WN4uq3OCZ/aGCE2qy+x6gTYO4noDs+E8Oz
 SO8BmHKg2/Og==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223660628"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="223660628"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:16 -0700
IronPort-SDR: djN+giu43WqGj+O7TDw3exOtalzXlFENY6qFYNIqKysL890ifNUAdp+yIpdzhrpx+4B45LYYkT
 Iurr4GJ/jcZQ==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="547206370"
Received: from wardmich-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.209.181])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:13 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 07/12] drm/i915/selftests: Replace the unbounded set-domain
 with an explicit wait
Date: Wed, 26 May 2021 15:14:51 +0100
Message-Id: <20210526141456.2334192-8-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
References: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

After running client_blt, we flush the object by changing its domain.
This causes us to wait forever instead of an bounded wait suitable for
the selftest timeout. So do an explicit wait with a suitable timeout --
which in turn means we have to limit the size of the object/blit to run
within reason.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 .../i915/gem/selftests/i915_gem_client_blt.c  | 26 ++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
index d36873885cc1..baec7bd1fa53 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
@@ -23,12 +23,19 @@ static int __igt_client_fill(struct intel_engine_cs *engine)
 	I915_RND_STATE(prng);
 	IGT_TIMEOUT(end);
 	u32 *vaddr;
+	u64 limit;
 	int err = 0;
 
+	/* Try to keep the blits within the timeout */
+	limit = min_t(u64, ce->vm->total >> 4,
+		      jiffies_to_msecs(i915_selftest.timeout_jiffies) * SZ_2M);
+	if (!limit)
+		limit = SZ_4K;
+
 	intel_engine_pm_get(engine);
 	do {
 		const u32 max_block_size = S16_MAX * PAGE_SIZE;
-		u32 sz = min_t(u64, ce->vm->total >> 4, prandom_u32_state(&prng));
+		u32 sz = min_t(u64, limit, prandom_u32_state(&prng));
 		u32 phys_sz = sz % (max_block_size + 1);
 		u32 val = prandom_u32_state(&prng);
 		u32 i;
@@ -73,13 +80,20 @@ static int __igt_client_fill(struct intel_engine_cs *engine)
 		if (err)
 			goto err_unpin;
 
-		i915_gem_object_lock(obj, NULL);
-		err = i915_gem_object_set_to_cpu_domain(obj, false);
-		i915_gem_object_unlock(obj);
-		if (err)
+		err = i915_gem_object_wait(obj,
+					   I915_WAIT_INTERRUPTIBLE,
+					   2 * i915_selftest.timeout_jiffies);
+		if (err) {
+			pr_err("%s fill %zxB timed out\n",
+			       engine->name, obj->base.size);
 			goto err_unpin;
+		}
 
-		for (i = 0; i < huge_gem_object_phys_size(obj) / sizeof(u32); ++i) {
+		for (i = 0;
+		     i < huge_gem_object_phys_size(obj) / sizeof(u32);
+		     i += 17) {
+			if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_READ))
+				clflush(&vaddr[i]);
 			if (vaddr[i] != val) {
 				pr_err("vaddr[%u]=%x, expected=%x\n", i,
 				       vaddr[i], val);
-- 
2.30.2

