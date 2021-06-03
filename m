Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED6C399B89
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 09:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0EB6F406;
	Thu,  3 Jun 2021 07:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0356F406
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 07:26:30 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so4929385otg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 00:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w2dlrFGLFCQJHA+/qySItjsfw8zXheTTgt2tWoLpfMQ=;
 b=MK2G5d2uuF3V68voepVw9lB36QrQS///hX+P0ExW1p3474NKRUi3TE7hOHa2mi3Zw4
 Dav015EmB+eNpb0i9PHw2/P81df4ITyXhzLI7B04MAb0i6u49FnvTYrVct6IqZzrXOA/
 3HT7rSyOycn152c5mqtxMR8qNuiJAyXzipyDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w2dlrFGLFCQJHA+/qySItjsfw8zXheTTgt2tWoLpfMQ=;
 b=PLVjPNBPS0E0TvMYl50NSG0GESKtxd5b6JxVX3McPm89nWfIBIZ+K0O5GdmzaDA9ar
 vWHDGysCgzGRdlALaDOOJfGo+gkyRsC2CugTc6xsm0lMvl8o/0T+hCCBGVDVQrKDWc39
 IO7UoDkkeztOmFDJr299UkwD0UFTqubUM2Q5+v/0naGuO7Qo8UrGxl065SrW3wqaCIhu
 05X8ve7N8FgvIU99fUrsCN5xOOzIO73W1mFzyqWHMOJM29GasrFQlwTsbKASTiBlKZV8
 pIvglZCCiWVE1ymefD9LDxmFzYxwpInPsGSwmG5Ci4hFZcPwzeNAUKRXH6mGrQ5Bkk97
 /iXA==
X-Gm-Message-State: AOAM532n91L1d5j5wwJ0280HFEnfk5xH8yYWFiQmQHzHlN6fiee5mAFx
 TKziMPnTR9b8EX5V7MIbDIUvpOeq8buZ/XTNRgcVbg==
X-Google-Smtp-Source: ABdhPJwvmBPZY552U0g5HhnEPmcR81GC1/6RLEo6iyKJXm+rBBV0utuGeFH6FHE4UVvLZYJlrO/SPNka7oenQ3+uBfY=
X-Received: by 2002:a05:6830:1155:: with SMTP id
 x21mr28689826otq.303.1622705189477; 
 Thu, 03 Jun 2021 00:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210527162650.1182544-1-jason@jlekstrand.net>
 <20210527162650.1182544-25-jason@jlekstrand.net>
 <YLSxdSTd9xl1c7hY@phenom.ffwll.local>
 <CAOFGe95Bgob9DJhfdrTV9SLSosRwSAfyYBKw6iGVXKzJywdKZA@mail.gmail.com>
In-Reply-To: <CAOFGe95Bgob9DJhfdrTV9SLSosRwSAfyYBKw6iGVXKzJywdKZA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 3 Jun 2021 09:26:18 +0200
Message-ID: <CAKMK7uEgXpZFi7p9cWGCehsCJfSAhGVQajL5jMGYCy5AXF0mFw@mail.gmail.com>
Subject: Re: [PATCH 24/29] drm/i915/gem: Delay context creation
To: Jason Ekstrand <jason@jlekstrand.net>
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

On Thu, Jun 3, 2021 at 12:55 AM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Mon, May 31, 2021 at 4:50 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, May 27, 2021 at 11:26:45AM -0500, Jason Ekstrand wrote:
> > > @@ -2692,16 +2792,41 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
> > >  {
> > >       struct drm_i915_file_private *file_priv = file->driver_priv;
> > >       struct drm_i915_gem_context_param *args = data;
> > > +     struct i915_gem_proto_context *pc;
> > >       struct i915_gem_context *ctx;
> > > -     int ret;
> > > +     int ret = 0;
> > >
> > > -     ctx = i915_gem_context_lookup(file_priv, args->ctx_id);
> > > -     if (IS_ERR(ctx))
> > > -             return PTR_ERR(ctx);
> > > +     ctx = __context_lookup(file_priv, args->ctx_id);
> > > +     if (ctx)
> > > +             goto set_ctx_param;
> > >
> > > -     ret = ctx_setparam(file_priv, ctx, args);
> > > +     mutex_lock(&file_priv->proto_context_lock);
> > > +     ctx = __context_lookup(file_priv, args->ctx_id);
> >
> > Not unconditionally taking the mutex here feels a bit like overkill? Do we
> > really need that fast path?
>
> Probably not.  If someone writes a setparam benchmark, I will actively not care.

So for the non-proto-ctx path you can drop the lock right after lookup
is done, if you haven't done so. Should still be clean, and really no
concerns about microbenchmarks because of that mutex_lock/unlock.

>
> > > +     if (ctx)
> > > +             goto unlock;
> > > +
> > > +     pc = xa_load(&file_priv->proto_context_xa, args->ctx_id);
> > > +     if (!pc) {
> > > +             ret = -ENOENT;
> > > +             goto unlock;
> > > +     }
> > > +
> > > +     /* FIXME: We should consider disallowing SET_CONTEXT_PARAM for most
> > > +      * things on future platforms.  Clients should be using
> > > +      * CONTEXT_CREATE_EXT_PARAM instead.
> > > +      */
> >
> > I think the way to do that is to finalize the context creation from
> > CONTEXT_CREATE_EXT on these platforms. That plugs this hole for good and
> > by design. Maybe on gen13+ or something like that. Or whatever it is we're
> > using for enumerating generations now.
>
> Yup.  I agree.  Do you want me to add that now?

Separate patch. Also use the new GRAPHICS_VER macro Lucas Demarchi is adding.

> > > +     ret = set_proto_ctx_param(file_priv, pc, args);
> > > +
> > > +unlock:
> > > +     mutex_unlock(&file_priv->proto_context_lock);
> > > +
> > > +set_ctx_param:
> > > +     if (!ret && ctx)
> >
> > I don't think you need to check for ret here? It's not set by any path
> > leading to here where ctx != NULL.
>
> I think
>
> > Also mildly unhappy about the control flow here, we could simplify it if
> > we don't do the lockless faspath.
>
> Yeah, I think I've made it a lot better.  You may want to re-review on
> the next go 'round though.

Yeah I need to also recheck the end result (gitlab lost your branch),
I have suddenly some questions about how we handle all the funny
combinations of engines_set vs sseu vs virtual engines in the proto
context again, so will do a final pass there.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
