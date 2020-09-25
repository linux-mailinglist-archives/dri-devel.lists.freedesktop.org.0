Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A24F727932A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 23:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C936ED58;
	Fri, 25 Sep 2020 21:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BFC6ED58
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 21:23:26 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s12so5348020wrw.11
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 14:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xu3WUdYX5svcbV4xrw1b6YX5aAbNB7AgpH2Adx4jZFo=;
 b=Oh/rOaeXFzcu9qSAmCq/rolkH8P14hud6p8K5BfNI2WFG5a9+CDyEGSSQhX2ckSOFm
 zhaUJj91cpSE7fjOgEU1lXwLJ+IWz8fvIt0d9ZLig66lfafGswbdX3HjuUIetLcvXIRK
 iTH/uLltlOJ4fw+ePue65S94O7opuSVXxQHSpsONmulokYemM7SGq9yQ+hWEmXvhV86F
 z03M9NhNkvuyYCe3g7sBFrF7SAacgZVx0Vpqiomtz+6y2XL78RtnxnguoI2dZ69jA0P6
 sb1aT7CbUe0tNayEoXajWXtZalCNyj5M83zbwKR5M/a2WvCpOpF2gPQoaJNqY08mROL1
 4Blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xu3WUdYX5svcbV4xrw1b6YX5aAbNB7AgpH2Adx4jZFo=;
 b=iVfc4coUzfGZSfqUAy1FbOYLd9laJnu6DJ5/TK4NbAdPS3XTTEyiRJxVWT+qiGzC9z
 OBFdqx/2KQEiUrSUmLo6+HwiiGDoCzoVVYLImAnR6Mc92FGA5wdkBnf4+klXZe9is4g2
 JrmioUsTKL+zN1nD7um880x3AilCMv/THQKZ/xbLK2jHT195u5Wiz8Z6aFF3yKtUBSW9
 SNj37qeEuf+IqF0rwYy1TjZwTVZZMO7o9tH2MT46pbxe/fEaIRMuqR60fnzTF9bLav6P
 X+DeqFmKbpcAqPMNDDO7BD91E4zauoLkT9BLT48odCLJ5Asq4sea0DxP1Oa9s5j8yzAr
 IAIw==
X-Gm-Message-State: AOAM533xuBymUAksrlPqUP5gtyhRglq3Eri0uOojKv8Nvj8jRA09pvS7
 298KNwGd0/yihUyVl9a4aSn+WAALjR9+GHpzT9N+wKPS
X-Google-Smtp-Source: ABdhPJwCPyTdQSA04vqPSfWKSY3pipKmyGpRObz8EdYnATmeFvpcGyznCvz/MGH6xrabFJhMlum7YCBfq8aVNQdHzTI=
X-Received: by 2002:adf:fc0a:: with SMTP id i10mr6384708wrr.111.1601069005049; 
 Fri, 25 Sep 2020 14:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133259eucas1p273f0e05005b7b1158d884295d35745fd@eucas1p2.samsung.com>
 <20200513133245.6408-5-m.szyprowski@samsung.com>
 <alpine.DEB.2.20.2009211803580.19454@agoins-DiGiTS>
 <afb59d1b-1fcf-fd6d-2b48-e078e129f1eb@samsung.com>
In-Reply-To: <afb59d1b-1fcf-fd6d-2b48-e078e129f1eb@samsung.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Sep 2020 17:23:14 -0400
Message-ID: <CADnq5_OP4pEg7Cg9E=TUB0viSX8rTALQoFck=ueTh=phTtUfEA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v5 05/38] drm: prime: use sgtable
 iterators in drm_prime_sg_to_page_addr_arrays()
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 2:28 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Alex,
>
> On 22.09.2020 01:15, Alex Goins wrote:
> > Tested-by: Alex Goins <agoins@nvidia.com>
> >
> > This change fixes a regression with drm_prime_sg_to_page_addr_arrays() and
> > AMDGPU in v5.9.
>
> Thanks for testing!
>
> > Commit 39913934 similarly revamped AMDGPU to use sgtable helper functions. When
> > it changed from dma_map_sg_attrs() to dma_map_sgtable(), as a side effect it
> > started correctly updating sgt->nents to the return value of dma_map_sg_attrs().
> > However, drm_prime_sg_to_page_addr_arrays() incorrectly uses sgt->nents to
> > iterate over pages, rather than sgt->orig_nents, resulting in it now returning
> > the incorrect number of pages on AMDGPU.
> >
> > I had written a patch that changes drm_prime_sg_to_page_addr_arrays() to use
> > for_each_sgtable_sg() instead of for_each_sg(), iterating using sgt->orig_nents:
> >
> > -       for_each_sg(sgt->sgl, sg, sgt->nents, count) {
> > +       for_each_sgtable_sg(sgt, sg, count) {
> >
> > This patch takes it further, but still has the effect of fixing the number of
> > pages that drm_prime_sg_to_page_addr_arrays() returns. Something like this
> > should be included in v5.9 to prevent a regression with AMDGPU.
>
> Probably the easiest way to handle a fix for v5.9 would be to simply
> merge the latest version of this patch also to v5.9-rcX:
> https://lore.kernel.org/dri-devel/20200904131711.12950-3-m.szyprowski@samsung.com/
>
>
> This way we would get it fixed and avoid possible conflict in the -next.
> Do you have any AMDGPU fixes for v5.9 in the queue? Maybe you can add
> that patch to the queue? Dave: would it be okay that way?

I think this should go into drm-misc for 5.9 since it's an update to
drm_prime.c.  Is that patch ready to merge?
Acked-by: Alex Deucher <alexander.deucher@amd.com>

Alex

>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
> _______________________________________________
> Linaro-mm-sig mailing list
> Linaro-mm-sig@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
