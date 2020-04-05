Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 640E019EC1E
	for <lists+dri-devel@lfdr.de>; Sun,  5 Apr 2020 16:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EFE6E138;
	Sun,  5 Apr 2020 14:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01DF6E138
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 14:48:01 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id 204so7288582ybw.5
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Apr 2020 07:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v+dqDvCPt/897rtlW7rn+HRZ8CXQjFzk7KCjChk3k24=;
 b=hNmVs66K30OIgjszWm08ENcKBGYBbmyqTsytRVdgaU8hiMRMsvs0UocE6U+1o2Cl9u
 UnhOtihY/4/dKGac5lGPw2uhsev2IFZLr7nh2SltrUZ/CEAjruNVEfJAu1xwfNj89yBo
 t6jqrh7D/AQWONdkAxfjoefdWy3JE2k1LgViJTxsqnKI8oqBHB3zDgVFJOdcN1e4HtKk
 S97UpoclL3VkZmeu2lhj3ko0vuHsCsOvnFaCraRWl7n0FiLQvAsO10Lhq/40WB0j27Cp
 rgtvjVLmOEJk+wJemh3IsBHV8fOnQ9E62iI/1KmyZP/yKFeKVUQI+nziwePMYfUfqQnE
 jRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v+dqDvCPt/897rtlW7rn+HRZ8CXQjFzk7KCjChk3k24=;
 b=Eoi1m/qfocO5UCmW+qNJO5lw0Hjvj9Yshq5qq4tx4faDYM+i+cU7dV/VOg8L15BlP5
 PJKBog6z13w8O8cp8QDxA6OrAHYofsYHIQ2thu57YJEEQ3SRUt8T9EAIL7qCPYi31LRd
 w3Wmyyz3Z6PED8Odxu1XVUrW9xCml1CPQqtDYhIK73YewZfQrWpR+kZTI9NOJb0u8Q7c
 Mi1MMfjU/7M4hH0/Y+jnCVY7C2851nYWjvG9Uj9MLebKWquap8rzLg/LGL42Z2zBiDDH
 /zEjUS52jSO+HMCuMrlA8Wk5arvDgTl7+sOHh65uh/8eJrtQkEd6O+cDdiM31/hnbjS4
 98aQ==
X-Gm-Message-State: AGi0PuZMi66tc7A7O0KPwz6LkwRM06fbqdy0vixw6Rd+rQrzVuLEzM/g
 ROZ/1tppF/RKwnE3b6kgTstut9zFzuuDKonVgpU=
X-Google-Smtp-Source: APiQypLStyXEBg4fQEvKQp6utKnlk02OoH8tD0TAXmioeqlnHxkn0X/oq14OJ5qqcj+o7yJGUusu0tV5/tVYB2+d+RU=
X-Received: by 2002:a25:dcd4:: with SMTP id
 y203mr30504136ybe.483.1586098080938; 
 Sun, 05 Apr 2020 07:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200327162330eucas1p1b0413e0e9887aa76d3048f86d2166dcd@eucas1p1.samsung.com>
 <20200327162126.29705-1-m.szyprowski@samsung.com>
In-Reply-To: <20200327162126.29705-1-m.szyprowski@samsung.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sun, 5 Apr 2020 10:47:49 -0400
Message-ID: <CADnq5_NpHvmRvzvh1aF293UDUXiHF4Dg1rRNkt7XbM_VB98JCg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/prime: fix extracting of the DMA addresses from a
 scatterlist
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
Cc: linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Shane Francis <bigbeeshane@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "Michael J . Ruhl" <michael.j.ruhl@intel.com>,
 "for 3.8" <stable@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 27, 2020 at 12:23 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Scatterlist elements contains both pages and DMA addresses, but one
> should not assume 1:1 relation between them. The sg->length is the size
> of the physical memory chunk described by the sg->page, while
> sg_dma_len(sg) is the size of the DMA (IO virtual) chunk described by
> the sg_dma_address(sg).
>
> The proper way of extracting both: pages and DMA addresses of the whole
> buffer described by a scatterlist it to iterate independently over the
> sg->pages/sg->length and sg_dma_address(sg)/sg_dma_len(sg) entries.
>
> Fixes: 42e67b479eab ("drm/prime: use dma length macro when mapping sg")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Applied.  Thanks and sorry for the breakage.

Alex

> ---
>  drivers/gpu/drm/drm_prime.c | 37 +++++++++++++++++++++++++------------
>  1 file changed, 25 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 1de2cde2277c..282774e469ac 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -962,27 +962,40 @@ int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
>         unsigned count;
>         struct scatterlist *sg;
>         struct page *page;
> -       u32 len, index;
> +       u32 page_len, page_index;
>         dma_addr_t addr;
> +       u32 dma_len, dma_index;
>
> -       index = 0;
> +       /*
> +        * Scatterlist elements contains both pages and DMA addresses, but
> +        * one shoud not assume 1:1 relation between them. The sg->length is
> +        * the size of the physical memory chunk described by the sg->page,
> +        * while sg_dma_len(sg) is the size of the DMA (IO virtual) chunk
> +        * described by the sg_dma_address(sg).
> +        */
> +       page_index = 0;
> +       dma_index = 0;
>         for_each_sg(sgt->sgl, sg, sgt->nents, count) {
> -               len = sg_dma_len(sg);
> +               page_len = sg->length;
>                 page = sg_page(sg);
> +               dma_len = sg_dma_len(sg);
>                 addr = sg_dma_address(sg);
>
> -               while (len > 0) {
> -                       if (WARN_ON(index >= max_entries))
> +               while (pages && page_len > 0) {
> +                       if (WARN_ON(page_index >= max_entries))
>                                 return -1;
> -                       if (pages)
> -                               pages[index] = page;
> -                       if (addrs)
> -                               addrs[index] = addr;
> -
> +                       pages[page_index] = page;
>                         page++;
> +                       page_len -= PAGE_SIZE;
> +                       page_index++;
> +               }
> +               while (addrs && dma_len > 0) {
> +                       if (WARN_ON(dma_index >= max_entries))
> +                               return -1;
> +                       addrs[dma_index] = addr;
>                         addr += PAGE_SIZE;
> -                       len -= PAGE_SIZE;
> -                       index++;
> +                       dma_len -= PAGE_SIZE;
> +                       dma_index++;
>                 }
>         }
>         return 0;
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
