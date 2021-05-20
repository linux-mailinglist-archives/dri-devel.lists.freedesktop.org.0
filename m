Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B273C389E33
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 08:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C3D6EEAC;
	Thu, 20 May 2021 06:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21E76EEAC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 06:48:04 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id t11so15470975iol.9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 23:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oIhFsW3yOUmKSioHfdtl49xT1nsW2ymAOSCthcMXiio=;
 b=lM9veaUv42y4nXibj1lGSdifgvjsNbUKUEol+uJziWw6kVRwnZkDD52tXqcK/vhasS
 PUDj92pN5vsIbUfabcqexhaZYlSojZJ1wq1mzK9ZTms/+1Va4jsCnNJ6mu4u4DoMsmtY
 16/lsdYHKt3Z41zBC1z7c65B0IdsqOKp+QHbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oIhFsW3yOUmKSioHfdtl49xT1nsW2ymAOSCthcMXiio=;
 b=oCGtbq4QI+mUp2nXFbg+AChjLtvhq57vLL7qZwjd2w9ZBwPS37t3pKOkUkq7Dp3a61
 7UoZSaNhsvE8k7iaDjxDg+p46yojWk92bKmCRMiVXJktoFa6eHxpu15myoqwG464HEZ0
 37zeJO0MHOO1PDnhVrqFytmk00pMSzgM2jv0+b3R1W8N6sbXwsUmS0yPd4KMVrSSPR5Z
 Ai857u6eQP/MwthVvt3b1lJxdTaInwJX4+TJIoVApLZKQOJP1NfO73ae8z2KaNsLAtdM
 Loa41cu6OLbmbVydEtp3PSJWewe9W12q52vVkwcAdD/+AqYDtsJJ07RlkE6S8FMgmOk+
 jskA==
X-Gm-Message-State: AOAM532XHsg/aGfnES45HhlA1NkHtS0gCGZskRY3Ji12IqUcOy6i2RgS
 AKdn2K3pjxOLCqo4wZaLX6rsA3gsXkA78A==
X-Google-Smtp-Source: ABdhPJw3F2ctABG5j0VxU9dPDGUo/xDXZupeWZY5ORFK2ehgwNGNq1G2IuoOtWjnNrmDW2Y4aRTskw==
X-Received: by 2002:a5d:9916:: with SMTP id x22mr3696351iol.160.1621493283660; 
 Wed, 19 May 2021 23:48:03 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43])
 by smtp.gmail.com with ESMTPSA id t10sm2017064ils.36.2021.05.19.23.48.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 23:48:03 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id z24so15508682ioi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 23:48:03 -0700 (PDT)
X-Received: by 2002:a5d:8c82:: with SMTP id g2mr3632711ion.34.1621492834046;
 Wed, 19 May 2021 23:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-2-tientzu@chromium.org>
 <170a54f2-be20-ec29-1d7f-3388e5f928c6@gmail.com>
In-Reply-To: <170a54f2-be20-ec29-1d7f-3388e5f928c6@gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 20 May 2021 14:40:23 +0800
X-Gmail-Original-Message-ID: <CALiNf2-9fRbH3Xs=fA+N1iRztFxeC0iTsyOSZFe=F42uwXS0Sg@mail.gmail.com>
Message-ID: <CALiNf2-9fRbH3Xs=fA+N1iRztFxeC0iTsyOSZFe=F42uwXS0Sg@mail.gmail.com>
Subject: Re: [PATCH v7 01/15] swiotlb: Refactor swiotlb init functions
To: Florian Fainelli <f.fainelli@gmail.com>
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
 Marek Szyprowski <m.szyprowski@samsung.com>, sstabellini@kernel.org,
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
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 20, 2021 at 2:50 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 5/17/2021 11:42 PM, Claire Chang wrote:
> > Add a new function, swiotlb_init_io_tlb_mem, for the io_tlb_mem struct
> > initialization to make the code reusable.
> >
> > Note that we now also call set_memory_decrypted in swiotlb_init_with_tbl.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > ---
> >  kernel/dma/swiotlb.c | 51 ++++++++++++++++++++++----------------------
> >  1 file changed, 25 insertions(+), 26 deletions(-)
> >
> > diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> > index 8ca7d505d61c..d3232fc19385 100644
> > --- a/kernel/dma/swiotlb.c
> > +++ b/kernel/dma/swiotlb.c
> > @@ -168,9 +168,30 @@ void __init swiotlb_update_mem_attributes(void)
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
> > +
> > +     set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
> > +     memset(vaddr, 0, bytes);
>
> You are doing an unconditional set_memory_decrypted() followed by a
> memset here, and then:
>
> > +}
> > +
> > +int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
> > +{
> >       struct io_tlb_mem *mem;
> >       size_t alloc_size;
> >
> > @@ -186,16 +207,8 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
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
>
> You convert this call site with swiotlb_init_io_tlb_mem() which did not
> do the set_memory_decrypted()+memset(). Is this okay or should
> swiotlb_init_io_tlb_mem() add an additional argument to do this
> conditionally?

I'm actually not sure if this it okay. If not, will add an additional
argument for it.

> --
> Florian
