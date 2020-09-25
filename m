Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3572278A6B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 16:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5BD6ECDD;
	Fri, 25 Sep 2020 14:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAB76ECDD;
 Fri, 25 Sep 2020 14:09:27 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id h15so976710uab.3;
 Fri, 25 Sep 2020 07:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W4ybNDBj3JkG7xwtC+pQm/GVM9Ki73UbHYGcb1DNgoE=;
 b=VAE/JCw4Kc2YKn1yJ8L/Q9+LADI9BPVrPzMbIS0mOQDh1e+IitPGEnQLZfakaeotSX
 fJpnesPgh6fudFH4hBFOTUzOvja6IHah1EG+sAlo5mDeRe30T7WE5Z+EmmrqyLBVjPT2
 Y6MypsxJU5ecTFL5KTTnudzV3iHFKzBhkicIF7nAwXtRPFhwdOi9g9/Y/qXRPNUiOlZ/
 S833Agy78MEYaybNf9Tk+M+dZyKRMHoBkxs25nGIJGGXWhSky07MsU9xI+7dnENL4I7l
 bH2CDxH5hj1vhP5g8v/h/6Mm80YH+iZTF4wuYNk0h7j6DAwbRzp57D1NpHpN8KHRNu/G
 TlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W4ybNDBj3JkG7xwtC+pQm/GVM9Ki73UbHYGcb1DNgoE=;
 b=iT+rGlEO8i49daiE7JlxXd5aVJhQ1exTWoxm46UeUdAZebvdC/es70NBQQiBD+kqih
 63RNhn887ffcA6O3+BXbcNoVDj8CECE+iUAxVsq4dlmzDHjHbcA1mTPT9T/9fvffjRAD
 mw5A/Nu53iZVNeBnzluU/+HYUvc1Ub1exWLOVpI588VkLPiyakUE9QdpPAVot5TjNc97
 hevOMa+FcPwMLgDd2pIzAGiaNs/5JZDdJIo0qBuF4bARnUgGmVMU9i9gNA+4AmL1Xi5/
 F0+wITliEA207dds+og9lg1W7S/Xz4M8EYaNHjio06dmwK1zOQxAwbftz7jjDhAZWL7f
 9w8A==
X-Gm-Message-State: AOAM5324kCxQ0zqiAPqBIe8hOssvJMFq10SIMb8sD57iaS1Ihu6OlTSJ
 8gS7AZ2YnqNfBEgM7WQkMjr+QrB1cnna9cIUeds=
X-Google-Smtp-Source: ABdhPJy0IxUr4anWia0Qm7ztGxjztU5H4LAKNIvZHwQZc9rZ+mSfXU53xRXTbzCYoiyClMt8qe//fl65KD/2aNPSkzU=
X-Received: by 2002:ab0:6f91:: with SMTP id f17mr2536965uav.129.1601042966264; 
 Fri, 25 Sep 2020 07:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200924135853.875294-1-hch@lst.de>
 <20200924135853.875294-9-hch@lst.de>
In-Reply-To: <20200924135853.875294-9-hch@lst.de>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 25 Sep 2020 15:08:59 +0100
Message-ID: <CAM0jSHPaqpX2A5T4iybfLF+F=cBX05GW8u54cUe7AG0QKDJt2g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 08/11] drm/i915: use vmap in
 i915_gem_object_map
To: Christoph Hellwig <hch@lst.de>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Minchan Kim <minchan@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, x86@kernel.org,
 kernel list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 Matthew Wilcox <willy@infradead.org>, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Nitin Gupta <ngupta@vflare.org>,
 Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Sep 2020 at 14:59, Christoph Hellwig <hch@lst.de> wrote:
>
> i915_gem_object_map implements fairly low-level vmap functionality in
> a driver.  Split it into two helpers, one for remapping kernel memory
> which can use vmap, and one for I/O memory that uses vmap_pfn.
>
> The only practical difference is that alloc_vm_area prefeaults the
> vmalloc area PTEs, which doesn't seem to be required here for the
> kernel memory case (and could be added to vmap using a flag if actually
> required).
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/Kconfig              |   1 +
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c | 126 ++++++++++------------
>  2 files changed, 59 insertions(+), 68 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 9afa5c4a6bf006..1e1cb245fca778 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -25,6 +25,7 @@ config DRM_I915
>         select CRC32
>         select SND_HDA_I915 if SND_HDA_CORE
>         select CEC_CORE if CEC_NOTIFIER
> +       select VMAP_PFN
>         help
>           Choose this option if you have a system that has "Intel Graphics
>           Media Accelerator" or "HD Graphics" integrated graphics,
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> index 6550c0bc824ea2..b519417667eb4b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -232,34 +232,21 @@ int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj)
>         return err;
>  }
>
> -static inline pte_t iomap_pte(resource_size_t base,
> -                             dma_addr_t offset,
> -                             pgprot_t prot)
> -{
> -       return pte_mkspecial(pfn_pte((base + offset) >> PAGE_SHIFT, prot));
> -}
> -
>  /* The 'mapping' part of i915_gem_object_pin_map() below */
> -static void *i915_gem_object_map(struct drm_i915_gem_object *obj,
> -                                enum i915_map_type type)
> +static void *i915_gem_object_map_page(struct drm_i915_gem_object *obj,
> +               enum i915_map_type type)
>  {
> -       unsigned long n_pte = obj->base.size >> PAGE_SHIFT;
> -       struct sg_table *sgt = obj->mm.pages;
> -       pte_t *stack[32], **mem;
> -       struct vm_struct *area;
> +       unsigned long n_pages = obj->base.size >> PAGE_SHIFT, i;
> +       struct page *stack[32], **pages = stack, *page;
> +       struct sgt_iter iter;
>         pgprot_t pgprot;
> +       void *vaddr;
>
> -       if (!i915_gem_object_has_struct_page(obj) && type != I915_MAP_WC)
> -               return NULL;
> -
> -       if (GEM_WARN_ON(type == I915_MAP_WC &&
> -                       !static_cpu_has(X86_FEATURE_PAT)))
> -               return NULL;
> -
> -       /* A single page can always be kmapped */
> -       if (n_pte == 1 && type == I915_MAP_WB) {
> -               struct page *page = sg_page(sgt->sgl);
> -
> +       switch (type) {
> +       default:
> +               MISSING_CASE(type);
> +               fallthrough;    /* to use PAGE_KERNEL anyway */
> +       case I915_MAP_WB:
>                 /*
>                  * On 32b, highmem using a finite set of indirect PTE (i.e.
>                  * vmap) to provide virtual mappings of the high pages.
> @@ -277,30 +264,8 @@ static void *i915_gem_object_map(struct drm_i915_gem_object *obj,
>                  * So if the page is beyond the 32b boundary, make an explicit
>                  * vmap.
>                  */
> -               if (!PageHighMem(page))
> -                       return page_address(page);
> -       }
> -
> -       mem = stack;
> -       if (n_pte > ARRAY_SIZE(stack)) {
> -               /* Too big for stack -- allocate temporary array instead */
> -               mem = kvmalloc_array(n_pte, sizeof(*mem), GFP_KERNEL);
> -               if (!mem)
> -                       return NULL;
> -       }
> -
> -       area = alloc_vm_area(obj->base.size, mem);
> -       if (!area) {
> -               if (mem != stack)
> -                       kvfree(mem);
> -               return NULL;
> -       }
> -
> -       switch (type) {
> -       default:
> -               MISSING_CASE(type);
> -               fallthrough;    /* to use PAGE_KERNEL anyway */
> -       case I915_MAP_WB:
> +               if (n_pages == 1 && !PageHighMem(sg_page(obj->mm.pages->sgl)))
> +                       return page_address(sg_page(obj->mm.pages->sgl));
>                 pgprot = PAGE_KERNEL;
>                 break;
>         case I915_MAP_WC:
> @@ -308,30 +273,49 @@ static void *i915_gem_object_map(struct drm_i915_gem_object *obj,
>                 break;
>         }
>
> -       if (i915_gem_object_has_struct_page(obj)) {
> -               struct sgt_iter iter;
> -               struct page *page;
> -               pte_t **ptes = mem;
> +       if (n_pages > ARRAY_SIZE(stack)) {
> +               /* Too big for stack -- allocate temporary array instead */
> +               pages = kvmalloc_array(n_pages, sizeof(*pages), GFP_KERNEL);
> +               if (!pages)
> +                       return NULL;
> +       }
>
> -               for_each_sgt_page(page, iter, sgt)
> -                       **ptes++ = mk_pte(page, pgprot);
> -       } else {
> -               resource_size_t iomap;
> -               struct sgt_iter iter;
> -               pte_t **ptes = mem;
> -               dma_addr_t addr;
> +       i = 0;
> +       for_each_sgt_page(page, iter, obj->mm.pages)
> +               pages[i++] = page;
> +       vaddr = vmap(pages, n_pages, 0, pgprot);
> +       if (pages != stack)
> +               kvfree(pages);
> +       return vaddr;
> +}
>
> -               iomap = obj->mm.region->iomap.base;
> -               iomap -= obj->mm.region->region.start;
> +static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
> +               enum i915_map_type type)
> +{
> +       resource_size_t iomap = obj->mm.region->iomap.base -
> +               obj->mm.region->region.start;
> +       unsigned long n_pfn = obj->base.size >> PAGE_SHIFT;
> +       unsigned long stack[32], *pfns = stack, i;
> +       struct sgt_iter iter;
> +       dma_addr_t addr;
> +       void *vaddr;
> +
> +       if (type != I915_MAP_WC)
> +               return NULL;
>
> -               for_each_sgt_daddr(addr, iter, sgt)
> -                       **ptes++ = iomap_pte(iomap, addr, pgprot);
> +       if (n_pfn > ARRAY_SIZE(stack)) {
> +               /* Too big for stack -- allocate temporary array instead */
> +               pfns = kvmalloc_array(n_pfn, sizeof(*pfns), GFP_KERNEL);
> +               if (!pfns)
> +                       return NULL;
>         }
>
> -       if (mem != stack)
> -               kvfree(mem);
> -
> -       return area->addr;
> +       for_each_sgt_daddr(addr, iter, obj->mm.pages)
> +               pfns[i++] = (iomap + addr) >> PAGE_SHIFT;

Missing the i = 0 fix from Dan?

> +       vaddr = vmap_pfn(pfns, n_pfn, pgprot_writecombine(PAGE_KERNEL_IO));
> +       if (pfns != stack)
> +               kvfree(pfns);
> +       return vaddr;
>  }
>
>  /* get, pin, and map the pages of the object into kernel space */
> @@ -383,7 +367,13 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
>         }
>
>         if (!ptr) {
> -               ptr = i915_gem_object_map(obj, type);
> +               if (GEM_WARN_ON(type == I915_MAP_WC &&
> +                               !static_cpu_has(X86_FEATURE_PAT)))
> +                       ptr = NULL;
> +               else if (i915_gem_object_has_struct_page(obj))
> +                       ptr = i915_gem_object_map_page(obj, type);
> +               else
> +                       ptr = i915_gem_object_map_pfn(obj, type);
>                 if (!ptr) {
>                         err = -ENOMEM;
>                         goto err_unpin;
> --
> 2.28.0
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
