Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D24545270
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 18:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E068111B15D;
	Thu,  9 Jun 2022 16:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02D511AE33;
 Thu,  9 Jun 2022 16:52:28 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 216E566017E5;
 Thu,  9 Jun 2022 17:52:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654793547;
 bh=r6lF+wb4oVIUvBtEdpQAsS/+HQWGO3JeX6KjqiaMQi0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W479OxaloJIRtn+QLhu/mMOxk+k2mMSeShI5tQYfD75WB6misfuqCpyYl+o57B+gF
 Ik7wPBr89mVxyAlhT0cncPrh5PoMk/DbHcIbLrELFGxHyxL014AGDL7+2VmwxTO887
 3gJGiMrLfNnNOQ7zVwn7HiBzTOMEHejw8xKym+iADwgXhwt7/LNN1gJMLEYYqNqvkj
 9Cd9JZhC5TwRW3l4z4yf11EDc50zX/oBQ8L61Ie7I9e2U6P6zgznubDVdLgzu0KVHI
 X5uEuikwhKsZv1fhNn4OlKPItuw9HltSKehjhyWtCtD/PNkjYBczrCVWpIUnx0ri+u
 g3yqS6FVty5Ug==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 6/8] drm/i915/gem: further fix mman selftest
Date: Thu,  9 Jun 2022 16:51:58 +0000
Message-Id: <20220609165200.842821-7-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609165200.842821-1-bob.beckett@collabora.com>
References: <20220609165200.842821-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 kernel@collabora.com, Matthew Auld <matthew.auld@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In commit 450cede7f380 ("drm/i915/gem: Fix the mman selftest") we fixed up
the mman selftest to allocate user buffers via smem only if we have lmem,
otherwise it uses internal buffers.

As the commit message asserts, we should only be using buffers that
userland should be able to create.
Internal buffers are not intended to be used by userland.

Instead, fix the code to always create buffers from smem.
In the case of integrated, this will create them from the shmem non-ttm
backend, which is fine.

This also fixes up the code to allow conversion of internal backend to
ttm without breaking this test.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 .../gpu/drm/i915/gem/selftests/i915_gem_mman.c  | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 5bc93a1ce3e3..ee2ad1281f97 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -594,17 +594,12 @@ static enum i915_mmap_type default_mapping(struct drm_i915_private *i915)
 }
 
 static struct drm_i915_gem_object *
-create_sys_or_internal(struct drm_i915_private *i915,
-		       unsigned long size)
+create_sys(struct drm_i915_private *i915, unsigned long size)
 {
-	if (HAS_LMEM(i915)) {
-		struct intel_memory_region *sys_region =
-			i915->mm.regions[INTEL_REGION_SMEM];
+	struct intel_memory_region *sys_region =
+		i915->mm.regions[INTEL_REGION_SMEM];
 
-		return __i915_gem_object_create_user(i915, size, &sys_region, 1);
-	}
-
-	return i915_gem_object_create_internal(i915, size);
+	return __i915_gem_object_create_user(i915, size, &sys_region, 1);
 }
 
 static bool assert_mmap_offset(struct drm_i915_private *i915,
@@ -615,7 +610,7 @@ static bool assert_mmap_offset(struct drm_i915_private *i915,
 	u64 offset;
 	int ret;
 
-	obj = create_sys_or_internal(i915, size);
+	obj = create_sys(i915, size);
 	if (IS_ERR(obj))
 		return expected && expected == PTR_ERR(obj);
 
@@ -717,7 +712,7 @@ static int igt_mmap_offset_exhaustion(void *arg)
 	}
 
 	/* Fill the hole, further allocation attempts should then fail */
-	obj = create_sys_or_internal(i915, PAGE_SIZE);
+	obj = create_sys(i915, PAGE_SIZE);
 	if (IS_ERR(obj)) {
 		err = PTR_ERR(obj);
 		pr_err("Unable to create object for reclaimed hole\n");
-- 
2.25.1

