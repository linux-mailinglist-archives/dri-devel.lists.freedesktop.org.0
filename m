Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5B43F810B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 05:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6046E4CD;
	Thu, 26 Aug 2021 03:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E996E4D7;
 Thu, 26 Aug 2021 03:28:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="215811075"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="215811075"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:28:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="684738564"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:28:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniele.ceraolospurio@intel.com>
Subject: [PATCH 16/27] drm/i915: Allocate error capture in nowait context
Date: Wed, 25 Aug 2021 20:23:16 -0700
Message-Id: <20210826032327.18078-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826032327.18078-1-matthew.brost@intel.com>
References: <20210826032327.18078-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Error captures can now be done in a work queue processing G2H messages.
These messages need to be completely done being processed in the reset
path, to avoid races in the missing G2H cleanup, which create a
dependency on memory allocations and dma fences (i915_requests).
Requests depend on resets, thus now we have a circular dependency. To
work around this, allocate the error capture in a nowait context.

v2:
 (Daniel Vetter)
  - Use GFP_NOWAIT instead GFP_ATOMIC

Fixes: dc0dad365c5e ("Fix for error capture after full GPU reset with GuC")
Fixes: 573ba126aef3 ("Capture error state on context reset")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 39 +++++++++++++--------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index b9f66dbd46bb..8696ead02118 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -49,8 +49,7 @@
 #include "i915_memcpy.h"
 #include "i915_scatterlist.h"
 
-#define ALLOW_FAIL (GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN)
-#define ATOMIC_MAYFAIL (GFP_ATOMIC | __GFP_NOWARN)
+#define ATOMIC_MAYFAIL (GFP_NOWAIT | __GFP_NOWARN)
 
 static void __sg_set_buf(struct scatterlist *sg,
 			 void *addr, unsigned int len, loff_t it)
@@ -79,7 +78,7 @@ static bool __i915_error_grow(struct drm_i915_error_state_buf *e, size_t len)
 	if (e->cur == e->end) {
 		struct scatterlist *sgl;
 
-		sgl = (typeof(sgl))__get_free_page(ALLOW_FAIL);
+		sgl = (typeof(sgl))__get_free_page(ATOMIC_MAYFAIL);
 		if (!sgl) {
 			e->err = -ENOMEM;
 			return false;
@@ -99,10 +98,10 @@ static bool __i915_error_grow(struct drm_i915_error_state_buf *e, size_t len)
 	}
 
 	e->size = ALIGN(len + 1, SZ_64K);
-	e->buf = kmalloc(e->size, ALLOW_FAIL);
+	e->buf = kmalloc(e->size, ATOMIC_MAYFAIL);
 	if (!e->buf) {
 		e->size = PAGE_ALIGN(len + 1);
-		e->buf = kmalloc(e->size, GFP_KERNEL);
+		e->buf = kmalloc(e->size, ATOMIC_MAYFAIL);
 	}
 	if (!e->buf) {
 		e->err = -ENOMEM;
@@ -243,12 +242,12 @@ static bool compress_init(struct i915_vma_compress *c)
 {
 	struct z_stream_s *zstream = &c->zstream;
 
-	if (pool_init(&c->pool, ALLOW_FAIL))
+	if (pool_init(&c->pool, ATOMIC_MAYFAIL))
 		return false;
 
 	zstream->workspace =
 		kmalloc(zlib_deflate_workspacesize(MAX_WBITS, MAX_MEM_LEVEL),
-			ALLOW_FAIL);
+			ATOMIC_MAYFAIL);
 	if (!zstream->workspace) {
 		pool_fini(&c->pool);
 		return false;
@@ -256,7 +255,7 @@ static bool compress_init(struct i915_vma_compress *c)
 
 	c->tmp = NULL;
 	if (i915_has_memcpy_from_wc())
-		c->tmp = pool_alloc(&c->pool, ALLOW_FAIL);
+		c->tmp = pool_alloc(&c->pool, ATOMIC_MAYFAIL);
 
 	return true;
 }
@@ -280,7 +279,7 @@ static void *compress_next_page(struct i915_vma_compress *c,
 	if (dst->page_count >= dst->num_pages)
 		return ERR_PTR(-ENOSPC);
 
-	page = pool_alloc(&c->pool, ALLOW_FAIL);
+	page = pool_alloc(&c->pool, ATOMIC_MAYFAIL);
 	if (!page)
 		return ERR_PTR(-ENOMEM);
 
@@ -376,7 +375,7 @@ struct i915_vma_compress {
 
 static bool compress_init(struct i915_vma_compress *c)
 {
-	return pool_init(&c->pool, ALLOW_FAIL) == 0;
+	return pool_init(&c->pool, ATOMIC_MAYFAIL) == 0;
 }
 
 static bool compress_start(struct i915_vma_compress *c)
@@ -391,7 +390,7 @@ static int compress_page(struct i915_vma_compress *c,
 {
 	void *ptr;
 
-	ptr = pool_alloc(&c->pool, ALLOW_FAIL);
+	ptr = pool_alloc(&c->pool, ATOMIC_MAYFAIL);
 	if (!ptr)
 		return -ENOMEM;
 
@@ -1026,7 +1025,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 
 	num_pages = min_t(u64, vma->size, vma->obj->base.size) >> PAGE_SHIFT;
 	num_pages = DIV_ROUND_UP(10 * num_pages, 8); /* worstcase zlib growth */
-	dst = kmalloc(sizeof(*dst) + num_pages * sizeof(u32 *), ALLOW_FAIL);
+	dst = kmalloc(sizeof(*dst) + num_pages * sizeof(u32 *), ATOMIC_MAYFAIL);
 	if (!dst)
 		return NULL;
 
@@ -1462,7 +1461,7 @@ capture_engine(struct intel_engine_cs *engine,
 	struct i915_request *rq = NULL;
 	unsigned long flags;
 
-	ee = intel_engine_coredump_alloc(engine, GFP_KERNEL);
+	ee = intel_engine_coredump_alloc(engine, ATOMIC_MAYFAIL);
 	if (!ee)
 		return NULL;
 
@@ -1510,7 +1509,7 @@ gt_record_engines(struct intel_gt_coredump *gt,
 		struct intel_engine_coredump *ee;
 
 		/* Refill our page pool before entering atomic section */
-		pool_refill(&compress->pool, ALLOW_FAIL);
+		pool_refill(&compress->pool, ATOMIC_MAYFAIL);
 
 		ee = capture_engine(engine, compress);
 		if (!ee)
@@ -1536,7 +1535,7 @@ gt_record_uc(struct intel_gt_coredump *gt,
 	const struct intel_uc *uc = &gt->_gt->uc;
 	struct intel_uc_coredump *error_uc;
 
-	error_uc = kzalloc(sizeof(*error_uc), ALLOW_FAIL);
+	error_uc = kzalloc(sizeof(*error_uc), ATOMIC_MAYFAIL);
 	if (!error_uc)
 		return NULL;
 
@@ -1547,8 +1546,8 @@ gt_record_uc(struct intel_gt_coredump *gt,
 	 * As modparams are generally accesible from the userspace make
 	 * explicit copies of the firmware paths.
 	 */
-	error_uc->guc_fw.path = kstrdup(uc->guc.fw.path, ALLOW_FAIL);
-	error_uc->huc_fw.path = kstrdup(uc->huc.fw.path, ALLOW_FAIL);
+	error_uc->guc_fw.path = kstrdup(uc->guc.fw.path, ATOMIC_MAYFAIL);
+	error_uc->huc_fw.path = kstrdup(uc->huc.fw.path, ATOMIC_MAYFAIL);
 	error_uc->guc_log =
 		i915_vma_coredump_create(gt->_gt,
 					 uc->guc.log.vma, "GuC log buffer",
@@ -1815,7 +1814,7 @@ i915_vma_capture_prepare(struct intel_gt_coredump *gt)
 {
 	struct i915_vma_compress *compress;
 
-	compress = kmalloc(sizeof(*compress), ALLOW_FAIL);
+	compress = kmalloc(sizeof(*compress), ATOMIC_MAYFAIL);
 	if (!compress)
 		return NULL;
 
@@ -1848,11 +1847,11 @@ i915_gpu_coredump(struct intel_gt *gt, intel_engine_mask_t engine_mask)
 	if (IS_ERR(error))
 		return error;
 
-	error = i915_gpu_coredump_alloc(i915, ALLOW_FAIL);
+	error = i915_gpu_coredump_alloc(i915, ATOMIC_MAYFAIL);
 	if (!error)
 		return ERR_PTR(-ENOMEM);
 
-	error->gt = intel_gt_coredump_alloc(gt, ALLOW_FAIL);
+	error->gt = intel_gt_coredump_alloc(gt, ATOMIC_MAYFAIL);
 	if (error->gt) {
 		struct i915_vma_compress *compress;
 
-- 
2.32.0

