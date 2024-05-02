Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 954298B99E9
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 13:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B2E10EB68;
	Thu,  2 May 2024 11:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oH2MRB9h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D2110E5F5;
 Thu,  2 May 2024 11:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714648877; x=1746184877;
 h=message-id:subject:from:to:cc:in-reply-to:references:
 content-transfer-encoding:mime-version:date;
 bh=ciGwY2N2O0x6I3gavs1U22wVYFqwhV0R9Fxj9nqNb7I=;
 b=oH2MRB9hArgiU4QSGF0Hu+FUbxg1fjtsHqNGk0wc+lH6ltxvq8IAsym8
 laMgztU5CD9ftfxncjsJrGxuQdMuWWyL+0qVGksP2N0fJ8ZPhih1KkOuS
 64le5gThKVW5UZX1DG88hQVQU1zJw+JEfDh8jViiGaAw2gYMXbhqTmyT1
 jyroDk7byExKZHfTkXB/r2B7am0TtAGbpNpTClxJLZngmPD/Vn8xV+ZkL
 JXo+gBvac8rMgTyXSYUxaxasqeGz/sHF0L0BIa62PtzCk3pM6CTTLGm1Z
 MeSSu25bzhx0uEgmUPzwkN+XDKzs3MoZMW4UBdZMzeA+KOXaLwEdZBDSH w==;
X-CSE-ConnectionGUID: s7ofPpX4R0KxxvJgAZHEIA==
X-CSE-MsgGUID: 96/VyPSYSjiL9fRm6+/3tw==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="21557539"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="21557539"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 04:21:16 -0700
X-CSE-ConnectionGUID: MPvc4DICT36rMKurqmDtNQ==
X-CSE-MsgGUID: 9jdG6VlmQAuq5yPBkjBrtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="64530305"
Received: from vpus-mobl1.ger.corp.intel.com (HELO [10.252.34.3])
 ([10.252.34.3])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 04:21:13 -0700
Message-ID: <93fca752517f0120baa770992fd0f9160b0c14d1.camel@linux.intel.com>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jason Gunthorpe <jgg@nvidia.com>
Cc: "Zeng, Oak" <oak.zeng@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Brost, Matthew"
 <matthew.brost@intel.com>,  "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, Leon Romanovsky <leon@kernel.org>
In-Reply-To: <ZjNJASw0JdXS6dTa@phenom.ffwll.local>
References: <SA1PR11MB699102978E72F21E6C803D6392102@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240425010520.GW941030@nvidia.com>
 <65cb3984309d377d6e7d57cb6567473c8a83ed78.camel@linux.intel.com>
 <20240426120047.GX941030@nvidia.com>
 <ad82f95ee29ada403459416d4c97c2b9083b5a0f.camel@linux.intel.com>
 <20240426163519.GZ941030@nvidia.com>
 <f938dc8f7309ae833e02ccdbc72134df0607dfa4.camel@linux.intel.com>
 <20240430173002.GV941030@nvidia.com> <ZjE_LJ7AFFQk0Eep@phenom.ffwll.local>
 <20240501000915.GY941030@nvidia.com> <ZjNJASw0JdXS6dTa@phenom.ffwll.local>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Date: Thu, 02 May 2024 11:11:04 +0200
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

Although I haven't had a chance yet to eye through the current code,
some comments along the way.


On Thu, 2024-05-02 at 10:04 +0200, Daniel Vetter wrote:
> On Tue, Apr 30, 2024 at 09:09:15PM -0300, Jason Gunthorpe wrote:
> > On Tue, Apr 30, 2024 at 08:57:48PM +0200, Daniel Vetter wrote:
> > > On Tue, Apr 30, 2024 at 02:30:02PM -0300, Jason Gunthorpe wrote:
> > > > On Mon, Apr 29, 2024 at 10:25:48AM +0200, Thomas Hellstr=C3=B6m
> > > > wrote:
> > > >=20
> > > > > > Yes there is another common scheme where you bind a window
> > > > > > of CPU to
> > > > > > a
> > > > > > window on the device and mirror a fixed range, but this is
> > > > > > a quite
> > > > > > different thing. It is not SVA, it has a fixed range, and
> > > > > > it is
> > > > > > probably bound to a single GPU VMA in a multi-VMA device
> > > > > > page table.
> > > > >=20
> > > > > And this above here is exactly what we're implementing, and
> > > > > the GPU
> > > > > page-tables are populated using device faults. Regions
> > > > > (large) of the
> > > > > mirrored CPU mm need to coexist in the same GPU vm as
> > > > > traditional GPU
> > > > > buffer objects.
> > > >=20
> > > > Well, not really, if that was the case you'd have a single VMA
> > > > over
> > > > the entire bound range, not dynamically create them.
> > > >=20
> > > > A single VMA that uses hmm_range_fault() to populate the VM is
> > > > completely logical.
> > > >=20
> > > > Having a hidden range of mm binding and then
> > > > creating/destroying 2M
> > > > VMAs dynamicaly is the thing that doesn't make alot of sense.
> > >=20
> > > I only noticed this thread now but fyi I did dig around in the
> > > implementation and it's summarily an absolute no-go imo for
> > > multiple
> > > reasons. It starts with this approach of trying to mirror cpu vma
> > > (which I
> > > think originated from amdkfd) leading to all kinds of locking
> > > fun, and
> > > then it gets substantially worse when you dig into the details.

It's true the cpu vma lookup is a remnant from amdkfd. The idea here is
to replace that with fixed prefaulting ranges of tunable size. So far,
as you mention, the prefaulting range has been determined by the CPU
vma size. Given previous feedback, this is going to change.

Still the prefaulting range needs to be restricted to avoid -EFAULT
failures in hmm_range_fault(). That can ofc be done by calling it
without HMM_PFN_REQ_FAULT for the range and interpret the returned
pnfs. There is a performance concern of this approach as compared to
peeking at the CPU vmas directly, since hmm_range_fault() would need to
be called twice. Any guidelines ideas here?

The second aspect of this is gpu_vma creation / splitting on fault that
the current implementation has. The plan is to get rid of that as well,
in favour of a sparsely populated gpu_vma. The reason for this
implementation was the easy integration with drm_gpuvm.

Still, I don't see any locking problems here, though, maintaining

gpu_vm->lock
mmap_lock
dma_resv
reclaim
notifier_lock

throughout the code. What is likely to get somewhat problematic,
though, is VRAM eviction.

/Thomas




>=20
> s the main reason I replied, it felt a
> bit like the thread was derailing in details that don't yet matter.
>=20
> Thanks, Sima

/Thomas

