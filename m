Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0922EF3F1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 15:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEAD6E170;
	Fri,  8 Jan 2021 14:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97716E170
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 14:31:53 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d26so9173353wrb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 06:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pk13RAN8QYm3ZK5u00KzYGfzHly+W+u9hQh9WRL/cUo=;
 b=aHHnDQtnpy8xc5ZkVj5zzFxyB6rcShULcb2Dbxkql3jNEYBKsZu/f7YS0tBS9JWyhh
 pnxSHcXIE5Aj5OvXhddAJNmPi7FsQXs2TnyU6hhqiW+GZj5Tbt5+N2ys5V+80X1uxr/j
 a93syYmZVRagYMyQio6zDD6VD4ziehj1eD4JM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pk13RAN8QYm3ZK5u00KzYGfzHly+W+u9hQh9WRL/cUo=;
 b=qATsZS0BpRCGWKu6tz2/aL6qBdCALvikkIsiT8BkDAKBZ1xZOOl8LNQjxrh1dubtmg
 MxCStC1W+vg8vseRTC3AEgwGES3TgXOIVlIUsCf6YHWWqt9NVqrztXDczgHndN6wLgvt
 osM6xCLkz1LkEIbB0drw7amAC7MHrsMm78blGrG3aPUe2LTombXf2V1d/ScI+jzUXtMc
 gFUnby0N/ghy7bHhdrsucMscJ0bDXMNZjpMWbigHOMezdgqX0OZx4e3qt/dAhEJXHJkr
 njrmnjA0NWrsYkMdVlh1dXw+P04VjMwXHiNfg/ODO+WSl9EluezVRrz+ClA+qHRqoNh3
 kpcQ==
X-Gm-Message-State: AOAM530IX1ERyCWKLWPdlOCwbHlSAxYudohThZjOx0WV0jsGkSiXtolL
 JDXZFARQuHYLYGTW4uEVzTfixQ==
X-Google-Smtp-Source: ABdhPJzgc/HwPMkBHBJq9+EXE+pFmPdfFV1mtMH2JrMjdv1ZPKrmRiJ4ang/ReSQDJNrip7sar5slw==
X-Received: by 2002:adf:c5d3:: with SMTP id v19mr3890380wrg.365.1610116312438; 
 Fri, 08 Jan 2021 06:31:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n16sm13551046wrj.26.2021.01.08.06.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 06:31:51 -0800 (PST)
Date: Fri, 8 Jan 2021 15:31:49 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [PATCH 1/2] drm/radeon: stop re-init the TTM page pool
Message-ID: <X/hs1Rvm57zGPU8y@phenom.ffwll.local>
References: <20210105182309.1362-1-christian.koenig@amd.com>
 <X/dN/YFtnVAIllds@phenom.ffwll.local>
 <ffa9d7f2-fe68-fb6a-8422-82b8949dbe1e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ffa9d7f2-fe68-fb6a-8422-82b8949dbe1e@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, ray.huang@amd.com, bp@alien8.de,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 07, 2021 at 09:08:29PM +0100, Christian K=F6nig wrote:
> Am 07.01.21 um 19:07 schrieb Daniel Vetter:
> > On Tue, Jan 05, 2021 at 07:23:08PM +0100, Christian K=F6nig wrote:
> > > Drivers are not supposed to init the page pool directly any more.
> > > =

> > > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > Please include reported-by credits and link to the bug reports on
> > lore.kernel.org when merging this. Also I guess this should have a Fixe=
s:
> > line?
> =

> I'm not aware of a bug report, but the reported-by/Fixes lines are indeed
> missing.

This one here:

https://lore.kernel.org/dri-devel/20201231104020.GA4504@zn.tnic/

Or did I get confused, and the above is yet another bug?

> BTW: Any idea why dim add-link doesn't work?

Hm we occasionally have fun with email parsing (it's hard) and especially
python changes in how encodings are handled differently between python2
and python3. If you have a specific example I can try and take a look why
it doesn't work.
-Daniel

> > And maybe some words on how/why stuff blows up.
> =

> Just a typo. I've forgot to remove two lines in radeon while rebasing and
> still had the symbols exported so never noticed this.
> =

> Christian.
> =

> > -Daniel
> > =

> > > ---
> > >   drivers/gpu/drm/radeon/radeon_ttm.c | 3 ---
> > >   1 file changed, 3 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/ra=
deon/radeon_ttm.c
> > > index d4328ff57757..35b715f82ed8 100644
> > > --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> > > +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> > > @@ -729,9 +729,6 @@ int radeon_ttm_init(struct radeon_device *rdev)
> > >   	}
> > >   	rdev->mman.initialized =3D true;
> > > -	ttm_pool_init(&rdev->mman.bdev.pool, rdev->dev, rdev->need_swiotlb,
> > > -		      dma_addressing_limited(&rdev->pdev->dev));
> > > -
> > >   	r =3D radeon_ttm_init_vram(rdev);
> > >   	if (r) {
> > >   		DRM_ERROR("Failed initializing VRAM heap.\n");
> > > -- =

> > > 2.25.1
> > > =

> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
