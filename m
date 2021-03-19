Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 500AF3428C6
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 23:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C5E6EB08;
	Fri, 19 Mar 2021 22:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383C16EAF0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 22:39:07 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id f8so1214476pgi.9
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 15:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yuRSz7nUQs9DARgke3P18BLDvHt0isTU8dIFypNuZMo=;
 b=VBJCit1RRzGhr4k1KFO5TlC6qrx8450DOV6MAcwftUkLNGss9Tgn+3FSNp6GL1AJuE
 1hIKii74SrarjHKUKQ+eE6BkCSzZNteE4gWeYo2t0nUrIjN6Qckj5CWauOw7hFD0C7Km
 D7AV+tNimCf4n/xD5zSsPqdi/Vpw+glfICr1S3HPuUU/CpTfjL/ArtOAFgb7z4zaVFSr
 hhCqUUYDQQNYNyPtAF3L+g4uG11uPKp496IYQWn8AB6x7fj+b3NJ98nVps03oPP/HFNQ
 QdfPzCJ7y3QhQC8DHcOANZGyXEsVd/hLQ7nlTilR3kihGcHQOov4qSedzh+uI5GY29Wm
 eYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yuRSz7nUQs9DARgke3P18BLDvHt0isTU8dIFypNuZMo=;
 b=XN+QuD80p1PiNrixbm0caGp99lIdILXjX+cj6uPeQ7KfeAMTs4ad82Iy2DBBA5E/w3
 v9cBpCXKpZvAhRKi37xt+8DSk9LlnQXMx2k08C/kBDj1uAx5l+m1c6DnudV10FLfysDY
 IJTJxktScinfc9xC3VAt9X/dTR+k3DXmsFGGXtX0WcbG7s3mI9gtaLmufP092x2OhLKx
 YkQw7ACG+5hjyuZ6/5vSnXImyXbOn/bzADWxZMA7vNtZpaPbpFe97pK1fHCNDA2ZXMmq
 +x7xhblvs05FTMUT7TiRrsaoU3/yRIqRjTzsrH3rv50WzvlLQ4SG3CwK8EYzZ2ChfnMU
 91Ow==
X-Gm-Message-State: AOAM5315/0K4i8okMahMeiI9aL2g2CoO7T4I99HOx6C+0Q4L/LbDJK+3
 J5cEtt0X4gAtHoE0W8vpLjI7+Z45TM5d0w==
X-Google-Smtp-Source: ABdhPJyby4agy/Zb1QzcqCOpbSV2JyIVV13rlaCKZF0s3xaKquslCSRfHEkx2VDn3IO89bTyyAU0wQ==
X-Received: by 2002:a63:4c4e:: with SMTP id m14mr13604114pgl.35.1616193546299; 
 Fri, 19 Mar 2021 15:39:06 -0700 (PDT)
Received: from omlet.com ([134.134.137.77])
 by smtp.gmail.com with ESMTPSA id a20sm6809206pfl.97.2021.03.19.15.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 15:39:05 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915: Drop the CONTEXT_CLONE API
Date: Fri, 19 Mar 2021 17:38:55 -0500
Message-Id: <20210319223856.2983244-4-jason@jlekstrand.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319223856.2983244-1-jason@jlekstrand.net>
References: <20210319223856.2983244-1-jason@jlekstrand.net>
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
index d28ac79de7573..f88bac19333ec 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1983,207 +1983,14 @@ static int create_setparam(struct i915_user_extension __user *ext, void *data)
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
index 4c4b9254def1b..33ef78cb1deb7 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1841,20 +1841,10 @@ struct drm_i915_gem_context_create_ext_setparam {
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
