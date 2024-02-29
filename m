Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22BE86D048
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 18:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F61F10E4C6;
	Thu, 29 Feb 2024 17:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hVxk5CU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D751210E49D;
 Thu, 29 Feb 2024 17:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709226834; x=1740762834;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ggL2ejLmDl3iKLECeOmUsD/VQnpDkbc4+L4hSOY54DI=;
 b=hVxk5CU/1L91oiutcsdH4GjhOBUbvevf6Gi9EaxsZJQTUKDWhN5CiQRw
 u/JYSMsqREXwUsgW3/6iNOKuS8OX7HSBKNJvzMnnjhWVEULqQmwSSmx1D
 XXi0B8wWYJ9F9Wxc7ZjAFoN/jv1ZbK8E5Xj4NI1NYMAvu9hDsigz0s8xN
 jSJzTDoyzE6mBHZ9bXOZMGxBpilg4+g5X2kNG58DcnkeLAlmQFCOetMha
 nvvfebwCRKjk3muYjXV7HZGyCu04ZJf9H0Nohn2OiJ/vx+LzOS7RXXkVy
 6JgjtoPPRyh4lH5jr4aGEEjcEvvFFvWYFyuKsjkUu2oOktfbzcncV/pyu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3597607"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3597607"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 09:12:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8459162"
Received: from srdoo-mobl1.ger.corp.intel.com (HELO [10.252.3.93])
 ([10.252.3.93])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 09:12:04 -0800
Message-ID: <7eb835594110980f2e9f061512fd488bbd63fd11.camel@linux.intel.com>
Subject: Re: Making drm_gpuvm work across gpu devices
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Zeng,
 Oak" <oak.zeng@intel.com>, Danilo Krummrich <dakr@redhat.com>, Dave Airlie
 <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, Felix Kuehling
 <felix.kuehling@amd.com>, "jglisse@redhat.com" <jglisse@redhat.com>
Cc: "Welty, Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Gupta, saurabhg" <saurabhg.gupta@intel.com>
Date: Thu, 29 Feb 2024 18:12:02 +0100
In-Reply-To: <ada8e6cc-a7d2-4b6f-8f70-f0448cc2e420@amd.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <SA1PR11MB6991FDAFF07E3654538F5BBF92552@SA1PR11MB6991.namprd11.prod.outlook.com>
 <df2df998-af26-4ae9-a0a4-5aac1b9e3c73@amd.com>
 <SA1PR11MB6991786DA69422A1A6095A1E92592@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991B3DA606280EBC6952D1092582@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ada8e6cc-a7d2-4b6f-8f70-f0448cc2e420@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Christian.

On Thu, 2024-02-29 at 10:41 +0100, Christian K=C3=B6nig wrote:
> Am 28.02.24 um 20:51 schrieb Zeng, Oak:
> >=20
> > The mail wasn=E2=80=99t indent/preface correctly. Manually format it.
> >=20
> > *From:*Christian K=C3=B6nig <christian.koenig@amd.com>
> > *Sent:* Tuesday, February 27, 2024 1:54 AM
> > *To:* Zeng, Oak <oak.zeng@intel.com>; Danilo Krummrich=20
> > <dakr@redhat.com>; Dave Airlie <airlied@redhat.com>; Daniel Vetter=20
> > <daniel@ffwll.ch>; Felix Kuehling <felix.kuehling@amd.com>;=20
> > jglisse@redhat.com
> > *Cc:* Welty, Brian <brian.welty@intel.com>;=20
> > dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org;=20
> > Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Ghimiray, Himal
> > Prasad=20
> > <himal.prasad.ghimiray@intel.com>;
> > Thomas.Hellstrom@linux.intel.com;=20
> > Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>;=20
> > Brost, Matthew <matthew.brost@intel.com>; Gupta, saurabhg=20
> > <saurabhg.gupta@intel.com>
> > *Subject:* Re: Making drm_gpuvm work across gpu devices
> >=20
> > Hi Oak,
> >=20
> > Am 23.02.24 um 21:12 schrieb Zeng, Oak:
> >=20
> > =C2=A0=C2=A0=C2=A0 Hi Christian,
> >=20
> > =C2=A0=C2=A0=C2=A0 I go back this old email to ask a question.
> >=20
> >=20
> > sorry totally missed that one.
> >=20
> > =C2=A0=C2=A0=C2=A0 Quote from your email:
> >=20
> > =C2=A0=C2=A0=C2=A0 =E2=80=9CThose ranges can then be used to implement =
the SVM feature
> > =C2=A0=C2=A0=C2=A0 required for higher level APIs and not something you=
 need at
> > the
> > =C2=A0=C2=A0=C2=A0 UAPI or even inside the low level kernel memory mana=
gement.=E2=80=9D
> >=20
> > =C2=A0=C2=A0=C2=A0 =E2=80=9CSVM is a high level concept of OpenCL, Cuda=
, ROCm etc.. This
> > =C2=A0=C2=A0=C2=A0 should not have any influence on the design of the k=
ernel
> > UAPI.=E2=80=9D
> >=20
> > =C2=A0=C2=A0=C2=A0 There are two category of SVM:
> >=20
> > =C2=A0=C2=A0=C2=A0 1.driver svm allocator: this is implemented in user =
space,
> > =C2=A0i.g.,
> > =C2=A0=C2=A0=C2=A0 cudaMallocManaged (cuda) or zeMemAllocShared (L0) or
> > =C2=A0=C2=A0=C2=A0 clSVMAlloc(openCL). Intel already have gem_create/vm=
_bind in
> > xekmd
> > =C2=A0=C2=A0=C2=A0 and our umd implemented clSVMAlloc and zeMemAllocSha=
red on top
> > of
> > =C2=A0=C2=A0=C2=A0 gem_create/vm_bind. Range A..B of the process addres=
s space is
> > =C2=A0=C2=A0=C2=A0 mapped into a range C..D of the GPU address space, e=
xactly as
> > you
> > =C2=A0=C2=A0=C2=A0 said.
> >=20
> > =C2=A0=C2=A0=C2=A0 2.system svm allocator: =C2=A0This doesn=E2=80=99t i=
ntroduce extra driver
> > API
> > =C2=A0=C2=A0=C2=A0 for memory allocation. Any valid CPU virtual address=
 can be
> > used
> > =C2=A0=C2=A0=C2=A0 directly transparently in a GPU program without any =
extra
> > driver
> > =C2=A0=C2=A0=C2=A0 API call. Quote from kernel Documentation/vm/hmm.hst=
: =E2=80=9CAny
> > =C2=A0=C2=A0=C2=A0 application memory region (private anonymous, shared=
 memory, or
> > =C2=A0=C2=A0=C2=A0 regular file backed memory) can be used by a device
> > transparently=E2=80=9D
> > =C2=A0=C2=A0=C2=A0 and =E2=80=9Cto share the address space by duplicati=
ng the CPU page
> > table
> > =C2=A0=C2=A0=C2=A0 in the device page table so the same address points =
to the same
> > =C2=A0=C2=A0=C2=A0 physical memory for any valid main memory address in=
 the
> > process
> > =C2=A0=C2=A0=C2=A0 address space=E2=80=9D. In system svm allocator, we =
don=E2=80=99t need that
> > A..B
> > =C2=A0=C2=A0=C2=A0 C..D mapping.
> >=20
> > =C2=A0=C2=A0=C2=A0 It looks like you were talking of 1). Were you?
> >=20
> >=20
> > No, even when you fully mirror the whole address space from a
> > process=20
> > into the GPU you still need to enable this somehow with an IOCTL.
> >=20
> > And while enabling this you absolutely should specify to which part
> > of=20
> > the address space this mirroring applies and where it maps to.
> >=20
> > */[Zeng, Oak] /*
> >=20
> > Lets say we have a hardware platform where both CPU and GPU support
> > 57bit(use it for example. The statement apply to any address range)
> > virtual address range, how do you decide =E2=80=9Cwhich part of the add=
ress
> > space this mirroring applies=E2=80=9D? You have to mirror the whole add=
ress
> > space [0~2^57-1], do you? As you designed it, the gigantic=20
> > vm_bind/mirroring happens at the process initialization time, and
> > at=20
> > that time, you don=E2=80=99t know which part of the address space will =
be
> > used=20
> > for gpu program. Remember for system allocator, *any* valid CPU=20
> > address can be used for GPU program. =C2=A0If you add an offset to=20
> > [0~2^57-1], you get an address out of 57bit address range. Is this
> > a=20
> > valid concern?
> >=20
>=20
> Well you can perfectly mirror on demand. You just need something
> similar=20
> to userfaultfd() for the GPU. This way you don't need to mirror the
> full=20
> address space, but can rather work with large chunks created on
> demand,=20
> let's say 1GiB or something like that.


What we're looking at as the current design is an augmented userptr
(A..B -> C..D mapping) which is internally sparsely populated in
chunks. KMD manages the population using gpu pagefaults. We acknowledge
that some parts of this mirror will not have a valid CPU mapping. That
is, no vma so a gpu page-fault that resolves to such a mirror address
will cause an error. Would you have any concerns / objections against
such an approach?

Thanks,
Thomas



