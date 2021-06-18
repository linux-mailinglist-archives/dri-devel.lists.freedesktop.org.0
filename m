Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1723AC3FD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 08:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8FC6E859;
	Fri, 18 Jun 2021 06:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1326E859
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 06:34:05 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id s19so837588ilj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 23:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K4gmwVrd4ipCgh7Pt4U3qK6zM5RZFqVsfT+5m/JaTNY=;
 b=b3TOMvQ1kXF7QuAFyHdOkvmT8LXOEbUEDAbnT1VD77ESf6dWqJqkel2pij6H8qazUH
 qeKiHzooTElNu69H2pMv9jI9D4woaiXlDH7E4nc1glsurOz9EYewwC9YHW+cnkiHTax7
 tbypLVBnZif7y60KH97lEwI+rEiH+ILoO0+Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K4gmwVrd4ipCgh7Pt4U3qK6zM5RZFqVsfT+5m/JaTNY=;
 b=ZYDPXiWco/nHAGwT6qGNW+4Nhce5qftlF7osxEH6mr0/0XCnKwuE3JnprKF1JIvBNv
 sim4zBLozpjs/Jznc3ue7bPsTBxT15eWtj9WD+b9H+XYqLiH5ltdibnhPuwoApm60WK1
 wsIUNb4uWAwof83yd4Z6ACpdOjEM41lJoCDXtANBfc34QsHNK6aCL91D1QTVo4WeRK9T
 AENTEUZw1vm0WDHeZlMoQM1Ggi2iKfXwplCFD6V53Vmvqg9YFcCcYyZSZ6IkrcMBuB/8
 1bG/WW3vP48EkKr79RkQ6T220I9eiIuHAd+Eg+vuEKx81b+EzR1NHZ5mu+SmuiznZaAD
 6XKg==
X-Gm-Message-State: AOAM533i2RaZsxVj+DjC0biSCDmN3P1bExIEP7AlgXu4CMMip8RNCi9f
 /6wKQbiAxAb7j/hVZsLhDe+4PdVag69y9w==
X-Google-Smtp-Source: ABdhPJwhje20WoFGHjZtIIs0+omy5osIdIt0nFzR6NNrbOPBcRAKqUfhjBE1Ngs2ruXLQKwbNHcmjQ==
X-Received: by 2002:a92:3f11:: with SMTP id m17mr5880008ila.38.1623998044627; 
 Thu, 17 Jun 2021 23:34:04 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com.
 [209.85.166.51])
 by smtp.gmail.com with ESMTPSA id s17sm3980821ioe.32.2021.06.17.23.34.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 23:34:04 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id k5so5853254iow.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 23:34:03 -0700 (PDT)
X-Received: by 2002:a02:384b:: with SMTP id v11mr1842282jae.90.1623997548077; 
 Thu, 17 Jun 2021 23:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210617062635.1660944-1-tientzu@chromium.org>
 <20210617062635.1660944-2-tientzu@chromium.org>
 <alpine.DEB.2.21.2106171434480.24906@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2106171434480.24906@sstabellini-ThinkPad-T480s>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 18 Jun 2021 14:25:37 +0800
X-Gmail-Original-Message-ID: <CALiNf29SJ0jXirWVDhJw4BUNvkjUeGPyGNJK9m8c30OPX41=5Q@mail.gmail.com>
Message-ID: <CALiNf29SJ0jXirWVDhJw4BUNvkjUeGPyGNJK9m8c30OPX41=5Q@mail.gmail.com>
Subject: Re: [PATCH v13 01/12] swiotlb: Refactor swiotlb init functions
To: Stefano Stabellini <sstabellini@kernel.org>
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 7:30 AM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Thu, 17 Jun 2021, Claire Chang wrote:
> > Add a new function, swiotlb_init_io_tlb_mem, for the io_tlb_mem struct
> > initialization to make the code reusable.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> > Tested-by: Will Deacon <will@kernel.org>
> > ---
> >  kernel/dma/swiotlb.c | 50 ++++++++++++++++++++++----------------------
> >  1 file changed, 25 insertions(+), 25 deletions(-)
> >
> > diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> > index 52e2ac526757..47bb2a766798 100644
> > --- a/kernel/dma/swiotlb.c
> > +++ b/kernel/dma/swiotlb.c
> > @@ -168,9 +168,28 @@ void __init swiotlb_update_mem_attributes(void)
> >       memset(vaddr, 0, bytes);
> >  }
> >
> > -int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
> > +static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
> > +                                 unsigned long nslabs, bool late_alloc)
> >  {
> > +     void *vaddr = phys_to_virt(start);
> >       unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
> > +
> > +     mem->nslabs = nslabs;
> > +     mem->start = start;
> > +     mem->end = mem->start + bytes;
> > +     mem->index = 0;
> > +     mem->late_alloc = late_alloc;
> > +     spin_lock_init(&mem->lock);
> > +     for (i = 0; i < mem->nslabs; i++) {
> > +             mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
> > +             mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
> > +             mem->slots[i].alloc_size = 0;
> > +     }
> > +     memset(vaddr, 0, bytes);
> > +}
> > +
> > +int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
> > +{
> >       struct io_tlb_mem *mem;
> >       size_t alloc_size;
> >
> > @@ -186,16 +205,8 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
> >       if (!mem)
> >               panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
> >                     __func__, alloc_size, PAGE_SIZE);
> > -     mem->nslabs = nslabs;
> > -     mem->start = __pa(tlb);
> > -     mem->end = mem->start + bytes;
> > -     mem->index = 0;
> > -     spin_lock_init(&mem->lock);
> > -     for (i = 0; i < mem->nslabs; i++) {
> > -             mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
> > -             mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
> > -             mem->slots[i].alloc_size = 0;
> > -     }
> > +
> > +     swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
> >
> >       io_tlb_default_mem = mem;
> >       if (verbose)
> > @@ -282,8 +293,8 @@ swiotlb_late_init_with_default_size(size_t default_size)
> >  int
> >  swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
> >  {
> > -     unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
> >       struct io_tlb_mem *mem;
> > +     unsigned long bytes = nslabs << IO_TLB_SHIFT;
> >
> >       if (swiotlb_force == SWIOTLB_NO_FORCE)
> >               return 0;
> > @@ -297,20 +308,9 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
> >       if (!mem)
> >               return -ENOMEM;
> >
> > -     mem->nslabs = nslabs;
> > -     mem->start = virt_to_phys(tlb);
> > -     mem->end = mem->start + bytes;
> > -     mem->index = 0;
> > -     mem->late_alloc = 1;
> > -     spin_lock_init(&mem->lock);
> > -     for (i = 0; i < mem->nslabs; i++) {
> > -             mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
> > -             mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
> > -             mem->slots[i].alloc_size = 0;
> > -     }
> > -
> > +     memset(mem, 0, sizeof(*mem));
> > +     swiotlb_init_io_tlb_mem(mem, virt_to_phys(tlb), nslabs, true);
> >       set_memory_decrypted((unsigned long)tlb, bytes >> PAGE_SHIFT);
> > -     memset(tlb, 0, bytes);
>
> This is good for swiotlb_late_init_with_tbl. However I have just noticed
> that mem could also be allocated from swiotlb_init_with_tbl, in which
> case the zeroing is missing. I think we need another memset in
> swiotlb_init_with_tbl as well. Or maybe it could be better to have a
> single memset at the beginning of swiotlb_init_io_tlb_mem instead. Up to
> you.

swiotlb_init_with_tbl uses memblock_alloc to allocate the io_tlb_mem
and memblock_alloc[1] will do memset in memblock_alloc_try_nid[2], so
swiotlb_init_with_tbl is also good.
I'm happy to add the memset in swiotlb_init_io_tlb_mem if you think
it's clearer and safer.

[1] https://elixir.bootlin.com/linux/v5.13-rc6/source/include/linux/memblock.h#L407
[2] https://elixir.bootlin.com/linux/v5.13-rc6/source/mm/memblock.c#L1555
