Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9208C2FB652
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 14:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E936E243;
	Tue, 19 Jan 2021 13:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF926E243
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 13:22:53 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id w5so19698267wrm.11
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 05:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=UVWmygEc1Zb/iR4hSejARJ6KXUvjr8ozjb1C3jaiiXg=;
 b=QhMb2DPP3gpDbE8Zd9mS1w2tWD2KdapPX4mtR4x+tFIG65iW6xZ9JSXaa5gLiAfRVX
 F5oGh/424wgdHWdBM224JagK1duEYVX0qfQAXJ198WiWUm7E66Fs7JECO2cQdMp+yOR9
 g8lkcf85ptsbwdgROIagvYzVUSdZbt/raM+pU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UVWmygEc1Zb/iR4hSejARJ6KXUvjr8ozjb1C3jaiiXg=;
 b=GG31SEl9GidZV1dH9kGtEudZDeJZIiVdeGJtSoTMEMV6zjor4DVtDGR4Bo9uu3Uxed
 57JJZk34kq0Ivage8naVYHoNR5bdWlZLUOyJIulTr3GjVPSh1l4MiXYVlDKHUqZqJdi1
 mZi+tY5ePbJuqwSfDFkakCm0j57UYRVNKG63A1NJqglJD9qKKf03YF0+EczDYQ5EAi2z
 At7RhpI9lvASGIuFGVeyWPValeFwYQwXYBMLYT6GKpjlJMJnh7yVdUDWg27BG75maf10
 hY8XSy2UF6QpzrUV1y+XHikQusMgzNIXavKXkNQAbSSq29/ERtpcuTZ15QFVLGa7HHpv
 b5ww==
X-Gm-Message-State: AOAM533f65hZNKUm3+bUKYET0BviMlZKSPkv29hBOqTJwa8n6nQLHDH4
 WuHHXoWvnTlHeiPZEa74MJ0/zQ==
X-Google-Smtp-Source: ABdhPJx3BzmbxbTTSR2V36P9XczWySUAl9bPWPjhFcVoxhmLCQBBMJWs7BCIxAwB/Kt+pAM02g90EQ==
X-Received: by 2002:a5d:504d:: with SMTP id h13mr4484180wrt.246.1611062571903; 
 Tue, 19 Jan 2021 05:22:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l12sm4727828wmj.9.2021.01.19.05.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 05:22:50 -0800 (PST)
Date: Tue, 19 Jan 2021 14:22:49 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 4/4] drm/ttm: optimize ttm pool shrinker a bit
Message-ID: <YAbdKe6o3V1ksPI6@phenom.ffwll.local>
References: <20201218175538.1364-1-christian.koenig@amd.com>
 <20201218175538.1364-4-christian.koenig@amd.com>
 <X+H5+OuETFR7ePdp@phenom.ffwll.local>
 <9d9a41f7-20cd-c0e3-6438-e72bce57a5a4@gmail.com>
 <X/c5HblJMRcHoQ64@phenom.ffwll.local>
 <8a0c9123-aaf1-fda1-d039-abe23e26d3f5@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a0c9123-aaf1-fda1-d039-abe23e26d3f5@amd.com>
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

On Tue, Jan 19, 2021 at 01:11:36PM +0100, Christian K=F6nig wrote:
> Am 07.01.21 um 17:38 schrieb Daniel Vetter:
> > On Thu, Jan 07, 2021 at 01:49:45PM +0100, Christian K=F6nig wrote:
> > > Am 22.12.20 um 14:51 schrieb Daniel Vetter:
> > > > On Fri, Dec 18, 2020 at 06:55:38PM +0100, Christian K=F6nig wrote:
> > > > > Only initialize the DMA coherent pools if they are used.
> > > > > =

> > > > > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > > > Ah, just realized the answer to my question on patch 2: The pools a=
re
> > > > per-device, due to dma_alloc_coherent being per-device (but really =
mostly
> > > > it isn't, but that's what we have to deal with fighting the dma-api
> > > > abstraction).
> > > > =

> > > > I think this would make a lot more sense if the shrinkers are per-p=
ool
> > > > (and also most of the debugfs files), since as-is in a multi-gpu sy=
stem
> > > > the first gpu's pool gets preferrentially thrashed. Which isn't a n=
ice
> > > > design. Splitting that into per gpu shrinkers means we get equal sh=
rinking
> > > > without having to maintain a global lru. This is how xfs seems to s=
et up
> > > > their shrinkers, and in general xfs people have a solid understandi=
ng of
> > > > this stuff.
> > > Well fairness and not trashing the first GPUs pool is the reason why I
> > > implemented just one shrinker plus a global LRU.
> > That's kinda defeating the point of how the core mm works. At least of =
how
> > I'm understanding how it works. Imo we shouldn't try to re-implement th=
is
> > kind of balancing across different pools in our callback, since core mm
> > tries pretty hard to equally shrink already (it only shrinks each shrin=
ker
> > a little bit each round, but does a lot of rounds under memory pressure=
).
> =

> Correct, see the problem is that we don't want to shrink from each pool on
> each round.
> =

> E.g. we have something like 48 global pools and 36 for each device which
> needs a DMA coherent pool.
> =

> On each round we want to shrink only one cached item from one pool and not
> 48.

Hm if the pool is that small, then this feels like we're caching at the
wrong level, and probably we should cache at the dma-api level. Or well,
below that even.

Either way that kind of design stuff should be captured in an overview
DOC: kerneldoc imo.

Also the point of shrinkers is that they really should be all sized
equally, so if there's very little stuff in them, they shouldn't get
shrunk on first round.

Otoh if they're huge, they will be shrunk big time. So aside from fringe
effects of rounding slightly different since it's all integers, did you
actually measure a benefit here? Or is this more conjecture about how you
think shrinkers work or don't work?

> > Also maintaining your own global lru means global locking for the usual
> > case of none-to-little memory contention, unecessarily wasting the fast
> > path.
> =

> No, the fast path doesn't need to take the global LRU lock.
> =

> I've optimized this quite a bit by looking into the pools only once for e=
ach
> power of two.
> =

> > > In other words shrink_slab() just uses list_for_each_entry() on all
> > > shrinkers.
> > > =

> > > In the pool shrinker callback shrink one pool and move it to the end =
of the
> > > shrinker list.
> > > =

> > > > Aside: I think it also would make tons of sense to split up your ne=
w ttm
> > > > bo shrinker up into a per-device lru, and throw the global system m=
emory
> > > > lru out the window completely :-) Assuming we can indeed get rid of=
 it,
> > > > and vmwgfx doesn't need it somewhere still.
> > > Yeah, I already have that as a patch set here, but I have this depend=
ent on
> > > a larger rename of the device structures.
> > Hm maybe include that in the next round, just for the bigger picture?
> > Don't have to merge it all in one go, just want to make sure we agree on
> > where we're going.
> =

> I need to clean this set up quite a bit. Let's push this one here upstream
> first.

Hm yeah I guess we need to get somewhere first, but this feels a bit
murky. I'll try and review more details for the next round at least.
-Daniel

> =

> > > > Aside from this lgtm, but I guess will change a bit with that shuff=
ling.
> > > Thanks for the review, going to send out a new version with the
> > > fs_reclaim_acquire/release added in a minute.
> > Cool.
> > =

> > Cheers, Daniel
> =

> Got distracted by bug fixes in the last two weeks, but really going to se=
nd
> that out now :)
> =

> Christian.
> =

> > =

> > > Christian.
> > > =

> > > > -Daniel
> > > > =

> > > > > ---
> > > > >    drivers/gpu/drm/ttm/ttm_pool.c | 23 ++++++++++++++++-------
> > > > >    1 file changed, 16 insertions(+), 7 deletions(-)
> > > > > =

> > > > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm=
/ttm_pool.c
> > > > > index 1cdacd58753a..f09e34614226 100644
> > > > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > > > @@ -504,10 +504,12 @@ void ttm_pool_init(struct ttm_pool *pool, s=
truct device *dev,
> > > > >    	pool->use_dma_alloc =3D use_dma_alloc;
> > > > >    	pool->use_dma32 =3D use_dma32;
> > > > > -	for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> > > > > -		for (j =3D 0; j < MAX_ORDER; ++j)
> > > > > -			ttm_pool_type_init(&pool->caching[i].orders[j],
> > > > > -					   pool, i, j);
> > > > > +	if (use_dma_alloc) {
> > > > > +		for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> > > > > +			for (j =3D 0; j < MAX_ORDER; ++j)
> > > > > +				ttm_pool_type_init(&pool->caching[i].orders[j],
> > > > > +						   pool, i, j);
> > > > > +	}
> > > > >    }
> > > > >    EXPORT_SYMBOL(ttm_pool_init);
> > > > > @@ -523,9 +525,11 @@ void ttm_pool_fini(struct ttm_pool *pool)
> > > > >    {
> > > > >    	unsigned int i, j;
> > > > > -	for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> > > > > -		for (j =3D 0; j < MAX_ORDER; ++j)
> > > > > -			ttm_pool_type_fini(&pool->caching[i].orders[j]);
> > > > > +	if (pool->use_dma_alloc) {
> > > > > +		for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> > > > > +			for (j =3D 0; j < MAX_ORDER; ++j)
> > > > > +				ttm_pool_type_fini(&pool->caching[i].orders[j]);
> > > > > +	}
> > > > >    }
> > > > >    EXPORT_SYMBOL(ttm_pool_fini);
> > > > > @@ -630,6 +634,11 @@ int ttm_pool_debugfs(struct ttm_pool *pool, =
struct seq_file *m)
> > > > >    {
> > > > >    	unsigned int i;
> > > > > +	if (!pool->use_dma_alloc) {
> > > > > +		seq_puts(m, "unused\n");
> > > > > +		return 0;
> > > > > +	}
> > > > > +
> > > > >    	ttm_pool_debugfs_header(m);
> > > > >    	spin_lock(&shrinker_lock);
> > > > > -- =

> > > > > 2.25.1
> > > > > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
