Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D13D9190079
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 22:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E8D89AC2;
	Mon, 23 Mar 2020 21:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2715389AC2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 21:36:20 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 26so1027530wmk.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aa9+xVPRdvdviMSSPFaM6YZKO0ImSW3NEYL3iQBrnhU=;
 b=Cpp2SKYJUYbyvCuRpwDEOsWvNYF77+BcIs0qlsc4Vz8l1EPhm3EOcWBxPyGH+SbHDC
 rGHItdHzzvD6AjgZfIlKeDalYz1y4NuSAJ+RrXp4CDhZldD8D9hZwsr5kAaDMOCZLlRA
 Wh5/7cMvW5dgYVWUgbRg2HyioaKuXbknL8qvj4TkNWTPyF61Qg723BolDdbkcfVBjIvp
 FAPkr3VZUXZIrfo1AL5qFxcjScBVHF+o0QAE/HKk6KMWlGQlTfCMFAAyZO9lFzd5cDUj
 iOO3NEQ/cCGeX/jXklYJ6sLifR2y2y8I3xP4PYLIivqonf3O5aLdA0VrSYkrRFfRTgdv
 N49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aa9+xVPRdvdviMSSPFaM6YZKO0ImSW3NEYL3iQBrnhU=;
 b=CM7MMTPeZoLe9BjOFGkeUziopgJBsbvwAnixZm1zgxk9E8OHbXBhITeIVdN98uf1u6
 q6jjGagrMJGRf47VsFjMNdDAqsG9yfqcQ494njXOZBnRHQ9ayakqDYaDpKJyFKPqb0kb
 tE8udzt3PSzXus5j+f3ZIk+3dGSGei9tGSuaaIcQ0ORlYb9muqj+kbiUD+fIs/g4wOO/
 987mZxTwhGNmAFmdhCExmrcaKrvUQLVp1xFpqk/OnZ6zbbiphWZp+0W/tYmR9mjQcxWb
 JrOD0k6nqpJWhl46JL1ntnwXVXWasiT1563bEPKMFf247sWa4nXXnEoNY+vn2fgx/EZC
 DqTQ==
X-Gm-Message-State: ANhLgQ3Rb0RHyjbMmYoeNSzOJs6e2nQjPqwCkrJKm63Bos9MbUbIAkMA
 OpirSpkkliAuuHUl++wacf9cY/0GM7kQJGoQ9ho=
X-Google-Smtp-Source: ADFU+vufwQthfVTSv2tnOMHHJlqzV7U+2efmYwCPbALPPXkmjJpXg87VpZz3H++SdU55+sHl3FuIqacsm4x5mHKDH88=
X-Received: by 2002:a7b:c542:: with SMTP id j2mr1491836wmk.39.1584999378695;
 Mon, 23 Mar 2020 14:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200323205137.136530-1-bigbeeshane@gmail.com>
 <20200323205137.136530-3-bigbeeshane@gmail.com>
In-Reply-To: <20200323205137.136530-3-bigbeeshane@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 Mar 2020 17:36:07 -0400
Message-ID: <CADnq5_MvGT8BY8T6DQqaC+5FX_Tbb0f6K25wv8fGsy1F1KV_+w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: fix scatter-gather mapping with user pages
To: Shane Francis <bigbeeshane@gmail.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 23, 2020 at 4:52 PM Shane Francis <bigbeeshane@gmail.com> wrote:
>
> Calls to dma_map_sg may return segments / entries than requested
> if they fall on page bounderies. The old implementation did not
> support this use case.
>
> Signed-off-by: Shane Francis <bigbeeshane@gmail.com>

Fixes: be62dbf554c5 ("iommu/amd: Convert AMD iommu driver to the dma-iommu api")

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index dee446278417..d07f143b50c3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -974,12 +974,13 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_tt *ttm)
>         /* Map SG to device */
>         r = -ENOMEM;
>         nents = dma_map_sg(adev->dev, ttm->sg->sgl, ttm->sg->nents, direction);
> -       if (nents != ttm->sg->nents)
> +       if (nents == 0)
>                 goto release_sg;
>
>         /* convert SG to linear array of pages and dma addresses */
> -       drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
> -                                        gtt->ttm.dma_address, ttm->num_pages);
> +       drm_prime_dma_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
> +                                       gtt->ttm.dma_address, ttm->num_pages,
> +                                       nents);
>

I think the other call to drm_prime_sg_to_page_addr_arrays in amdgpu
needs a similar fix.

Alex

>         return 0;
>
> --
> 2.26.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
