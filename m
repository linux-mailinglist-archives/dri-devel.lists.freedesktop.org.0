Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9112D35F177
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 12:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EB26E90D;
	Wed, 14 Apr 2021 10:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595566E90D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 10:26:13 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id k26so2923748wrc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 03:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3Ao5WZ3vwsN7kCb3fIOQbu8eip9MnaKi4smYqZLOdVU=;
 b=HpzvzErt/IA3QiMhRngpcGc806V+tvHqSLTGxDdFzrjiuauCEBfItBbhzahgmC+8LV
 hra21En+pOjA47qwB9e96l9HkFr1fo/esj3WiBtcYsdKIZEs+hc1Por4naCzYMirBoUL
 8N1ahespUFYCarA7U4WyT+0I1fkcsU38/yQSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3Ao5WZ3vwsN7kCb3fIOQbu8eip9MnaKi4smYqZLOdVU=;
 b=Is83WCEXDd/ZahZng+NPF078zhnVYuY1q+rmpaqgO5VB7XVOCbOnzOdIihd5YZqU+G
 jkuo5weOKhqDvt5W69MDJsxiqLMDZYigj2lC9d7ZDxD7Fkdzr9bp0u2ZHHNzCjIopGXJ
 oQ4khTHmC8pKfLQgi3CWK7FYW3A2QX6YOCHX6nVyCDJMm7gHrrBFUjbW4VKWpDE51+ty
 6/mHTMrKicrK4kqKOLYbZDkSz+aou3ORclzc6uEU8NfR8iNmQHgih/Hf9bKafo9epdYW
 huHKcCdBC9Yt2wAXxa1Bs0qF8zFh/GtG81HGmIL6gcjXqsAJ3j5y0U855Wv9zmdX3Ec1
 pUgA==
X-Gm-Message-State: AOAM5318p7SAjtATffz7+i+ngws5FRxb1TgXrF558dtXaBcTzaQVPDI7
 B7WRuxoSmtOt2cczXiHOfaM0eA==
X-Google-Smtp-Source: ABdhPJxfXWCAvCa/HTshJKOoB5O/Cy5Aow+yIkVFu5jTF1Tbf2lhqAgmAMZW2TvKCQdhWmOA7PiGpA==
X-Received: by 2002:adf:d219:: with SMTP id j25mr27260860wrh.187.1618395972026; 
 Wed, 14 Apr 2021 03:26:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x15sm4845424wmi.41.2021.04.14.03.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 03:26:11 -0700 (PDT)
Date: Wed, 14 Apr 2021 12:26:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 8/9] drm/ttm: Don't count pages in SG BOs against
 pages_limit
Message-ID: <YHbDQcr6Yl1Lljep@phenom.ffwll.local>
References: <20210414064804.29356-1-Felix.Kuehling@amd.com>
 <20210414064804.29356-9-Felix.Kuehling@amd.com>
 <60d08770-e4f5-4e8f-0a93-2270ae02aa26@gmail.com>
 <YHayqD3IbupkY7b+@phenom.ffwll.local>
 <18a18e85-7b0d-649f-64a3-028376d8de15@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18a18e85-7b0d-649f-64a3-028376d8de15@amd.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 14, 2021 at 11:19:41AM +0200, Christian K=F6nig wrote:
> Am 14.04.21 um 11:15 schrieb Daniel Vetter:
> > On Wed, Apr 14, 2021 at 08:51:51AM +0200, Christian K=F6nig wrote:
> > > Am 14.04.21 um 08:48 schrieb Felix Kuehling:
> > > > Pages in SG BOs were not allocated by TTM. So don't count them agai=
nst
> > > > TTM's pages limit.
> > > > =

> > > > Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > > Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
> > > =

> > > Going to pick that one up for inclusion in drm-misc-next.
> > See my other email, but why do we need this? A bit more explanation is =
imo
> > needed here at least, since we still need to guarantee that allocations
> > don't over the limit in total for all gpu buffers together. At least un=
til
> > the shrinker has landed.
> > =

> > And this here just opens up the barn door without any explanation why i=
t's
> > ok.
> =

> The SG based BOs might not even be backed by pages. E.g. exported VRAM.
> =

> So either they are exported by a driver which should have accounted for t=
he
> allocation, exported by TTM which already did the accounting or doesn't e=
ven
> point to pages at all.
> =

> This is really a bug fix to recreate the behavior we had before moving the
> accounting to this place.

Throw that into the commit message and a-b: me. Ideally with a Fixes: line
or so pointing at the offending commit that broke stuff. Commit messages
should really go into more detail when there's an entire story behind a
small change like this one.
-Daniel

> =

> Christian.
> =

> > -Daniel
> > =

> > > Regards,
> > > Christian.
> > > =

> > > > ---
> > > >    drivers/gpu/drm/ttm/ttm_tt.c | 27 ++++++++++++++++++---------
> > > >    1 file changed, 18 insertions(+), 9 deletions(-)
> > > > =

> > > > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm=
_tt.c
> > > > index 5d8820725b75..e8b8c3257392 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > > > @@ -317,9 +317,12 @@ int ttm_tt_populate(struct ttm_device *bdev,
> > > >    	if (ttm_tt_is_populated(ttm))
> > > >    		return 0;
> > > > -	atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
> > > > -	if (bdev->pool.use_dma32)
> > > > -		atomic_long_add(ttm->num_pages, &ttm_dma32_pages_allocated);
> > > > +	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> > > > +		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
> > > > +		if (bdev->pool.use_dma32)
> > > > +			atomic_long_add(ttm->num_pages,
> > > > +					&ttm_dma32_pages_allocated);
> > > > +	}
> > > >    	while (atomic_long_read(&ttm_pages_allocated) > ttm_pages_limit=
 ||
> > > >    	       atomic_long_read(&ttm_dma32_pages_allocated) >
> > > > @@ -350,9 +353,12 @@ int ttm_tt_populate(struct ttm_device *bdev,
> > > >    	return 0;
> > > >    error:
> > > > -	atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> > > > -	if (bdev->pool.use_dma32)
> > > > -		atomic_long_sub(ttm->num_pages, &ttm_dma32_pages_allocated);
> > > > +	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> > > > +		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> > > > +		if (bdev->pool.use_dma32)
> > > > +			atomic_long_sub(ttm->num_pages,
> > > > +					&ttm_dma32_pages_allocated);
> > > > +	}
> > > >    	return ret;
> > > >    }
> > > >    EXPORT_SYMBOL(ttm_tt_populate);
> > > > @@ -382,9 +388,12 @@ void ttm_tt_unpopulate(struct ttm_device *bdev=
, struct ttm_tt *ttm)
> > > >    	else
> > > >    		ttm_pool_free(&bdev->pool, ttm);
> > > > -	atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> > > > -	if (bdev->pool.use_dma32)
> > > > -		atomic_long_sub(ttm->num_pages, &ttm_dma32_pages_allocated);
> > > > +	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> > > > +		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> > > > +		if (bdev->pool.use_dma32)
> > > > +			atomic_long_sub(ttm->num_pages,
> > > > +					&ttm_dma32_pages_allocated);
> > > > +	}
> > > >    	ttm->page_flags &=3D ~TTM_PAGE_FLAG_PRIV_POPULATED;
> > > >    }
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
ists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D04%7C01%7C=
christian.koenig%40amd.com%7C3075d7fd16644322a13608d8ff25d59b%7C3dd8961fe48=
84e608e11a82d994e183d%7C0%7C0%7C637539885255795187%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;sdata=3DKOnHA1CbNFjjMZR2rgHmGkH%2B7C84YCtA6u9V1wBAay4%3D&amp;reserved=3D0
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
