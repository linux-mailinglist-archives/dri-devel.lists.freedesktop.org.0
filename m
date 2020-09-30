Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB30127DD80
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 02:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0ADA89EEB;
	Wed, 30 Sep 2020 00:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53D589EEB;
 Wed, 30 Sep 2020 00:45:17 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id s19so5066981ybc.5;
 Tue, 29 Sep 2020 17:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TCuS1SFM3rtFY9nQD9y59GPaHLOThNZLeNFklAwpXq4=;
 b=imv8UC73+sPVgA3YQ/G1pSugmbwMVMN1p2shPAUILME7w23mDi43ewJRQ+wfVonOb/
 ac2jlI8sgxl42kcaGl3iDBjl01KkPIEmlydLP5k/Z5v0iNMcmXRIAmmJuWtf5xhaQoKl
 9iwd6M1U9vouycYr7JUcZMDoyriu7sxwq3bvPFFD4L7SgNrlgmpHzDv4yqnqGXVtaRJ7
 9gGai26jAaZKwdgLmAhCn1g//+HyPJ/njd3yCyLzww63ZcaGC6RkVWWI5av3a1IYDmck
 uV5k4W72osA0pilj1SAWW2OEt7fkebpatUpDZ3XQVByx+CMtvvn6RuKh3eujqK1z5xKK
 jS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TCuS1SFM3rtFY9nQD9y59GPaHLOThNZLeNFklAwpXq4=;
 b=jd0PvfACCyuG3EjxZMAsv8eTcPmVh0WHQE6jQQaiESCocKVd35nfTe3h4EjXAk4CSu
 WT4DOj3XcdVC+qBAt9/PwPMx7/2cluBImzMXsaUNYZxk3vzeZgVjn1LU/JVnspa0o/8l
 LuYar9Jq6q/kbtxd2txK7zvNGp9+QVo7tnRweNwzAK7zAbGgBiHhE49BmU4gXWOq9X6/
 +IWXYZVozcLUWehSY4gWgSOILo70Nx8ZgqJrWCQWLwMhOyFT0YNd7+GHIRkuYuhAryJG
 2hOs8MMXBorMpR95VXvzJARMAEY88T3Dbw8+vt8CcMqH8zggQWey+TMVuO6iHFpkjJoQ
 e+iQ==
X-Gm-Message-State: AOAM532n8w589kiguYADoy3Nm0PQrmQ6a1vRtlu2ERKGeu6CBGxcQ6qP
 7SKU1OZvHb3DhiiJ7s9FbFgbByommmI5ohbF6Qo=
X-Google-Smtp-Source: ABdhPJzI+KPQXt9sMsNuh/RqjX4xnXDaIKJyY/MaKl76cd1ZGCSuc6U19jjx+slXvG1q8m0gx7k5NYtTrAeafBlkPYM=
X-Received: by 2002:a25:7102:: with SMTP id m2mr14082ybc.435.1601426716825;
 Tue, 29 Sep 2020 17:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200802181849.1586281-1-daniel.vetter@ffwll.ch>
 <579702ca-4b4e-0b05-1b93-25b99554d464@linux.intel.com>
 <CAKMK7uHbdcLMJONxR5OZXBLtm0WVxT117mBD72RDW5MRQ=ky4g@mail.gmail.com>
 <CAKMK7uE89ZyvVronwpS=+ovJj_njVo3C5+GjjZp2S-Dk_7p2jg@mail.gmail.com>
In-Reply-To: <CAKMK7uE89ZyvVronwpS=+ovJj_njVo3C5+GjjZp2S-Dk_7p2jg@mail.gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 30 Sep 2020 10:45:05 +1000
Message-ID: <CACAvsv7nmpJPVnfGkRW=UECvNyjNRO0x=0VMPr0VuFBNtpk+2g@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Drop mutex_lock_nested for atomic
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Sep 2020 at 00:52, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Thu, Sep 17, 2020 at 3:15 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > Ben, did you have a chance to look at this?
>
> Ping
> -Daniel
>
> > On Mon, Aug 3, 2020 at 1:22 PM Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com> wrote:
> > >
> > > Op 02-08-2020 om 20:18 schreef Daniel Vetter:
> > > > Purely conjecture, but I think the original locking inversion with the
> > > > legacy page flip code between flipping and ttm's bo move function
> > > > shoudn't exist anymore with atomic: With atomic the bo pinning and
> > > > actual modeset commit is completely separated in the code patsh.
> > > >
> > > > This annotation was originally added in
> > > >
> > > > commit 060810d7abaabcab282e062c595871d661561400
> > > > Author: Ben Skeggs <bskeggs@redhat.com>
> > > > Date:   Mon Jul 8 14:15:51 2013 +1000
> > > >
> > > >     drm/nouveau: fix locking issues in page flipping paths
> > > >
> > > > due to
> > > >
> > > > commit b580c9e2b7ba5030a795aa2fb73b796523d65a78
> > > > Author: Maarten Lankhorst <m.b.lankhorst@gmail.com>
> > > > Date:   Thu Jun 27 13:48:18 2013 +0200
> > > >
> > > >     drm/nouveau: make flipping lockdep safe
> > > >
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>
> > > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > > Cc: Dave Airlie <airlied@gmail.com>
> > > > Cc: nouveau@lists.freedesktop.org
> > > > ---
> > > > I might be totally wrong, so this definitely needs testing :-)
> > > >
> > > > Cheers, Daniel
> > > > ---
> > > >  drivers/gpu/drm/nouveau/nouveau_bo.c | 6 +++++-
> > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > index 7806278dce57..a7b2a9bb0ffe 100644
> > > > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > @@ -776,7 +776,11 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
> > > >                       return ret;
> > > >       }
> > > >
> > > > -     mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
> > > > +     if (drm_drv_uses_atomic_modeset(drm->dev))
> > > > +             mutex_lock(&cli->mutex);
> > > > +     else
> > > > +             mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
> > > > +
> > > >       ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, intr);
> > > >       if (ret == 0) {
> > > >               ret = drm->ttm.move(chan, bo, &bo->mem, new_reg);
> > >
> > > Well if you're certain it works now. :)
> > >
> > > Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Acked-by: Ben Skeggs <bskeggs@redhat.com>

> > >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
