Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EC86E00E2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 23:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3E810E998;
	Wed, 12 Apr 2023 21:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D759910E997;
 Wed, 12 Apr 2023 21:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681335050; x=1712871050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TvGsopZIEWmGTgOjIe+0dfr3xptgWZUwAvputZ7xGHI=;
 b=ZiC2sh23us2Dgj+maKrk/jMOjQL6A2AmxfcUaju9/x9P5QVZZq3YEw5R
 tEEauIp9wNZQR1UjdECxxc6/tg20M1IJoG/gz5HgHZP4G0um7dZc7CbQ2
 Cs9djAbj95BFua/QYCK9bA0XfvkT5gmzRVHqPx0Bcxrd+/lbjDTAg7hHF
 /nM0VBfne1NLGuxntuzj9ijI+QKUa3/J1t5WwE3ih1cCnaHbEK7BeMwum
 Nz6mJTkajpP1BgN1DnNAPVyjahyHvrUyXwPb1B/p/Fy68KIp6MFZweX/L
 QUgpbiQ5mit67w0RSfMWd5ie9SLi7T32YiFa9Cq4gx0LN0c/1J64A/9aB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="341519553"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="341519553"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 14:30:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="800497748"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="800497748"
Received: from zbiro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.212.144])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 14:30:46 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v6 1/2] drm/i915: Migrate platform-dependent mock hugepage
 selftests to live
Date: Wed, 12 Apr 2023 23:30:07 +0200
Message-Id: <20230412213008.919630-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412213008.919630-1-andi.shyti@linux.intel.com>
References: <20230412213008.919630-1-andi.shyti@linux.intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jonathan Cavitt <jonathan.cavitt@intel.com>

Convert the igt_mock_ppgtt_huge_fill and igt_mock_ppgtt_64K mock selftests into
live selftests as their requirements have recently become platform-dependent.
Additionally, apply necessary platform dependency checks to these tests.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 .../gpu/drm/i915/gem/selftests/huge_pages.c   | 88 +++++++++++++++----
 1 file changed, 69 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index defece0bcb811..51866cbfa6a4a 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -695,8 +695,7 @@ static int igt_mock_ppgtt_misaligned_dma(void *arg)
 	return err;
 }
 
-static void close_object_list(struct list_head *objects,
-			      struct i915_ppgtt *ppgtt)
+static void close_object_list(struct list_head *objects)
 {
 	struct drm_i915_gem_object *obj, *on;
 
@@ -710,17 +709,35 @@ static void close_object_list(struct list_head *objects,
 	}
 }
 
-static int igt_mock_ppgtt_huge_fill(void *arg)
+static int igt_ppgtt_huge_fill(void *arg)
 {
-	struct i915_ppgtt *ppgtt = arg;
-	struct drm_i915_private *i915 = ppgtt->vm.i915;
-	unsigned long max_pages = ppgtt->vm.total >> PAGE_SHIFT;
+	struct drm_i915_private *i915 = arg;
+	unsigned int supported = RUNTIME_INFO(i915)->page_sizes;
+	struct i915_address_space *vm;
+	struct i915_gem_context *ctx;
+	unsigned long max_pages;
 	unsigned long page_num;
+	struct file *file;
 	bool single = false;
 	LIST_HEAD(objects);
 	IGT_TIMEOUT(end_time);
 	int err = -ENODEV;
 
+	if (supported == I915_GTT_PAGE_SIZE_4K)
+		return 0;
+
+	file = mock_file(i915);
+	if (IS_ERR(file))
+		return PTR_ERR(file);
+
+	ctx = hugepage_ctx(i915, file);
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		goto out;
+	}
+	vm = i915_gem_context_get_eb_vm(ctx);
+	max_pages = vm->total >> PAGE_SHIFT;
+
 	for_each_prime_number_from(page_num, 1, max_pages) {
 		struct drm_i915_gem_object *obj;
 		u64 size = page_num << PAGE_SHIFT;
@@ -750,7 +767,7 @@ static int igt_mock_ppgtt_huge_fill(void *arg)
 
 		list_add(&obj->st_link, &objects);
 
-		vma = i915_vma_instance(obj, &ppgtt->vm, NULL);
+		vma = i915_vma_instance(obj, vm, NULL);
 		if (IS_ERR(vma)) {
 			err = PTR_ERR(vma);
 			break;
@@ -784,7 +801,8 @@ static int igt_mock_ppgtt_huge_fill(void *arg)
 		GEM_BUG_ON(!expected_gtt);
 		GEM_BUG_ON(size);
 
-		if (expected_gtt & I915_GTT_PAGE_SIZE_4K)
+		if (expected_gtt & I915_GTT_PAGE_SIZE_4K &&
+		    GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
 			expected_gtt &= ~I915_GTT_PAGE_SIZE_64K;
 
 		i915_vma_unpin(vma);
@@ -823,19 +841,24 @@ static int igt_mock_ppgtt_huge_fill(void *arg)
 		single = !single;
 	}
 
-	close_object_list(&objects, ppgtt);
+	close_object_list(&objects);
 
 	if (err == -ENOMEM || err == -ENOSPC)
 		err = 0;
 
+	i915_vm_put(vm);
+out:
+	fput(file);
 	return err;
 }
 
-static int igt_mock_ppgtt_64K(void *arg)
+static int igt_ppgtt_64K(void *arg)
 {
-	struct i915_ppgtt *ppgtt = arg;
-	struct drm_i915_private *i915 = ppgtt->vm.i915;
+	struct drm_i915_private *i915 = arg;
 	struct drm_i915_gem_object *obj;
+	struct i915_address_space *vm;
+	struct i915_gem_context *ctx;
+	struct file *file;
 	const struct object_info {
 		unsigned int size;
 		unsigned int gtt;
@@ -907,16 +930,40 @@ static int igt_mock_ppgtt_64K(void *arg)
 	if (!HAS_PAGE_SIZES(i915, I915_GTT_PAGE_SIZE_64K))
 		return 0;
 
+	file = mock_file(i915);
+	if (IS_ERR(file))
+		return PTR_ERR(file);
+
+	ctx = hugepage_ctx(i915, file);
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		goto out;
+	}
+	vm = i915_gem_context_get_eb_vm(ctx);
+
 	for (i = 0; i < ARRAY_SIZE(objects); ++i) {
 		unsigned int size = objects[i].size;
 		unsigned int expected_gtt = objects[i].gtt;
 		unsigned int offset = objects[i].offset;
 		unsigned int flags = PIN_USER;
 
+		/*
+		 * For modern GTT models, the requirements for marking a page-table
+		 * as 64K have been relaxed.  Account for this.
+		 */
+
+		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
+			expected_gtt = 0;
+			expected_gtt |= size & (SZ_64K | SZ_2M) ? I915_GTT_PAGE_SIZE_64K : 0;
+			expected_gtt |= size & SZ_4K ? I915_GTT_PAGE_SIZE_4K : 0;
+		}
+
 		for (single = 0; single <= 1; single++) {
 			obj = fake_huge_pages_object(i915, size, !!single);
-			if (IS_ERR(obj))
-				return PTR_ERR(obj);
+			if (IS_ERR(obj)) {
+				err = PTR_ERR(obj);
+				goto out_vm;
+			}
 
 			err = i915_gem_object_pin_pages_unlocked(obj);
 			if (err)
@@ -928,7 +975,7 @@ static int igt_mock_ppgtt_64K(void *arg)
 			 */
 			obj->mm.page_sizes.sg &= ~I915_GTT_PAGE_SIZE_2M;
 
-			vma = i915_vma_instance(obj, &ppgtt->vm, NULL);
+			vma = i915_vma_instance(obj, vm, NULL);
 			if (IS_ERR(vma)) {
 				err = PTR_ERR(vma);
 				goto out_object_unpin;
@@ -982,7 +1029,7 @@ static int igt_mock_ppgtt_64K(void *arg)
 		}
 	}
 
-	return 0;
+	goto out_vm;
 
 out_vma_unpin:
 	i915_vma_unpin(vma);
@@ -992,7 +1039,10 @@ static int igt_mock_ppgtt_64K(void *arg)
 	i915_gem_object_unlock(obj);
 out_object_put:
 	i915_gem_object_put(obj);
-
+out_vm:
+	i915_vm_put(vm);
+out:
+	fput(file);
 	return err;
 }
 
@@ -1910,8 +1960,6 @@ int i915_gem_huge_page_mock_selftests(void)
 		SUBTEST(igt_mock_exhaust_device_supported_pages),
 		SUBTEST(igt_mock_memory_region_huge_pages),
 		SUBTEST(igt_mock_ppgtt_misaligned_dma),
-		SUBTEST(igt_mock_ppgtt_huge_fill),
-		SUBTEST(igt_mock_ppgtt_64K),
 	};
 	struct drm_i915_private *dev_priv;
 	struct i915_ppgtt *ppgtt;
@@ -1962,6 +2010,8 @@ int i915_gem_huge_page_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(igt_ppgtt_sanity_check),
 		SUBTEST(igt_ppgtt_compact),
 		SUBTEST(igt_ppgtt_mixed),
+		SUBTEST(igt_ppgtt_huge_fill),
+		SUBTEST(igt_ppgtt_64K),
 	};
 
 	if (!HAS_PPGTT(i915)) {
-- 
2.39.2

