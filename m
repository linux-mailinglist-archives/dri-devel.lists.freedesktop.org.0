Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3940984DF96
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 12:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EB210E65F;
	Thu,  8 Feb 2024 11:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O7LyW/Vq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744C310E65F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 11:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707391539; x=1738927539;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NbyipODvKhkuT4LeHX9tVJZzkOQYWiWXM+vZyBVCxSc=;
 b=O7LyW/VqvG4xDOu02l9A6aAi4yjSGgKFcyH9KQguuEMZ9SSTIh9iXxrG
 OrI7DM5UrrSMSwyPBtverzSgriSVhIeIG7NGNlck9rk82AfWnWHzJ3/0I
 Fvx2gmUczxh9OfEXz8yNrhnsG1wUu2Xetr3XA+eBBAnhCEhWGUzrBINP3
 i2HgYAiwyURRJ+EzjBJJ9fngBPwh5D2puHC13SBvIuSXxf902/loryLeA
 g2BDQ65AQHVysvvdLC3OX95F77q9CHdKKfGU32ByqEkz+DnKB8fIuWIY2
 18WgCdg8+HEiw5pqp2dM/t1QfBHatWT9uoxqYmeKmUR+TncHTDyaNZAh/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="18619328"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; d="scan'208";a="18619328"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 03:25:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; d="scan'208";a="32442856"
Received: from pplotits-mobl2.ccr.corp.intel.com (HELO [10.249.254.149])
 ([10.249.254.149])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 03:25:38 -0800
Message-ID: <9ae57d0c2fd78bad24d60044d32860cc66ea193e.camel@linux.intel.com>
Subject: Re: xe vs amdgpu userptr handling
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Dave
 Airlie <airlied@gmail.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>, Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Date: Thu, 08 Feb 2024 12:25:34 +0100
In-Reply-To: <42c543f1-c9dd-4342-877c-fd2fd290ea24@amd.com>
References: <CAPM=9twPgn+fpbkig0Vhjt=cJdHQFbNH_Z=sRhSZwuvLKhavbA@mail.gmail.com>
 <0c4da8bd-452a-4ba5-9c4c-582cbc7b5dec@igalia.com>
 <CAPM=9twvcJPdZvaw+TOpTC+6NoNTbSqhy97aJRP5Hg0HBkQE0g@mail.gmail.com>
 <bafff5df-a382-45fa-b706-47cdf0afe2cf@amd.com>
 <c12b07c33d11cf668516d92ecf9b908af34bf177.camel@linux.intel.com>
 <d4fa26cdb32371ce7981cc87203859c10e9e868a.camel@linux.intel.com>
 <42c543f1-c9dd-4342-877c-fd2fd290ea24@amd.com>
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

On Thu, 2024-02-08 at 12:08 +0100, Christian K=C3=B6nig wrote:
> Am 08.02.24 um 10:43 schrieb Thomas Hellstr=C3=B6m:
> > On Thu, 2024-02-08 at 10:38 +0100, Thomas Hellstr=C3=B6m wrote:
> > > Hi,
> > >=20
> > > On Thu, 2024-02-08 at 07:30 +0100, Christian K=C3=B6nig wrote:
> > > > Am 08.02.24 um 01:36 schrieb Dave Airlie:
> > > > > Just cc'ing some folks. I've also added another question.
> > > > >=20
> > > > > On Wed, 7 Feb 2024 at 21:08, Ma=C3=ADra Canal <mcanal@igalia.com>
> > > > > wrote:
> > > > > > Adding another point to this discussion, would it make
> > > > > > sense to
> > > > > > somehow
> > > > > > create a generic structure that all drivers, including
> > > > > > shmem
> > > > > > drivers,
> > > > > > could use it?
> > > > > >=20
> > > > > > Best Regards,
> > > > > > - Ma=C3=ADra
> > > > > >=20
> > > > > > On 2/7/24 03:56, Dave Airlie wrote:
> > > > > > > I'm just looking over the userptr handling in both
> > > > > > > drivers,
> > > > > > > and
> > > > > > > of
> > > > > > > course they've chosen different ways to represent things.
> > > > > > > Again
> > > > > > > this
> > > > > > > is a divergence that is just going to get more annoying
> > > > > > > over
> > > > > > > time and
> > > > > > > eventually I'd like to make hmm/userptr driver
> > > > > > > independent as
> > > > > > > much as
> > > > > > > possible, so we get consistent semantics in userspace.
> > > > > > >=20
> > > > > > > AFAICS the main difference is that amdgpu builds the
> > > > > > > userptr
> > > > > > > handling
> > > > > > > inside a GEM object in the kernel, whereas xe doesn't
> > > > > > > bother
> > > > > > > creating
> > > > > > > a holding object and just handles things directly in the
> > > > > > > VM
> > > > > > > binding
> > > > > > > code.
> > > > > > >=20
> > > > > > > Is this just different thinking at different times here?
> > > > > > > like since we have VM BIND in xe, it made sense not to
> > > > > > > bother
> > > > > > > creating
> > > > > > > a gem object for userptrs?
> > > > > > > or is there some other advantages to going one way or the
> > > > > > > other?
> > > > > > >=20
> > > > > So the current AMD code uses hmm to do userptr work, but xe
> > > > > doesn't
> > > > > again, why isn't xe using hmm here, I thought I remembered
> > > > > scenarios
> > > > > where plain mmu_notifiers weren't sufficient.
> > > > Well amdgpu is using hmm_range_fault because that was made
> > > > mandatory
> > > > for
> > > > the userptr handling.
> > > >=20
> > > > And yes pure mmu_notifiers are not sufficient, you need the
> > > > sequence
> > > > number + retry mechanism hmm_range_fault provides.
> > > >=20
> > > > Otherwise you open up security holes you can push an elephant
> > > > through.
> > > >=20
> > > > Regards,
> > > > Christian.
> > > Xe also uses a retry mechanism, so no security hole. The main
> > > difference is we use get_user_pages() + retry instead of
> > > hmm_range_fault() + retry, with a net effect we're probably
> > > holding
> > > the
> > > page refcounts a little longer, but we drop it immediately after
> > > obtaining the page pointers, and dirtying the pages.
> > >=20
> > > That said we should move over to hmm_range_fault() to align. I
> > > think
> > > this was only a result of limited hmm knowledge when the xe code
> > > was
> > > written.
>=20
> Yeah, that makes sense. In this case it's just a missing cleanup.
>=20
> > > As for the userptr not using a backing object in Xe, AFAIK that
> > > was
> > > because a backing object was deemed unnecessary with VM_BIND.
> > > Joonas
> > > or
> > > Matt can probably provide more detail, but if we're going to do
> > > an
> > > hmmptr, and have userptr only be a special case of that, then the
> > > object is ofc out of the question.
>=20
> Well how do you then store the dma_fence of the operation?
>=20
> At least my long term plan was to move some of the logic necessary
> for=20
> hmm_range_fault based userptr handling into common GEM code.

Since these are never shared, the dma-fences resulting from both the
bind operations and the workloads using the user-pointers are stored in
the vm's dma-resv, just like for local GEM objects. Although this is
IMHO a bit sub-optimal since I ideally would want the dma-fences
resulting from the bind operations stored per vma. That is because when
zapping ptes in faulting VMs we first need to wait for the bind to
complete, but only that. We don't need to wait for the VM to become
idle.

>=20
> One puzzle piece of that is the drm_exec object and for that to work=20
> userptrs would need to be based on GEM objects as well.

It does with the above solution. The vm's dma-resv is aliased to a
suitable GEM object.

>=20
> > > FWIW i915 also keeps an object, but it also pins the pages and
> > > relies
> > > on the shrinker to release that pinning.
>=20
> Well what exactly do you pin? The pages backing the userptr?
>=20
> Cause that would be a no-go as well I think since it badly clashes
> with=20
> NUMA migrations and transparent huge pages.

Exactly. I guess just nobody dared to remove the pinning in i915 in
favor of the pure mmu_notifier protection to see what errors CI might
come up with. Yet.

/Thomas


>=20
> Regards,
> Christian.
>=20
> > >=20
> > > So yes, some common code would come in handy. From looking at all
> > > implementations I'd
> > >=20
> > > - Use hmm_range_fault() - Probably want to temporarily get and
> > > lock
> > > the
> > > pages to dirty them at fault time, though, if gpu mapping is
> > > write-
> > > enabled.
> > > - Don't use a backing object - To be able to unify hmmptr and
> > > userptr
> > Oh, and to clarify for people that haven't been following the gpuvm
> > discussions and the xe SVM discussions,
> >=20
> > hmmptr is sparsely populated on-demand allocated (fault aware) and
> > can
> > do migration.
> > userptr is allocated upfront and can't do migration.
> >=20
> > Idea has been to create helpers for these in drm_gpuvm().
> >=20
> > /Thomas
> >=20
> >=20
> >=20
> > > Thanks,
> > > Thomas
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > > > > Dave.
>=20

