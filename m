Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF2C36B727
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 18:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311D46E844;
	Mon, 26 Apr 2021 16:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86356E85F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 16:44:39 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id a9so1547915ilh.9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 09:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cFKXKq/sKurvSVgvNvGkxgOiMlOZ5bG92GQyZxG6/Ow=;
 b=hQyrvIvY0OkwlUkO65L/o3TMJboyrA/EOLuUe0Pq7KgqeFtR8O9LJWrjeU2EQISYlu
 bJHPBsPqEo2jNERM7Qly7inrbryADiFPyU5whSnn5mfATXbgH1UnC4GjWrov7E7itgl/
 y/vmAUUGiGEmxu0IFynSQLccMWdifgG50rRhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cFKXKq/sKurvSVgvNvGkxgOiMlOZ5bG92GQyZxG6/Ow=;
 b=boLofMnezBsY+uTFdppzXh3iXwb8+5arF8v9/3yvLae3qRA4XqDvwhk+GWlxUOIlMN
 yEN/ZWsWZnNacfT++7XFDRTwYHioBDsL3Unem1MSLBXVuje7ltp4cyCaWVz97KnLRckB
 aD20YHYqkCwsmkVzuS/fXEjSWTJ/tO+lDZIucw23KeyyliiBvc6GzGl1o3jKRnpzj9Dr
 csJHnneUO05BldhPIt+KmJYRm7F4ea01yzVA0Xg8H5WfwUU4oD9sZ4UJ1ZHepa/GGCKd
 U2OpQzjWIQRjIc2du0JDvr2mxZp+WwAXWt/46BRIZltnOed2wJgwpWG3OTI3NwpEg3Qn
 oauQ==
X-Gm-Message-State: AOAM532T4bAYC/lQ/QecwkHLbPgAfLanVAQ+qIDc6PaKRL6tEiVnvgwU
 7Svgeg8o6bHnqtVtdBfqxVZlGp2EVJ3REw==
X-Google-Smtp-Source: ABdhPJwQ/8E/BDNG5Ae1nYYQsELO7WTDspzkiiiNLeGCaLDmC1Fl6ygj4rEthrq86YijQUzEvhOAYA==
X-Received: by 2002:a92:da8a:: with SMTP id u10mr14959707iln.100.1619455478912; 
 Mon, 26 Apr 2021 09:44:38 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43])
 by smtp.gmail.com with ESMTPSA id 6sm7844912iog.36.2021.04.26.09.44.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 09:44:38 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id t21so5823917iob.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 09:44:38 -0700 (PDT)
X-Received: by 2002:a92:7307:: with SMTP id o7mr14655769ilc.5.1619455077553;
 Mon, 26 Apr 2021 09:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210422081508.3942748-1-tientzu@chromium.org>
 <20210422081508.3942748-9-tientzu@chromium.org>
 <1f84aa4c-f966-0986-b5a4-eecbf3b454ec@arm.com>
In-Reply-To: <1f84aa4c-f966-0986-b5a4-eecbf3b454ec@arm.com>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 27 Apr 2021 00:37:46 +0800
X-Gmail-Original-Message-ID: <CALiNf29N3U5GZKNN90NzjSeQ0WG4dxyRzU97fJ-r9OuChzLWKA@mail.gmail.com>
Message-ID: <CALiNf29N3U5GZKNN90NzjSeQ0WG4dxyRzU97fJ-r9OuChzLWKA@mail.gmail.com>
Subject: Re: [PATCH v5 08/16] swiotlb: Update is_swiotlb_active to add a
 struct device argument
To: Robin Murphy <robin.murphy@arm.com>
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
 lkml <linux-kernel@vger.kernel.org>, grant.likely@arm.com, paulus@samba.org,
 Will Deacon <will@kernel.org>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 chris@chris-wilson.co.uk, nouveau@lists.freedesktop.org,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Frank Rowand <frowand.list@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 9:31 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2021-04-22 09:15, Claire Chang wrote:
> > Update is_swiotlb_active to add a struct device argument. This will be
> > useful later to allow for restricted DMA pool.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_internal.c | 2 +-
> >   drivers/gpu/drm/nouveau/nouveau_ttm.c        | 2 +-
> >   drivers/pci/xen-pcifront.c                   | 2 +-
> >   include/linux/swiotlb.h                      | 4 ++--
> >   kernel/dma/direct.c                          | 2 +-
> >   kernel/dma/swiotlb.c                         | 4 ++--
> >   6 files changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> > index ce6b664b10aa..7d48c433446b 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> > @@ -42,7 +42,7 @@ static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
> >
> >       max_order = MAX_ORDER;
> >   #ifdef CONFIG_SWIOTLB
> > -     if (is_swiotlb_active()) {
> > +     if (is_swiotlb_active(NULL)) {
> >               unsigned int max_segment;
> >
> >               max_segment = swiotlb_max_segment();
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> > index e8b506a6685b..2a2ae6d6cf6d 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> > @@ -321,7 +321,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
> >       }
> >
> >   #if IS_ENABLED(CONFIG_SWIOTLB) && IS_ENABLED(CONFIG_X86)
> > -     need_swiotlb = is_swiotlb_active();
> > +     need_swiotlb = is_swiotlb_active(NULL);
> >   #endif
> >
> >       ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev->dev,
> > diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
> > index b7a8f3a1921f..6d548ce53ce7 100644
> > --- a/drivers/pci/xen-pcifront.c
> > +++ b/drivers/pci/xen-pcifront.c
> > @@ -693,7 +693,7 @@ static int pcifront_connect_and_init_dma(struct pcifront_device *pdev)
> >
> >       spin_unlock(&pcifront_dev_lock);
> >
> > -     if (!err && !is_swiotlb_active()) {
> > +     if (!err && !is_swiotlb_active(NULL)) {
> >               err = pci_xen_swiotlb_init_late();
> >               if (err)
> >                       dev_err(&pdev->xdev->dev, "Could not setup SWIOTLB!\n");
> > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > index 2a6cca07540b..c530c976d18b 100644
> > --- a/include/linux/swiotlb.h
> > +++ b/include/linux/swiotlb.h
> > @@ -123,7 +123,7 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
> >   void __init swiotlb_exit(void);
> >   unsigned int swiotlb_max_segment(void);
> >   size_t swiotlb_max_mapping_size(struct device *dev);
> > -bool is_swiotlb_active(void);
> > +bool is_swiotlb_active(struct device *dev);
> >   void __init swiotlb_adjust_size(unsigned long size);
> >   #else
> >   #define swiotlb_force SWIOTLB_NO_FORCE
> > @@ -143,7 +143,7 @@ static inline size_t swiotlb_max_mapping_size(struct device *dev)
> >       return SIZE_MAX;
> >   }
> >
> > -static inline bool is_swiotlb_active(void)
> > +static inline bool is_swiotlb_active(struct device *dev)
> >   {
> >       return false;
> >   }
> > diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> > index 84c9feb5474a..7a88c34d0867 100644
> > --- a/kernel/dma/direct.c
> > +++ b/kernel/dma/direct.c
> > @@ -495,7 +495,7 @@ int dma_direct_supported(struct device *dev, u64 mask)
> >   size_t dma_direct_max_mapping_size(struct device *dev)
> >   {
> >       /* If SWIOTLB is active, use its maximum mapping size */
> > -     if (is_swiotlb_active() &&
> > +     if (is_swiotlb_active(dev) &&
> >           (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))
>
> I wonder if it's worth trying to fold these other conditions into
> is_swiotlb_active() itself? I'm not entirely sure what matters for Xen,
> but for the other cases it seems like they probably only care about
> whether bouncing may occur for their particular device or not (possibly
> they want to be using dma_max_mapping_size() now anyway - TBH I'm
> struggling to make sense of what the swiotlb_max_segment business is
> supposed to mean).

I think leaving those conditions outside of is_swiotlb_active() might
help avoid confusion with is_dev_swiotlb_force() in patch #9? We need
is_dev_swiotlb_force() only because the restricted DMA pool supports
memory allocation, but the default swiotlb doesn't.

>
> Otherwise, patch #9 will need to touch here as well to make sure that
> per-device forced bouncing is reflected correctly.

You're right. Otherwise, is_dev_swiotlb_force is needed here.


>
> Robin.
>
> >               return swiotlb_max_mapping_size(dev);
> >       return SIZE_MAX;
> > diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> > index ffbb8724e06c..1d221343f1c8 100644
> > --- a/kernel/dma/swiotlb.c
> > +++ b/kernel/dma/swiotlb.c
> > @@ -659,9 +659,9 @@ size_t swiotlb_max_mapping_size(struct device *dev)
> >       return ((size_t)IO_TLB_SIZE) * IO_TLB_SEGSIZE;
> >   }
> >
> > -bool is_swiotlb_active(void)
> > +bool is_swiotlb_active(struct device *dev)
> >   {
> > -     return io_tlb_default_mem != NULL;
> > +     return get_io_tlb_mem(dev) != NULL;
> >   }
> >   EXPORT_SYMBOL_GPL(is_swiotlb_active);
> >
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
