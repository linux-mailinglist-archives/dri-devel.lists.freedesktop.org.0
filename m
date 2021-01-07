Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C142ED46D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 17:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E456B6E4A1;
	Thu,  7 Jan 2021 16:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA54B6E4A1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 16:38:57 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id y23so6098990wmi.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 08:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/kxnmvrI84UScZ5jgNwMQkZ3Gp1CSeaKOmobqzdE6MI=;
 b=F+4Subm8bIKD2BUGXVp7ujxB3HzVQCUALwn3zvguDpbMC0wAXTY/Og4lhXYB8YeNFD
 sJ2LNldw/8c1eW3Fs+8ORMNXFatjP00rTKYlNSBU+xPDSWICQX/mf4E9TKGcLSaj6nYi
 LZHbzt6DcAvl75PAXI1cE1P3uYONFjOPKVHGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/kxnmvrI84UScZ5jgNwMQkZ3Gp1CSeaKOmobqzdE6MI=;
 b=cVbPFlN7EsDOjoC7kog/kPjpOW2KAC7/ZQ5gOZIALLnp5MFukmVh3fb7S2MuWtXhnz
 E7GclIFTroazr1leYNChZyraxcSnEp9stsqNuo+mCa66HMmpzxrvqwqtldtt9+rNeR2T
 Qpf/OqVR6Gd8mKgeKQC4eKCg+i+0iv/X0pq42aiF5+vEPwr3TIaLEe3lT9utSLk+Psl/
 8q8H/g0D+3ZCmfcY09l2NW/eHIdHb630XDP2r89wPWVvC03QLiQjHfZ1MXhibEHSu43a
 TQh7/PA7ADg4PKFeEnyvEK/lkmP4sEK2ecgtgB2dXrl42rDtEG4mPzejerglzIElm9FP
 WbkQ==
X-Gm-Message-State: AOAM532icNq2yJ+1PZgFtbmdkZ+hq2HD9dsb0zer9PkjtDCKC9qykNsn
 Bx0avBIFAJS2epX9AD0h73ANfA==
X-Google-Smtp-Source: ABdhPJyWZiN2KMh1qdXV6YHtK5wgq54F7nDz80qab1imypKSDQgbKHI4V4HMOpg1+0HqTfALZ/h+gg==
X-Received: by 2002:a7b:cd91:: with SMTP id y17mr8397384wmj.171.1610037536438; 
 Thu, 07 Jan 2021 08:38:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h3sm8473519wmm.4.2021.01.07.08.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 08:38:55 -0800 (PST)
Date: Thu, 7 Jan 2021 17:38:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [PATCH 4/4] drm/ttm: optimize ttm pool shrinker a bit
Message-ID: <X/c5HblJMRcHoQ64@phenom.ffwll.local>
References: <20201218175538.1364-1-christian.koenig@amd.com>
 <20201218175538.1364-4-christian.koenig@amd.com>
 <X+H5+OuETFR7ePdp@phenom.ffwll.local>
 <9d9a41f7-20cd-c0e3-6438-e72bce57a5a4@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9d9a41f7-20cd-c0e3-6438-e72bce57a5a4@gmail.com>
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
Cc: ray.huang@amd.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 07, 2021 at 01:49:45PM +0100, Christian K=F6nig wrote:
> Am 22.12.20 um 14:51 schrieb Daniel Vetter:
> > On Fri, Dec 18, 2020 at 06:55:38PM +0100, Christian K=F6nig wrote:
> > > Only initialize the DMA coherent pools if they are used.
> > > =

> > > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > Ah, just realized the answer to my question on patch 2: The pools are
> > per-device, due to dma_alloc_coherent being per-device (but really most=
ly
> > it isn't, but that's what we have to deal with fighting the dma-api
> > abstraction).
> > =

> > I think this would make a lot more sense if the shrinkers are per-pool
> > (and also most of the debugfs files), since as-is in a multi-gpu system
> > the first gpu's pool gets preferrentially thrashed. Which isn't a nice
> > design. Splitting that into per gpu shrinkers means we get equal shrink=
ing
> > without having to maintain a global lru. This is how xfs seems to set up
> > their shrinkers, and in general xfs people have a solid understanding of
> > this stuff.
> =

> Well fairness and not trashing the first GPUs pool is the reason why I
> implemented just one shrinker plus a global LRU.

That's kinda defeating the point of how the core mm works. At least of how
I'm understanding how it works. Imo we shouldn't try to re-implement this
kind of balancing across different pools in our callback, since core mm
tries pretty hard to equally shrink already (it only shrinks each shrinker
a little bit each round, but does a lot of rounds under memory pressure).

Also maintaining your own global lru means global locking for the usual
case of none-to-little memory contention, unecessarily wasting the fast
path.

> In other words shrink_slab() just uses list_for_each_entry() on all
> shrinkers.
> =

> In the pool shrinker callback shrink one pool and move it to the end of t=
he
> shrinker list.
> =

> > =

> > Aside: I think it also would make tons of sense to split up your new ttm
> > bo shrinker up into a per-device lru, and throw the global system memory
> > lru out the window completely :-) Assuming we can indeed get rid of it,
> > and vmwgfx doesn't need it somewhere still.
> =

> Yeah, I already have that as a patch set here, but I have this dependent =
on
> a larger rename of the device structures.

Hm maybe include that in the next round, just for the bigger picture?
Don't have to merge it all in one go, just want to make sure we agree on
where we're going.

> > Aside from this lgtm, but I guess will change a bit with that shuffling.
> =

> Thanks for the review, going to send out a new version with the
> fs_reclaim_acquire/release added in a minute.

Cool.

Cheers, Daniel

> =

> Christian.
> =

> > -Daniel
> > =

> > > ---
> > >   drivers/gpu/drm/ttm/ttm_pool.c | 23 ++++++++++++++++-------
> > >   1 file changed, 16 insertions(+), 7 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm=
_pool.c
> > > index 1cdacd58753a..f09e34614226 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > @@ -504,10 +504,12 @@ void ttm_pool_init(struct ttm_pool *pool, struc=
t device *dev,
> > >   	pool->use_dma_alloc =3D use_dma_alloc;
> > >   	pool->use_dma32 =3D use_dma32;
> > > -	for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> > > -		for (j =3D 0; j < MAX_ORDER; ++j)
> > > -			ttm_pool_type_init(&pool->caching[i].orders[j],
> > > -					   pool, i, j);
> > > +	if (use_dma_alloc) {
> > > +		for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> > > +			for (j =3D 0; j < MAX_ORDER; ++j)
> > > +				ttm_pool_type_init(&pool->caching[i].orders[j],
> > > +						   pool, i, j);
> > > +	}
> > >   }
> > >   EXPORT_SYMBOL(ttm_pool_init);
> > > @@ -523,9 +525,11 @@ void ttm_pool_fini(struct ttm_pool *pool)
> > >   {
> > >   	unsigned int i, j;
> > > -	for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> > > -		for (j =3D 0; j < MAX_ORDER; ++j)
> > > -			ttm_pool_type_fini(&pool->caching[i].orders[j]);
> > > +	if (pool->use_dma_alloc) {
> > > +		for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> > > +			for (j =3D 0; j < MAX_ORDER; ++j)
> > > +				ttm_pool_type_fini(&pool->caching[i].orders[j]);
> > > +	}
> > >   }
> > >   EXPORT_SYMBOL(ttm_pool_fini);
> > > @@ -630,6 +634,11 @@ int ttm_pool_debugfs(struct ttm_pool *pool, stru=
ct seq_file *m)
> > >   {
> > >   	unsigned int i;
> > > +	if (!pool->use_dma_alloc) {
> > > +		seq_puts(m, "unused\n");
> > > +		return 0;
> > > +	}
> > > +
> > >   	ttm_pool_debugfs_header(m);
> > >   	spin_lock(&shrinker_lock);
> > > -- =

> > > 2.25.1
> > > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
