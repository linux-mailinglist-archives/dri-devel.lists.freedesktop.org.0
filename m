Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC56C164EBB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 20:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9046EC86;
	Wed, 19 Feb 2020 19:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31FE6EC86
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 19:18:22 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id t17so21489981ilm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 11:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GJl0CckjkVM5Ej8zE2nXpZ3nX05lCdBimnp/iAWaQl4=;
 b=cwOBuz4ROINxU6xKvl23iHrFOzdM7yE++ABRlzzM/Vj2MupamkxZprcj9R0gzFTZhu
 XK7J+BjI+2TGpT7+fgRdxWbGhxtcC9KmAKR/UefMpTdDkXHnv7qn7LN+kL73+wjq01ZY
 hG/woWGgny807R59TLGntfMs25a/9p732gD7w0fHtQJ5lOEsJORVMeC+1KjplZNorOYU
 HEsh3++n4XPz9IewQsy650UiNeS6xldwUSaF/9/Ci+sWEI8VpPw3/dz85FH4y1GN31uU
 I1r1qeMP6OdSoKaDUq6pbRYR3e706Kf5HqAvnaWCUi3qeubqzjhBJEKVeMnVxv4z2EGk
 RElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GJl0CckjkVM5Ej8zE2nXpZ3nX05lCdBimnp/iAWaQl4=;
 b=ZHkSJFOCzZUDiPGLZyDoUaaTQXUNpqyL4YM8ZNwwJrKNhYX493HsdxgyNxEIOyrNs9
 iiANnHloLNOPRmaw7T2XwYjSMXopmUTNQhygjQfwYxhcJ6SwBTvQejMwwRpvHrXOQriv
 a9xmdNzchKZNG5htJBwYN0KYPMTE40M8K79v/31c854smgIaEslpCfCZlb0sjjjWn7Xg
 UQT1hIB6nHRU5KYXwMNM9wiwOi8qA6/oardSq8PPhJQy0xv0ECUufyNcpm/u6NIu+frg
 GjXI3ooNXkCCLQvKNJyRqrCBVQrLS/R9MR3OvAWrY+dYSWTdksIcUhX3IYV17rBq7GSA
 LOag==
X-Gm-Message-State: APjAAAXIOjZgrMybtv2ABoincOVOxv6YF5x0OBCZX2ptVeeXO94hLR4K
 L8XWXSjxrxmVclKhFHPB1Fw/Jr8FQvRHN7S8biY=
X-Google-Smtp-Source: APXvYqz+Q2jI3ODZaWrHgysp+IersghNISxtRmuHW+Zd4VyGxbH1iUYoGdQbclinQPe2XNstLdxlA7jsGNSfvOgbSoM=
X-Received: by 2002:a92:9a56:: with SMTP id t83mr25800871ili.200.1582139902063; 
 Wed, 19 Feb 2020 11:18:22 -0800 (PST)
MIME-Version: 1.0
References: <20200213213036.207625-1-olvaffe@gmail.com>
 <8fdb85ea-6441-9519-ae35-eaf91ffe8741@redhat.com>
 <CAPaKu7T8VYXTMc1_GOzJnwBaZSG214qNoqRr8c7Z4Lb3B7dtTg@mail.gmail.com>
 <b82cd76c-0690-c13b-cf2c-75d7911c5c61@redhat.com>
 <CAPaKu7TDtFwF5czdpke1v7NWKf61kw_jVp-E1qQPqs-qbZYnMw@mail.gmail.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D78D724@SHSMSX104.ccr.corp.intel.com>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D78D724@SHSMSX104.ccr.corp.intel.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 19 Feb 2020 11:18:10 -0800
Message-ID: <CAPaKu7Qa6yzRxB10ufNxu+F5S3_GkwofKCm66aB9H4rdWj8fFQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] KVM: x86: honor guest memory type
To: "Tian, Kevin" <kevin.tian@intel.com>
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
Cc: "wanpengli@tencent.com" <wanpengli@tencent.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "joro@8bytes.org" <joro@8bytes.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, "Christopherson,
 Sean J" <sean.j.christopherson@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "jmattson@google.com" <jmattson@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 2:00 AM Tian, Kevin <kevin.tian@intel.com> wrote:
>
> > From: Chia-I Wu
> > Sent: Saturday, February 15, 2020 5:15 AM
> >
> > On Fri, Feb 14, 2020 at 2:26 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> > >
> > > On 13/02/20 23:18, Chia-I Wu wrote:
> > > >
> > > > The bug you mentioned was probably this one
> > > >
> > > >   https://bugzilla.kernel.org/show_bug.cgi?id=104091
> > >
> > > Yes, indeed.
> > >
> > > > From what I can tell, the commit allowed the guests to create cached
> > > > mappings to MMIO regions and caused MCEs.  That is different than what
> > > > I need, which is to allow guests to create uncached mappings to system
> > > > ram (i.e., !kvm_is_mmio_pfn) when the host userspace also has
> > uncached
> > > > mappings.  But it is true that this still allows the userspace & guest
> > > > kernel to create conflicting memory types.
> > >
> > > Right, the question is whether the MCEs were tied to MMIO regions
> > > specifically and if so why.
> > >
> > > An interesting remark is in the footnote of table 11-7 in the SDM.
> > > There, for the MTRR (EPT for us) memory type UC you can read:
> > >
> > >   The UC attribute comes from the MTRRs and the processors are not
> > >   required to snoop their caches since the data could never have
> > >   been cached. This attribute is preferred for performance reasons.
> > >
> > > There are two possibilities:
> > >
> > > 1) the footnote doesn't apply to UC mode coming from EPT page tables.
> > > That would make your change safe.
> > >
> > > 2) the footnote also applies when the UC attribute comes from the EPT
> > > page tables rather than the MTRRs.  In that case, the host should use
> > > UC as the EPT page attribute if and only if it's consistent with the host
> > > MTRRs; it would be more or less impossible to honor UC in the guest
> > MTRRs.
> > > In that case, something like the patch below would be needed.
> > >
> > > It is not clear from the manual why the footnote would not apply to WC;
> > that
> > > is, the manual doesn't say explicitly that the processor does not do
> > snooping
> > > for accesses to WC memory.  But I guess that must be the case, which is
> > why I
> > > used MTRR_TYPE_WRCOMB in the patch below.
> > >
> > > Either way, we would have an explanation of why creating cached mapping
> > to
> > > MMIO regions would, and why in practice we're not seeing MCEs for guest
> > RAM
> > > (the guest would have set WB for that memory in its MTRRs, not UC).
> > >
> > > One thing you didn't say: how would userspace use KVM_MEM_DMA?  On
> > which
> > > regions would it be set?
> > It will be set for shmems that are mapped WC.
> >
> > GPU/DRM drivers allocate shmems as DMA-able gpu buffers and allow the
> > userspace to map them cached or WC (I915_MMAP_WC or
> > AMDGPU_GEM_CREATE_CPU_GTT_USWC for example).  When a shmem is
> > mapped
> > WC and is made available to the guest, we would like the ability to
> > map the region WC in the guest.
>
> Curious... How is such slot exposed to the guest? A reserved memory
> region? Is it static or might be dynamically added?
The plan is for virtio-gpu device to reserve a huge memory region in
the guest.  Memslots may be added dynamically or statically to back
the region.

Dynamic: the host adds a 16MB GPU allocation as a memslot at a time.
The guest kernel suballocates from the 16MB pool.

Static: the host creates a huge PROT_NONE memfd and adds it as a
memslot.  GPU allocations are mremap()ed into the memfd region to
provide the real mapping.

These options are considered because the number of memslots are
limited: 32 on ARM and 509 on x86.  If the number of memslots could be
made larger (4096 or more), we would also consider adding each
individual GPU allocation as a memslot.

These are actually questions we need feedback.  Besides, GPU
allocations can be assumed to be kernel dma-bufs in this context.  I
wonder if it makes sense to have a variation of
KVM_SET_USER_MEMORY_REGION that takes dma-bufs.


>
> Thanks
> Kevin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
