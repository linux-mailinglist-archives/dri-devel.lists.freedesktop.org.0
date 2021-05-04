Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E463731A9
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 22:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0599389D58;
	Tue,  4 May 2021 20:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99F56E30C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 20:53:07 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id m12so15304275eja.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 13:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Mjkb7vkaqOcXvNoLY5WVJ4MCbrAwohXfeOtsq0uJctc=;
 b=kdy9Cm/XQoWx03LPct2eoBjlxEGirlUTD5jdML+EsZWHuv6Z0aKUZ5V2Yx0eebxtQE
 yVKNtXROMiO/uD1daSQnF0FU4/3bGoaIzruvjdkuvT+F1/B8C6cSCMdmQseBsQUCdBea
 xTKytqwxS3PWAy5efa8XhQ6035ehYwguXz9iM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Mjkb7vkaqOcXvNoLY5WVJ4MCbrAwohXfeOtsq0uJctc=;
 b=JVsxzU9z7G9gMV+ralAaLV7iRFlVp5yj1XwM2pXTBNrFEdaPylOWKyO6IXN+YWUots
 xZgzCiPgLt7iBm4o4SFlEOcLIUpa3rsoBxwyGyM53Vp2hppycM/s2vN0NNh3DIUnDqyi
 Rly3LNmhnrk8F8qiLV4cK/AxgNfROG5la3FmIHgOWLKWBHiYjL0wfvapeZTedEJrrgES
 d0NgGaZPVANQvaYV7SaDE6WhZdleZFNE7IeQsS7hCDAod03BBx3BG0m5vy4e3wABq7nt
 dK+6cPsUoK+7zUOBLvr3pGAtucfWl6M6gls7RqYzWCUr+AFT7KkmnGl1Ua8O4uI+hTac
 1/rQ==
X-Gm-Message-State: AOAM532S8/4FS47so16sqAwt6zqH/uaZHDAXzUoVHi4RIS/vYulLBlqf
 Fs/b7Ry37dNwYo9nCqIOxiAhRw==
X-Google-Smtp-Source: ABdhPJzzK7SDaLqA35TAwCjANjXM6HxOdkR/6m+tmTu2ZKSHZKi8zGPBboiyhPzUgOLdipiR1KPjQw==
X-Received: by 2002:a17:906:8147:: with SMTP id
 z7mr19790329ejw.496.1620161586189; 
 Tue, 04 May 2021 13:53:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w21sm14611111edq.82.2021.05.04.13.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 13:53:05 -0700 (PDT)
Date: Tue, 4 May 2021 22:53:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 22/27] drm/i915/gem: Delay context creation
Message-ID: <YJG0L+Zhg9TcJpr8@phenom.ffwll.local>
References: <20210503155748.1961781-1-jason@jlekstrand.net>
 <20210503155748.1961781-23-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503155748.1961781-23-jason@jlekstrand.net>
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

On Mon, May 03, 2021 at 10:57:43AM -0500, Jason Ekstrand wrote:
> The current context uAPI allows for two methods of setting context
> parameters: SET_CONTEXT_PARAM and CONTEXT_CREATE_EXT_SETPARAM.  The
> former is allowed to be called at any time while the later happens as
> part of GEM_CONTEXT_CREATE.  Currently, everything settable via one is
> settable via the other.  While some params are fairly simple and setting
> them on a live context is harmless such the context priority, others are
> far trickier such as the VM or the set of engines.  In order to swap out
> the VM, for instance, we have to delay until all current in-flight work
> is complete, swap in the new VM, and then continue.  This leads to a
> plethora of potential race conditions we'd really rather avoid.
> 
> In previous patches, we added a i915_gem_proto_context struct which is
> capable of storing and tracking all such create parameters.  This commit
> delays the creation of the actual context until after the client is done
> configuring it with SET_CONTEXT_PARAM.  From the perspective of the
> client, it has the same u32 context ID the whole time.  From the
> perspective of i915, however, it's an i915_gem_proto_context right up
> until the point where we attempt to do something which the proto-context
> can't handle at which point the real context gets created.
> 
> This is accomplished via a little xarray dance.  When GEM_CONTEXT_CREATE
> is called, we create a proto-context, reserve a slot in context_xa but
> leave it NULL, the proto-context in the corresponding slot in
> proto_context_xa.  Then, whenever we go to look up a context, we first
> check context_xa.  If it's there, we return the i915_gem_context and
> we're done.  If it's not, we look in proto_context_xa and, if we find it
> there, we create the actual context and kill the proto-context.
> 
> In order for this dance to work properly, everything which ever touches
> a proto-context is guarded by drm_i915_file_private::proto_context_lock,
> including context creation.  Yes, this means context creation now takes
> a giant global lock but it can't really be helped and that should never
> be on any driver's fast-path anyway.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 211 ++++++++++++++----
>  drivers/gpu/drm/i915/gem/i915_gem_context.h   |   3 +
>  .../gpu/drm/i915/gem/i915_gem_context_types.h |  54 +++++
>  .../gpu/drm/i915/gem/selftests/mock_context.c |   5 +-
>  drivers/gpu/drm/i915/i915_drv.h               |  24 +-
>  5 files changed, 239 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 06d413eef01a3..f0e7ce6b979b4 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -292,6 +292,42 @@ proto_context_create(struct drm_i915_private *i915, unsigned int flags)
>  	return err;
>  }
>  
> +static int proto_context_register_locked(struct drm_i915_file_private *fpriv,
> +					 struct i915_gem_proto_context *pc,
> +					 u32 *id)
> +{
> +	int ret;
> +	void *old;
> +
> +	lockdep_assert_held(&fpriv->proto_context_lock);
> +
> +	ret = xa_alloc(&fpriv->context_xa, id, NULL, xa_limit_32b, GFP_KERNEL);
> +	if (ret)
> +		return ret;
> +
> +	old = xa_store(&fpriv->proto_context_xa, *id, pc, GFP_KERNEL);
> +	if (xa_is_err(old)) {
> +		xa_erase(&fpriv->context_xa, *id);
> +		return xa_err(old);
> +	}
> +	GEM_BUG_ON(old);

A bit brutal, since worst case we just leaked something. I'd only go with
WARN_ON. This isn't userspace, dying should be optional to make debugging
easier (paranoid people reboot the machine on both anyway).

> +
> +	return 0;
> +}
> +
> +static int proto_context_register(struct drm_i915_file_private *fpriv,
> +				  struct i915_gem_proto_context *pc,
> +				  u32 *id)
> +{
> +	int ret;
> +
> +	mutex_lock(&fpriv->proto_context_lock);
> +	ret = proto_context_register_locked(fpriv, pc, id);
> +	mutex_unlock(&fpriv->proto_context_lock);
> +
> +	return ret;
> +}
> +
>  static int set_proto_ctx_vm(struct drm_i915_file_private *fpriv,
>  			    struct i915_gem_proto_context *pc,
>  			    const struct drm_i915_gem_context_param *args)
> @@ -1452,12 +1488,12 @@ void i915_gem_init__contexts(struct drm_i915_private *i915)
>  	init_contexts(&i915->gem.contexts);
>  }
>  
> -static int gem_context_register(struct i915_gem_context *ctx,
> -				struct drm_i915_file_private *fpriv,
> -				u32 *id)
> +static void gem_context_register(struct i915_gem_context *ctx,
> +				 struct drm_i915_file_private *fpriv,
> +				 u32 id)
>  {
>  	struct drm_i915_private *i915 = ctx->i915;
> -	int ret;
> +	void *old;
>  
>  	ctx->file_priv = fpriv;
>  
> @@ -1466,19 +1502,12 @@ static int gem_context_register(struct i915_gem_context *ctx,
>  		 current->comm, pid_nr(ctx->pid));
>  
>  	/* And finally expose ourselves to userspace via the idr */
> -	ret = xa_alloc(&fpriv->context_xa, id, ctx, xa_limit_32b, GFP_KERNEL);
> -	if (ret)
> -		goto err_pid;
> +	old = xa_store(&fpriv->context_xa, id, ctx, GFP_KERNEL);
> +	GEM_BUG_ON(old);

Same here about WARN_ON preferred.

Also this can actually happen if you race and don't hold
proto_context_lock sufficiently, so another lockdep_assert_held for this
function would be good I think.

Otoh if that means too much fake lock taking in like context_open then
maybe let's not do the lockdep_assert_held but instead perhaps a comment?
Or maybe do the lockdep_assert_held for id != 0 only.


>  
>  	spin_lock(&i915->gem.contexts.lock);
>  	list_add_tail(&ctx->link, &i915->gem.contexts.list);
>  	spin_unlock(&i915->gem.contexts.lock);
> -
> -	return 0;
> -
> -err_pid:
> -	put_pid(fetch_and_zero(&ctx->pid));
> -	return ret;
>  }
>  
>  int i915_gem_context_open(struct drm_i915_private *i915,
> @@ -1488,9 +1517,12 @@ int i915_gem_context_open(struct drm_i915_private *i915,
>  	struct i915_gem_proto_context *pc;
>  	struct i915_gem_context *ctx;
>  	int err;
> -	u32 id;
>  
> -	xa_init_flags(&file_priv->context_xa, XA_FLAGS_ALLOC);
> +	mutex_init(&file_priv->proto_context_lock);
> +	xa_init_flags(&file_priv->proto_context_xa, XA_FLAGS_ALLOC);
> +
> +	/* 0 reserved for the default context */
> +	xa_init_flags(&file_priv->context_xa, XA_FLAGS_ALLOC1);
>  
>  	/* 0 reserved for invalid/unassigned ppgtt */
>  	xa_init_flags(&file_priv->vm_xa, XA_FLAGS_ALLOC1);
> @@ -1508,28 +1540,31 @@ int i915_gem_context_open(struct drm_i915_private *i915,
>  		goto err;
>  	}
>  
> -	err = gem_context_register(ctx, file_priv, &id);
> -	if (err < 0)
> -		goto err_ctx;
> +	gem_context_register(ctx, file_priv, 0);
>  
> -	GEM_BUG_ON(id);
>  	return 0;
>  
> -err_ctx:
> -	context_close(ctx);
>  err:
>  	xa_destroy(&file_priv->vm_xa);
>  	xa_destroy(&file_priv->context_xa);
> +	xa_destroy(&file_priv->proto_context_xa);
> +	mutex_destroy(&file_priv->proto_context_lock);
>  	return err;
>  }
>  
>  void i915_gem_context_close(struct drm_file *file)
>  {
>  	struct drm_i915_file_private *file_priv = file->driver_priv;
> +	struct i915_gem_proto_context *pc;
>  	struct i915_address_space *vm;
>  	struct i915_gem_context *ctx;
>  	unsigned long idx;
>  
> +	xa_for_each(&file_priv->proto_context_xa, idx, pc)
> +		proto_context_close(pc);
> +	xa_destroy(&file_priv->proto_context_xa);
> +	mutex_destroy(&file_priv->proto_context_lock);
> +
>  	xa_for_each(&file_priv->context_xa, idx, ctx)
>  		context_close(ctx);
>  	xa_destroy(&file_priv->context_xa);
> @@ -2490,12 +2525,73 @@ static bool client_is_banned(struct drm_i915_file_private *file_priv)
>  	return atomic_read(&file_priv->ban_score) >= I915_CLIENT_SCORE_BANNED;
>  }
>  
> +static inline struct i915_gem_context *
> +__context_lookup(struct drm_i915_file_private *file_priv, u32 id)
> +{
> +	struct i915_gem_context *ctx;
> +
> +	rcu_read_lock();
> +	ctx = xa_load(&file_priv->context_xa, id);
> +	if (ctx && !kref_get_unless_zero(&ctx->ref))
> +		ctx = NULL;
> +	rcu_read_unlock();
> +
> +	return ctx;
> +}
> +
> +struct i915_gem_context *
> +lazy_create_context_locked(struct drm_i915_file_private *file_priv,
> +			   struct i915_gem_proto_context *pc, u32 id)
> +{
> +	struct i915_gem_context *ctx;
> +	void *old;
> +
> +	lockdep_assert_held(&file_priv->proto_context_lock);
> +
> +	ctx = i915_gem_create_context(file_priv->dev_priv, pc);
> +	if (IS_ERR(ctx))
> +		return ctx;
> +
> +	gem_context_register(ctx, file_priv, id);
> +
> +	old = xa_erase(&file_priv->proto_context_xa, id);
> +	GEM_BUG_ON(old != pc);
> +	proto_context_close(pc);
> +
> +	/* One for the xarray and one for the caller */
> +	return i915_gem_context_get(ctx);
> +}
> +
> +struct i915_gem_context *
> +i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
> +{
> +	struct i915_gem_proto_context *pc;
> +	struct i915_gem_context *ctx;
> +
> +	ctx = __context_lookup(file_priv, id);
> +	if (ctx)
> +		return ctx;
> +
> +	mutex_lock(&file_priv->proto_context_lock);
> +	/* Try one more time under the lock */
> +	ctx = __context_lookup(file_priv, id);
> +	if (!ctx) {
> +		pc = xa_load(&file_priv->proto_context_xa, id);
> +		if (!pc)
> +			ctx = ERR_PTR(-ENOENT);
> +		else
> +			ctx = lazy_create_context_locked(file_priv, pc, id);
> +	}
> +	mutex_unlock(&file_priv->proto_context_lock);
> +
> +	return ctx;
> +}
> +
>  int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
>  				  struct drm_file *file)
>  {
>  	struct drm_i915_private *i915 = to_i915(dev);
>  	struct drm_i915_gem_context_create_ext *args = data;
> -	struct i915_gem_context *ctx;
>  	struct create_ext ext_data;
>  	int ret;
>  	u32 id;
> @@ -2527,28 +2623,21 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
>  					   create_extensions,
>  					   ARRAY_SIZE(create_extensions),
>  					   &ext_data);
> -		if (ret) {
> -			proto_context_close(ext_data.pc);
> -			return ret;
> -		}
> +		if (ret)
> +			goto err_pc;
>  	}
>  
> -	ctx = i915_gem_create_context(i915, ext_data.pc);
> -	proto_context_close(ext_data.pc);
> -	if (IS_ERR(ctx))
> -		return PTR_ERR(ctx);
> -
> -	ret = gem_context_register(ctx, ext_data.fpriv, &id);
> +	ret = proto_context_register(ext_data.fpriv, ext_data.pc, &id);
>  	if (ret < 0)
> -		goto err_ctx;
> +		goto err_pc;
>  
>  	args->ctx_id = id;
>  	drm_dbg(&i915->drm, "HW context %d created\n", args->ctx_id);
>  
>  	return 0;
>  
> -err_ctx:
> -	context_close(ctx);
> +err_pc:
> +	proto_context_close(ext_data.pc);
>  	return ret;
>  }
>  
> @@ -2557,6 +2646,7 @@ int i915_gem_context_destroy_ioctl(struct drm_device *dev, void *data,
>  {
>  	struct drm_i915_gem_context_destroy *args = data;
>  	struct drm_i915_file_private *file_priv = file->driver_priv;
> +	struct i915_gem_proto_context *pc;
>  	struct i915_gem_context *ctx;
>  
>  	if (args->pad != 0)
> @@ -2565,11 +2655,21 @@ int i915_gem_context_destroy_ioctl(struct drm_device *dev, void *data,
>  	if (!args->ctx_id)
>  		return -ENOENT;
>  
> +	mutex_lock(&file_priv->proto_context_lock);
>  	ctx = xa_erase(&file_priv->context_xa, args->ctx_id);
> -	if (!ctx)
> +	pc = xa_erase(&file_priv->proto_context_xa, args->ctx_id);
> +	mutex_unlock(&file_priv->proto_context_lock);
> +
> +	if (!ctx && !pc)
>  		return -ENOENT;
> +	GEM_WARN_ON(ctx && pc);
> +
> +	if (pc)
> +		proto_context_close(pc);
> +
> +	if (ctx)
> +		context_close(ctx);
>  
> -	context_close(ctx);
>  	return 0;
>  }
>  
> @@ -2702,16 +2802,41 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
>  {
>  	struct drm_i915_file_private *file_priv = file->driver_priv;
>  	struct drm_i915_gem_context_param *args = data;
> +	struct i915_gem_proto_context *pc;
>  	struct i915_gem_context *ctx;
> -	int ret;
> +	int ret = 0;
>  
> -	ctx = i915_gem_context_lookup(file_priv, args->ctx_id);
> -	if (IS_ERR(ctx))
> -		return PTR_ERR(ctx);
> +	ctx = __context_lookup(file_priv, args->ctx_id);
> +	if (ctx)
> +		goto set_ctx_param;
>  
> -	ret = ctx_setparam(file_priv, ctx, args);
> +	mutex_lock(&file_priv->proto_context_lock);
> +	ctx = __context_lookup(file_priv, args->ctx_id);
> +	if (ctx)
> +		goto unlock;
> +
> +	pc = xa_load(&file_priv->proto_context_xa, args->ctx_id);
> +	if (!pc) {
> +		ret = -ENOENT;
> +		goto unlock;
> +	}
> +
> +	/* FIXME: We should consider disallowing SET_CONTEXT_PARAM for most
> +	 * things on future platforms.  Clients should be using
> +	 * CONTEXT_CREATE_EXT_PARAM instead.
> +	 */
> +	ret = set_proto_ctx_param(file_priv, pc, args);
> +
> +unlock:
> +	mutex_unlock(&file_priv->proto_context_lock);
> +
> +set_ctx_param:
> +	if (!ret && ctx)
> +		ret = ctx_setparam(file_priv, ctx, args);
> +
> +	if (ctx)
> +		i915_gem_context_put(ctx);
>  
> -	i915_gem_context_put(ctx);
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> index b5c908f3f4f22..20411db84914a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> @@ -133,6 +133,9 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
>  int i915_gem_context_reset_stats_ioctl(struct drm_device *dev, void *data,
>  				       struct drm_file *file);
>  
> +struct i915_gem_context *
> +i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id);
> +
>  static inline struct i915_gem_context *
>  i915_gem_context_get(struct i915_gem_context *ctx)
>  {
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> index 2ac341f805c8f..b673061f4f5ba 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> @@ -122,6 +122,60 @@ struct i915_gem_proto_engine {
>   * an i915_gem_context.  This is used to gather parameters provided either
>   * through creation flags or via SET_CONTEXT_PARAM so that, when we create
>   * the final i915_gem_context, those parameters can be immutable.
> + *
> + * The context uAPI allows for two methods of setting context parameters:
> + * SET_CONTEXT_PARAM and CONTEXT_CREATE_EXT_SETPARAM.  The former is
> + * allowed to be called at any time while the later happens as part of
> + * GEM_CONTEXT_CREATE.  When these were initially added, Currently,

							    ^ lowercase

> + * everything settable via one is settable via the other.  While some
> + * params are fairly simple and setting them on a live context is harmless
> + * such the context priority, others are far trickier such as the VM or the

      such _as_ 

> + * set of engines.  To avoid some truly nasty race conditions, we don't
> + * allow setting the VM or the set of engines on live contexts.
> + *
> + * The way we dealt with this without breaking older userspace that sets
> + * the VM or engine set via SET_CONTEXT_PARAM is to delay the creation of
> + * the actual context until after the client is done configuring it with
> + * SET_CONTEXT_PARAM.  From the perspective of the client, it has the same
> + * u32 context ID the whole time.  From the perspective of i915, however,
> + * it's an i915_gem_proto_context right up until the point where we attempt
> + * to do something which the proto-context can't handle at which point the
> + * real context gets created.
> + *
> + * This is accomplished via a little xarray dance.  When GEM_CONTEXT_CREATE
> + * is called, we create a proto-context, reserve a slot in context_xa but
> + * leave it NULL, the proto-context in the corresponding slot in
> + * proto_context_xa.  Then, whenever we go to look up a context, we first
> + * check context_xa.  If it's there, we return the i915_gem_context and
> + * we're done.  If it's not, we look in proto_context_xa and, if we find it
> + * there, we create the actual context and kill the proto-context.

Maybe stuff this into the kerneldoc for the lookup function and just put a
pointer to that in here instead? It hyperlinks in the html output, and in
the text you can follow with cscope or similar. And it's closer to where
the future devs probably need that information.

Minimally at least reference the lookup function here for that link
goodness :-)

> + *
> + * At the time we made this change (April, 2021), we did a fairly complete

s/fairly//

We might have screwed up, but we don't aim to break uapi with
intentionally sloppy work :-P

> + * audit of existing userspace to ensure this wouldn't break anything:
> + *
> + *  - Mesa/i965 didn't use the engines or VM APIs at all
> + *
> + *  - Mesa/ANV used the engines API but via CONTEXT_CREATE_EXT_SETPARAM and
> + *    didn't use the VM API.
> + *
> + *  - Mesa/iris didn't use the engines or VM APIs at all
> + *
> + *  - The open-source compute-runtime didn't yet use the engines API but
> + *    did use the VM API via SET_CONTEXT_PARAM.  However, CONTEXT_SETPARAM
> + *    was always the second ioctl on that context, immediately following
> + *    GEM_CONTEXT_CREATE.
> + *
> + *  - The media driver sets engines and bonding/balancing via
> + *    SET_CONTEXT_PARAM.  However, CONTEXT_SETPARAM to set the VM was
> + *    always the second ioctl on that context, immediately following
> + *    GEM_CONTEXT_CREATE and setting engines immediately followed that.
> + *
> + * In order for this dance to work properly, any modification to an
> + * i915_gem_proto_context that is exposed to the client via
> + * drm_i915_file_private::proto_context_xa must be guarded by
> + * drm_i915_file_private::proto_context_lock.  The exception is when a
> + * proto-context has not yet been exposed such as when handling
> + * CONTEXT_CREATE_SET_PARAM during GEM_CONTEXT_CREATE.
>   */
>  struct i915_gem_proto_context {
>  	/** @vm: See i915_gem_context::vm */
> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> index cbeefd060e97b..61aaac4a334cf 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> @@ -81,6 +81,7 @@ void mock_init_contexts(struct drm_i915_private *i915)
>  struct i915_gem_context *
>  live_context(struct drm_i915_private *i915, struct file *file)
>  {
> +	struct drm_i915_file_private *fpriv = to_drm_file(file)->driver_priv;
>  	struct i915_gem_proto_context *pc;
>  	struct i915_gem_context *ctx;
>  	int err;
> @@ -97,10 +98,12 @@ live_context(struct drm_i915_private *i915, struct file *file)
>  
>  	i915_gem_context_set_no_error_capture(ctx);
>  
> -	err = gem_context_register(ctx, to_drm_file(file)->driver_priv, &id);
> +	err = xa_alloc(&fpriv->context_xa, &id, NULL, xa_limit_32b, GFP_KERNEL);
>  	if (err < 0)
>  		goto err_ctx;
>  
> +	gem_context_register(ctx, fpriv, id);
> +
>  	return ctx;
>  
>  err_ctx:
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 004ed0e59c999..2b323b986dbab 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -200,6 +200,16 @@ struct drm_i915_file_private {
>  		struct rcu_head rcu;
>  	};
>  
> +	/** @proto_context_lock: Guards all i915_gem_proto_context operations

For multi-line kerneldoc we generally put a newline after /**\n I didn't
even know this parses :-) The single-line variant is kinda special.

> +	 *
> +	 * See i915_gem_proto_context.
> +	 */
> +	struct mutex proto_context_lock;
> +
> +	/** @proto_context_xa: xarray of i915_gem_proto_context */
> +	struct xarray proto_context_xa;
> +
> +	/** @context_xa: xarray of fully created i915_gem_context */
>  	struct xarray context_xa;
>  	struct xarray vm_xa;
>  
> @@ -1840,20 +1850,6 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
>  
>  struct dma_buf *i915_gem_prime_export(struct drm_gem_object *gem_obj, int flags);
>  
> -static inline struct i915_gem_context *
> -i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
> -{
> -	struct i915_gem_context *ctx;
> -
> -	rcu_read_lock();
> -	ctx = xa_load(&file_priv->context_xa, id);
> -	if (ctx && !kref_get_unless_zero(&ctx->ref))
> -		ctx = NULL;
> -	rcu_read_unlock();
> -
> -	return ctx ? ctx : ERR_PTR(-ENOENT);
> -}
> -
>  /* i915_gem_evict.c */
>  int __must_check i915_gem_evict_something(struct i915_address_space *vm,
>  					  u64 min_size, u64 alignment,

All I could find was bikesheds to bring to this party.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> -- 
> 2.31.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
