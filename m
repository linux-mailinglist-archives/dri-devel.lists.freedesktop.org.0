Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4480EA08640
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 05:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE1D10EF88;
	Fri, 10 Jan 2025 04:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="irI1pxD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268FF10E4D7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 04:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736484096; x=1768020096;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DGxK73eBcrHkAal0dgjD2vhuA/aOg+rpM5xwCq1ezTA=;
 b=irI1pxD8WKQCdkwR9S19/plGe3fK5yS1XYrTjQ5r5HWzWWQKDX6odNXQ
 0W/NH8y7LEHm10PEfuDlxSlGiSThVTTcafEyNoyGtu2kwLhGOFsQpHH8c
 LQmCXkVakx0ByikMKGnsjPuI5sLWWhIhm49n7SvPAVoet5+ILAxtxrSrd
 rYedWoMGJGFHz0GB2/QPRas/0vArvdAWsck1HRP2S05RSIHAhAJ+gnjUZ
 A8YprDkz4NkwiSdR8TAnQhsX0H5gpS5n8kuNbcrJTGnPo66hnCqXSPAyq
 CZ6Ug3osuLL+X1hXRZyI96LQueLgiiOFYpiHynZ+XyisHYnhfrHIoWqkz Q==;
X-CSE-ConnectionGUID: OdRsI8moReaVdZNZRnTIYA==
X-CSE-MsgGUID: 25qwgg9BSdulqSXfLHz8gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36877906"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36877906"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 20:41:36 -0800
X-CSE-ConnectionGUID: K//gjLLKTECj0XWVemmntw==
X-CSE-MsgGUID: n72tzvFxTvOIbtm23glOzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="108539760"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by fmviesa004.fm.intel.com with ESMTP; 09 Jan 2025 20:41:30 -0800
Date: Fri, 10 Jan 2025 00:40:28 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 08/12] vfio/pci: Create host unaccessible dma-buf for
 private device
Message-ID: <Z3/7/PQCLi1GE5Ry@yilunxu-OptiPlex-7050>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-9-yilun.xu@linux.intel.com>
 <20250108133026.GQ5556@nvidia.com>
 <Z36ulpCoJAllp4fP@yilunxu-OptiPlex-7050>
 <20250109144051.GX5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109144051.GX5556@nvidia.com>
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

On Thu, Jan 09, 2025 at 10:40:51AM -0400, Jason Gunthorpe wrote:
> On Thu, Jan 09, 2025 at 12:57:58AM +0800, Xu Yilun wrote:
> > On Wed, Jan 08, 2025 at 09:30:26AM -0400, Jason Gunthorpe wrote:
> > > On Tue, Jan 07, 2025 at 10:27:15PM +0800, Xu Yilun wrote:
> > > > Add a flag for ioctl(VFIO_DEVICE_BIND_IOMMUFD) to mark a device as
> > > > for private assignment. For these private assigned devices, disallow
> > > > host accessing their MMIO resources.
> > > 
> > > Why? Shouldn't the VMM simply not call mmap? Why does the kernel have
> > > to enforce this?
> > 
> > MM.. maybe I should not say 'host', instead 'userspace'.
> > 
> > I think the kernel part VMM (KVM) has the responsibility to enforce the
> > correct behavior of the userspace part VMM (QEMU). QEMU has no way to
> > touch private memory/MMIO intentionally or accidently. IIUC that's one
> > of the initiative guest_memfd is introduced for private memory. Private
> > MMIO follows.
> 
> Okay, but then why is it a flag like that? I'm expecting a much

This flag is a prerequisite for setting up TDI, or part of the
requirement to make a "TDI capable" assigned device. It prevents the
userspace mapping at the first place, even as a shared device.

We want the device firstly appear as a shared device in CoCo-VM, then
do TDI setup (via a tsm verb "bind"). This late bind approach avoids
changing the CoCo VM startup routine. In contrast, early bind would
easily be broken, especially if bios is not aware of the TDI rule.

So then we face with the shared <-> private device conversion in CoCo VM,
and in turn shared <-> private MMIO conversion. MMIO region has only one
physical backend so it is a bit like in-place conversion which is
complicated. I wanna simply the MMIO conversion routine based on the fact
that VMM never needs to access assigned MMIO for feature emulation, so
always disallow userspace MMIO mapping during the whole lifecycle. That's
why the flag is introduced.

Patch 6 has similar discription.

> broader system here to make the VFIO device into a confidential device
> (like setup the TDI) where we'd have to enforce the private things,

I plan to introduce a new VFIO ioctl to setup the TDI.

> communicate with some secure world to assign it, and so on.

Yes, the new VFIO ioctl will communicate with PCI TSM.

> 
> I want to see a fuller solution to the CC problem in VFIO before we

MM.. I have something but need more preparation. Whether send out or
make a public repo, I'll discuss with internal.

> can be sure what is the correct UAPI. In other words, make the
> VFIO device into a CC device should also prevent mmaping it and so on.

My idea is prevent mmaping first, then allow VFIO device into CC dev (TDI).

> 
> So, I would take this out and defer VFIO enforcment to a series which
> does fuller CC enablement of VFIO.
> 
> The precursor work should just be avoiding requiring a VMA when
> installing VFIO MMIO into the KVM and IOMMU stage 2 mappings. Ie by
> using a FD to get the CPU pfns into iommufd and kvm as you are
> showing.
> 
> This works just fine for non-CC devices anyhow and is the necessary

Yes. It carries out the idea of "KVM maps MMIO resources without firstly
mapping into the host" even for normal VM. That's why I think it could
be an independent patchset.

Thanks,
Yilun

> building block for making a TDI interface in VFIO.
> 
> Jason
