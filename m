Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D50102C6533
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3200B6ECE9;
	Fri, 27 Nov 2020 12:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CA86ECE4;
 Fri, 27 Nov 2020 12:11:00 +0000 (UTC)
IronPort-SDR: KutUongQ5O9jSH8e8lqVezfa5H7IZH03uSw33lGAwGKdAYTgakadfW8SEGbiRDvnTuJKjmFx9E
 RD4GE0WWE+ww==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092833"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092833"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:00 -0800
IronPort-SDR: v4xizq4Fv3ZsiH9e64fhDNfy75w0IKh4ywIOfyAzIp8J0T+6T6425IVEFqYjykr3gQwIP3xOfR
 TXMeRO0SixOg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029598"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:59 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 111/162] drm/i915/lmem: support optional CPU clearing for
 special internal use
Date: Fri, 27 Nov 2020 12:06:27 +0000
Message-Id: <20201127120718.454037-112-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For some internal device local-memory objects it would be useful to have
an option to CPU clear the pages upon gathering the backing store. Note
that this might be before the blitter is useable, which is the case for
some internal GuC objects.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  6 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.c    | 20 +++++
 .../drm/i915/selftests/intel_memory_region.c  | 90 ++++++++++++++++++-
 3 files changed, 113 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 115ad32c303f..8d639509b78b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -166,10 +166,12 @@ struct drm_i915_gem_object {
 #define I915_BO_ALLOC_CONTIGUOUS BIT(0)
 #define I915_BO_ALLOC_VOLATILE   BIT(1)
 #define I915_BO_ALLOC_STRUCT_PAGE BIT(2)
+#define I915_BO_ALLOC_CPU_CLEAR  BIT(3)
 #define I915_BO_ALLOC_FLAGS (I915_BO_ALLOC_CONTIGUOUS | \
 			     I915_BO_ALLOC_VOLATILE | \
-			     I915_BO_ALLOC_STRUCT_PAGE)
-#define I915_BO_READONLY         BIT(3)
+			     I915_BO_ALLOC_STRUCT_PAGE | \
+			     I915_BO_ALLOC_CPU_CLEAR)
+#define I915_BO_READONLY         BIT(4)
 
 	/*
 	 * Is the object to be mapped as read-only to the GPU
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
index 8f352ba6202d..e497ff374b13 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
@@ -95,6 +95,26 @@ i915_gem_object_get_pages_buddy(struct drm_i915_gem_object *obj)
 	sg_mark_end(sg);
 	i915_sg_trim(st);
 
+	/* Intended for kernel internal use only */
+	if (obj->flags & I915_BO_ALLOC_CPU_CLEAR) {
+		struct scatterlist *sg;
+		unsigned long i;
+
+		for_each_sg(st->sgl, sg, st->nents, i) {
+			unsigned int length;
+			void __iomem *vaddr;
+			dma_addr_t daddr;
+
+			daddr = sg_dma_address(sg);
+			daddr -= mem->region.start;
+			length = sg_dma_len(sg);
+
+			vaddr = io_mapping_map_wc(&mem->iomap, daddr, length);
+			memset64(vaddr, 0, length / sizeof(u64));
+			io_mapping_unmap(vaddr);
+		}
+	}
+
 	__i915_gem_object_set_pages(obj, st, sg_page_sizes);
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index 7acb94e0e5fe..93e067951e0f 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -361,7 +361,7 @@ static int igt_cpu_check(struct drm_i915_gem_object *obj, u32 dword, u32 val)
 	if (err)
 		return err;
 
-	ptr = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
+	ptr = i915_gem_object_pin_map(obj, I915_MAP_WC);
 	if (IS_ERR(ptr))
 		return PTR_ERR(ptr);
 
@@ -441,7 +441,9 @@ static int igt_gpu_write(struct i915_gem_context *ctx,
 		if (err)
 			break;
 
+		i915_gem_object_lock(obj, NULL);
 		err = igt_cpu_check(obj, dword, rng);
+		i915_gem_object_unlock(obj);
 		if (err)
 			break;
 	} while (!__igt_timeout(end_time, NULL));
@@ -542,6 +544,91 @@ static int igt_lmem_create_migrate(void *arg)
 
 	return err;
 }
+
+static int igt_lmem_create_cleared_cpu(void *arg)
+{
+	struct drm_i915_private *i915 = arg;
+	I915_RND_STATE(prng);
+	IGT_TIMEOUT(end_time);
+	u32 size, val, i;
+	int err;
+
+	i915_gem_drain_freed_objects(i915);
+
+	size = max_t(u32, PAGE_SIZE, i915_prandom_u32_max_state(SZ_32M, &prng));
+	size = round_up(size, PAGE_SIZE);
+	i = 0;
+
+	do {
+		struct drm_i915_gem_object *obj;
+		void __iomem *vaddr;
+		unsigned int flags;
+		unsigned long n;
+		u32 dword;
+
+		/*
+		 * Alternate between cleared and uncleared allocations, while
+		 * also dirtying the pages each time to check that they either
+		 * remain dirty or are indeed cleared. Allocations should be
+		 * deterministic.
+		 */
+
+		flags = I915_BO_ALLOC_CPU_CLEAR;
+		if (i & 1)
+			flags = 0;
+		else
+			val = 0;
+
+		obj = i915_gem_object_create_lmem(i915, size, flags);
+		if (IS_ERR(obj))
+			return PTR_ERR(obj);
+
+		i915_gem_object_lock(obj, NULL);
+		err = i915_gem_object_pin_pages(obj);
+		if (err)
+			goto out_put;
+
+		dword = i915_prandom_u32_max_state(PAGE_SIZE / sizeof(u32),
+						   &prng);
+
+		err = igt_cpu_check(obj, dword, val);
+		if (err) {
+			pr_err("%s failed with size=%u, flags=%u\n",
+			       __func__, size, flags);
+			goto out_unpin;
+		}
+
+		vaddr = i915_gem_object_pin_map(obj, I915_MAP_WC);
+		if (IS_ERR(vaddr)) {
+			err = PTR_ERR(vaddr);
+			goto out_unpin;
+		}
+
+		val = prandom_u32_state(&prng);
+
+		for (n = 0; n < obj->base.size >> PAGE_SHIFT; ++n) {
+			memset32(vaddr + n * PAGE_SIZE, val,
+				 PAGE_SIZE / sizeof(u32));
+		}
+
+		i915_gem_object_unpin_map(obj);
+out_unpin:
+		i915_gem_object_unpin_pages(obj);
+		__i915_gem_object_put_pages(obj);
+out_put:
+		i915_gem_object_unlock(obj);
+		i915_gem_object_put(obj);
+
+		if (err)
+			break;
+		++i;
+	} while (!__igt_timeout(end_time, NULL));
+
+	pr_info("%s completed (%u) iterations\n", __func__, i);
+
+	return err;
+}
+
 static int igt_lmem_write_gpu(void *arg)
 {
 	struct drm_i915_private *i915 = arg;
@@ -1125,6 +1212,7 @@ int intel_memory_region_live_selftests(struct drm_i915_private *i915)
 {
 	static const struct i915_subtest tests[] = {
 		SUBTEST(igt_lmem_create),
+		SUBTEST(igt_lmem_create_cleared_cpu),
 		SUBTEST(igt_lmem_write_cpu),
 		SUBTEST(igt_lmem_write_gpu),
 		SUBTEST(igt_smem_create_migrate),
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
