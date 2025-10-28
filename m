Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF23C13BAD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 10:11:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875FC10E092;
	Tue, 28 Oct 2025 09:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITQqy6/Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC37510E092;
 Tue, 28 Oct 2025 09:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761642684; x=1793178684;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SbtS89F7kgaWkqJrwSHKc6bb8nWOT8MAyKjca/+SfU8=;
 b=ITQqy6/QzvhkcfkXB8p/wjGCsHipzpyXimphWirEbaBVuDoDecgdO380
 Y0juqkYVgSq7ZRBO+D0Jn/xt7/ypnxJoCBMlUFyStIEEYX84EaZ8Qq5D7
 cME+RSn53qIRfEew1n0GsQLNufciPovh4RESgP9ZWKz6ULvemWZ1TTTQQ
 988lBwWxCbfrdyAxlg4lj5FJwEfNipZspzux5KD1JuLpNbrkXZbAlNh+B
 TbxO7nzN0KQGHeaY2g4eZGBvsQDnZenfrLW7j148rFLJUpOSo70VKg3Pf
 agcUTBMSMQy7EmT/c5sTAdBh8OnZjM/pF5xxo3XHMPp0akXftB3SDQBGO g==;
X-CSE-ConnectionGUID: fmK0O/ONSV6YMbLF10nmww==
X-CSE-MsgGUID: 7yB+G52bQ8OzmyQsMVpI9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66353619"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="66353619"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 02:11:23 -0700
X-CSE-ConnectionGUID: tZG5mQ6MRZmdxcpqP+Zvsg==
X-CSE-MsgGUID: +LuVUFJpSp663YtNkh9Suw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="185381135"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.244.149])
 ([10.245.244.149])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 02:11:21 -0700
Message-ID: <aa2638b6324ea7162f4f1a2e867f36df6da413f7.camel@linux.intel.com>
Subject: Re: [PATCH 15/15] drm/xe: Retry migration once
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, dakr@kernel.org,
 "Mrozek, Michal"	 <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Date: Tue, 28 Oct 2025 10:11:18 +0100
In-Reply-To: <aQAKsw5nd+WVNLu+@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-16-thomas.hellstrom@linux.intel.com>
 <aQAKsw5nd+WVNLu+@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

Hi, Matt

On Mon, 2025-10-27 at 17:13 -0700, Matthew Brost wrote:
> On Sat, Oct 25, 2025 at 02:04:12PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Data present in foreign device memory may cause migration to fail.
> > For now, retry once after first migrating to system.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_svm.c | 19 +++++++++++++++----
> > =C2=A01 file changed, 15 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 9814f95cb212..41e075aa015c 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -1529,13 +1529,24 @@ struct drm_pagemap
> > *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
> > =C2=A0int xe_svm_alloc_vram(struct xe_svm_range *range, const struct
> > drm_gpusvm_ctx *ctx,
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap *dpagemap)
> > =C2=A0{
> > +	int err, retries =3D 1;
> > +
> > =C2=A0	xe_assert(range_to_vm(&range->base)->xe, range-
> > >base.pages.flags.migrate_devmem);
> > =C2=A0	range_debug(range, "ALLOCATE VRAM");
> > =C2=A0
> > -	return drm_pagemap_populate_mm(dpagemap,
> > xe_svm_range_start(range),
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_svm_range_end(range),
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->base.gpusvm->mm,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->timeslice_ms);
> > +retry:
> > +	err =3D drm_pagemap_populate_mm(dpagemap,
> > xe_svm_range_start(range),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_svm_range_end(range),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->base.gpusvm->mm,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->timeslice_ms);
> > +	if ((err =3D=3D -EBUSY || err =3D=3D -EFAULT) && retries--) {
>=20
> I don't think this is what we want to do here. -EFAULT indicates that
> the pages are entirely present somewhere in device memory. This could
> be
> either on the local device or on a foreign device, but we don=E2=80=99t h=
ave
> enough information here to determine which case it is.
>=20
> If this is on our local device, we're always good. This could occur
> playing mremap games.
>=20
> If it's on a foreign device, things get trickier. If our interconnect
> supports atomics we're still good. But if the interconnect
> doesn't support atomics (e.g., PCIe P2P), this an atomic fault, then
> we
> need to move the memory. Also, if there's no path between device
> memories, then of course we need to move the memory.
>=20
> Again, we don=E2=80=99t have enough information here to make the correct
> decision. We really need to call drm_gpusvm_range_get_pages to gather
> the CPU pages in order to make this kind of decision. Ideally, the
> logic
> should be built into drm_gpusvm_range_get_pages to understand atomic
> migration requirements.

For multi-device I'm just looking at a patch that considers p2p
migration and at the same time returns 0 if data is placed in
compatible memory, given migration policies and interconnects. But
until that patch lands, we need a way to evict memory from foreign
devices so that we can migrate to the desired device.

I would have expected that if memory is already present in local device
memory we'd have that xe_svm_range_in_vram() flag set and would not
attempt to migrate, at least in most cases? Currently, if data is
already fully or partly present in another p2p-device memory, and we
ignore the -EFAULT, then get_pages() wouldn't detect that? Or well, we
can look at the dpagemap returned from get_pages and retry the
migration at that point.

We also need to realize that with multi-gpu, the chances of migration
races increases dramatically and whether those return -EBUSY or -EFAULT
appears a bit arbitrary to me? We can't really assume that cpages =3D=3D 0
means all pages are already where they are supposed to be.

My current thinking how to handle all this is the following:

1) xe_svm_range_in_vram(), first check to avoid migration.
2) (NEW, not implemented yet) if we decide to migrate, first run a
hmm_range_fault() without faulting flag to determine current memory
migration status - Perhaps optional. This may reject migration more
efficiently than if we collect pages for migration and then inspect
them, because then we've already sent an invalidation event.
3) Call into drm_pagemap_populate_mm(). This collects all compatible-
and system pages, and determines what to migrate. If no migration
needed, returns 0. If racing or needing to migrate foreign devices to
system, return -EBUSY,
4) If -EBUSY evict, and retry migration once.

For now, I think we make atomic faults use local VRAM only. Moving fow

>=20
> Once drm_gpusvm_range_get_pages returns, we can take appropriate
> action.
> Initially, for simplicity, this might just be a bounce to system
> memory.
> Later, it could evolve into a direct device-to-device move.

I agree we need a pass with hmm_range_fault(), question is in what
order we do this. I think a pass without the fault flag on before
trying to migrate would

a) Avoid populating with system pages for data that's going to be in
VRAM anyway,
b) Possibly avoiding collecting migrate pages and thus also an
invalidation for all devices.

The drawback is we'd might unnecessarily run a non-faulting
hmm_range_fault() when we need to migrate anyway. My thinking is, that
would be a rather quick call, though compared to the reverse lookups in
the migrate code.

>=20
> The logic inside drm_gpusvm_range_get_pages would likely involve
> devmem_only combined with a drm_pagemap passed in, which can detect
> connectivity and atomic support between devices=E2=80=94based on the
> drm_pagemap
> extracted from the ZDD.
>=20
> Let know if thia makes sense, or if you have thought about doing this
> in
> a follow up.

In any case I think we need to set up a flow-chart / flow-list similar
to the above and consider the most important cases and what to do with
them. for now, I think we can replace this patch if necessary with a
dpagemap check, whether desired equals what's present and rerun after
that. We'd probably need that anyway.

Thomas




>=20
> Matt
>=20
> > +		range_debug(range, "ALLOCATE VRAM - Retry.");
> > +
> > +		drm_gpusvm_range_evict(range->base.gpusvm, &range-
> > >base);
> > +		goto retry;
> > +	}
> > +
> > +	return err;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static struct drm_pagemap_addr
> > --=20
> > 2.51.0
> >=20

