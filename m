Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BDB380F65
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 20:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE8289F2E;
	Fri, 14 May 2021 18:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC2489F2E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 18:06:23 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id l7so35692527edb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 11:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vXydfdU+0mZoHrb2xp3v9aJWrU8v3nhLpEclgdkwN4M=;
 b=YEZGlQIS0FST8hSXSF520LYwDVdgW9xTuR0KYUpT2DU5nNaS+WPsVeLeSRobSwogHw
 LxhSA8qAm+1rvkMGcoBYix8RWlnxOPIsIhqxr6kYTmqiKghE107HArZtwqC2rxsLivP6
 VS8o5NPDyoTZgdSSPWRofjkIrFoqxp5dUqSfNau0aMLqoYp9aTg8jpGPwIca8F6N6lW7
 IFSUcGwHUqLi1U/l3xTNXn0wfEPgT7yOmA/0f1VZJN6TOp4RjWM3PjvrV6+awyJW1Tg/
 SZb1Im3ZxoCQCv1DjY2YJ0DmEaP3iw92MJqEEBXvkCDN/GjivwWGuGLsOL/jTaqfpdT5
 nj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vXydfdU+0mZoHrb2xp3v9aJWrU8v3nhLpEclgdkwN4M=;
 b=BvnNF7eArItr2yMqCAf96UfrQSIoaJss4Jj6FmCYoELa52SlnrNxFygbLWI3tZ5bdA
 XpTYq6SuEhnhX3kZ+3RL8u2qzAIfRR4GC1XmG9FtPggl2HM3qejD+ALWlDPcWaFEmhU4
 UhhbZKPUUZy27qi9BtfRvumF1BaxW0nGK2pGobCTo4Q9vMSLxvYl64IQBWztzDBZHdp5
 k3K7cDzPiABhJwANebE0JZzaU3SR0XX26I+U6e7qbCYPW19vAMedquZiDX8YMCE5MPVS
 9LzWOEDHFLLu+g+kzmXEOn1yEMgCUWkVQbWVRWsNODFsxc4JF602Y7CVQCZI0p67Oc43
 g5vA==
X-Gm-Message-State: AOAM532c4GgegAF4IwbDhxJ3v4qJ/4xgVLYkqq4BPzaErn5hmFf0AbwD
 Hd2796x6bSj/2HhLtNr0tD5SrBBLqUrugANb/cCZaA==
X-Google-Smtp-Source: ABdhPJwp25So/ko2HORzrd1EyUoaX+eww4kkn8iTH47o30OWnS5xCIdq5QO4oCPZdx7g1BQEfALjCb+3Z5npd4DXtFI=
X-Received: by 2002:a05:6402:c8:: with SMTP id
 i8mr58641182edu.57.1621015582077; 
 Fri, 14 May 2021 11:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210503155748.1961781-1-jason@jlekstrand.net>
 <20210503155748.1961781-3-jason@jlekstrand.net>
 <YJEKHFofZsBdIPIS@phenom.ffwll.local>
In-Reply-To: <YJEKHFofZsBdIPIS@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 14 May 2021 13:06:10 -0500
Message-ID: <CAOFGe975VgY_Jxs3c=50ZP16X5gwEcJzb4Q1ULV3nGQaZAPe9Q@mail.gmail.com>
Subject: Re: [PATCH 02/27] drm/i915: Stop storing the ring size in the ring
 pointer
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

On Tue, May 4, 2021 at 3:47 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, May 03, 2021 at 10:57:23AM -0500, Jason Ekstrand wrote:
> > Previously, we were storing the ring size in the ring pointer before it
> > was actually allocated.  We would then guard setting the ring size on
> > checking for CONTEXT_ALLOC_BIT.  This is error-prone at best and really
> > only saves us a few bytes on something that already burns at least 4K.
> > Instead, this patch adds a new ring_size field and makes everything use
> > that.
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 3 +--
> >  drivers/gpu/drm/i915/gt/intel_context.c       | 3 ++-
> >  drivers/gpu/drm/i915/gt/intel_context.h       | 5 -----
> >  drivers/gpu/drm/i915/gt/intel_context_types.h | 1 +
> >  drivers/gpu/drm/i915/gt/intel_lrc.c           | 2 +-
> >  drivers/gpu/drm/i915/gt/selftest_execlists.c  | 2 +-
> >  drivers/gpu/drm/i915/gt/selftest_mocs.c       | 2 +-
> >  drivers/gpu/drm/i915/gt/selftest_timeline.c   | 2 +-
> >  drivers/gpu/drm/i915/gvt/scheduler.c          | 7 ++-----
> >  9 files changed, 10 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index e52b85b8f923d..2ba4c7e4011b4 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -211,8 +211,7 @@ static void intel_context_set_gem(struct intel_context *ce,
> >       GEM_BUG_ON(rcu_access_pointer(ce->gem_context));
> >       RCU_INIT_POINTER(ce->gem_context, ctx);
> >
> > -     if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags))
> > -             ce->ring = __intel_context_ring_size(SZ_16K);
> > +     ce->ring_size = SZ_16K;
> >
> >       if (rcu_access_pointer(ctx->vm)) {
> >               struct i915_address_space *vm;
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> > index 17cf2640b082b..342fa7daa08b5 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > @@ -372,7 +372,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
> >       ce->engine = engine;
> >       ce->ops = engine->cops;
> >       ce->sseu = engine->sseu;
> > -     ce->ring = __intel_context_ring_size(SZ_4K);
> > +     ce->ring = NULL;
> > +     ce->ring_size = SZ_4K;
> >
> >       ewma_runtime_init(&ce->runtime.avg);
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> > index f83a73a2b39fc..b10cbe8fee992 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> > @@ -175,11 +175,6 @@ int intel_context_prepare_remote_request(struct intel_context *ce,
> >
> >  struct i915_request *intel_context_create_request(struct intel_context *ce);
> >
> > -static inline struct intel_ring *__intel_context_ring_size(u64 sz)
> > -{
> > -     return u64_to_ptr(struct intel_ring, sz);
> > -}
> > -
> >  static inline bool intel_context_is_barrier(const struct intel_context *ce)
> >  {
> >       return test_bit(CONTEXT_BARRIER_BIT, &ce->flags);
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > index ed8c447a7346b..90026c1771055 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > @@ -82,6 +82,7 @@ struct intel_context {
> >       spinlock_t signal_lock; /* protects signals, the list of requests */
> >
> >       struct i915_vma *state;
> > +     u32 ring_size;
> >       struct intel_ring *ring;
> >       struct intel_timeline *timeline;
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> > index e86897cde9846..63193c80fb117 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> > @@ -845,7 +845,7 @@ int lrc_alloc(struct intel_context *ce, struct intel_engine_cs *engine)
> >       if (IS_ERR(vma))
> >               return PTR_ERR(vma);
> >
> > -     ring = intel_engine_create_ring(engine, (unsigned long)ce->ring);
> > +     ring = intel_engine_create_ring(engine, ce->ring_size);
> >       if (IS_ERR(ring)) {
> >               err = PTR_ERR(ring);
> >               goto err_vma;
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > index 1081cd36a2bd3..01d9896dd4844 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > @@ -2793,7 +2793,7 @@ static int __live_preempt_ring(struct intel_engine_cs *engine,
> >                       goto err_ce;
> >               }
> >
> > -             tmp->ring = __intel_context_ring_size(ring_sz);
> > +             tmp->ring_size = ring_sz;
> >
> >               err = intel_context_pin(tmp);
> >               if (err) {
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> > index e55a887d11e2b..f343fa5fd986f 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> > @@ -28,7 +28,7 @@ static struct intel_context *mocs_context_create(struct intel_engine_cs *engine)
> >               return ce;
> >
> >       /* We build large requests to read the registers from the ring */
> > -     ce->ring = __intel_context_ring_size(SZ_16K);
> > +     ce->ring_size = SZ_16K;
> >
> >       return ce;
> >  }
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c b/drivers/gpu/drm/i915/gt/selftest_timeline.c
> > index 9adbd9d147bea..7eedecfb86e59 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
> > @@ -874,7 +874,7 @@ static int create_watcher(struct hwsp_watcher *w,
> >       if (IS_ERR(ce))
> >               return PTR_ERR(ce);
> >
> > -     ce->ring = __intel_context_ring_size(ringsz);
> > +     ce->ring_size = ringsz;
> >       w->rq = intel_context_create_request(ce);
> >       intel_context_put(ce);
> >       if (IS_ERR(w->rq))
> > diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
> > index fc735692f21fb..99bc9fed6fbb6 100644
> > --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> > +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> > @@ -1409,11 +1409,8 @@ int intel_vgpu_setup_submission(struct intel_vgpu *vgpu)
> >               intel_context_set_single_submission(ce);
> >
> >               /* Max ring buffer size */
> > -             if (!intel_uc_wants_guc_submission(&engine->gt->uc)) {
> > -                     const unsigned int ring_size = 512 * SZ_4K;
> > -
> > -                     ce->ring = __intel_context_ring_size(ring_size);
> > -             }
> > +             if (!intel_uc_wants_guc_submission(&engine->gt->uc))
> > +                     ce->ring_size = 512 * SZ_4K;
>
> A rather funny way of saying SZ_2M. Maybe fix that if you feel like. W/ or
> w/o that:

Done.

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> >
> >               s->shadow[i] = ce;
> >       }
> > --
> > 2.31.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
