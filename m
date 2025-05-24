Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA92AC2D3C
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 05:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F95410E0DC;
	Sat, 24 May 2025 03:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XrqQljMu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940B910E03C
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 03:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748057973; x=1779593973;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7IzTik7Z1oQYNbi1ZtvITH1vtj4QWC1+x7Q28RIHobI=;
 b=XrqQljMuPCnydCrBKUKNKl/sgSQfxikD0pa/vGCzEh+3uD626/s9zZDc
 EO3AC0d2NgeD0yYnCfyevH1Y4E2XMzvb1Np7NTndSyUdz5XYT+TikLzE6
 m7xgw7H9oRGhjCa1/OxVMBhyszM1JdSOoQsP/DKlzL9f1KH8llAp5qZmY
 lqCT2qtLb32zsdz3Tp8+bEYsZRZkZ5Av3G+K1HvosWbuz0WE88UsKMSBv
 0ejLYZni7BmK6MQGgV+CjTz9DMKG3TgZCwmectd4OHkeKIuLrB38Fmal3
 TCVFX9ywp4P/r/lCXS3MqoJPVYH3LdexcxL0+zaANRalL5y3oU1wJnUPV A==;
X-CSE-ConnectionGUID: 319K9HNaRJ2w7a6NjQ25gw==
X-CSE-MsgGUID: gcWZaALVTn+AohhnTbXj8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50227670"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; d="scan'208";a="50227670"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 20:39:32 -0700
X-CSE-ConnectionGUID: zcZxj8dbTb+bAaFrzD0SGA==
X-CSE-MsgGUID: DCJiGGXWQl+UORP1bJyepw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; d="scan'208";a="141966994"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by orviesa007.jf.intel.com with ESMTP; 23 May 2025 20:39:28 -0700
Date: Sat, 24 May 2025 11:33:25 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: Zhi Wang <zhiw@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
Message-ID: <aDE+BaMo+X75QaEW@yilunxu-OptiPlex-7050>
References: <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050>
 <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <20250512140617.GA285583@nvidia.com>
 <20250513130315.0158a626.zhiw@nvidia.com>
 <aCRmoDupzK9zTqFL@yilunxu-OptiPlex-7050>
 <20250514230502.6b64da7f.zhiw@nvidia.com>
 <aCYsNSFQJZzHVOFI@yilunxu-OptiPlex-7050>
 <3909686a-be14-4b0b-8336-0674667d5159@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3909686a-be14-4b0b-8336-0674667d5159@amd.com>
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

On Tue, May 20, 2025 at 08:57:42PM +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 16/5/25 04:02, Xu Yilun wrote:
> > > IMHO, I think it might be helpful that you can picture out what are the
> > > minimum requirements (function/life cycle) to the current IOMMUFD TSM
> > > bind architecture:
> > > 
> > > 1.host tsm_bind (preparation) is in IOMMUFD, triggered by QEMU handling
> > > the TVM-HOST call.
> > > 2. TDI acceptance is handled in guest_request() to accept the TDI after
> > > the validation in the TVM)
> > 
> > I'll try my best to brainstorm and make a flow in ASCII.
> > 
> > (*) means new feature
> > 
> > 
> >        Guest          Guest TSM       QEMU           VFIO            IOMMUFD       host TSM          KVM
> >        -----          ---------       ----           ----            -------       --------          ---
> > 1.                                                                               *Connect(IDE)
> > 2.                                 Init vdev
> > 3.                                *create dmabuf
> > 4.                                               *export dmabuf
> > 5.                                create memslot
> > 6.                                                                                              *import dmabuf
> > 7.                                setup shared DMA
> > 8.                                                                 create hwpt
> > 9.                                               attach hwpt
> > 10.                                  kvm run
> > 11.enum shared dev
> > 12.*Connect(Bind)
> > 13.                  *GHCI Bind
> > 14.                                  *Bind
> > 15                                                                 CC viommu alloc
> > 16.                                                                vdevice allloc
> > 16.                                              *attach vdev
> 
> 
> This "attach vdev" - we are still deciding if it goes to IOMMUFD or VFIO, right?

This should be "tsm bind". Seems Jason's suggestion is place the IOCTL
against VFIO, then VFIO reach into IOMMUFD to do the real
pci_tsm_bind().

https://lore.kernel.org/all/20250515175658.GR382960@nvidia.com/

> 
> 
> > 17.                                                               *setup CC viommu
> > 18                                                                 *tsm_bind
> > 19.                                                                                  *bind
> > 20.*Attest
> > 21.               *GHCI get CC info
> > 22.                                 *get CC info
> > 23.                                                                *vdev guest req
> > 24.                                                                                 *guest req
> > 25.*Accept
> > 26.             *GHCI accept MMIO/DMA
> > 27.                                *accept MMIO/DMA
> > 28.                                                               *vdev guest req
> > 29.                                                                                 *guest req
> > 30.                                                                                              *map private MMIO
> > 31.             *GHCI start tdi
> > 32.                                *start tdi
> > 33.                                                               *vdev guest req
> > 34.                                                                                 *guest req
> 
> 
> I am not sure I follow the layout here. "start tdi" and "accept MMIO/DMA" are under "QEMU" but QEMU cannot do anything by itself and has to call VFIO or some other driver...
> 

Yes. Call IOCTL(iommufd, IOMMUFD_VDEVICE_GUEST_REQUEST, vdevice_id)

> > 35.Workload...
> > 36.*disconnect(Unbind)
> 
> Is this a case of PCI hotunplug? Or just killing QEMU/shutting down the VM? Or stopping trusting the device and switching it to untrusted mode, to work with SWIOTLB or DiscardManager?
> 

switching to untrusted mode. But I think hotunplug would finally trigger
the same host side behavior, only no need the guest to "echo 0 > connect"

> > 37.              *GHCI unbind
> > 38.                                *Unbind
> > 39.                                            *detach vdev
> > 40.                                                               *tsm_unbind
> > 41.                                                                                 *TDX stop tdi
> > 42.                                                                                 *TDX disable mmio cb
> > 43.                                            *cb dmabuf revoke
> 
> 
> ... like VFIO and hostTSM - "TDX stop tdi" and "cb dmabuf revoke" are not under QEMU.

Correct. These are TDX Module specific requirements, we don't want them
to make the general APIs unnecessary verbose.

> 
> 
> > 44.                                                                                               *unmap private MMIO
> > 45.                                                                                 *TDX disable dma cb
> > 46.                                                              *cb disable CC viommu
> > 47.                                                                                 *TDX tdi free
> > 48.                                                                                 *enable mmio
> > 49.                                            *cb dmabuf recover
> 
> 
> What is the difference between "cb dmabuf revoke" and "cb dmabuf recover"?

revoke revokes private S-EPT mapping, recover means KVM could then do
shared MMIO mapping on EPT.

Thanks,
Yilun

> 
> 
> > 50.workable shared dev
> > 
> > TSM unbind is a little verbos & specific to TDX Connect, but SEV TSM could
> > ignore these callback. Just implement an "unbind" tsm ops.
> 
> 
> Well, something need to clear RMP entries, can be done in the TDI unbind or whenever you will do it.
> 
> And the chart applies for AMD too, more or less. Thanks,
> 
> 
> > Thanks,
> > Yilun
> > 
> > > 
> > > and which part/where need to be modified in the current architecture to
> > > reach there. Try to fold vendor-specific knowledge as much as possible,
> > > but still keep them modular in the TSM driver and let's see how it looks
> > > like. Maybe some example TSM driver code to demonstrate together with
> > > VFIO dma-buf patch.
> > > 
> > > If some where is extremely hacky in the TSM driver, let's see how they
> > > can be lift to the upper level or the upper call passes more parameters
> > > to them.
> 
> 
> 
> -- 
> Alexey
> 
