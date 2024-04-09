Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F7989D6B7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E539112C7A;
	Tue,  9 Apr 2024 10:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PC8R4Qsk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBA2112C78;
 Tue,  9 Apr 2024 10:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712657945; x=1744193945;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Pt63XJPOtxaMNnfndYhBHOr+l4x7r/nVk0p7WeLXzSk=;
 b=PC8R4QskjZ1+DWf/AOulcxF+N0JmLchne8WEuKmchWpSxmKgzHJWg04i
 dCtOi/YNeHyIlnoI7mHKgID4Wt1YT4yNWfF+PRqxjFy6AL7cbxBGKX8+Q
 bpt7qEvtlrOWJkpft/vc3wMO8cADcnlAglnaxxXmbynTjhdglJaFEbrq/
 p5kYaWWgm1oYxTeBRPIcgRiX4Yvhy6M9xY2u1w88+wueN56WzY+LVYIhI
 Y/X/Fx9lLRzK9fAlHDF8IpMbc/PH48Abmh8c5yEMQWZKQCZatlyhYIo2Y
 MEvNvJ/Dwp4Y0Ni0IRzD1faEeZRX6w26lB7pAVqzSuyVLcaM/G80VxepX Q==;
X-CSE-ConnectionGUID: IOXk5SGsQ+KCjltLPZ9srw==
X-CSE-MsgGUID: i4URLAeBTjyrtK9CDSbOgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="10937102"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="10937102"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 03:19:04 -0700
X-CSE-ConnectionGUID: orKFnWY/QfCUGq3bcvOqGg==
X-CSE-MsgGUID: LsdqHC16SQaoQAHR8SC5Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="24959499"
Received: from sbint17x-mobl.gar.corp.intel.com (HELO [10.249.254.44])
 ([10.249.254.44])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 03:19:02 -0700
Message-ID: <ca88419b11d7d1158a4fa7480f3ecd9a78221af6.camel@linux.intel.com>
Subject: Re: Cross-device and cross-driver HMM support
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 oak.zeng@intel.com, Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 09 Apr 2024 12:18:47 +0200
In-Reply-To: <20240403150928.GE1723999@nvidia.com>
References: <bc4c7b5f19e6479a002ef69949918a45ca89ce69.camel@linux.intel.com>
 <CAPM=9tyMF2POfE4Sm3717ibH3NSaY-AX3bMz6ZRAeaRaQWEURQ@mail.gmail.com>
 <5495090e-dee1-4c8e-91bc-240632fd3e35@amd.com>
 <20240403125712.GA1744080@nvidia.com>
 <27a15da3-57e8-4c74-81d2-71ad123776e4@amd.com>
 <20240403150928.GE1723999@nvidia.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 2024-04-03 at 12:09 -0300, Jason Gunthorpe wrote:
> On Wed, Apr 03, 2024 at 04:06:11PM +0200, Christian K=C3=B6nig wrote:
>=20
> [UGH html emails, try to avoid those they don't get archived!]
>=20
> > =C2=A0=C2=A0 The problem with that isn't the software but the hardware.
> > =C2=A0=C2=A0 At least on the AMD GPUs and Intels Xe accelerators we hav=
e seen
> > so far
> > =C2=A0=C2=A0 page faults are not fast enough to actually work with the
> > semantics the
> > =C2=A0=C2=A0 Linux kernel uses for struct pages.
> > =C2=A0=C2=A0 That's why for example the SVM implementation really suck =
with
> > fork(),
> > =C2=A0=C2=A0 the transparent huge page deamon and NUMA migrations.
> > =C2=A0=C2=A0 Somebody should probably sit down and write a performance
> > measurement
> > =C2=A0=C2=A0 tool for page faults so that we can start to compare vendo=
rs
> > regarding
> > =C2=A0=C2=A0 this.
>=20
> Yes, all these page fault implementations I've seen are really
> slow. Even SVA/PRI is really slow. The only way it works usefully
> today is for the application/userspace environment to co-operate and
> avoid causing faults.
>=20
> Until someone invents a faster PRI interface this is what we have..
> It
> is limited but still useful.
> =C2=A0
> > =C2=A0=C2=A0 The problem is the DMA API currently has no idea of inter =
device
> > =C2=A0=C2=A0 connectors like XGMI.
> > =C2=A0=C2=A0 So it can create P2P mappings for PCIe, but anything which=
 isn't
> > part
> > =C2=A0=C2=A0 of those interconnects is ignore at the moment as far as I=
 can
> > see.
>=20
> Speaking broadly - a "multi-path" device is one that has multiple DMA
> initiators and thus multiple paths the DMA can travel. The different
> paths may have different properties, like avoiding the iommu or what
> not. This might be a private hidden bus (XGMI/nvlink/etc) in a GPU
> complex or just two PCI end ports on the same chip like a socket
> direct mlx5 device.
>=20
> The device HW itself must have a way to select which path each DMA
> goes thorugh because the paths are going to have different address
> spaces. A multi-path PCI device will have different PCI RID's and
> thus
> different iommu_domains/IO pagetables/IOVAs, for instance. A GPU will
> alias its internal memory with the PCI IOMMU IOVA.
>=20
> So, in the case of something like a GPU I expect the private PTE
> itself to have bit(s) indicating if the address is PCI, local memory
> or internal interconnect.
>=20
> When the hmm_range_fault() encounters a DEVICE_PRIVATE page the GPU
> driver must make a decision on how to set that bit.
>=20
> My advice would be to organize the GPU driver so that the
> "dev_private_owner" is the same value for all GPU's that share a
> private address space. IOW dev_private_owner represents the physical
> *address space* that the DEVICE_PRIVATE's hidden address lives in,
> not
> the owning HW. Perhaps we will want to improve on this by adding to
> the pgmap an explicit address space void * private data as well.
>=20
> When setup like this hmm_range_fault() will naturally return
> DEVICE_PRIVATE pages which map to the address space for which the
> requesting GPU can trivially set the PTE bit on. Easy. No DMA API
> fussing needed.
>=20
> Otherwise hmm_range_fault() returns the CPU/P2P page. The GPU should
> select the PCI path and the DMA API will check the PCI topology and
> generate a correct PCI address.
>=20
> If the device driver needs/wants to create driver core bus's and
> devices to help it model and discover the dev_private_owner groups, I
> don't know. Clearly the driver must be able to do this grouping to
> make it work, and all this setup is just done when creating the
> pgmap.
>=20
> I don't think the DMA API should become involved here. The layering
> in
> a multi-path scenario should have the DMA API caller decide on the
> path then the DMA API will map for the specific path. The caller
> needs
> to expressly opt into this because there is additional HW - the
> multi-path selector - that needs to be programmed and the DMA API
> cannot make that transparent.
>=20
> A similar approach works for going from P2P pages as well, the driver
> can inspect the pgmap owner and similarly check the pgmap private
> data
> to learn the address space and internal address then decide to choose
> the non-PCI path.
>=20
> This scales to a world without P2P struct pages because we will still
> have some kind of 'pgmap' similar structure that holds meta data for
> a
> uniform chunk of MMIO.

Thanks everyone for suggestions and feedback. We've been discussion
something like what Jason is describing above although I haven't had
time to digest all the details yet.

It sounds like common drm- or core code is the preferred way to go
here. I also recognize that gpuvm was successful in this respect but I
think that gpuvm also had a couple of active reviwers and multiple
drivers that were able to spend time to implement and test the code, so
let's hope for at least some active review participation and feedback
here.

Thanks,
Thomas



>=20
> Jason

