Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E4B86D0C4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 18:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31ABF10E49D;
	Thu, 29 Feb 2024 17:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3jK5BaE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B663810E49D;
 Thu, 29 Feb 2024 17:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709228082; x=1740764082;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FjDDGDdUpYxiJd/WwLLEmIR+gp3oS/ZEnUYu0d6wNCE=;
 b=R3jK5BaEkTm0k+WiwBpxBm/68SGLv+69QmIQOcyQz5O8BF4LJerlgYmu
 ImcXVXw/Za2crWNuZJphaZuefcimMFBTpxcgvxNyP/mtFk3ehvLUF3FWl
 tXmB43vgBpkUVqSPrBUx04DV05j3ZsbUaEfdeAdBkW4wbpPnp7/D6lRfN
 MY/MTwaLhXMLoNWMWibvZsWfJ4t7mdMgKB6hQ+cB8F1a+8H5ysrWJZU6W
 L6I4Yf1xVmMMoUOV6AZWhl3SMpAwU/W5Q/tdqKEEpvw35BnWF1Rtz1dml
 g5qlydTLI9Fq/aeaYG7zPoSHLLPXCP75E/FCLkSkMwk/D64bnBFsISWrr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3586159"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3586159"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 09:34:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7821659"
Received: from srdoo-mobl1.ger.corp.intel.com (HELO [10.252.3.93])
 ([10.252.3.93])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 09:34:26 -0800
Message-ID: <c2e29b31a1654625ef316264e2335a0158b3a228.camel@linux.intel.com>
Subject: Re: [PATCH 0/4] TTM unlockable restartable LRU list iteration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org, intel-gfx@list.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Date: Thu, 29 Feb 2024 18:34:23 +0100
In-Reply-To: <c4f85901-1461-42e4-8db1-49877837e398@amd.com>
References: <20240216131306.101932-1-thomas.hellstrom@linux.intel.com>
 <29000a0d-19ce-4727-945b-d5734313c7f1@amd.com>
 <47fc8e42dcfd868341ffc32754c302e58ac49484.camel@linux.intel.com>
 <c4f85901-1461-42e4-8db1-49877837e398@amd.com>
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

Thanks for having a look.

On Thu, 2024-02-29 at 16:08 +0100, Christian K=C3=B6nig wrote:
> Am 16.02.24 um 15:20 schrieb Thomas Hellstr=C3=B6m:
> [SNIP]
> > > My approach was basically to not only lock the current BO, but
> > > also
> > > the
> > > next one. Since only a locked BO can move on the LRU we
> > > effectively
> > > created an anchor.
> > >=20
> > > Before I dig into the code a couple of questions:
> > These are described in the patches but brief comments inline.
> >=20
> > > 1. How do you distinct BOs and iteration anchors on the LRU?
> > Using a struct ttm_lru_item, containing a struct list_head and the
> > type. List nodes embeds this instead of a struct list_head. This is
> > larger than the list head but makes it explicit what we're doing.
>=20
> Need to look deeper into the code of this, but it would be nice if we
> could abstract that better somehow.

Do you have any specific concerns or improvements in mind? I think
patch 1 and 2 are pretty straigthforward. Patch 3 is indeed a bit
hairy.

>=20
> > > 2. How do you detect that a bulk list moved on the LRU?
> > An age u64 counter on the bulk move that we're comparing against.
> > It's
> > updated each time it moves.
> >=20
> >=20
> > > 3. How do you remove the iteration anchors from the bulk list?
> > A function call at the end of iteration, that the function
> > iterating is
> > requried to call.
>=20
> Thinking quite a bit about that in the last week and I came to the=20
> conclusion that this might be overkill.
>=20
> All BOs in a bulk share the same reservation object. So when you=20
> acquired one you can just keep the dma-resv locked even after
> evicting=20
> the BO.
>=20
> Since moving BOs requires locking the dma-resv object the whole
> problem=20
> then just boils down to a list_for_each_element_safe().
>=20
> That's probably a bit simpler than doing the add/remove dance.

I think the problem with the "lock the next object" approach is that
there are situations that it might not work. First, where not asserting
anywhere that all bulk move resource have the same lock, and after
individualization they certainly don't. (I think I had a patch
somewhere to try to enforce that, but I don't think it ever got
reviewed). I tried to sort out the locking rules at one point for
resources switching bos to ghost object but I long since forgot those.

I guess it all boils down to the list elements being resources, not
bos.

Also I'm concerned about keeping a resv held for a huge number of
evictions will block out a higher priority ticket for a substantial
amount of time.

I think while the suggested solution here might be a bit of an
overkill, it's simple enough to understand, but the locking
implications of resources switching resvs arent.

But please let me know how we should proceed here. This is a blocker
for other pending work we have.

/Thomas



>=20
> Regards,
> Christian.
>=20
> >=20
> >=20
> > /Thomas
> >=20
> > > Regards,
> > > Christian.
> > >=20
> > > > The restartable property is used in patch 4 to restart swapout
> > > > if
> > > > needed, but the main purpose is this paves the way for
> > > > shrinker- and exhaustive eviction.
> > > >=20
> > > > Cc: Christian K=C3=B6nig<christian.koenig@amd.com>
> > > > Cc:<dri-devel@lists.freedesktop.org>
> > > >=20
> > > > Thomas Hellstr=C3=B6m (4):
> > > > =C2=A0=C2=A0=C2=A0 drm/ttm: Allow TTM LRU list nodes of different t=
ypes
> > > > =C2=A0=C2=A0=C2=A0 drm/ttm: Use LRU hitches
> > > > =C2=A0=C2=A0=C2=A0 drm/ttm: Consider hitch moves within bulk sublis=
t moves
> > > > =C2=A0=C2=A0=C2=A0 drm/ttm: Allow continued swapout after -ENOSPC f=
alure
> > > >=20
> > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_device.c=C2=A0=C2=A0 |=C2=A0 3=
3 +++--
> > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_resource.c | 202
> > > > +++++++++++++++++++++++-
> > > > -----
> > > > =C2=A0=C2=A0 include/drm/ttm/ttm_resource.h=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 91 +++++++++++--
> > > > =C2=A0=C2=A0 4 files changed, 267 insertions(+), 60 deletions(-)
> > > >=20

