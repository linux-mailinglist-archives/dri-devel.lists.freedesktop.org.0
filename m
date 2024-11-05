Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFAD9BD251
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 17:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B8510E18E;
	Tue,  5 Nov 2024 16:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxKnlG3w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2EC10E13F;
 Tue,  5 Nov 2024 16:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730824128; x=1762360128;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yXUyYL99fMvnP4uSXApUUJ0aXSavTTpL7eKuyKOyUHQ=;
 b=BxKnlG3wxaOYkmdLt2+LlfFSFXtyC73yW+z9ZxKu7uq94lcyLBjJqfVu
 KFTKKx1aYSlvauRHmUJhbLtrc8NzlK5K+h8VL2ynO49XQPbCC7U4ld1tU
 AANPgU5aTokGHCSw4GROzTXmMWcHNOABmJZBHZfR7ORKARxY8NwvzR6RE
 BKVbRnGpDkGCMNsEqHFxTdhAhcJVez8H3/LzYXDgIvfGDSadCgDORWCXi
 NM/UMgBkIoMLOl9I7O8UX0XA5DBinSQsU7gdnwOnl3X+OxIMzDese2/vJ
 wqUMRFo20mXyMXRVkhKjJa9KX5nvGydIJmRBTfsC3KZNoHHo+B7s8RZ7w A==;
X-CSE-ConnectionGUID: NDheceT/SqSSdcyYKHU0sw==
X-CSE-MsgGUID: tp8K5oo3SWWCZAQQdsDn9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34272522"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34272522"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 08:28:47 -0800
X-CSE-ConnectionGUID: d0LpPwDBQZS0XqsfDZ3uOQ==
X-CSE-MsgGUID: uLc1msZlTOWfu1EhMTnuJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="84471176"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.97])
 ([10.245.246.97])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 08:28:45 -0800
Message-ID: <baaab97bd9ebc2c35dd564e43899c56b51c1e302.camel@linux.intel.com>
Subject: Re: [PATCH v2 05/29] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Tue, 05 Nov 2024 17:28:41 +0100
In-Reply-To: <ZypD4/Q91FjghR+u@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-6-matthew.brost@intel.com>
 <4162aad194d52983035a7e2a5453e394ff84fb11.camel@linux.intel.com>
 <ZykCmAJEUIv+nzwz@lstrano-desk.jf.intel.com>
 <4acf3ea6edd0a856c5614d25b5a54d6a1c3f6194.camel@linux.intel.com>
 <ZylTmvdEMQXxftgi@lstrano-desk.jf.intel.com>
 <38c69f6205ca80c5da9ae7cde2d669399bbdce64.camel@linux.intel.com>
 <ZypD4/Q91FjghR+u@lstrano-desk.jf.intel.com>
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

On Tue, 2024-11-05 at 08:12 -0800, Matthew Brost wrote:
> On Tue, Nov 05, 2024 at 11:22:12AM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Mon, 2024-11-04 at 15:07 -0800, Matthew Brost wrote:
> > > > We
> > > > have
> > > > https://elixir.bootlin.com/linux/v6.12-rc6/source/include/linux/int
> > > > erval_tree_generic.h#L24
> > > >=20
> > > > to relate to. Now GPUVM can't use the generic version since it
> > > > needs
> > > > u64 intervals. These trees need unsigned long only so it should
> > > > be
> > > > ok.
> > > > And safe removal, isn't that possible to implement without the
> > > > list?
> > > > Then it's really only the linked list as a perf optimization I
> > > > guess,
> > > > but we have a lot of those pending...
> > > >=20
> > >=20
> > > See my other comments. Let me just follow on using a maple tree
> > > and
> > > perhaps a
> > > list isn't required if we use that. Will have definite answer in
> > > my
> > > next rev.
> >=20
> > Note, though, that IIRC maple trees do not allow overlapping
> > ranges,
> > and If we need to support multiple svm VMAs with different offsets,
> > like Christian suggests, we will likely have overlapping ranges for
> > the
> > range tree but not for the notifier tree.
> >=20
>=20
> I don't think that is how overlapping ranges would look though. We'd
> have multiple GPU VMAs / GPU ptes to pointing the same SVM range. The
> SVM ranges speak in the CPU address space - we'd attach multiple GPU
> VMAs to the SVM so in the notifier we can find all the GPU pages to
> invalidate. At least I think it would look this way - can cross that
> bridge if / when we get to it though.
>=20
> > Thinking a bit more about this, my concern is mostly around
> > needlessly
> > instantiating new interval trees instead of using the generic
> > instantiation, because that is clearly against recommended
> > practice.=C2=A0
> >=20
>=20
> Ok, so with this statement then I think both the interval trees in
> GPU
> VM / xe_range_fence are going again the recommended practice too?

No, they work in gpu virtual address space with u64 integers, whereas
these are cpu virtual address space with unsigned long, which is also
the type used for the generic instantiation. (I think maple trees also
use unsigned long). At least for the range fences that was the
motivation for a separate instantiation. Not sure what the reasoning
was with gpuvm.=20

/Thomas

