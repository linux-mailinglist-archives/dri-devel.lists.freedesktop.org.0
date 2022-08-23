Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D9E59EE8E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 00:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC43210E2F5;
	Tue, 23 Aug 2022 22:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE6710E1A1;
 Tue, 23 Aug 2022 22:00:22 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 h20-20020a056830165400b00638ac7ddba5so10677379otr.4; 
 Tue, 23 Aug 2022 15:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=KxUnJO5kb4knBfdxm8mXJ+AuQhFumfmLRhT6rxam+RI=;
 b=PFBIoO3Tr9ZKI+LdxB+z2ngMlEd+2QVBA7kjAAQNZ4xICRXJ5GXCXb/C/6r1NxZ0Eb
 bQHeIGudoW7wbPVN61R4Q38wQtV0UGUEVnrOI0q8fth7fsYeNTP3hue2NFRqJn91IHhv
 tMT9xlcs1OElw6MzIXX5BgfRZ6GSBfPeNtPX5ertXIkgSIKwPj/TVWKU03esLsQKBooE
 Pi+zS2rqOIVwX6NQyolqsmbeuDiBL0pg++13uNXmJO9NwmOKdFHjL6BoFsO2wGGm0OKP
 HGlw6XE30IachmI0niAHMhpCysaMlkHbL/+69guE2wZiqcs+GGm/Midk9Fr1BBF6zJl0
 zZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=KxUnJO5kb4knBfdxm8mXJ+AuQhFumfmLRhT6rxam+RI=;
 b=iqsYu6hKPUcomjA/VDCve5JlL/OJYCbSC5f1Xl6VHMVPbFZN6TLvQQUar/8MwMQeoV
 WEaofV/uhVHF5oIBHphRrlGyFzju3xK5Dlz69JvZSnE3QiLRAPpVLIuz5pUjt/3nBWUo
 mRT1NkFhlyH7i7aSfh401dxQRB4JiCf09gNv6inoSCrHSY2hQDPyzCfrvqtFc0vU5Gqe
 115plhlnXD6C3+zSYs0n4LXu+f8U8b0L9SJ5iC/viFa+m6QNb0XIdhHfWLua3SYYpPST
 fKgp11sN/KITsnrAQhsgyZylDKboQaS0wAcpFw1WW7dV5twScIKgiH56Ed2U4UaBy/Yi
 pezg==
X-Gm-Message-State: ACgBeo0BeqV3DZIOExwfqGhn+2yfw+DWRlQVYiXLcPF4oJ0fCdC28zDo
 c65Y0pm8L6ghKd7t/IJntwybwnUoADiXv1osa/ggtzEwYK0=
X-Google-Smtp-Source: AA6agR6yvxeRJ1r5dz8UoW2dhWNf4E3ZO3dZi4TMMLWAKElVhVFa/163CDI9rblTbYjseBsGZzfezNSR0ORlRhDrH40=
X-Received: by 2002:a9d:61d2:0:b0:639:31ca:87fe with SMTP id
 h18-20020a9d61d2000000b0063931ca87femr3407223otk.22.1661292021482; Tue, 23
 Aug 2022 15:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220823163719.90399-1-robdclark@gmail.com>
 <8d3c8ae2-f342-b38c-e0d2-9abd357703f5@quicinc.com>
In-Reply-To: <8d3c8ae2-f342-b38c-e0d2-9abd357703f5@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 23 Aug 2022 15:00:55 -0700
Message-ID: <CAF6AEGtC5g17buULLxag5Ev4=To2QENSBwqOVbmxdopWtpt8cw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2] drm/msm/iommu: optimize map/unmap
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 23, 2022 at 2:37 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On 8/23/2022 10:07 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Using map_pages/unmap_pages cuts down on the # of pgtable walks needed
> > in the process of finding where to insert/remove an entry.  The end
> > result is ~5-10x faster than mapping a single page at a time.
> >
> > v2: Rename iommu_pgsize(), drop obsolete comments, fix error handling
> >      in msm_iommu_pagetable_map()
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/msm_iommu.c | 101 +++++++++++++++++++++++++++-----
> >   1 file changed, 86 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> > index a54ed354578b..5577cea7c009 100644
> > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > @@ -21,6 +21,7 @@ struct msm_iommu_pagetable {
> >       struct msm_mmu base;
> >       struct msm_mmu *parent;
> >       struct io_pgtable_ops *pgtbl_ops;
> > +     unsigned long pgsize_bitmap;    /* Bitmap of page sizes in use */
> >       phys_addr_t ttbr;
> >       u32 asid;
> >   };
> > @@ -29,23 +30,84 @@ static struct msm_iommu_pagetable *to_pagetable(struct msm_mmu *mmu)
> >       return container_of(mmu, struct msm_iommu_pagetable, base);
> >   }
> >
> > +/* based on iommu_pgsize() in iommu.c: */
> > +static size_t calc_pgsize(struct msm_iommu_pagetable *pagetable,
> > +                        unsigned long iova, phys_addr_t paddr,
> > +                        size_t size, size_t *count)
> > +{
> > +     unsigned int pgsize_idx, pgsize_idx_next;
> > +     unsigned long pgsizes;
> > +     size_t offset, pgsize, pgsize_next;
> > +     unsigned long addr_merge = paddr | iova;
> > +
> > +     /* Page sizes supported by the hardware and small enough for @size */
> > +     pgsizes = pagetable->pgsize_bitmap & GENMASK(__fls(size), 0);
> > +
> > +     /* Constrain the page sizes further based on the maximum alignment */
> > +     if (likely(addr_merge))
> > +             pgsizes &= GENMASK(__ffs(addr_merge), 0);
> > +
> > +     /* Make sure we have at least one suitable page size */
> > +     BUG_ON(!pgsizes);
> > +
> > +     /* Pick the biggest page size remaining */
> > +     pgsize_idx = __fls(pgsizes);
> > +     pgsize = BIT(pgsize_idx);
> > +     if (!count)
> > +             return pgsize;
> > +
> > +     /* Find the next biggest support page size, if it exists */
> > +     pgsizes = pagetable->pgsize_bitmap & ~GENMASK(pgsize_idx, 0);
> > +     if (!pgsizes)
> > +             goto out_set_count;
> > +
> > +     pgsize_idx_next = __ffs(pgsizes);
> > +     pgsize_next = BIT(pgsize_idx_next);
> > +
> > +     /*
> > +      * There's no point trying a bigger page size unless the virtual
> > +      * and physical addresses are similarly offset within the larger page.
> > +      */
> > +     if ((iova ^ paddr) & (pgsize_next - 1))
> > +             goto out_set_count;
> > +
> > +     /* Calculate the offset to the next page size alignment boundary */
> > +     offset = pgsize_next - (addr_merge & (pgsize_next - 1));
> > +
> > +     /*
> > +      * If size is big enough to accommodate the larger page, reduce
> > +      * the number of smaller pages.
> > +      */
> > +     if (offset + pgsize_next <= size)
> > +             size = offset;
> > +
> > +out_set_count:
> > +     *count = size >> pgsize_idx;
> > +     return pgsize;
> > +}
> > +
> Can we keep this in iommu driver? Seems useful to other drivers too.

This might end up being only temporary.. Robin had the idea of adding
a private way to create "dummy" iommu_domain's which we could use
instead of the pgtbl ops directly.  On one hand, it would simplify
this quite a bit.  On the other hand it would force powering up (at
least the SMMU) for unmaps/maps, and make it harder to do things like
this:

  https://patchwork.freedesktop.org/patch/498660/?series=107536&rev=1

> Perhaps implement an sg friendly version of iopgtble ops, like
> unmap_sg() maybe!

Probably not a good idea to push more into the iopgtbl
implementations.. __iommu_map_sg() does have a bit of cleverness, but
that shouldn't really be required if we get our sg from
drm_prime_pages_to_sg() since sg_alloc_append_table_from_pages()
already performs a similar merging

BR,
-R

>
> -Akhil.
> >   static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
> >               size_t size)
> >   {
> >       struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> >       struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
> > -     size_t unmapped = 0;
> >
> > -     /* Unmap the block one page at a time */
> >       while (size) {
> > -             unmapped += ops->unmap(ops, iova, 4096, NULL);
> > -             iova += 4096;
> > -             size -= 4096;
> > +             size_t unmapped, pgsize, count;
> > +
> > +             pgsize = calc_pgsize(pagetable, iova, iova, size, &count);
> > +
> > +             unmapped = ops->unmap_pages(ops, iova, pgsize, count, NULL);
> > +             if (!unmapped)
> > +                     break;
> > +
> > +             iova += unmapped;
> > +             size -= unmapped;
> >       }
> >
> >       iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
> >
> > -     return (unmapped == size) ? 0 : -EINVAL;
> > +     return (size == 0) ? 0 : -EINVAL;
> >   }
> >
> >   static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
> > @@ -54,7 +116,6 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
> >       struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> >       struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
> >       struct scatterlist *sg;
> > -     size_t mapped = 0;
> >       u64 addr = iova;
> >       unsigned int i;
> >
> > @@ -62,17 +123,26 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
> >               size_t size = sg->length;
> >               phys_addr_t phys = sg_phys(sg);
> >
> > -             /* Map the block one page at a time */
> >               while (size) {
> > -                     if (ops->map(ops, addr, phys, 4096, prot, GFP_KERNEL)) {
> > -                             msm_iommu_pagetable_unmap(mmu, iova, mapped);
> > +                     size_t pgsize, count, mapped = 0;
> > +                     int ret;
> > +
> > +                     pgsize = calc_pgsize(pagetable, addr, phys, size, &count);
> > +
> > +                     ret = ops->map_pages(ops, addr, phys, pgsize, count,
> > +                                          prot, GFP_KERNEL, &mapped);
> > +
> > +                     /* map_pages could fail after mapping some of the pages,
> > +                      * so update the counters before error handling.
> > +                      */
> > +                     phys += mapped;
> > +                     addr += mapped;
> > +                     size -= mapped;
> > +
> > +                     if (ret) {
> > +                             msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
> >                               return -EINVAL;
> >                       }
> > -
> > -                     phys += 4096;
> > -                     addr += 4096;
> > -                     size -= 4096;
> > -                     mapped += 4096;
> >               }
> >       }
> >
> > @@ -207,6 +277,7 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
> >
> >       /* Needed later for TLB flush */
> >       pagetable->parent = parent;
> > +     pagetable->pgsize_bitmap = ttbr0_cfg.pgsize_bitmap;
> >       pagetable->ttbr = ttbr0_cfg.arm_lpae_s1_cfg.ttbr;
> >
> >       /*
>
