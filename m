Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCEB403D95
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 18:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB55B6E20A;
	Wed,  8 Sep 2021 16:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57016E20A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 16:27:20 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 l7-20020a0568302b0700b0051c0181deebso3669248otv.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 09:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nDdND5CZHDWadSbYdw+Ugw4mk/l/HXKB2LX7FAn00wo=;
 b=ezv76sPK3xarBiqqFdWk9u8+R780umcR0kUmncFiZLAf0qIsvX0WmbroUWMOTTmEQB
 T1kG/kLwCOYbjhxqe5NVCVN2xL61mrXsf7SwFwhBd2GWOGNZwDyyUgeEQL6Qecp2LNU0
 SuhCaY9GjKyldLTq5baIiJ4K0qeBgbRM1VtQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nDdND5CZHDWadSbYdw+Ugw4mk/l/HXKB2LX7FAn00wo=;
 b=qurmDh60Y24/NQ6kgSw1NEQHwR7cO6bO6bKJSGSJ0zmKIXC9tYtDLmuaz8SS9TFG7U
 vTryZlJ8TBUewl0szZHazGPDb7R38ehBCRh00GhJ2ViXeKN4T9vEaBzLScVuDEZmWViq
 uzbSMef2WAtvcCTWGvAOSh2UdjefFKLoecqZZWf6fQo8Dj0+WrOtDJUkgjHadEWYaCrF
 RpZKIANuPD73OfY0XWX4A7RXof7yKR0vOqvrlk14eDYY6LWLUQVMYvvAFuUzX8pd4kVK
 fggxzqk63YM2bbxLJ7o6JNPZbNW21VhV8ifZVuGuhfrWXyEvGMwVaax0eOSAP/2NaazX
 icag==
X-Gm-Message-State: AOAM532LhTQRLP7hfNGVgED4OopdZqNfX3IadKjHC4n9R5voWzlLYFiE
 XZg3B6kUZVxha/G7tnmXtJUBQR1GAXt3DLZiwCcWDA==
X-Google-Smtp-Source: ABdhPJwBAvgDeNyjtIu2cIg3z08BJL5d+CmxtF/El+NwXwlQuIfj2/APV30LEED7CmR7MFYb9zTo88b7ywxMx+rYi28=
X-Received: by 2002:a9d:724a:: with SMTP id a10mr3691581otk.323.1631118440068; 
 Wed, 08 Sep 2021 09:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <YTJypepF1Hpc2YYT@reader> <20210907130746.7b667dac@eldfell>
 <ccdba09b-011d-093e-17d0-578ca8a3ec44@redhat.com>
 <20210908103603.44a533bb@eldfell>
In-Reply-To: <20210908103603.44a533bb@eldfell>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 8 Sep 2021 18:27:09 +0200
Message-ID: <CAKMK7uGeuaZDYkr=mFiA4Okhod6KqKRnv_RfF-NJG=2KzG-=WQ@mail.gmail.com>
Subject: Re: Handling DRM master transitions cooperatively
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Dennis Filder <d.filder@web.de>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 8, 2021 at 9:36 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Tue, 7 Sep 2021 14:42:56 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
>
> > Hi,
> >
> > On 9/7/21 12:07 PM, Pekka Paalanen wrote:
> > > On Fri, 3 Sep 2021 21:08:21 +0200
> > > Dennis Filder <d.filder@web.de> wrote:
> > >
> > >> Hans de Goede asked me to take a topic from a private discussion here.
> > >> I must also preface that I'm not a graphics person and my knowledge of
> > >> DRI/DRM is cursory at best.
> > >>
> > >> I initiated the conversation with de Goede after learning that the X
> > >> server now supports being started with an open DRM file descriptor
> > >> (this was added for Keith Packard's xlease project).  I wondered if
> > >> that could be used to smoothen the Plymouth->X transition somehow and
> > >> asked de Goede if there were any such plans.  He denied, but mentioned
> > >> that a new ioctl is in the works to prevent the kernel from wiping the
> > >> contents of a frame buffer after a device is closed, and that this
> > >> would help to keep transitions smooth.
> > >
> > > Hi,
> > >
> > > I believe the kernel is not wiping anything on device close. If
> > > something in the KMS state is wiped, it originates in userspace:
> > >
> > > - Plymouth doing something (e.g. RmFB on an in-use FB will turn the
> > >   output off, you need to be careful to "leak" your FB if you want a
> > >   smooth hand-over)
> >
> > The "kernel is not wiping anything on device close" is not true,
> > when closing /dev/dri/card# any remaining FBs from the app closing
> > it will be dealt with as if they were RmFB-ed, causing the screen
> > to show what I call "the fallback fb", at least with the i915 driver.
>
> No, that's not what should happen AFAIK.
>
> True, all FBs that are not referenced by active CRTCs or planes will
> get freed, since their refcount drops to zero, but those CRTCs and
> planes that are active will remain active and therefore keep their
> reference to the respective FBs and so the FBs remain until replaced or
> turned off explicitly (by e.g. fbcon if you switch to that rather than
> another userspace KMS client). I believe that is the whole reason why
> e.g. DRM_IOCTL_MODE_GETFB2 can be useful, otherwise the next KMS client
> would not have anything to scrape.
>
> danvet, what is the DRM core intention?

Historical accidents mostly. There's two things that foil easy
handover to the next compositor:
- RMFB instead of CLOSEFB semantics, especially when closing the
drmfd. This is uapi, so anything we change needs to be opt-in
- Forced fbdev restore on final close of all drm fd. This is only
prevented if there's a drm master left around (systemd-logind can keep
that instead of forcing the compositor to survive until the other has
taken over, which it needs to do anyway to prevent the drm master
handover from going sideways). This can be fixed by simply disabling
fbdev completely, which you really want to do anyway. Again it's uabi,
people will complain if we break this I think.

> Or am I confused because display servers do not tend to close the DRM
> device fd on switch-out but Plymouth does (too early)?

Yeah, that stops both forced restore/disable from kicking in.

> If so, why can't Plymouth keep the device open longer and quit only
> when the hand-off is complete? Not quitting too early would be a
> prerequisite for any explicit hand-off protocol as well.

With closefb semantics and fbdev disabled plymouth could quit early,
and things still work.
-Daniel

>
> Thanks,
> pq
>
> > > - Xorg doing something (e.g. resetting instead of inheriting KMS state)
> > >
> > > - Something missed in the hand-off sequence which allows fbcon to
> > >   momentarily take over between Plymouth and Xorg. This would need to
> > >   be fixed between Plymouth and Xorg.
> > >
> > > - Maybe systemd-logind does something odd to the KMS device? It has
> > >   pretty wild code there. Or maybe it causes fbcon to take over.
> > >
> > > What is the new ioctl you referred to?
> >
> > It is an ioctl to mark a FB to not have it auto-removed on device-close,
> > instead leaving it in place until some some kernel/userspace client
> > actively installs another FB. This was proposed by Rob Clark quite
> > a while ago, but it never got anywhere because of lack of userspace
> > actually interested in using it.
> >
> > I've been thinking about reviving Rob's patch, since at least for
> > plymouth this would be pretty useful to have.
> >
> > Regards,
> >
> > Hans
> >
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
