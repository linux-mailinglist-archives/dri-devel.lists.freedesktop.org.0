Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2757686E2A4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 14:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D82710EE4B;
	Fri,  1 Mar 2024 13:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldBsESTQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EC810EE4B;
 Fri,  1 Mar 2024 13:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709300723; x=1740836723;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4YtlJquLK3r30K1/gKLDRr1A7h+Uz1zkg3ivJnRnqUY=;
 b=ldBsESTQq8zI7P23h1al1mmD7sFWxeB3dLKkyqX8zvILUpY0H99sZct+
 33dknkzP9oIe9BmycmCJRDuflTv9K/+C2B/xh3vVLqhIlo4PzTfA/CwtR
 YL1EuM47rH7JCaipSwY06gFpUFoawGstuGXTA0PqZ4j/QEttmp+6+TGLL
 K8sfz0bCVc3La3LJDTiem/rGEhI/HpDCKhcEaGY/xWWshArTWnI8VqjfK
 zG0rNFkNQy67wuKQLlHsfMvr4R+QPKys+XnYERecWso9fVb9t+Op8lLfS
 f2nqWCXx9dw5bGeN1d79m8woCHTi4lU5va4lWVVYLlUahzbjVFWsWkURw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14479938"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; d="scan'208";a="14479938"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 05:45:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8623177"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.26])
 ([10.249.254.26])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 05:45:21 -0800
Message-ID: <f00b415e437f0a7955ca6759c30bdf0d3444e21f.camel@linux.intel.com>
Subject: Re: [PATCH 0/4] TTM unlockable restartable LRU list iteration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org, intel-gfx@list.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Date: Fri, 01 Mar 2024 14:45:18 +0100
In-Reply-To: <c2e29b31a1654625ef316264e2335a0158b3a228.camel@linux.intel.com>
References: <20240216131306.101932-1-thomas.hellstrom@linux.intel.com>
 <29000a0d-19ce-4727-945b-d5734313c7f1@amd.com>
 <47fc8e42dcfd868341ffc32754c302e58ac49484.camel@linux.intel.com>
 <c4f85901-1461-42e4-8db1-49877837e398@amd.com>
 <c2e29b31a1654625ef316264e2335a0158b3a228.camel@linux.intel.com>
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

On Thu, 2024-02-29 at 18:34 +0100, Thomas Hellstr=C3=B6m wrote:
> Hi, Christian.
>=20
> Thanks for having a look.
>=20
> On Thu, 2024-02-29 at 16:08 +0100, Christian K=C3=B6nig wrote:
> > Am 16.02.24 um 15:20 schrieb Thomas Hellstr=C3=B6m:
> > [SNIP]
> > > > My approach was basically to not only lock the current BO, but
> > > > also
> > > > the
> > > > next one. Since only a locked BO can move on the LRU we
> > > > effectively
> > > > created an anchor.
> > > >=20
> > > > Before I dig into the code a couple of questions:
> > > These are described in the patches but brief comments inline.
> > >=20
> > > > 1. How do you distinct BOs and iteration anchors on the LRU?
> > > Using a struct ttm_lru_item, containing a struct list_head and
> > > the
> > > type. List nodes embeds this instead of a struct list_head. This
> > > is
> > > larger than the list head but makes it explicit what we're doing.
> >=20
> > Need to look deeper into the code of this, but it would be nice if
> > we
> > could abstract that better somehow.
>=20
> Do you have any specific concerns or improvements in mind? I think
> patch 1 and 2 are pretty straigthforward. Patch 3 is indeed a bit
> hairy.
>=20
> >=20
> > > > 2. How do you detect that a bulk list moved on the LRU?
> > > An age u64 counter on the bulk move that we're comparing against.
> > > It's
> > > updated each time it moves.
> > >=20
> > >=20
> > > > 3. How do you remove the iteration anchors from the bulk list?
> > > A function call at the end of iteration, that the function
> > > iterating is
> > > requried to call.
> >=20
> > Thinking quite a bit about that in the last week and I came to the=20
> > conclusion that this might be overkill.
> >=20
> > All BOs in a bulk share the same reservation object. So when you=20
> > acquired one you can just keep the dma-resv locked even after
> > evicting=20
> > the BO.
> >=20
> > Since moving BOs requires locking the dma-resv object the whole
> > problem=20
> > then just boils down to a list_for_each_element_safe().
> >=20
> > That's probably a bit simpler than doing the add/remove dance.
>=20
> I think the problem with the "lock the next object" approach is that
> there are situations that it might not work. First, where not
> asserting
> anywhere that all bulk move resource have the same lock, and after
> individualization they certainly don't. (I think I had a patch
> somewhere to try to enforce that, but I don't think it ever got
> reviewed). I tried to sort out the locking rules at one point for
> resources switching bos to ghost object but I long since forgot
> those.
>=20
> I guess it all boils down to the list elements being resources, not
> bos.
>=20
> Also I'm concerned about keeping a resv held for a huge number of
> evictions will block out a higher priority ticket for a substantial
> amount of time.
>=20
> I think while the suggested solution here might be a bit of an
> overkill, it's simple enough to understand, but the locking
> implications of resources switching resvs arent.
>=20
> But please let me know how we should proceed here. This is a blocker
> for other pending work we have.

Actually some more issues with the locking approach would be with the
intended use-cases I was planning to use this for.

For example the exhaustive eviction where we regularly unlock the
lru_lock to take the bo lock. If we need to do that for the first
element of a bulk_move list, we can't have the bo lock of the next
element when we unlock the list. For part of the list that is not a
bulk sublist, this also doesn't work AFAICT.

And finally for the tt shinking that's been pending for quite some
time, the last comment that made me temporarily shelf is was that we
should expose the lru traversal to the drivers, and the drivers
implement the shrinkers with TTM helpers, rather than having TTM being
the middle layer. So I think exposing the LRU traversal to drivers will
probably end up having pretty weird semantics if it sometimes locks or
requiring locking of the next object while traversing.

But regardless of how this is solved, since I think we are agreeing
that the functionality itself is useful and needed, could we perhaps
use this implementation that is easy to verify that it works, and I
will i no way stand in the way if it turns out you come up with
something nicer. I've been thinking a bit of how to make a better
approach out of patch 3, and a possible alternative that I could
prototype would be to register list cursors that traverse a bulk
sublist with the bulk move structure using a list. At destruction of
either list cursors or bulk moves either can unregister, and on bulk
list bumping the list is traversed and the cursor is moved to the end
of the list. Probably the same amount of code but will look nicer.

/Thomas


>=20
> /Thomas
>=20
>=20
>=20
> >=20
> > Regards,
> > Christian.
> >=20
> > >=20
> > >=20
> > > /Thomas
> > >=20
> > > > Regards,
> > > > Christian.
> > > >=20
> > > > > The restartable property is used in patch 4 to restart
> > > > > swapout
> > > > > if
> > > > > needed, but the main purpose is this paves the way for
> > > > > shrinker- and exhaustive eviction.
> > > > >=20
> > > > > Cc: Christian K=C3=B6nig<christian.koenig@amd.com>
> > > > > Cc:<dri-devel@lists.freedesktop.org>
> > > > >=20
> > > > > Thomas Hellstr=C3=B6m (4):
> > > > > =C2=A0=C2=A0=C2=A0 drm/ttm: Allow TTM LRU list nodes of different=
 types
> > > > > =C2=A0=C2=A0=C2=A0 drm/ttm: Use LRU hitches
> > > > > =C2=A0=C2=A0=C2=A0 drm/ttm: Consider hitch moves within bulk subl=
ist moves
> > > > > =C2=A0=C2=A0=C2=A0 drm/ttm: Allow continued swapout after -ENOSPC=
 falure
> > > > >=20
> > > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_device.c=C2=A0=C2=A0 |=C2=A0=
 33 +++--
> > > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_resource.c | 202
> > > > > +++++++++++++++++++++++-
> > > > > -----
> > > > > =C2=A0=C2=A0 include/drm/ttm/ttm_resource.h=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 91 +++++++++++--
> > > > > =C2=A0=C2=A0 4 files changed, 267 insertions(+), 60 deletions(-)
> > > > >=20
>=20

