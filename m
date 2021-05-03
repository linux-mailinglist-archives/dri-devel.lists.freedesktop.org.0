Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF2E37189F
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 17:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1344189247;
	Mon,  3 May 2021 15:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8678E6E8EC
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 15:58:06 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so3613699pjb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 08:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Ky3Oj82R/mSrg/8I8KOx/0LweaPEhRXbTrk9CzwKRg=;
 b=Y9mwHGhRa1p7vbkcaKYMO1M0n+MmczbzOoU32F1dGRK0lf6CR3tR5A+DB1Kk/M5Rbu
 sYKYgYtNKzRWdSKYuf8zeYgGjSQOeWGw45gBlXrhU2FZ1j+wusuzt7KSpN8VlBnUAdZO
 Yna3/o1mjBsa6MN5kPa2u6jv9uq6X/ZhlAJukN47Kj9FeM/WsFcJHCoRgFAv2XCiH7+o
 YyZjJu36CJfZlsbyQqzjMOHlN47CylK2ifaldkp/auRhE2qk6R1dm3v4riwPa17ARV1G
 Er50EfhE0Ro1cX+Tnj2HG+mf2yhIY+Cq4bYXfN4tBIbbAFhpwqY3vt6s8N6YnQRPFikR
 Kxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Ky3Oj82R/mSrg/8I8KOx/0LweaPEhRXbTrk9CzwKRg=;
 b=Ut5JpDF7Mdz/o1v/FlJV2mVqgAtsOo2vlLzse01daubG2fBt6XWSHE8cC1GjDGD04w
 DYd/vm67V0gFgnMdSufJHRHT1qLA7IoB6MOvZEF9ZrC8jOED7axXBKjBhXuOYW3gyskL
 6dQz863LGTo3sS8bAETxYZMYAo+n3NepJjUiV9J6Gic2zxF7CNzZxtlZjk1Q0GiGiBUL
 1oW1+NeNMJQdcqta1AEI3TIJFewVi8lMYtqoWXjPGH2xMJMA9oBcDIacP8RpRO8UIs4O
 99+HdZTUE8fCmSviG1aTmmTV5UzihSGYMj65ETTZFySO4/pyAwSAXIBo2DKcydKw3P9F
 DpXA==
X-Gm-Message-State: AOAM530FDMMID+3VKGtCKeZzLFv+Xi4ovLIZ5S7zTLYANsKzLXz9Anjy
 tMD6kIEp1SWTMSI9g1q1aQwSA+FNGkmwFw==
X-Google-Smtp-Source: ABdhPJxiBK9Cq2HnVR8WSJgERPZBDWvb7ATcf8PFYgUETnvLBa96tmgZY06kE5USIvsk731cg4Kvkg==
X-Received: by 2002:a17:902:d4c2:b029:ed:4a62:abda with SMTP id
 o2-20020a170902d4c2b02900ed4a62abdamr20644349plg.5.1620057485603; 
 Mon, 03 May 2021 08:58:05 -0700 (PDT)
Received: from omlet.com (jfdmzpr05-ext.jf.intel.com. [134.134.139.74])
 by smtp.gmail.com with ESMTPSA id gf21sm9783296pjb.20.2021.05.03.08.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 08:58:05 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/27] drm/i915: Drop the CONTEXT_CLONE API
Date: Mon,  3 May 2021 10:57:27 -0500
Message-Id: <20210503155748.1961781-7-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503155748.1961781-1-jason@jlekstrand.net>
References: <20210503155748.1961781-1-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This API allows one context to grab bits out of another context upon
creation.  It can be used as a short-cut for setparam(getparam()) for
things like I915_CONTEXT_PARAM_VM.  However, it's never been used by any
real userspace.  It's used by a few IGT tests and that's it.  Since it
doesn't add any real value (most of the stuff you can CLONE you can copy
in other ways), drop it.

There is one thing that this API allows you to clone which you cannot
clone via getparam/setparam: timelines.  However, timelines are an
implementation detail of i915 and not really something that needs to be
exposed to userspace.  Also, sharing timelines between contexts isn't
obviously useful and supporting it has the potential to complicate i915
internally.  It also doesn't add any functionality that the client can't
get in other ways.  If a client really wants a shared timeline, they can
use a syncobj and set it as an in and out fence on every submit.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 199 +-----------------
 .../drm/i915/gt/intel_execlists_submission.c  |  28 ---
 .../drm/i915/gt/intel_execlists_submission.h  |   3 -
 include/uapi/drm/i915_drm.h                   |  16 +-
 4 files changed, 6 insertions(+), 240 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index d6f342e605254..308a63f778faf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1958,207 +1958,14 @@ static int create_setparam(struct i915_user_extension __user *ext, void *data)
 	return ctx_setparam(arg->fpriv, arg->ctx, &local.param);
 }
 
-static int clone_engines(struct i915_gem_context *dst,
-			 struct i915_gem_context *src)
+static int invalid_ext(struct i915_user_extension __user *ext, void *data)
 {
-	struct i915_gem_engines *clone, *e;
-	bool user_engines;
-	unsigned long n;
-
-	e = __context_engines_await(src, &user_engines);
-	if (!e)
-		return -ENOENT;
-
-	clone = alloc_engines(e->num_engines);
-	if (!clone)
-		goto err_unlock;
-
-	for (n = 0; n < e->num_engines; n++) {
-		struct intel_engine_cs *engine;
-
-		if (!e->engines[n]) {
-			clone->engines[n] = NULL;
-			continue;
-		}
-		engine = e->engines[n]->engine;
-
-		/*
-		 * Virtual engines are singletons; they can only exist
-		 * inside a single context, because they embed their
-		 * HW context... As each virtual context implies a single
-		 * timeline (each engine can only dequeue a single request
-		 * at any time), it would be surprising for two contexts
-		 * to use the same engine. So let's create a copy of
-		 * the virtual engine instead.
-		 */
-		if (intel_engine_is_virtual(engine))
-			clone->engines[n] =
-				intel_execlists_clone_virtual(engine);
-		else
-			clone->engines[n] = intel_context_create(engine);
-		if (IS_ERR_OR_NULL(clone->engines[n])) {
-			__free_engines(clone, n);
-			goto err_unlock;
-		}
-
-		intel_context_set_gem(clone->engines[n], dst);
-	}
-	clone->num_engines = n;
-	i915_sw_fence_complete(&e->fence);
-
-	/* Serialised by constructor */
-	engines_idle_release(dst, rcu_replace_pointer(dst->engines, clone, 1));
-	if (user_engines)
-		i915_gem_context_set_user_engines(dst);
-	else
-		i915_gem_context_clear_user_engines(dst);
-	return 0;
-
-err_unlock:
-	i915_sw_fence_complete(&e->fence);
-	return -ENOMEM;
-}
-
-static int clone_flags(struct i915_gem_context *dst,
-		       struct i915_gem_context *src)
-{
-	dst->user_flags = src->user_flags;
-	return 0;
-}
-
-static int clone_schedattr(struct i915_gem_context *dst,
-			   struct i915_gem_context *src)
-{
-	dst->sched = src->sched;
-	return 0;
-}
-
-static int clone_sseu(struct i915_gem_context *dst,
-		      struct i915_gem_context *src)
-{
-	struct i915_gem_engines *e = i915_gem_context_lock_engines(src);
-	struct i915_gem_engines *clone;
-	unsigned long n;
-	int err;
-
-	/* no locking required; sole access under constructor*/
-	clone = __context_engines_static(dst);
-	if (e->num_engines != clone->num_engines) {
-		err = -EINVAL;
-		goto unlock;
-	}
-
-	for (n = 0; n < e->num_engines; n++) {
-		struct intel_context *ce = e->engines[n];
-
-		if (clone->engines[n]->engine->class != ce->engine->class) {
-			/* Must have compatible engine maps! */
-			err = -EINVAL;
-			goto unlock;
-		}
-
-		/* serialises with set_sseu */
-		err = intel_context_lock_pinned(ce);
-		if (err)
-			goto unlock;
-
-		clone->engines[n]->sseu = ce->sseu;
-		intel_context_unlock_pinned(ce);
-	}
-
-	err = 0;
-unlock:
-	i915_gem_context_unlock_engines(src);
-	return err;
-}
-
-static int clone_timeline(struct i915_gem_context *dst,
-			  struct i915_gem_context *src)
-{
-	if (src->timeline)
-		__assign_timeline(dst, src->timeline);
-
-	return 0;
-}
-
-static int clone_vm(struct i915_gem_context *dst,
-		    struct i915_gem_context *src)
-{
-	struct i915_address_space *vm;
-	int err = 0;
-
-	if (!rcu_access_pointer(src->vm))
-		return 0;
-
-	rcu_read_lock();
-	vm = context_get_vm_rcu(src);
-	rcu_read_unlock();
-
-	if (!mutex_lock_interruptible(&dst->mutex)) {
-		__assign_ppgtt(dst, vm);
-		mutex_unlock(&dst->mutex);
-	} else {
-		err = -EINTR;
-	}
-
-	i915_vm_put(vm);
-	return err;
-}
-
-static int create_clone(struct i915_user_extension __user *ext, void *data)
-{
-	static int (* const fn[])(struct i915_gem_context *dst,
-				  struct i915_gem_context *src) = {
-#define MAP(x, y) [ilog2(I915_CONTEXT_CLONE_##x)] = y
-		MAP(ENGINES, clone_engines),
-		MAP(FLAGS, clone_flags),
-		MAP(SCHEDATTR, clone_schedattr),
-		MAP(SSEU, clone_sseu),
-		MAP(TIMELINE, clone_timeline),
-		MAP(VM, clone_vm),
-#undef MAP
-	};
-	struct drm_i915_gem_context_create_ext_clone local;
-	const struct create_ext *arg = data;
-	struct i915_gem_context *dst = arg->ctx;
-	struct i915_gem_context *src;
-	int err, bit;
-
-	if (copy_from_user(&local, ext, sizeof(local)))
-		return -EFAULT;
-
-	BUILD_BUG_ON(GENMASK(BITS_PER_TYPE(local.flags) - 1, ARRAY_SIZE(fn)) !=
-		     I915_CONTEXT_CLONE_UNKNOWN);
-
-	if (local.flags & I915_CONTEXT_CLONE_UNKNOWN)
-		return -EINVAL;
-
-	if (local.rsvd)
-		return -EINVAL;
-
-	rcu_read_lock();
-	src = __i915_gem_context_lookup_rcu(arg->fpriv, local.clone_id);
-	rcu_read_unlock();
-	if (!src)
-		return -ENOENT;
-
-	GEM_BUG_ON(src == dst);
-
-	for (bit = 0; bit < ARRAY_SIZE(fn); bit++) {
-		if (!(local.flags & BIT(bit)))
-			continue;
-
-		err = fn[bit](dst, src);
-		if (err)
-			return err;
-	}
-
-	return 0;
+	return -EINVAL;
 }
 
 static const i915_user_extension_fn create_extensions[] = {
 	[I915_CONTEXT_CREATE_EXT_SETPARAM] = create_setparam,
-	[I915_CONTEXT_CREATE_EXT_CLONE] = create_clone,
+	[I915_CONTEXT_CREATE_EXT_CLONE] = invalid_ext,
 };
 
 static bool client_is_banned(struct drm_i915_file_private *file_priv)
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index de124870af44d..0e8c320927d15 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3736,34 +3736,6 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
 	return ERR_PTR(err);
 }
 
-struct intel_context *
-intel_execlists_clone_virtual(struct intel_engine_cs *src)
-{
-	struct virtual_engine *se = to_virtual_engine(src);
-	struct intel_context *dst;
-
-	dst = intel_execlists_create_virtual(se->siblings,
-					     se->num_siblings);
-	if (IS_ERR(dst))
-		return dst;
-
-	if (se->num_bonds) {
-		struct virtual_engine *de = to_virtual_engine(dst->engine);
-
-		de->bonds = kmemdup(se->bonds,
-				    sizeof(*se->bonds) * se->num_bonds,
-				    GFP_KERNEL);
-		if (!de->bonds) {
-			intel_context_put(dst);
-			return ERR_PTR(-ENOMEM);
-		}
-
-		de->num_bonds = se->num_bonds;
-	}
-
-	return dst;
-}
-
 int intel_virtual_engine_attach_bond(struct intel_engine_cs *engine,
 				     const struct intel_engine_cs *master,
 				     const struct intel_engine_cs *sibling)
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
index fd61dae820e9e..bab3d37cf3f98 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
@@ -36,9 +36,6 @@ struct intel_context *
 intel_execlists_create_virtual(struct intel_engine_cs **siblings,
 			       unsigned int count);
 
-struct intel_context *
-intel_execlists_clone_virtual(struct intel_engine_cs *src);
-
 int intel_virtual_engine_attach_bond(struct intel_engine_cs *engine,
 				     const struct intel_engine_cs *master,
 				     const struct intel_engine_cs *sibling);
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index a0aaa8298f28d..75a71b6756ed8 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1887,20 +1887,10 @@ struct drm_i915_gem_context_create_ext_setparam {
 	struct drm_i915_gem_context_param param;
 };
 
-struct drm_i915_gem_context_create_ext_clone {
+/* This API has been removed.  On the off chance someone somewhere has
+ * attempted to use it, never re-use this extension number.
+ */
 #define I915_CONTEXT_CREATE_EXT_CLONE 1
-	struct i915_user_extension base;
-	__u32 clone_id;
-	__u32 flags;
-#define I915_CONTEXT_CLONE_ENGINES	(1u << 0)
-#define I915_CONTEXT_CLONE_FLAGS	(1u << 1)
-#define I915_CONTEXT_CLONE_SCHEDATTR	(1u << 2)
-#define I915_CONTEXT_CLONE_SSEU		(1u << 3)
-#define I915_CONTEXT_CLONE_TIMELINE	(1u << 4)
-#define I915_CONTEXT_CLONE_VM		(1u << 5)
-#define I915_CONTEXT_CLONE_UNKNOWN -(I915_CONTEXT_CLONE_VM << 1)
-	__u64 rsvd;
-};
 
 struct drm_i915_gem_context_destroy {
 	__u32 ctx_id;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
