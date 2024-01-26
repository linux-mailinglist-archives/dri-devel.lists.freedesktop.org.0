Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA86F83D4A1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 09:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A63910F3AD;
	Fri, 26 Jan 2024 08:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8FD10F39C;
 Fri, 26 Jan 2024 08:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706257304; x=1737793304;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Mcs6Cs6Q+R3zs/0ehqHNyOTCGTZJsAAVoa+IoypXb24=;
 b=ZVqDZKh9mSeyjlKvA7jiQYaE1xbCOdhkqdpbt1z21zPqw9FHOq7xqN8D
 fMxWpitkz5HvLTFalo2oDxCm2nYoXd6GLIOxeLYmq91RlFzPaKpMdTHIW
 bBeNdT6cWx9e/vZ8ilSwV9EPeucVIjIsOs0Qog4CK21azOSUfQmRWRZW7
 N+PCS/uscHKp0/UfT+vfyWSUqg+8vf0XP2YhqBxt48pX7qilD8WL1i1C4
 tSHa8EmMwDQIUublTyyDMJ2tPPAi5TJ9j52qBVWMkRMdOofHjQA74+8tE
 Zb0sSfQNeTm1ksFROuG+bKhALOyMNpXVOVaBV8LYGyRHFfqv0OkYQbELZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2302294"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2302294"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 00:21:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2689701"
Received: from clillies-mobl1.ger.corp.intel.com (HELO [10.249.254.111])
 ([10.249.254.111])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 00:21:35 -0800
Message-ID: <7834e2fbe8052717a4e0fa44feafa544b1fedaa0.camel@linux.intel.com>
Subject: Re: Making drm_gpuvm work across gpu devices
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Date: Fri, 26 Jan 2024 09:21:32 +0100
In-Reply-To: <ZbKpWpOGuNKLJ6sA@phenom.ffwll.local>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <ZbKpWpOGuNKLJ6sA@phenom.ffwll.local>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 Dave Airlie <airlied@redhat.com>, Felix Kuehling <felix.kuehling@amd.com>,
 "Welty, Brian" <brian.welty@intel.com>, "Zeng, Oak" <oak.zeng@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, all

On Thu, 2024-01-25 at 19:32 +0100, Daniel Vetter wrote:
> On Wed, Jan 24, 2024 at 09:33:12AM +0100, Christian K=C3=B6nig wrote:
> > Am 23.01.24 um 20:37 schrieb Zeng, Oak:
> > > [SNIP]
> > > Yes most API are per device based.
> > >=20
> > > One exception I know is actually the kfd SVM API. If you look at
> > > the svm_ioctl function, it is per-process based. Each kfd_process
> > > represent a process across N gpu devices.
> >=20
> > Yeah and that was a big mistake in my opinion. We should really not
> > do that
> > ever again.
> >=20
> > > Need to say, kfd SVM represent a shared virtual address space
> > > across CPU and all GPU devices on the system. This is by the
> > > definition of SVM (shared virtual memory). This is very different
> > > from our legacy gpu *device* driver which works for only one
> > > device (i.e., if you want one device to access another device's
> > > memory, you will have to use dma-buf export/import etc).
> >=20
> > Exactly that thinking is what we have currently found as blocker
> > for a
> > virtualization projects. Having SVM as device independent feature
> > which
> > somehow ties to the process address space turned out to be an
> > extremely bad
> > idea.
> >=20
> > The background is that this only works for some use cases but not
> > all of
> > them.
> >=20
> > What's working much better is to just have a mirror functionality
> > which says
> > that a range A..B of the process address space is mapped into a
> > range C..D
> > of the GPU address space.
> >=20
> > Those ranges can then be used to implement the SVM feature required
> > for
> > higher level APIs and not something you need at the UAPI or even
> > inside the
> > low level kernel memory management.
> >=20
> > When you talk about migrating memory to a device you also do this
> > on a per
> > device basis and *not* tied to the process address space. If you
> > then get
> > crappy performance because userspace gave contradicting information
> > where to
> > migrate memory then that's a bug in userspace and not something the
> > kernel
> > should try to prevent somehow.
> >=20
> > [SNIP]
> > > > I think if you start using the same drm_gpuvm for multiple
> > > > devices you
> > > > will sooner or later start to run into the same mess we have
> > > > seen with
> > > > KFD, where we moved more and more functionality from the KFD to
> > > > the DRM
> > > > render node because we found that a lot of the stuff simply
> > > > doesn't work
> > > > correctly with a single object to maintain the state.
> > > As I understand it, KFD is designed to work across devices. A
> > > single pseudo /dev/kfd device represent all hardware gpu devices.
> > > That is why during kfd open, many pdd (process device data) is
> > > created, each for one hardware device for this process.
> >=20
> > Yes, I'm perfectly aware of that. And I can only repeat myself that
> > I see
> > this design as a rather extreme failure. And I think it's one of
> > the reasons
> > why NVidia is so dominant with Cuda.
> >=20
> > This whole approach KFD takes was designed with the idea of
> > extending the
> > CPU process into the GPUs, but this idea only works for a few use
> > cases and
> > is not something we should apply to drivers in general.
> >=20
> > A very good example are virtualization use cases where you end up
> > with CPU
> > address !=3D GPU address because the VAs are actually coming from the
> > guest VM
> > and not the host process.
> >=20
> > SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This should
> > not have
> > any influence on the design of the kernel UAPI.
> >=20
> > If you want to do something similar as KFD for Xe I think you need
> > to get
> > explicit permission to do this from Dave and Daniel and maybe even
> > Linus.
>=20
> I think the one and only one exception where an SVM uapi like in kfd
> makes
> sense, is if the _hardware_ itself, not the software stack defined
> semantics that you've happened to build on top of that hw, enforces a
> 1:1
> mapping with the cpu process address space.
>=20
> Which means your hardware is using PASID, IOMMU based translation,
> PCI-ATS
> (address translation services) or whatever your hw calls it and has
> _no_
> device-side pagetables on top. Which from what I've seen all devices
> with
> device-memory have, simply because they need some place to store
> whether
> that memory is currently in device memory or should be translated
> using
> PASID. Currently there's no gpu that works with PASID only, but there
> are
> some on-cpu-die accelerator things that do work like that.
>=20
> Maybe in the future there will be some accelerators that are fully
> cpu
> cache coherent (including atomics) with something like CXL, and the
> on-device memory is managed as normal system memory with struct page
> as
> ZONE_DEVICE and accelerator va -> physical address translation is
> only
> done with PASID ... but for now I haven't seen that, definitely not
> in
> upstream drivers.
>=20
> And the moment you have some per-device pagetables or per-device
> memory
> management of some sort (like using gpuva mgr) then I'm 100% agreeing
> with
> Christian that the kfd SVM model is too strict and not a great idea.
>=20
> Cheers, Sima


I'm trying to digest all the comments here, The end goal is to be able
to support something similar to this here:

https://developer.nvidia.com/blog/simplifying-gpu-application-development-w=
ith-heterogeneous-memory-management/

Christian, If I understand you correctly, you're strongly suggesting
not to try to manage a common virtual address space across different
devices in the kernel, but merely providing building blocks to do so,
like for example a generalized userptr with migration support using
HMM; That way each "mirror" of the CPU mm would be per device and
inserted into the gpu_vm just like any other gpu_vma, and user-space
would dictate the A..B -> C..D mapping by choosing the GPU_VA for the
vma.

Sima, it sounds like you're suggesting to shy away from hmm and not
even attempt to support this except if it can be done using IOMMU sva
on selected hardware?

Could you clarify a bit?

Thanks,
Thomas







