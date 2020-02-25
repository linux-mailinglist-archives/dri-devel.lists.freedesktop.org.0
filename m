Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6327F16B72E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 02:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12EE6E9C9;
	Tue, 25 Feb 2020 01:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EA76E9C9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 01:29:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 17:29:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,482,1574150400"; d="scan'208";a="241177888"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga006.jf.intel.com with ESMTP; 24 Feb 2020 17:29:12 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 24 Feb 2020 17:29:12 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 24 Feb 2020 17:29:11 -0800
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 24 Feb 2020 17:29:11 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.141]) with mapi id 14.03.0439.000;
 Tue, 25 Feb 2020 09:29:09 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Chia-I Wu <olvaffe@gmail.com>, "Christopherson, Sean J"
 <sean.j.christopherson@intel.com>
Subject: RE: [RFC PATCH 0/3] KVM: x86: honor guest memory type
Thread-Topic: [RFC PATCH 0/3] KVM: x86: honor guest memory type
Thread-Index: AQHV4rTrI5AbOd4/PkCv4vZnvR6EuagZISQAgAAKbYCAAMs9AIAAnj+AgAAgCACAAAK0AIAAAeyAgAXrxoCAAaZGgIAAIIsAgADkwxCAABT4UIAAx02AgACimmD//8gUAIAAAZSAgACPE8CAACuogIAAJ5gAgAWxe0A=
Date: Tue, 25 Feb 2020 01:29:09 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D79A7BE@SHSMSX104.ccr.corp.intel.com>
References: <d3a6fac6-3831-3b8e-09b6-bfff4592f235@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D78D6F4@SHSMSX104.ccr.corp.intel.com>
 <CAPaKu7RyTbuTPf0Tp=0DAD80G-RySLrON8OQsHJzhAYDh7zHuA@mail.gmail.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D78EE65@SHSMSX104.ccr.corp.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D78EF58@SHSMSX104.ccr.corp.intel.com>
 <CAPaKu7RFY3nar9hmAdx6RYdZFPK3Cdg1O3cS+OvsEOT=yupyrQ@mail.gmail.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D792415@SHSMSX104.ccr.corp.intel.com>
 <CAPaKu7RHu5rz1Dvkvp4SDrZ0fAYq37xwRqUsdAiOmRTOz2sFTw@mail.gmail.com>
 <CAPaKu7RaF3+amPwdVBLj6q1na7JWUYuuWDN5XPwNYFB8Hpqi+w@mail.gmail.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D79359E@SHSMSX104.ccr.corp.intel.com>
 <20200221155939.GG12665@linux.intel.com>
 <CAPaKu7Qjnur=ntTXmGn7L38UaCoNjf6avWBk7xTvO6eDkZbWFQ@mail.gmail.com>
In-Reply-To: <CAPaKu7Qjnur=ntTXmGn7L38UaCoNjf6avWBk7xTvO6eDkZbWFQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzU3OGNhOTQtMjAzNC00YzJmLWJjMDAtM2YxZDE1ZjAwM2M1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUkZ0TjZUamxMcU5ENHluMlp6TUM4ZDZmK1hpQ01yN2FiVU1hNVp6M1ROZlpvaVFxZ21JUFBWK0x4UkdwbTRLOCJ9
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm list <kvm@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Chia-I Wu <olvaffe@gmail.com>
> Sent: Saturday, February 22, 2020 2:21 AM
> 
> On Fri, Feb 21, 2020 at 7:59 AM Sean Christopherson
> <sean.j.christopherson@intel.com> wrote:
> >
> > On Thu, Feb 20, 2020 at 09:39:05PM -0800, Tian, Kevin wrote:
> > > > From: Chia-I Wu <olvaffe@gmail.com>
> > > > Sent: Friday, February 21, 2020 12:51 PM
> > > > If you think it is the best for KVM to inspect hva to determine the
> memory
> > > > type with page granularity, that is reasonable and should work for us
> too.
> > > > The userspace can do something (e.g., add a GPU driver dependency to
> the
> > > > hypervisor such that the dma-buf is imported as a GPU memory and
> mapped
> > > > using
> > > > vkMapMemory) or I can work with dma-buf maintainers to see if dma-
> buf's
> > > > semantics can be changed.
> > >
> > > I think you need consider the live migration requirement as Paolo pointed
> out.
> > > The migration thread needs to read/write the region, then it must use the
> > > same type as GPU process and guest to read/write the region. In such
> case,
> > > the hva mapped by Qemu should have the desired type as the guest.
> However,
> > > adding GPU driver dependency to Qemu might trigger some concern. I'm
> not
> > > sure whether there is generic mechanism though, to share dmabuf fd
> between GPU
> > > process and Qemu while allowing Qemu to follow the desired type w/o
> using
> > > vkMapMemory...
> >
> > Alternatively, KVM could make KVM_MEM_DMA and
> KVM_MEM_LOG_DIRTY_PAGES
> > mutually exclusive, i.e. force a transition to WB memtype for the guest
> > (with appropriate zapping) when migration is activated.  I think that
> > would work?
> Hm, virtio-gpu does not allow live migration when the 3D function
> (virgl=on) is enabled.  This is the relevant code in qemu:
> 
>     if (virtio_gpu_virgl_enabled(g->conf)) {
>         error_setg(&g->migration_blocker, "virgl is not yet migratable");
> 
> Although we (virtio-gpu and virglrenderer projects) plan to make host
> GPU buffers available to the guest via memslots, those buffers should
> be considered a part of the "GPU state".  The migration thread should
> work with virglrenderer and let virglrenderer save/restore them, if
> live migration is to be supported.

Thanks for your explanation. Your RFC makes more sense now.

One remaining open is, although for live migration we can explicitly
state that migration thread itself should not access the dma-buf
region, how can we warn other usages which may potentially simply
walk every memslot and access the content through the mmap-ed
virtual address? Possibly we may need a flag to indicate a memslot
which is mmaped only for KVM to retrieve its page table mapping
but not for direct access in Qemu. 

> 
> QEMU depends on GPU drivers already when configured with
> --enable-virglrenderer.  There is vhost-user-gpu that can move the
> dependency to a GPU process.  But there are still going to be cases
> (e.g., nVidia's proprietary driver does not support dma-buf) where
> QEMU cannot avoid GPU driver dependency.
> 
> 
> 
> 
> > > Note this is orthogonal to whether introducing a new uapi or implicitly
> checking
> > > hva to favor guest memory type. It's purely about Qemu itself. Ideally
> anyone
> > > with the desire to access a dma-buf object should follow the expected
> semantics.
> > > It's interesting that dma-buf sub-system doesn't provide a centralized
> > > synchronization about memory type between multiple mmap paths.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
