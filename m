Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E2A3933C3
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 18:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEBF6F43E;
	Thu, 27 May 2021 16:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45256F440
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:27:04 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso772088pji.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XBrt9WX4cxUST+N0ikTdl5oMoDBheVxaOObzJ0nMFwU=;
 b=PG4qRKG4jn1PyCTBP90UowR8/rbLtGf6NhXKXM1kg/YqXj0lm3O5Ifkzsg6+XexucB
 lY5Umxyodt41ABLwo0zO0xlAr8bNFfkoK2iFNzV1MI6nCAlz9QPhiXz18QbgfH9MiOEJ
 UaBSr6Dn3jLMmdoLUVYIdnIxqaAwz/Q6hOB1g85ijgQlpYeXRbFzexIYS2WkJN5rrEJ7
 wRgUj3dnJAht1MgSlpsucCHdn8AbuIGXjfAuqKXUqF6XM8upu6LLgY3a/GBmCv0qzYpc
 sNgD2TjAQq7xB/wNgkctYGcYt/YAT4xJI0v6qWqEsGvz+OnLH0FNJ0B6uhU+vO2RD9xr
 pzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XBrt9WX4cxUST+N0ikTdl5oMoDBheVxaOObzJ0nMFwU=;
 b=ayIOsX1V8ml46BmopCoNUHkjYt0SwX/gxXXNhzXWKilR3QX5mYTDDle8gzDKwRmC/F
 t2xQg37yHU84dMVGTU7EZkwUCrkuQ0ggXFYpLrbEyJm08hGk0oyWzu9TLP3AAIRutR2p
 EpU4XEJ7UpZwzdAoEzQEr+WR0IGPeixSl4YXppBryR3+ksAemGP0FZIzwUUkVxCLMa4d
 Lflv5ckYe4TKLWQg8AW7X6JzrX9rVrF5cVyECt9zZWTSaGG1cvvOPgVToem1vCFwozc7
 0fhTCadymD672AFy9TPs/o24mc/bTkUskViIwXC58SOkIDWLFqBkSAiPY48gcfI34SXy
 Su5w==
X-Gm-Message-State: AOAM530WyqJR6WIB9Z2LE740l5sn1W+dlWbOHvmIDZ/Znl7OklXkT8rp
 rJhUAPuXPZZY6yGV+AfAQK8n2A==
X-Google-Smtp-Source: ABdhPJxmL2PIPd4GyShBy/02ZI27417Ru1+UFq6KT2XxfxhKSX2n8Hlbotfbi8FwC7bfu4+dwDH8AQ==
X-Received: by 2002:a17:902:b7c3:b029:ef:8d29:a7d1 with SMTP id
 v3-20020a170902b7c3b02900ef8d29a7d1mr3983764plz.55.1622132824204; 
 Thu, 27 May 2021 09:27:04 -0700 (PDT)
Received: from omlet.com ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id h9sm2298711pja.42.2021.05.27.09.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:27:03 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/29] drm/i915: Drop the CONTEXT_CLONE API (v2)
Date: Thu, 27 May 2021 11:26:27 -0500
Message-Id: <20210527162650.1182544-7-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527162650.1182544-1-jason@jlekstrand.net>
References: <20210527162650.1182544-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
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

v2 (Jason Ekstrand):
 - More detailed commit message

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 199 +-----------------
 .../drm/i915/gt/intel_execlists_submission.c  |  28 ---
 .../drm/i915/gt/intel_execlists_submission.h  |   3 -
 include/uapi/drm/i915_drm.h                   |  16 +-
 4 files changed, 6 insertions(+), 240 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 6f1e5c2c5b113..97613e529aab3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1957,207 +1957,14 @@ static int create_setparam(struct i915_user_extension __user *ext, void *data)
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
index e527f5f7e0dea..62c988a022f7c 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1889,20 +1889,10 @@ struct drm_i915_gem_context_create_ext_setparam {
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

