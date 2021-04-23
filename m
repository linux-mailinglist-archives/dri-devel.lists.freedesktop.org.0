Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9FD369CBC
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 00:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB78D6ECD7;
	Fri, 23 Apr 2021 22:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DA76ECC5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 22:32:02 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 em21-20020a17090b0155b029014e204a81e6so5146841pjb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 15:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3hxPyK4be/8OrEQK6/V5etAH7o7zTaaKNXEwBKRGKCM=;
 b=nHTrUtcZxcSwR/0xim50NcIiCRste46VuOp1Ur0Hh4gQAhy2u5PHbAo5fzG34ZhiSf
 8s3JKXwYPRQ34jw71hRzn2Dfh4L0MfNke7SOoRYO7Z8RxWXD61uRSeFxl+JjInKbXfQi
 E674O+bFR+bbJc3od2UtmSZsnwq+FPuHHCAYr4htqLS0s0ZV4+lHgxJuGUCAgPUIOoiv
 19mGV0pkg2uHNn2DSpivx2GLanV4Q2ihXvZHAlILrdj1aSRZUz0dyon/IQ3ApNeRBq6A
 BWauW5zSLaJyun9Tqw0uiemGNZj7NM1kruuHNOtS5F6e4mbL+VU2zs4LsKWUBUQjP/u1
 6pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3hxPyK4be/8OrEQK6/V5etAH7o7zTaaKNXEwBKRGKCM=;
 b=Hyd7cyyK64JYtJhoXNO4fEIiiuzuBHWf5bleGuS08pFvA2z5F3anr5VK0Dn37RlkpZ
 OHZpL8eFI73assMb2h2p/wBA3TbOOEZJbPUJGmqPLbEvix3ioz/5bLLraKdbvv4Qdagj
 LWQ70SachwnqHe1sEK+P+8PgQLJ0V/8Icc5/fHYY9HKF5LmGXFuPuf4ap4JCIfGTpgfB
 xRpHWljIkf619nvrww8g7yD/k2RqYfL7r0TANrHNnjUV33Qfe3LUWosR9rvF7YwbGInJ
 7ULb4fJWDnYnSlG4WLF+kX5HMKU6e2xFatJcpafIyJPpFDa8pTumvHOLv83o2cFKWGX8
 pKOg==
X-Gm-Message-State: AOAM533MA6j+xab1RLKIN1KVD9FhckYcmW4pt8F72IoEkAdUf6OoUSQD
 xElDsqVOXKfNvfzci7IwoWTXMw==
X-Google-Smtp-Source: ABdhPJysG1R3+c+Hn8GRV29X7Tw12PMTOMJLlBJc0eoZlX316Hj35/hnHJ6BncV61iEoX0sQrpT/+A==
X-Received: by 2002:a17:90b:1118:: with SMTP id
 gi24mr6659580pjb.30.1619217121920; 
 Fri, 23 Apr 2021 15:32:01 -0700 (PDT)
Received: from omlet.com ([134.134.139.76])
 by smtp.gmail.com with ESMTPSA id z12sm5523420pfn.195.2021.04.23.15.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 15:32:01 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 16/21] drm/i915/gem: Delay context creation
Date: Fri, 23 Apr 2021 17:31:26 -0500
Message-Id: <20210423223131.879208-17-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 657 ++++++++++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |   3 +
 .../gpu/drm/i915/gem/i915_gem_context_types.h |  26 +
 .../gpu/drm/i915/gem/selftests/mock_context.c |   5 +-
 drivers/gpu/drm/i915/i915_drv.h               |  17 +-
 5 files changed, 648 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index db9153e0f85a7..aa8e61211924f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -193,8 +193,15 @@ static int validate_priority(struct drm_i915_private *i915,
 
 static void proto_context_close(struct i915_gem_proto_context *pc)
 {
+	int i;
+
 	if (pc->vm)
 		i915_vm_put(pc->vm);
+	if (pc->user_engines) {
+		for (i = 0; i < pc->num_user_engines; i++)
+			kfree(pc->user_engines[i].siblings);
+		kfree(pc->user_engines);
+	}
 	kfree(pc);
 }
 
@@ -274,12 +281,417 @@ proto_context_create(struct drm_i915_private *i915, unsigned int flags)
 	proto_context_set_persistence(i915, pc, true);
 	pc->sched.priority = I915_PRIORITY_NORMAL;
 
+	pc->num_user_engines = -1;
+	pc->user_engines = NULL;
+
 	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE)
 		pc->single_timeline = true;
 
 	return pc;
 }
 
+static int proto_context_register_locked(struct drm_i915_file_private *fpriv,
+					 struct i915_gem_proto_context *pc,
+					 u32 *id)
+{
+	int ret;
+	void *old;
+
+	ret = xa_alloc(&fpriv->context_xa, id, NULL, xa_limit_32b, GFP_KERNEL);
+	if (ret)
+		return ret;
+
+	old = xa_store(&fpriv->proto_context_xa, *id, pc, GFP_KERNEL);
+	if (xa_is_err(old)) {
+		xa_erase(&fpriv->context_xa, *id);
+		return xa_err(old);
+	}
+	GEM_BUG_ON(old);
+
+	return 0;
+}
+
+static int proto_context_register(struct drm_i915_file_private *fpriv,
+				  struct i915_gem_proto_context *pc,
+				  u32 *id)
+{
+	int ret;
+
+	mutex_lock(&fpriv->proto_context_lock);
+	ret = proto_context_register_locked(fpriv, pc, id);
+	mutex_unlock(&fpriv->proto_context_lock);
+
+	return ret;
+}
+
+static int set_proto_ctx_vm(struct drm_i915_file_private *fpriv,
+			    struct i915_gem_proto_context *pc,
+			    const struct drm_i915_gem_context_param *args)
+{
+	struct i915_address_space *vm;
+
+	if (args->size)
+		return -EINVAL;
+
+	if (!pc->vm)
+		return -ENODEV;
+
+	if (upper_32_bits(args->value))
+		return -ENOENT;
+
+	rcu_read_lock();
+	vm = xa_load(&fpriv->vm_xa, args->value);
+	if (vm && !kref_get_unless_zero(&vm->ref))
+		vm = NULL;
+	rcu_read_unlock();
+	if (!vm)
+		return -ENOENT;
+
+	i915_vm_put(pc->vm);
+	pc->vm = vm;
+
+	return 0;
+}
+
+struct set_proto_ctx_engines {
+	struct drm_i915_private *i915;
+	unsigned num_engines;
+	struct i915_gem_proto_engine *engines;
+};
+
+static int
+set_proto_ctx_engines_balance(struct i915_user_extension __user *base,
+			      void *data)
+{
+	struct i915_context_engines_load_balance __user *ext =
+		container_of_user(base, typeof(*ext), base);
+	const struct set_proto_ctx_engines *set = data;
+	struct drm_i915_private *i915 = set->i915;
+	struct intel_engine_cs **siblings;
+	u16 num_siblings, idx;
+	unsigned int n;
+	int err;
+
+	if (!HAS_EXECLISTS(i915))
+		return -ENODEV;
+
+	if (intel_uc_uses_guc_submission(&i915->gt.uc))
+		return -ENODEV; /* not implement yet */
+
+	if (get_user(idx, &ext->engine_index))
+		return -EFAULT;
+
+	if (idx >= set->num_engines) {
+		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
+			idx, set->num_engines);
+		return -EINVAL;
+	}
+
+	idx = array_index_nospec(idx, set->num_engines);
+	if (set->engines[idx].type != I915_GEM_ENGINE_TYPE_INVALID) {
+		drm_dbg(&i915->drm,
+			"Invalid placement[%d], already occupied\n", idx);
+		return -EEXIST;
+	}
+
+	if (get_user(num_siblings, &ext->num_siblings))
+		return -EFAULT;
+
+	err = check_user_mbz(&ext->flags);
+	if (err)
+		return err;
+
+	err = check_user_mbz(&ext->mbz64);
+	if (err)
+		return err;
+
+	if (num_siblings == 0)
+		return 0;
+
+	siblings = kmalloc_array(num_siblings, sizeof(*siblings), GFP_KERNEL);
+	if (!siblings)
+		return -ENOMEM;
+
+	for (n = 0; n < num_siblings; n++) {
+		struct i915_engine_class_instance ci;
+
+		if (copy_from_user(&ci, &ext->engines[n], sizeof(ci))) {
+			err = -EFAULT;
+			goto err_siblings;
+		}
+
+		siblings[n] = intel_engine_lookup_user(i915,
+						       ci.engine_class,
+						       ci.engine_instance);
+		if (!siblings[n]) {
+			drm_dbg(&i915->drm,
+				"Invalid sibling[%d]: { class:%d, inst:%d }\n",
+				n, ci.engine_class, ci.engine_instance);
+			err = -EINVAL;
+			goto err_siblings;
+		}
+	}
+
+	if (num_siblings == 1) {
+		set->engines[idx].type = I915_GEM_ENGINE_TYPE_PHYSICAL;
+		set->engines[idx].engine = siblings[0];
+		kfree(siblings);
+	} else {
+		set->engines[idx].type = I915_GEM_ENGINE_TYPE_BALANCED;
+		set->engines[idx].num_siblings = num_siblings;
+		set->engines[idx].siblings = siblings;
+	}
+
+	return 0;
+
+err_siblings:
+	kfree(siblings);
+
+	return err;
+}
+
+static int
+set_proto_ctx_engines_bond(struct i915_user_extension __user *base, void *data)
+{
+	struct i915_context_engines_bond __user *ext =
+		container_of_user(base, typeof(*ext), base);
+	const struct set_proto_ctx_engines *set = data;
+	struct drm_i915_private *i915 = set->i915;
+	struct i915_engine_class_instance ci;
+	struct intel_engine_cs *master;
+	u16 idx, num_bonds;
+	int err, n;
+
+	if (get_user(idx, &ext->virtual_index))
+		return -EFAULT;
+
+	if (idx >= set->num_engines) {
+		drm_dbg(&i915->drm,
+			"Invalid index for virtual engine: %d >= %d\n",
+			idx, set->num_engines);
+		return -EINVAL;
+	}
+
+	idx = array_index_nospec(idx, set->num_engines);
+	if (set->engines[idx].type == I915_GEM_ENGINE_TYPE_INVALID) {
+		drm_dbg(&i915->drm, "Invalid engine at %d\n", idx);
+		return -EINVAL;
+	}
+
+	if (set->engines[idx].type != I915_GEM_ENGINE_TYPE_PHYSICAL) {
+		drm_dbg(&i915->drm,
+			"Bonding with virtual engines not allowed\n");
+		return -EINVAL;
+	}
+
+	err = check_user_mbz(&ext->flags);
+	if (err)
+		return err;
+
+	for (n = 0; n < ARRAY_SIZE(ext->mbz64); n++) {
+		err = check_user_mbz(&ext->mbz64[n]);
+		if (err)
+			return err;
+	}
+
+	if (copy_from_user(&ci, &ext->master, sizeof(ci)))
+		return -EFAULT;
+
+	master = intel_engine_lookup_user(i915,
+					  ci.engine_class,
+					  ci.engine_instance);
+	if (!master) {
+		drm_dbg(&i915->drm,
+			"Unrecognised master engine: { class:%u, instance:%u }\n",
+			ci.engine_class, ci.engine_instance);
+		return -EINVAL;
+	}
+
+	if (get_user(num_bonds, &ext->num_bonds))
+		return -EFAULT;
+
+	for (n = 0; n < num_bonds; n++) {
+		struct intel_engine_cs *bond;
+
+		if (copy_from_user(&ci, &ext->engines[n], sizeof(ci)))
+			return -EFAULT;
+
+		bond = intel_engine_lookup_user(i915,
+						ci.engine_class,
+						ci.engine_instance);
+		if (!bond) {
+			drm_dbg(&i915->drm,
+				"Unrecognised engine[%d] for bonding: { class:%d, instance: %d }\n",
+				n, ci.engine_class, ci.engine_instance);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static const i915_user_extension_fn set_proto_ctx_engines_extensions[] = {
+	[I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE] = set_proto_ctx_engines_balance,
+	[I915_CONTEXT_ENGINES_EXT_BOND] = set_proto_ctx_engines_bond,
+};
+
+static int set_proto_ctx_engines(struct drm_i915_file_private *fpriv,
+			         struct i915_gem_proto_context *pc,
+			         const struct drm_i915_gem_context_param *args)
+{
+	struct drm_i915_private *i915 = fpriv->dev_priv;
+	struct set_proto_ctx_engines set = { .i915 = i915 };
+	struct i915_context_param_engines __user *user =
+		u64_to_user_ptr(args->value);
+	unsigned int n;
+	u64 extensions;
+	int err;
+
+	if (!args->size) {
+		kfree(pc->user_engines);
+		pc->num_user_engines = -1;
+		pc->user_engines = NULL;
+		return 0;
+	}
+
+	BUILD_BUG_ON(!IS_ALIGNED(sizeof(*user), sizeof(*user->engines)));
+	if (args->size < sizeof(*user) ||
+	    !IS_ALIGNED(args->size, sizeof(*user->engines))) {
+		drm_dbg(&i915->drm, "Invalid size for engine array: %d\n",
+			args->size);
+		return -EINVAL;
+	}
+
+	set.num_engines = (args->size - sizeof(*user)) / sizeof(*user->engines);
+	if (set.num_engines > I915_EXEC_RING_MASK + 1)
+		return -EINVAL;
+
+	set.engines = kmalloc_array(set.num_engines, sizeof(*set.engines), GFP_KERNEL);
+	if (!set.engines)
+		return -ENOMEM;
+
+	for (n = 0; n < set.num_engines; n++) {
+		struct i915_engine_class_instance ci;
+		struct intel_engine_cs *engine;
+
+		if (copy_from_user(&ci, &user->engines[n], sizeof(ci))) {
+			kfree(set.engines);
+			return -EFAULT;
+		}
+
+		memset(&set.engines[n], 0, sizeof(set.engines[n]));
+
+		if (ci.engine_class == (u16)I915_ENGINE_CLASS_INVALID &&
+		    ci.engine_instance == (u16)I915_ENGINE_CLASS_INVALID_NONE)
+			continue;
+
+		engine = intel_engine_lookup_user(i915,
+						  ci.engine_class,
+						  ci.engine_instance);
+		if (!engine) {
+			drm_dbg(&i915->drm,
+				"Invalid engine[%d]: { class:%d, instance:%d }\n",
+				n, ci.engine_class, ci.engine_instance);
+			kfree(set.engines);
+			return -ENOENT;
+		}
+
+		set.engines[n].type = I915_GEM_ENGINE_TYPE_PHYSICAL;
+		set.engines[n].engine = engine;
+	}
+
+	err = -EFAULT;
+	if (!get_user(extensions, &user->extensions))
+		err = i915_user_extensions(u64_to_user_ptr(extensions),
+					   set_proto_ctx_engines_extensions,
+					   ARRAY_SIZE(set_proto_ctx_engines_extensions),
+					   &set);
+	if (err) {
+		kfree(set.engines);
+		return err;
+	}
+
+	kfree(pc->user_engines);
+	pc->num_user_engines = set.num_engines;
+	pc->user_engines = set.engines;
+
+	return 0;
+}
+
+static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
+			       struct i915_gem_proto_context *pc,
+			       struct drm_i915_gem_context_param *args)
+{
+	int ret = 0;
+
+	switch (args->param) {
+	case I915_CONTEXT_PARAM_NO_ERROR_CAPTURE:
+		if (args->size)
+			ret = -EINVAL;
+		else if (args->value)
+			set_bit(UCONTEXT_NO_ERROR_CAPTURE, &pc->user_flags);
+		else
+			clear_bit(UCONTEXT_NO_ERROR_CAPTURE, &pc->user_flags);
+		break;
+
+	case I915_CONTEXT_PARAM_BANNABLE:
+		if (args->size)
+			ret = -EINVAL;
+		else if (!capable(CAP_SYS_ADMIN) && !args->value)
+			ret = -EPERM;
+		else if (args->value)
+			set_bit(UCONTEXT_BANNABLE, &pc->user_flags);
+		else
+			clear_bit(UCONTEXT_BANNABLE, &pc->user_flags);
+		break;
+
+	case I915_CONTEXT_PARAM_RECOVERABLE:
+		if (args->size)
+			ret = -EINVAL;
+		else if (args->value)
+			set_bit(UCONTEXT_RECOVERABLE, &pc->user_flags);
+		else
+			clear_bit(UCONTEXT_RECOVERABLE, &pc->user_flags);
+		break;
+
+	case I915_CONTEXT_PARAM_PRIORITY:
+		ret = validate_priority(fpriv->dev_priv, args);
+		if (!ret)
+			pc->sched.priority = args->value;
+		break;
+
+	case I915_CONTEXT_PARAM_SSEU:
+		ret = -ENOTSUPP;
+		break;
+
+	case I915_CONTEXT_PARAM_VM:
+		ret = set_proto_ctx_vm(fpriv, pc, args);
+		break;
+
+	case I915_CONTEXT_PARAM_ENGINES:
+		ret = set_proto_ctx_engines(fpriv, pc, args);
+		break;
+
+	case I915_CONTEXT_PARAM_PERSISTENCE:
+		if (args->size)
+			ret = -EINVAL;
+		else if (args->value)
+			set_bit(UCONTEXT_PERSISTENCE, &pc->user_flags);
+		else
+			clear_bit(UCONTEXT_PERSISTENCE, &pc->user_flags);
+		break;
+
+	case I915_CONTEXT_PARAM_NO_ZEROMAP:
+	case I915_CONTEXT_PARAM_BAN_PERIOD:
+	case I915_CONTEXT_PARAM_RINGSIZE:
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
 static struct i915_address_space *
 context_get_vm_rcu(struct i915_gem_context *ctx)
 {
@@ -450,6 +862,47 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
 	return e;
 }
 
+static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
+					     unsigned int num_engines,
+					     struct i915_gem_proto_engine *pe)
+{
+	struct i915_gem_engines *e;
+	unsigned int n;
+
+	e = alloc_engines(num_engines);
+	for (n = 0; n < num_engines; n++) {
+		struct intel_context *ce;
+
+		switch (pe[n].type) {
+		case I915_GEM_ENGINE_TYPE_PHYSICAL:
+			ce = intel_context_create(pe[n].engine);
+			break;
+
+		case I915_GEM_ENGINE_TYPE_BALANCED:
+			ce = intel_execlists_create_virtual(pe[n].siblings,
+							    pe[n].num_siblings);
+			break;
+
+		case I915_GEM_ENGINE_TYPE_INVALID:
+		default:
+			GEM_WARN_ON(pe[n].type != I915_GEM_ENGINE_TYPE_INVALID);
+			continue;
+		}
+
+		if (IS_ERR(ce)) {
+			__free_engines(e, n);
+			return ERR_CAST(ce);
+		}
+
+		intel_context_set_gem(ce, ctx);
+
+		e->engines[n] = ce;
+	}
+	e->num_engines = num_engines;
+
+	return e;
+}
+
 void i915_gem_context_release(struct kref *ref)
 {
 	struct i915_gem_context *ctx = container_of(ref, typeof(*ctx), ref);
@@ -890,6 +1343,24 @@ i915_gem_create_context(struct drm_i915_private *i915,
 		mutex_unlock(&ctx->mutex);
 	}
 
+	if (pc->num_user_engines >= 0) {
+		struct i915_gem_engines *engines;
+
+		engines = user_engines(ctx, pc->num_user_engines,
+				       pc->user_engines);
+		if (IS_ERR(engines)) {
+			context_close(ctx);
+			return ERR_CAST(engines);
+		}
+
+		mutex_lock(&ctx->engines_mutex);
+		i915_gem_context_set_user_engines(ctx);
+		engines = rcu_replace_pointer(ctx->engines, engines, 1);
+		mutex_unlock(&ctx->engines_mutex);
+
+		free_engines(engines);
+	}
+
 	if (pc->single_timeline) {
 		ret = drm_syncobj_create(&ctx->syncobj,
 					 DRM_SYNCOBJ_CREATE_SIGNALED,
@@ -916,12 +1387,12 @@ void i915_gem_init__contexts(struct drm_i915_private *i915)
 	init_contexts(&i915->gem.contexts);
 }
 
-static int gem_context_register(struct i915_gem_context *ctx,
-				struct drm_i915_file_private *fpriv,
-				u32 *id)
+static void gem_context_register(struct i915_gem_context *ctx,
+				 struct drm_i915_file_private *fpriv,
+				 u32 id)
 {
 	struct drm_i915_private *i915 = ctx->i915;
-	int ret;
+	void *old;
 
 	ctx->file_priv = fpriv;
 
@@ -930,19 +1401,12 @@ static int gem_context_register(struct i915_gem_context *ctx,
 		 current->comm, pid_nr(ctx->pid));
 
 	/* And finally expose ourselves to userspace via the idr */
-	ret = xa_alloc(&fpriv->context_xa, id, ctx, xa_limit_32b, GFP_KERNEL);
-	if (ret)
-		goto err_pid;
+	old = xa_store(&fpriv->context_xa, id, ctx, GFP_KERNEL);
+	GEM_BUG_ON(old);
 
 	spin_lock(&i915->gem.contexts.lock);
 	list_add_tail(&ctx->link, &i915->gem.contexts.list);
 	spin_unlock(&i915->gem.contexts.lock);
-
-	return 0;
-
-err_pid:
-	put_pid(fetch_and_zero(&ctx->pid));
-	return ret;
 }
 
 int i915_gem_context_open(struct drm_i915_private *i915,
@@ -952,9 +1416,12 @@ int i915_gem_context_open(struct drm_i915_private *i915,
 	struct i915_gem_proto_context *pc;
 	struct i915_gem_context *ctx;
 	int err;
-	u32 id;
 
-	xa_init_flags(&file_priv->context_xa, XA_FLAGS_ALLOC);
+	mutex_init(&file_priv->proto_context_lock);
+	xa_init_flags(&file_priv->proto_context_xa, XA_FLAGS_ALLOC);
+
+	/* 0 reserved for the default context */
+	xa_init_flags(&file_priv->context_xa, XA_FLAGS_ALLOC1);
 
 	/* 0 reserved for invalid/unassigned ppgtt */
 	xa_init_flags(&file_priv->vm_xa, XA_FLAGS_ALLOC1);
@@ -972,28 +1439,31 @@ int i915_gem_context_open(struct drm_i915_private *i915,
 		goto err;
 	}
 
-	err = gem_context_register(ctx, file_priv, &id);
-	if (err < 0)
-		goto err_ctx;
+	gem_context_register(ctx, file_priv, 0);
 
-	GEM_BUG_ON(id);
 	return 0;
 
-err_ctx:
-	context_close(ctx);
 err:
 	xa_destroy(&file_priv->vm_xa);
 	xa_destroy(&file_priv->context_xa);
+	xa_destroy(&file_priv->proto_context_xa);
+	mutex_destroy(&file_priv->proto_context_lock);
 	return err;
 }
 
 void i915_gem_context_close(struct drm_file *file)
 {
 	struct drm_i915_file_private *file_priv = file->driver_priv;
+	struct i915_gem_proto_context *pc;
 	struct i915_address_space *vm;
 	struct i915_gem_context *ctx;
 	unsigned long idx;
 
+	xa_for_each(&file_priv->proto_context_xa, idx, pc)
+		proto_context_close(pc);
+	xa_destroy(&file_priv->proto_context_xa);
+	mutex_destroy(&file_priv->proto_context_lock);
+
 	xa_for_each(&file_priv->context_xa, idx, ctx)
 		context_close(ctx);
 	xa_destroy(&file_priv->context_xa);
@@ -1918,7 +2388,7 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
 }
 
 struct create_ext {
-	struct i915_gem_context *ctx;
+	struct i915_gem_proto_context *pc;
 	struct drm_i915_file_private *fpriv;
 };
 
@@ -1933,7 +2403,7 @@ static int create_setparam(struct i915_user_extension __user *ext, void *data)
 	if (local.param.ctx_id)
 		return -EINVAL;
 
-	return ctx_setparam(arg->fpriv, arg->ctx, &local.param);
+	return set_proto_ctx_param(arg->fpriv, arg->pc, &local.param);
 }
 
 static int invalid_ext(struct i915_user_extension __user *ext, void *data)
@@ -1951,12 +2421,71 @@ static bool client_is_banned(struct drm_i915_file_private *file_priv)
 	return atomic_read(&file_priv->ban_score) >= I915_CLIENT_SCORE_BANNED;
 }
 
+static inline struct i915_gem_context *
+__context_lookup(struct drm_i915_file_private *file_priv, u32 id)
+{
+	struct i915_gem_context *ctx;
+
+	rcu_read_lock();
+	ctx = xa_load(&file_priv->context_xa, id);
+	if (ctx && !kref_get_unless_zero(&ctx->ref))
+		ctx = NULL;
+	rcu_read_unlock();
+
+	return ctx;
+}
+
+struct i915_gem_context *
+lazy_create_context_locked(struct drm_i915_file_private *file_priv,
+			   struct i915_gem_proto_context *pc, u32 id)
+{
+	struct i915_gem_context *ctx;
+	void *old;
+
+	ctx = i915_gem_create_context(file_priv->dev_priv, pc);
+	if (IS_ERR(ctx))
+		return ctx;
+
+	gem_context_register(ctx, file_priv, id);
+
+	old = xa_erase(&file_priv->proto_context_xa, id);
+	GEM_BUG_ON(old != pc);
+	proto_context_close(pc);
+
+	/* One for the xarray and one for the caller */
+	return i915_gem_context_get(ctx);
+}
+
+struct i915_gem_context *
+i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
+{
+	struct i915_gem_proto_context *pc;
+	struct i915_gem_context *ctx;
+
+	ctx = __context_lookup(file_priv, id);
+	if (ctx)
+		return ctx;
+
+	mutex_lock(&file_priv->proto_context_lock);
+	/* Try one more time under the lock */
+	ctx = __context_lookup(file_priv, id);
+	if (!ctx) {
+		pc = xa_load(&file_priv->proto_context_xa, id);
+		if (!pc)
+			ctx = ERR_PTR(-ENOENT);
+		else
+			ctx = lazy_create_context_locked(file_priv, pc, id);
+	}
+	mutex_unlock(&file_priv->proto_context_lock);
+
+	return ctx;
+}
+
 int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 				  struct drm_file *file)
 {
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_context_create_ext *args = data;
-	struct i915_gem_proto_context *pc;
 	struct create_ext ext_data;
 	int ret;
 	u32 id;
@@ -1979,14 +2508,9 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 		return -EIO;
 	}
 
-	pc = proto_context_create(i915, args->flags);
-	if (IS_ERR(pc))
-		return PTR_ERR(pc);
-
-	ext_data.ctx = i915_gem_create_context(i915, pc);
-	proto_context_close(pc);
-	if (IS_ERR(ext_data.ctx))
-		return PTR_ERR(ext_data.ctx);
+	ext_data.pc = proto_context_create(i915, args->flags);
+	if (IS_ERR(ext_data.pc))
+		return PTR_ERR(ext_data.pc);
 
 	if (args->flags & I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS) {
 		ret = i915_user_extensions(u64_to_user_ptr(args->extensions),
@@ -1994,20 +2518,20 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 					   ARRAY_SIZE(create_extensions),
 					   &ext_data);
 		if (ret)
-			goto err_ctx;
+			goto err_pc;
 	}
 
-	ret = gem_context_register(ext_data.ctx, ext_data.fpriv, &id);
+	ret = proto_context_register(ext_data.fpriv, ext_data.pc, &id);
 	if (ret < 0)
-		goto err_ctx;
+		goto err_pc;
 
 	args->ctx_id = id;
 	drm_dbg(&i915->drm, "HW context %d created\n", args->ctx_id);
 
 	return 0;
 
-err_ctx:
-	context_close(ext_data.ctx);
+err_pc:
+	proto_context_close(ext_data.pc);
 	return ret;
 }
 
@@ -2016,6 +2540,7 @@ int i915_gem_context_destroy_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_i915_gem_context_destroy *args = data;
 	struct drm_i915_file_private *file_priv = file->driver_priv;
+	struct i915_gem_proto_context *pc;
 	struct i915_gem_context *ctx;
 
 	if (args->pad != 0)
@@ -2024,11 +2549,21 @@ int i915_gem_context_destroy_ioctl(struct drm_device *dev, void *data,
 	if (!args->ctx_id)
 		return -ENOENT;
 
+	mutex_lock(&file_priv->proto_context_lock);
 	ctx = xa_erase(&file_priv->context_xa, args->ctx_id);
-	if (!ctx)
+	pc = xa_erase(&file_priv->proto_context_xa, args->ctx_id);
+	mutex_unlock(&file_priv->proto_context_lock);
+
+	if (!ctx && !pc)
 		return -ENOENT;
+	GEM_WARN_ON(ctx && pc);
+
+	if (pc)
+		proto_context_close(pc);
+
+	if (ctx)
+		context_close(ctx);
 
-	context_close(ctx);
 	return 0;
 }
 
@@ -2161,16 +2696,48 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_i915_file_private *file_priv = file->driver_priv;
 	struct drm_i915_gem_context_param *args = data;
+	struct i915_gem_proto_context *pc;
 	struct i915_gem_context *ctx;
-	int ret;
+	int ret = 0;
 
-	ctx = i915_gem_context_lookup(file_priv, args->ctx_id);
-	if (IS_ERR(ctx))
-		return PTR_ERR(ctx);
+	ctx = __context_lookup(file_priv, args->ctx_id);
+	if (ctx)
+		goto set_ctx_param;
 
-	ret = ctx_setparam(file_priv, ctx, args);
+	mutex_lock(&file_priv->proto_context_lock);
+	ctx = __context_lookup(file_priv, args->ctx_id);
+	if (ctx)
+		goto unlock;
+
+	pc = xa_load(&file_priv->proto_context_xa, args->ctx_id);
+	if (!pc) {
+		ret = -ENOENT;
+		goto unlock;
+	}
+
+	ret = set_proto_ctx_param(file_priv, pc, args);
+	if (ret == -ENOTSUPP) {
+		/* Some params, specifically SSEU, can only be set on fully
+		 * created contexts.
+		 */
+		ret = 0;
+		ctx = lazy_create_context_locked(file_priv, pc, args->ctx_id);
+		if (IS_ERR(ctx)) {
+			ret = PTR_ERR(ctx);
+			ctx = NULL;
+		}
+	}
+
+unlock:
+	mutex_unlock(&file_priv->proto_context_lock);
+
+set_ctx_param:
+	if (!ret && ctx)
+		ret = ctx_setparam(file_priv, ctx, args);
+
+	if (ctx)
+		i915_gem_context_put(ctx);
 
-	i915_gem_context_put(ctx);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
index b5c908f3f4f22..20411db84914a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -133,6 +133,9 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
 int i915_gem_context_reset_stats_ioctl(struct drm_device *dev, void *data,
 				       struct drm_file *file);
 
+struct i915_gem_context *
+i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id);
+
 static inline struct i915_gem_context *
 i915_gem_context_get(struct i915_gem_context *ctx)
 {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index a42c429f94577..067ea3030ac91 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -46,6 +46,26 @@ struct i915_gem_engines_iter {
 	const struct i915_gem_engines *engines;
 };
 
+enum i915_gem_engine_type {
+	I915_GEM_ENGINE_TYPE_INVALID = 0,
+	I915_GEM_ENGINE_TYPE_PHYSICAL,
+	I915_GEM_ENGINE_TYPE_BALANCED,
+};
+
+struct i915_gem_proto_engine {
+	/** @type: Type of this engine */
+	enum i915_gem_engine_type type;
+
+	/** @num_siblings: Engine, for physical */
+	struct intel_engine_cs *engine;
+
+	/** @num_siblings: Number of balanced siblings */
+	unsigned int num_siblings;
+
+	/** @num_siblings: Balanced siblings */
+	struct intel_engine_cs **siblings;
+};
+
 /**
  * struct i915_gem_proto_context - prototype context
  *
@@ -64,6 +84,12 @@ struct i915_gem_proto_context {
 	/** @sched: See i915_gem_context::sched */
 	struct i915_sched_attr sched;
 
+	/** @num_user_engines: Number of user-specified engines or -1 */
+	int num_user_engines;
+
+	/** @num_user_engines: User-specified engines */
+	struct i915_gem_proto_engine *user_engines;
+
 	bool single_timeline;
 };
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
index e0f512ef7f3c6..32cf2103828f9 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
@@ -80,6 +80,7 @@ void mock_init_contexts(struct drm_i915_private *i915)
 struct i915_gem_context *
 live_context(struct drm_i915_private *i915, struct file *file)
 {
+	struct drm_i915_file_private *fpriv = to_drm_file(file)->driver_priv;
 	struct i915_gem_proto_context *pc;
 	struct i915_gem_context *ctx;
 	int err;
@@ -96,10 +97,12 @@ live_context(struct drm_i915_private *i915, struct file *file)
 
 	i915_gem_context_set_no_error_capture(ctx);
 
-	err = gem_context_register(ctx, to_drm_file(file)->driver_priv, &id);
+	err = xa_alloc(&fpriv->context_xa, &id, NULL, xa_limit_32b, GFP_KERNEL);
 	if (err < 0)
 		goto err_ctx;
 
+	gem_context_register(ctx, fpriv, id);
+
 	return ctx;
 
 err_ctx:
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 004ed0e59c999..365c042529d72 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -200,6 +200,9 @@ struct drm_i915_file_private {
 		struct rcu_head rcu;
 	};
 
+	struct mutex proto_context_lock;
+	struct xarray proto_context_xa;
+
 	struct xarray context_xa;
 	struct xarray vm_xa;
 
@@ -1840,20 +1843,6 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
 
 struct dma_buf *i915_gem_prime_export(struct drm_gem_object *gem_obj, int flags);
 
-static inline struct i915_gem_context *
-i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
-{
-	struct i915_gem_context *ctx;
-
-	rcu_read_lock();
-	ctx = xa_load(&file_priv->context_xa, id);
-	if (ctx && !kref_get_unless_zero(&ctx->ref))
-		ctx = NULL;
-	rcu_read_unlock();
-
-	return ctx ? ctx : ERR_PTR(-ENOENT);
-}
-
 /* i915_gem_evict.c */
 int __must_check i915_gem_evict_something(struct i915_address_space *vm,
 					  u64 min_size, u64 alignment,
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
