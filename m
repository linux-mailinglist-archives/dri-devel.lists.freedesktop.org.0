Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5932C6540
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056466EC7B;
	Fri, 27 Nov 2020 12:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A476ECE5;
 Fri, 27 Nov 2020 12:11:16 +0000 (UTC)
IronPort-SDR: dnyOVHbT1LjPVF6JDMz4T0t5KwXqsIQ9iwxtdyljAO/fcBBhxjIfeZiOVUds1t58zmsvicz3nT
 yhD7qnvidMnA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092867"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092867"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:16 -0800
IronPort-SDR: hxhRV7ZrgI9cdjahXX5p4jVOStIkJguI/gpErpAzoCa0yvi/SFy3Q8dAiIi1Gq+/JUCrL3s2sU
 0Z3V8Sj2ud4A==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029722"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:14 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 117/162] drm/i915: Reintroduce mem->reserved
Date: Fri, 27 Nov 2020 12:06:33 +0000
Message-Id: <20201127120718.454037-118-matthew.auld@intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>

In the following patch we need to reserve regions unaccessible to the
driver during initialization, so add back mem->reserved for collecting
such regions.

Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
---
 drivers/gpu/drm/i915/intel_memory_region.c    |  2 +
 drivers/gpu/drm/i915/intel_memory_region.h    |  2 +
 .../drm/i915/selftests/intel_memory_region.c  | 89 +++++++++++++++++++
 3 files changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index c7a1d84e7ee8..554fdd7735a8 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -203,6 +203,7 @@ int intel_memory_region_init_buddy(struct intel_memory_region *mem)
 
 void intel_memory_region_release_buddy(struct intel_memory_region *mem)
 {
+	i915_buddy_free_list(&mem->mm, &mem->reserved);
 	i915_buddy_fini(&mem->mm);
 }
 
@@ -232,6 +233,7 @@ intel_memory_region_create(struct drm_i915_private *i915,
 	mutex_init(&mem->objects.lock);
 	INIT_LIST_HEAD(&mem->objects.list);
 	INIT_LIST_HEAD(&mem->objects.purgeable);
+	INIT_LIST_HEAD(&mem->reserved);
 
 	mutex_init(&mem->mm_lock);
 
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 8da82cb2afe3..0bfc1fa36f74 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -97,6 +97,8 @@ struct intel_memory_region {
 	struct intel_gt *gt; /* GT closest to this region. */
 	bool is_devmem;	/* true for device memory */
 
+	struct list_head reserved;
+
 	dma_addr_t remap_addr;
 
 	struct {
diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index 93e067951e0f..9df0a4f657c1 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -134,6 +134,94 @@ static void igt_object_release(struct drm_i915_gem_object *obj)
 	i915_gem_object_put(obj);
 }
 
+static int igt_reserve_range(struct intel_memory_region *mem,
+			     struct list_head *reserved,
+			     u64 offset,
+			     u64 size)
+{
+	int ret;
+	LIST_HEAD(blocks);
+
+	ret = i915_buddy_alloc_range(&mem->mm, &blocks, offset, size);
+	if (!ret)
+		list_splice_tail(&blocks, reserved);
+
+	return ret;
+}
+
+static int igt_mock_reserve(void *arg)
+{
+	struct drm_i915_gem_object *obj;
+	struct intel_memory_region *mem = arg;
+	resource_size_t avail = resource_size(&mem->region);
+	I915_RND_STATE(prng);
+	LIST_HEAD(objects);
+	LIST_HEAD(reserved);
+	u32 i, offset, count, *order;
+	u64 allocated, cur_avail;
+	const u32 chunk_size = SZ_32M;
+	int err = 0;
+
+	count = avail / chunk_size;
+	order = i915_random_order(count, &prng);
+	if (!order)
+		return 0;
+
+	/* Reserve a bunch of ranges within the region */
+	for (i = 0; i < count; ++i) {
+		u64 start = order[i] * chunk_size;
+		u64 size = i915_prandom_u32_max_state(chunk_size, &prng);
+
+		/* Allow for some really big holes */
+		if (!size)
+			continue;
+
+		size = round_up(size, PAGE_SIZE);
+		offset = igt_random_offset(&prng, 0, chunk_size, size,
+					   PAGE_SIZE);
+
+		err = igt_reserve_range(mem, &reserved, start + offset, size);
+		if (err) {
+			pr_err("%s failed to reserve range", __func__);
+			goto out_close;
+		}
+
+		/* XXX: maybe sanity check the block range here? */
+		avail -= size;
+	}
+
+	/* Try to see if we can allocate from the remaining space */
+	allocated = 0;
+	cur_avail = avail;
+	do {
+		u64 size = i915_prandom_u32_max_state(cur_avail, &prng);
+
+		size = max_t(u64, round_up(size, PAGE_SIZE), (u64)PAGE_SIZE);
+		obj = igt_object_create(mem, &objects, size, 0);
+
+		if (IS_ERR(obj)) {
+			if (PTR_ERR(obj) == -ENXIO)
+				break;
+
+			err = PTR_ERR(obj);
+			goto out_close;
+		}
+		cur_avail -= size;
+		allocated += size;
+	} while (1);
+
+	if (allocated != avail) {
+		pr_err("%s mismatch between allocation and free space", __func__);
+		err = -EINVAL;
+	}
+
+out_close:
+	kfree(order);
+	close_objects(mem, &objects);
+	i915_buddy_free_list(&mem->mm, &reserved);
+	return err;
+}
+
 static int igt_mock_contiguous(void *arg)
 {
 	struct intel_memory_region *mem = arg;
@@ -1180,6 +1268,7 @@ static int igt_lmem_pages_migrate(void *arg)
 int intel_memory_region_mock_selftests(void)
 {
 	static const struct i915_subtest tests[] = {
+		SUBTEST(igt_mock_reserve),
 		SUBTEST(igt_mock_fill),
 		SUBTEST(igt_mock_contiguous),
 		SUBTEST(igt_mock_splintered_region),
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
