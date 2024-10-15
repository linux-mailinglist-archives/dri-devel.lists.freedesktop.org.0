Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B5099EC52
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 15:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0306910E585;
	Tue, 15 Oct 2024 13:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E33aBxat";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FAB10E581;
 Tue, 15 Oct 2024 13:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728998263; x=1760534263;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qgUG7mUO/Q61vFMkgqWq/P8BxIx1EByyJ7fGxhh6WYs=;
 b=E33aBxat9BugsCJwNzxRhar7fmmIj8BNPfgpl+bSx12Mja+NxRH2k18K
 EQ9YRCe2hxngqTq0cStQvhBHIOLW2ETr+hoCz4BlH13y4kO/Nu4x1xyCh
 Kt+gfouIzb57VkGTpQanYvI/Qn+Bz/yZbPfMNl8u6qybWlrPhiBZtAniF
 z4aqWRdd49dDjUdKxeYT23OW/Q0TfGPseC1y1EjH6lvEJmORY5zasT/ks
 3jhpE9OhDDae6EOjXvSu2aIAV+nLhhapOEjPjb1VdndWoEoEO6mTC+alo
 4s8m1LSOrmW9GeyNxWLOkhXgL+4q3KV9mmr3IQou/m+ah0zVVP1/kgWUV g==;
X-CSE-ConnectionGUID: SPmk1/yZQ4Wh0LQcFTc5sg==
X-CSE-MsgGUID: L0vK4d6lSjm3JAdvtAHKDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39022658"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="39022658"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 06:17:43 -0700
X-CSE-ConnectionGUID: pVrQG5LGS2OpD9jjiHNQwQ==
X-CSE-MsgGUID: FITRH2q/SSmbQVhGr0vC9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="81874750"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.246.43])
 ([10.245.246.43])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 06:17:40 -0700
Message-ID: <67d855c26e95d89997f0ae5a0e1a5fdc636f6b95.camel@linux.intel.com>
Subject: Re: [RFC PATCH] mm/hmm, mm/migrate_device: Allow p2p access and p2p
 migration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, DRI-devel
 <dri-devel@lists.freedesktop.org>, Linux Memory Management List
 <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>
Date: Tue, 15 Oct 2024 15:17:37 +0200
In-Reply-To: <20241015130221.GK3394334@nvidia.com>
References: <20241015111322.97514-1-thomas.hellstrom@linux.intel.com>
 <20241015121759.GG3394334@nvidia.com>
 <19fb79c069b812b164abd4f79d38bb12d2f5afa4.camel@linux.intel.com>
 <20241015130221.GK3394334@nvidia.com>
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

On Tue, 2024-10-15 at 10:02 -0300, Jason Gunthorpe wrote:
> On Tue, Oct 15, 2024 at 02:41:24PM +0200, Thomas Hellstr=C3=B6m wrote:
> > > It has nothing to do with kernel P2P, you are just allowing more
> > > selective filtering of dev_private_owner. You should focus on
> > > that in
> > > the naming, not p2p. ie allow_dev_private()
> > >=20
> > > P2P is stuff that is dealing with MEMORY_DEVICE_PCI_P2PDMA.
> >=20
> > Yes, although the intention was to incorporate also other fast
> > interconnects in "P2P", not just "PCIe P2P", but I'll definitely
> > take a
> > look at the naming.
>=20
> It has nothing to do with that, you are just filtering the device
> private pages differently than default.
>=20
> Your end use might be P2P, but at this API level it certainly is not.

Sure. Will find something more suitable.

>=20
> > > This is just allowing more instances of the same driver to co-
> > > ordinate
> > > their device private memory handle, for whatever purpose.
> >=20
> > Exactly, or theoretically even cross-driver.
>=20
> I don't want to see things like drivers changing their pgmap handles
> privately somehow. If we are going to make it cross driver then it
> needs to be generalized alot more.

Cross-driver is initially not a thing, so let's worry about that later.
My impression though is that this is the only change required for
hmm_range_fault() and that infrastructure for opt-in and dma-mapping
would need to be provided elsewhere?

>=20
> > >=20
> > > Otherwise I don't see a particular problem, though we have talked
> > > about widening the matching for device_private more broadly using
> > > some
> > > kind of grouping tag or something like that instead of a
> > > callback.
> > > You
> > > may consider that as an alternative
> >=20
> > Yes. Looked at that, but (if I understand you correctly) that would
> > be
> > the case mentioned in the commit message where the group would be
> > set
> > up statically at dev_pagemap creation time?
>=20
> Not necessarily statically, but the membership would be stored in the
> pagemap and by updated during hotplug/etc
>=20
> If this is for P2P then the dynamic behavior is pretty limited, some
> kind of NxN bitmap.
>=20
> > > hmm_range struct inside a caller private data struct and use that
> > > instead if inventing a whole new struct and pointer.
> >=20
> > Our first attempt was based on that but then that wouldn't be
> > reusable
> > in the migrate_device.c code. Hence the extra indirection.
>=20
> It is performance path, you should prefer duplication rather than
> slowing it down..

OK. Will look at duplicating.

Thanks,
Thomas


>=20
> Jason

