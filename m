Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6515369CA5
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 00:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA12A6ECB1;
	Fri, 23 Apr 2021 22:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0B86ECAE
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 22:31:45 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso2058086pjn.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 15:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UrRm9spOzXE6ZClL6gzVWoFIkgKDchq90IbhdcwDmnw=;
 b=bXMqWOILqd3JDAS/VorDiiseg/I3GqDVhSF9+RvFWZmWk3cDxW3m1+KYeN6+BbPhDa
 2phOtpACrYQAbB+f6p2oh17sNaywLeUoAvuKMn64071aGWYdCuTqQK/IGOt2c85IaA94
 zsgNb88bK6sW2XkngMJijI0JoEY/aWPZAco1E9a8My2jClOr3XH80vJo23cIyzRN943r
 I7FHB+lN51YfGwI4eQ+VNQvTW7e6u0ZfjXEhcUd3ULcja8pBHZFQkIk+Oh93f8QxtcX5
 bpgPZFps+t8ROJ7/hRs2M7J2XQRTByUDwcrkGtBrVlL26iUW9UcKEG8MzjyuELIXehcd
 d8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UrRm9spOzXE6ZClL6gzVWoFIkgKDchq90IbhdcwDmnw=;
 b=pM87jzKrC3fHwcVqrhkgS2LW837L0ISqNunlwIvWZ2CIUJNi6r5iUG4bOwNcplf4m7
 JE86fJe9d/QszyZzlVOeocGkwRzARjPp/ClDPjIw5C7geZQWva7G80F3yBLQLUuljGKs
 i2reRms2cB86Mn+yJajLM0aEM1TXT0BLRf4UljTqeL35N/uDQhGV+R3/U6ZpTGsctJbu
 p5iLutXazAlOs17DcE2R2C8IYWpOk2zAp2EFnirKUUsoDTTISX6UadwaygFfNYdiIQla
 /Qpb0+AFwQ2EjWFJeBGeLWCBscPsM8bddaCRQpCo5wGgNpMVVK3uFNUyP3Dwmsloex2s
 yrCA==
X-Gm-Message-State: AOAM531RIdExkPFPMPBSJTC3znwQaKCTrJ5amfFEUTuaHXuTt4hcYfKf
 03lwClMQJK5yJ+LOIannb2xW3Q==
X-Google-Smtp-Source: ABdhPJz8NYTep7e4cJTEmnWRiuAYURxKrepNiKUBxqyNyL5qSLPfCU923O8Wv379wjIzLN12pYhcJw==
X-Received: by 2002:a17:90a:d082:: with SMTP id
 k2mr8052318pju.28.1619217104566; 
 Fri, 23 Apr 2021 15:31:44 -0700 (PDT)
Received: from omlet.com ([134.134.139.76])
 by smtp.gmail.com with ESMTPSA id z12sm5523420pfn.195.2021.04.23.15.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 15:31:43 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/21] drm/i915: Drop the CONTEXT_CLONE API
Date: Fri, 23 Apr 2021 17:31:15 -0500
Message-Id: <20210423223131.879208-6-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423223131.879208-1-jason@jlekstrand.net>
References: <20210423223131.879208-1-jason@jlekstrand.net>
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
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 199 +-------------------
 include/uapi/drm/i915_drm.h                 |  16 +-
 2 files changed, 6 insertions(+), 209 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 8a77855123cec..2c2fefa912805 100644
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
