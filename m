Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C8065D7C5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6734110E44C;
	Wed,  4 Jan 2023 16:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F7710E0E9;
 Wed,  4 Jan 2023 16:02:03 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-150debe2b7cso4535576fac.0; 
 Wed, 04 Jan 2023 08:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dbxcoVY0DgdrSOX7d3aDUlP2o3UoN8oC3rIriS/EF0k=;
 b=XAfNJ97ImbinlKrs4QKgOorOx8RGUF+Ngf9LyhWkQWUDhWAvuapaA1UUIsFXzfh9Yv
 ZmS4edJqSKvuwb5q+6Uuz2bXuTIjPTDRPTdPNzBcWvWTm6vvdMSoIf+aY4DibI32DN5h
 NZbJA0mckrTltx5JWMsAAjS7CvGOecuovznudQai7fijXT97dTF01E4wd2L/SEuIlj4H
 gCzxn3gd1Et7U1bKR46Zpg/v4oV4Oz92Zr0r8gQCSaB7P+rBIwydqQh0nkM1Ne8NS0AA
 wrmTYu19MYTwMdVzD/lyjpMjIcX7H6EEu2nwlhr3mkhcfUhV1C8h/Zh6dl4KdYzu0tDB
 3J8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dbxcoVY0DgdrSOX7d3aDUlP2o3UoN8oC3rIriS/EF0k=;
 b=0a+p2Jz5jgCRglr2Abmr3yCyIJBmcViOrqZ1yXmuqQvJ97/w4rPUAIeYSVem/eK83p
 y+clVqwhsbVG5sR6vg0EH8cigbu87aT0NoYJN8Ve2mFZ+fqnKAtuHv3GcWFoIxHoDMsR
 31cauCU7hLiGcvZOzA+tSndcgJCtf0fId4z7xgUMAlZeIpJLNqIu+W3Do0oe8THEKo5n
 efDhnNzYVflfs37NXmPHQL56iYCtZzqFibaQvTnsYpbE78slTbbX1rSVkgmCsTfjVwxJ
 VZdYl7sOIkIWUxsZYquOEb8Bp+Hc585jKVlDO7MxsOUfqsyOTUJw8EY+AtfV2G1i+32i
 mZxg==
X-Gm-Message-State: AFqh2kq4I4Vf/zSoEyko7WgqjDDObGrGSzUNeKz6dpFbPR7gobdfKyWp
 tg4AwjMdcwTxKii275eEjXqwTOrXqsqqhz+lVIU=
X-Google-Smtp-Source: AMrXdXsnE2rqLOnlA12voGE1jLf9aVoj61EOCZjNmqtIdw+rdwolzvSJDAAQfS3bXEae+Oe+JWo+/SrX+CpQ7bBe1tc=
X-Received: by 2002:a05:6870:513:b0:13d:51fe:3404 with SMTP id
 j19-20020a056870051300b0013d51fe3404mr2830737oao.183.1672848122968; Wed, 04
 Jan 2023 08:02:02 -0800 (PST)
MIME-Version: 1.0
References: <20230103234948.1218393-1-robdclark@gmail.com>
 <04ec647c-184e-942e-a7ed-4ba393e591b7@linux.intel.com>
In-Reply-To: <04ec647c-184e-942e-a7ed-4ba393e591b7@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 4 Jan 2023 08:01:51 -0800
Message-ID: <CAF6AEGvjMhMngXBj=r9SkRwFinO6C_BzoZRadL2HuzjWZsEw3w@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Fix potential context UAFs
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost <matthew.brost@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "open list:INTEL DRM DRIVERS" <intel-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@intel.com>, katrinzhou <katrinzhou@tencent.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 4, 2023 at 1:34 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 03/01/2023 23:49, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > gem_context_register() makes the context visible to userspace, and whic=
h
> > point a separate thread can trigger the I915_GEM_CONTEXT_DESTROY ioctl.
> > So we need to ensure that nothing uses the ctx ptr after this.  And we
> > need to ensure that adding the ctx to the xarray is the *last* thing
> > that gem_context_register() does with the ctx pointer.
>
> Any backtraces from oopses or notes on how it was found to record in the =
commit message?

It was a UAF bug that was reported to us

https://bugs.chromium.org/p/chromium/issues/detail?id=3D1401594 (but I
guess security bugs are not going to be visible)

>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Fixes: a4c1cdd34e2c ("drm/i915/gem: Delay context creation (v3)")
> References: 3aa9945a528e ("drm/i915: Separate GEM context construction an=
d registration to userspace")
> Cc: <stable@vger.kernel.org> # v5.15+
>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_context.c | 24 +++++++++++++++-----=
-
> >   1 file changed, 18 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/=
drm/i915/gem/i915_gem_context.c
> > index 7f2831efc798..6250de9b9196 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -1688,6 +1688,10 @@ void i915_gem_init__contexts(struct drm_i915_pri=
vate *i915)
> >       init_contexts(&i915->gem.contexts);
> >   }
> >
> > +/*
> > + * Note that this implicitly consumes the ctx reference, by placing
> > + * the ctx in the context_xa.
> > + */
> >   static void gem_context_register(struct i915_gem_context *ctx,
> >                                struct drm_i915_file_private *fpriv,
> >                                u32 id)
> > @@ -1703,10 +1707,6 @@ static void gem_context_register(struct i915_gem=
_context *ctx,
> >       snprintf(ctx->name, sizeof(ctx->name), "%s[%d]",
> >                current->comm, pid_nr(ctx->pid));
> >
> > -     /* And finally expose ourselves to userspace via the idr */
> > -     old =3D xa_store(&fpriv->context_xa, id, ctx, GFP_KERNEL);
> > -     WARN_ON(old);
> > -
> >       spin_lock(&ctx->client->ctx_lock);
> >       list_add_tail_rcu(&ctx->client_link, &ctx->client->ctx_list);
> >       spin_unlock(&ctx->client->ctx_lock);
> > @@ -1714,6 +1714,10 @@ static void gem_context_register(struct i915_gem=
_context *ctx,
> >       spin_lock(&i915->gem.contexts.lock);
> >       list_add_tail(&ctx->link, &i915->gem.contexts.list);
> >       spin_unlock(&i915->gem.contexts.lock);
> > +
> > +     /* And finally expose ourselves to userspace via the idr */
> > +     old =3D xa_store(&fpriv->context_xa, id, ctx, GFP_KERNEL);
> > +     WARN_ON(old);
>
> Have you seen that this hunk is needed or just moving it for a good measu=
re? To be clear, it is probably best to move it even if the current placeme=
nt cannot cause any problems, I am just double-checking if you had any conc=
rete observations here while mulling over easier stable backports if we wou=
ld omit it.
>

This was actually the originally reported issue, the
finalize_create_context_locked() part was something I found when the
original report prompted me to audit gem_context_register() call
paths.


> >   }
> >
> >   int i915_gem_context_open(struct drm_i915_private *i915,
> > @@ -2199,14 +2203,22 @@ finalize_create_context_locked(struct drm_i915_=
file_private *file_priv,
> >       if (IS_ERR(ctx))
> >               return ctx;
> >
> > +     /*
> > +      * One for the xarray and one for the caller.  We need to grab
> > +      * the reference *prior* to making the ctx visble to userspace
> > +      * in gem_context_register(), as at any point after that
> > +      * userspace can try to race us with another thread destroying
> > +      * the context under our feet.
> > +      */
> > +     i915_gem_context_get(ctx);
> > +
> >       gem_context_register(ctx, file_priv, id);
> >
> >       old =3D xa_erase(&file_priv->proto_context_xa, id);
> >       GEM_BUG_ON(old !=3D pc);
> >       proto_context_close(file_priv->dev_priv, pc);
> >
> > -     /* One for the xarray and one for the caller */
> > -     return i915_gem_context_get(ctx);
> > +     return ctx;
>
> Otherwise userspace can look up a context which hasn't had it's reference=
 count increased yep. I can add the Fixes: and Stable: tags while merging i=
f no complaints.
>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Thanks

BR,
-R

>
> Regards,
>
> Tvrtko
>
> >   }
> >
> >   struct i915_gem_context *
