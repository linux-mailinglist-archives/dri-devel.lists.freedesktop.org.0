Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E99095A9E72
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 19:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D68F10E0CC;
	Thu,  1 Sep 2022 17:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFFB10E0CC;
 Thu,  1 Sep 2022 17:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662054499; x=1693590499;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=JTp/8L+JYkqsPEJmrkKyBNW46MNSt2S89olDw+IH0ss=;
 b=JtnmZn1kYlwMqUP3A0Nyl3y8GN7JT8qJCe0ekPMp/x4smPfEdUi+8ViL
 wd1OWd4R+fk5bP6XWhd6hqSX7qIOWaExV7S5cw7LnANsyv5WldLhjDkk0
 rUVQ5cK2WhcUGX/koCWR5vpGKAuQdwB3RmcqC44CRTjwH0+piQQaOK59Z
 6eH0nGh1tNtQmpHQQSfKCaVggtzaJfSqi59xZfiaQGsrtLpx85cnUtTa6
 LAlF9ke8xJwrd57DxKA8EX7LrWniW3CKv6SYUNzCbPDOlOb55xNAniVEu
 9O+L2sYrhBIk1USF4MW/HjDyFfqyncuJzLaw8BtmPSAXVu1+5TZ+LIrth w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="282768173"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="282768173"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 10:48:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="563555846"
Received: from wwdowiak-mobl.ger.corp.intel.com (HELO [10.249.254.209])
 ([10.249.254.209])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 10:48:16 -0700
Message-ID: <e49bc63ba89ba1efba22d06f199cfb6d8e0a1797.camel@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/i915: audit bo->resource usage
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org, Intel
 Graphics <intel-gfx@lists.freedesktop.org>
Date: Thu, 01 Sep 2022 19:48:14 +0200
In-Reply-To: <06f90d85-2f31-e815-fd5a-f19af141df63@amd.com>
References: <20220824142353.10293-1-luben.tuikov@amd.com>
 <1de21f6e-4b11-ee9b-1b54-fd67728766ad@amd.com>
 <cc4c59ad-5d69-b174-5464-bd9896459169@intel.com>
 <ce090a95-a822-5079-7b86-0c949e98cd64@amd.com>
 <3f3715fb-1f2b-83a5-bff7-6e06164e5546@intel.com>
 <9c7cc7ea-dd30-6df5-3f06-97a6c6d254e0@amd.com>
 <55d88b45-6986-de38-d574-d0ce7d06c62e@intel.com>
 <1392ea7c-88a3-9a56-1ccb-e2f16cd55f72@amd.com>
 <303ae81e-d9af-6912-8cdb-c881015da634@intel.com>
 <7047e694-997c-2082-48cb-f9f628c40183@amd.com>
 <50b37045-87de-04d0-7464-afcb5f9a2a0d@intel.com>
 <06f90d85-2f31-e815-fd5a-f19af141df63@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
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
Cc: Luben Tuikov <luben.tuikov@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-08-31 at 15:34 +0200, Christian K=C3=B6nig wrote:
> Am 31.08.22 um 14:50 schrieb Matthew Auld:
> > On 31/08/2022 13:35, Christian K=C3=B6nig wrote:
> > > Am 31.08.22 um 14:06 schrieb Matthew Auld:
> > > > On 31/08/2022 12:03, Christian K=C3=B6nig wrote:
> > > > > Am 31.08.22 um 12:37 schrieb Matthew Auld:
> > > > > > [SNIP]
> > > > > > > >=20
> > > > > > > > That hopefully just leaves i915_ttm_shrink(), which is
> > > > > > > > swapping=20
> > > > > > > > out shmem ttm_tt and is calling ttm_bo_validate() with
> > > > > > > > empty=20
> > > > > > > > placements to force the pipeline-gutting path, which
> > > > > > > > importantly=20
> > > > > > > > unpopulates the ttm_tt for us (since ttm_tt_unpopulate
> > > > > > > > is not=20
> > > > > > > > exported it seems). But AFAICT it looks like that will
> > > > > > > > now also=20
> > > > > > > > nuke the bo->resource, instead of just leaving it in
> > > > > > > > system=20
> > > > > > > > memory. My assumption is that when later calling=20
> > > > > > > > ttm_bo_validate(), it will just do the bo_move_null()
> > > > > > > > in=20
> > > > > > > > i915_ttm_move(), instead of re-populating the ttm_tt
> > > > > > > > and then=20
> > > > > > > > potentially copying it back to local-memory?
> > > > > > >=20
> > > > > > > Well you do ttm_bo_validate() with something like GTT
> > > > > > > domain,=20
> > > > > > > don't you? This should result in re-populating the tt
> > > > > > > object, but=20
> > > > > > > I'm not 100% sure if that really works as expected.
> > > > > >=20
> > > > > > AFAIK for domains we either have system memory (which uses
> > > > > > ttm_tt=20
> > > > > > and might be shmem underneath) or local-memory. But perhaps
> > > > > > i915=20
> > > > > > is doing something wrong here, or abusing TTM in some way.
> > > > > > I'm not=20
> > > > > > sure tbh.
> > > > > >=20
> > > > > > Anyway, I think we have two cases here:
> > > > > >=20
> > > > > > - We have some system memory only object. After doing=20
> > > > > > i915_ttm_shrink(), bo->resource is now NULL. We then call=20
> > > > > > ttm_bo_validate() at some later point, but here we don't
> > > > > > need to=20
> > > > > > copy anything, but it also looks like
> > > > > > ttm_bo_handle_move_mem()=20
> > > > > > won't populate the ttm_tt or us either, since mem_type =3D=3D=
=20
> > > > > > TTM_PL_SYSTEM. It looks like i915_ttm_move() was taking
> > > > > > care of=20
> > > > > > this, but now we just call ttm_bo_move_null().
> > > > > >=20
> > > > > > - We have a local-memory only object, which was evicted to
> > > > > > shmem,=20
> > > > > > and then swapped out by the shrinker like above. The bo-
> > > > > > >resource=20
> > > > > > is NULL. However this time when calling ttm_bo_validate()
> > > > > > we need=20
> > > > > > to actually do a copy in i915_ttm_move(), as well as re-
> > > > > > populate=20
> > > > > > the ttm_tt. i915_ttm_move() was taking care of this, but
> > > > > > now we=20
> > > > > > just call ttm_bo_move_null().
> > > > > >=20
> > > > > > Perhaps i915 is doing something wrong in the above two
> > > > > > cases?
> > > > >=20
> > > > > Mhm, as far as I can see that should still work.
> > > > >=20
> > > > > See previously you should got a transition from SYSTEM->GTT
> > > > > in=20
> > > > > i915_ttm_move() to re-create your backing store. Not you get=20
> > > > > NULL->SYSTEM which is handled by ttm_bo_move_null() and then=20
> > > > > SYSTEM->GTT.
> > > >=20
> > > > What is GTT here in TTM world? Also I'm not seeing where there
> > > > is=20
> > > > this SYSTEM->GTT transition? Maybe I'm blind. Just to be clear,
> > > > i915=20
> > > > is only calling ttm_bo_validate() once when acquiring the
> > > > pages, and=20
> > > > we don't call it again, unless it was evicted (and potentially=20
> > > > swapped out).
> > >=20
> > > Well GTT means TTM_PL_TT.
> > >=20
> > > And calling it only once is perfectly fine, TTM will internally
> > > see=20
> > > that we need two hops to reach TTM_PL_TT and so does the NULL-
> > > >SYSTEM=20
> > > transition and then SYSTEM->TT.
> >=20
> > Ah interesting, so that's what the multi-hop thing does. But AFAICT
> > i915 is not using either TTM_PL_TT or -EMULTIHOP.
>=20
> Mhm, it could be that we then have a problem and the i915 driver only
> sees NULL->TT directly. But I really don't know the i915 driver code=20
> good enough to judge that.
>=20
> Can you take a look at this and test it maybe?
>=20
> >=20
> > Also what is the difference between TTM_PL_TT and TM_PL_SYSTEM?
> > When=20
> > should you use one over the other?
>=20
> TTM_PL_SYSTEM means the device is not accessing the buffer and TTM
> has=20
> the control over the backing store and can swapout/swapin as it wants
> it.
>=20
> TTM_PL_TT means that the device is accessing the data (TT stands for=20
> translation table) and so TTM can't swap the backing store in/out.
>=20
> TTM_PL_VRAM well that one is obvious.
>=20
> Thanks,
> Christian.

We've had a previous long discussions on this listing pros and cons,
and IIRC concluded that either binding to the device from system needed
some TTM fixes and documentation to be straightforward, or a driver
should use the above scheme bouncing in TT. IIRC we concluded that the
best thing for i915 would be to transition and introduce a dummy TT
region and obey the scheme outlined above by Christian.
We unfortunately never gotten around to that, though, due to other work
got prioritized. Also need to solve the limbo (not populated) -> vram
transition without populating when moving to TT....

Originaly TT was intended for GGTT-like and AGP apertures that needed
cpu-mapping to the PCI address. Using it like Christian outlines helps
avoid special casing for swapout. Devices that bind to System memory
needs the swap notifier to unbind.

/Thomas



>=20
> >=20
> > >=20
> > > As far as I can see that should work like it did before.
> > >=20
> > > Christian.
> > >=20
> > > >=20
> > > > >=20
> > > > > If you just validated to SYSTEM memory before I think the tt
> > > > > object=20
> > > > > wouldn't have been populated either.
> > > > >=20
> > > > > Regards,
> > > > > Christian.
> > > > >=20
> > > > > >=20
> > > > > > >=20
> > > > > > > Thanks,
> > > > > > > Christian.
> > > > > > >=20
> > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > I've been considering to replacing the ttm_bo_type
> > > > > > > > > with a bunch=20
> > > > > > > > > of behavior flags for a bo. I'm hoping that this will
> > > > > > > > > clean=20
> > > > > > > > > things up a bit.
> > > > > > > > >=20
> > > > > > > > > Regards,
> > > > > > > > > Christian.
> > > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 caching =3D
> > > > > > > > > > > > i915_ttm_select_tt_caching(obj);
> > > > > > > > > > > > diff --git
> > > > > > > > > > > > a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c=20
> > > > > > > > > > > > b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > > > > > > > > > > > index 9a7e50534b84bb..c420d1ab605b6f 100644
> > > > > > > > > > > > ---
> > > > > > > > > > > > a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > > > > > > > > > > > +++
> > > > > > > > > > > > b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > > > > > > > > > > > @@ -560,7 +560,7 @@ int i915_ttm_move(struct=20
> > > > > > > > > > > > ttm_buffer_object *bo, bool evict,
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool clear;
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
> > > > > > > > > > > > -=C2=A0=C2=A0=C2=A0 if (GEM_WARN_ON(!obj)) {
> > > > > > > > > > > > +=C2=A0=C2=A0=C2=A0 if (GEM_WARN_ON(!obj) || !bo->r=
esource) {
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ttm_bo_move_null(bo, dst_mem);
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return 0;
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > > > > > >=20
> > > > > > > > >=20
> > > > > > >=20
> > > > >=20
> > >=20
>=20

