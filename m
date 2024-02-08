Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5946084DD20
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 10:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BA910E23E;
	Thu,  8 Feb 2024 09:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AUVYhtL2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682C310E21C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 09:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707385102; x=1738921102;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hzZfGu3xXNOCXGu9jGe9ebHk3F3wiy5Vl0dgLj6JiNE=;
 b=AUVYhtL2IhXfNLW+3jomtVAgeuBEkuHzYB/xtezmGmg/8p+O4HKQd7nd
 JtgTxfDHszPi0CdOMYL2VC4NlXCU+CNpbNlEOcrBmHKqmWg1hGUV2FM55
 GWrqW5jpfakpMpazSep+ILOshTBwQv3sJEKiQaVMY8rs9Tw3yDuN/r6Ld
 PpgeNC2uDie6/DZ5qzJDHyzhSu+jbab2RkOgU9dtZSohVGYSkmLbyG+ee
 BS/ucDHO+ykPY1PPPxwgadRs573i586+m3jb8PvtaVl0D96CQAmR8Q555
 UTMUbSAbdeLRzAfUjTAZRGmyh1soUO/RIdrpb+r6nZHHbW+RvSn4KCiRU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1067826"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1067826"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 01:38:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="6263014"
Received: from pplotits-mobl2.ccr.corp.intel.com (HELO [10.249.254.149])
 ([10.249.254.149])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 01:38:20 -0800
Message-ID: <c12b07c33d11cf668516d92ecf9b908af34bf177.camel@linux.intel.com>
Subject: Re: xe vs amdgpu userptr handling
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Dave
 Airlie <airlied@gmail.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>, Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Date: Thu, 08 Feb 2024 10:38:17 +0100
In-Reply-To: <bafff5df-a382-45fa-b706-47cdf0afe2cf@amd.com>
References: <CAPM=9twPgn+fpbkig0Vhjt=cJdHQFbNH_Z=sRhSZwuvLKhavbA@mail.gmail.com>
 <0c4da8bd-452a-4ba5-9c4c-582cbc7b5dec@igalia.com>
 <CAPM=9twvcJPdZvaw+TOpTC+6NoNTbSqhy97aJRP5Hg0HBkQE0g@mail.gmail.com>
 <bafff5df-a382-45fa-b706-47cdf0afe2cf@amd.com>
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

Hi,

On Thu, 2024-02-08 at 07:30 +0100, Christian K=C3=B6nig wrote:
> Am 08.02.24 um 01:36 schrieb Dave Airlie:
> > Just cc'ing some folks. I've also added another question.
> >=20
> > On Wed, 7 Feb 2024 at 21:08, Ma=C3=ADra Canal <mcanal@igalia.com> wrote=
:
> > > Adding another point to this discussion, would it make sense to
> > > somehow
> > > create a generic structure that all drivers, including shmem
> > > drivers,
> > > could use it?
> > >=20
> > > Best Regards,
> > > - Ma=C3=ADra
> > >=20
> > > On 2/7/24 03:56, Dave Airlie wrote:
> > > > I'm just looking over the userptr handling in both drivers, and
> > > > of
> > > > course they've chosen different ways to represent things. Again
> > > > this
> > > > is a divergence that is just going to get more annoying over
> > > > time and
> > > > eventually I'd like to make hmm/userptr driver independent as
> > > > much as
> > > > possible, so we get consistent semantics in userspace.
> > > >=20
> > > > AFAICS the main difference is that amdgpu builds the userptr
> > > > handling
> > > > inside a GEM object in the kernel, whereas xe doesn't bother
> > > > creating
> > > > a holding object and just handles things directly in the VM
> > > > binding
> > > > code.
> > > >=20
> > > > Is this just different thinking at different times here?
> > > > like since we have VM BIND in xe, it made sense not to bother
> > > > creating
> > > > a gem object for userptrs?
> > > > or is there some other advantages to going one way or the
> > > > other?
> > > >=20
> > So the current AMD code uses hmm to do userptr work, but xe doesn't
> > again, why isn't xe using hmm here, I thought I remembered
> > scenarios
> > where plain mmu_notifiers weren't sufficient.
>=20
> Well amdgpu is using hmm_range_fault because that was made mandatory
> for=20
> the userptr handling.
>=20
> And yes pure mmu_notifiers are not sufficient, you need the sequence=20
> number + retry mechanism hmm_range_fault provides.
>=20
> Otherwise you open up security holes you can push an elephant
> through.
>=20
> Regards,
> Christian.

Xe also uses a retry mechanism, so no security hole. The main
difference is we use get_user_pages() + retry instead of
hmm_range_fault() + retry, with a net effect we're probably holding the
page refcounts a little longer, but we drop it immediately after
obtaining the page pointers, and dirtying the pages.

That said we should move over to hmm_range_fault() to align. I think
this was only a result of limited hmm knowledge when the xe code was
written.

As for the userptr not using a backing object in Xe, AFAIK that was
because a backing object was deemed unnecessary with VM_BIND. Joonas or
Matt can probably provide more detail, but if we're going to do an
hmmptr, and have userptr only be a special case of that, then the
object is ofc out of the question.

FWIW i915 also keeps an object, but it also pins the pages and relies
on the shrinker to release that pinning.

So yes, some common code would come in handy. From looking at all
implementations I'd

- Use hmm_range_fault() - Probably want to temporarily get and lock the
pages to dirty them at fault time, though, if gpu mapping is write-
enabled.
- Don't use a backing object - To be able to unify hmmptr and userptr

Thanks,
Thomas







>=20
> >=20
> > Dave.
>=20

