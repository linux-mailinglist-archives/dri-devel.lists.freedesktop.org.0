Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A2198D236
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 13:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EA510E169;
	Wed,  2 Oct 2024 11:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGPHXqNl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14AD10E169
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 11:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727868645; x=1759404645;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Ii57V6s04RVmr4Qq5kwHL9Xo9uaD7OUoDmreuJ38I5w=;
 b=SGPHXqNl5Fu5wNWstH15lRAg2rUKPjU2dspjZThyqWldKvLlYh9WczF4
 AHn+LWj8d+wbOzgNzS3p1eA+wcrT0tNU+1/Bpdh8sggOOZBG+fJ5ZQX0m
 +5k4WBn7HcibkijOynfJ5fdSVtOW5k560Cnxf6n9hmchbuO2IYMtmT8pp
 46KX5a9O4Z5fblfF3qbRsFhY+v1lXxejXi41KaqRg+9xGlZZ9uJKZAsGt
 7zWgqXA3gAkiyRLWwQw2bs9Izv35FvO14BIxcI8WZcuf9MXfPDfJzbaqn
 6qh68x0f0Qk1l2uHQF02xfIeRhjhhTq4GeWQ+R7D5GdQ/kkh/1nVrmJvS g==;
X-CSE-ConnectionGUID: KTajq1hGR5ySe7sZLCwcCA==
X-CSE-MsgGUID: V2PPuwqAQU28YnAh3KIkOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="37694961"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="37694961"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 04:30:45 -0700
X-CSE-ConnectionGUID: T273YAqRQo67o3Ubu+qBkQ==
X-CSE-MsgGUID: DWDhyWoJT+2IYj6QaChD5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74208937"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.67])
 ([10.245.244.67])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 04:30:43 -0700
Message-ID: <4966db2ca3009967de47af018c3e10a30dbacd08.camel@linux.intel.com>
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Date: Wed, 02 Oct 2024 13:30:30 +0200
In-Reply-To: <4c634e5c1bd9907f315d8b3535ebb6154819d5ea.camel@linux.intel.com>
References: <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
 <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
 <ZscDox5KoiNHXxne@phenom.ffwll.local>
 <3afe3ab2-4a58-49a9-acd7-c989980c68f2@amd.com>
 <Zs4EPT1DR7OrE5X-@phenom.ffwll.local> <Zs4Ss8LJ-n9NbBcb@phenom.ffwll.local>
 <c890ecbf-e7eb-479d-bb54-807edd1f66e6@amd.com>
 <ZtWca-cpqUsE8WTZ@phenom.ffwll.local>
 <4c634e5c1bd9907f315d8b3535ebb6154819d5ea.camel@linux.intel.com>
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

Hi, Christian,

Ping? Can i get an ack to proceed with this?

Thanks,
Thomas



On Wed, 2024-09-18 at 14:57 +0200, Thomas Hellstr=C3=B6m wrote:
> Sima, Christian
>=20
> I've updated the shrinker series now with a guarded for_each macro
> instead:
>=20
> https://patchwork.freedesktop.org/patch/614514/?series=3D131815&rev=3D9
>=20
> (Note I forgot to remove the export of the previous LRU walker).
>=20
> =C2=A0so the midlayer argument is now not an issue anymore. The cleanup.h
> guard provides some additional protection against drivers exiting the
> LRU loop early.
>=20
> So remaining is the question whether the driver is allowed to discard
> a
> suggested bo to shrink from TTM.
>=20
> Arguments for:
>=20
> 1) Not allowing that would require teaching TTM about purgeable
> objects.
> 2) Devices who need the blitter during shrinking would want to punt
> runtime_pm_get() to kswapd to avoid sleeping direct reclaim.
> 3) If those devices end up blitting (LNL) to be able to shrink, they
> would want to punt waiting for the fence to signal to kswapd to avoid
> waiting in direct reclaim.
> 4) It looks like we need to resort to folio_trylock in the shmem
> backup
> backend when shrinking is called for gfp_t =3D GFP_NOFS. A failing
> trylock will require a new bo.
>=20
> Arguments against:
> None really. I thought the idea of demidlayering would be to allow
> the
> driver more freedom.
>=20
> So any feedback appreciated. If that is found acceptable we can
> proceed
> with reviewing this patch and also with the shrinker series.
>=20
> Thanks,
> Thomas
>=20
>=20
> On Mon, 2024-09-02 at 13:07 +0200, Daniel Vetter wrote:
> > On Wed, Aug 28, 2024 at 02:20:34PM +0200, Christian K=C3=B6nig wrote:
> > > Am 27.08.24 um 19:53 schrieb Daniel Vetter:
> > > > On Tue, Aug 27, 2024 at 06:52:13PM +0200, Daniel Vetter wrote:
> > > > > On Thu, Aug 22, 2024 at 03:19:29PM +0200, Christian K=C3=B6nig
> > > > > wrote:
> > > > > > Completely agree that this is complicated, but I still
> > > > > > don't
> > > > > > see the need
> > > > > > for it.
> > > > > >=20
> > > > > > Drivers just need to use pm_runtime_get_if_in_use() inside
> > > > > > the shrinker and
> > > > > > postpone all hw activity until resume.
> > > > > Not good enough, at least long term I think. Also postponing
> > > > > hw
> > > > > activity
> > > > > to resume doesn't solve the deadlock issue, if you still need
> > > > > to grab ttm
> > > > > locks on resume.
> > > > Pondered this specific aspect some more, and I think you still
> > > > have a race
> > > > here (even if you avoid the deadlock): If the condiditional
> > > > rpm_get call
> > > > fails there's no guarantee that the device will suspend/resume
> > > > and clean
> > > > up the GART mapping.
> > >=20
> > > Well I think we have a major disconnect here. When the device is
> > > powered
> > > down there is no GART mapping to clean up any more.
> > >=20
> > > In other words GART is a table in local memory (VRAM) when the
> > > device is
> > > powered down this table is completely destroyed. Any BO which was
> > > mapped
> > > inside this table is now not mapped any more.
> > >=20
> > > So when the shrinker wants to evict a BO which is marked as
> > > mapped
> > > to GART
> > > and the device is powered down we just skip the GART unmapping
> > > part
> > > because
> > > that has already implicitly happened during power down.
> > >=20
> > > Before mapping any BO into the GART again we power the GPU up
> > > through the
> > > runtime PM calls. And while powering it up again the GART is
> > > restored.
> >=20
> > My point is that you can't tell whether the device will power down
> > or
> > not,
> > you can only tell whether there's a chance it might be powering
> > down
> > and
> > so you can't get at the rpm reference without deadlock issues.
> >=20
> > > > The race gets a bit smaller if you use
> > > > pm_runtime_get_if_active(), but even then you might catch it
> > > > right when
> > > > resume almost finished.
> > >=20
> > > What race are you talking about?
> > >=20
> > > The worst thing which could happen is that we restore a GART
> > > entry
> > > which
> > > isn't needed any more, but that is pretty much irrelevant since
> > > we
> > > only
> > > clear them to avoid some hw bugs.
> >=20
> > The race I'm seeing is where you thought the GART entry is not
> > issue,
> > tossed an object, but the device didn't suspend, so might still use
> > it.
> >=20
> > I guess if we're clearly separating the sw allocation of the TTM_TT
> > with
> > the physical entries in the GART that should all work, but feels a
> > bit
> > tricky. The race I've seen is essentially these two getting out of
> > sync.
> >=20
> > So maybe it was me who's stuck.
> >=20
> > What I wonder is whether it works in practice, since on the restore
> > side
> > you need to get some locks to figure out which gart mappings exist
> > and
> > need restoring. And that's the same locks as the shrinker needs to
> > figure
> > out whether it might need to reap a gart mapping.
> >=20
> > Or do you just copy the gart entries over and restore them exactly
> > as-is,
> > so that there's no shared locks?
> >=20
> > > > That means we'll have ttm bo hanging around with GART
> > > > allocations/mappings
> > > > which aren't actually valid anymore (since they might escape
> > > > the
> > > > cleanup
> > > > upon resume due to the race). That doesn't feel like a solid
> > > > design
> > > > either.
> > >=20
> > > I'm most likely missing something, but I'm really scratching my
> > > head where
> > > you see a problem here.
> >=20
> > I guess one issue is that at least traditionally, igfx drivers have
> > nested
> > runtime pm within dma_resv lock. And dgpu drivers the other way
> > round.
> > Which is a bit awkward if you're trying for common code.
> >=20
> > Cheers, Sima
>=20

