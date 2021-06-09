Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E773A1A87
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 18:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41276E999;
	Wed,  9 Jun 2021 16:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15E66E99C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 16:07:54 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id b13so36216106ybk.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 09:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4dsTQd/cZiVT06IEBrbQaFjTb+psFYvUW3roEtVwXNc=;
 b=OiAdmusdF5t5gLlNbipHmjTv3nVZKUDYkOgBkamFD+aqS3RnFRM2AgQ/px9zC+K7v6
 bkaqiMGUlXjf8dBJRv6e6hDrphr8IZeelypZpGrk81nhWnAj9ChKp/I8B3OB0OFZ3+nB
 HCxK+6ebxeb/ji0gy8/nwIhHHXxfwU41FMXseZgRIpJA097T2vMiMV0TR7yAc9D77kdr
 +LY26hDlOtD4oGr7E1NUkkIvZw2IOCq1cQq4AGZ8suS/1jSO2Erja+A3zv7T3armc90L
 l8Rheb9FIK42a7uHmqS0rp96VLT78baEDOa3PZQN0Si69uncJjlkSWQO5pt08Z06ZG91
 hpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4dsTQd/cZiVT06IEBrbQaFjTb+psFYvUW3roEtVwXNc=;
 b=XpQMIQNZIwMMnBK+s63NmdXEOOf6C2aOcLbUgZpUsU7yFTa836wiS36O2QBVAf+Ee9
 5HgK/UgAmD8usSFMl7NgSfseyTCRsbgWr8WDftr7o+htcpF3J6T4a+2n8QZuUfWrAMwo
 MLDiQgXbf9jpHdzCw8RW0z62EV/1c5eI+b/GZmLugRy+ClGVBWpXRB2Q4kIL7OLof+EI
 BUFlkIoIcRR4PQWN5uE+7C/HUKmqGvS2T8J+PevbYkKpDx0zkKz4D34ebdVdeKSxht0L
 HwS2Sg0sR9xTUBpz5GI72KmpejXpOW7BlXGLBclaDsTUx4b9xm4orUNr9DlFzNK/GUdV
 alyA==
X-Gm-Message-State: AOAM532jE8RfJnTscA1Zb4PN88pKFM0VPcsfhH5zyV5vXJZBrcIV0j+r
 0qM8j2M7+GYA8AjU9cP7JVDyTc0+fQQhtHIcKq3vnzw4+tc=
X-Google-Smtp-Source: ABdhPJwihizNzfXYV+nW9kuMWphS37wT2eNcqES9vSVtvsVTQnBf1kTl7v6i5FV8sxfoX5PqhLNSqKf/CFVHxe5kjCo=
X-Received: by 2002:a5b:850:: with SMTP id v16mr993551ybq.139.1623254874036;
 Wed, 09 Jun 2021 09:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210609043613.102962-1-jason@jlekstrand.net>
 <20210609043613.102962-32-jason@jlekstrand.net>
 <YMCo5N8cn902qLgc@phenom.ffwll.local>
In-Reply-To: <YMCo5N8cn902qLgc@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 9 Jun 2021 11:07:42 -0500
Message-ID: <CAOFGe94EOR0A4EH=bKRhAvxemkNvXktBWKhXKbCRZ8BgZ=r2+Q@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 31/31] drm/i915: Drop some RCU usage around
 context VMs
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

On Wed, Jun 9, 2021 at 6:41 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Jun 08, 2021 at 11:36:13PM -0500, Jason Ekstrand wrote:
> > This instance now only happens during context creation so there's no way
> > we can race with a context close/destroy.  We don't need to bother with
> > the RCU and can access the pointer directly.
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>
> There's another one in execbuf.c, and the real crux is that we need to
> fully audit the lifetimes of everything. I think it's better to do this
> all together in a seperate patch series, which entirely removes the rcu
> barrier on the i915_address_space cleanup, and also removes the rcu
> protection from everywhere else.
>
> Otherwise we just have an inconsistent mess that happens to work,
> sometimes.

Ok, let's drop this for now.

--Jason

> -Daniel
>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_context.c | 13 +++++--------
> >  1 file changed, 5 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index 5312142daa0c0..ffdfed536ce9a 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -787,15 +787,12 @@ static int intel_context_set_gem(struct intel_context *ce,
> >
> >       ce->ring_size = SZ_16K;
> >
> > -     if (rcu_access_pointer(ctx->vm)) {
> > -             struct i915_address_space *vm;
> > -
> > -             rcu_read_lock();
> > -             vm = context_get_vm_rcu(ctx); /* hmm */
> > -             rcu_read_unlock();
> > -
> > +     if (ctx->vm) {
> > +             /* This only happens during context creation so no need to
> > +              * bother with any RCU nonsense.
> > +              */
> >               i915_vm_put(ce->vm);
> > -             ce->vm = vm;
> > +             ce->vm = i915_vm_get(ctx->vm);
> >       }
> >
> >       if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
> > --
> > 2.31.1
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
