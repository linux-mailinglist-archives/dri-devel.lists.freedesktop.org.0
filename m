Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3211C166F4B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 06:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC8B6E1F3;
	Fri, 21 Feb 2020 05:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E776E1F3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 05:39:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2020 21:39:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,467,1574150400"; d="scan'208";a="225111442"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga007.jf.intel.com with ESMTP; 20 Feb 2020 21:39:21 -0800
Received: from fmsmsx158.amr.corp.intel.com (10.18.116.75) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 20 Feb 2020 21:39:20 -0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 fmsmsx158.amr.corp.intel.com (10.18.116.75) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 20 Feb 2020 21:39:21 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.201]) with mapi id 14.03.0439.000;
 Fri, 21 Feb 2020 13:39:05 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: RE: [RFC PATCH 0/3] KVM: x86: honor guest memory type
Thread-Topic: [RFC PATCH 0/3] KVM: x86: honor guest memory type
Thread-Index: AQHV4rTrI5AbOd4/PkCv4vZnvR6EuagZISQAgAAKbYCAAMs9AIAAnj+AgAAgCACAAAK0AIAAAeyAgAXrxoCAAaZGgIAAIIsAgADkwxCAABT4UIAAx02AgACimmD//8gUAIAAAZSAgACPE8A=
Date: Fri, 21 Feb 2020 05:39:05 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D79359E@SHSMSX104.ccr.corp.intel.com>
References: <20200213213036.207625-1-olvaffe@gmail.com>
 <8fdb85ea-6441-9519-ae35-eaf91ffe8741@redhat.com>
 <CAPaKu7T8VYXTMc1_GOzJnwBaZSG214qNoqRr8c7Z4Lb3B7dtTg@mail.gmail.com>
 <b82cd76c-0690-c13b-cf2c-75d7911c5c61@redhat.com>
 <20200214195229.GF20690@linux.intel.com>
 <CAPaKu7Q4gehyhEgG_Nw=tiZiTh+7A8-uuXq1w4he6knp6NWErQ@mail.gmail.com>
 <CALMp9eRwTxdqxAcobZ7sYbD=F8Kga=jR3kaz-OEYdA9fV0AoKQ@mail.gmail.com>
 <20200214220341.GJ20690@linux.intel.com>
 <d3a6fac6-3831-3b8e-09b6-bfff4592f235@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D78D6F4@SHSMSX104.ccr.corp.intel.com>
 <CAPaKu7RyTbuTPf0Tp=0DAD80G-RySLrON8OQsHJzhAYDh7zHuA@mail.gmail.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D78EE65@SHSMSX104.ccr.corp.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D78EF58@SHSMSX104.ccr.corp.intel.com>
 <CAPaKu7RFY3nar9hmAdx6RYdZFPK3Cdg1O3cS+OvsEOT=yupyrQ@mail.gmail.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D792415@SHSMSX104.ccr.corp.intel.com>
 <CAPaKu7RHu5rz1Dvkvp4SDrZ0fAYq37xwRqUsdAiOmRTOz2sFTw@mail.gmail.com>
 <CAPaKu7RaF3+amPwdVBLj6q1na7JWUYuuWDN5XPwNYFB8Hpqi+w@mail.gmail.com>
In-Reply-To: <CAPaKu7RaF3+amPwdVBLj6q1na7JWUYuuWDN5XPwNYFB8Hpqi+w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzNjMGRiMGQtYjJiMS00ZTJiLTkxMjEtZjM3ZjJiNDRiMDlhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibEU2TDFmak0xZTdOZlhqRVwvZWpQd1NMRnptWkhUU0hDSjB4aVwveWtVbklObVJjNHZPOUlvbm1Ma2llYWNCbFFwIn0=
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
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
Cc: Wanpeng Li <wanpengli@tencent.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, kvm
 list <kvm@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>, "Christopherson,
 Sean J" <sean.j.christopherson@intel.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Chia-I Wu <olvaffe@gmail.com>
> Sent: Friday, February 21, 2020 12:51 PM
> 
> (resend because gmail did not format to plain text...)
> 
> On Thu, Feb 20, 2020 at 8:45 PM Chia-I Wu <olvaffe@gmail.com> wrote:
> >
> >
> >
> > On Thu, Feb 20, 2020 at 4:23 PM Tian, Kevin <kevin.tian@intel.com> wrote:
> >>
> >> > From: Chia-I Wu <olvaffe@gmail.com>
> >> > Sent: Friday, February 21, 2020 6:24 AM
> >> >
> >> > On Wed, Feb 19, 2020 at 6:38 PM Tian, Kevin <kevin.tian@intel.com>
> wrote:
> >> > >
> >> > > > From: Tian, Kevin
> >> > > > Sent: Thursday, February 20, 2020 10:05 AM
> >> > > >
> >> > > > > From: Chia-I Wu <olvaffe@gmail.com>
> >> > > > > Sent: Thursday, February 20, 2020 3:37 AM
> >> > > > >
> >> > > > > On Wed, Feb 19, 2020 at 1:52 AM Tian, Kevin
> <kevin.tian@intel.com>
> >> > wrote:
> >> > > > > >
> >> > > > > > > From: Paolo Bonzini
> >> > > > > > > Sent: Wednesday, February 19, 2020 12:29 AM
> >> > > > > > >
> >> > > > > > > On 14/02/20 23:03, Sean Christopherson wrote:
> >> > > > > > > >> On Fri, Feb 14, 2020 at 1:47 PM Chia-I Wu
> <olvaffe@gmail.com>
> >> > > > wrote:
> >> > > > > > > >>> AFAICT, it is currently allowed on ARM (verified) and AMD
> (not
> >> > > > > > > >>> verified, but svm_get_mt_mask returns 0 which supposedly
> >> > means
> >> > > > > the
> >> > > > > > > NPT
> >> > > > > > > >>> does not restrict what the guest PAT can do).  This diff
> would do
> >> > the
> >> > > > > > > >>> trick for Intel without needing any uapi change:
> >> > > > > > > >> I would be concerned about Intel CPU errata such as SKX40
> and
> >> > > > SKX59.
> >> > > > > > > > The part KVM cares about, #MC, is already addressed by
> forcing
> >> > UC
> >> > > > for
> >> > > > > > > MMIO.
> >> > > > > > > > The data corruption issue is on the guest kernel to correctly
> use
> >> > WC
> >> > > > > > > > and/or non-temporal writes.
> >> > > > > > >
> >> > > > > > > What about coherency across live migration?  The userspace
> >> > process
> >> > > > > would
> >> > > > > > > use cached accesses, and also a WBINVD could potentially
> corrupt
> >> > guest
> >> > > > > > > memory.
> >> > > > > > >
> >> > > > > >
> >> > > > > > In such case the userspace process possibly should conservatively
> use
> >> > > > > > UC mapping, as if for MMIO regions on a passthrough device.
> >> > However
> >> > > > > > there remains a problem. the definition of KVM_MEM_DMA
> implies
> >> > > > > > favoring guest setting, which could be whatever type in concept.
> Then
> >> > > > > > assuming UC is also problematic. I'm not sure whether inventing
> >> > another
> >> > > > > > interface to query effective memory type from KVM is a good
> idea.
> >> > There
> >> > > > > > is no guarantee that the guest will use same type for every page
> in the
> >> > > > > > same slot, then such interface might be messy. Alternatively,
> maybe
> >> > > > > > we could just have an interface for KVM userspace to force
> memory
> >> > type
> >> > > > > > for a given slot, if it is mainly used in para-virtualized scenarios
> (e.g.
> >> > > > > > virtio-gpu) where the guest is enlightened to use a forced type
> (e.g.
> >> > WC)?
> >> > > > > KVM forcing the memory type for a given slot should work too.  But
> the
> >> > > > > ignore-guest-pat bit seems to be Intel-specific.  We will need to
> >> > > > > define how the second-level page attributes combine with the
> guest
> >> > > > > page attributes somehow.
> >> > > >
> >> > > > oh, I'm not aware of that difference. without an ipat-equivalent
> >> > > > capability, I'm not sure how to forcing random type here. If you look
> at
> >> > > > table 11-7 in Intel SDM, none of MTRR (EPT) memory type can lead
> to
> >> > > > consistent effective type when combining with random PAT value. So
> >> > > >  it is definitely a dead end.
> >> > > >
> >> > > > >
> >> > > > > KVM should in theory be able to tell that the userspace region is
> >> > > > > mapped with a certain memory type and can force the same
> memory
> >> > type
> >> > > > > onto the guest.  The userspace does not need to be involved.  But
> that
> >> > > > > sounds very slow?  This may be a dumb question, but would it help
> to
> >> > > > > add KVM_SET_DMA_BUF and let KVM negotiate the memory type
> with
> >> > the
> >> > > > > in-kernel GPU drivers?
> >> > > > >
> >> > > > >
> >> > > >
> >> > > > KVM_SET_DMA_BUF looks more reasonable. But I guess we don't
> need
> >> > > > KVM to be aware of such negotiation. We can continue your original
> >> > > > proposal to have KVM simply favor guest memory type (maybe still
> call
> >> > > > KVM_MEM_DMA). On the other hand, Qemu should just mmap on
> the
> >> > > > fd handle of the dmabuf passed from the virtio-gpu device backend,
> e.g.
> >> > > > to conduct migration. That way the mmap request is finally served by
> >> > > > DRM and underlying GPU drivers, with proper type enforced
> >> > automatically.
> >> > > >
> >> > >
> >> > > Thinking more possibly we don't need introduce new interface to KVM.
> >> > > As long as Qemu uses dmabuf interface to mmap the specific region,
> >> > > KVM can simply check memory type in host page table given hva of a
> >> > > memslot. If the type is UC or WC, it implies that userspace wants a
> >> > > non-coherent mapping which should be reflected in the guest side too.
> >> > > In such case, KVM can go to non-cohenrent DMA path and favor guest
> >> > > memory type automatically.
> >> > Sorry, I mixed two things together.
> >> >
> >> > Userspace access to dmabuf mmap must be guarded by
> >> > DMA_BUF_SYNC_{START,END} ioctls.  It is possible that the GPU driver
> >> > always picks a WB mapping and let the ioctls flush/invalidate CPU
> >> > caches.  We actually want the guest memory type to match
> vkMapMemory's
> >> > memory type, which can be different from dmabuf mmap's memory
> type.
> >> > It is not enough for KVM to inspect the hva's memory type.
> >>
> >> I'm not familiar with dmabuf and what is the difference between
> >> vkMapMemory and mmap. Just a simple thought that whatever
> >> memory type/synchronization enforced on the host userspace should
> >> ideally be applied to guest userspace too. e.g. in above example we
> >> possibly want the guest to use WB and issue flush/invalidate hypercalls
> >> to guard with other potential parallel operations in the host side.
> >> otherwise I cannot see how synchronization can be done when one
> >> use WB with sync primitives while the other simply use WC w/o such
> >> primitives.
> >
> I am reasonably familiar with the GPU stacks, but I am not familiar with KVM
> :)
> 
> When allocating a GPU memory, the userspace can specify whether it wants
> a
> coherent one or an incoherent one.  vkMapMemory returns a coherent or a
> incoherent mapping respectively.  Indeed we also want the guest userspace
> to
> have a coherent or a incoherent mapping respectively.
> 
> The GPU memory can be exported as a dmabuf to share with another device
> or
> process.  For security, we allocate the GPU memory in a GPU process and we
> export the dmabuf to the hypervisor.  mmap of dmabuf semantically returns
> an
> incoherent mapping.  As a result, the guest will set up a mapping that has the
> same memory type as the vkMapMemory mapping does, but the hva in
> KVM_SET_USER_MEMORY_REGION points to the dmabuf's incoherent
> mapping.
> 
> If you think it is the best for KVM to inspect hva to determine the memory
> type with page granularity, that is reasonable and should work for us too.
> The userspace can do something (e.g., add a GPU driver dependency to the
> hypervisor such that the dma-buf is imported as a GPU memory and mapped
> using
> vkMapMemory) or I can work with dma-buf maintainers to see if dma-buf's
> semantics can be changed.

I think you need consider the live migration requirement as Paolo pointed out.
The migration thread needs to read/write the region, then it must use the
same type as GPU process and guest to read/write the region. In such case, 
the hva mapped by Qemu should have the desired type as the guest. However,
adding GPU driver dependency to Qemu might trigger some concern. I'm not
sure whether there is generic mechanism though, to share dmabuf fd between GPU
process and Qemu while allowing Qemu to follow the desired type w/o using
vkMapMemory...

Note this is orthogonal to whether introducing a new uapi or implicitly checking
hva to favor guest memory type. It's purely about Qemu itself. Ideally anyone 
with the desire to access a dma-buf object should follow the expected semantics.
It's interesting that dma-buf sub-system doesn't provide a centralized 
synchronization about memory type between multiple mmap paths. 

> 
> >
> >>
> >> >
> >> > KVM_SET_DMA_BUF, if supported, is a signal to KVM that the guest
> >> > memory type should be honored (or forced if there is a new op in
> >> > dma_buf_ops that tells KVM which memory type to force).
> KVM_MEM_DMA
> >> > flag in this RFC sends the same signal.  Unless KVM_SET_DMA_BUF gives
> >> > the userspace other features such as setting unlimited number of
> >> > dmabufs to subregions of a memslot, it is not very useful.
> >>
> >> the good part of a new interface is its simplicity, but only in slot
> >> granularity. instead having KVM to inspect hva can support page
> >> granularity, but adding run-time overhead. Let's see how Paolo
> >> thinks.
> >>
> >> >
> >> > If uapi change is to be avoided, it is the easiest that guest memory
> >> > type is always honored unless it causes #MC (i.e.,is_mmio==true).
> >> >
> >>
> >> I feel this goes too far...
> >>
> >> Thanks
> >> Kevin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
