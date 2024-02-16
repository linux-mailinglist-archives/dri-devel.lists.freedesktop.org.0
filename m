Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5631857F2A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 15:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B36110E967;
	Fri, 16 Feb 2024 14:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WUr3K5Zu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A184910E26B;
 Fri, 16 Feb 2024 14:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708093261; x=1739629261;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ykg37I/qJvwz9QoLSQSS9kzALaE+IdnEw+jxJXYs1Zk=;
 b=WUr3K5ZuhmJF7JYSTgArSq8AI3y/Hx3nt2rt+tKs2jU2eZUWOujbzJ1A
 z3eTWl+lyzKdZQ6iTrEE58B3VexreJNwB+wHlQc2LP26auel38RWXWLGN
 vgbKfbaVL92Eh5mJAY6fZaPsFlKMdErMT/7AVYkcpl5i2nyvcb9lAo+iR
 gseeGzox7v901fif4Xmb5PLPadYPF9SJAfyvm6V76zykqYMOJYbVyxbJ6
 pRzbj+t2yMlZ5xnf5Q/aFyJ6sI9p/UxqyCj59pFOn01rVqN7VpBJgy8t4
 NWJ41JSgG14aBJD/fKiBvYEOR/j3nnmwgSh45FRjMA9sYThaG+Qqdu1oe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2127720"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2127720"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 06:21:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="935853767"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; d="scan'208";a="935853767"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO [10.249.254.121])
 ([10.249.254.121])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 06:20:58 -0800
Message-ID: <47fc8e42dcfd868341ffc32754c302e58ac49484.camel@linux.intel.com>
Subject: Re: [PATCH 0/4] TTM unlockable restartable LRU list iteration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org, intel-gfx@list.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Date: Fri, 16 Feb 2024 15:20:56 +0100
In-Reply-To: <29000a0d-19ce-4727-945b-d5734313c7f1@amd.com>
References: <20240216131306.101932-1-thomas.hellstrom@linux.intel.com>
 <29000a0d-19ce-4727-945b-d5734313c7f1@amd.com>
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

On Fri, 2024-02-16 at 15:00 +0100, Christian K=C3=B6nig wrote:
> Am 16.02.24 um 14:13 schrieb Thomas Hellstr=C3=B6m:
> > This patch-set is a prerequisite for a standalone TTM shrinker
> > and for exhaustive TTM eviction using sleeping dma_resv locks,
> > which is the motivation it.
> >=20
> > Currently when unlocking the TTM lru list lock, iteration needs
> > to be restarted from the beginning, rather from the next LRU list
> > node. This can potentially be a big problem, because if eviction
> > or shrinking fails for whatever reason after unlock, restarting
> > is likely to cause the same failure over and over again.
>=20
> Oh, yes please. I have been working on that problem before as well,
> but=20
> wasn't able to come up with something working.
>=20
> > There are various schemes to be able to continue the list
> > iteration from where we left off. One such scheme used by the
> > GEM LRU list traversal is to pull items already considered off
> > the LRU list and reinsert them when iteration is done.
> > This has the drawback that concurrent list iteration doesn't see
> > the complete list (which is bad for exhaustive eviction) and also
> > doesn't lend itself well to bulk-move sublists since these will
> > be split in the process where items from those lists are
> > temporarily pulled from the list and moved to the list tail.
>=20
> Completely agree that this is not a desirable solution.
>=20
> > The approach taken here is that list iterators insert themselves
> > into the list next position using a special list node. Iteration
> > is then using that list node as starting point when restarting.
> > Concurrent iterators just skip over the special list nodes.
> >=20
> > This is implemented in patch 1 and 2.
> >=20
> > For bulk move sublist the approach is the same, but when a bulk
> > move sublist is moved to the tail, the iterator is also moved,
> > causing us to skip parts of the list. That is undesirable.
> > Patch 3 deals with that, and when iterator detects it is
> > traversing a sublist, it inserts a second restarting point just
> > after the sublist and if the sublist is moved to the tail,
> > it just uses the second restarting point instead.
> >=20
> > This is implemented in patch 3.
>=20
> Interesting approach, that is probably even better than what I tried.
>=20
> My approach was basically to not only lock the current BO, but also
> the=20
> next one. Since only a locked BO can move on the LRU we effectively=20
> created an anchor.
>=20
> Before I dig into the code a couple of questions:
These are described in the patches but brief comments inline.

> 1. How do you distinct BOs and iteration anchors on the LRU?
Using a struct ttm_lru_item, containing a struct list_head and the
type. List nodes embeds this instead of a struct list_head. This is
larger than the list head but makes it explicit what we're doing.
=20

> 2. How do you detect that a bulk list moved on the LRU?
An age u64 counter on the bulk move that we're comparing against. It's
updated each time it moves.


> 3. How do you remove the iteration anchors from the bulk list?
A function call at the end of iteration, that the function iterating is
requried to call.


/Thomas

>=20
> Regards,
> Christian.
>=20
> >=20
> > The restartable property is used in patch 4 to restart swapout if
> > needed, but the main purpose is this paves the way for
> > shrinker- and exhaustive eviction.
> >=20
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> >=20
> > Thomas Hellstr=C3=B6m (4):
> > =C2=A0=C2=A0 drm/ttm: Allow TTM LRU list nodes of different types
> > =C2=A0=C2=A0 drm/ttm: Use LRU hitches
> > =C2=A0=C2=A0 drm/ttm: Consider hitch moves within bulk sublist moves
> > =C2=A0=C2=A0 drm/ttm: Allow continued swapout after -ENOSPC falure
> >=20
> > =C2=A0 drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 1 +
> > =C2=A0 drivers/gpu/drm/ttm/ttm_device.c=C2=A0=C2=A0 |=C2=A0 33 +++--
> > =C2=A0 drivers/gpu/drm/ttm/ttm_resource.c | 202 +++++++++++++++++++++++=
-
> > -----
> > =C2=A0 include/drm/ttm/ttm_resource.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9=
1 +++++++++++--
> > =C2=A0 4 files changed, 267 insertions(+), 60 deletions(-)
> >=20
>=20

