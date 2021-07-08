Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A643C1672
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 17:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9262A6E912;
	Thu,  8 Jul 2021 15:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AD26E90B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 15:48:58 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 7-20020a9d0d070000b0290439abcef697so6280060oti.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 08:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1dMUq++8ilJXyu/9bC6ZFvL+WV9zUdiLAdKlunxkZr0=;
 b=PXjr3/BHw3RK23qXjz0po9vun6CoMPDooOx2FD9x5KXbqzJ2vb3MHyaIrmIPdaH+G4
 MhIBvdAjZwasYFobEDLHUtnkcxD/hBba2IUNaVWKb8mofzml5RFD49Np7OkNlBno/bI6
 lDb5DMcBUlAHmE4hgmzPNUm8Z8QhzsLIMEc3vxF3TXV0cckMcSlzVwZsXbT39wAF2yzY
 hRkZ9WAJkh/wAfNNw2+q6BtikdvoybCR3oGhc747SwTMqlGF72RSVOWVLc1G8Op9anjX
 HdNJqRZG9J4w1ybzc68pei8JdNxYDe7rJ3U2yJMiLAOyC94lCPgGn0sTDOfSzSYJfVbZ
 Q0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1dMUq++8ilJXyu/9bC6ZFvL+WV9zUdiLAdKlunxkZr0=;
 b=HivRXMFk+u17DdqRrnzvCN2kD3Fq4A0jXS3bWps99vHXvAVkZyK2aA7/sRc2tVVTiB
 n8TxpTEbYntUwd36SH1omXIyS8NiXP4EybjzJYWUemmBoJPARhf7sB0Fp7FxPjFeuQkG
 i1PU+8LzaIpEwOC89klgVZe0HrJJlqd52WKRrXj7k6jU9N9Awz5u/S85JhmRI9hqMlvQ
 HtTquceRj87tSQ2y8dytlQmdPap0lUMGOkeSsFT1vf3lcq/E1pUpoy1Lj8HvQGdddAOU
 J7G1KsnJ6fiUzr7OKuXGpDzP5HUc0/xl6gr2IRIHkwPqCP8B4jEkFX6FAF0hc/zj52fz
 7mpQ==
X-Gm-Message-State: AOAM533tWjZ3c/rQF8HPsuFvMt36ZUUMCMGQdRX9Y/8W5QCo5qWK8Hpm
 hlrsUy8CUcRLnTbF/VGHYFHHig==
X-Google-Smtp-Source: ABdhPJzKElCPmNrRsJXRKQA7K3H/w39rlT3o/FVJyMxZT0z7GPsakz52x4nMMN9s7qf0osOdMRKT7Q==
X-Received: by 2002:a05:6830:1bd8:: with SMTP id
 v24mr24191126ota.343.1625759337723; 
 Thu, 08 Jul 2021 08:48:57 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id d20sm548356otq.62.2021.07.08.08.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:48:57 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 16/30] drm/i915/gem: Add an intermediate proto_context struct
 (v5)
Date: Thu,  8 Jul 2021 10:48:21 -0500
Message-Id: <20210708154835.528166-17-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708154835.528166-1-jason@jlekstrand.net>
References: <20210708154835.528166-1-jason@jlekstrand.net>
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

The current context uAPI allows for two methods of setting context
parameters: SET_CONTEXT_PARAM and CONTEXT_CREATE_EXT_SETPARAM.  The
former is allowed to be called at any time while the later happens as
part of GEM_CONTEXT_CREATE.  Currently, everything settable via one is
settable via the other.  While some params are fairly simple and setting
them on a live context is harmless such the context priority, others are
far trickier such as the VM or the set of engines.  In order to swap out
the VM, for instance, we have to delay until all current in-flight work
is complete, swap in the new VM, and then continue.  This leads to a
plethora of potential race conditions we'd really rather avoid.

Unfortunately, both methods of setting the VM and the engine set are in
active use today so we can't simply disallow setting the VM or engine
set vial SET_CONTEXT_PARAM.  In order to work around this wart, this
commit adds a proto-context struct which contains all the context create
parameters.

v2 (Daniel Vetter):
 - Better commit message
 - Use __set/clear_bit instead of set/clear_bit because there's no race
   and we don't need the atomics

v3 (Daniel Vetter):
 - Use manual bitops and BIT() instead of __set_bit

v4 (Daniel Vetter):
 - Add a changelog to the commit message
 - Better hyperlinking in docs
 - Create the default PPGTT in i915_gem_create_context

v5 (Daniel Vetter):
 - Hand-roll the initialization of UCONTEXT_PERSISTENCE

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 84 +++++++++++++++----
 .../gpu/drm/i915/gem/i915_gem_context_types.h | 22 +++++
 .../gpu/drm/i915/gem/selftests/mock_context.c | 16 +++-
 3 files changed, 105 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index f9a6eac78c0ae..741624da8db78 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -191,6 +191,43 @@ static int validate_priority(struct drm_i915_private *i915,
 	return 0;
 }
 
+static void proto_context_close(struct i915_gem_proto_context *pc)
+{
+	if (pc->vm)
+		i915_vm_put(pc->vm);
+	kfree(pc);
+}
+
+static struct i915_gem_proto_context *
+proto_context_create(struct drm_i915_private *i915, unsigned int flags)
+{
+	struct i915_gem_proto_context *pc, *err;
+
+	pc = kzalloc(sizeof(*pc), GFP_KERNEL);
+	if (!pc)
+		return ERR_PTR(-ENOMEM);
+
+	pc->user_flags = BIT(UCONTEXT_BANNABLE) |
+			 BIT(UCONTEXT_RECOVERABLE);
+	if (i915->params.enable_hangcheck)
+		pc->user_flags |= BIT(UCONTEXT_PERSISTENCE);
+	pc->sched.priority = I915_PRIORITY_NORMAL;
+
+	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
+		if (!HAS_EXECLISTS(i915)) {
+			err = ERR_PTR(-EINVAL);
+			goto proto_close;
+		}
+		pc->single_timeline = true;
+	}
+
+	return pc;
+
+proto_close:
+	proto_context_close(pc);
+	return err;
+}
+
 static struct i915_address_space *
 context_get_vm_rcu(struct i915_gem_context *ctx)
 {
@@ -660,7 +697,8 @@ static int __context_set_persistence(struct i915_gem_context *ctx, bool state)
 }
 
 static struct i915_gem_context *
-__create_context(struct drm_i915_private *i915)
+__create_context(struct drm_i915_private *i915,
+		 const struct i915_gem_proto_context *pc)
 {
 	struct i915_gem_context *ctx;
 	struct i915_gem_engines *e;
@@ -673,7 +711,7 @@ __create_context(struct drm_i915_private *i915)
 
 	kref_init(&ctx->ref);
 	ctx->i915 = i915;
-	ctx->sched.priority = I915_PRIORITY_NORMAL;
+	ctx->sched = pc->sched;
 	mutex_init(&ctx->mutex);
 	INIT_LIST_HEAD(&ctx->link);
 
@@ -696,9 +734,7 @@ __create_context(struct drm_i915_private *i915)
 	 * is no remap info, it will be a NOP. */
 	ctx->remap_slice = ALL_L3_SLICES(i915);
 
-	i915_gem_context_set_bannable(ctx);
-	i915_gem_context_set_recoverable(ctx);
-	__context_set_persistence(ctx, true /* cgroup hook? */);
+	ctx->user_flags = pc->user_flags;
 
 	for (i = 0; i < ARRAY_SIZE(ctx->hang_timestamp); i++)
 		ctx->hang_timestamp[i] = jiffies - CONTEXT_FAST_HANG_JIFFIES;
@@ -786,20 +822,22 @@ static void __assign_ppgtt(struct i915_gem_context *ctx,
 }
 
 static struct i915_gem_context *
-i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
+i915_gem_create_context(struct drm_i915_private *i915,
+			const struct i915_gem_proto_context *pc)
 {
 	struct i915_gem_context *ctx;
 	int ret;
 
-	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE &&
-	    !HAS_EXECLISTS(i915))
-		return ERR_PTR(-EINVAL);
-
-	ctx = __create_context(i915);
+	ctx = __create_context(i915, pc);
 	if (IS_ERR(ctx))
 		return ctx;
 
-	if (HAS_FULL_PPGTT(i915)) {
+	if (pc->vm) {
+		/* __assign_ppgtt() requires this mutex to be held */
+		mutex_lock(&ctx->mutex);
+		__assign_ppgtt(ctx, pc->vm);
+		mutex_unlock(&ctx->mutex);
+	} else if (HAS_FULL_PPGTT(i915)) {
 		struct i915_ppgtt *ppgtt;
 
 		ppgtt = i915_ppgtt_create(&i915->gt);
@@ -810,14 +848,16 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
 			return ERR_CAST(ppgtt);
 		}
 
+		/* __assign_ppgtt() requires this mutex to be held */
 		mutex_lock(&ctx->mutex);
 		__assign_ppgtt(ctx, &ppgtt->vm);
 		mutex_unlock(&ctx->mutex);
 
+		/* __assign_ppgtt() takes another reference for us */
 		i915_vm_put(&ppgtt->vm);
 	}
 
-	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
+	if (pc->single_timeline) {
 		ret = drm_syncobj_create(&ctx->syncobj,
 					 DRM_SYNCOBJ_CREATE_SIGNALED,
 					 NULL);
@@ -883,6 +923,7 @@ int i915_gem_context_open(struct drm_i915_private *i915,
 			  struct drm_file *file)
 {
 	struct drm_i915_file_private *file_priv = file->driver_priv;
+	struct i915_gem_proto_context *pc;
 	struct i915_gem_context *ctx;
 	int err;
 	u32 id;
@@ -892,7 +933,14 @@ int i915_gem_context_open(struct drm_i915_private *i915,
 	/* 0 reserved for invalid/unassigned ppgtt */
 	xa_init_flags(&file_priv->vm_xa, XA_FLAGS_ALLOC1);
 
-	ctx = i915_gem_create_context(i915, 0);
+	pc = proto_context_create(i915, 0);
+	if (IS_ERR(pc)) {
+		err = PTR_ERR(pc);
+		goto err;
+	}
+
+	ctx = i915_gem_create_context(i915, pc);
+	proto_context_close(pc);
 	if (IS_ERR(ctx)) {
 		err = PTR_ERR(ctx);
 		goto err;
@@ -1884,6 +1932,7 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_context_create_ext *args = data;
+	struct i915_gem_proto_context *pc;
 	struct create_ext ext_data;
 	int ret;
 	u32 id;
@@ -1906,7 +1955,12 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 		return -EIO;
 	}
 
-	ext_data.ctx = i915_gem_create_context(i915, args->flags);
+	pc = proto_context_create(i915, args->flags);
+	if (IS_ERR(pc))
+		return PTR_ERR(pc);
+
+	ext_data.ctx = i915_gem_create_context(i915, pc);
+	proto_context_close(pc);
 	if (IS_ERR(ext_data.ctx))
 		return PTR_ERR(ext_data.ctx);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 5f0673a2129f9..e0bdf3e298a6a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -66,6 +66,28 @@ struct i915_gem_engines_iter {
 	const struct i915_gem_engines *engines;
 };
 
+/**
+ * struct i915_gem_proto_context - prototype context
+ *
+ * The struct i915_gem_proto_context represents the creation parameters for
+ * a struct i915_gem_context.  This is used to gather parameters provided
+ * either through creation flags or via SET_CONTEXT_PARAM so that, when we
+ * create the final i915_gem_context, those parameters can be immutable.
+ */
+struct i915_gem_proto_context {
+	/** @vm: See &i915_gem_context.vm */
+	struct i915_address_space *vm;
+
+	/** @user_flags: See &i915_gem_context.user_flags */
+	unsigned long user_flags;
+
+	/** @sched: See &i915_gem_context.sched */
+	struct i915_sched_attr sched;
+
+	/** @single_timeline: See See &i915_gem_context.syncobj */
+	bool single_timeline;
+};
+
 /**
  * struct i915_gem_context - client state
  *
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
index 51b5a3421b400..e0f512ef7f3c6 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
@@ -80,11 +80,17 @@ void mock_init_contexts(struct drm_i915_private *i915)
 struct i915_gem_context *
 live_context(struct drm_i915_private *i915, struct file *file)
 {
+	struct i915_gem_proto_context *pc;
 	struct i915_gem_context *ctx;
 	int err;
 	u32 id;
 
-	ctx = i915_gem_create_context(i915, 0);
+	pc = proto_context_create(i915, 0);
+	if (IS_ERR(pc))
+		return ERR_CAST(pc);
+
+	ctx = i915_gem_create_context(i915, pc);
+	proto_context_close(pc);
 	if (IS_ERR(ctx))
 		return ctx;
 
@@ -142,8 +148,14 @@ struct i915_gem_context *
 kernel_context(struct drm_i915_private *i915)
 {
 	struct i915_gem_context *ctx;
+	struct i915_gem_proto_context *pc;
+
+	pc = proto_context_create(i915, 0);
+	if (IS_ERR(pc))
+		return ERR_CAST(pc);
 
-	ctx = i915_gem_create_context(i915, 0);
+	ctx = i915_gem_create_context(i915, pc);
+	proto_context_close(pc);
 	if (IS_ERR(ctx))
 		return ctx;
 
-- 
2.31.1

