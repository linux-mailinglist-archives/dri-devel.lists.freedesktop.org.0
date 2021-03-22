Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B05B34462C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 14:49:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D726E48B;
	Mon, 22 Mar 2021 13:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BDC6E48F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 13:49:31 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id o16so16921285wrn.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 06:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=xT7psetKthcee1tu4yiJzLBGQNyspfMj6+CKGIBZ3Xs=;
 b=MJqqM7S9ygKt8dpiLYhhGSglSFmHE0PXVJ+jyUWEbyVrzPJsBUo9LZ+tPkTGnxnR2s
 YRBJ0tJzg+FXcjkj9AuqVXwY+Kupk0+DBQVWWtUVmcBbDgZPK4XGUeXOXAhJ2EsMakws
 wV5cswsLIax+9ftylfd/1zm1OsC8WMj1qmwRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=xT7psetKthcee1tu4yiJzLBGQNyspfMj6+CKGIBZ3Xs=;
 b=choE0aTySnmNyd7q4acGTZycHpZDUsynvcXwU9cPzZ9A+a/n+vFRsmtYdfrR7mWNpy
 OdK3T2xj5XqzpSkqjyKqbOCnUXcRsRWxnhzrTQzb06nGcL5U7bqfTmojuUmw0ZW0d4qr
 v8JngTDk037CU/+RvqyBsmDCGAPdezIqGXVsixBBuvN8WVO4LWg2DOAh3yq2Nq9gcfQO
 xS3voDWKfZtVGDfUlYsbcxt37KgcCzaUbsAdr7qMIpNlIIp8JNss56RhR/7aTJNFb8du
 ZWUq/wvUZPEqtPUyfSw3s2zf3nc9bF+syKBh4VZSSwHzS1aQpXCooG/8zNhfSj9TEYNR
 R9mA==
X-Gm-Message-State: AOAM530Q2+qEqqu1dHdyCyh3avW/MvDBy1vC1yvP6SVqm48Ko/B2Zu9n
 H0YLEPN9rGTC8jRCnIrD77mtLw==
X-Google-Smtp-Source: ABdhPJxVt9tqhHcq33JACoqofNnvppHmkEg7LB5PGyXyk4Ayy3iCyUutFdSUdYICTPUGyaq2cFDB2w==
X-Received: by 2002:a5d:6242:: with SMTP id m2mr6622679wrv.384.1616420969901; 
 Mon, 22 Mar 2021 06:49:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v13sm22687086wrt.45.2021.03.22.06.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 06:49:29 -0700 (PDT)
Date: Mon, 22 Mar 2021 14:49:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Dave Chinner <dchinner@redhat.com>
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
Message-ID: <YFigZ5+H95c/GI/S@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 Matthew Wilcox <willy@infradead.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>
References: <20210319140857.2262-1-christian.koenig@amd.com>
 <YFTk1GSaUDI3wcWt@phenom.ffwll.local>
 <2831bfcc-140e-dade-1f50-a6431e495e9d@gmail.com>
 <YFT2LSR97rkkPyEP@phenom.ffwll.local>
 <1ae415c4-8e49-5183-b44d-bc92088657d5@gmail.com>
 <CAKMK7uEDhuvSwJj5CX8vHgLb+5zm=rdJPmXwb-VQWdrW6GwQZw@mail.gmail.com>
 <e6e9df3e-cd2b-d80f-205d-6ca1865819b2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6e9df3e-cd2b-d80f-205d-6ca1865819b2@gmail.com>
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
Cc: Linux MM <linux-mm@kvack.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Leo Liu <Leo.Liu@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 21, 2021 at 03:18:28PM +0100, Christian K=F6nig wrote:
> Am 20.03.21 um 14:17 schrieb Daniel Vetter:
> > On Sat, Mar 20, 2021 at 10:04 AM Christian K=F6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > Am 19.03.21 um 20:06 schrieb Daniel Vetter:
> > > > On Fri, Mar 19, 2021 at 07:53:48PM +0100, Christian K=F6nig wrote:
> > > > > Am 19.03.21 um 18:52 schrieb Daniel Vetter:
> > > > > > On Fri, Mar 19, 2021 at 03:08:57PM +0100, Christian K=F6nig wro=
te:
> > > > > > > Don't print a warning when we fail to allocate a page for swa=
pping things out.
> > > > > > > =

> > > > > > > Also rely on memalloc_nofs_save/memalloc_nofs_restore instead=
 of GFP_NOFS.
> > > > > > Uh this part doesn't make sense. Especially since you only do i=
t for the
> > > > > > debugfs file, not in general. Which means you've just completel=
y broken
> > > > > > the shrinker.
> > > > > Are you sure? My impression is that GFP_NOFS should now work much=
 more out
> > > > > of the box with the memalloc_nofs_save()/memalloc_nofs_restore().
> > > > Yeah, if you'd put it in the right place :-)
> > > > =

> > > > But also -mm folks are very clear that memalloc_no*() family is for=
 dire
> > > > situation where there's really no other way out. For anything where=
 you
> > > > know what you're doing, you really should use explicit gfp flags.
> > > My impression is just the other way around. You should try to avoid t=
he
> > > NOFS/NOIO flags and use the memalloc_no* approach instead.
> > Where did you get that idea?
> =

> Well from the kernel comment on GFP_NOFS:
> =

> =A0* %GFP_NOFS will use direct reclaim but will not use any filesystem
> interfaces.
> =A0* Please try to avoid using this flag directly and instead use
> =A0* memalloc_nofs_{save,restore} to mark the whole scope which
> cannot/shouldn't
> =A0* recurse into the FS layer with a short explanation why. All allocati=
on
> =A0* requests will inherit GFP_NOFS implicitly.

Huh that's interesting, since iirc Willy or Dave told me the opposite, and
the memalloc_no* stuff is for e.g. nfs calling into network layer (needs
GFP_NOFS) or swap on top of a filesystems (even needs GFP_NOIO I think).

Adding them, maybe I got confused.

> > The kernel is full of explicit gfp_t flag
> > passing to make this as explicit as possible. The memalloc_no* stuff
> > is just for when you go through entire subsystems and really can't
> > wire it through. I can't find the discussion anymore, but that was the
> > advice I got from mm/fs people.
> > =

> > One reason is that generally a small GFP_KERNEL allocation never
> > fails. But it absolutely can fail if it's in a memalloc_no* section,
> > and these kind of non-obvious non-local effects are a real pain in
> > testing and review. Hence explicit gfp_flag passing as much as
> > possible.
> > =

> > > > > > If this is just to paper over the seq_printf doing the wrong al=
locations,
> > > > > > then just move that out from under the fs_reclaim_acquire/relea=
se part.
> > > > > No, that wasn't the problem.
> > > > > =

> > > > > We have just seen to many failures to allocate pages for swapout =
and I think
> > > > > that would improve this because in a lot of cases we can then imm=
ediately
> > > > > swap things out instead of having to rely on upper layers.
> > > > Yeah, you broke it. Now the real shrinker is running with GFP_KERNE=
L,
> > > > because your memalloc_no is only around the debugfs function. And o=
fc it's
> > > > much easier to allocate with GFP_KERNEL, right until you deadlock :=
-)
> > > The problem here is that for example kswapd calls the shrinker without
> > > holding a FS lock as far as I can see.
> > > =

> > > And it is rather sad that we can't optimize this case directly.
> > I'm still not clear what you want to optimize? You can check for "is
> > this kswapd" in pf flags, but that sounds very hairy and fragile.
> =

> Well we only need the NOFS flag when the shrinker callback really comes f=
rom
> a memory shortage in the FS subsystem, and that is rather unlikely.
> =

> When we would allow all other cases to be able to directly IO the freed up
> pages to swap it would certainly help.

tbh I'm not sure. i915-gem code has played tricks with special casing the
kswapd path, and they do kinda scare me at least. I'm not sure whether
there's not some hidden dependencies there that would make this a bad
idea. Like afaik direct reclaim can sometimes stall for kswapd to catch up
a bit, or at least did in the past (I think, really not much clue about
this)

The other thing is that the fs_reclaim_acquire/release annotation really
only works well if you use it outside of the direct reclaim path too.
Otherwise it's not much better than just lots of testing. That pretty much
means you have to annotate the kswapd path.
-Daniel



> =

> Christian.
> =

> > -Daniel
> > =

> > > Anyway you are right if some caller doesn't use the memalloc_no*()
> > > approach we are busted.
> > > =

> > > Going to change the patch to only not warn for the moment.
> > > =

> > > Regards,
> > > Christian.
> > > =

> > > > Shrinking is hard, there's no easy way out here.
> > > > =

> > > > Cheers, Daniel
> > > > =

> > > > > Regards,
> > > > > Christian.
> > > > > =

> > > > > =

> > > > > > __GFP_NOWARN should be there indeed I think.
> > > > > > -Daniel
> > > > > > =

> > > > > > > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > > > > > > ---
> > > > > > >     drivers/gpu/drm/ttm/ttm_tt.c | 5 ++++-
> > > > > > >     1 file changed, 4 insertions(+), 1 deletion(-)
> > > > > > > =

> > > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/t=
tm/ttm_tt.c
> > > > > > > index 2f0833c98d2c..86fa3e82dacc 100644
> > > > > > > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > > > > > > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > > > > > > @@ -369,7 +369,7 @@ static unsigned long ttm_tt_shrinker_scan=
(struct shrinker *shrink,
> > > > > > >             };
> > > > > > >             int ret;
> > > > > > > -  ret =3D ttm_bo_swapout(&ctx, GFP_NOFS);
> > > > > > > +  ret =3D ttm_bo_swapout(&ctx, GFP_KERNEL | __GFP_NOWARN);
> > > > > > >             return ret < 0 ? SHRINK_EMPTY : ret;
> > > > > > >     }
> > > > > > > @@ -389,10 +389,13 @@ static unsigned long ttm_tt_shrinker_co=
unt(struct shrinker *shrink,
> > > > > > >     static int ttm_tt_debugfs_shrink_show(struct seq_file *m,=
 void *data)
> > > > > > >     {
> > > > > > >             struct shrink_control sc =3D { .gfp_mask =3D GFP_=
KERNEL };
> > > > > > > +  unsigned int flags;
> > > > > > >             fs_reclaim_acquire(GFP_KERNEL);
> > > > > > > +  flags =3D memalloc_nofs_save();
> > > > > > >             seq_printf(m, "%lu/%lu\n", ttm_tt_shrinker_count(=
&mm_shrinker, &sc),
> > > > > > >                        ttm_tt_shrinker_scan(&mm_shrinker, &sc=
));
> > > > > > > +  memalloc_nofs_restore(flags);
> > > > > > >             fs_reclaim_release(GFP_KERNEL);
> > > > > > >             return 0;
> > > > > > > --
> > > > > > > 2.25.1
> > > > > > > =

> > > > > > > _______________________________________________
> > > > > > > dri-devel mailing list
> > > > > > > dri-devel@lists.freedesktop.org
> > > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
