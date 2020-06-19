Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFFE200C39
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 16:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC3D6E161;
	Fri, 19 Jun 2020 14:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7486E0F1;
 Fri, 19 Jun 2020 14:45:05 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id g1so7815586edv.6;
 Fri, 19 Jun 2020 07:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n3TBE7tx6S7GnpZVCrwlr/3N+oOzUPGbvusmUOmG/T0=;
 b=AxLuXevQ37Qe6irR4ELS8KP+FbtI7KzXJI7NPPBrQFIdiz2bPyjW2dwsDyUEuAZ6Gj
 obAXbSqGvGp46HL1svoQ4ohhMLjIhlffXnHZ/rd6JE333aLAHAfe6p6IEAkDpMyo0pXz
 3gqCLLWBaQXFA+AKx51giDtpvGcOTXpNZQBkXRmjuL5/eK+mv5WjFpQ7EHYykN0iQqJQ
 5tiAnbC+hsmw05IcJKVRoieT8Q91BROe1dS0b8nEaqn6ub+ly4za5VRH9v4PT/EhZQS7
 GynsqTBgTG8dn/wZF0n7EHmYWJlx404GKADvC7euqmHvIFUdOyYzOlOpc7sXgaE5Mzfs
 JnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n3TBE7tx6S7GnpZVCrwlr/3N+oOzUPGbvusmUOmG/T0=;
 b=JS3sfZW4j8AQzMmLxUvfADzHuRZJbI3SDkPaBq3XG/wd3Et34SP6OrVRcH4USQZVEa
 5zq7iM16+HWs3e6vxTwDjMPJuuetwvP57+BAQPQq64JUxDjS6hzFJuPiVO51l19j9AzT
 m+AhjdTpmkAC0+npltZ1mIZ9f7xhyQDgFVvf+Fi7NOfezpfveLaZ4/gZ4w+b9BDwGUYT
 EzcR1/56q3wxGXVsADHYNmpqQw7EW4jKBZgMC5HPLd5aAnRZT+aQuzUcrZpBL0hYKQfc
 rFKjbbEFcKb+M6nlOh0yHX5URhYcpmRB+LRZUYuM28ikeZ3JPMtTQPfk/VK9Mf77uguO
 gKNw==
X-Gm-Message-State: AOAM533nlpuFhaZAWwoRkhxWO9j0cCzuRXPE+cgXUhgUgvzgkgSWBu16
 ElLBN+TrHu6EiMDYQC5IrBE3VlxJpYtpKFA6aFU=
X-Google-Smtp-Source: ABdhPJyrHWOsI7xCVBWiV5yZaFNfurId9widfkp7/AgosrKLWEbgVSdn17jhr9iXO5CndhUq8INILlVyez+GNc7k8GQ=
X-Received: by 2002:aa7:da14:: with SMTP id r20mr3712651eds.7.1592577904398;
 Fri, 19 Jun 2020 07:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200619103702eucas1p1c57147013bbac3968f6ba073caec68b5@eucas1p1.samsung.com>
 <20200619103636.11974-1-m.szyprowski@samsung.com>
 <20200619103636.11974-14-m.szyprowski@samsung.com>
In-Reply-To: <20200619103636.11974-14-m.szyprowski@samsung.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 19 Jun 2020 07:45:32 -0700
Message-ID: <CAF6AEGv9We+wD72_px3mucsXQuTFZ3ZX_CAA1LTysMBdiDcEFw@mail.gmail.com>
Subject: Re: [PATCH v7 13/36] drm: msm: fix common struct sg_table related
 issues
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 19, 2020 at 3:37 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
> returns the number of the created entries in the DMA address space.
> However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
> dma_unmap_sg must be called with the original number of the entries
> passed to the dma_map_sg().
>
> struct sg_table is a common structure used for describing a non-contiguous
> memory buffer, used commonly in the DRM and graphics subsystems. It
> consists of a scatterlist with memory pages and DMA addresses (sgl entry),
> as well as the number of scatterlist entries: CPU pages (orig_nents entry)
> and DMA mapped pages (nents entry).
>
> It turned out that it was a common mistake to misuse nents and orig_nents
> entries, calling DMA-mapping functions with a wrong number of entries or
> ignoring the number of mapped entries returned by the dma_map_sg()
> function.
>
> To avoid such issues, lets use a common dma-mapping wrappers operating
> directly on the struct sg_table objects and use scatterlist page
> iterators where possible. This, almost always, hides references to the
> nents and orig_nents entries, making the code robust, easier to follow
> and copy/paste safe.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Acked-by: Rob Clark <robdclark@gmail.com>

(let me know if you want me to take this one in via msm-next or if the
plan is to take the series via drm-misc)


> ---
>  drivers/gpu/drm/msm/msm_gem.c    | 13 +++++--------
>  drivers/gpu/drm/msm/msm_gpummu.c | 14 ++++++--------
>  drivers/gpu/drm/msm/msm_iommu.c  |  2 +-
>  3 files changed, 12 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 38b0c0e1f83e..e0d5fd36ea8f 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -53,11 +53,10 @@ static void sync_for_device(struct msm_gem_object *msm_obj)
>         struct device *dev = msm_obj->base.dev->dev;
>
>         if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
> -               dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
> -                       msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
> +               dma_sync_sgtable_for_device(dev, msm_obj->sgt,
> +                                           DMA_BIDIRECTIONAL);
>         } else {
> -               dma_map_sg(dev, msm_obj->sgt->sgl,
> -                       msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
> +               dma_map_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
>         }
>  }
>
> @@ -66,11 +65,9 @@ static void sync_for_cpu(struct msm_gem_object *msm_obj)
>         struct device *dev = msm_obj->base.dev->dev;
>
>         if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
> -               dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
> -                       msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
> +               dma_sync_sgtable_for_cpu(dev, msm_obj->sgt, DMA_BIDIRECTIONAL);
>         } else {
> -               dma_unmap_sg(dev, msm_obj->sgt->sgl,
> -                       msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
> +               dma_unmap_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
>         }
>  }
>
> diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
> index 310a31b05faa..319f06c28235 100644
> --- a/drivers/gpu/drm/msm/msm_gpummu.c
> +++ b/drivers/gpu/drm/msm/msm_gpummu.c
> @@ -30,21 +30,19 @@ static int msm_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
>  {
>         struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
>         unsigned idx = (iova - GPUMMU_VA_START) / GPUMMU_PAGE_SIZE;
> -       struct scatterlist *sg;
> +       struct sg_dma_page_iter dma_iter;
>         unsigned prot_bits = 0;
> -       unsigned i, j;
>
>         if (prot & IOMMU_WRITE)
>                 prot_bits |= 1;
>         if (prot & IOMMU_READ)
>                 prot_bits |= 2;
>
> -       for_each_sg(sgt->sgl, sg, sgt->nents, i) {
> -               dma_addr_t addr = sg->dma_address;
> -               for (j = 0; j < sg->length / GPUMMU_PAGE_SIZE; j++, idx++) {
> -                       gpummu->table[idx] = addr | prot_bits;
> -                       addr += GPUMMU_PAGE_SIZE;
> -               }
> +       for_each_sgtable_dma_page(sgt, &dma_iter, 0) {
> +               dma_addr_t addr = sg_page_iter_dma_address(&dma_iter);
> +
> +               BUILD_BUG_ON(GPUMMU_PAGE_SIZE != PAGE_SIZE);
> +               gpummu->table[idx++] = addr | prot_bits;
>         }
>
>         /* we can improve by deferring flush for multiple map() */
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 3a381a9674c9..6c31e65834c6 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -36,7 +36,7 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
>         struct msm_iommu *iommu = to_msm_iommu(mmu);
>         size_t ret;
>
> -       ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
> +       ret = iommu_map_sgtable(iommu->domain, iova, sgt, prot);
>         WARN_ON(!ret);
>
>         return (ret == len) ? 0 : -EINVAL;
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
