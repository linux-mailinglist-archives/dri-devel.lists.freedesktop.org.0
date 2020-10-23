Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33406296F7F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5EB46F630;
	Fri, 23 Oct 2020 12:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391EB6F63C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:38:56 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id h5so1633778wrv.7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ygIUgxo0dh1fuykJKpg3w3uVxDyWun73vgGJ+UyorVM=;
 b=RkCvgzq5Wl4TKO2Csa1YBhuATycNpqqIEFZXgImCY20g+qVFLmMzuStdXaKDKKfZ54
 EWrbA2C0M4vPN5amconmnxSHjvh1YQDDGsWPbhmeyTLcTrvYFwJPsyufHGl0mX5Zj02H
 oQmqVMcoAoB1DljW1+yo84XiwYn1e+7ah5mpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ygIUgxo0dh1fuykJKpg3w3uVxDyWun73vgGJ+UyorVM=;
 b=QMgt0sSZ8hyFHqmF0ZsvrjKHQKZeD3kyOhpuY5V1/35F3+YRvi/reYzIunSDneRnH0
 PYzH0aHQJ3BNjZtBQTjHFBpJ6krdTqeE3BUhHB1zfV/34bZ0QPXGbMFBe0YOAuE8Zzc1
 ITQQtU94H1Vn/EeUbSil/NEOhO9vywYqLP4VMRH2uPe5YSrv3mwt8mEOTjtWce1N8LyB
 27BqprDRcUDhfxSSrUnhIEBRmhxWU8aLCrFvQmkUqRQDOhEROwAls/ovpdfzFU9PvU3C
 JgK44NnME+uO9tiBqxY6zzUyH95WHe6KwXMhWx7xEyi8aQPO/YrPRAnku52fBiAjSSs9
 2QSQ==
X-Gm-Message-State: AOAM532KSF+UTXdfL/YLcmiwo4haawvEa9fsJMs+U4CcbcTjU3LBeNNI
 /AYz+dJbGBxsg3iACOX5DftwyQ==
X-Google-Smtp-Source: ABdhPJyyrNZS7i3TIK8i5QX5lqL5cGVtaMaql3xV3Pv00BOmYVhRchbZFDh/At5+TrbySPjoE6TYZg==
X-Received: by 2002:a5d:60c4:: with SMTP id x4mr2565075wrt.175.1603456734866; 
 Fri, 23 Oct 2020 05:38:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l8sm3076401wrn.28.2020.10.23.05.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:38:53 -0700 (PDT)
Date: Fri, 23 Oct 2020 14:38:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Drop mutex_lock_nested for atomic
Message-ID: <20201023123851.GD401619@phenom.ffwll.local>
References: <20200802181849.1586281-1-daniel.vetter@ffwll.ch>
 <579702ca-4b4e-0b05-1b93-25b99554d464@linux.intel.com>
 <CAKMK7uHbdcLMJONxR5OZXBLtm0WVxT117mBD72RDW5MRQ=ky4g@mail.gmail.com>
 <CAKMK7uE89ZyvVronwpS=+ovJj_njVo3C5+GjjZp2S-Dk_7p2jg@mail.gmail.com>
 <CACAvsv7nmpJPVnfGkRW=UECvNyjNRO0x=0VMPr0VuFBNtpk+2g@mail.gmail.com>
 <20200930093735.GT438822@phenom.ffwll.local>
 <CACAvsv6ziC2K58-H35hWY5b35pW2YyLJGWi_X=utkh=meybRow@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACAvsv6ziC2K58-H35hWY5b35pW2YyLJGWi_X=utkh=meybRow@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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

On Thu, Oct 01, 2020 at 08:46:59AM +1000, Ben Skeggs wrote:
> On Wed, 30 Sep 2020 at 19:37, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Sep 30, 2020 at 10:45:05AM +1000, Ben Skeggs wrote:
> > > On Wed, 30 Sep 2020 at 00:52, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > >
> > > > On Thu, Sep 17, 2020 at 3:15 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > >
> > > > > Ben, did you have a chance to look at this?
> > > >
> > > > Ping
> > > > -Daniel
> > > >
> > > > > On Mon, Aug 3, 2020 at 1:22 PM Maarten Lankhorst
> > > > > <maarten.lankhorst@linux.intel.com> wrote:
> > > > > >
> > > > > > Op 02-08-2020 om 20:18 schreef Daniel Vetter:
> > > > > > > Purely conjecture, but I think the original locking inversion with the
> > > > > > > legacy page flip code between flipping and ttm's bo move function
> > > > > > > shoudn't exist anymore with atomic: With atomic the bo pinning and
> > > > > > > actual modeset commit is completely separated in the code patsh.
> > > > > > >
> > > > > > > This annotation was originally added in
> > > > > > >
> > > > > > > commit 060810d7abaabcab282e062c595871d661561400
> > > > > > > Author: Ben Skeggs <bskeggs@redhat.com>
> > > > > > > Date:   Mon Jul 8 14:15:51 2013 +1000
> > > > > > >
> > > > > > >     drm/nouveau: fix locking issues in page flipping paths
> > > > > > >
> > > > > > > due to
> > > > > > >
> > > > > > > commit b580c9e2b7ba5030a795aa2fb73b796523d65a78
> > > > > > > Author: Maarten Lankhorst <m.b.lankhorst@gmail.com>
> > > > > > > Date:   Thu Jun 27 13:48:18 2013 +0200
> > > > > > >
> > > > > > >     drm/nouveau: make flipping lockdep safe
> > > > > > >
> > > > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > > > > Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>
> > > > > > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > > > > > Cc: Dave Airlie <airlied@gmail.com>
> > > > > > > Cc: nouveau@lists.freedesktop.org
> > > > > > > ---
> > > > > > > I might be totally wrong, so this definitely needs testing :-)
> > > > > > >
> > > > > > > Cheers, Daniel
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/nouveau/nouveau_bo.c | 6 +++++-
> > > > > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > > > index 7806278dce57..a7b2a9bb0ffe 100644
> > > > > > > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > > > @@ -776,7 +776,11 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
> > > > > > >                       return ret;
> > > > > > >       }
> > > > > > >
> > > > > > > -     mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
> > > > > > > +     if (drm_drv_uses_atomic_modeset(drm->dev))
> > > > > > > +             mutex_lock(&cli->mutex);
> > > > > > > +     else
> > > > > > > +             mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
> > > > > > > +
> > > > > > >       ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, intr);
> > > > > > >       if (ret == 0) {
> > > > > > >               ret = drm->ttm.move(chan, bo, &bo->mem, new_reg);
> > > > > >
> > > > > > Well if you're certain it works now. :)
> > > > > >
> > > > > > Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Acked-by: Ben Skeggs <bskeggs@redhat.com>
> >
> > Can you pull this in through your tree and maybe give it a spin just to
> > make sure? I don't really have nouveau hardware here.
> Yeah, I can do that easily enough.

Hi Ben,

I'm still hanging on this one, doesn't seem to have made it into drm-next.
Got lost or still somewhere in a queue?

Thanks, Daniel

> 
> Ben.
> 
> >
> > Also it's entirely stand-alone, I was simply reviewing all the
> > mutex_lock_nested we have in drm, and this one stuck out as probably not
> > necessary anymore, at least with atomic.
> >
> > I guess I can also just stuff it into drm-misc-next and if it blows up,
> > figure out what to do then :-)
> > -Daniel
> >
> > >
> > > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > > >
> > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> > > > _______________________________________________
> > > > Nouveau mailing list
> > > > Nouveau@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/nouveau
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
