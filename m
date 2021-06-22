Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 101763B0016
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 11:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AD76E452;
	Tue, 22 Jun 2021 09:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B466E452
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 09:20:48 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 s20-20020a4ae9940000b02902072d5df239so5206974ood.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 02:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B0CLRv/C97SIL4mDRjWeR2RS/vw2/AXlOiSHFmBfaag=;
 b=iXyQoMTlfsopHp7iUDCM50Nbt8fJ0O4Y/hzi7SqPnEBKB+F2nCcWCTEjeR/Rm5vwYJ
 6GurH29V+pDQhvsuH8KEjYTLVuM/AOgTeToykj4dLY5ugg1UJl4O8FGiKggvZUSj7gDB
 9TOraxxUNlsd1zUSqN/1hwfpiBNZOvIhBNTNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B0CLRv/C97SIL4mDRjWeR2RS/vw2/AXlOiSHFmBfaag=;
 b=rwUN9dCRpV/IicN6jrhrawP9qrEsw+EOhZ2RxFN4YHid7XK7Az7seqnxEBmTbwRDQ+
 Up9nl4PvFd5FAHewe5pn5yqRDS//5+qpmyfTZc6Dsdd4zmeQ801UNgcSg+HvxkUMbaOv
 vOlst4rmXC5G6Flsk1RM/hVyJd4d9pDpGP8j1TCQMf1ljJdxOsX99G0DdGZRNa9pCsLV
 haIPxMV81ea3egvaAusB7j+0Vie2AFWEf+MyfmAo1iJ4Pzt3EOe9ZfxfFMUFwBEJyWsK
 8ScgMsJ5jgMTqLstJOfJEnGya2G4eprEf7hd4MvcTof+UxN3KP03lNBCvM/ZgSYv3o2X
 9OGw==
X-Gm-Message-State: AOAM530Sc8PX0ZORBRUv++cELK9NwVrTzTY1lESlOXGOzO7NQtYQq+UH
 vkxq9Nm46nbDQFUOJYuZ3OhdvczJnT35dfb+6+2bMQ==
X-Google-Smtp-Source: ABdhPJyXDdHBte8f3i/aHTI1hWl//Nq8BnqMgfp8TRuBWA/zUcgICOOM03TiXWCNBTBU6rvXyp5dZmjeybWnMHyRq4w=
X-Received: by 2002:a4a:9b99:: with SMTP id x25mr2429637ooj.85.1624353648166; 
 Tue, 22 Jun 2021 02:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210621130328.11070-1-christian.koenig@amd.com>
 <YNCoK1qv6CCIy0Rl@phenom.ffwll.local>
 <2033755d-c49f-8b90-f726-d640146a3df7@gmail.com>
 <CAKMK7uEET_E7eJa1No3KLMBudgE16ymXzXZp0CRYt_ZjS-_YsA@mail.gmail.com>
In-Reply-To: <CAKMK7uEET_E7eJa1No3KLMBudgE16ymXzXZp0CRYt_ZjS-_YsA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 22 Jun 2021 11:20:37 +0200
Message-ID: <CAKMK7uECbQ+Fk6y9rsGdGdh4fEErhjUjSGicJLifnENAhjnZZw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/nouveau: wait for moving fence after pinning
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
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 5:53 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Jun 21, 2021 at 5:49 PM Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Am 21.06.21 um 16:54 schrieb Daniel Vetter:
> > > On Mon, Jun 21, 2021 at 03:03:26PM +0200, Christian K=C3=B6nig wrote:
> > >> We actually need to wait for the moving fence after pinning
> > >> the BO to make sure that the pin is completed.
> > >>
> > >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > >> CC: stable@kernel.org
> > >> ---
> > >>   drivers/gpu/drm/nouveau/nouveau_prime.c | 8 +++++++-
> > >>   1 file changed, 7 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/d=
rm/nouveau/nouveau_prime.c
> > >> index 347488685f74..591738545eba 100644
> > >> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
> > >> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
> > >> @@ -93,7 +93,13 @@ int nouveau_gem_prime_pin(struct drm_gem_object *=
obj)
> > >>      if (ret)
> > >>              return -EINVAL;
> > >>
> > >> -    return 0;
> > >> +    if (nvbo->bo.moving) {
> > > Don't we need to hold the dma_resv to read this? We can grab a refere=
nce
> > > and then unlock, but I think just unlocked wait can go boom pretty ea=
sily
> > > (since we don't hold a reference or lock so someone else can jump in =
and
> > > free the moving fence).
> >
> > The moving fence is only modified while the BO is moved and since we
> > have just successfully pinned it....
>
> Yeah  ... so probably correct, but really tricky. Just wrapping a
> ttm_bo_reserve/unreserve around the code you add should be enough and
> get the job done?

I think you distracted me a bit with the "it can't move", so yes
there's a guarantee that no other fence can show up in ttm_bo->moving
and confuse us. But it could get set to NULL because someone realized
it signalled. We're not doing that systematically, but relying on
fences never getting garbage-collected for correctness isn't great.

Sot the ttm_bo_reserve/unreserve is definitely needed here around this
bit of code. You don't need to merge it with the reserve/unreserve in
the pin function though, it's just to protect against the
use-after-free.
-Daniel

>
> > But in general I agree that it would be better to avoid this. I just
> > didn't wanted to open a bigger can of worms by changing nouveau so much=
.
>
> Yeah, but I'm kinda thinking of some helpers to wait for the move
> fence (so that later on we can switch from having the exclusive fence
> to the move fence do that, maybe). And then locking checks in there
> would be nice.
>
> Also avoids the case of explaining why lockless here is fine, but
> lockless wait for the exclusive fence in e.g. a dynami dma-buf
> importer is very much not fine at all. Just all around less trouble.
> -Daniel
>
> >
> > Christian.
> >
> > > -Daniel
> > >
> > >> +            ret =3D dma_fence_wait(nvbo->bo.moving, true);
> > >> +            if (ret)
> > >> +                    nouveau_bo_unpin(nvbo);
> > >> +    }
> > >> +
> > >> +    return ret;
> > >>   }
> > >>
> > >>   void nouveau_gem_prime_unpin(struct drm_gem_object *obj)
> > >> --
> > >> 2.25.1
> > >>
> >
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
