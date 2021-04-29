Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0585A36EEC5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 19:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38256F3FE;
	Thu, 29 Apr 2021 17:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7CA6F3FE
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 17:21:06 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 26-20020a05600c22dab029013efd7879b8so193492wmg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 10:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IcAYUWVX40cGvjrVugD7ilbDyfDHL3O416JEfawGpxQ=;
 b=fIiRbDwhoMEFkFdGFpeiT2vOCHSf4BswcodcyJAmurSOIjpgRXHeDYjSqyVHK/hMSY
 bbL1d2nS1xYxBexoNs+3ZggfUEn5zvn0SiX6Mv1aeUAdb22TKPetD5+gKxJznNST5Vq4
 wyTDNEEz8LQSDeVsMcZSM1hTSFn1q/trRzXUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IcAYUWVX40cGvjrVugD7ilbDyfDHL3O416JEfawGpxQ=;
 b=pwWGEbHnO+MbviXaXduC5n+Kz5L7aZtxIDVKtL9LXj9P6qXrcw2QReZHyBdehkxxx7
 SfUAeK0u3ayH+7PqB99YSrJsoGSqPxYQsVcUNzwkKCNQJ/fQ+ysiJ0NEVpRErUMJYxuw
 k0/pIV0NaP/QW80+qKw86GCZxYDC9WDtYnWTxX7KlW4yV8EZlMfpdrhWZ+LPgwL0I7wz
 Muv3dBM7/abzjK7xQZyIsFlj8DEL81u8ZGH83xZQ4iWMnysO+InmxpdupeL9ooRYyieQ
 W5tklvEKBNETJppGOFFpoQZXohu88MipiPLla6lK9bpDpjphRQKCjVLKL/CzyzDil09C
 HtFA==
X-Gm-Message-State: AOAM531clxl1PtkM2dQGK35n8zZEk8mD8YpSCJhub8Dp26IywF/KoWNn
 7vUAknSi1zhebhxu4OPUfNIX4w==
X-Google-Smtp-Source: ABdhPJwNppfmm2BBIDcEyu83sw/UGA06KhYq7f+6K3GUWPnP+rkQjw8eAjOdmpRi0wiiDTrb1eVw+Q==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr1280360wmc.90.1619716864895; 
 Thu, 29 Apr 2021 10:21:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm10939078wmc.22.2021.04.29.10.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 10:21:04 -0700 (PDT)
Date: Thu, 29 Apr 2021 19:21:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 18/21] drm/i915/gem: Don't allow changing the engine set
 on running contexts
Message-ID: <YIrq/hUghatGl8rc@phenom.ffwll.local>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-19-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423223131.879208-19-jason@jlekstrand.net>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 05:31:28PM -0500, Jason Ekstrand wrote:
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

I think with the additions move in here and commit message explaining a
bit what's going on this looks all reasonable.

I think minimally you should explain the audit you've done here and which
userspace still uses this post CTX_CREATE_EXT in setparam. That would be
really good to have recorded for all these changes. And if that explainer
is on the proto ctx code you're adding it can even be found in the future
again.
-Daniel

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 301 --------------------
>  1 file changed, 301 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 3238260cffa31..ef23ab4260c24 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1722,303 +1722,6 @@ static int set_sseu(struct i915_gem_context *ctx,
>  	return ret;
>  }
>  
> -struct set_engines {
> -	struct i915_gem_context *ctx;
> -	struct i915_gem_engines *engines;
> -};
> -
> -static int
> -set_engines__load_balance(struct i915_user_extension __user *base, void *data)
> -{
> -	struct i915_context_engines_load_balance __user *ext =
> -		container_of_user(base, typeof(*ext), base);
> -	const struct set_engines *set = data;
> -	struct drm_i915_private *i915 = set->ctx->i915;
> -	struct intel_engine_cs *stack[16];
> -	struct intel_engine_cs **siblings;
> -	struct intel_context *ce;
> -	u16 num_siblings, idx;
> -	unsigned int n;
> -	int err;
> -
> -	if (!HAS_EXECLISTS(i915))
> -		return -ENODEV;
> -
> -	if (intel_uc_uses_guc_submission(&i915->gt.uc))
> -		return -ENODEV; /* not implement yet */
> -
> -	if (get_user(idx, &ext->engine_index))
> -		return -EFAULT;
> -
> -	if (idx >= set->engines->num_engines) {
> -		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
> -			idx, set->engines->num_engines);
> -		return -EINVAL;
> -	}
> -
> -	idx = array_index_nospec(idx, set->engines->num_engines);
> -	if (set->engines->engines[idx]) {
> -		drm_dbg(&i915->drm,
> -			"Invalid placement[%d], already occupied\n", idx);
> -		return -EEXIST;
> -	}
> -
> -	if (get_user(num_siblings, &ext->num_siblings))
> -		return -EFAULT;
> -
> -	err = check_user_mbz(&ext->flags);
> -	if (err)
> -		return err;
> -
> -	err = check_user_mbz(&ext->mbz64);
> -	if (err)
> -		return err;
> -
> -	siblings = stack;
> -	if (num_siblings > ARRAY_SIZE(stack)) {
> -		siblings = kmalloc_array(num_siblings,
> -					 sizeof(*siblings),
> -					 GFP_KERNEL);
> -		if (!siblings)
> -			return -ENOMEM;
> -	}
> -
> -	for (n = 0; n < num_siblings; n++) {
> -		struct i915_engine_class_instance ci;
> -
> -		if (copy_from_user(&ci, &ext->engines[n], sizeof(ci))) {
> -			err = -EFAULT;
> -			goto out_siblings;
> -		}
> -
> -		siblings[n] = intel_engine_lookup_user(i915,
> -						       ci.engine_class,
> -						       ci.engine_instance);
> -		if (!siblings[n]) {
> -			drm_dbg(&i915->drm,
> -				"Invalid sibling[%d]: { class:%d, inst:%d }\n",
> -				n, ci.engine_class, ci.engine_instance);
> -			err = -EINVAL;
> -			goto out_siblings;
> -		}
> -	}
> -
> -	ce = intel_execlists_create_virtual(siblings, n);
> -	if (IS_ERR(ce)) {
> -		err = PTR_ERR(ce);
> -		goto out_siblings;
> -	}
> -
> -	intel_context_set_gem(ce, set->ctx);
> -
> -	if (cmpxchg(&set->engines->engines[idx], NULL, ce)) {
> -		intel_context_put(ce);
> -		err = -EEXIST;
> -		goto out_siblings;
> -	}
> -
> -out_siblings:
> -	if (siblings != stack)
> -		kfree(siblings);
> -
> -	return err;
> -}
> -
> -static int
> -set_engines__bond(struct i915_user_extension __user *base, void *data)
> -{
> -	struct i915_context_engines_bond __user *ext =
> -		container_of_user(base, typeof(*ext), base);
> -	const struct set_engines *set = data;
> -	struct drm_i915_private *i915 = set->ctx->i915;
> -	struct i915_engine_class_instance ci;
> -	struct intel_engine_cs *virtual;
> -	struct intel_engine_cs *master;
> -	u16 idx, num_bonds;
> -	int err, n;
> -
> -	if (get_user(idx, &ext->virtual_index))
> -		return -EFAULT;
> -
> -	if (idx >= set->engines->num_engines) {
> -		drm_dbg(&i915->drm,
> -			"Invalid index for virtual engine: %d >= %d\n",
> -			idx, set->engines->num_engines);
> -		return -EINVAL;
> -	}
> -
> -	idx = array_index_nospec(idx, set->engines->num_engines);
> -	if (!set->engines->engines[idx]) {
> -		drm_dbg(&i915->drm, "Invalid engine at %d\n", idx);
> -		return -EINVAL;
> -	}
> -	virtual = set->engines->engines[idx]->engine;
> -
> -	if (intel_engine_is_virtual(virtual)) {
> -		drm_dbg(&i915->drm,
> -			"Bonding with virtual engines not allowed\n");
> -		return -EINVAL;
> -	}
> -
> -	err = check_user_mbz(&ext->flags);
> -	if (err)
> -		return err;
> -
> -	for (n = 0; n < ARRAY_SIZE(ext->mbz64); n++) {
> -		err = check_user_mbz(&ext->mbz64[n]);
> -		if (err)
> -			return err;
> -	}
> -
> -	if (copy_from_user(&ci, &ext->master, sizeof(ci)))
> -		return -EFAULT;
> -
> -	master = intel_engine_lookup_user(i915,
> -					  ci.engine_class, ci.engine_instance);
> -	if (!master) {
> -		drm_dbg(&i915->drm,
> -			"Unrecognised master engine: { class:%u, instance:%u }\n",
> -			ci.engine_class, ci.engine_instance);
> -		return -EINVAL;
> -	}
> -
> -	if (get_user(num_bonds, &ext->num_bonds))
> -		return -EFAULT;
> -
> -	for (n = 0; n < num_bonds; n++) {
> -		struct intel_engine_cs *bond;
> -
> -		if (copy_from_user(&ci, &ext->engines[n], sizeof(ci)))
> -			return -EFAULT;
> -
> -		bond = intel_engine_lookup_user(i915,
> -						ci.engine_class,
> -						ci.engine_instance);
> -		if (!bond) {
> -			drm_dbg(&i915->drm,
> -				"Unrecognised engine[%d] for bonding: { class:%d, instance: %d }\n",
> -				n, ci.engine_class, ci.engine_instance);
> -			return -EINVAL;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
> -static const i915_user_extension_fn set_engines__extensions[] = {
> -	[I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE] = set_engines__load_balance,
> -	[I915_CONTEXT_ENGINES_EXT_BOND] = set_engines__bond,
> -};
> -
> -static int
> -set_engines(struct i915_gem_context *ctx,
> -	    const struct drm_i915_gem_context_param *args)
> -{
> -	struct drm_i915_private *i915 = ctx->i915;
> -	struct i915_context_param_engines __user *user =
> -		u64_to_user_ptr(args->value);
> -	struct set_engines set = { .ctx = ctx };
> -	unsigned int num_engines, n;
> -	u64 extensions;
> -	int err;
> -
> -	if (!args->size) { /* switch back to legacy user_ring_map */
> -		if (!i915_gem_context_user_engines(ctx))
> -			return 0;
> -
> -		set.engines = default_engines(ctx);
> -		if (IS_ERR(set.engines))
> -			return PTR_ERR(set.engines);
> -
> -		goto replace;
> -	}
> -
> -	BUILD_BUG_ON(!IS_ALIGNED(sizeof(*user), sizeof(*user->engines)));
> -	if (args->size < sizeof(*user) ||
> -	    !IS_ALIGNED(args->size, sizeof(*user->engines))) {
> -		drm_dbg(&i915->drm, "Invalid size for engine array: %d\n",
> -			args->size);
> -		return -EINVAL;
> -	}
> -
> -	num_engines = (args->size - sizeof(*user)) / sizeof(*user->engines);
> -	if (num_engines > I915_EXEC_RING_MASK + 1)
> -		return -EINVAL;
> -
> -	set.engines = alloc_engines(num_engines);
> -	if (!set.engines)
> -		return -ENOMEM;
> -
> -	for (n = 0; n < num_engines; n++) {
> -		struct i915_engine_class_instance ci;
> -		struct intel_engine_cs *engine;
> -		struct intel_context *ce;
> -
> -		if (copy_from_user(&ci, &user->engines[n], sizeof(ci))) {
> -			__free_engines(set.engines, n);
> -			return -EFAULT;
> -		}
> -
> -		if (ci.engine_class == (u16)I915_ENGINE_CLASS_INVALID &&
> -		    ci.engine_instance == (u16)I915_ENGINE_CLASS_INVALID_NONE) {
> -			set.engines->engines[n] = NULL;
> -			continue;
> -		}
> -
> -		engine = intel_engine_lookup_user(ctx->i915,
> -						  ci.engine_class,
> -						  ci.engine_instance);
> -		if (!engine) {
> -			drm_dbg(&i915->drm,
> -				"Invalid engine[%d]: { class:%d, instance:%d }\n",
> -				n, ci.engine_class, ci.engine_instance);
> -			__free_engines(set.engines, n);
> -			return -ENOENT;
> -		}
> -
> -		ce = intel_context_create(engine);
> -		if (IS_ERR(ce)) {
> -			__free_engines(set.engines, n);
> -			return PTR_ERR(ce);
> -		}
> -
> -		intel_context_set_gem(ce, ctx);
> -
> -		set.engines->engines[n] = ce;
> -	}
> -	set.engines->num_engines = num_engines;
> -
> -	err = -EFAULT;
> -	if (!get_user(extensions, &user->extensions))
> -		err = i915_user_extensions(u64_to_user_ptr(extensions),
> -					   set_engines__extensions,
> -					   ARRAY_SIZE(set_engines__extensions),
> -					   &set);
> -	if (err) {
> -		free_engines(set.engines);
> -		return err;
> -	}
> -
> -replace:
> -	mutex_lock(&ctx->engines_mutex);
> -	if (i915_gem_context_is_closed(ctx)) {
> -		mutex_unlock(&ctx->engines_mutex);
> -		free_engines(set.engines);
> -		return -ENOENT;
> -	}
> -	if (args->size)
> -		i915_gem_context_set_user_engines(ctx);
> -	else
> -		i915_gem_context_clear_user_engines(ctx);
> -	set.engines = rcu_replace_pointer(ctx->engines, set.engines, 1);
> -	mutex_unlock(&ctx->engines_mutex);
> -
> -	/* Keep track of old engine sets for kill_context() */
> -	engines_idle_release(ctx, set.engines);
> -
> -	return 0;
> -}
> -
>  static int
>  set_persistence(struct i915_gem_context *ctx,
>  		const struct drm_i915_gem_context_param *args)
> @@ -2101,10 +1804,6 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
>  		ret = set_sseu(ctx, args);
>  		break;
>  
> -	case I915_CONTEXT_PARAM_ENGINES:
> -		ret = set_engines(ctx, args);
> -		break;
> -
>  	case I915_CONTEXT_PARAM_PERSISTENCE:
>  		ret = set_persistence(ctx, args);
>  		break;
> -- 
> 2.31.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
