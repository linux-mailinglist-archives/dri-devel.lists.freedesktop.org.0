Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB2135F091
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 11:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC99B6E901;
	Wed, 14 Apr 2021 09:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F250A6E8F7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 09:15:23 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a4so19143960wrr.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 02:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nG8sHOwf2WRPpOvsDYligRdO2x6nZkB0ec0HgAGCscw=;
 b=WUtYqrin4hTNER6ytFh9+GJnYTDBBKTVJEMOw4ghFzjO6vXz7UQFDGZj6yAarGL2q9
 LxHRRZUDIBnQb4Rv1U2SwoYqMVDvtacL4tBf6k5s0rVuB4rsAwGaW9jEnXjZZsEI1iGl
 DAdAQ1ppiOiNwGCQWcBr7xRrduOlweHnjKm4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nG8sHOwf2WRPpOvsDYligRdO2x6nZkB0ec0HgAGCscw=;
 b=Tu6bew/pn3wkt1W93C23ioLqKuucRJGWjQyOSqJky5fI+FcN9LAD4DXHP4653oWrQG
 W0zYqE2QkBDxQTXScFRqXTkf+vDZWoNgPBFsb+u98YiiZysGRwYh1yxUy/RZFrVsZ9qs
 08Ufa7ZFuzQrs/9zXR25saSaXMMRzKM8ksliottJn5j1TGfYTOKkfIe415KKeUYPnhkF
 78VhPb98G/EINay9EPZ044w5AsfNVbFtc7SaJ0ltXOjC8mdwRXPTVrClmpOqs+PnwmDO
 kdNAEbFVMWole5gjEUv2hE5MfR/ROwnT7/08CQ0AotonKmYpdTfJQP8EbcUwYMFTFqku
 7HwA==
X-Gm-Message-State: AOAM530Ymxs8B6XvCu9POlpxJjnyrrGHYzUnWm/Cvo4GqClAVZz8ebGy
 kj/Jv2CNq6kJ7hfwNepg+Q3c8A==
X-Google-Smtp-Source: ABdhPJxKPWnUey+vRrAOmGLoyS4dCf+DNk34RzuJGlSxyRrWZn6fjuW+z8pFqQaIRwLUqaa2EOC17w==
X-Received: by 2002:adf:f990:: with SMTP id f16mr12745899wrr.312.1618391722752; 
 Wed, 14 Apr 2021 02:15:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w22sm4755088wmc.13.2021.04.14.02.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 02:15:22 -0700 (PDT)
Date: Wed, 14 Apr 2021 11:15:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 8/9] drm/ttm: Don't count pages in SG BOs against
 pages_limit
Message-ID: <YHayqD3IbupkY7b+@phenom.ffwll.local>
References: <20210414064804.29356-1-Felix.Kuehling@amd.com>
 <20210414064804.29356-9-Felix.Kuehling@amd.com>
 <60d08770-e4f5-4e8f-0a93-2270ae02aa26@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60d08770-e4f5-4e8f-0a93-2270ae02aa26@gmail.com>
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 14, 2021 at 08:51:51AM +0200, Christian K=F6nig wrote:
> Am 14.04.21 um 08:48 schrieb Felix Kuehling:
> > Pages in SG BOs were not allocated by TTM. So don't count them against
> > TTM's pages limit.
> > =

> > Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> =

> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
> =

> Going to pick that one up for inclusion in drm-misc-next.

See my other email, but why do we need this? A bit more explanation is imo
needed here at least, since we still need to guarantee that allocations
don't over the limit in total for all gpu buffers together. At least until
the shrinker has landed.

And this here just opens up the barn door without any explanation why it's
ok.
-Daniel

> =

> Regards,
> Christian.
> =

> > ---
> >   drivers/gpu/drm/ttm/ttm_tt.c | 27 ++++++++++++++++++---------
> >   1 file changed, 18 insertions(+), 9 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> > index 5d8820725b75..e8b8c3257392 100644
> > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > @@ -317,9 +317,12 @@ int ttm_tt_populate(struct ttm_device *bdev,
> >   	if (ttm_tt_is_populated(ttm))
> >   		return 0;
> > -	atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
> > -	if (bdev->pool.use_dma32)
> > -		atomic_long_add(ttm->num_pages, &ttm_dma32_pages_allocated);
> > +	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> > +		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
> > +		if (bdev->pool.use_dma32)
> > +			atomic_long_add(ttm->num_pages,
> > +					&ttm_dma32_pages_allocated);
> > +	}
> >   	while (atomic_long_read(&ttm_pages_allocated) > ttm_pages_limit ||
> >   	       atomic_long_read(&ttm_dma32_pages_allocated) >
> > @@ -350,9 +353,12 @@ int ttm_tt_populate(struct ttm_device *bdev,
> >   	return 0;
> >   error:
> > -	atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> > -	if (bdev->pool.use_dma32)
> > -		atomic_long_sub(ttm->num_pages, &ttm_dma32_pages_allocated);
> > +	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> > +		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> > +		if (bdev->pool.use_dma32)
> > +			atomic_long_sub(ttm->num_pages,
> > +					&ttm_dma32_pages_allocated);
> > +	}
> >   	return ret;
> >   }
> >   EXPORT_SYMBOL(ttm_tt_populate);
> > @@ -382,9 +388,12 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, st=
ruct ttm_tt *ttm)
> >   	else
> >   		ttm_pool_free(&bdev->pool, ttm);
> > -	atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> > -	if (bdev->pool.use_dma32)
> > -		atomic_long_sub(ttm->num_pages, &ttm_dma32_pages_allocated);
> > +	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> > +		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> > +		if (bdev->pool.use_dma32)
> > +			atomic_long_sub(ttm->num_pages,
> > +					&ttm_dma32_pages_allocated);
> > +	}
> >   	ttm->page_flags &=3D ~TTM_PAGE_FLAG_PRIV_POPULATED;
> >   }
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
