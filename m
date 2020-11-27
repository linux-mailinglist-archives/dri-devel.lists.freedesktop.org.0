Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 606172C6870
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 16:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2576EE2F;
	Fri, 27 Nov 2020 15:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171416EE2D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 15:07:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a3so6795909wmb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 07:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=TlUFA9ZK8KFR5dchOxJzXc8E9Isp+qXg201QbYZ09Kc=;
 b=ZtLGenjghNC9VE1DqkiUAPrAbKix/coCqPfRwaGQ74KW7ErsYP1/A7CYiBNQajyeg6
 1+/tHaAr8RO/1hvCwveyrF4bqaMPID8TRRBuQg2Dg0BRmzkutXeAjaEgF4Y5swXcLGEJ
 SfYGbUoxklOFy19t3OBcqe5/LmugU0AExg8xA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TlUFA9ZK8KFR5dchOxJzXc8E9Isp+qXg201QbYZ09Kc=;
 b=tmQiBQc56sGZKTicr+1pVvuP6GagBNvLU5FG8BNK2KJU0cPfBO5PWFRvo4oEhEm1Pm
 bZxNvPM4sZmoN/ug/1Eg4ZkeDn8TMBvLTS1uJ6F67+8DBAEJ+bfdJgggyVuSPzmh2/Nw
 bqobMQJJcL9mpKY687eWuVU0Ggeq6Fa5TfZGYLFa2CLICnU+kmdYfzIdzRpSnMBfIhq9
 ds3BvrCii/LB70eyZJBUjEMtXOJqHt4eMgmlitYrOmHciryB+0ODdZiL+L3ZwiUDec+m
 vDYreEn+CRaK8O6jUp2z76EIq1/yo85z5TCdxJQrU+93plzyQ5ctZgjl/ZgZ1lRTSo/U
 u+7Q==
X-Gm-Message-State: AOAM532t1L6AIHzQK1Z24ZiG5jNLUWRLPzPDL93P0bZFjYie2Wndo6Qs
 MtO0nOcij3z+omU5fvck0GJhJg==
X-Google-Smtp-Source: ABdhPJytNtEQxZdNssDBDwbNTWdv6XCmBTNonG7IOelU8XCL0CAbrhjitghZ2lNvdQHDunhM2qZVhw==
X-Received: by 2002:a1c:5406:: with SMTP id i6mr8241068wmb.137.1606489672731; 
 Fri, 27 Nov 2020 07:07:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y18sm15202052wrr.67.2020.11.27.07.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 07:07:51 -0800 (PST)
Date: Fri, 27 Nov 2020 16:07:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/7] drm/radeon: stop using pages with
 drm_prime_sg_to_page_addr_arrays v2
Message-ID: <20201127150750.GE401619@phenom.ffwll.local>
References: <20201125125919.1372-1-christian.koenig@amd.com>
 <30ce8840-c74a-5f16-1892-6b9066f8d0de@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <30ce8840-c74a-5f16-1892-6b9066f8d0de@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 27, 2020 at 03:11:05PM +0100, Christian K=F6nig wrote:
> Ping? Daniel any more ideas on this or should we push it?

Occasionally I bit more prose would be nice about why things changed or
so. Iirc the reason I asked about using ttm_sg_tt_init is that it makes it
easier to convince ourselves that we don't mix things up. Maybe add that
(or cover letter next time around). Just helps since at least my silly
brain forgets details like that within days, and is usually terminally
lost when git bisect lands on such a patch. Also helps reviewers stay
motivated sometimes :-)

Anyway I think this looks all reasonable now, on the series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> =

> Thanks,
> Christian.
> =

> Am 25.11.20 um 13:59 schrieb Christian K=F6nig:
> > This is deprecated.
> > =

> > v2: also use ttm_sg_tt_init to avoid allocating the page array.
> > =

> > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > ---
> >   drivers/gpu/drm/radeon/radeon_ttm.c | 11 ++++++-----
> >   1 file changed, 6 insertions(+), 5 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/rade=
on/radeon_ttm.c
> > index 0ca381b95d3d..5d00b3dff388 100644
> > --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> > +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> > @@ -401,8 +401,8 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_bo_=
device *bdev, struct ttm_tt *
> >   	if (r)
> >   		goto release_sg;
> > -	drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
> > -					 gtt->ttm.dma_address, ttm->num_pages);
> > +	drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL, gtt->ttm.dma_address,
> > +					 ttm->num_pages);
> >   	return 0;
> > @@ -542,7 +542,7 @@ static struct ttm_tt *radeon_ttm_tt_create(struct t=
tm_buffer_object *bo,
> >   	else
> >   		caching =3D ttm_cached;
> > -	if (ttm_dma_tt_init(&gtt->ttm, bo, page_flags, caching)) {
> > +	if (ttm_sg_tt_init(&gtt->ttm, bo, page_flags, caching)) {
> >   		kfree(gtt);
> >   		return NULL;
> >   	}
> > @@ -580,8 +580,9 @@ static int radeon_ttm_tt_populate(struct ttm_bo_dev=
ice *bdev,
> >   	}
> >   	if (slave && ttm->sg) {
> > -		drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
> > -						 gtt->ttm.dma_address, ttm->num_pages);
> > +		drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL,
> > +						 gtt->ttm.dma_address,
> > +						 ttm->num_pages);
> >   		return 0;
> >   	}
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
