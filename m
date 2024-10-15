Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 263A299EA07
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 14:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D9410E2B8;
	Tue, 15 Oct 2024 12:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAnfh+pt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EA210E2B8;
 Tue, 15 Oct 2024 12:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728996089; x=1760532089;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+GiexxCIP40VgtIsNMOgBvOvMGy6SLDeRcCatZeWG6A=;
 b=JAnfh+ptbyJKX76HOxiWPT4R9UeYY+T1UerRj8r6UzasEXYjQLvU9Yrz
 3JcgDok5qP5YTt7yyzejvYOE6YlYXm4gYNCN2KdaqNMY+eOTFuzJ3oXK+
 fU6T0QSiwHwDdtTU2ZKU3R0HAB+vTDogw0XWKfY5usoUeP9IRTwC5y2wi
 BfA2dPbl7kEsNuivMcLNLO6n2feoyyAQkvvRe2itMkiBoWqUyMrhA68h6
 ZA2sV5MzzlrDOcl+CnNzRylPxg2XDNGCskV0JOixEZeoF+3omdYWOx7gb
 THc+TAgiSV1/FWzzCrL4+kyjjt7gy7l+GjFBgTwRiFoSHb04JQoMSw7sP A==;
X-CSE-ConnectionGUID: DwbAWAlrRlmDnsq3O2C9sg==
X-CSE-MsgGUID: G02n7KQeRqmFuG/f6Taaug==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="31259562"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="31259562"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 05:41:29 -0700
X-CSE-ConnectionGUID: EaHlclDNQCmecShcQia82g==
X-CSE-MsgGUID: 1EGf41f2TkG7TVkHfeLzYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="82534521"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.246.43])
 ([10.245.246.43])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 05:41:26 -0700
Message-ID: <19fb79c069b812b164abd4f79d38bb12d2f5afa4.camel@linux.intel.com>
Subject: Re: [RFC PATCH] mm/hmm, mm/migrate_device: Allow p2p access and p2p
 migration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, DRI-devel
 <dri-devel@lists.freedesktop.org>, Linux Memory Management List
 <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>
Date: Tue, 15 Oct 2024 14:41:24 +0200
In-Reply-To: <20241015121759.GG3394334@nvidia.com>
References: <20241015111322.97514-1-thomas.hellstrom@linux.intel.com>
 <20241015121759.GG3394334@nvidia.com>
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

Hi, Jason.

Thanks for the feedback.

On Tue, 2024-10-15 at 09:17 -0300, Jason Gunthorpe wrote:
> On Tue, Oct 15, 2024 at 01:13:22PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Introduce a way for hmm_range_fault() and migrate_vma_setup() to
> > identify
> > foreign devices with fast interconnect and thereby allow
> > both direct access over the interconnect and p2p migration.
> >=20
> > The need for a callback arises because without it, the p2p ability
> > would
> > need to be static and determined at dev_pagemap creation time. With
> > a callback it can be determined dynamically, and in the migrate
> > case
> > the callback could separate out local device pages.
>=20
>=20
> > +static bool hmm_allow_devmem(struct hmm_range *range, struct page
> > *page)
> > +{
> > +	if (likely(page->pgmap->owner =3D=3D range-
> > >dev_private_owner))
> > +		return true;
> > +	if (likely(!range->p2p))
> > +		return false;
> > +	return range->p2p->ops->p2p_allow(range->p2p, page);
> > +}
> > +
> > =C2=A0static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long
> > addr,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long end, pmd_t *pmdp,
> > pte_t *ptep,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *hmm_pfn)
> > @@ -248,8 +258,7 @@ static int hmm_vma_handle_pte(struct mm_walk
> > *walk, unsigned long addr,
> > =C2=A0		 * just report the PFN.
> > =C2=A0		 */
> > =C2=A0		if (is_device_private_entry(entry) &&
> > -		=C2=A0=C2=A0=C2=A0 pfn_swap_entry_to_page(entry)->pgmap->owner =3D=
=3D
> > -		=C2=A0=C2=A0=C2=A0 range->dev_private_owner) {
> > +		=C2=A0=C2=A0=C2=A0 hmm_allow_devmem(range,
> > pfn_swap_entry_to_page(entry))) {
> > =C2=A0			cpu_flags =3D HMM_PFN_VALID;
> > =C2=A0			if
> > (is_writable_device_private_entry(entry))
> > =C2=A0				cpu_flags |=3D HMM_PFN_WRITE;
>=20
> This is really misnamed and took me a while to get it.
>=20
> It has nothing to do with kernel P2P, you are just allowing more
> selective filtering of dev_private_owner. You should focus on that in
> the naming, not p2p. ie allow_dev_private()
>=20
> P2P is stuff that is dealing with MEMORY_DEVICE_PCI_P2PDMA.

Yes, although the intention was to incorporate also other fast
interconnects in "P2P", not just "PCIe P2P", but I'll definitely take a
look at the naming.

>=20
> This is just allowing more instances of the same driver to co-
> ordinate
> their device private memory handle, for whatever purpose.

Exactly, or theoretically even cross-driver.

>=20
> Otherwise I don't see a particular problem, though we have talked
> about widening the matching for device_private more broadly using
> some
> kind of grouping tag or something like that instead of a callback.
> You
> may consider that as an alternative

Yes. Looked at that, but (if I understand you correctly) that would be
the case mentioned in the commit message where the group would be set
up statically at dev_pagemap creation time?=20

>=20
> I would also probably try to have less indirection, you can embedd
> the
> hmm_range struct inside a caller private data struct and use that
> instead if inventing a whole new struct and pointer.

Our first attempt was based on that but then that wouldn't be reusable
in the migrate_device.c code. Hence the extra indirection.

Thanks,
Thomas


>=20
> Jason

