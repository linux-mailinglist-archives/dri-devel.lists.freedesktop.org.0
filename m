Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B395EAB50
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 17:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26D410E705;
	Mon, 26 Sep 2022 15:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398CF10E6FD;
 Mon, 26 Sep 2022 15:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664206859; x=1695742859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PNIMw2f85FJeWoy2VzNWwolEn3gbbEfFa1mJvCBjk50=;
 b=B0YwJDi8J0CQc9M2/UsFWpQEdx9vSp/gL09Bpk3WB/K+iVdjeuiNXVag
 h1Na6Ii/o/N7KBLsJqVO1cIhMVLNdabR3ZUZiXcKcA2F7WYt1ChSkvnJ9
 VUAEhgQWdHnPqbVc6Q7GqBiHvb5O1cEo5sS9ZyMEgjWGTMf0ZWWMESdCL
 olam8KBH2v1KtChxuiVX2k7Y4xy3uBbrJdr9H8lXalfKqKKyuyKeDCAC8
 +IHP8XJvxiH7XR7stInmeh53Y0Xoi3ikwGhf+ncF7XRa11VE3nkp6J0aL
 EOwtDp2Zz1Dkyy8V+tvNmj8qXglP3vXkWuZY0Wp8gY4UQAKwg6/xcJLJ7 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="387352436"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="387352436"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 08:40:58 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="763480986"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="763480986"
Received: from bsochack-mobl2.ger.corp.intel.com (HELO
 paris.ger.corp.intel.com) ([10.249.128.215])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 08:40:50 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v12 5/9] drm/i915: Check for integer truncation on scatterlist
 creation
Date: Mon, 26 Sep 2022 18:39:49 +0300
Message-Id: <20220926153953.3836470-6-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220926153953.3836470-1-gwan-gyeong.mun@intel.com>
References: <20220926153953.3836470-1-gwan-gyeong.mun@intel.com>
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
Cc: gustavoars@kernel.org, trix@redhat.com, dlatypov@google.com,
 llvm@lists.linux.dev, linux@rasmusvillemoes.dk,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 linux-hardening@vger.kernel.org, andrzej.hajda@intel.com,
 linux-sparse@vger.kernel.org, matthew.auld@intel.com,
 andi.shyti@linux.intel.com, airlied@redhat.com,
 thomas.hellstrom@linux.intel.com, keescook@chromium.org, jani.nikula@intel.com,
 nathan@kernel.org, mchehab@kernel.org, mauro.chehab@linux.intel.com,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org, vitor@massaru.org,
 luc.vanoostenryck@gmail.com, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

There is an impedance mismatch between the scatterlist API using unsigned
int and our memory/page accounting in unsigned long. That is we may try
to create a scatterlist for a large object that overflows returning a
small table into which we try to fit very many pages. As the object size
is under control of userspace, we have to be prudent and catch the
conversion errors.

To catch the implicit truncation as we switch from unsigned long into the
scatterlist's unsigned int, we use overflows_type check and report
E2BIG prior to the operation. This is already used in our create ioctls to
indicate if the uABI request is simply too large for the backing store.
Failing that type check, we have a second check at sg_alloc_table time
to make sure the values we are passing into the scatterlist API are not
truncated.

It uses pgoff_t for locals that are dealing with page indices, in this
case, the page count is the limit of the page index.
And it uses safe_conversion() macro which performs a type conversion (cast)
of an integer value into a new variable, checking that the destination is
large enough to hold the source value.

v2: Move added i915_utils's macro into drm_util header (Jani N)
v5: Fix macros to be enclosed in parentheses for complex values
    Fix too long line warning
v8: Replace safe_conversion() with check_assign() (Kees)

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_internal.c |  6 ++++--
 drivers/gpu/drm/i915/gem/i915_gem_object.h   |  3 ---
 drivers/gpu/drm/i915/gem/i915_gem_phys.c     |  4 ++++
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c    |  5 ++++-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |  4 ++++
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c  |  5 ++++-
 drivers/gpu/drm/i915/gvt/dmabuf.c            |  9 +++++----
 drivers/gpu/drm/i915/i915_scatterlist.h      | 11 +++++++++++
 8 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
index c698f95af15f..53fa27e1c950 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
@@ -37,10 +37,13 @@ static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
 	struct sg_table *st;
 	struct scatterlist *sg;
 	unsigned int sg_page_sizes;
-	unsigned int npages;
+	pgoff_t npages; /* restricted by sg_alloc_table */
 	int max_order;
 	gfp_t gfp;
 
+	if (check_assign(obj->base.size >> PAGE_SHIFT, &npages))
+		return -E2BIG;
+
 	max_order = MAX_ORDER;
 #ifdef CONFIG_SWIOTLB
 	if (is_swiotlb_active(obj->base.dev->dev)) {
@@ -67,7 +70,6 @@ static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
 	if (!st)
 		return -ENOMEM;
 
-	npages = obj->base.size / PAGE_SIZE;
 	if (sg_alloc_table(st, npages, GFP_KERNEL)) {
 		kfree(st);
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 2d9edda7e704..a826b959e3fb 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -26,9 +26,6 @@ enum intel_region_id;
  * this and catch if we ever need to fix it. In the meantime, if you do
  * spot such a local variable, please consider fixing!
  *
- * Aside from our own locals (for which we have no excuse!):
- * - sg_table embeds unsigned int for nents
- *
  * We can check for invalidly typed locals with typecheck(), see for example
  * i915_gem_object_get_sg().
  */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index 0d0e46dae559..88ba7266a3a5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -28,6 +28,10 @@ static int i915_gem_object_get_pages_phys(struct drm_i915_gem_object *obj)
 	void *dst;
 	int i;
 
+	/* Contiguous chunk, with a single scatterlist element */
+	if (overflows_type(obj->base.size, sg->length))
+		return -E2BIG;
+
 	if (GEM_WARN_ON(i915_gem_object_needs_bit17_swizzle(obj)))
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index f42ca1179f37..339b0a9cf2d0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -193,13 +193,16 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct intel_memory_region *mem = obj->mm.region;
 	struct address_space *mapping = obj->base.filp->f_mapping;
-	const unsigned long page_count = obj->base.size / PAGE_SIZE;
 	unsigned int max_segment = i915_sg_segment_size();
 	struct sg_table *st;
 	struct sgt_iter sgt_iter;
+	pgoff_t page_count;
 	struct page *page;
 	int ret;
 
+	if (check_assign(obj->base.size >> PAGE_SHIFT, &page_count))
+		return -E2BIG;
+
 	/*
 	 * Assert that the object is not currently in any GPU domain. As it
 	 * wasn't in the GTT, there shouldn't be any way it could have been in
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 004fc7478b41..bf99d1f02bd9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -792,6 +792,10 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
 {
 	struct ttm_place requested, busy[I915_TTM_MAX_PLACEMENTS];
 	struct ttm_placement placement;
+	pgoff_t num_pages;
+
+	if (check_assign(obj->base.size >> PAGE_SHIFT, &num_pages))
+		return -E2BIG;
 
 	GEM_BUG_ON(obj->mm.n_placements > I915_TTM_MAX_PLACEMENTS);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 8423df021b71..48237e443863 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -128,13 +128,16 @@ static void i915_gem_object_userptr_drop_ref(struct drm_i915_gem_object *obj)
 
 static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
 {
-	const unsigned long num_pages = obj->base.size >> PAGE_SHIFT;
 	unsigned int max_segment = i915_sg_segment_size();
 	struct sg_table *st;
 	unsigned int sg_page_sizes;
 	struct page **pvec;
+	pgoff_t num_pages; /* limited by sg_alloc_table_from_pages_segment */
 	int ret;
 
+	if (check_assign(obj->base.size >> PAGE_SHIFT, &num_pages))
+		return -E2BIG;
+
 	st = kmalloc(sizeof(*st), GFP_KERNEL);
 	if (!st)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index 01e54b45c5c1..bc6e823584ad 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -42,8 +42,7 @@
 
 #define GEN8_DECODE_PTE(pte) (pte & GENMASK_ULL(63, 12))
 
-static int vgpu_gem_get_pages(
-		struct drm_i915_gem_object *obj)
+static int vgpu_gem_get_pages(struct drm_i915_gem_object *obj)
 {
 	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
 	struct intel_vgpu *vgpu;
@@ -52,7 +51,10 @@ static int vgpu_gem_get_pages(
 	int i, j, ret;
 	gen8_pte_t __iomem *gtt_entries;
 	struct intel_vgpu_fb_info *fb_info;
-	u32 page_num;
+	pgoff_t page_num;
+
+	if (check_assign(obj->base.size >> PAGE_SHIFT, &page_num))
+		return -E2BIG;
 
 	fb_info = (struct intel_vgpu_fb_info *)obj->gvt_info;
 	if (drm_WARN_ON(&dev_priv->drm, !fb_info))
@@ -66,7 +68,6 @@ static int vgpu_gem_get_pages(
 	if (unlikely(!st))
 		return -ENOMEM;
 
-	page_num = obj->base.size >> PAGE_SHIFT;
 	ret = sg_alloc_table(st, page_num, GFP_KERNEL);
 	if (ret) {
 		kfree(st);
diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
index 9ddb3e743a3e..1d1802beb42b 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.h
+++ b/drivers/gpu/drm/i915/i915_scatterlist.h
@@ -220,4 +220,15 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
 						     u64 region_start,
 						     u32 page_alignment);
 
+/* Wrap scatterlist.h to sanity check for integer truncation */
+typedef unsigned int __sg_size_t; /* see linux/scatterlist.h */
+#define sg_alloc_table(sgt, nents, gfp) \
+	overflows_type(nents, __sg_size_t) ? -E2BIG \
+		: ((sg_alloc_table)(sgt, (__sg_size_t)(nents), gfp))
+
+#define sg_alloc_table_from_pages_segment(sgt, pages, npages, offset, size, max_segment, gfp) \
+	overflows_type(npages, __sg_size_t) ? -E2BIG \
+		: ((sg_alloc_table_from_pages_segment)(sgt, pages, (__sg_size_t)(npages), offset, \
+						       size, max_segment, gfp))
+
 #endif
-- 
2.37.1

