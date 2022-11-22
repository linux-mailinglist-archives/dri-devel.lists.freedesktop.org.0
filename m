Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E97E063448D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 20:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0E810E456;
	Tue, 22 Nov 2022 19:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DCE10E456
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 19:29:17 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id l11so22021823edb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 11:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NVDnmC2dKJqAUSDipNMGo0RTknLwbcl5eyAafViq/zw=;
 b=F6JQcHUsspYdGaSt4ieZNwOMZpEsONnlt9o3YWjXlEPIa0eIcgJ24H9S942F8Q4aMc
 g+39K4DM+a7d2RygbPWquSET+BAUOl/CuMuwn+gW+NMmdBYH2TajHT6E0wgDLsvyRn8Q
 Oyjdw7OWDhgLbC7P9JZW0uMGCjhOePfyWsSdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NVDnmC2dKJqAUSDipNMGo0RTknLwbcl5eyAafViq/zw=;
 b=JAii/Irr/nr87ZhK2WlO8VSTiuwHiJyO92LasrgcLXZum0eHmsWgXAZM5QhBDOVxVK
 +GBsNOkL+cOENz+JAktwUo89wxo46bFvkyP5aGPJLawMrBlfZaSvlMH85un1eNO9f7+L
 RAinFM0MgyHF1MAXbzBFLP4ajp42eFn2SHPXHnBnVtkqaVCEooEYgioWXmJlry47+sR/
 jtG6Hyk9vwR7TEZFLe9QSF4n+yeT1GBEuoODAD8roqlcO0R0a/l+VBq7FWTEWe7itG3E
 In8e7z+ZJuqPoLoXUs2KOsAcH/x579sT9ZDKUeL1fQh0f0SC4w4/zHOE2N5+2gOVw9mZ
 em8A==
X-Gm-Message-State: ANoB5pm8D6AcvQclyTtP71LUhwytB4jVz/pfchhYA/kvWHCVI+gPsuak
 BN8h3NsgkdfORP7phK97BVaUa1FnNZ9MUrF/INUuPA==
X-Google-Smtp-Source: AA0mqf7IcusChboGRGGt1s/cB7q39wPkujHV5XTXD9uN+GJhpblKvI9MCtZZtq2mwcwYehW0Unnkdw9V4tf6ONn4w74=
X-Received: by 2002:a05:6402:c0b:b0:463:a83c:e0af with SMTP id
 co11-20020a0564020c0b00b00463a83ce0afmr21647244edb.158.1669145356462; Tue, 22
 Nov 2022 11:29:16 -0800 (PST)
MIME-Version: 1.0
References: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
 <Y30PDdsvHIJo5YHR@ziepe.ca>
 <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
 <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
In-Reply-To: <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 22 Nov 2022 20:29:05 +0100
Message-ID: <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Require VM_PFNMAP vma for mmap
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Nov 2022 at 19:50, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Nov 22, 2022 at 07:08:25PM +0100, Daniel Vetter wrote:
> > On Tue, 22 Nov 2022 at 19:04, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Tue, Nov 22, 2022 at 06:08:00PM +0100, Daniel Vetter wrote:
> > > > tldr; DMA buffers aren't normal memory, expecting that you can use
> > > > them like that (like calling get_user_pages works, or that they're
> > > > accounting like any other normal memory) cannot be guaranteed.
> > > >
> > > > Since some userspace only runs on integrated devices, where all
> > > > buffers are actually all resident system memory, there's a huge
> > > > temptation to assume that a struct page is always present and useable
> > > > like for any more pagecache backed mmap. This has the potential to
> > > > result in a uapi nightmare.
> > > >
> > > > To stop this gap require that DMA buffer mmaps are VM_PFNMAP, which
> > > > blocks get_user_pages and all the other struct page based
> > > > infrastructure for everyone. In spirit this is the uapi counterpart to
> > > > the kernel-internal CONFIG_DMABUF_DEBUG.
> > > >
> > > > Motivated by a recent patch which wanted to swich the system dma-buf
> > > > heap to vm_insert_page instead of vm_insert_pfn.
> > > >
> > > > v2:
> > > >
> > > > Jason brought up that we also want to guarantee that all ptes have the
> > > > pte_special flag set, to catch fast get_user_pages (on architectures
> > > > that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL does) would
> > > > still allow vm_insert_page, but limiting to VM_PFNMAP will catch that.
> > > >
> > > > From auditing the various functions to insert pfn pte entires
> > > > (vm_insert_pfn_prot, remap_pfn_range and all it's callers like
> > > > dma_mmap_wc) it looks like VM_PFNMAP is already required anyway, so
> > > > this should be the correct flag to check for.
> > >
> > > I didn't look at how this actually gets used, but it is a bit of a
> > > pain to insert a lifetime controlled object like a struct page as a
> > > special PTE/VM_PFNMAP
> > >
> > > How is the lifetime model implemented here? How do you know when
> > > userspace has finally unmapped the page?
> >
> > The vma has a filp which is the refcounted dma_buf. With dma_buf you
> > never get an individual page it's always the entire object. And it's
> > up to the allocator how exactly it wants to use or not use the page's
> > refcount. So if gup goes in and elevates the refcount, you can break
> > stuff, which is why I'm doing this.
>
> But how does move work?

You nuke all the ptes. Drivers that move have slightly more than a
bare struct file, they also have a struct address_space so that
invalidate_mapping_range() works. Refaulting and any coherency issues
when a refault races against a dma-buf migration is up to the
driver/exporter to handle correctly. None rely on struct page like mm/
moving stuff around for compaction/ksm/numa-balancing/whateverr.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
