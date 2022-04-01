Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA8D4EED4C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 14:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9FD10E2E0;
	Fri,  1 Apr 2022 12:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A0A10E2BC;
 Fri,  1 Apr 2022 12:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648816638; x=1680352638;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=C7KSgyXS7+TQoLV43yMZNJqRIUfI/4INR6EpCGaMKo4=;
 b=XqglM4YiIFA2Tj3tqil9z0IwraFrpEBhhC/RtMkHeQRzY+PLx1R2jFl9
 /I9RIPe3ekUZPYhmwdkSEmRCxnDuITcRuVGOZHwGVDHC2HEcSlFjDm/Ux
 PPidjLiv9WLuafsarFEdAb6suDf6bcZO+7FoXimsjkvUZRs/pQIHaMM/d
 C8VECENfG+HJouGvZndDKqGIahYhlSIdnpwrF75zGhYg9+cwYsSrpP954
 8McCZMKUcFeEocs58D1sC1LmLmOwS2Nx3zm9zOSZoqnx2I7nFv+f0O/44
 5r2XLxV0GUAhhwj7NHMl3oUXNRJAEJI5GZPExC5GRnoOLhO962R8Cy++z Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="257708068"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="257708068"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 05:37:18 -0700
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="606725209"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 05:37:16 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 6/9] drm/i915/selftest_migrate: Check CCS meta data clear
Date: Fri,  1 Apr 2022 18:07:48 +0530
Message-Id: <20220401123751.27771-7-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220401123751.27771-1-ramalingam.c@intel.com>
References: <20220401123751.27771-1-ramalingam.c@intel.com>
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

Extend the live migrate selftest, to verify the ccs surface clearing
during the Flat-CCS capable lmem obj clear.

v2:
  Look at right places for ccs data [Thomas]

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_migrate.c | 250 ++++++++++++++++++---
 1 file changed, 222 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
index b5da8b8cd039..8cd9a22054f3 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -132,6 +132,124 @@ static int copy(struct intel_migrate *migrate,
 	return err;
 }
 
+static int intel_context_copy_ccs(struct intel_context *ce,
+				  const struct i915_deps *deps,
+				  struct scatterlist *sg,
+				  enum i915_cache_level cache_level,
+				  bool write_to_ccs,
+				  struct i915_request **out)
+{
+	u8 src_access = write_to_ccs ? DIRECT_ACCESS : INDIRECT_ACCESS;
+	u8 dst_access = write_to_ccs ? INDIRECT_ACCESS : DIRECT_ACCESS;
+	struct sgt_dma it = sg_sgt(sg);
+	struct i915_request *rq;
+	u32 offset;
+	int err;
+
+	GEM_BUG_ON(ce->vm != ce->engine->gt->migrate.context->vm);
+	*out = NULL;
+
+	GEM_BUG_ON(ce->ring->size < SZ_64K);
+
+	offset = 0;
+	if (HAS_64K_PAGES(ce->engine->i915))
+		offset = CHUNK_SZ;
+
+	do {
+		int len;
+
+		rq = i915_request_create(ce);
+		if (IS_ERR(rq)) {
+			err = PTR_ERR(rq);
+			goto out_ce;
+		}
+
+		if (deps) {
+			err = i915_request_await_deps(rq, deps);
+			if (err)
+				goto out_rq;
+
+			if (rq->engine->emit_init_breadcrumb) {
+				err = rq->engine->emit_init_breadcrumb(rq);
+				if (err)
+					goto out_rq;
+			}
+
+			deps = NULL;
+		}
+
+		/* The PTE updates + clear must not be interrupted. */
+		err = emit_no_arbitration(rq);
+		if (err)
+			goto out_rq;
+
+		len = emit_pte(rq, &it, cache_level, true, offset, CHUNK_SZ);
+		if (len <= 0) {
+			err = len;
+			goto out_rq;
+		}
+
+		err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
+		if (err)
+			goto out_rq;
+
+		err = emit_copy_ccs(rq, offset, dst_access,
+				    offset, src_access, len);
+		if (err)
+			goto out_rq;
+
+		err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
+
+		/* Arbitration is re-enabled between requests. */
+out_rq:
+		if (*out)
+			i915_request_put(*out);
+		*out = i915_request_get(rq);
+		i915_request_add(rq);
+		if (err || !it.sg || !sg_dma_len(it.sg))
+			break;
+
+		cond_resched();
+	} while (1);
+
+out_ce:
+	return err;
+}
+
+static int
+intel_migrate_ccs_copy(struct intel_migrate *m,
+		       struct i915_gem_ww_ctx *ww,
+		       const struct i915_deps *deps,
+		       struct scatterlist *sg,
+		       enum i915_cache_level cache_level,
+		       bool write_to_ccs,
+		       struct i915_request **out)
+{
+	struct intel_context *ce;
+	int err;
+
+	*out = NULL;
+	if (!m->context)
+		return -ENODEV;
+
+	ce = intel_migrate_create_context(m);
+	if (IS_ERR(ce))
+		ce = intel_context_get(m->context);
+	GEM_BUG_ON(IS_ERR(ce));
+
+	err = intel_context_pin_ww(ce, ww);
+	if (err)
+		goto out;
+
+	err = intel_context_copy_ccs(ce, deps, sg, cache_level,
+				     write_to_ccs, out);
+
+	intel_context_unpin(ce);
+out:
+	intel_context_put(ce);
+	return err;
+}
+
 static int clear(struct intel_migrate *migrate,
 		 int (*fn)(struct intel_migrate *migrate,
 			   struct i915_gem_ww_ctx *ww,
@@ -144,7 +262,8 @@ static int clear(struct intel_migrate *migrate,
 	struct drm_i915_gem_object *obj;
 	struct i915_request *rq;
 	struct i915_gem_ww_ctx ww;
-	u32 *vaddr;
+	u32 *vaddr, val = 0;
+	bool ccs_cap = false;
 	int err = 0;
 	int i;
 
@@ -155,7 +274,12 @@ static int clear(struct intel_migrate *migrate,
 	/* Consider the rounded up memory too */
 	sz = obj->base.size;
 
+	if (HAS_FLAT_CCS(i915) && i915_gem_object_is_lmem(obj))
+		ccs_cap = true;
+
 	for_i915_gem_ww(&ww, err, true) {
+		int ccs_bytes, ccs_bytes_per_chunk;
+
 		err = i915_gem_object_lock(obj, &ww);
 		if (err)
 			continue;
@@ -170,44 +294,114 @@ static int clear(struct intel_migrate *migrate,
 			vaddr[i] = ~i;
 		i915_gem_object_flush_map(obj);
 
-		err = fn(migrate, &ww, obj, sz, &rq);
-		if (!err)
-			continue;
+		if (ccs_cap && !val) {
+			/* Write the obj data into ccs surface */
+			err = intel_migrate_ccs_copy(migrate, &ww, NULL,
+						     obj->mm.pages->sgl,
+						     obj->cache_level,
+						     true, &rq);
+			if (rq && !err) {
+				if (i915_request_wait(rq, 0, HZ) < 0) {
+					pr_err("%ps timed out, size: %u\n",
+					       fn, sz);
+					err = -ETIME;
+				}
+				i915_request_put(rq);
+				rq = NULL;
+			}
+			if (err)
+				continue;
+		}
 
-		if (err != -EDEADLK && err != -EINTR && err != -ERESTARTSYS)
-			pr_err("%ps failed, size: %u\n", fn, sz);
-		if (rq) {
-			i915_request_wait(rq, 0, HZ);
+		err = fn(migrate, &ww, obj, val, &rq);
+		if (rq && !err) {
+			if (i915_request_wait(rq, 0, HZ) < 0) {
+				pr_err("%ps timed out, size: %u\n", fn, sz);
+				err = -ETIME;
+			}
 			i915_request_put(rq);
+			rq = NULL;
 		}
-		i915_gem_object_unpin_map(obj);
-	}
-	if (err)
-		goto err_out;
+		if (err)
+			continue;
 
-	if (rq) {
-		if (i915_request_wait(rq, 0, HZ) < 0) {
-			pr_err("%ps timed out, size: %u\n", fn, sz);
-			err = -ETIME;
+		i915_gem_object_flush_map(obj);
+
+		/* Verify the set/clear of the obj mem */
+		for (i = 0; !err && i < sz / PAGE_SIZE; i++) {
+			int x = i * 1024 +
+				i915_prandom_u32_max_state(1024, prng);
+
+			if (vaddr[x] != val) {
+				pr_err("%ps failed, (%u != %u), offset: %zu\n",
+				       fn, vaddr[x], val,  x * sizeof(u32));
+				igt_hexdump(vaddr + i * 1024, 4096);
+				err = -EINVAL;
+			}
 		}
-		i915_request_put(rq);
-	}
+		if (err)
+			continue;
 
-	for (i = 0; !err && i < sz / PAGE_SIZE; i++) {
-		int x = i * 1024 + i915_prandom_u32_max_state(1024, prng);
+		if (ccs_cap && !val) {
+			for (i = 0; i < sz / sizeof(u32); i++)
+				vaddr[i] = ~i;
+			i915_gem_object_flush_map(obj);
+
+			err = intel_migrate_ccs_copy(migrate, &ww, NULL,
+						     obj->mm.pages->sgl,
+						     obj->cache_level,
+						     false, &rq);
+			if (rq && !err) {
+				if (i915_request_wait(rq, 0, HZ) < 0) {
+					pr_err("%ps timed out, size: %u\n",
+					       fn, sz);
+					err = -ETIME;
+				}
+				i915_request_put(rq);
+				rq = NULL;
+			}
+			if (err)
+				continue;
+
+			ccs_bytes = GET_CCS_BYTES(i915, sz);
+			ccs_bytes_per_chunk = GET_CCS_BYTES(i915, CHUNK_SZ);
+			i915_gem_object_flush_map(obj);
+
+			for (i = 0; !err && i < DIV_ROUND_UP(ccs_bytes, PAGE_SIZE); i++) {
+				int offset = ((i * PAGE_SIZE)  /
+					ccs_bytes_per_chunk) * CHUNK_SZ / sizeof(u32);
+				int ccs_bytes_left = (ccs_bytes - i * PAGE_SIZE) / sizeof(u32);
+				int x = i915_prandom_u32_max_state(min_t(int, 1024,
+									 ccs_bytes_left), prng);
+
+				if (vaddr[offset + x]) {
+					pr_err("%ps ccs clearing failed, offset: %ld/%d\n",
+					       fn, i * PAGE_SIZE + x * sizeof(u32), ccs_bytes);
+					igt_hexdump(vaddr + offset,
+						    min_t(int, 4096,
+							  ccs_bytes_left * sizeof(u32)));
+					err = -EINVAL;
+				}
+			}
+
+			if (err)
+				continue;
+		}
+		i915_gem_object_unpin_map(obj);
+	}
 
-		if (vaddr[x] != sz) {
-			pr_err("%ps failed, size: %u, offset: %zu\n",
-			       fn, sz, x * sizeof(u32));
-			igt_hexdump(vaddr + i * 1024, 4096);
-			err = -EINVAL;
+	if (err) {
+		if (err != -EDEADLK && err != -EINTR && err != -ERESTARTSYS)
+			pr_err("%ps failed, size: %u\n", fn, sz);
+		if (rq && err != -EINVAL) {
+			i915_request_wait(rq, 0, HZ);
+			i915_request_put(rq);
 		}
+
+		i915_gem_object_unpin_map(obj);
 	}
 
-	i915_gem_object_unpin_map(obj);
-err_out:
 	i915_gem_object_put(obj);
-
 	return err;
 }
 
-- 
2.20.1

