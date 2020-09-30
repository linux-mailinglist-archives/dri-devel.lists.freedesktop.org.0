Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF3127E54A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 11:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AEB6E3F4;
	Wed, 30 Sep 2020 09:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033956E02E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 09:37:39 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w2so953907wmi.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 02:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hjfKAUFU8A+iw48WdP6HeZS9N9KQ849MhRGEMeIXAb0=;
 b=aeYYjQxm1+C5Ql5t5PlgsmKLT1QG4ie2sRae8WwMKJkAE/egxTsQHhMUQbGjQukF6q
 u/m8VnbLNG7VL4f8ilJA8vD5yd7YtyTzXZMrqpS1w1JWYXyKEQu739nNYz/k2ZrZ9Fic
 v4oWTzVNWOE9mnZBSShnBYwEU6FRbNIcP22K4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hjfKAUFU8A+iw48WdP6HeZS9N9KQ849MhRGEMeIXAb0=;
 b=hImoTP8bUZQbKF5ZTGt7xgHlSLx1K7UaRTUH/hXxPUv3tfEg9hHDK0B9W9g1x+JKhY
 E63xTmTLS8beDXAve/Gs09o0px0xIOrU593mY8nZg4Bq7X9+uv/vcxfcZhFOfnOHr+hp
 gAQiq+qzWTH8mireUe1AIh6lEUKTwSk0KYpKGQLiFmfh66pQvojU/F/WYEQFgtcqjP1q
 wHZf+sDWFkSdqI/GWmmkECgHLtj0jIE2u79a1EsFmKPfuYJQhkvUjP6i3+8n/bIRLfzF
 kXWO7KBBT20QKTAWLMygP9v7e8k9TB1R0D6quf2CItPEdeMSaZBz0DwrxzGAAbYgFJ6Z
 K7MQ==
X-Gm-Message-State: AOAM533XLOpb4+y4pvYKJ1x6tjB/pzNrnO5m6tzsZ84vXjHf/s//64Bp
 RzrrHfYVbPPGeqUULYFN/Y2t7A==
X-Google-Smtp-Source: ABdhPJxwJCEavibzrwnVF4D/zZJshVhO/enisRJRM2wqo+dFhs11Izcu3XWmvvCSF5Mfgm0gHg274w==
X-Received: by 2002:a1c:c28a:: with SMTP id s132mr422373wmf.13.1601458658638; 
 Wed, 30 Sep 2020 02:37:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f14sm2044917wrv.72.2020.09.30.02.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 02:37:37 -0700 (PDT)
Date: Wed, 30 Sep 2020 11:37:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Drop mutex_lock_nested for atomic
Message-ID: <20200930093735.GT438822@phenom.ffwll.local>
References: <20200802181849.1586281-1-daniel.vetter@ffwll.ch>
 <579702ca-4b4e-0b05-1b93-25b99554d464@linux.intel.com>
 <CAKMK7uHbdcLMJONxR5OZXBLtm0WVxT117mBD72RDW5MRQ=ky4g@mail.gmail.com>
 <CAKMK7uE89ZyvVronwpS=+ovJj_njVo3C5+GjjZp2S-Dk_7p2jg@mail.gmail.com>
 <CACAvsv7nmpJPVnfGkRW=UECvNyjNRO0x=0VMPr0VuFBNtpk+2g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACAvsv7nmpJPVnfGkRW=UECvNyjNRO0x=0VMPr0VuFBNtpk+2g@mail.gmail.com>
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

On Wed, Sep 30, 2020 at 10:45:05AM +1000, Ben Skeggs wrote:
> On Wed, 30 Sep 2020 at 00:52, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > On Thu, Sep 17, 2020 at 3:15 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > Ben, did you have a chance to look at this?
> >
> > Ping
> > -Daniel
> >
> > > On Mon, Aug 3, 2020 at 1:22 PM Maarten Lankhorst
> > > <maarten.lankhorst@linux.intel.com> wrote:
> > > >
> > > > Op 02-08-2020 om 20:18 schreef Daniel Vetter:
> > > > > Purely conjecture, but I think the original locking inversion with the
> > > > > legacy page flip code between flipping and ttm's bo move function
> > > > > shoudn't exist anymore with atomic: With atomic the bo pinning and
> > > > > actual modeset commit is completely separated in the code patsh.
> > > > >
> > > > > This annotation was originally added in
> > > > >
> > > > > commit 060810d7abaabcab282e062c595871d661561400
> > > > > Author: Ben Skeggs <bskeggs@redhat.com>
> > > > > Date:   Mon Jul 8 14:15:51 2013 +1000
> > > > >
> > > > >     drm/nouveau: fix locking issues in page flipping paths
> > > > >
> > > > > due to
> > > > >
> > > > > commit b580c9e2b7ba5030a795aa2fb73b796523d65a78
> > > > > Author: Maarten Lankhorst <m.b.lankhorst@gmail.com>
> > > > > Date:   Thu Jun 27 13:48:18 2013 +0200
> > > > >
> > > > >     drm/nouveau: make flipping lockdep safe
> > > > >
> > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > > Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>
> > > > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > > > Cc: Dave Airlie <airlied@gmail.com>
> > > > > Cc: nouveau@lists.freedesktop.org
> > > > > ---
> > > > > I might be totally wrong, so this definitely needs testing :-)
> > > > >
> > > > > Cheers, Daniel
> > > > > ---
> > > > >  drivers/gpu/drm/nouveau/nouveau_bo.c | 6 +++++-
> > > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > index 7806278dce57..a7b2a9bb0ffe 100644
> > > > > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > @@ -776,7 +776,11 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
> > > > >                       return ret;
> > > > >       }
> > > > >
> > > > > -     mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
> > > > > +     if (drm_drv_uses_atomic_modeset(drm->dev))
> > > > > +             mutex_lock(&cli->mutex);
> > > > > +     else
> > > > > +             mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
> > > > > +
> > > > >       ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, intr);
> > > > >       if (ret == 0) {
> > > > >               ret = drm->ttm.move(chan, bo, &bo->mem, new_reg);
> > > >
> > > > Well if you're certain it works now. :)
> > > >
> > > > Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Acked-by: Ben Skeggs <bskeggs@redhat.com>

Can you pull this in through your tree and maybe give it a spin just to
make sure? I don't really have nouveau hardware here.

Also it's entirely stand-alone, I was simply reviewing all the
mutex_lock_nested we have in drm, and this one stuck out as probably not
necessary anymore, at least with atomic.

I guess I can also just stuff it into drm-misc-next and if it blows up,
figure out what to do then :-)
-Daniel

> 
> > > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
