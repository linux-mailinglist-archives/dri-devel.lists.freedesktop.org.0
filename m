Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7779036F001
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 21:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A1A6F477;
	Thu, 29 Apr 2021 19:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E01266F475
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 19:04:12 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id h7so6725260plt.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jLnSzDN8z9iBl80GNNFN3C7dClq6Rb0WkGyGQW9fYgk=;
 b=Q2QMpJxEhOJDUjXGbjdtRBBdR09u4Cgb4oXv5tJhgnstUHlNq0Tjf4OoHfdGMRATQj
 9iV9Y70H9pRSQuq9WzALYDdqKww2xOh+6Fd+JjgluoCry7LFJ1O1c7LTKMJrS83QSdCm
 A9JRkxNWGNGkd43GGNNQd7Xqq+ky2DCKteTleGk3pOm9Ozh50jAFO0hrs7OqHGg28wQQ
 cJoQvfk3XIt3IrpGdbmGSIVN7dVnK9hTWQ2VfW4Fsbg8TLuqmO19dqHcAk2hB0B0+PZz
 /thdFhWrG0j9mF5LBHDlpA1WwosNTNXs1tyskETMV5fRAA+bwyaJz7AFgy2nznBlZdk6
 qEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jLnSzDN8z9iBl80GNNFN3C7dClq6Rb0WkGyGQW9fYgk=;
 b=hRBf5E3AJwOyqG2tBJSuGsREjrTXQiFJNlr7sp7jk5+QxdYYszTD2Mgn2MANaMGxyj
 ptodWsqEU6uCvn+RQRrqXMPOYKk7C50C7HccCDVATg7dnRNgkPyJpC3h3SS6mUltdp7a
 1hB/p92FpQpDohNmP5eZ2j8d0QCs8VGIwBVx5odaZdb0A8RXjdMaBF6YzzjoPTbQc1Pl
 5QWi8N2nG/udGOoZNtQZhx4d2ClTGwrjMJcDNF3xZlpcrmnOfPKZz1XppxQ4En0RVstq
 +VO0PkVN6wwLLphTlFFRBO6AM5z7E2H44MBa3GSJTmvSek/SLXFJwRvzwwCBiXH/leUW
 llxw==
X-Gm-Message-State: AOAM531hp4OF9bgaryNHsgcifVjbDtJ9o7F5XXDil68Gnd8Q549GpLI/
 isv8S0Q+OMZeoBg19Y1GLTgBUw==
X-Google-Smtp-Source: ABdhPJyssBkRjTqhozUgIJp4vIAqqe0YsmlXnpKv4c12s7u3AzIoxcrh0AOI1CChR/ldbX13Sath5Q==
X-Received: by 2002:a17:902:b406:b029:ec:fbf2:4114 with SMTP id
 x6-20020a170902b406b02900ecfbf24114mr1201763plr.32.1619723052255; 
 Thu, 29 Apr 2021 12:04:12 -0700 (PDT)
Received: from omlet.lan ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id b21sm3114405pji.39.2021.04.29.12.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 12:04:11 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 16/25] drm/i915/gem: Add an intermediate proto_context struct
Date: Thu, 29 Apr 2021 14:03:31 -0500
Message-Id: <20210429190340.1555632-17-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429190340.1555632-1-jason@jlekstrand.net>
References: <20210429190340.1555632-1-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Unfortunately, both methods of setting the VM and engine set are in
active use today so we can't simply disallow setting the VM or engine
set vial SET_CONTEXT_PARAM.  In order to work around this wart, this
commit adds a proto-context struct which contains all the context create
parameters.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 143 ++++++++++++++----
 .../gpu/drm/i915/gem/i915_gem_context_types.h |  22 +++
 .../gpu/drm/i915/gem/selftests/mock_context.c |  16 +-
 3 files changed, 151 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 4835991898ac9..cffe84cf5e4a3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -191,6 +191,95 @@ static int validate_priority(struct drm_i915_private *i915,
 	return 0;
 }
 
+static void proto_context_close(struct i915_gem_proto_context *pc)
+{
+	if (pc->vm)
+		i915_vm_put(pc->vm);
+	kfree(pc);
+}
+
+static int proto_context_set_persistence(struct drm_i915_private *i915,
+					 struct i915_gem_proto_context *pc,
+					 bool persist)
+{
+	if (persist) {
+		/*
+		 * Only contexts that are short-lived [that will expire or be
+		 * reset] are allowed to survive past termination. We require
+		 * hangcheck to ensure that the persistent requests are healthy.
+		 */
+		if (!i915->params.enable_hangcheck)
+			return -EINVAL;
+
+		__set_bit(UCONTEXT_PERSISTENCE, &pc->user_flags);
+	} else {
+		/* To cancel a context we use "preempt-to-idle" */
+		if (!(i915->caps.scheduler & I915_SCHEDULER_CAP_PREEMPTION))
+			return -ENODEV;
+
+		/*
+		 * If the cancel fails, we then need to reset, cleanly!
+		 *
+		 * If the per-engine reset fails, all hope is lost! We resort
+		 * to a full GPU reset in that unlikely case, but realistically
+		 * if the engine could not reset, the full reset does not fare
+		 * much better. The damage has been done.
+		 *
+		 * However, if we cannot reset an engine by itself, we cannot
+		 * cleanup a hanging persistent context without causing
+		 * colateral damage, and we should not pretend we can by
+		 * exposing the interface.
+		 */
+		if (!intel_has_reset_engine(&i915->gt))
+			return -ENODEV;
+
+		__clear_bit(UCONTEXT_PERSISTENCE, &pc->user_flags);
+	}
+
+	return 0;
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
+	if (HAS_FULL_PPGTT(i915)) {
+		struct i915_ppgtt *ppgtt;
+
+		ppgtt = i915_ppgtt_create(&i915->gt);
+		if (IS_ERR(ppgtt)) {
+			drm_dbg(&i915->drm, "PPGTT setup failed (%ld)\n",
+				PTR_ERR(ppgtt));
+			err = ERR_CAST(ppgtt);
+			goto proto_close;
+		}
+		pc->vm = &ppgtt->vm;
+	}
+
+	pc->user_flags = UCONTEXT_BANNABLE | UCONTEXT_RECOVERABLE;
+	proto_context_set_persistence(i915, pc, true);
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
@@ -660,7 +749,8 @@ static int __context_set_persistence(struct i915_gem_context *ctx, bool state)
 }
 
 static struct i915_gem_context *
-__create_context(struct drm_i915_private *i915)
+__create_context(struct drm_i915_private *i915,
+		 const struct i915_gem_proto_context *pc)
 {
 	struct i915_gem_context *ctx;
 	struct i915_gem_engines *e;
@@ -673,7 +763,7 @@ __create_context(struct drm_i915_private *i915)
 
 	kref_init(&ctx->ref);
 	ctx->i915 = i915;
-	ctx->sched.priority = I915_PRIORITY_NORMAL;
+	ctx->sched = pc->sched;
 	mutex_init(&ctx->mutex);
 	INIT_LIST_HEAD(&ctx->link);
 
@@ -696,9 +786,7 @@ __create_context(struct drm_i915_private *i915)
 	 * is no remap info, it will be a NOP. */
 	ctx->remap_slice = ALL_L3_SLICES(i915);
 
-	i915_gem_context_set_bannable(ctx);
-	i915_gem_context_set_recoverable(ctx);
-	__context_set_persistence(ctx, true /* cgroup hook? */);
+	ctx->user_flags = pc->user_flags;
 
 	for (i = 0; i < ARRAY_SIZE(ctx->hang_timestamp); i++)
 		ctx->hang_timestamp[i] = jiffies - CONTEXT_FAST_HANG_JIFFIES;
@@ -786,38 +874,23 @@ static void __assign_ppgtt(struct i915_gem_context *ctx,
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
-		struct i915_ppgtt *ppgtt;
-
-		ppgtt = i915_ppgtt_create(&i915->gt);
-		if (IS_ERR(ppgtt)) {
-			drm_dbg(&i915->drm, "PPGTT setup failed (%ld)\n",
-				PTR_ERR(ppgtt));
-			context_close(ctx);
-			return ERR_CAST(ppgtt);
-		}
-
+	if (pc->vm) {
 		mutex_lock(&ctx->mutex);
-		__assign_ppgtt(ctx, &ppgtt->vm);
+		__assign_ppgtt(ctx, pc->vm);
 		mutex_unlock(&ctx->mutex);
-
-		i915_vm_put(&ppgtt->vm);
 	}
 
-	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
+	if (pc->single_timeline) {
 		ret = drm_syncobj_create(&ctx->syncobj,
 					 DRM_SYNCOBJ_CREATE_SIGNALED,
 					 NULL);
@@ -883,6 +956,7 @@ int i915_gem_context_open(struct drm_i915_private *i915,
 			  struct drm_file *file)
 {
 	struct drm_i915_file_private *file_priv = file->driver_priv;
+	struct i915_gem_proto_context *pc;
 	struct i915_gem_context *ctx;
 	int err;
 	u32 id;
@@ -892,7 +966,14 @@ int i915_gem_context_open(struct drm_i915_private *i915,
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
@@ -1885,6 +1966,7 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_context_create_ext *args = data;
+	struct i915_gem_proto_context *pc;
 	struct create_ext ext_data;
 	int ret;
 	u32 id;
@@ -1907,7 +1989,12 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
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
index 5f0673a2129f9..0bf337b6d89ac 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -66,6 +66,28 @@ struct i915_gem_engines_iter {
 	const struct i915_gem_engines *engines;
 };
 
+/**
+ * struct i915_gem_proto_context - prototype context
+ *
+ * The struct i915_gem_proto_context represents the creation parameters for
+ * an i915_gem_context.  This is used to gather parameters provided either
+ * through creation flags or via SET_CONTEXT_PARAM so that, when we create
+ * the final i915_gem_context, those parameters can be immutable.
+ */
+struct i915_gem_proto_context {
+	/** @vm: See i915_gem_context::vm */
+	struct i915_address_space *vm;
+
+	/** @user_flags: See i915_gem_context::user_flags */
+	unsigned long user_flags;
+
+	/** @sched: See i915_gem_context::sched */
+	struct i915_sched_attr sched;
+
+	/** @single_timeline: See See i915_gem_context::syncobj */
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
