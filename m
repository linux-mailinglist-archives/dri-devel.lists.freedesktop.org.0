Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1196327F565
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 00:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8EA89C85;
	Wed, 30 Sep 2020 22:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACB889C60;
 Wed, 30 Sep 2020 22:47:10 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id c17so2540986ybe.0;
 Wed, 30 Sep 2020 15:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c2WVHIuNMKe7bDOlwZ3SpKJ7Zqq2Wc5QDujV0qexNqc=;
 b=HvMB6mwPIKWKnZmznfqDPiq/SSMxIauiaVaQrI0wmlB9esoxHbQQTBhWONwe0SQ8ou
 9oKdplxaM5gVhzk2fbwYMlwHuNB9Uq+uIAFkTyK0C49br6rA9w9C3Xd3bJE7IvAy80DJ
 5i4wRIcuk2h6dJOFw9EWq4+Og+HYHGbZtgVHcIhOfj5zhaRL6du0mamBPVXkyrayowan
 445+QWs8i7Fvkn8EkpWVwSCn2T+SX/WRhuHDax7dREqFSnCZT5K+JLGSRi/2CsP/N8dC
 jR1koXk0cEP3tQJ53Yz3crQzIVhx/HUah2vUEoGFysG/iixbq/WJfS6WVUpqwo1S/oY7
 hJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c2WVHIuNMKe7bDOlwZ3SpKJ7Zqq2Wc5QDujV0qexNqc=;
 b=sxaQMbi4Mi7WSbAIYfk203sPMZizA7HDcer85JL7dHLBdmHMCXdtrix6pBz5abjEEL
 UkEwnNdYILtmAx9mp5wHPgm1xP2Gozb/b1kYuUj453qbcdJq5kJ6Nydd0xL+SJxldRTL
 gjJrwb0xE+gAouF4untHVOHTMlNXIxdKAFm8/3K8lzneU9rn90za4xk1sok4tshWlema
 NyBcIrdh7ks3P8sARuqX9+qzuSvc1VTOiRIKQSBxWpjd1shXZq2A1ex3FUbWxbXFXuvb
 789VX0sNrvSrumh2r+LGu44GT1er7ImJ/JIITsO3q67hoEVKfwPuxEHg8/MgCHH4o/VS
 jjTQ==
X-Gm-Message-State: AOAM533no21Jk8e/K/33an84BLMSgZsiGKeZdAWYlXi1Mduy7S9ps5pq
 0odIi2DlvkZe8MRjCDZkJ9c3IhFfH70L2LO1arc=
X-Google-Smtp-Source: ABdhPJx8znzRYjs42wRX7O+IxfONSXe7e5c09fyLzICkI7Lfgjx+U+0xVmYbPOPXpovDz79TqonEtUw0ESf7LksZ+ao=
X-Received: by 2002:a25:fc23:: with SMTP id v35mr6044199ybd.200.1601506029902; 
 Wed, 30 Sep 2020 15:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200802181849.1586281-1-daniel.vetter@ffwll.ch>
 <579702ca-4b4e-0b05-1b93-25b99554d464@linux.intel.com>
 <CAKMK7uHbdcLMJONxR5OZXBLtm0WVxT117mBD72RDW5MRQ=ky4g@mail.gmail.com>
 <CAKMK7uE89ZyvVronwpS=+ovJj_njVo3C5+GjjZp2S-Dk_7p2jg@mail.gmail.com>
 <CACAvsv7nmpJPVnfGkRW=UECvNyjNRO0x=0VMPr0VuFBNtpk+2g@mail.gmail.com>
 <20200930093735.GT438822@phenom.ffwll.local>
In-Reply-To: <20200930093735.GT438822@phenom.ffwll.local>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 1 Oct 2020 08:46:59 +1000
Message-ID: <CACAvsv6ziC2K58-H35hWY5b35pW2YyLJGWi_X=utkh=meybRow@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Drop mutex_lock_nested for atomic
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
Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Sep 2020 at 19:37, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Sep 30, 2020 at 10:45:05AM +1000, Ben Skeggs wrote:
> > On Wed, 30 Sep 2020 at 00:52, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > On Thu, Sep 17, 2020 at 3:15 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > >
> > > > Ben, did you have a chance to look at this?
> > >
> > > Ping
> > > -Daniel
> > >
> > > > On Mon, Aug 3, 2020 at 1:22 PM Maarten Lankhorst
> > > > <maarten.lankhorst@linux.intel.com> wrote:
> > > > >
> > > > > Op 02-08-2020 om 20:18 schreef Daniel Vetter:
> > > > > > Purely conjecture, but I think the original locking inversion with the
> > > > > > legacy page flip code between flipping and ttm's bo move function
> > > > > > shoudn't exist anymore with atomic: With atomic the bo pinning and
> > > > > > actual modeset commit is completely separated in the code patsh.
> > > > > >
> > > > > > This annotation was originally added in
> > > > > >
> > > > > > commit 060810d7abaabcab282e062c595871d661561400
> > > > > > Author: Ben Skeggs <bskeggs@redhat.com>
> > > > > > Date:   Mon Jul 8 14:15:51 2013 +1000
> > > > > >
> > > > > >     drm/nouveau: fix locking issues in page flipping paths
> > > > > >
> > > > > > due to
> > > > > >
> > > > > > commit b580c9e2b7ba5030a795aa2fb73b796523d65a78
> > > > > > Author: Maarten Lankhorst <m.b.lankhorst@gmail.com>
> > > > > > Date:   Thu Jun 27 13:48:18 2013 +0200
> > > > > >
> > > > > >     drm/nouveau: make flipping lockdep safe
> > > > > >
> > > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > > > Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>
> > > > > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > > > > Cc: Dave Airlie <airlied@gmail.com>
> > > > > > Cc: nouveau@lists.freedesktop.org
> > > > > > ---
> > > > > > I might be totally wrong, so this definitely needs testing :-)
> > > > > >
> > > > > > Cheers, Daniel
> > > > > > ---
> > > > > >  drivers/gpu/drm/nouveau/nouveau_bo.c | 6 +++++-
> > > > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > > index 7806278dce57..a7b2a9bb0ffe 100644
> > > > > > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > > @@ -776,7 +776,11 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
> > > > > >                       return ret;
> > > > > >       }
> > > > > >
> > > > > > -     mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
> > > > > > +     if (drm_drv_uses_atomic_modeset(drm->dev))
> > > > > > +             mutex_lock(&cli->mutex);
> > > > > > +     else
> > > > > > +             mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
> > > > > > +
> > > > > >       ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, intr);
> > > > > >       if (ret == 0) {
> > > > > >               ret = drm->ttm.move(chan, bo, &bo->mem, new_reg);
> > > > >
> > > > > Well if you're certain it works now. :)
> > > > >
> > > > > Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Acked-by: Ben Skeggs <bskeggs@redhat.com>
>
> Can you pull this in through your tree and maybe give it a spin just to
> make sure? I don't really have nouveau hardware here.
Yeah, I can do that easily enough.

Ben.

>
> Also it's entirely stand-alone, I was simply reviewing all the
> mutex_lock_nested we have in drm, and this one stuck out as probably not
> necessary anymore, at least with atomic.
>
> I guess I can also just stuff it into drm-misc-next and if it blows up,
> figure out what to do then :-)
> -Daniel
>
> >
> > > > >
> > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> > > _______________________________________________
> > > Nouveau mailing list
> > > Nouveau@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/nouveau
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
