Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DBC94D014
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 14:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F80010E8EB;
	Fri,  9 Aug 2024 12:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXu5ryZo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9270C10E8E9;
 Fri,  9 Aug 2024 12:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723206145; x=1754742145;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yD/9wUMtARNHtVh7lntB0IHDxIHqdGuSnTTStz61Zpk=;
 b=AXu5ryZoYQg+OnK5WwbxPuR7t0awXyTHgghlOdsx45uwJtU6YtslRg7t
 67ADZOjWj5EJ8UHvXjqsOpOooGAZSZjNFkB6kvCo2mXvct9kh4ghMokuz
 4/kki+UYQMr7sL9Jn/y9XtbG1r2vWHzdJH2if/ROUnMzdG5zBcASljCsY
 h2QfFZB8fb3Wf+05uzJxFi9/NaDP6B/rMTUb31NDNy+DPtvfv10DmdAKj
 VZ/VGLJkEYhjuCbPJGLmTaQJIXcBoOh8agTFzpTq1rdYbqS3wwHkkG9v2
 vCTZcx07+glufWSLx8Hz0rtHCrf29mUgkqm90Yl+8rRoeGELPTtsYNUDw g==;
X-CSE-ConnectionGUID: VoWwvx2aQ2SH6zBdd8dR+Q==
X-CSE-MsgGUID: Puo559JvQHyJnX+PMgijow==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43892586"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="43892586"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 05:22:24 -0700
X-CSE-ConnectionGUID: BIdgAd/0SYKulO0hGREiyw==
X-CSE-MsgGUID: nR7r0OW2QGueyghdCPrdFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57513484"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.245.150])
 ([10.245.245.150])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 05:22:22 -0700
Message-ID: <bd2122fd8832126cf2be9317a724b8a9aa9b5966.camel@linux.intel.com>
Subject: Re: [PATCH v6 12/12] drm/xe: Increase the XE_PL_TT watermark
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "Amaranath.Somalapuram@amd.com"
 <Amaranath.Somalapuram@amd.com>
Date: Fri, 09 Aug 2024 14:22:19 +0200
In-Reply-To: <ZrP/m+QTXBK6OKjp@DUT025-TGLU.fm.intel.com>
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-13-thomas.hellstrom@linux.intel.com>
 <a9973e37fc9c81046ce5f32a13f5e8eb50d90935.camel@intel.com>
 <ZrP/m+QTXBK6OKjp@DUT025-TGLU.fm.intel.com>
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

On Wed, 2024-08-07 at 23:13 +0000, Matthew Brost wrote:
> On Mon, Aug 05, 2024 at 12:35:34PM -0600, Souza, Jose wrote:
> > On Wed, 2024-07-03 at 17:38 +0200, Thomas Hellstr=C3=B6m wrote:
> > > The XE_PL_TT watermark was set to 50% of system memory.
> > > The idea behind that was unclear since the net effect is that
> > > TT memory will be evicted to TTM_PL_SYSTEM memory if that
> > > watermark is exceeded, requiring PPGTT rebinds and dma
> > > remapping. But there is no similar watermark for TTM_PL_SYSTEM
> > > memory.
> > >=20
> > > The TTM functionality that tries to swap out system memory to
> > > shmem objects if a 50% limit of total system memory is reached
> > > is orthogonal to this, and with the shrinker added, it's no
> > > longer in effect.
> > >=20
> > > Replace the 50% TTM_PL_TT limit with a 100% limit, in effect
> > > allowing all graphics memory to be bound to the device unless it
> > > has been swapped out by the shrinker.
> >=20
> > Sorry if I missed some patch changing it but I did not found in
> > this series anything changing the 50% limit in ttm_global_init().
> > When I debugged some Vulkan tests allocate a lot of memory, the
> > reason that KMD was not allocating memory wash this ttm_global
> > limit that is shared
> > with all devices using TTM.
> >=20
>=20
> I'm reviewing this series and starting make sense of all this.
>=20
> Thomas please correct me if I'm wrong here...
>=20
> The limit set in ttm_global_init is the watermark for the TTM pool
> where
> if exceeded upon freeing a BO's pages the pages are actually freed
> rather than just returning to the TTM pool cache. The global
> watermark
> is reason why in issue #2438 it observed a bunch of memory is still
> consumed when nothing is running or any BOs exist - pages are being
> cached in the TTM pool.=C2=A0

This is correct.



> The global watermark doesn't actually limit the
> amount system memory TTM can allocate. A shrinker also exists which
> can
> free cached pages in the TTM pool if memory pressure exists or 'echo
> 3 >
> /proc/sys/vm/drop_caches' is done.

Yes, this is also true except the global watermark should be called the
pool watermark.

There is another global watermark that, if the amount of pages used for
graphics (PL_SYSTEM or PL_TT) exceeds 50% of system, bo swapping
starts. That means bos are pulled of the various LRU lists in a device
round-robin fashion and moved to shmem objects, in the anticipation
that theses shmem objects can then be paged out to disc by the core.
However, this is done even if there is no disc swap-space attached.
Also if this shmem swapping fails, nothing happens but the allocation
is free to proceed anyway.

This is what I typically refer to as the global watermark. It used to
be implemented by an opportunistic swapper process (similar to kswapd)
and a direct swapper (similar to direct reclaim) and the 50% limit was
configurable, but much of that functionality was ripped out. I didn't
follow the discussion preceding that change, though.


>=20
> The watermark changed in this patch, is the actual limit for the
> number
> of pages we can allocate for BOs.

What is changed in this patch is actually the amount to memory we can
have in the TT placement and therefore also bound to the device. If
this limit is exceeded, eviction from TT to SYSTEM will take place in
addition to the above global swapping. This limit is per device. So now
we can in theory have all of system bound to a device.

>  With a shrinker hooked into BOs, we
> now can freely allocate all of the system pages for BOs and if memory
> pressure exists idle BOs pages are swapped to shmem via the shrinker
> and
> restored upon next GPU use.

Exactly.

>=20
> Matt

/Thomas

>=20
> > >=20
> > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 3 +--
> > > =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > > b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > > index 9844a8edbfe1..d38b91872da3 100644
> > > --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > > +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > > @@ -108,9 +108,8 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
> > > =C2=A0	u64 gtt_size;
> > > =C2=A0
> > > =C2=A0	si_meminfo(&si);
> > > +	/* Potentially restrict amount of TT memory here. */
> > > =C2=A0	gtt_size =3D (u64)si.totalram * si.mem_unit;
> > > -	/* TTM limits allocation of all TTM devices by 50% of
> > > system memory */
> > > -	gtt_size /=3D 2;
> > > =C2=A0
> > > =C2=A0	man->use_tt =3D true;
> > > =C2=A0	man->func =3D &xe_ttm_sys_mgr_func;
> >=20

