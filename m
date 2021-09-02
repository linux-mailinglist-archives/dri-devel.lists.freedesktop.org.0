Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BCF3FEFD6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 17:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E126E5B4;
	Thu,  2 Sep 2021 15:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436896E5B4
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 15:06:10 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id c79so2901562oib.11
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 08:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/HUX+FUDNFG18O692ix3uIE+zCabiK1I/2x37rP8KGM=;
 b=D0z57gSNU+duP5dQ5coOX0Rbe3NKZwmcSWVzl6yLTmFYkf6H5feapse/NQRRhS9Kw1
 vIkMzVT6V1wgcQjbs2ENVDPgSvxUfS+LcU3DFsDotSU1RF0ZHkq/IsFdEnzw5IpHLOeV
 Pm0GtA/SGFh1DjcRSTzh4VWfk4wLp1mziYDkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/HUX+FUDNFG18O692ix3uIE+zCabiK1I/2x37rP8KGM=;
 b=EPXvlb+ZeE47lC0hGxzlI/Uyy1EKQDpbxd+3El5uuqkfnGhOUAW2app9RRL6UGVlRS
 rLkiPOZ2sgb7vwU14ZgWmqXO58rTV38LwtTaKOr/lmvFWYJnTBFyF89Zn2luGnZpvVAo
 98zdb8JXdsgfr/2+1Ly37DAZLDCJN3FS1dyCTaXuK30vkawMsUCzMNx753+JIfoWM9lF
 XQQXaATLpnYYOuxGpWIuRrBoa9CEV6hNPnae64BMEvVGXcQk6okP6NsqWq5CPbvYBBzI
 J67plqpU6XQCRjWkm8vVGENft/Me59JFxblNjxU1doAoo6Zt98RpmCg6FKsd3i7Nb0L+
 b8cw==
X-Gm-Message-State: AOAM531McMXHZHfBMoOqitB7pv8MZ0WXrWvUTu+JPcRlgvhsSK+hTA61
 cVj6xvb33RAdySyAtHs9aPjRktfdn5EvUj1bTLB3Yl3yNWI=
X-Google-Smtp-Source: ABdhPJyovgDnJSIu79UmNJXmCwKZoUoB4bm5E1cg0S1oM+Qbo6rA89ysqlVw4I88hrFogaMxe5rjGsYBODquC4/TGMI=
X-Received: by 2002:aca:3954:: with SMTP id g81mr2548632oia.101.1630595169455; 
 Thu, 02 Sep 2021 08:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210813203033.3179400-1-daniel.vetter@ffwll.ch>
 <9d8cba62-e1e1-a62c-1482-89d2db49d5af@linux.intel.com>
In-Reply-To: <9d8cba62-e1e1-a62c-1482-89d2db49d5af@linux.intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 2 Sep 2021 17:05:58 +0200
Message-ID: <CAKMK7uG4F9ooosoovjUP3XFVPjpU_wV2Me2hxjyit3b1FGbSWQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 01/11] drm/i915: Release i915_gem_context from
 a worker
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, 
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, 
 Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 2, 2021 at 2:42 PM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 13/08/2021 21:30, Daniel Vetter wrote:
> > The only reason for this really is the i915_gem_engines->fence
> > callback engines_notify(), which exists purely as a fairly funky
> > reference counting scheme for that. Otherwise all other callers are
> > from process context, and generally fairly benign locking context.
>
> There is reset which definitely isn't process context.

gpu reset runs in process context. The tasklet context is the
engines_notify I'm talking about above.

> Otherwise I did not really get from the commit message is this patch
> fixing an existing problem or preparing something for the future. If the
> former then as I wrote above - I am pretty sure there are call sites
> from the tasklet already.
>
> Regards,
>
> Tvrtko
>
> > Unfortunately untangling that requires some major surgery, and we have
> > a few i915_gem_context reference counting bugs that need fixing, and
> > they blow in the current hardirq calling context, so we need a
> > stop-gap measure.

I guess this para wasn't clear, but subsequent patches fix the
refcount bugs and need this prep patch here.
-Daniel

> >
> > Put a FIXME comment in when this should be removable again.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_context.c       | 13 +++++++++++--
> >   drivers/gpu/drm/i915/gem/i915_gem_context_types.h | 12 ++++++++++++
> >   2 files changed, 23 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/=
drm/i915/gem/i915_gem_context.c
> > index fd169cf2f75a..051bc357ff65 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -986,9 +986,10 @@ static struct i915_gem_engines *user_engines(struc=
t i915_gem_context *ctx,
> >       return err;
> >   }
> >
> > -void i915_gem_context_release(struct kref *ref)
> > +static void i915_gem_context_release_work(struct work_struct *work)
> >   {
> > -     struct i915_gem_context *ctx =3D container_of(ref, typeof(*ctx), =
ref);
> > +     struct i915_gem_context *ctx =3D container_of(work, typeof(*ctx),
> > +                                                 release_work);
> >
> >       trace_i915_context_free(ctx);
> >       GEM_BUG_ON(!i915_gem_context_is_closed(ctx));
> > @@ -1002,6 +1003,13 @@ void i915_gem_context_release(struct kref *ref)
> >       kfree_rcu(ctx, rcu);
> >   }
> >
> > +void i915_gem_context_release(struct kref *ref)
> > +{
> > +     struct i915_gem_context *ctx =3D container_of(ref, typeof(*ctx), =
ref);
> > +
> > +     queue_work(ctx->i915->wq, &ctx->release_work);
> > +}
> > +
> >   static inline struct i915_gem_engines *
> >   __context_engines_static(const struct i915_gem_context *ctx)
> >   {
> > @@ -1303,6 +1311,7 @@ i915_gem_create_context(struct drm_i915_private *=
i915,
> >       ctx->sched =3D pc->sched;
> >       mutex_init(&ctx->mutex);
> >       INIT_LIST_HEAD(&ctx->link);
> > +     INIT_WORK(&ctx->release_work, i915_gem_context_release_work);
> >
> >       spin_lock_init(&ctx->stale.lock);
> >       INIT_LIST_HEAD(&ctx->stale.engines);
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/driver=
s/gpu/drm/i915/gem/i915_gem_context_types.h
> > index 94c03a97cb77..0c38789bd4a8 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > @@ -288,6 +288,18 @@ struct i915_gem_context {
> >        */
> >       struct kref ref;
> >
> > +     /**
> > +      * @release_work:
> > +      *
> > +      * Work item for deferred cleanup, since i915_gem_context_put() t=
ends to
> > +      * be called from hardirq context.
> > +      *
> > +      * FIXME: The only real reason for this is &i915_gem_engines.fenc=
e, all
> > +      * other callers are from process context and need at most some m=
ild
> > +      * shuffling to pull the i915_gem_context_put() call out of a spi=
nlock.
> > +      */
> > +     struct work_struct release_work;
> > +
> >       /**
> >        * @rcu: rcu_head for deferred freeing.
> >        */
> >



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
