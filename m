Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7358B3AAC42
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 08:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D6C6E87D;
	Thu, 17 Jun 2021 06:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1496E87B;
 Thu, 17 Jun 2021 06:30:48 +0000 (UTC)
IronPort-SDR: s5S+1q0I4RFQ/uk2Otkkd7MB0F8XaAXXvaLmgfycNSY8u2W/fPG0/1LbOIx1uJ+IGhwr0H15vr
 VzNGZrFD1ovQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="203287837"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="203287837"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 23:30:48 -0700
IronPort-SDR: eAZHIKwgQktvA38+K66Hmfo56vYRzg7Bw57Ma4MPZp9r01WPWv0+Mq31TPJR+jJMwi5vqP9SUG
 +oJHvGEOoyOQ==
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="554302728"
Received: from vanderss-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.193])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 23:30:46 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 08/12] drm/i915/gt: Pipelined clear
Date: Thu, 17 Jun 2021 08:30:14 +0200
Message-Id: <20210617063018.92802-9-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617063018.92802-1-thomas.hellstrom@linux.intel.com>
References: <20210617063018.92802-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Update the PTE and emit a clear within a single unpreemptible packet
such that we can schedule and pipeline clears.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
v3:
- Handle engine instances correctly (Reported by Matthew Auld)
---
 drivers/gpu/drm/i915/gt/intel_migrate.c    | 143 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_migrate.h    |  20 +++
 drivers/gpu/drm/i915/gt/selftest_migrate.c | 163 +++++++++++++++++++++
 3 files changed, 326 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index e2e860063e7b..ba4009120b33 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -488,6 +488,114 @@ intel_context_migrate_copy(struct intel_context *ce,
 	return err;
 }
 
+static int emit_clear(struct i915_request *rq, int size, u32 value)
+{
+	const int gen = INTEL_GEN(rq->engine->i915);
+	u32 instance = rq->engine->instance;
+	u32 *cs;
+
+	GEM_BUG_ON(size >> PAGE_SHIFT > S16_MAX);
+
+	cs = intel_ring_begin(rq, gen >= 8 ? 8 : 6);
+	if (IS_ERR(cs))
+		return PTR_ERR(cs);
+
+	if (gen >= 8) {
+		*cs++ = XY_COLOR_BLT_CMD | BLT_WRITE_RGBA | (7 - 2);
+		*cs++ = BLT_DEPTH_32 | BLT_ROP_COLOR_COPY | PAGE_SIZE;
+		*cs++ = 0;
+		*cs++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
+		*cs++ = 0; /* offset */
+		*cs++ = instance;
+		*cs++ = value;
+		*cs++ = MI_NOOP;
+	} else {
+		GEM_BUG_ON(instance);
+		*cs++ = XY_COLOR_BLT_CMD | BLT_WRITE_RGBA | (6 - 2);
+		*cs++ = BLT_DEPTH_32 | BLT_ROP_COLOR_COPY | PAGE_SIZE;
+		*cs++ = 0;
+		*cs++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
+		*cs++ = 0;
+		*cs++ = value;
+	}
+
+	intel_ring_advance(rq, cs);
+	return 0;
+}
+
+int
+intel_context_migrate_clear(struct intel_context *ce,
+			    struct dma_fence *await,
+			    struct scatterlist *sg,
+			    enum i915_cache_level cache_level,
+			    bool is_lmem,
+			    u32 value,
+			    struct i915_request **out)
+{
+	struct sgt_dma it = sg_sgt(sg);
+	struct i915_request *rq;
+	int err;
+
+	*out = NULL;
+
+	GEM_BUG_ON(ce->ring->size < SZ_64K);
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
+		if (await) {
+			err = i915_request_await_dma_fence(rq, await);
+			if (err)
+				goto out_rq;
+
+			if (rq->engine->emit_init_breadcrumb) {
+				err = rq->engine->emit_init_breadcrumb(rq);
+				if (err)
+					goto out_rq;
+			}
+
+			await = NULL;
+		}
+
+		/* The PTE updates + clear must not be interrupted. */
+		err = emit_no_arbitration(rq);
+		if (err)
+			goto out_rq;
+
+		len = emit_pte(rq, &it, cache_level, is_lmem, 0, CHUNK_SZ);
+		if (len <= 0) {
+			err = len;
+			goto out_rq;
+		}
+
+		err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
+		if (err)
+			goto out_rq;
+
+		err = emit_clear(rq, len, value);
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
 int intel_migrate_copy(struct intel_migrate *m,
 		       struct i915_gem_ww_ctx *ww,
 		       struct dma_fence *await,
@@ -526,6 +634,41 @@ int intel_migrate_copy(struct intel_migrate *m,
 	return err;
 }
 
+int
+intel_migrate_clear(struct intel_migrate *m,
+		    struct i915_gem_ww_ctx *ww,
+		    struct dma_fence *await,
+		    struct scatterlist *sg,
+		    enum i915_cache_level cache_level,
+		    bool is_lmem,
+		    u32 value,
+		    struct i915_request **out)
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
+	err = intel_context_migrate_clear(ce, await, sg, cache_level,
+					  is_lmem, value, out);
+
+	intel_context_unpin(ce);
+out:
+	intel_context_put(ce);
+	return err;
+}
+
 void intel_migrate_fini(struct intel_migrate *m)
 {
 	struct intel_context *ce;
diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.h b/drivers/gpu/drm/i915/gt/intel_migrate.h
index 32c61190ed73..4e18e755a00b 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.h
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.h
@@ -6,6 +6,8 @@
 #ifndef __INTEL_MIGRATE__
 #define __INTEL_MIGRATE__
 
+#include <linux/types.h>
+
 #include "intel_migrate_types.h"
 
 struct dma_fence;
@@ -40,6 +42,24 @@ int intel_context_migrate_copy(struct intel_context *ce,
 			       bool dst_is_lmem,
 			       struct i915_request **out);
 
+int
+intel_migrate_clear(struct intel_migrate *m,
+		    struct i915_gem_ww_ctx *ww,
+		    struct dma_fence *await,
+		    struct scatterlist *sg,
+		    enum i915_cache_level cache_level,
+		    bool is_lmem,
+		    u32 value,
+		    struct i915_request **out);
+int
+intel_context_migrate_clear(struct intel_context *ce,
+			    struct dma_fence *await,
+			    struct scatterlist *sg,
+			    enum i915_cache_level cache_level,
+			    bool is_lmem,
+			    u32 value,
+			    struct i915_request **out);
+
 void intel_migrate_fini(struct intel_migrate *m);
 
 #endif /* __INTEL_MIGRATE__ */
diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
index 9784d149ebf1..159c8656e1b0 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -129,6 +129,82 @@ static int copy(struct intel_migrate *migrate,
 	return err;
 }
 
+static int clear(struct intel_migrate *migrate,
+		 int (*fn)(struct intel_migrate *migrate,
+			   struct i915_gem_ww_ctx *ww,
+			   struct drm_i915_gem_object *obj,
+			   u32 value,
+			   struct i915_request **out),
+		 u32 sz, struct rnd_state *prng)
+{
+	struct drm_i915_private *i915 = migrate->context->engine->i915;
+	struct drm_i915_gem_object *obj;
+	struct i915_request *rq;
+	struct i915_gem_ww_ctx ww;
+	u32 *vaddr;
+	int err = 0;
+	int i;
+
+	obj = create_lmem_or_internal(i915, sz);
+	if (IS_ERR(obj))
+		return 0;
+
+	for_i915_gem_ww(&ww, err, true) {
+		err = i915_gem_object_lock(obj, &ww);
+		if (err)
+			continue;
+
+		vaddr = i915_gem_object_pin_map(obj, I915_MAP_WC);
+		if (IS_ERR(vaddr)) {
+			err = PTR_ERR(vaddr);
+			continue;
+		}
+
+		for (i = 0; i < sz / sizeof(u32); i++)
+			vaddr[i] = ~i;
+		i915_gem_object_flush_map(obj);
+
+		err = fn(migrate, &ww, obj, sz, &rq);
+		if (!err)
+			continue;
+
+		if (err != -EDEADLK && err != -EINTR && err != -ERESTARTSYS)
+			pr_err("%ps failed, size: %u\n", fn, sz);
+		if (rq) {
+			i915_request_wait(rq, 0, HZ);
+			i915_request_put(rq);
+		}
+		i915_gem_object_unpin_map(obj);
+	}
+	if (err)
+		goto err_out;
+
+	if (rq) {
+		if (i915_request_wait(rq, 0, HZ) < 0) {
+			pr_err("%ps timed out, size: %u\n", fn, sz);
+			err = -ETIME;
+		}
+		i915_request_put(rq);
+	}
+
+	for (i = 0; !err && i < sz / PAGE_SIZE; i++) {
+		int x = i * 1024 + i915_prandom_u32_max_state(1024, prng);
+
+		if (vaddr[x] != sz) {
+			pr_err("%ps failed, size: %u, offset: %zu\n",
+			       fn, sz, x * sizeof(u32));
+			igt_hexdump(vaddr + i * 1024, 4096);
+			err = -EINVAL;
+		}
+	}
+
+	i915_gem_object_unpin_map(obj);
+err_out:
+	i915_gem_object_put(obj);
+
+	return err;
+}
+
 static int __migrate_copy(struct intel_migrate *migrate,
 			  struct i915_gem_ww_ctx *ww,
 			  struct drm_i915_gem_object *src,
@@ -169,6 +245,44 @@ global_copy(struct intel_migrate *migrate, u32 sz, struct rnd_state *prng)
 	return copy(migrate, __global_copy, sz, prng);
 }
 
+static int __migrate_clear(struct intel_migrate *migrate,
+			   struct i915_gem_ww_ctx *ww,
+			   struct drm_i915_gem_object *obj,
+			   u32 value,
+			   struct i915_request **out)
+{
+	return intel_migrate_clear(migrate, ww, NULL,
+				   obj->mm.pages->sgl,
+				   obj->cache_level,
+				   i915_gem_object_is_lmem(obj),
+				   value, out);
+}
+
+static int __global_clear(struct intel_migrate *migrate,
+			  struct i915_gem_ww_ctx *ww,
+			  struct drm_i915_gem_object *obj,
+			  u32 value,
+			  struct i915_request **out)
+{
+	return intel_context_migrate_clear(migrate->context, NULL,
+					   obj->mm.pages->sgl,
+					   obj->cache_level,
+					   i915_gem_object_is_lmem(obj),
+					   value, out);
+}
+
+static int
+migrate_clear(struct intel_migrate *migrate, u32 sz, struct rnd_state *prng)
+{
+	return clear(migrate, __migrate_clear, sz, prng);
+}
+
+static int
+global_clear(struct intel_migrate *migrate, u32 sz, struct rnd_state *prng)
+{
+	return clear(migrate, __global_clear, sz, prng);
+}
+
 static int live_migrate_copy(void *arg)
 {
 	struct intel_migrate *migrate = arg;
@@ -190,6 +304,28 @@ static int live_migrate_copy(void *arg)
 	return 0;
 }
 
+static int live_migrate_clear(void *arg)
+{
+	struct intel_migrate *migrate = arg;
+	struct drm_i915_private *i915 = migrate->context->engine->i915;
+	I915_RND_STATE(prng);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sizes); i++) {
+		int err;
+
+		err = migrate_clear(migrate, sizes[i], &prng);
+		if (err == 0)
+			err = global_clear(migrate, sizes[i], &prng);
+
+		i915_gem_drain_freed_objects(i915);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 struct threaded_migrate {
 	struct intel_migrate *migrate;
 	struct task_struct *tsk;
@@ -271,12 +407,39 @@ static int thread_global_copy(void *arg)
 	return threaded_migrate(arg, __thread_global_copy, 0);
 }
 
+static int __thread_migrate_clear(void *arg)
+{
+	struct threaded_migrate *tm = arg;
+
+	return migrate_clear(tm->migrate, 2 * CHUNK_SZ, &tm->prng);
+}
+
+static int __thread_global_clear(void *arg)
+{
+	struct threaded_migrate *tm = arg;
+
+	return global_clear(tm->migrate, 2 * CHUNK_SZ, &tm->prng);
+}
+
+static int thread_migrate_clear(void *arg)
+{
+	return threaded_migrate(arg, __thread_migrate_clear, 0);
+}
+
+static int thread_global_clear(void *arg)
+{
+	return threaded_migrate(arg, __thread_global_clear, 0);
+}
+
 int intel_migrate_live_selftests(struct drm_i915_private *i915)
 {
 	static const struct i915_subtest tests[] = {
 		SUBTEST(live_migrate_copy),
+		SUBTEST(live_migrate_clear),
 		SUBTEST(thread_migrate_copy),
+		SUBTEST(thread_migrate_clear),
 		SUBTEST(thread_global_copy),
+		SUBTEST(thread_global_clear),
 	};
 	struct intel_migrate m;
 	int err;
-- 
2.31.1

