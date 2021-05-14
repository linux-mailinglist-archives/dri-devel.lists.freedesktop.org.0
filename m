Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A432380FAC
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 20:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C036E0B7;
	Fri, 14 May 2021 18:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A131A6E0B7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 18:21:29 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id l4so45900876ejc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 11:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/I/1iQ26tcWKKsn5Sm9OUt5TBAdB5aF2BT/lSC2VYW4=;
 b=g9nwg+k5M4sdK2bij+3fu9rTInT56W50iw51s4HpkiRfhHnnaxWIFj4Up4NVfDI7a+
 lZqMrgpxFw3ihjqrddqITBPrT52osZzgbhfgu+gq9WJW+1hPUU2Bxmhpzwn7bBJ/7BqF
 WCKM+WMJhrA9kiqCHprsaYcQbjpEzto6X4r3mJsRo4xUZS5eF/ghPalv7pZZ6mtWCJek
 LwC3t3bDiz/9lPi2/T/RGH7TLYVFr0lolunKDkQhOkB1GtLgulq/dFcJbHNqr1V6JVdM
 5pK5ed9RW6/PjQdi0RTAcUODz6nUz4ig+0OGzGD3kgVfb5Sh/RHqquewjkkXR8koAQP2
 QRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/I/1iQ26tcWKKsn5Sm9OUt5TBAdB5aF2BT/lSC2VYW4=;
 b=ng9n7T0ZyPMK3f4OSTLNp96x5Rr1uwBoeOV9TDgFFiiDIwtSkZmEDWsiFiP1ryLRyk
 gVg6hlkxeuM2/bMOI3+AP3dPzTHf6/kkTkUeIp4/07tOoKK3/vZyGtLJ7zedK488V4EP
 dG+fKinbZOd6crDCXDLJ88BauyPGd2i6oHSiG/ix3Iaz/BnVftxcI6FvWIPqp7Ct8g2D
 CC0aF7vRiyzkLp40JbOasYMl8lqVGMXXltegdbZ09xCzdxhZL8OVg6yHT9d9HOsUQ4m9
 vSOGcytvhSDrnH8kBce+kBzvAoUTxQ/YBhyCd7zx1/WQKB5NNrNsZ2WVHlUuQD9Dcdao
 aKcw==
X-Gm-Message-State: AOAM532xjvy90a1VHhwUDLHGwmMuDxVWEPzfRra4B2a1AzCNy2Qv7Sir
 p2ktsM4mTfsby7o+Ll+PPTY7JkE7NgXVjN3zZI25Ug==
X-Google-Smtp-Source: ABdhPJyXDI45RTI7mv3dP4cp6GFpGkHMtsz4f7j5NnxGyghjgF6KmHxoXAdyz59n3bHYns+bszl63FQJRyjknJmJUwQ=
X-Received: by 2002:a17:907:781a:: with SMTP id
 la26mr17697085ejc.435.1621016488080; 
 Fri, 14 May 2021 11:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210503155748.1961781-1-jason@jlekstrand.net>
 <20210503155748.1961781-18-jason@jlekstrand.net>
 <YJFzilYYEb+SMz1i@phenom.ffwll.local>
In-Reply-To: <YJFzilYYEb+SMz1i@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 14 May 2021 13:21:16 -0500
Message-ID: <CAOFGe94s0hbP40SwnkZ6JtkVFLCa2A2OKEeQY3oEY5jhy=e4xg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 17/27] drm/i915/gem: Rework error handling in
 default_engines
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

On Tue, May 4, 2021 at 11:17 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, May 03, 2021 at 10:57:38AM -0500, Jason Ekstrand wrote:
> > Since free_engines works for partially constructed engine sets, we can
> > use the usual goto pattern.
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>
> I guess subsequent patches apply the same for the set_engines command and
> __free_engines disappears? Otherwise feels a bit silly.

Working towards that.

> Anyway looks correct.
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_context.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index 10bd1b6dd1774..ce729e640bbf7 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -420,7 +420,7 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
> >  {
> >       const struct intel_gt *gt = &ctx->i915->gt;
> >       struct intel_engine_cs *engine;
> > -     struct i915_gem_engines *e;
> > +     struct i915_gem_engines *e, *err;
> >       enum intel_engine_id id;
> >
> >       e = alloc_engines(I915_NUM_ENGINES);
> > @@ -438,18 +438,21 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
> >
> >               ce = intel_context_create(engine);
> >               if (IS_ERR(ce)) {
> > -                     __free_engines(e, e->num_engines + 1);
> > -                     return ERR_CAST(ce);
> > +                     err = ERR_CAST(ce);
> > +                     goto free_engines;
> >               }
> >
> >               intel_context_set_gem(ce, ctx);
> >
> >               e->engines[engine->legacy_idx] = ce;
> > -             e->num_engines = max(e->num_engines, engine->legacy_idx);
> > +             e->num_engines = max(e->num_engines, engine->legacy_idx + 1);
> >       }
> > -     e->num_engines++;
> >
> >       return e;
> > +
> > +free_engines:
> > +     free_engines(e);
> > +     return err;
> >  }
> >
> >  void i915_gem_context_release(struct kref *ref)
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
