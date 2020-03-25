Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 850D1192D7D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 16:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BF88991D;
	Wed, 25 Mar 2020 15:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1B68991D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 15:54:45 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id g15so2294967ilj.10;
 Wed, 25 Mar 2020 08:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XgFZGosUzS1oRzHI3pEsbboLFH1t4gask+/mwdj4L+I=;
 b=I6hHy5wHrSUflD+HabqizxDRQpER6XZk3XdQ5yVAq2IDa5d2gkKDpanLanQ+WKLJaE
 akCkkmoSQxm4KaKw/AFFZjYla0EnxMDxzNWlogb8m4l8KqXJZqDOWqL/ZB5vyaR7FcJY
 SBqMVn7GTQwtqkvkowNDvB+91Z6qymjyneLUkE63g+5ljRVkfXGeLE9UiCKHmu9a+glt
 Y5cXSP9Rt2dbWNp08O4TqYj54JltA4a40YrRjlhBSLVRwuf9M/D14/gJ1qENE1TNSIxR
 nCXAt3EtgxioDibapL20nokFrQf0FBmcXrFsO2zo8vpVKukYi2hqCWFbkiOCAm5zKaLk
 k5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XgFZGosUzS1oRzHI3pEsbboLFH1t4gask+/mwdj4L+I=;
 b=L//rdZXMVN9G+TFpH329XOJiM+PQUTeW8mPxx0Zc4oFLyMfFou6DqgZa/53E5Z8Mo/
 vP1ylZwNTEgPaGuJxb0bvBY+Ojr7AdvhceU2PR02pm7ZriJR0JHcLRNBNT3qdecVgkMt
 SEbJyZkBJC8C8ZAjJSF1fy+1dNy8cavwHmfCiL1mxRjI0VLkZUgXvk/E2UxuVsaEErjo
 wL4j0eSam+llbf0viGD6241II9GwXQ5QIcDWep97EgVaOTHfYp69Apj2AgFUs9QNQFuE
 ecBXmfisUcAZ13tzGkEEOv54CwVg3RkSG2PRfFD5uYbT3AvR08oehdUPVbLygZdMAu3P
 PpxQ==
X-Gm-Message-State: ANhLgQ2D2P6ACWeVXnKkVocZzpdMSiYAhDHvh8tFGSHavcdbWTsPNc1I
 WOAhBqCskdDg25r0q3/+hygZEaUobdpm3/UVKsjPYY1M
X-Google-Smtp-Source: ADFU+vtvtw4AQGOn9J2uCj7jrI/UUoKGmw88Il70Pyfg1OV8qDvGwy2+dBYFXBNoSyFlQetEKWD8GMqIB692DvzdovE=
X-Received: by 2002:a92:c14a:: with SMTP id b10mr4275397ilh.139.1585151684694; 
 Wed, 25 Mar 2020 08:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200325090741.21957-1-bigbeeshane@gmail.com>
 <20200325090741.21957-4-bigbeeshane@gmail.com>
 <14063C7AD467DE4B82DEDB5C278E8663FFFBD48B@fmsmsx107.amr.corp.intel.com>
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E8663FFFBD48B@fmsmsx107.amr.corp.intel.com>
From: Shane Francis <bigbeeshane@gmail.com>
Date: Wed, 25 Mar 2020 15:54:33 +0000
Message-ID: <CABnpCuD-A20o3cQrPb+LwbsSRTGPwwdCAYYsSjeCdmimNMYyYA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/radeon: fix scatter-gather mapping with user
 pages
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx-request@lists.freedesktop.org"
 <amd-gfx-request@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> >-----Original Message-----
> >From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> >Shane Francis
> >Sent: Wednesday, March 25, 2020 5:08 AM
> >To: dri-devel@lists.freedesktop.org
> >Cc: airlied@linux.ie; linux-kernel@vger.kernel.org; bigbeeshane@gmail.com;
> >amd-gfx-request@lists.freedesktop.org; alexander.deucher@amd.com;
> >christian.koenig@amd.com
> >Subject: [PATCH v4 3/3] drm/radeon: fix scatter-gather mapping with user
> >pages
> >
> >Calls to dma_map_sg may return segments / entries than requested
>
> "may return less segment..." ?
>                        ^^^

I will reword / fix the highlighted issues with the text and send a updated
patch set later today.

>
> >if they fall on page bounderies. The old implementation did not
> >support this use case.
> >
> >Signed-off-by: Shane Francis <bigbeeshane@gmail.com>
> >---
> > drivers/gpu/drm/radeon/radeon_ttm.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c
> >b/drivers/gpu/drm/radeon/radeon_ttm.c
> >index 3b92311d30b9..b3380ffab4c2 100644
> >--- a/drivers/gpu/drm/radeon/radeon_ttm.c
> >+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> >@@ -528,7 +528,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_tt
> >*ttm)
> >
> >       r = -ENOMEM;
> >       nents = dma_map_sg(rdev->dev, ttm->sg->sgl, ttm->sg->nents,
> >direction);
> >-      if (nents != ttm->sg->nents)
> >+      if (nents == 0)
> >               goto release_sg;
>
> This looks correct to me.
>
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>
> M
> >       drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
> >--
> >2.26.0
> >
> >_______________________________________________
> >dri-devel mailing list
> >dri-devel@lists.freedesktop.org
> >https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
