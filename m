Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E393FEF5C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 16:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEEB6E5AE;
	Thu,  2 Sep 2021 14:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79ED6E593
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 14:21:17 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q11so3210642wrr.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 07:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wXC2HMimR90VPfisSBN5M7Yo3orjqHw40JKNIEVUGuE=;
 b=aOc+rxwt4ipvOWKXS+YObPoU6ELRb8PYe/QWaPU7ADW1H5QQs32Avhb+Clrf8FrZKk
 w7oCG/QSheoJOces9NKltn9A8fGgJxNTTnS52bh5AqgL3Yif/xrRaVXGscPoIrJKpYya
 wWAyQ+eD4N5LTQXmcaKFugkgKU3HpJFc+kp1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wXC2HMimR90VPfisSBN5M7Yo3orjqHw40JKNIEVUGuE=;
 b=OWP5ep8q1lLb/ABR7r/Vs0rPENbUzott41Qgs0j4+Yvy+lc8LbUuVCyYw+qfDBgQH7
 5mtJ1N5gC6J7xD3OlaR8xGeP0Ac5xWvb3CZdJQrd2JFNt95BcDztwZpl+uAilbD+ocS/
 yAH0vHHYZ3ZHIAShDWD/l+JePMWnRfiZDTT9RboFTd6atl2SRswtCOctpC6XWuvwaZo2
 tBXnlUbdIenmi8EnkkJJwrsgzSjH/l13H4hksNqwMmNuYj6r4a4UHjJkIYPtXdLa9m75
 21FDOUfR8o1R2C6Ek5+Z6cjnS/t9xtH+e1+1Lucul+rK3eenc/Mrlhpe6fRAy2BME6FA
 Y5lg==
X-Gm-Message-State: AOAM531lcJjY46vaRqeI3UIeRB+6aOF1agKDuwrwSyfAZdeuJMLHanq9
 1vJ2mHRDuY1QYBvkNJ38XlA75S403d0uaQ==
X-Google-Smtp-Source: ABdhPJyXffpUpZpVNB8FsoBe33QO/zOZ0QyVr9SYqtE/GMBwP1fYYJ4Vv01fLRtCGyXScl11bMVFIQ==
X-Received: by 2002:adf:d1ab:: with SMTP id w11mr4105167wrc.372.1630592476204; 
 Thu, 02 Sep 2021 07:21:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l2sm1841811wmi.1.2021.09.02.07.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 07:21:15 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>
Subject: [PATCH 09/11] drm/i915: Drop __rcu from gem_context->vm
Date: Thu,  2 Sep 2021 16:20:55 +0200
Message-Id: <20210902142057.929669-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210902142057.929669-1-daniel.vetter@ffwll.ch>
References: <20210902142057.929669-1-daniel.vetter@ffwll.ch>
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

It's been invariant since

    commit ccbc1b97948ab671335e950271e39766729736c3
    Author: Jason Ekstrand <jason@jlekstrand.net>
    Date:   Thu Jul 8 10:48:30 2021 -0500

        drm/i915/gem: Don't allow changing the VM on running contexts (v4)

this just completes the deed. I've tried to split out prep work for
more careful review as much as possible, this is what's left:

- get_ppgtt gets simplified since we don't need to grab a temporary
  reference - we can rely on the temporary reference for the gem_ctx
  while we inspect the vm. The new vm_id still needs a full
  i915_vm_open ofc. This also removes the final caller of context_get_vm_rcu

- A pile of selftests can now just look at ctx->vm instead of
  rcu_dereference_protected( , true) or similar things.

- All callers of i915_gem_context_vm also disappear.

- I've changed the hugepage selftest to set scrub_64K without any
  locking, because when we inspect that setting we're also not taking
  any locks either. It works because it's a selftests that's careful
  (single threaded gives you nice ordering) and not a live driver
  where races can happen from anywhere.

These can only be split up further if we have some intermediate state
with a bunch more rcu_dereference_protected(ctx->vm, true), just to
shut up lockdep and sparse.

The conversion to __rcu happened in

commit a4e7ccdac38ec8335d9e4e2656c1a041c77feae1
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Fri Oct 4 14:40:09 2019 +0100

    drm/i915: Move context management under GEM

Note that we're not breaking the actual bugfix in there: The real
bugfix is pushing the i915_vm_relase onto a separate worker, to avoid
locking inversion issues. The rcu conversion was just thrown in for
entertainment value on top (no vm lookup isn't even close to anything
that's a hotpath where removing the single spinlock can be measured).

v2: Rebase over the change to move the i915_vm_put() into
i915_gem_context_release().

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 55 ++-----------------
 drivers/gpu/drm/i915/gem/i915_gem_context.h   | 14 +----
 .../gpu/drm/i915/gem/i915_gem_context_types.h |  2 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  4 +-
 .../drm/i915/gem/selftests/i915_gem_context.c | 24 +++-----
 drivers/gpu/drm/i915/i915_trace.h             |  2 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c     |  2 +-
 7 files changed, 22 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 18e23d9220ae..fe8cd5456438 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -742,44 +742,6 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
 	return ret;
 }
 
-static struct i915_address_space *
-context_get_vm_rcu(struct i915_gem_context *ctx)
-{
-	GEM_BUG_ON(!rcu_access_pointer(ctx->vm));
-
-	do {
-		struct i915_address_space *vm;
-
-		/*
-		 * We do not allow downgrading from full-ppgtt [to a shared
-		 * global gtt], so ctx->vm cannot become NULL.
-		 */
-		vm = rcu_dereference(ctx->vm);
-		if (!kref_get_unless_zero(&vm->ref))
-			continue;
-
-		/*
-		 * This ppgtt may have be reallocated between
-		 * the read and the kref, and reassigned to a third
-		 * context. In order to avoid inadvertent sharing
-		 * of this ppgtt with that third context (and not
-		 * src), we have to confirm that we have the same
-		 * ppgtt after passing through the strong memory
-		 * barrier implied by a successful
-		 * kref_get_unless_zero().
-		 *
-		 * Once we have acquired the current ppgtt of ctx,
-		 * we no longer care if it is released from ctx, as
-		 * it cannot be reallocated elsewhere.
-		 */
-
-		if (vm == rcu_access_pointer(ctx->vm))
-			return rcu_pointer_handoff(vm);
-
-		i915_vm_put(vm);
-	} while (1);
-}
-
 static int intel_context_set_gem(struct intel_context *ce,
 				 struct i915_gem_context *ctx,
 				 struct intel_sseu sseu)
@@ -990,7 +952,7 @@ static void i915_gem_context_release_work(struct work_struct *work)
 	if (ctx->syncobj)
 		drm_syncobj_put(ctx->syncobj);
 
-	vm = i915_gem_context_vm(ctx);
+	vm = ctx->vm;
 	if (vm)
 		i915_vm_put(vm);
 
@@ -1216,7 +1178,7 @@ static void context_close(struct i915_gem_context *ctx)
 
 	set_closed_name(ctx);
 
-	vm = i915_gem_context_vm(ctx);
+	vm = ctx->vm;
 	if (vm) {
 		/* i915_vm_close drops the final reference, which is a bit too
 		 * early and could result in surprises with concurrent
@@ -1335,7 +1297,7 @@ i915_gem_create_context(struct drm_i915_private *i915,
 		vm = &ppgtt->vm;
 	}
 	if (vm) {
-		RCU_INIT_POINTER(ctx->vm, i915_vm_open(vm));
+		ctx->vm = i915_vm_open(vm);
 
 		/* i915_vm_open() takes a reference */
 		i915_vm_put(vm);
@@ -1561,15 +1523,12 @@ static int get_ppgtt(struct drm_i915_file_private *file_priv,
 	if (!i915_gem_context_is_full_ppgtt(ctx))
 		return -ENODEV;
 
-	rcu_read_lock();
-	vm = context_get_vm_rcu(ctx);
-	rcu_read_unlock();
-	if (!vm)
-		return -ENODEV;
+	vm = ctx->vm;
+	GEM_BUG_ON(!vm);
 
 	err = xa_alloc(&file_priv->vm_xa, &id, vm, xa_limit_32b, GFP_KERNEL);
 	if (err)
-		goto err_put;
+		return err;
 
 	i915_vm_open(vm);
 
@@ -1577,8 +1536,6 @@ static int get_ppgtt(struct drm_i915_file_private *file_priv,
 	args->value = id;
 	args->size = 0;
 
-err_put:
-	i915_vm_put(vm);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
index 37536a260e6e..7696bc91647d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -148,17 +148,11 @@ static inline void i915_gem_context_put(struct i915_gem_context *ctx)
 	kref_put(&ctx->ref, i915_gem_context_release);
 }
 
-static inline struct i915_address_space *
-i915_gem_context_vm(struct i915_gem_context *ctx)
-{
-	return rcu_dereference_protected(ctx->vm, lockdep_is_held(&ctx->mutex));
-}
-
 static inline bool i915_gem_context_is_full_ppgtt(struct i915_gem_context *ctx)
 {
-	GEM_BUG_ON(!!rcu_access_pointer(ctx->vm) != HAS_FULL_PPGTT(ctx->i915));
+	GEM_BUG_ON(!!ctx->vm != HAS_FULL_PPGTT(ctx->i915));
 
-	return !!rcu_access_pointer(ctx->vm);
+	return !!ctx->vm;
 }
 
 static inline struct i915_address_space *
@@ -166,12 +160,10 @@ i915_gem_context_get_eb_vm(struct i915_gem_context *ctx)
 {
 	struct i915_address_space *vm;
 
-	rcu_read_lock();
-	vm = rcu_dereference(ctx->vm);
+	vm = ctx->vm;
 	if (!vm)
 		vm = &ctx->i915->ggtt.vm;
 	vm = i915_vm_get(vm);
-	rcu_read_unlock();
 
 	return vm;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 0c38789bd4a8..c4617e4d9fa9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -262,7 +262,7 @@ struct i915_gem_context {
 	 * In other modes, this is a NULL pointer with the expectation that
 	 * the caller uses the shared global GTT.
 	 */
-	struct i915_address_space __rcu *vm;
+	struct i915_address_space *vm;
 
 	/**
 	 * @pid: process id of creator
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index 6c68fe26bb32..5d71626a1ee5 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1688,11 +1688,9 @@ int i915_gem_huge_page_live_selftests(struct drm_i915_private *i915)
 		goto out_file;
 	}
 
-	mutex_lock(&ctx->mutex);
-	vm = i915_gem_context_vm(ctx);
+	vm = ctx->vm;
 	if (vm)
 		WRITE_ONCE(vm->scrub_64K, true);
-	mutex_unlock(&ctx->mutex);
 
 	err = i915_subtests(tests, ctx);
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index 947154e445a7..ae2428220fed 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -27,12 +27,6 @@
 
 #define DW_PER_PAGE (PAGE_SIZE / sizeof(u32))
 
-static inline struct i915_address_space *ctx_vm(struct i915_gem_context *ctx)
-{
-	/* single threaded, private ctx */
-	return rcu_dereference_protected(ctx->vm, true);
-}
-
 static int live_nop_switch(void *arg)
 {
 	const unsigned int nctx = 1024;
@@ -813,7 +807,7 @@ static int igt_shared_ctx_exec(void *arg)
 			struct i915_gem_context *ctx;
 			struct intel_context *ce;
 
-			ctx = kernel_context(i915, ctx_vm(parent));
+			ctx = kernel_context(i915, parent->vm);
 			if (IS_ERR(ctx)) {
 				err = PTR_ERR(ctx);
 				goto out_test;
@@ -823,7 +817,7 @@ static int igt_shared_ctx_exec(void *arg)
 			GEM_BUG_ON(IS_ERR(ce));
 
 			if (!obj) {
-				obj = create_test_object(ctx_vm(parent),
+				obj = create_test_object(parent->vm,
 							 file, &objects);
 				if (IS_ERR(obj)) {
 					err = PTR_ERR(obj);
@@ -1380,7 +1374,7 @@ static int igt_ctx_readonly(void *arg)
 		goto out_file;
 	}
 
-	vm = ctx_vm(ctx) ?: &i915->ggtt.alias->vm;
+	vm = ctx->vm ?: &i915->ggtt.alias->vm;
 	if (!vm || !vm->has_read_only) {
 		err = 0;
 		goto out_file;
@@ -1499,7 +1493,7 @@ static int write_to_scratch(struct i915_gem_context *ctx,
 
 	GEM_BUG_ON(offset < I915_GTT_PAGE_SIZE);
 
-	err = check_scratch(ctx_vm(ctx), offset);
+	err = check_scratch(ctx->vm, offset);
 	if (err)
 		return err;
 
@@ -1596,7 +1590,7 @@ static int read_from_scratch(struct i915_gem_context *ctx,
 
 	GEM_BUG_ON(offset < I915_GTT_PAGE_SIZE);
 
-	err = check_scratch(ctx_vm(ctx), offset);
+	err = check_scratch(ctx->vm, offset);
 	if (err)
 		return err;
 
@@ -1739,7 +1733,7 @@ static int check_scratch_page(struct i915_gem_context *ctx, u32 *out)
 	u32 *vaddr;
 	int err = 0;
 
-	vm = ctx_vm(ctx);
+	vm = ctx->vm;
 	if (!vm)
 		return -ENODEV;
 
@@ -1801,7 +1795,7 @@ static int igt_vm_isolation(void *arg)
 	}
 
 	/* We can only test vm isolation, if the vm are distinct */
-	if (ctx_vm(ctx_a) == ctx_vm(ctx_b))
+	if (ctx_a->vm == ctx_b->vm)
 		goto out_file;
 
 	/* Read the initial state of the scratch page */
@@ -1813,8 +1807,8 @@ static int igt_vm_isolation(void *arg)
 	if (err)
 		goto out_file;
 
-	vm_total = ctx_vm(ctx_a)->total;
-	GEM_BUG_ON(ctx_vm(ctx_b)->total != vm_total);
+	vm_total = ctx_a->vm->total;
+	GEM_BUG_ON(ctx_b->vm->total != vm_total);
 
 	count = 0;
 	num_engines = 0;
diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index 806ad688274b..237e5061381b 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -1246,7 +1246,7 @@ DECLARE_EVENT_CLASS(i915_context,
 	TP_fast_assign(
 			__entry->dev = ctx->i915->drm.primary->index;
 			__entry->ctx = ctx;
-			__entry->vm = rcu_access_pointer(ctx->vm);
+			__entry->vm = ctx->vm;
 	),
 
 	TP_printk("dev=%u, ctx=%p, ctx_vm=%p",
diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index 79ba72da0813..1f10fe36619b 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -39,7 +39,7 @@ static bool assert_vma(struct i915_vma *vma,
 {
 	bool ok = true;
 
-	if (vma->vm != rcu_access_pointer(ctx->vm)) {
+	if (vma->vm != ctx->vm) {
 		pr_err("VMA created with wrong VM\n");
 		ok = false;
 	}
-- 
2.33.0

