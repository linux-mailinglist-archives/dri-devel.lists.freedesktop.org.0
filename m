Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC0136F5FB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 08:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C3F6E49A;
	Fri, 30 Apr 2021 06:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8EC6E4A5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 06:53:56 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso8612534otn.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 23:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Y2/iKIxefnWjf6wfHJ4c5SeCUOaB5vn8tA3HVMD29g=;
 b=BKBPD58RauGb7ZY3cIcg+NhIHbl19B3KrVf0b9MY/7sLCCgoDxYskz8l5DTo0Jmqns
 I6XG3k++2lTZ1k6sr/UnmfUOJwIKAN7LqWp6o4ZIGpqEb/9ui8wGyfqcw9efQgd3gq8k
 dM1Y9kFAvol2MBQ8Y/Rgy2k2M4FCLMdT8CdYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Y2/iKIxefnWjf6wfHJ4c5SeCUOaB5vn8tA3HVMD29g=;
 b=gylsTvVhERqjSIEHSr0PMnFkNl0czg7z+bL/sNene7xoSjZ5RMwrksGFWbMEe4Vh/l
 UQZbaJERauggYGBOT/lGOv/mVqGcLlIRVF+dfraz6MhIpZx0lsv6iv/x4Wa76UvyhaED
 zvHD9dWlwabO7l6BsassvkQMyo/TgYZ3sNkEKrSLvqUew7uH29fdWrxhF4qm7TsAMjxn
 uj7eJpbZQuZC5f4ativfTjTOiIYZdrcxlvltTt4fyZ1pPThYDIq69ALTJ7v0akdtjko+
 mm0Dp4ODBOKCI2JnxCAL4WZHWuqNlX7zUaHO4eJXU1cw3XZyQMUTg/1e+/nHnZwj5HZt
 JHNA==
X-Gm-Message-State: AOAM532iLOQld1S/4xx8DRA5RFRqB2Ou/hHqZHmFcqyxZBrTvvAIQ8Z2
 BydBi6Wep/yyQobFfaIDU8t86svc0vDby/XLoKsUDYucxHg=
X-Google-Smtp-Source: ABdhPJzE/PmWPpr4XDno34RT2mh5T2RZj1t28aVKutPUqbJTeVvq7zV9aIVqLC8KIJSF4jQe4PAPFXQpBIr47kYQqsg=
X-Received: by 2002:a05:6830:1398:: with SMTP id
 d24mr2330338otq.281.1619765635623; 
 Thu, 29 Apr 2021 23:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-17-jason@jlekstrand.net>
 <YIrWB3fX3TseroSh@phenom.ffwll.local>
 <CAOFGe97b_LSGfrLo3LBhBuvx8wduVJLf0ySC=gG7Z+L6v2dPzQ@mail.gmail.com>
 <YIsBSRwNGiiF/kxE@phenom.ffwll.local>
 <CAOFGe97qi=jB+MGPtJyX-QYmjvTe2QPeijsNCeJ2z+E19x6ZNg@mail.gmail.com>
 <YIsD8OSFdLnjz5cL@phenom.ffwll.local>
 <CAOFGe96DXzFVX77f5qVMrCzJq2Cuco1pOyCfYmo_1v6rmxpMKg@mail.gmail.com>
In-Reply-To: <CAOFGe96DXzFVX77f5qVMrCzJq2Cuco1pOyCfYmo_1v6rmxpMKg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 30 Apr 2021 08:53:44 +0200
Message-ID: <CAKMK7uGzAGDS97hoj0xjzw8EJoPZazsLF=wxUz90cswjPSHthQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 16/21] drm/i915/gem: Delay context creation
To: Jason Ekstrand <jason@jlekstrand.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 11:35 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Thu, Apr 29, 2021 at 2:07 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, Apr 29, 2021 at 02:01:16PM -0500, Jason Ekstrand wrote:
> > > On Thu, Apr 29, 2021 at 1:56 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > On Thu, Apr 29, 2021 at 01:16:04PM -0500, Jason Ekstrand wrote:
> > > > > On Thu, Apr 29, 2021 at 10:51 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > > +     ret = set_proto_ctx_param(file_priv, pc, args);
> > > > > >
> > > > > > I think we should have a FIXME here of not allowing this on some future
> > > > > > platforms because just use CTX_CREATE_EXT.
> > > > >
> > > > > Done.
> > > > >
> > > > > > > +     if (ret == -ENOTSUPP) {
> > > > > > > +             /* Some params, specifically SSEU, can only be set on fully
> > > > > >
> > > > > > I think this needs a FIXME: that this only holds during the conversion?
> > > > > > Otherwise we kinda have a bit a problem me thinks ...
> > > > >
> > > > > I'm not sure what you mean by that.
> > > >
> > > > Well I'm at least assuming that we wont have this case anymore, i.e.
> > > > there's only two kinds of parameters:
> > > > - those which are valid only on proto context
> > > > - those which are valid on both (like priority)
> > > >
> > > > This SSEU thing looks like a 3rd parameter, which is only valid on
> > > > finalized context. That feels all kinds of wrong. Will it stay? If yes
> > > > *ugh* and why?
> > >
> > > Because I was being lazy.  The SSEU stuff is a fairly complex param to
> > > parse and it's always set live.  I can factor out the SSEU parsing
> > > code if you want and it shouldn't be too bad in the end.
> >
> > Yeah I think the special case here is a bit too jarring.
>
> I rolled a v5 that allows you to set SSEU as a create param.  I'm not
> a huge fan of that much code duplication for the SSEU set but I guess
> that's what we get for deciding to "unify" our context creation
> parameter path with our on-the-fly parameter path....
>
> You can look at it here:
>
> https://gitlab.freedesktop.org/jekstrand/linux/-/commit/c805f424a3374b2de405b7fc651eab551df2cdaf#474deb1194892a272db022ff175872d42004dfda_283_588

Hm yeah the duplication of the render engine check is a bit annoying.
What's worse, if you tthrow another set_engines on top it's probably
all wrong then. The old thing solved that by just throwing that
intel_context away.

You're also not keeping the engine id in the proto ctx for this, so
there's probably some gaps there. We'd need to clear the SSEU if
userspace puts another context there. But also no userspace does that.

Plus cursory review of userspace show
- mesa doesn't set this
- compute sets its right before running the batch
- media sets it as the last thing of context creation

So it's kinda not needed. But also we're asking umd to switch over to
CTX_CREATE_EXT, and if sseu doesn't work for that media team will be
puzzled. And we've confused them enough already with our uapis.

Another idea: proto_set_sseu just stores the uapi struct and a note
that it's set, and checks nothing. To validate sseu on proto context
we do (but only when an sseu parameter is set):
1. finalize the context
2. call the real set_sseu for validation
3. throw the finalized context away again, it was just for validating
the overall thing

That way we don't have to consider all the interactions of setting
sseu and engines in any order on proto context, validation code is
guaranteed shared. Only downside is that there's a slight chance in
behaviour: SSEU, then setting another engine in that slot will fail
instead of throwing the sseu parameters away. That's the right thing
for CTX_CREATE_EXT anyway, and current userspace doesn't care.

Thoughts?

> I'm also going to send it to trybot.

If you resend pls include all my r-b, I think some got lost in v4.
Also, in the kernel at least we expect minimal commit message with a
bit of context, there's no Part-of: link pointing at the entire MR
with overview and discussion, the patchwork Link: we add is a pretty
bad substitute. Some of the new patches in v4 are a bit too terse on
that.

And finally I'm still not a big fan of the add/remove split over
patches, but oh well.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
