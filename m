Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F5D36F222
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 23:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0316F4CD;
	Thu, 29 Apr 2021 21:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004156F4CA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 21:35:55 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id q6so21029485edr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 14:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lV7KnBzlIq+Dzi+dhgty/ougU6/SRr63LrNpqi4YB+I=;
 b=GmhK6KEMAne0tdAk/ofiUm07LI/Khd+1HKQVxymtOjcBMn6fsGV391prvR0lb27of6
 n29k8g5lqGVY1FRK0JpSIdvwL/Hhp4HdV4IHzgW6L5E7dtUR4T6x3YHSP6cc6EW8+r0a
 KphZvFxqEMUwBHSbalJLOo+dL+vpABForzKxKwg+btFR4EnXg46WcPuao6DlqcV91pH5
 0qfl0FlcrF0T+ECBr19tMg2l8fPzu3CfFC9616cQ3QP7lKFsfrqeZcOJhhuVNippgbmk
 UbOsREBAASuqY/ybuRM0A1n5eX2+4EEADDxNIpl1pqSc36Loj9Gg8INjRzOW57bu9D2I
 DYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lV7KnBzlIq+Dzi+dhgty/ougU6/SRr63LrNpqi4YB+I=;
 b=oVJ7jOjQF0m+mIiUsH2yq92rw2GImda7QB81Sedbmxjnim/eLtgnNKvmrzJZeyzj7/
 xGxmpQX5pK3P5jPF6IYgLLIpKPIku9S/FtUCHDicBglB1KDOgu8Xc4wAV0P/xJFF7d7n
 jH1v94R2OXh0okPxPwQNSB0dHroX3SvN5gbgp0EcejQdy4c/eKB2/KxFg3lKKZxXHtC0
 KwgyBSOze+XCYeTRIoW4iL6pWEOUyyMuJ/I9eqe2I/hiCf2YZY3NLGuwIn+8jiLL48Hd
 5P1d8uHu9+X+cQ0rkLmHQE04MiPK5FTxAAnu7nyPdMzyqtNyvfGcB74TwEhDTH2Ak3F5
 rYRg==
X-Gm-Message-State: AOAM530uq2D80IlfKrB8Of8BoF2BuOejw7YL7SN7vrazKTzKXxqj4wAO
 o2CyHmdem7If8vVAXbz4Pc24tn/beMkwm+6oYx3L7Q==
X-Google-Smtp-Source: ABdhPJxhl4NME432azzp/zQ7NWdTLQ28W36eHbXqgsS6htdajMXMg7J89AU/dw9N8CCOuImaFpDtF3Ok/vaHJOZ6PAY=
X-Received: by 2002:a05:6402:b88:: with SMTP id
 cf8mr1977337edb.227.1619732154547; 
 Thu, 29 Apr 2021 14:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-17-jason@jlekstrand.net>
 <YIrWB3fX3TseroSh@phenom.ffwll.local>
 <CAOFGe97b_LSGfrLo3LBhBuvx8wduVJLf0ySC=gG7Z+L6v2dPzQ@mail.gmail.com>
 <YIsBSRwNGiiF/kxE@phenom.ffwll.local>
 <CAOFGe97qi=jB+MGPtJyX-QYmjvTe2QPeijsNCeJ2z+E19x6ZNg@mail.gmail.com>
 <YIsD8OSFdLnjz5cL@phenom.ffwll.local>
In-Reply-To: <YIsD8OSFdLnjz5cL@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 29 Apr 2021 16:35:43 -0500
Message-ID: <CAOFGe96DXzFVX77f5qVMrCzJq2Cuco1pOyCfYmo_1v6rmxpMKg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 16/21] drm/i915/gem: Delay context creation
To: Daniel Vetter <daniel@ffwll.ch>
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

On Thu, Apr 29, 2021 at 2:07 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Apr 29, 2021 at 02:01:16PM -0500, Jason Ekstrand wrote:
> > On Thu, Apr 29, 2021 at 1:56 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Thu, Apr 29, 2021 at 01:16:04PM -0500, Jason Ekstrand wrote:
> > > > On Thu, Apr 29, 2021 at 10:51 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > +     ret = set_proto_ctx_param(file_priv, pc, args);
> > > > >
> > > > > I think we should have a FIXME here of not allowing this on some future
> > > > > platforms because just use CTX_CREATE_EXT.
> > > >
> > > > Done.
> > > >
> > > > > > +     if (ret == -ENOTSUPP) {
> > > > > > +             /* Some params, specifically SSEU, can only be set on fully
> > > > >
> > > > > I think this needs a FIXME: that this only holds during the conversion?
> > > > > Otherwise we kinda have a bit a problem me thinks ...
> > > >
> > > > I'm not sure what you mean by that.
> > >
> > > Well I'm at least assuming that we wont have this case anymore, i.e.
> > > there's only two kinds of parameters:
> > > - those which are valid only on proto context
> > > - those which are valid on both (like priority)
> > >
> > > This SSEU thing looks like a 3rd parameter, which is only valid on
> > > finalized context. That feels all kinds of wrong. Will it stay? If yes
> > > *ugh* and why?
> >
> > Because I was being lazy.  The SSEU stuff is a fairly complex param to
> > parse and it's always set live.  I can factor out the SSEU parsing
> > code if you want and it shouldn't be too bad in the end.
>
> Yeah I think the special case here is a bit too jarring.

I rolled a v5 that allows you to set SSEU as a create param.  I'm not
a huge fan of that much code duplication for the SSEU set but I guess
that's what we get for deciding to "unify" our context creation
parameter path with our on-the-fly parameter path....

You can look at it here:

https://gitlab.freedesktop.org/jekstrand/linux/-/commit/c805f424a3374b2de405b7fc651eab551df2cdaf#474deb1194892a272db022ff175872d42004dfda_283_588

I'm also going to send it to trybot.

--Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
