Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 511DB38C9A4
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 17:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630A96EB16;
	Fri, 21 May 2021 15:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058586E881
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 15:00:46 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id m1so16763341ilg.10
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 08:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oQj0FNiG5bAM6343Ct0j671goIZefi3SHzLA0KT/hl8=;
 b=WRZG8R/TiBJaa40Inm1tkYallr21e2Cs/WDV6SMojo2Kx+RJPr6/Y8bBCZuWNFWr9P
 HOScqfCSYVrJMAVgScEYpvYHplI7iVuU9MkADe30miNNuV4+V/X7FN5lhdilznpCtJjg
 DD8CyaqrLA5qhtxxlI9sS+Ww8R/oNhO79fGag+B6OpA4SqWvZv8sLBIBfx5Em1FaccbW
 WHhzocOycwZNsbN/6KZcG9KUmTQu42swG1xmXQAcFJ/atgF+f34Y2cUXSwgTwCSbkg/x
 Lqple5/CpftCT7yChrBKBh2HhYqAl/z98MB3iPrliv0cdlTnBLj4vmM9dDGRj8k+UTe2
 gljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oQj0FNiG5bAM6343Ct0j671goIZefi3SHzLA0KT/hl8=;
 b=UYtAwzn1l1FTFVeRk1H8aTHr63hrPLz+7gv6UWzIi/ISGTiTqUciIRD6XLX369htv5
 J9PAQ4eWQhFh0lVE2GNOjse4RfcbvBkw0UFbdFuGY5Tm5pjY45WxNG1PY9i6ss6pjF8k
 dyjH53TBo9CWvs0hgsiUyCdtJswMcsnhKXiQyMm7qMUHd+BWHyoY3sHSx9qnBX9vR+n+
 4rLQLHdPu6aCYSI0WwbGoq2jnPceiUw//5GPtndceYcCRCBCz3Hp9I1uTXsmzTxgZ0Jk
 3pYdSJwTIoxX92pw5F7uUmNEY6by+mez2fH0TwwmSdmaspCtGvUSJqBDKgSM0YtGPLF9
 FAVQ==
X-Gm-Message-State: AOAM532LD1l6RWEN5+IVCjMZLYC3Zxacj6DGVYstEUl6bandpWuAVypH
 efYIYFmx5eggRAIeytNKJOJ+m82exKZcGreMuC7Cuw==
X-Google-Smtp-Source: ABdhPJwFLlg9azhy3Koju3Q+BJeqcaD6/u45aY3WiO+f1FPZOGvKThJnsIadcwaVPRhwU3mmQmZX8X01e+eLbQeJu0k=
X-Received: by 2002:a05:6e02:11b3:: with SMTP id
 19mr11897277ilj.41.1621609245262; 
 Fri, 21 May 2021 08:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <CAP+8YyEhRwgz2hCri3K7Kv1OusVa_LGEuKZqQEx5jv+NiDKZrA@mail.gmail.com>
 <YKfFqrlLrikGMn4K@phenom.ffwll.local>
In-Reply-To: <YKfFqrlLrikGMn4K@phenom.ffwll.local>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Fri, 21 May 2021 17:00:46 +0200
Message-ID: <CAP+8YyG0o58dQt_tvnJ2ESbeqo02xxvFdifpMwnhz2VYNk8HUw@mail.gmail.com>
Subject: Re: [PATCH 01/11] drm/amdgpu: Comply with implicit fencing rules
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 4:37 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, May 21, 2021 at 11:46:23AM +0200, Bas Nieuwenhuizen wrote:
> > On Fri, May 21, 2021 at 11:10 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > ---
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > > index 88a24a0b5691..cc8426e1e8a8 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > > @@ -617,8 +617,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
> > >         amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> > >                 struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
> > >
> > > -               /* Make sure we use the exclusive slot for shared BOs */
> > > -               if (bo->prime_shared_count)
> > > +               /* Make sure we use the exclusive slot for all potentially shared BOs */
> > > +               if (!(bo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID))
> > >                         e->tv.num_shared = 0;
> >
> > I think it also makes sense to skip this with
> > AMDGPU_GEM_CREATE_EXPLICIT_SYNC? It can be shared but I don't think
> > anyone expects implicit sync to happen with those.
>
> Ah yes, I missed this entirely. So the "no implicit flag" is already
> there, and the _only_ thing that's missing really is a way to fish out the
> implicit fences, and set them.
>
> https://lore.kernel.org/dri-devel/20210520190007.534046-1-jason@jlekstrand.net/
>
> So I think all that's really needed in radv is not setting
> RADEON_FLAG_IMPLICIT_SYNC for winsys buffers when Jason's dma-buf ioctl
> are present (means you need to do some import/export and keep the fd
> around for winsys buffers, but shouldn't be too bad), and then control the
> implicit fences entirely explicitly like vk expects.

That is the part I'm less sure about. This is a BO wide flag so we are
also disabling implicit sync in the compositor. If the compositor does
only do read stuff that is ok, as the inserted exclusive fence will
work for that. But as I learned recently the app provided buffer may
end up being written to by the X server which open a whole can of
potential problems if implicit sync gets disabled between Xserver
operations on the app provided buffer. Hence setting that on the WSI
buffer is a whole new can of potential problems and hence I've said a
submission based flag would be preferred.

I can certainly try it out though.

>
> Are you bored enough to type this up for radv? I'll give Jason's kernel
> stuff another review meanwhile.
> -Daniel
>
> > >                 e->bo_va = amdgpu_vm_bo_find(vm, bo);
> > >         }
> > > --
> > > 2.31.0
> > >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
