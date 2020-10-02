Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E52D281AC5
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 20:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09646E9BE;
	Fri,  2 Oct 2020 18:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC536E9BE
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 18:23:08 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id a3so3219452ejy.11
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 11:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4bzPIab4VFKjJVRS8nUYS5ckBsBdN2UEpwZV//i/pfs=;
 b=BoHELb4SMe2EXLTnmM7crMW7z4e5rCSlUGYMOrIAdjXmRa3XEtuHqpDmH9BXvnlB4K
 FYNksaqBSlgCn4zswwkJWAcIh4aB3l6sw6PQ7aZlBMWf+vEZvvhTe1LzhF2w+hgsLdUs
 9CCEQOqi7ooFv0hOakm61xTH7y/mUb3L2/qlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4bzPIab4VFKjJVRS8nUYS5ckBsBdN2UEpwZV//i/pfs=;
 b=fiXMtlH/d1Zww/QYbqsZ3zcwMkqwuPayI8Sa0t1Sx8a6AsZMkPGKrvbV8ucacp1PNf
 aYwvbl38GUmCFOX9GltPyrpqbQ/UJIWV9Ptem1ks7BOvkEV0Rqfuo605KgDYqrWxH6MZ
 IXNXWxP5p7tXbwz0B4H2Og4+wXpvBh6M+wehUGGQ/usLhHbtaOzR1ZWx6HXqg9tf5anK
 PTrnxAU7U57C7BxL5hq8LX3tI/dwct3ib+s0xlVHFz5MWxNkvp5VTopcGiu3PjqzbCKl
 cpN+xjrOLbMSk3fjFoFirCyfxmjr4TGhrVQzNoni/qLfKSGrgpuZkWZd8rFO2j/UrTH3
 Un3g==
X-Gm-Message-State: AOAM531H6ms1CHS+nd8cvQp0WOZYRs13YPjx+IkI0dGGfi+/pZVuhVlb
 6R/fO0KCKYUF8BJMRS1JzCDfIAMcJ7MbDQ==
X-Google-Smtp-Source: ABdhPJzGytxMhNlXt3xbxxJJs3PtGltA4vR4OY6gZJ+/fM90hXnCIbsXKDiP+TIAMZW0SQCTZFRFTQ==
X-Received: by 2002:a17:906:4d4d:: with SMTP id
 b13mr3463550ejv.221.1601662987174; 
 Fri, 02 Oct 2020 11:23:07 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45])
 by smtp.gmail.com with ESMTPSA id j9sm1573426ejt.49.2020.10.02.11.23.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 11:23:07 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id e2so2685343wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 11:23:06 -0700 (PDT)
X-Received: by 2002:a1c:a5c8:: with SMTP id o191mr4341034wme.127.1601662986038; 
 Fri, 02 Oct 2020 11:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 2 Oct 2020 20:22:49 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AsFOau=m_3UPh2tKqwiUJaY4NH9HHrHJ17gbCLDgTNCQ@mail.gmail.com>
Message-ID: <CAAFQd5AsFOau=m_3UPh2tKqwiUJaY4NH9HHrHJ17gbCLDgTNCQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/frame-vec: Drop gup_flags from get_vaddr_frames()
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Pawel Osciak <pawel@osciak.com>,
 linux-mm@kvack.org, Pawel Piskorski <ppiskorski@habana.ai>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Omer Shpigelman <oshpigelman@habana.ai>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Tomer Tayar <ttayar@habana.ai>, Krzysztof Kozlowski <krzk@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 2, 2020 at 7:53 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> FOLL_WRITE | FOLL_FORCE is really the only reasonable thing to do for
> simple dma device that can't guarantee write protection. Which is also
> what all the callers are using.
>
> So just simplify this.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Pawel Osciak <pawel@osciak.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Tomasz Figa <tfiga@chromium.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Oded Gabbay <oded.gabbay@gmail.com>
> Cc: Omer Shpigelman <oshpigelman@habana.ai>
> Cc: Tomer Tayar <ttayar@habana.ai>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Pawel Piskorski <ppiskorski@habana.ai>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-mm@kvack.org
> ---
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c           | 3 +--
>  drivers/media/common/videobuf2/videobuf2-memops.c | 3 +--
>  drivers/misc/habanalabs/common/memory.c           | 3 +--
>  include/linux/mm.h                                | 2 +-
>  mm/frame_vector.c                                 | 4 ++--
>  5 files changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> index 967a5cdc120e..ac452842bab3 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -480,8 +480,7 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
>                 goto err_free;
>         }
>
> -       ret = get_vaddr_frames(start, npages, FOLL_FORCE | FOLL_WRITE,
> -               g2d_userptr->vec);
> +       ret = get_vaddr_frames(start, npages, g2d_userptr->vec);
>         if (ret != npages) {
>                 DRM_DEV_ERROR(g2d->dev,
>                               "failed to get user pages from userptr.\n");
> diff --git a/drivers/media/common/videobuf2/videobuf2-memops.c b/drivers/media/common/videobuf2/videobuf2-memops.c
> index 6e9e05153f4e..9dd6c27162f4 100644
> --- a/drivers/media/common/videobuf2/videobuf2-memops.c
> +++ b/drivers/media/common/videobuf2/videobuf2-memops.c
> @@ -40,7 +40,6 @@ struct frame_vector *vb2_create_framevec(unsigned long start,
>         unsigned long first, last;
>         unsigned long nr;
>         struct frame_vector *vec;
> -       unsigned int flags = FOLL_FORCE | FOLL_WRITE;
>
>         first = start >> PAGE_SHIFT;
>         last = (start + length - 1) >> PAGE_SHIFT;
> @@ -48,7 +47,7 @@ struct frame_vector *vb2_create_framevec(unsigned long start,
>         vec = frame_vector_create(nr);
>         if (!vec)
>                 return ERR_PTR(-ENOMEM);
> -       ret = get_vaddr_frames(start & PAGE_MASK, nr, flags, vec);
> +       ret = get_vaddr_frames(start & PAGE_MASK, nr, vec);
>         if (ret < 0)
>                 goto out_destroy;
>         /* We accept only complete set of PFNs */

For drivers/media/common/videobuf2/:

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
