Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54442307EE1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F5E6E9F8;
	Thu, 28 Jan 2021 19:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F5B6E219
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 19:00:13 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id 6so6501679wri.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 11:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zAtH5Uh2eCj5xsMSKVB//0rXkS/VAF35BJgeGHp7Chc=;
 b=qVJQCl9WDTr7Q54vcvEpiyaIf5EX+MtV52bodpMLo4RMebXS4pWTEOGVKTsOjI1R4O
 noQCMWSwt5RPQN1p0dl3go8f52INVJXAshkTlV+3743Vr1yXRoFLpYvjNM+GwyuWtZtu
 x0toMCNFiT2z8ma3H1xUAtXCjw3YYzWd2wT+Qyz63NHCTWewzCwZTdLdpd9LCL1ynN/f
 aw6oX5PTbdgK2QitMKpBcdJBSWx2HMCDqUY+3hm7b0McV3Ar5yoY/47u61eRMjMfD643
 Z6NTm7aU1dnw9c1dSgOhWHTkiDvBavHLQyK/ZJLD2FYwsubxgcYWXiMSnstc6XveA4pu
 NC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zAtH5Uh2eCj5xsMSKVB//0rXkS/VAF35BJgeGHp7Chc=;
 b=S5pEJFN3G3yUjgDDLcfcy6GjkqZzHES4A/Ube7BL2U8g+m+Q4jfuKaVLM2wZ+Gxb+X
 x6cUgEy3GGU667dTSPMsLRXUw5/v4HMTEXwxH0kqoGKpT/RgAfFjBKQr0nZTxGl/Bqk5
 +zvxgBuDzKRcxBiHhjh/s9h4Eo603gMXnO4qjclwasYTiW2HMmuBqO9zCGnNJDc8FxcQ
 iEtB+4AbtiIcWDcku+jM1w/04gx9aThJvM15M053RINNtb9JIC32Qcbu393r73se/pgm
 KI6JggmMW9jdIpKQksSZj/0WzESLcxUY+AoczQSHHydK4YJA/MHI+GQ66FWmmpH5KG81
 JQBg==
X-Gm-Message-State: AOAM532nnNTYAb6A/a73kp+WAqXVXjHFRr18sr+cPPHi1ciimfeF9l9I
 wyzRcgUtjFqRvC8C2iwC1HQIpqz8rIdDsPxP/jBQ3Q==
X-Google-Smtp-Source: ABdhPJwSD5bzVn93QFm2pNU5i5Gr+VKO1jTjvXuRMhaz/F8HEdl87Jiogq2f2azHZ1YzRMI8ccsd1ebb852jTPWVuyg=
X-Received: by 2002:a5d:6884:: with SMTP id h4mr616422wru.106.1611860411575;
 Thu, 28 Jan 2021 11:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20210128083817.314315-1-surenb@google.com>
 <20210128091348.GA1962975@infradead.org>
 <CAJuCfpFUhJozS98WJpH0KQKBzyGXvqS1fitu-mgSyhaJ1xL8SQ@mail.gmail.com>
 <YBMAGRIwcbPF17cU@google.com>
In-Reply-To: <YBMAGRIwcbPF17cU@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 28 Jan 2021 11:00:00 -0800
Message-ID: <CAJuCfpF78RYedBoAgkDdgMdfSmNwC2AQk-zZxAqkhCdtBB9gtQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] dma-buf: heaps: Map system heap pages as managed by
 linux vm
To: Minchan Kim <minchan@kernel.org>
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:35 +0000
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Sandeep Patil <sspatil@google.com>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>, christian.koenig@amd.com,
 kernel-team <kernel-team@android.com>, James Jones <jajones@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Christoph Hellwig <hch@infradead.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>, labbott@redhat.com,
 Robin Murphy <robin.murphy@arm.com>, linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 28, 2021 at 10:19 AM Minchan Kim <minchan@kernel.org> wrote:
>
> On Thu, Jan 28, 2021 at 09:52:59AM -0800, Suren Baghdasaryan wrote:
> > On Thu, Jan 28, 2021 at 1:13 AM Christoph Hellwig <hch@infradead.org> wrote:
> > >
> > > On Thu, Jan 28, 2021 at 12:38:17AM -0800, Suren Baghdasaryan wrote:
> > > > Currently system heap maps its buffers with VM_PFNMAP flag using
> > > > remap_pfn_range. This results in such buffers not being accounted
> > > > for in PSS calculations because vm treats this memory as having no
> > > > page structs. Without page structs there are no counters representing
> > > > how many processes are mapping a page and therefore PSS calculation
> > > > is impossible.
> > > > Historically, ION driver used to map its buffers as VM_PFNMAP areas
> > > > due to memory carveouts that did not have page structs [1]. That
> > > > is not the case anymore and it seems there was desire to move away
> > > > from remap_pfn_range [2].
> > > > Dmabuf system heap design inherits this ION behavior and maps its
> > > > pages using remap_pfn_range even though allocated pages are backed
> > > > by page structs.
> > > > Clear VM_IO and VM_PFNMAP flags when mapping memory allocated by the
> > > > system heap and replace remap_pfn_range with vm_insert_page, following
> > > > Laura's suggestion in [1]. This would allow correct PSS calculation
> > > > for dmabufs.
> > > >
> > > > [1] https://driverdev-devel.linuxdriverproject.narkive.com/v0fJGpaD/using-ion-memory-for-direct-io
> > > > [2] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-October/127519.html
> > > > (sorry, could not find lore links for these discussions)
> > > >
> > > > Suggested-by: Laura Abbott <labbott@kernel.org>
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > ---
> > > >  drivers/dma-buf/heaps/system_heap.c | 6 ++++--
> > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> > > > index 17e0e9a68baf..0e92e42b2251 100644
> > > > --- a/drivers/dma-buf/heaps/system_heap.c
> > > > +++ b/drivers/dma-buf/heaps/system_heap.c
> > > > @@ -200,11 +200,13 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> > > >       struct sg_page_iter piter;
> > > >       int ret;
> > > >
> > > > +     /* All pages are backed by a "struct page" */
> > > > +     vma->vm_flags &= ~VM_PFNMAP;
> > >
> > > Why do we clear this flag?  It shouldn't even be set here as far as I
> > > can tell.
> >
> > Thanks for the question, Christoph.
> > I tracked down that flag being set by drm_gem_mmap_obj() which DRM
> > drivers use to "Set up the VMA to prepare mapping of the GEM object"
> > (according to drm_gem_mmap_obj comments). I also see a pattern in
> > several DMR drivers to call drm_gem_mmap_obj()/drm_gem_mmap(), then
> > clear VM_PFNMAP and then map the VMA (for example here:
> > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/rockchip/rockchip_drm_gem.c#L246).
> > I thought that dmabuf allocator (in this case the system heap) would
> > be the right place to set these flags because it controls how memory
> > is allocated before mapping. However it's quite possible that I'm
>
> However, you're not setting but removing a flag under the caller.
> It's different with appending more flags(e.g., removing condition
> vs adding more conditions). If we should remove the flag, caller
> didn't need to set it from the beginning. Hiding it under this API
> continue to make wrong usecase in future.

Which takes us back to the question of why VM_PFNMAP is being set by
the caller in the first place.

>
> > missing the real reason for VM_PFNMAP being set in drm_gem_mmap_obj()
> > before dma_buf_mmap() is called. I could not find the answer to that,
> > so I hope someone here can clarify that.
>
> Guess DRM had used carved out pure PFN memory long time ago and
> changed to use dmabuf since somepoint.

It would be really good to know the reason for sure to address the
issue properly.

> Whatever there is a history, rather than removing the flag
> under them, let's add WARN_ON(vma->vm_flags & VM_PFNMAP) so
> we could clean up catching them and start discussion.

The issue with not clearing the flag here is that vm_insert_page() has
a BUG_ON(vma->vm_flags & VM_PFNMAP). If we do not clear this flag I
suspect we will get many angry developers :)
If your above guess is correct and we can mandate dmabuf heap users
not to use VM_PFNMAP then I think the following code might be the best
way forward:

+       bool pfn_requested = !!(vma->vm_flags & VM_PFNMAP);
+.      WARN_ON_ONCE(pfn_requested);

        for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
                struct page *page = sg_page_iter_page(&piter);

-               ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
-                                     vma->vm_page_prot);
+               ret = pfn_requested ?
+.                      remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
+                                     vma->vm_page_prot) :
+                       vm_insert_page(vma, addr, page);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
