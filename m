Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF16241DA2B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 14:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A526E6E3EF;
	Thu, 30 Sep 2021 12:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D966A6E3EC;
 Thu, 30 Sep 2021 12:47:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A533F61390;
 Thu, 30 Sep 2021 12:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633006023;
 bh=JTmzQB+pflTzM1mfQgrPdTorix5E8st9bH6ZyEeegJs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fRASeIpUDgm8NED/mIKjjzb/vGekv/fo1hgMMMoOEhhefjQA0Z3+fYsBq8xOs5Jqs
 yFVLj0TyBQ2Sy1HDWyAlop3oAPAwBMJRCWGM8dKTGMYMAEV3K1QO3kK3N278P1Rg4o
 HYtS1fSU7UsfHNslI0GFbRTpZbR5xMullramEnwG01cg3HSX/DygO6t448uABq4cXV
 DKw2GuRRi6E4SLbnpR/+TH/8uZiUTxfSkO34Q4YtUyjAjvlE9qu7owHTy/AT2F2hBA
 egHe+XOnTEZ8InLm2Mmr7yDvvb95VmaltZ53lyI5zFm7pjcxX9c+t1pZai3bd9IBRf
 chWUZMA7I8GBQ==
Received: by mail-yb1-f175.google.com with SMTP id v195so12422450ybb.0;
 Thu, 30 Sep 2021 05:47:03 -0700 (PDT)
X-Gm-Message-State: AOAM531PEFVJBHMj+3shSNJZ5heL83QU7nqT55tddbo0yXfnqL/VkcX5
 mXYcGgJU9dU7loLzXARg3g8W7/7OTMWrsa/hY+c=
X-Google-Smtp-Source: ABdhPJyTStpkMKHkhoIYFbtlxJ/TC2ZI25fBmmZDCRfQFH0IL0hwLAUggx/tm+N2ny3rd5SxaW3pmTAPfO6hs7UQPlI=
X-Received: by 2002:a25:4507:: with SMTP id s7mr6894930yba.445.1633006022711; 
 Thu, 30 Sep 2021 05:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210912165309.98695-1-ogabbay@kernel.org>
 <20210912165309.98695-3-ogabbay@kernel.org>
 <20210928173621.GG3544071@ziepe.ca>
 <CAFCwf10z-baRm8c-UD_=jcZYD0VAGrMiNo7Q5Fm-2txYmVWGcQ@mail.gmail.com>
In-Reply-To: <CAFCwf10z-baRm8c-UD_=jcZYD0VAGrMiNo7Q5Fm-2txYmVWGcQ@mail.gmail.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 30 Sep 2021 15:46:35 +0300
X-Gmail-Original-Message-ID: <CAFCwf110SPfqpjKO7e2W-MSs6iSdecCwS6CwKx4cL-DjqriT2Q@mail.gmail.com>
Message-ID: <CAFCwf110SPfqpjKO7e2W-MSs6iSdecCwS6CwKx4cL-DjqriT2Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] habanalabs: add support for dma-buf exporter
To: Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Gal Pressman <galpress@amazon.com>, Yossi Leybovich <sleybo@amazon.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, 
 Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Tomer Tayar <ttayar@habana.ai>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 29, 2021 at 12:17 AM Oded Gabbay <ogabbay@kernel.org> wrote:
>
> On Tue, Sep 28, 2021 at 8:36 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Sun, Sep 12, 2021 at 07:53:09PM +0300, Oded Gabbay wrote:
> > > From: Tomer Tayar <ttayar@habana.ai>
> > >
> > > Implement the calls to the dma-buf kernel api to create a dma-buf
> > > object backed by FD.
> > >
> > > We block the option to mmap the DMA-BUF object because we don't support
> > > DIRECT_IO and implicit P2P.
> >
> > This statement doesn't make sense, you can mmap your dmabuf if you
> > like. All dmabuf mmaps are supposed to set the special bit/etc to
> > exclude them from get_user_pages() anyhow - and since this is BAR
> > memory not struct page memory this driver would be doing it anyhow.
> >
> But we block mmap the dmabuf fd from user-space.
> If you try to do it, you will get MAP_FAILED.
> That's because we don't supply a function to the mmap callback in dmabuf.
> We did that per Christian's advice. It is in one of the long email
> threads on previous versions of this patch.
>
>
> > > We check the p2p distance using pci_p2pdma_distance_many() and refusing
> > > to map dmabuf in case the distance doesn't allow p2p.
> >
> > Does this actually allow the p2p transfer for your intended use cases?
> >
> It depends on the system. If we are working bare-metal, then yes, it allows.
> If inside a VM, then no. The virtualized root complex is not
> white-listed and the kernel can't know the distance.
> But I remember you asked me to add this check, in v3 of the review IIRC.
> I don't mind removing this check if you don't object.
>
> > > diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/habanalabs/common/memory.c
> > > index 33986933aa9e..8cf5437c0390 100644
> > > +++ b/drivers/misc/habanalabs/common/memory.c
> > > @@ -1,7 +1,7 @@
> > >  // SPDX-License-Identifier: GPL-2.0
> > >
> > >  /*
> > > - * Copyright 2016-2019 HabanaLabs, Ltd.
> > > + * Copyright 2016-2021 HabanaLabs, Ltd.
> > >   * All Rights Reserved.
> > >   */
> > >
> > > @@ -11,11 +11,13 @@
> > >
> > >  #include <linux/uaccess.h>
> > >  #include <linux/slab.h>
> > > +#include <linux/pci-p2pdma.h>
> > >
> > >  #define HL_MMU_DEBUG 0
> > >
> > >  /* use small pages for supporting non-pow2 (32M/40M/48M) DRAM phys page sizes */
> > > -#define DRAM_POOL_PAGE_SIZE SZ_8M
> > > +#define DRAM_POOL_PAGE_SIZE          SZ_8M
> > > +
> >
> > ??
> ok, I 'll remove
> >
> > >  /*
> > >   * The va ranges in context object contain a list with the available chunks of
> > > @@ -347,6 +349,13 @@ static int free_device_memory(struct hl_ctx *ctx, struct hl_mem_in *args)
> > >                       return -EINVAL;
> > >               }
> > >
> > > +             if (phys_pg_pack->exporting_cnt) {
> > > +                     dev_err(hdev->dev,
> > > +                             "handle %u is exported, cannot free\n", handle);
> > > +                     spin_unlock(&vm->idr_lock);
> >
> > Don't write to the kernel log from user space triggered actions
> at all ?
> It's the first time I hear about this limitation...
> How do you tell the user it has done something wrong ?
> I agree it might be better to rate limit it, but why not give the
> information to the user ?
>
> >
> > > +static int alloc_sgt_from_device_pages(struct hl_device *hdev,
> > > +                                     struct sg_table **sgt, u64 *pages,
> > > +                                     u64 npages, u64 page_size,
> > > +                                     struct device *dev,
> > > +                                     enum dma_data_direction dir)
> >
> > Why doesn't this return a sg_table * and an ERR_PTR?
> Basically I modeled this function after amdgpu_vram_mgr_alloc_sgt()
> And in that function they also return int and pass the sg_table as **
>
> If it's critical I can change.
>
> >
> > > +{
> > > +     u64 chunk_size, bar_address, dma_max_seg_size;
> > > +     struct asic_fixed_properties *prop;
> > > +     int rc, i, j, nents, cur_page;
> > > +     struct scatterlist *sg;
> > > +
> > > +     prop = &hdev->asic_prop;
> > > +
> > > +     dma_max_seg_size = dma_get_max_seg_size(dev);
> >
> > > +
> > > +     /* We would like to align the max segment size to PAGE_SIZE, so the
> > > +      * SGL will contain aligned addresses that can be easily mapped to
> > > +      * an MMU
> > > +      */
> > > +     dma_max_seg_size = ALIGN_DOWN(dma_max_seg_size, PAGE_SIZE);
> > > +     if (dma_max_seg_size < PAGE_SIZE) {
> > > +             dev_err_ratelimited(hdev->dev,
> > > +                             "dma_max_seg_size %llu can't be smaller than PAGE_SIZE\n",
> > > +                             dma_max_seg_size);
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     *sgt = kzalloc(sizeof(**sgt), GFP_KERNEL);
> > > +     if (!*sgt)
> > > +             return -ENOMEM;
> > > +
> > > +     /* If the size of each page is larger than the dma max segment size,
> > > +      * then we can't combine pages and the number of entries in the SGL
> > > +      * will just be the
> > > +      * <number of pages> * <chunks of max segment size in each page>
> > > +      */
> > > +     if (page_size > dma_max_seg_size)
> > > +             nents = npages * DIV_ROUND_UP_ULL(page_size, dma_max_seg_size);
> > > +     else
> > > +             /* Get number of non-contiguous chunks */
> > > +             for (i = 1, nents = 1, chunk_size = page_size ; i < npages ; i++) {
> > > +                     if (pages[i - 1] + page_size != pages[i] ||
> > > +                                     chunk_size + page_size > dma_max_seg_size) {
> > > +                             nents++;
> > > +                             chunk_size = page_size;
> > > +                             continue;
> > > +                     }
> > > +
> > > +                     chunk_size += page_size;
> > > +             }
> > > +
> > > +     rc = sg_alloc_table(*sgt, nents, GFP_KERNEL | __GFP_ZERO);
> > > +     if (rc)
> > > +             goto error_free;
> > > +
> > > +     /* Because we are not going to include a CPU list we want to have some
> > > +      * chance that other users will detect this by setting the orig_nents
> > > +      * to 0 and using only nents (length of DMA list) when going over the
> > > +      * sgl
> > > +      */
> > > +     (*sgt)->orig_nents = 0;
> >
> > Maybe do this at the end so you'd have to undo it on the error path?
> Agreed, less code
>
> >
> > > +     cur_page = 0;
> > > +
> > > +     if (page_size > dma_max_seg_size) {
> > > +             u64 size_left, cur_device_address = 0;
> > > +
> > > +             size_left = page_size;
> > > +
> > > +             /* Need to split each page into the number of chunks of
> > > +              * dma_max_seg_size
> > > +              */
> > > +             for_each_sgtable_dma_sg((*sgt), sg, i) {
> > > +                     if (size_left == page_size)
> > > +                             cur_device_address =
> > > +                                     pages[cur_page] - prop->dram_base_address;
> > > +                     else
> > > +                             cur_device_address += dma_max_seg_size;
> > > +
> > > +                     chunk_size = min(size_left, dma_max_seg_size);
> > > +
> > > +                     bar_address = hdev->dram_pci_bar_start + cur_device_address;
> > > +
> > > +                     rc = set_dma_sg(sg, bar_address, chunk_size, dev, dir);
> > > +                     if (rc)
> > > +                             goto error_unmap;
> > > +
> > > +                     if (size_left > dma_max_seg_size) {
> > > +                             size_left -= dma_max_seg_size;
> > > +                     } else {
> > > +                             cur_page++;
> > > +                             size_left = page_size;
> > > +                     }
> > > +             }
> > > +     } else {
> > > +             /* Merge pages and put them into the scatterlist */
> > > +             for_each_sgtable_dma_sg((*sgt), sg, i) {
> > > +                     chunk_size = page_size;
> > > +                     for (j = cur_page + 1 ; j < npages ; j++) {
> > > +                             if (pages[j - 1] + page_size != pages[j] ||
> > > +                                             chunk_size + page_size > dma_max_seg_size)
> > > +                                     break;
> > > +
> > > +                             chunk_size += page_size;
> > > +                     }
> > > +
> > > +                     bar_address = hdev->dram_pci_bar_start +
> > > +                                     (pages[cur_page] - prop->dram_base_address);
> > > +
> > > +                     rc = set_dma_sg(sg, bar_address, chunk_size, dev, dir);
> > > +                     if (rc)
> > > +                             goto error_unmap;
> > > +
> > > +                     cur_page = j;
> > > +             }
> > > +     }
> >
> > We have this sg_append stuff now that is intended to help building
> > these things. It can only build CPU page lists, not these DMA lists,
> > but I do wonder if open coding in drivers is slipping back a
> > bit. Especially since AMD seems to be doing something different.
> >
> > Could the DMABUF layer gain some helpers styled after the sg_append to
> > simplify building these things? and convert the AMD driver of course.
> >
> I will take it as a task to do in the near future, but I prefer to
> first upstream these patches as-is,
> because I don't have a way to check AMD devices and I guess converting them
> might take some time.
>
> > > +static int hl_dmabuf_attach(struct dma_buf *dmabuf,
> > > +                             struct dma_buf_attachment *attachment)
> > > +{
> > > +     struct hl_dmabuf_wrapper *hl_dmabuf;
> > > +     struct hl_device *hdev;
> > > +     int rc;
> > > +
> > > +     hl_dmabuf = dmabuf->priv;
> > > +     hdev = hl_dmabuf->ctx->hdev;
> > > +
> > > +     rc = pci_p2pdma_distance_many(hdev->pdev, &attachment->dev, 1, true);
> > > +
> > > +     if (rc < 0)
> > > +             attachment->peer2peer = false;
> >
> > Extra blank line
> >
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static struct sg_table *hl_map_dmabuf(struct dma_buf_attachment *attachment,
> > > +                                     enum dma_data_direction dir)
> > > +{
> > > +     struct dma_buf *dma_buf = attachment->dmabuf;
> > > +     struct hl_vm_phys_pg_pack *phys_pg_pack;
> > > +     struct hl_dmabuf_wrapper *hl_dmabuf;
> > > +     struct hl_device *hdev;
> > > +     struct sg_table *sgt;
> > > +     int rc;
> > > +
> > > +     hl_dmabuf = dma_buf->priv;
> > > +     hdev = hl_dmabuf->ctx->hdev;
> > > +     phys_pg_pack = hl_dmabuf->phys_pg_pack;
> > > +
> > > +     if (!attachment->peer2peer) {
> > > +             dev_err(hdev->dev,
> > > +                     "Failed to map dmabuf because p2p is disabled\n");
> > > +             return ERR_PTR(-EPERM);
> >
> > User triggered printable again?
> But how will the user know what the reason for the failure is ?
>
> >
> > > +static void hl_unmap_dmabuf(struct dma_buf_attachment *attachment,
> > > +                               struct sg_table *sgt,
> > > +                               enum dma_data_direction dir)
> > > +{
> > > +     struct scatterlist *sg;
> > > +     int i;
> > > +
> > > +     for_each_sgtable_dma_sg(sgt, sg, i)
> > > +             dma_unmap_resource(attachment->dev, sg_dma_address(sg),
> > > +                                     sg_dma_len(sg), dir,
> > > +                                     DMA_ATTR_SKIP_CPU_SYNC);
> >
> > Why can we skip the CPU_SYNC? Seems like a comment is needed
> >
> > Something has to do a CPU_SYNC before recylcing this memory for
> > another purpose, where is it?
> I have to ask for further explanation here.
> Same as before, this function is modeled after the amdgpu one -
> amdgpu_vram_mgr_free_sgt()
> They also use CPU_SYNC in that function.
> Christain, maybe you know ?
>
> Maybe it is not relevant to our case as it represents a PCI bar ?
>
Hi Jason,
After reading the kernel iommu code, I think this is not relevant
here, and I'll add a comment
appropriately but I'll also write it here, and please correct me if my
understanding
is wrong.

The memory behind this specific dma-buf has *always* resided on the
device itself, i.e. it lives
only in the 'device' domain (after all, it maps a PCI bar address
which points to the device memory).
Therefore, it was never in the 'CPU' domain and hence, there is no
need to perform a sync
of the memory to the CPU's cache, as it was never inside that cache to
begin with.

This is not the same case as with regular memory which is dma-mapped
and then copied
into the device using a dma engine. In that case, the memory started
in the 'CPU' domain
and moved to the 'device' domain. When it is unmapped it will indeed
be recycled to be
used for another purpose and therefore we need to sync the CPU cache.

Is my understanding correct ?

Thanks,
Oded
> >
> > > +static void hl_release_dmabuf(struct dma_buf *dmabuf)
> > > +{
> > > +     struct hl_dmabuf_wrapper *hl_dmabuf = dmabuf->priv;
> >
> > Maybe hl_dmabuf_wrapper should be hl_dmabuf_priv
> Agreed.
>
> >
> > > + * export_dmabuf_from_addr() - export a dma-buf object for the given memory
> > > + *                             address and size.
> > > + * @ctx: pointer to the context structure.
> > > + * @device_addr:  device memory physical address.
> > > + * @size: size of device memory.
> > > + * @flags: DMA-BUF file/FD flags.
> > > + * @dmabuf_fd: pointer to result FD that represents the dma-buf object.
> > > + *
> > > + * Create and export a dma-buf object for an existing memory allocation inside
> > > + * the device memory, and return a FD which is associated with the dma-buf
> > > + * object.
> > > + *
> > > + * Return: 0 on success, non-zero for failure.
> > > + */
> > > +static int export_dmabuf_from_addr(struct hl_ctx *ctx, u64 device_addr,
> > > +                                     u64 size, int flags, int *dmabuf_fd)
> > > +{
> > > +     struct hl_dmabuf_wrapper *hl_dmabuf;
> > > +     struct hl_device *hdev = ctx->hdev;
> > > +     struct asic_fixed_properties *prop;
> > > +     u64 bar_address;
> > > +     int rc;
> > > +
> > > +     prop = &hdev->asic_prop;
> > > +
> > > +     if (!IS_ALIGNED(device_addr, PAGE_SIZE)) {
> > > +             dev_err_ratelimited(hdev->dev,
> > > +                     "address of exported device memory should be aligned to 0x%lx, address 0x%llx\n",
> > > +                     PAGE_SIZE, device_addr);
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     if (size < PAGE_SIZE) {
> > > +             dev_err_ratelimited(hdev->dev,
> > > +                     "size %llu of exported device memory should be equal to or greater than %lu\n",
> > > +                     size, PAGE_SIZE);
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     if (device_addr < prop->dram_user_base_address ||
> > > +                             device_addr + size > prop->dram_end_address ||
> > > +                             device_addr + size < device_addr) {
> > > +             dev_err_ratelimited(hdev->dev,
> > > +                     "DRAM memory range is outside of DRAM boundaries, address 0x%llx, size 0x%llx\n",
> > > +                     device_addr, size);
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     bar_address = hdev->dram_pci_bar_start +
> > > +                     (device_addr - prop->dram_base_address);
> > > +
> > > +     if (bar_address + size >
> > > +                     hdev->dram_pci_bar_start + prop->dram_pci_bar_size ||
> > > +                     bar_address + size < bar_address) {
> > > +             dev_err_ratelimited(hdev->dev,
> > > +                     "DRAM memory range is outside of PCI BAR boundaries, address 0x%llx, size 0x%llx\n",
> > > +                     device_addr, size);
> > > +             return -EINVAL;
> > > +     }
> >
> > More prints from userspace
> >
> > > +static int export_dmabuf_from_handle(struct hl_ctx *ctx, u64 handle, int flags,
> > > +                                     int *dmabuf_fd)
> > > +{
> > > +     struct hl_vm_phys_pg_pack *phys_pg_pack;
> > > +     struct hl_dmabuf_wrapper *hl_dmabuf;
> > > +     struct hl_device *hdev = ctx->hdev;
> > > +     struct asic_fixed_properties *prop;
> > > +     struct hl_vm *vm = &hdev->vm;
> > > +     u64 bar_address;
> > > +     u32 idr_handle;
> > > +     int rc, i;
> > > +
> > > +     prop = &hdev->asic_prop;
> > > +
> > > +     idr_handle = lower_32_bits(handle);
> >
> > Why silent truncation? Shouldn't setting the upper 32 bits be an
> > error?
> Yes, you are correct. I will fix it.
>
> >
> > > +     case HL_MEM_OP_EXPORT_DMABUF_FD:
> > > +             rc = export_dmabuf_from_addr(ctx,
> > > +                             args->in.export_dmabuf_fd.handle,
> > > +                             args->in.export_dmabuf_fd.mem_size,
> > > +                             args->in.flags,
> > > +                             &dmabuf_fd);
> > > +             memset(args, 0, sizeof(*args));
> > > +             args->out.fd = dmabuf_fd;
> >
> > Would expect the installed fd to be the positive return, not a pointer
> yeah, changed it to s32 as you suggested.
> >
> > Jason
