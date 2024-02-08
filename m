Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F60384DD2C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 10:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74E710E448;
	Thu,  8 Feb 2024 09:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gnMmRbi4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778ED10E448
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 09:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707385385; x=1738921385;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YhM1skIWljwrLgndY4GdQtYXO0XqFKKa+BWhlqrclFw=;
 b=gnMmRbi4WqkV9Y1Mm8S6Djggy5z2+3SclTVjdVXXW133KcEi4hA5BMhT
 aTEu6QWQSPtE8CHkoxXnNqekllWQpsNz4qbB5M7OVhnWmVbpJN00ai5K7
 r1TPSvrvSXIELobuJKiyxS21jm9ngxDBHR3ult2RCf0dxMlhmroLqJ60n
 l93w4+kN8NGg6BjTU1//H3/oExJ2YVgpeTQVeofzplKku/ol7mZvy3pcG
 +nY4NxSNYsux2ZqLVgPKQZO0v/gNlH0O12/iwDJXshOYJuqOnCa1BAIIx
 nQx/+wfR1bDBWscxVqrZtFz6ImL3+YnOqjL5JU6yJym/gLb/rEUatKLwq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="5002335"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="5002335"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 01:43:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="6235598"
Received: from pplotits-mobl2.ccr.corp.intel.com (HELO [10.249.254.149])
 ([10.249.254.149])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 01:43:03 -0800
Message-ID: <d4fa26cdb32371ce7981cc87203859c10e9e868a.camel@linux.intel.com>
Subject: Re: xe vs amdgpu userptr handling
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Dave
 Airlie <airlied@gmail.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>, Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Date: Thu, 08 Feb 2024 10:43:01 +0100
In-Reply-To: <c12b07c33d11cf668516d92ecf9b908af34bf177.camel@linux.intel.com>
References: <CAPM=9twPgn+fpbkig0Vhjt=cJdHQFbNH_Z=sRhSZwuvLKhavbA@mail.gmail.com>
 <0c4da8bd-452a-4ba5-9c4c-582cbc7b5dec@igalia.com>
 <CAPM=9twvcJPdZvaw+TOpTC+6NoNTbSqhy97aJRP5Hg0HBkQE0g@mail.gmail.com>
 <bafff5df-a382-45fa-b706-47cdf0afe2cf@amd.com>
 <c12b07c33d11cf668516d92ecf9b908af34bf177.camel@linux.intel.com>
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

On Thu, 2024-02-08 at 10:38 +0100, Thomas Hellstr=C3=B6m wrote:
> Hi,
>=20
> On Thu, 2024-02-08 at 07:30 +0100, Christian K=C3=B6nig wrote:
> > Am 08.02.24 um 01:36 schrieb Dave Airlie:
> > > Just cc'ing some folks. I've also added another question.
> > >=20
> > > On Wed, 7 Feb 2024 at 21:08, Ma=C3=ADra Canal <mcanal@igalia.com>
> > > wrote:
> > > > Adding another point to this discussion, would it make sense to
> > > > somehow
> > > > create a generic structure that all drivers, including shmem
> > > > drivers,
> > > > could use it?
> > > >=20
> > > > Best Regards,
> > > > - Ma=C3=ADra
> > > >=20
> > > > On 2/7/24 03:56, Dave Airlie wrote:
> > > > > I'm just looking over the userptr handling in both drivers,
> > > > > and
> > > > > of
> > > > > course they've chosen different ways to represent things.
> > > > > Again
> > > > > this
> > > > > is a divergence that is just going to get more annoying over
> > > > > time and
> > > > > eventually I'd like to make hmm/userptr driver independent as
> > > > > much as
> > > > > possible, so we get consistent semantics in userspace.
> > > > >=20
> > > > > AFAICS the main difference is that amdgpu builds the userptr
> > > > > handling
> > > > > inside a GEM object in the kernel, whereas xe doesn't bother
> > > > > creating
> > > > > a holding object and just handles things directly in the VM
> > > > > binding
> > > > > code.
> > > > >=20
> > > > > Is this just different thinking at different times here?
> > > > > like since we have VM BIND in xe, it made sense not to bother
> > > > > creating
> > > > > a gem object for userptrs?
> > > > > or is there some other advantages to going one way or the
> > > > > other?
> > > > >=20
> > > So the current AMD code uses hmm to do userptr work, but xe
> > > doesn't
> > > again, why isn't xe using hmm here, I thought I remembered
> > > scenarios
> > > where plain mmu_notifiers weren't sufficient.
> >=20
> > Well amdgpu is using hmm_range_fault because that was made
> > mandatory
> > for=20
> > the userptr handling.
> >=20
> > And yes pure mmu_notifiers are not sufficient, you need the
> > sequence=20
> > number + retry mechanism hmm_range_fault provides.
> >=20
> > Otherwise you open up security holes you can push an elephant
> > through.
> >=20
> > Regards,
> > Christian.
>=20
> Xe also uses a retry mechanism, so no security hole. The main
> difference is we use get_user_pages() + retry instead of
> hmm_range_fault() + retry, with a net effect we're probably holding
> the
> page refcounts a little longer, but we drop it immediately after
> obtaining the page pointers, and dirtying the pages.
>=20
> That said we should move over to hmm_range_fault() to align. I think
> this was only a result of limited hmm knowledge when the xe code was
> written.
>=20
> As for the userptr not using a backing object in Xe, AFAIK that was
> because a backing object was deemed unnecessary with VM_BIND. Joonas
> or
> Matt can probably provide more detail, but if we're going to do an
> hmmptr, and have userptr only be a special case of that, then the
> object is ofc out of the question.
>=20
> FWIW i915 also keeps an object, but it also pins the pages and relies
> on the shrinker to release that pinning.
>=20
> So yes, some common code would come in handy. From looking at all
> implementations I'd
>=20
> - Use hmm_range_fault() - Probably want to temporarily get and lock
> the
> pages to dirty them at fault time, though, if gpu mapping is write-
> enabled.
> - Don't use a backing object - To be able to unify hmmptr and userptr

Oh, and to clarify for people that haven't been following the gpuvm
discussions and the xe SVM discussions,=20

hmmptr is sparsely populated on-demand allocated (fault aware) and can
do migration.
userptr is allocated upfront and can't do migration.

Idea has been to create helpers for these in drm_gpuvm().=20

/Thomas



>=20
> Thanks,
> Thomas
>=20
>=20
>=20
>=20
>=20
>=20
>=20
> >=20
> > >=20
> > > Dave.
> >=20
>=20

