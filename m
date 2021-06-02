Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F0739961D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 00:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7736E441;
	Wed,  2 Jun 2021 22:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F190B6E441
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 22:55:56 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id b13so6107649ybk.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 15:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lJXhXSRoFwOMg8mhbx4vTsePBOk0RICgBQ2LIg1Pb98=;
 b=U2CmfWNMD5ilNuBUUcu5X61rqfrLyJVUwiGlb3HYlgaXVN13m/XKWAIFKh/spQYEbw
 1/oWkNkTwOOMtCW7OP3xzarJqnNsObULHZMA32QxCtUnCKg2uWi3nxUtyBENH8uZ5Jlb
 AKVZYJIsp46hr7YrLKgN6za6m9BS7MjWaDGtbV27QlkQdjMNS9TqxVbeDzZT8TmdyxWn
 l9YjnHyssp+EYnDNFw5wih7EwdxuUrSiFK++xq5y+71WWYmQG9slbvoJ7KWkx9nuUP65
 RSRMbLF5ADxq6ysiv+6U9oHXe8iX1TBAH6IduyOVAWGWNEWzvw8msz8F1esxuNIskEHs
 vK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lJXhXSRoFwOMg8mhbx4vTsePBOk0RICgBQ2LIg1Pb98=;
 b=MLPBVgD/5Q5umdENlL/gXx2cMMfOFSv3I3+EFdI4DwWiIi/EyyqBHx4UwgAToMEQ6b
 U/7+dJ2+vLADikQRWdidmttCu4r3ZZjkWI64iM12UOQzoTp/fLW5LZma+MXSnPVje6/X
 rUq5c25Lvkg7OzutPhCGeYFe0+ceW9PdyJUttVcDnkj+QJm4p8SQgvP3WUxGl3Clv7pw
 wEgLIqYA48tgjpvwmTZD6kJVJfefNzhzl4WmI1ypx+s78mZimzIAblSDM1hYhXu+uwVH
 VT6B0MoVktJHvofzKl0UzbJVgENBko63akJhovP3moM7IAcvIAchuHZ4qQhFCj7GA5fy
 kuHQ==
X-Gm-Message-State: AOAM531UcJqAWfG56O3YD8/Rx4SLdPlfr0nQV6aO5R5WWrHcdVldzoT4
 QTRlriS0j5JuU/erD7b5EoAYS4G99B694A9ZfVd7T9B5ldk=
X-Google-Smtp-Source: ABdhPJwf5YcWe2bksDbpI2ZyJu/ktUrkn5ulmmlLfrRtLwZnkdFwoxtBy/GOKRO0lD+6bNzpjZUt/SLmC7PoG6ozEKc=
X-Received: by 2002:a25:208b:: with SMTP id
 g133mr47277517ybg.211.1622674555702; 
 Wed, 02 Jun 2021 15:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210527162650.1182544-1-jason@jlekstrand.net>
 <20210527162650.1182544-25-jason@jlekstrand.net>
 <YLSxdSTd9xl1c7hY@phenom.ffwll.local>
In-Reply-To: <YLSxdSTd9xl1c7hY@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 2 Jun 2021 17:55:44 -0500
Message-ID: <CAOFGe95Bgob9DJhfdrTV9SLSosRwSAfyYBKw6iGVXKzJywdKZA@mail.gmail.com>
Subject: Re: [PATCH 24/29] drm/i915/gem: Delay context creation
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 31, 2021 at 4:50 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, May 27, 2021 at 11:26:45AM -0500, Jason Ekstrand wrote:
> > The current context uAPI allows for two methods of setting context
> > parameters: SET_CONTEXT_PARAM and CONTEXT_CREATE_EXT_SETPARAM.  The
> > former is allowed to be called at any time while the later happens as
> > part of GEM_CONTEXT_CREATE.  Currently, everything settable via one is
> > settable via the other.  While some params are fairly simple and setting
> > them on a live context is harmless such the context priority, others are
>
> such _as_ the

Done.

> > far trickier such as the VM or the set of engines.  In order to swap out
> > the VM, for instance, we have to delay until all current in-flight work
> > is complete, swap in the new VM, and then continue.  This leads to a
> > plethora of potential race conditions we'd really rather avoid.
> >
> > In previous patches, we added a i915_gem_proto_context struct which is
> > capable of storing and tracking all such create parameters.  This commit
> > delays the creation of the actual context until after the client is done
> > configuring it with SET_CONTEXT_PARAM.  From the perspective of the
> > client, it has the same u32 context ID the whole time.  From the
> > perspective of i915, however, it's an i915_gem_proto_context right up
> > until the point where we attempt to do something which the proto-context
> > can't handle at which point the real context gets created.
>
> s/ at which point/. Then/
>
> At least feels a bit like a run-on sentence :-)

Done.

> > This is accomplished via a little xarray dance.  When GEM_CONTEXT_CREATE
> > is called, we create a proto-context, reserve a slot in context_xa but
> > leave it NULL, the proto-context in the corresponding slot in
> > proto_context_xa.  Then, whenever we go to look up a context, we first
> > check context_xa.  If it's there, we return the i915_gem_context and
> > we're done.  If it's not, we look in proto_context_xa and, if we find it
> > there, we create the actual context and kill the proto-context.
> >
> > In order for this dance to work properly, everything which ever touches
> > a proto-context is guarded by drm_i915_file_private::proto_context_lock,
> > including context creation.  Yes, this means context creation now takes
> > a giant global lock but it can't really be helped and that should never
> > be on any driver's fast-path anyway.
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 211 ++++++++++++++----
> >  drivers/gpu/drm/i915/gem/i915_gem_context.h   |   3 +
> >  .../gpu/drm/i915/gem/i915_gem_context_types.h |  54 +++++
> >  .../gpu/drm/i915/gem/selftests/mock_context.c |   5 +-
> >  drivers/gpu/drm/i915/i915_drv.h               |  24 +-
> >  5 files changed, 239 insertions(+), 58 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index 8288af0d33245..f7c83730ee07f 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -298,6 +298,42 @@ proto_context_create(struct drm_i915_private *i915, unsigned int flags)
> >       return err;
> >  }
> >
> > +static int proto_context_register_locked(struct drm_i915_file_private *fpriv,
> > +                                      struct i915_gem_proto_context *pc,
> > +                                      u32 *id)
> > +{
> > +     int ret;
> > +     void *old;
> > +
> > +     lockdep_assert_held(&fpriv->proto_context_lock);
> > +
> > +     ret = xa_alloc(&fpriv->context_xa, id, NULL, xa_limit_32b, GFP_KERNEL);
> > +     if (ret)
> > +             return ret;
> > +
> > +     old = xa_store(&fpriv->proto_context_xa, *id, pc, GFP_KERNEL);
> > +     if (xa_is_err(old)) {
> > +             xa_erase(&fpriv->context_xa, *id);
> > +             return xa_err(old);
> > +     }
> > +     GEM_BUG_ON(old);
>
> I'd go with WARN_ON here. We just leak, and BUG_ON kills the box.
> GEM_BUG_ON is for the additional gem consistency checks which are too
> expensive to have enabled in production. Registering a proto context isn't
> one of these things.

Done.

> > +
> > +     return 0;
> > +}
> > +
> > +static int proto_context_register(struct drm_i915_file_private *fpriv,
> > +                               struct i915_gem_proto_context *pc,
> > +                               u32 *id)
> > +{
> > +     int ret;
> > +
> > +     mutex_lock(&fpriv->proto_context_lock);
> > +     ret = proto_context_register_locked(fpriv, pc, id);
> > +     mutex_unlock(&fpriv->proto_context_lock);
> > +
> > +     return ret;
> > +}
> > +
> >  static int set_proto_ctx_vm(struct drm_i915_file_private *fpriv,
> >                           struct i915_gem_proto_context *pc,
> >                           const struct drm_i915_gem_context_param *args)
> > @@ -1448,12 +1484,12 @@ void i915_gem_init__contexts(struct drm_i915_private *i915)
> >       init_contexts(&i915->gem.contexts);
> >  }
> >
> > -static int gem_context_register(struct i915_gem_context *ctx,
> > -                             struct drm_i915_file_private *fpriv,
> > -                             u32 *id)
> > +static void gem_context_register(struct i915_gem_context *ctx,
> > +                              struct drm_i915_file_private *fpriv,
> > +                              u32 id)
> >  {
> >       struct drm_i915_private *i915 = ctx->i915;
> > -     int ret;
> > +     void *old;
> >
> >       ctx->file_priv = fpriv;
> >
> > @@ -1462,19 +1498,12 @@ static int gem_context_register(struct i915_gem_context *ctx,
> >                current->comm, pid_nr(ctx->pid));
> >
> >       /* And finally expose ourselves to userspace via the idr */
> > -     ret = xa_alloc(&fpriv->context_xa, id, ctx, xa_limit_32b, GFP_KERNEL);
> > -     if (ret)
> > -             goto err_pid;
> > +     old = xa_store(&fpriv->context_xa, id, ctx, GFP_KERNEL);
> > +     GEM_BUG_ON(old);
>
> Same song about WARN_ON here.

Yup.

> >
> >       spin_lock(&i915->gem.contexts.lock);
> >       list_add_tail(&ctx->link, &i915->gem.contexts.list);
> >       spin_unlock(&i915->gem.contexts.lock);
> > -
> > -     return 0;
> > -
> > -err_pid:
> > -     put_pid(fetch_and_zero(&ctx->pid));
> > -     return ret;
> >  }
> >
> >  int i915_gem_context_open(struct drm_i915_private *i915,
> > @@ -1484,9 +1513,12 @@ int i915_gem_context_open(struct drm_i915_private *i915,
> >       struct i915_gem_proto_context *pc;
> >       struct i915_gem_context *ctx;
> >       int err;
> > -     u32 id;
> >
> > -     xa_init_flags(&file_priv->context_xa, XA_FLAGS_ALLOC);
> > +     mutex_init(&file_priv->proto_context_lock);
> > +     xa_init_flags(&file_priv->proto_context_xa, XA_FLAGS_ALLOC);
> > +
> > +     /* 0 reserved for the default context */
> > +     xa_init_flags(&file_priv->context_xa, XA_FLAGS_ALLOC1);
> >
> >       /* 0 reserved for invalid/unassigned ppgtt */
> >       xa_init_flags(&file_priv->vm_xa, XA_FLAGS_ALLOC1);
> > @@ -1504,28 +1536,31 @@ int i915_gem_context_open(struct drm_i915_private *i915,
> >               goto err;
> >       }
> >
> > -     err = gem_context_register(ctx, file_priv, &id);
> > -     if (err < 0)
> > -             goto err_ctx;
> > +     gem_context_register(ctx, file_priv, 0);
> >
> > -     GEM_BUG_ON(id);
> >       return 0;
> >
> > -err_ctx:
> > -     context_close(ctx);
> >  err:
> >       xa_destroy(&file_priv->vm_xa);
> >       xa_destroy(&file_priv->context_xa);
> > +     xa_destroy(&file_priv->proto_context_xa);
> > +     mutex_destroy(&file_priv->proto_context_lock);
> >       return err;
> >  }
> >
> >  void i915_gem_context_close(struct drm_file *file)
> >  {
> >       struct drm_i915_file_private *file_priv = file->driver_priv;
> > +     struct i915_gem_proto_context *pc;
> >       struct i915_address_space *vm;
> >       struct i915_gem_context *ctx;
> >       unsigned long idx;
> >
> > +     xa_for_each(&file_priv->proto_context_xa, idx, pc)
> > +             proto_context_close(pc);
> > +     xa_destroy(&file_priv->proto_context_xa);
> > +     mutex_destroy(&file_priv->proto_context_lock);
> > +
> >       xa_for_each(&file_priv->context_xa, idx, ctx)
> >               context_close(ctx);
> >       xa_destroy(&file_priv->context_xa);
> > @@ -2480,12 +2515,73 @@ static bool client_is_banned(struct drm_i915_file_private *file_priv)
> >       return atomic_read(&file_priv->ban_score) >= I915_CLIENT_SCORE_BANNED;
> >  }
> >
> > +static inline struct i915_gem_context *
> > +__context_lookup(struct drm_i915_file_private *file_priv, u32 id)
> > +{
> > +     struct i915_gem_context *ctx;
> > +
> > +     rcu_read_lock();
> > +     ctx = xa_load(&file_priv->context_xa, id);
> > +     if (ctx && !kref_get_unless_zero(&ctx->ref))
> > +             ctx = NULL;
> > +     rcu_read_unlock();
> > +
> > +     return ctx;
> > +}
> > +
> > +struct i915_gem_context *
> > +lazy_create_context_locked(struct drm_i915_file_private *file_priv,
> > +                        struct i915_gem_proto_context *pc, u32 id)
>
> My bikeshed would call this finalize_create_context_locked or something
> like that ... At least I'm thinking of this more as "finializing the
> process of creating a context" and less of "creating context on-demand".
> The latter is e.g. what we're doing with the default engine set. Different
> beasts conceptually.

Fine with me.

> > +{
> > +     struct i915_gem_context *ctx;
> > +     void *old;
> > +
> > +     lockdep_assert_held(&file_priv->proto_context_lock);
> > +
> > +     ctx = i915_gem_create_context(file_priv->dev_priv, pc);
> > +     if (IS_ERR(ctx))
> > +             return ctx;
> > +
> > +     gem_context_register(ctx, file_priv, id);
> > +
> > +     old = xa_erase(&file_priv->proto_context_xa, id);
> > +     GEM_BUG_ON(old != pc);
> > +     proto_context_close(pc);
> > +
> > +     /* One for the xarray and one for the caller */
> > +     return i915_gem_context_get(ctx);
> > +}
> > +
> > +struct i915_gem_context *
> > +i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
> > +{
> > +     struct i915_gem_proto_context *pc;
> > +     struct i915_gem_context *ctx;
> > +
> > +     ctx = __context_lookup(file_priv, id);
> > +     if (ctx)
> > +             return ctx;
> > +
> > +     mutex_lock(&file_priv->proto_context_lock);
> > +     /* Try one more time under the lock */
> > +     ctx = __context_lookup(file_priv, id);
> > +     if (!ctx) {
> > +             pc = xa_load(&file_priv->proto_context_xa, id);
> > +             if (!pc)
> > +                     ctx = ERR_PTR(-ENOENT);
> > +             else
> > +                     ctx = lazy_create_context_locked(file_priv, pc, id);
> > +     }
> > +     mutex_unlock(&file_priv->proto_context_lock);
> > +
> > +     return ctx;
> > +}
> > +
> >  int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
> >                                 struct drm_file *file)
> >  {
> >       struct drm_i915_private *i915 = to_i915(dev);
> >       struct drm_i915_gem_context_create_ext *args = data;
> > -     struct i915_gem_context *ctx;
> >       struct create_ext ext_data;
> >       int ret;
> >       u32 id;
> > @@ -2517,28 +2613,21 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
> >                                          create_extensions,
> >                                          ARRAY_SIZE(create_extensions),
> >                                          &ext_data);
> > -             if (ret) {
> > -                     proto_context_close(ext_data.pc);
> > -                     return ret;
> > -             }
> > +             if (ret)
> > +                     goto err_pc;
> >       }
> >
> > -     ctx = i915_gem_create_context(i915, ext_data.pc);
> > -     proto_context_close(ext_data.pc);
> > -     if (IS_ERR(ctx))
> > -             return PTR_ERR(ctx);
> > -
> > -     ret = gem_context_register(ctx, ext_data.fpriv, &id);
> > +     ret = proto_context_register(ext_data.fpriv, ext_data.pc, &id);
> >       if (ret < 0)
> > -             goto err_ctx;
> > +             goto err_pc;
> >
> >       args->ctx_id = id;
> >       drm_dbg(&i915->drm, "HW context %d created\n", args->ctx_id);
> >
> >       return 0;
> >
> > -err_ctx:
> > -     context_close(ctx);
> > +err_pc:
> > +     proto_context_close(ext_data.pc);
> >       return ret;
> >  }
> >
> > @@ -2547,6 +2636,7 @@ int i915_gem_context_destroy_ioctl(struct drm_device *dev, void *data,
> >  {
> >       struct drm_i915_gem_context_destroy *args = data;
> >       struct drm_i915_file_private *file_priv = file->driver_priv;
> > +     struct i915_gem_proto_context *pc;
> >       struct i915_gem_context *ctx;
> >
> >       if (args->pad != 0)
> > @@ -2555,11 +2645,21 @@ int i915_gem_context_destroy_ioctl(struct drm_device *dev, void *data,
> >       if (!args->ctx_id)
> >               return -ENOENT;
> >
> > +     mutex_lock(&file_priv->proto_context_lock);
>
> I think a comment here that we need to hold the proto mutex even for
> finalized context to avoid races with finalization would be nice.

Added.

> >       ctx = xa_erase(&file_priv->context_xa, args->ctx_id);
> > -     if (!ctx)
> > +     pc = xa_erase(&file_priv->proto_context_xa, args->ctx_id);
> > +     mutex_unlock(&file_priv->proto_context_lock);
> > +
> > +     if (!ctx && !pc)
> >               return -ENOENT;
> > +     GEM_WARN_ON(ctx && pc);
> > +
> > +     if (pc)
> > +             proto_context_close(pc);
> > +
> > +     if (ctx)
> > +             context_close(ctx);
> >
> > -     context_close(ctx);
> >       return 0;
> >  }
> >
> > @@ -2692,16 +2792,41 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
> >  {
> >       struct drm_i915_file_private *file_priv = file->driver_priv;
> >       struct drm_i915_gem_context_param *args = data;
> > +     struct i915_gem_proto_context *pc;
> >       struct i915_gem_context *ctx;
> > -     int ret;
> > +     int ret = 0;
> >
> > -     ctx = i915_gem_context_lookup(file_priv, args->ctx_id);
> > -     if (IS_ERR(ctx))
> > -             return PTR_ERR(ctx);
> > +     ctx = __context_lookup(file_priv, args->ctx_id);
> > +     if (ctx)
> > +             goto set_ctx_param;
> >
> > -     ret = ctx_setparam(file_priv, ctx, args);
> > +     mutex_lock(&file_priv->proto_context_lock);
> > +     ctx = __context_lookup(file_priv, args->ctx_id);
>
> Not unconditionally taking the mutex here feels a bit like overkill? Do we
> really need that fast path?

Probably not.  If someone writes a setparam benchmark, I will actively not care.

> > +     if (ctx)
> > +             goto unlock;
> > +
> > +     pc = xa_load(&file_priv->proto_context_xa, args->ctx_id);
> > +     if (!pc) {
> > +             ret = -ENOENT;
> > +             goto unlock;
> > +     }
> > +
> > +     /* FIXME: We should consider disallowing SET_CONTEXT_PARAM for most
> > +      * things on future platforms.  Clients should be using
> > +      * CONTEXT_CREATE_EXT_PARAM instead.
> > +      */
>
> I think the way to do that is to finalize the context creation from
> CONTEXT_CREATE_EXT on these platforms. That plugs this hole for good and
> by design. Maybe on gen13+ or something like that. Or whatever it is we're
> using for enumerating generations now.

Yup.  I agree.  Do you want me to add that now?

> > +     ret = set_proto_ctx_param(file_priv, pc, args);
> > +
> > +unlock:
> > +     mutex_unlock(&file_priv->proto_context_lock);
> > +
> > +set_ctx_param:
> > +     if (!ret && ctx)
>
> I don't think you need to check for ret here? It's not set by any path
> leading to here where ctx != NULL.

I think

> Also mildly unhappy about the control flow here, we could simplify it if
> we don't do the lockless faspath.

Yeah, I think I've made it a lot better.  You may want to re-review on
the next go 'round though.

> > +             ret = ctx_setparam(file_priv, ctx, args);
> > +
> > +     if (ctx)
> > +             i915_gem_context_put(ctx);
> >
> > -     i915_gem_context_put(ctx);
> >       return ret;
> >  }
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> > index b5c908f3f4f22..20411db84914a 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> > @@ -133,6 +133,9 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
> >  int i915_gem_context_reset_stats_ioctl(struct drm_device *dev, void *data,
> >                                      struct drm_file *file);
> >
> > +struct i915_gem_context *
> > +i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id);
> > +
> >  static inline struct i915_gem_context *
> >  i915_gem_context_get(struct i915_gem_context *ctx)
> >  {
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > index 2ac341f805c8f..b673061f4f5ba 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > @@ -122,6 +122,60 @@ struct i915_gem_proto_engine {
> >   * an i915_gem_context.  This is used to gather parameters provided either
> >   * through creation flags or via SET_CONTEXT_PARAM so that, when we create
> >   * the final i915_gem_context, those parameters can be immutable.
> > + *
> > + * The context uAPI allows for two methods of setting context parameters:
> > + * SET_CONTEXT_PARAM and CONTEXT_CREATE_EXT_SETPARAM.  The former is
> > + * allowed to be called at any time while the later happens as part of
> > + * GEM_CONTEXT_CREATE.  When these were initially added, Currently,
> > + * everything settable via one is settable via the other.  While some
> > + * params are fairly simple and setting them on a live context is harmless
> > + * such the context priority, others are far trickier such as the VM or the
> > + * set of engines.  To avoid some truly nasty race conditions, we don't
> > + * allow setting the VM or the set of engines on live contexts.
> > + *
> > + * The way we dealt with this without breaking older userspace that sets
> > + * the VM or engine set via SET_CONTEXT_PARAM is to delay the creation of
> > + * the actual context until after the client is done configuring it with
> > + * SET_CONTEXT_PARAM.  From the perspective of the client, it has the same
> > + * u32 context ID the whole time.  From the perspective of i915, however,
> > + * it's an i915_gem_proto_context right up until the point where we attempt
> > + * to do something which the proto-context can't handle at which point the
> > + * real context gets created.
> > + *
> > + * This is accomplished via a little xarray dance.  When GEM_CONTEXT_CREATE
> > + * is called, we create a proto-context, reserve a slot in context_xa but
> > + * leave it NULL, the proto-context in the corresponding slot in
> > + * proto_context_xa.  Then, whenever we go to look up a context, we first
> > + * check context_xa.  If it's there, we return the i915_gem_context and
> > + * we're done.  If it's not, we look in proto_context_xa and, if we find it
> > + * there, we create the actual context and kill the proto-context.
> > + *
> > + * At the time we made this change (April, 2021), we did a fairly complete
> > + * audit of existing userspace to ensure this wouldn't break anything:
> > + *
> > + *  - Mesa/i965 didn't use the engines or VM APIs at all
> > + *
> > + *  - Mesa/ANV used the engines API but via CONTEXT_CREATE_EXT_SETPARAM and
> > + *    didn't use the VM API.
> > + *
> > + *  - Mesa/iris didn't use the engines or VM APIs at all
> > + *
> > + *  - The open-source compute-runtime didn't yet use the engines API but
> > + *    did use the VM API via SET_CONTEXT_PARAM.  However, CONTEXT_SETPARAM
> > + *    was always the second ioctl on that context, immediately following
> > + *    GEM_CONTEXT_CREATE.
> > + *
> > + *  - The media driver sets engines and bonding/balancing via
> > + *    SET_CONTEXT_PARAM.  However, CONTEXT_SETPARAM to set the VM was
> > + *    always the second ioctl on that context, immediately following
> > + *    GEM_CONTEXT_CREATE and setting engines immediately followed that.
> > + *
> > + * In order for this dance to work properly, any modification to an
> > + * i915_gem_proto_context that is exposed to the client via
> > + * drm_i915_file_private::proto_context_xa must be guarded by
> > + * drm_i915_file_private::proto_context_lock.  The exception is when a
> > + * proto-context has not yet been exposed such as when handling
> > + * CONTEXT_CREATE_SET_PARAM during GEM_CONTEXT_CREATE.
> >   */
> >  struct i915_gem_proto_context {
> >       /** @vm: See i915_gem_context::vm */
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> > index cbeefd060e97b..61aaac4a334cf 100644
> > --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> > +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> > @@ -81,6 +81,7 @@ void mock_init_contexts(struct drm_i915_private *i915)
> >  struct i915_gem_context *
> >  live_context(struct drm_i915_private *i915, struct file *file)
> >  {
> > +     struct drm_i915_file_private *fpriv = to_drm_file(file)->driver_priv;
> >       struct i915_gem_proto_context *pc;
> >       struct i915_gem_context *ctx;
> >       int err;
> > @@ -97,10 +98,12 @@ live_context(struct drm_i915_private *i915, struct file *file)
> >
> >       i915_gem_context_set_no_error_capture(ctx);
> >
> > -     err = gem_context_register(ctx, to_drm_file(file)->driver_priv, &id);
> > +     err = xa_alloc(&fpriv->context_xa, &id, NULL, xa_limit_32b, GFP_KERNEL);
> >       if (err < 0)
> >               goto err_ctx;
> >
> > +     gem_context_register(ctx, fpriv, id);
> > +
> >       return ctx;
> >
> >  err_ctx:
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > index d7bd732ceacfc..8b00292e1ae56 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/
> > @@ -201,6 +201,16 @@ struct drm_i915_file_private {
> >               struct rcu_head rcu;
> >       };
> >
> > +     /** @proto_context_lock: Guards all i915_gem_proto_context operations
> > +      *
> > +      * See i915_gem_proto_context.
>
> Please add locking rules here, like "This is always held whenever we
> manipulate any proto context, including finalizing it on first actual use
> of the GEM context".

Done.

> > +      */
> > +     struct mutex proto_context_lock;
> > +
> > +     /** @proto_context_xa: xarray of i915_gem_proto_context */
>
> Pls fix hyperlinks.
>
> Also please put your nice explainer from the commit message here ...

Done.

> > +     struct xarray proto_context_xa;
> > +
> > +     /** @context_xa: xarray of fully created i915_gem_context */
>
> ... and reference it with a "See @proto_context_xa" here.
>
> Maybe also reference i915_gem_context_lookup() from these so readers of
> the code can easily find all the pieces of this magic.

Done.

> Also mention here that write access to @context_xa is protected by
> @proto_context_lock. It must be held to avoid races with finalization of
> proto context in e.g. i915_gem_context_destroy_ioctl(), and this wasn't
> obvious to me at all.

Done.

>
> >       struct xarray context_xa;
> >       struct xarray vm_xa;
> >
> > @@ -1857,20 +1867,6 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
> >
> >  struct dma_buf *i915_gem_prime_export(struct drm_gem_object *gem_obj, int flags);
> >
> > -static inline struct i915_gem_context *
> > -i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
> > -{
> > -     struct i915_gem_context *ctx;
> > -
> > -     rcu_read_lock();
> > -     ctx = xa_load(&file_priv->context_xa, id);
> > -     if (ctx && !kref_get_unless_zero(&ctx->ref))
> > -             ctx = NULL;
> > -     rcu_read_unlock();
> > -
> > -     return ctx ? ctx : ERR_PTR(-ENOENT);
> > -}
> > -
> >  static inline struct i915_address_space *
> >  i915_gem_vm_lookup(struct drm_i915_file_private *file_priv, u32 id)
> >  {
> > --
> > 2.31.1
>
> Nothing big looks wrong, with the nits addressed:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

If you don't mind, I'd like you to look at the new set_param logic as
well as the added comments on the next go 'round.

--Jason

> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
