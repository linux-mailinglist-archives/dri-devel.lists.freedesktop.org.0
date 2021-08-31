Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D943FC742
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 14:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4C389B84;
	Tue, 31 Aug 2021 12:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6E989A75;
 Tue, 31 Aug 2021 12:29:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="218179660"
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="218179660"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 05:29:51 -0700
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="509924573"
Received: from vanderss-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.185])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 05:29:49 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2] drm/i915/gem: Fix the mman selftest
Date: Tue, 31 Aug 2021 14:29:31 +0200
Message-Id: <20210831122931.157536-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using the I915_MMAP_TYPE_FIXED mmap type requires the TTM backend, so
for that mmap type, use __i915_gem_object_create_user() instead of
i915_gem_object_create_internal(), as we really want to tests objects
mmap-able by user-space.

This also means that the out-of-space error happens at object creation
and returns -ENXIO rather than -ENOSPC, so fix the code up to expect
that on out-of-offset-space errors.

Finally only use I915_MMAP_TYPE_FIXED for LMEM and SMEM for now if
testing on LMEM-capable devices. For stolen LMEM, we still take the
same path as for integrated, as that haven't been moved over to TTM yet,
and user-space should not be able to create out of stolen LMEM anyway.

v2:
 - Check the presence of the obj->ops->mmap_offset callback rather than
   hardcoding the supported mmap regions in can_mmap() (Maarten Lankhorst)

Fixes: 7961c5b60f23 ("drm/i915: Add TTM offset argument to mmap.")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../drm/i915/gem/selftests/i915_gem_mman.c    | 26 ++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index b20f5621f62b..a2c34e5a1c54 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -581,6 +581,20 @@ static enum i915_mmap_type default_mapping(struct drm_i915_private *i915)
 	return I915_MMAP_TYPE_GTT;
 }
 
+static struct drm_i915_gem_object *
+create_sys_or_internal(struct drm_i915_private *i915,
+		       unsigned long size)
+{
+	if (HAS_LMEM(i915)) {
+		struct intel_memory_region *sys_region =
+			i915->mm.regions[INTEL_REGION_SMEM];
+
+		return __i915_gem_object_create_user(i915, size, &sys_region, 1);
+	}
+
+	return i915_gem_object_create_internal(i915, size);
+}
+
 static bool assert_mmap_offset(struct drm_i915_private *i915,
 			       unsigned long size,
 			       int expected)
@@ -589,7 +603,7 @@ static bool assert_mmap_offset(struct drm_i915_private *i915,
 	u64 offset;
 	int ret;
 
-	obj = i915_gem_object_create_internal(i915, size);
+	obj = create_sys_or_internal(i915, size);
 	if (IS_ERR(obj))
 		return expected && expected == PTR_ERR(obj);
 
@@ -633,6 +647,7 @@ static int igt_mmap_offset_exhaustion(void *arg)
 	struct drm_mm_node *hole, *next;
 	int loop, err = 0;
 	u64 offset;
+	int enospc = HAS_LMEM(i915) ? -ENXIO : -ENOSPC;
 
 	/* Disable background reaper */
 	disable_retire_worker(i915);
@@ -683,14 +698,14 @@ static int igt_mmap_offset_exhaustion(void *arg)
 	}
 
 	/* Too large */
-	if (!assert_mmap_offset(i915, 2 * PAGE_SIZE, -ENOSPC)) {
+	if (!assert_mmap_offset(i915, 2 * PAGE_SIZE, enospc)) {
 		pr_err("Unexpectedly succeeded in inserting too large object into single page hole\n");
 		err = -EINVAL;
 		goto out;
 	}
 
 	/* Fill the hole, further allocation attempts should then fail */
-	obj = i915_gem_object_create_internal(i915, PAGE_SIZE);
+	obj = create_sys_or_internal(i915, PAGE_SIZE);
 	if (IS_ERR(obj)) {
 		err = PTR_ERR(obj);
 		pr_err("Unable to create object for reclaimed hole\n");
@@ -703,7 +718,7 @@ static int igt_mmap_offset_exhaustion(void *arg)
 		goto err_obj;
 	}
 
-	if (!assert_mmap_offset(i915, PAGE_SIZE, -ENOSPC)) {
+	if (!assert_mmap_offset(i915, PAGE_SIZE, enospc)) {
 		pr_err("Unexpectedly succeeded in inserting object into no holes!\n");
 		err = -EINVAL;
 		goto err_obj;
@@ -839,10 +854,9 @@ static int wc_check(struct drm_i915_gem_object *obj)
 
 static bool can_mmap(struct drm_i915_gem_object *obj, enum i915_mmap_type type)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	bool no_map;
 
-	if (HAS_LMEM(i915))
+	if (obj->ops->mmap_offset)
 		return type == I915_MMAP_TYPE_FIXED;
 	else if (type == I915_MMAP_TYPE_FIXED)
 		return false;
-- 
2.31.1

