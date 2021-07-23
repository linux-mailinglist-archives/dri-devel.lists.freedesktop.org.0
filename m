Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5485E3D379D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 11:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E546F58F;
	Fri, 23 Jul 2021 09:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416B46F58F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 09:22:08 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id q6so1161784oiw.7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 02:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R2GBkm1+dYCdylnOQUaBIL+sywcJpYVK+B1WLnTME/0=;
 b=GwkSrlJgfhTPrLC1Sw8+7ijQYUqb1kBnUFzyYekZK+WN9s+VxvmoxpX59L2VXz0SKJ
 ipydnj0qXt8Ao/87V6bTyJogDbjWyHSvrE0YGLj9Ork8as817idy8J3/TcsXvupSEupa
 wzGqnJZm0tluNQIhvbBXEb3GZw2Sq2T6naoyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R2GBkm1+dYCdylnOQUaBIL+sywcJpYVK+B1WLnTME/0=;
 b=qEKT0ZHTilecgBp+Og/a/lMCRP44uT/uFQOvaZaxdwT3ajo1BE4qq5/2UuxLDF0LbK
 PlpLqrpw4wwT22yUYkL2WHXEJy7gSn7vldw6VSFerKhXjKsn7YKaZukkt8V5qIB+wV35
 dEDRqlYzYXfNnbAC8xvy1b5e7L8LpnjlEZvV3T61HoY70mNcUz/0rdN4I0IAFqobBPOl
 UnVYe0QGDNcrPmJZbFxSKd6ttN6qsWMFLDnCoaNod5QUgxDBwGC1E3ZmXP0/VOrFRHwx
 joO6HerbgGCx+N8huUBVO0hA2RxAXDttKyU/47rtyLsYjWg/+I2yubLvG9jxKmLD3cYv
 8yrg==
X-Gm-Message-State: AOAM531Szn0FQhdVvGNA+OUHEElCQJEglDDTj0MsGuoa9Knt4TMtie15
 MA4LXcXGe3aQrf2+VdJTYrCGM0o8pxICiqGnpf230g==
X-Google-Smtp-Source: ABdhPJwHr8oCzDw2fd2jVsfcv9NrnLGXZwVeedoy/7Ca9/qxVy1x+CYPTwpqJSVAQo3CVoFxew4AQTC+W3zfwDi9nDw=
X-Received: by 2002:aca:d682:: with SMTP id n124mr2508179oig.128.1627032127564; 
 Fri, 23 Jul 2021 02:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210722124127.17901-1-christian.koenig@amd.com>
 <YPqCBUDiibBWUs2/@phenom.ffwll.local>
 <c83ebc42-567c-4f4c-d6da-53ff21739222@gmail.com>
In-Reply-To: <c83ebc42-567c-4f4c-d6da-53ff21739222@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 23 Jul 2021 11:21:56 +0200
Message-ID: <CAKMK7uGVPnsw2o=9E295CobiY_qYdCg5fZQN4Q8Bu22r9E3WUw@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/vmwgfx: unbind in vmw_ttm_unpopulate
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 11:13 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 23.07.21 um 10:47 schrieb Daniel Vetter:
> > On Thu, Jul 22, 2021 at 02:41:23PM +0200, Christian K=C3=B6nig wrote:
> >> Doing this in vmw_ttm_destroy() is to late.
> >>
> >> It turned out that this is not a good idea at all because it leaves po=
inters
> >> to freed up system memory pages in the GART tables of the drivers.
> > So I wanted to review this series, and I can't reconcile your claim her=
e
> > with the demidlayering Dave has done. The driver patches here don't
> > ouright undo what Dave has done, but that means the bug has been
> > preexisting since forever (or is due to some other change?), and your
> > commit message is a bit confusing here.
> >
> > The final patch just undoes the demidlayering from Dave, and I really
> > don't see where there's even a functional change there.
> >
> > And even these patches here don't really change a hole lot with the
> > calling sequence for at least final teardown: ttm_tt_destroy_common cal=
ls
> > ttm_tt_unpopulate as the first thing, so at least there there's no chan=
ge.
> >
> > Can you pls elaborate more clearly what exactly you're fixing and what
> > exactly needs to be reordered and where this bug is from (commit sha1)?=
 As
> > is I'm playing detective and the evidence presented is extremely since =
and
> > I can't reconcile it at all.
> >
> > I mean I know you don't like typing commit message and documentation, b=
ut
> > it does get occasionally rather frustrating on the reviewer side if I h=
ave
> > to interpolate between some very sparse hints for this stuff :-/
>
> Yeah, when have seen the history it's rather obvious what's wrong here
> and I expected Dave to review it himself.
>
> Previously we had three states in TTM for a tt object: Allocated ->
> Populated -> Bound which on destruction where done in the order unbind
> -> unpopulate -> free.
>
> Dave moved handling of the bound state into the drivers since it is
> basically a driver decision and not a TTM decision what should be bound
> and what not (that part perfectly makes sense).

I haven't reviewed all the patches from Dave, only the one you pointed
at (in the last patch). And that one I still can't match up with your
description. If there's other commits relevant, can you pls dig them
out?

Like it all makes sense what you're saying and matches the code, I
just can't match it up with the commit you're referencing.

> The problem is that he also moved doing the unbind into the free
> callback instead of the unpopulate callback. This result in stale page
> pointers in the GART if that unpopulate operation isn't immediately
> followed by a free.
>
> Thinking more about it if we do populated->unpopulated->populated then
> we would also have stale pointers to the old pages which is even worse.
>
> This is also not de-midlayering since we already have a proper
> ttm_tt_init()/ttm_tt_fini() functions which should work nicely for the
> tt object.

Well you're last patch moves the ttm_tt_destroy_common stuff back into
ttm, which kinda is de-demidlayering. So I'm confused.

Other bit: I think it'd be good to document this properly in the
callbacks, and maybe ideally go about and kerneldoc-ify the entire
ttm_tt.h header. Otherwise when we eventually (never?) get around to
that, everyone has forgotten these semantic details and issues again.
-Daniel

> Christian.
>
> > -Daniel
> >
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> ---
> >>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 9 +++------
> >>   1 file changed, 3 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/=
drm/vmwgfx/vmwgfx_ttm_buffer.c
> >> index b0973c27e774..904031d03dbe 100644
> >> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> >> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> >> @@ -526,14 +526,9 @@ static void vmw_ttm_destroy(struct ttm_device *bd=
ev, struct ttm_tt *ttm)
> >>      struct vmw_ttm_tt *vmw_be =3D
> >>              container_of(ttm, struct vmw_ttm_tt, dma_ttm);
> >>
> >> -    vmw_ttm_unbind(bdev, ttm);
> >>      ttm_tt_destroy_common(bdev, ttm);
> >>      vmw_ttm_unmap_dma(vmw_be);
> >> -    if (vmw_be->dev_priv->map_mode =3D=3D vmw_dma_alloc_coherent)
> >> -            ttm_tt_fini(&vmw_be->dma_ttm);
> >> -    else
> >> -            ttm_tt_fini(ttm);
> >> -
> >> +    ttm_tt_fini(ttm);
> >>      if (vmw_be->mob)
> >>              vmw_mob_destroy(vmw_be->mob);
> >>
> >> @@ -578,6 +573,8 @@ static void vmw_ttm_unpopulate(struct ttm_device *=
bdev,
> >>                                               dma_ttm);
> >>      unsigned int i;
> >>
> >> +    vmw_ttm_unbind(bdev, ttm);
> >> +
> >>      if (vmw_tt->mob) {
> >>              vmw_mob_destroy(vmw_tt->mob);
> >>              vmw_tt->mob =3D NULL;
> >> --
> >> 2.25.1
> >>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
