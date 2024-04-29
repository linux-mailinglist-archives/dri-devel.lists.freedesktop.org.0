Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5628B593B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 14:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E722A112C56;
	Mon, 29 Apr 2024 12:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBnIslku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14896112C56;
 Mon, 29 Apr 2024 12:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714395584; x=1745931584;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mKNazLe/Cp7NIJ+D/uJzSIFssLGGDnrsIlr3JeDnF8k=;
 b=XBnIslkuqVsuXbuMI4jPzaKqZR58LiD3qFGj0BrnLVuzUDB6oOGCA3J0
 1hHDxrzWFnUjO4I7bXkXljoI19fFOcj40Bioy//1TaEQhIKSnLJNrWyK3
 EAkaehS/swV4wbxaT32ZIyiy1Wlee5GaVisEXoxY8lKxyj76qYJrYElPH
 9suNUn5CMatiYCLakWycjr9066tQYjC2jp0CTc+waU0+OIHFL5Joc2/w5
 UcLA3MRIypPYXv0Y2oS5aa+/+vKREpFIP7S4VzuSqhZ1Yv4ne8drOHmnS
 JWC0W+1zW23FBRW9viiwoWzOEnzGmApzot0U2+gZT0U6U+71cDVjU4a74 A==;
X-CSE-ConnectionGUID: ZXtLxlsZROuiFREQRmSuXA==
X-CSE-MsgGUID: O0gIBhzsTCGMfY+aNe6nTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="20602495"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="20602495"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:59:44 -0700
X-CSE-ConnectionGUID: OYLrGEMZSTSwPrcckj7sDg==
X-CSE-MsgGUID: xSjCxCGqTQmRKPvgO43gpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26066691"
Received: from sbint17x-mobl.gar.corp.intel.com (HELO [10.249.254.23])
 ([10.249.254.23])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:59:40 -0700
Message-ID: <0290d950cfb1baf7bca225458f7ceb0891317346.camel@linux.intel.com>
Subject: Re: [PATCH v3] drm/i915/vma: Fix UAF on reopen vs destroy race
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Andi Shyti <andi.shyti@linux.intel.com>, Andrzej
 Hajda <andrzej.hajda@intel.com>,  Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>
Date: Mon, 29 Apr 2024 14:59:38 +0200
In-Reply-To: <2675698.Isy0gbHreE@jkrzyszt-mobl2.ger.corp.intel.com>
References: <20240415195310.165934-2-janusz.krzysztofik@linux.intel.com>
 <13491837.dW097sEU6C@jkrzyszt-mobl2.ger.corp.intel.com>
 <Zh6p7M9QoMTowh2F@intel.com>
 <2675698.Isy0gbHreE@jkrzyszt-mobl2.ger.corp.intel.com>
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

On Thu, 2024-04-25 at 20:42 +0200, Janusz Krzysztofik wrote:
> Hi Thomas,
>=20
> On Tuesday, 16 April 2024 18:40:12 CEST Rodrigo Vivi wrote:
> > On Tue, Apr 16, 2024 at 10:09:46AM +0200, Janusz Krzysztofik wrote:
> > > Hi Rodrigo,
> > >=20
> > > On Tuesday, 16 April 2024 03:16:31 CEST Rodrigo Vivi wrote:
> > > > On Mon, Apr 15, 2024 at 09:53:09PM +0200, Janusz Krzysztofik
> > > > wrote:
> > > > > We defer actually closing, unbinding and destroying a VMA
> > > > > until next idle
> > > > > point, or until the object is freed in the meantime.=C2=A0 By
> > > > > postponing the
> > > > > unbind, we allow for the VMA to be reopened by the client,
> > > > > avoiding the
> > > > > work required to rebind the VMA.
> > > > >=20
> > > > > It was assumed that as long as a GT is held idle, no VMA
> > > > > would be reopened
> > > > > while we destroy them.=C2=A0 That assumption is no longer true in
> > > > > multi-GT
> > > > > configurations, where a VMA we reopen may be handled by a GT
> > > > > different
> > > > > from the one that we already keep active via its engine while
> > > > > we set up
> > > > > an execbuf request.
> > > > >=20
> > > > > <4> [260.290809] ------------[ cut here ]------------
> > > > > <4> [260.290988] list_del corruption. prev->next should be
> > > > > ffff888118c5d990, but was ffff888118c5a510.
> > > > > (prev=3Dffff888118c5a510)
> > > > > <4> [260.291004] WARNING: CPU: 2 PID: 1143 at
> > > > > lib/list_debug.c:62
> > > > > __list_del_entry_valid_or_report+0xb7/0xe0
> > > > > ..
> > > > > <4> [260.291055] CPU: 2 PID: 1143 Comm: kms_plane Not tainted
> > > > > 6.9.0-rc2-CI_DRM_14524-ga25d180c6853+ #1
> > > > > <4> [260.291058] Hardware name: Intel Corporation Meteor Lake
> > > > > Client Platform/MTL-P LP5x T3 RVP, BIOS
> > > > > MTLPFWI1.R00.3471.D91.2401310918 01/31/2024
> > > > > <4> [260.291060] RIP:
> > > > > 0010:__list_del_entry_valid_or_report+0xb7/0xe0
> > > > > ...
> > > > > <4> [260.291087] Call Trace:
> > > > > <4> [260.291089]=C2=A0 <TASK>
> > > > > <4> [260.291124]=C2=A0 i915_vma_reopen+0x43/0x80 [i915]
> > > > > <4> [260.291298]=C2=A0 eb_lookup_vmas+0x9cb/0xcc0 [i915]
> > > > > <4> [260.291579]=C2=A0 i915_gem_do_execbuffer+0xc9a/0x26d0 [i915]
> > > > > <4> [260.291883]=C2=A0 i915_gem_execbuffer2_ioctl+0x123/0x2a0
> > > > > [i915]
> > > > > ...
> > > > > <4> [260.292301]=C2=A0 </TASK>
> > > > > ...
> > > > > <4> [260.292506] ---[ end trace 0000000000000000 ]---
> > > > > <4> [260.292782] general protection fault, probably for non-
> > > > > canonical address 0x6b6b6b6b6b6b6ca3: 0000 [#1] PREEMPT SMP
> > > > > NOPTI
> > > > > <4> [260.303575] CPU: 2 PID: 1143 Comm: kms_plane Tainted:
> > > > > G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.9.0-rc2-CI_DRM_14524-ga25d180c6853+ =
#1
> > > > > <4> [260.313851] Hardware name: Intel Corporation Meteor Lake
> > > > > Client Platform/MTL-P LP5x T3 RVP, BIOS
> > > > > MTLPFWI1.R00.3471.D91.2401310918 01/31/2024
> > > > > <4> [260.326359] RIP: 0010:eb_validate_vmas+0x114/0xd80
> > > > > [i915]
> > > > > ...
> > > > > <4> [260.428756] Call Trace:
> > > > > <4> [260.431192]=C2=A0 <TASK>
> > > > > <4> [639.283393]=C2=A0 i915_gem_do_execbuffer+0xd05/0x26d0 [i915]
> > > > > <4> [639.305245]=C2=A0 i915_gem_execbuffer2_ioctl+0x123/0x2a0
> > > > > [i915]
> > > > > ...
> > > > > <4> [639.411134]=C2=A0 </TASK>
> > > > > ...
> > > > > <4> [639.449979] ---[ end trace 0000000000000000 ]---
> > > > >=20
> > > > > As soon as we start unbinding and destroying a VMA, marked it
> > > > > as parked,
> > > > > and also keep it marked as closed for the rest of its life.=C2=A0
> > > > > When a VMA
> > > > > to be opened occurs closed, reopen it only if not yet parked.
> > > > >=20
> > > > > v3: Fix misplaced brackets.
> > > > > v2: Since we no longer re-init the VMA closed list link on
> > > > > VMA park so it
> > > > > =C2=A0=C2=A0=C2=A0 looks like still on a list, don't try to delet=
e it from
> > > > > the list again
> > > > > =C2=A0=C2=A0=C2=A0 after the VMA has been marked as parked.
> > > > >=20
> > > > > Fixes: b0647a5e79b1 ("drm/i915: Avoid live-lock with
> > > > > i915_vma_parked()")
> > > >=20
> > > > what about reverting that?
> > >=20
> > > I didn't think of that.=C2=A0 Why you think that might be a better
> > > approach?
> >=20
> > well, I thought of that mainly because...
> >=20
> > >=20
> > > Anyway, that's a 4 years old patch and a few things have changed
> > > since then,=20
> > > so simple revert won't work.=C2=A0 Moreover, I've just checked that
> > > patch was=20
> > > supposed to fix another patch, 77853186e547 ("drm/i915: Claim vma
> > > while under=20
> > > closed_lock in i915_vma_parked()"), which in turn was supposed to
> > > fix=20
> > > aa5e4453dc05 ("drm/i915/gem: Try to flush pending unbind
> > > events"), and that=20
> > > one also referenced still another, cb6c3d45f948 ("drm/i915/gem:
> > > Avoid parking=20
> > > the vma as we unbind") from December 2019, which finally wasn't a
> > > fix but an=20
> > > improvement.
> >=20
> > ... because of histories like that ^ and I was afraid of this patch
> > here now
> > just put us into a different corner case.
> >=20
> > I have a feeling that without locks there we might just hit another
> > race soon with the the park and only using the atomic checks.
> >=20
> > > Then, we would have to consider new fixes alternative to at least
> > > some of those three, I guess.=20
> >=20
> > Indeed.. I didn't think that deep on that...
> >=20
> > > I'd rather not dig that deep, unless we invest=20
> > > in a completely new solution (e.g. backport VMA handling from xe
> > > if more=20
> > > effective while compatible to some extent?).=C2=A0 Even then, we need
> > > a fix for=20
> > > now.
> >=20
> > yeap, not sure if that would help. was also not designed to
> > the park unpark.
> >=20
> > >=20
> > > Alternatively, we can try to revert my 1f33dc0c1189 ("drm/i915:
> > > Remove extra=20
> > > multi-gt pm-references") which was a manual revert of
> > > f56fe3e91787 ("drm/i915:=20
> > > Fix a VMA UAF for multi-gt platform") -- a workaround that was
> > > supposed to=20
> > > address some multi-GT related VMA issues.=C2=A0 While it didn't reall=
y
> > > resolve=20
> > > those issues it was addressing, I think it may help with this
> > > one, which=20
> > > started appearing after I reverted that workaround.=C2=A0 However, it=
s
> > > effectiveness is limited to MTL topology.
> >=20
> > perhaps the safer path for this case indeed. something that could
> > be really
> > limited to a single platform would be better.
> >=20
> > But I confess that I don't have other better suggestions.
> > If we need to go with this patch as a quick solution, it is
> > apparently
> > better than leaving the bug there as is.
> >=20
> > +Thomas. any good thoughts there or advices?
>=20
> I'm waiting for you opinion here.=C2=A0 Which option would you prefer,
> this patch=20
> or revert of 1f33dc0c1189 ("drm/i915: Remove extra multi-gt pm-
> references")?=C2=A0=20
> Or can you suggest any potentially better solutions?

Hi,

Sorry for the late response. I don't really have anything to add to the
discussion since I don't have the time to again familiarize myself with
the code.

The only advise I can give is to try to document as much as possible so
that it's reasonably clear what's being done and why.

Thanks,
Thomas





>=20
> Thanks,
> Janusz
>=20
> >=20
> > Thanks,
> > Rodrigo.
> >=20
> > >=20
> > > Thanks,
> > > Janusz
> > >=20
> > > >=20
> > > > > Closes:
> > > > > https://gitlab.freedesktop.org/drm/intel/-/issues/10608
> > > > > Signed-off-by: Janusz Krzysztofik
> > > > > <janusz.krzysztofik@linux.intel.com>
> > > > > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > > > > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > > Cc: stable@vger.kernel.org=C2=A0# v6.0+
> > > > > ---
> > > > > =C2=A0.../gpu/drm/i915/gem/i915_gem_execbuffer.c=C2=A0=C2=A0=C2=
=A0 | 10 ++++--
> > > > > =C2=A0drivers/gpu/drm/i915/i915_vma.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 32
> > > > > +++++++++++++++----
> > > > > =C2=A0drivers/gpu/drm/i915/i915_vma.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > > =C2=A0drivers/gpu/drm/i915/i915_vma_types.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
> > > > > =C2=A04 files changed, 37 insertions(+), 10 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > > > b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > > > index 42619fc05de48..97e014f94002e 100644
> > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > > > @@ -847,9 +847,12 @@ static int __eb_add_lut(struct
> > > > > i915_execbuffer *eb,
> > > > > =C2=A0	if (unlikely(!lut))
> > > > > =C2=A0		return -ENOMEM;
> > > > > =C2=A0
> > > > > +	if (!i915_vma_open(vma)) {
> > > > > +		err =3D -EEXIST;	/* let eb_vma_lookup() retry
> > > > > */
> > > > > +		goto err_lut_free;
> > > > > +	}
> > > > > +
> > > > > =C2=A0	i915_vma_get(vma);
> > > > > -	if (!atomic_fetch_inc(&vma->open_count))
> > > > > -		i915_vma_reopen(vma);
> > > > > =C2=A0	lut->handle =3D handle;
> > > > > =C2=A0	lut->ctx =3D ctx;
> > > > > =C2=A0
> > > > > @@ -880,8 +883,9 @@ static int __eb_add_lut(struct
> > > > > i915_execbuffer *eb,
> > > > > =C2=A0	return 0;
> > > > > =C2=A0
> > > > > =C2=A0err:
> > > > > -	i915_vma_close(vma);
> > > > > =C2=A0	i915_vma_put(vma);
> > > > > +	i915_vma_close(vma);
> > > > > +err_lut_free:
> > > > > =C2=A0	i915_lut_handle_free(lut);
> > > > > =C2=A0	return err;
> > > > > =C2=A0}
> > > > > diff --git a/drivers/gpu/drm/i915/i915_vma.c
> > > > > b/drivers/gpu/drm/i915/i915_vma.c
> > > > > index d2f064d2525cc..4435c76f28c8c 100644
> > > > > --- a/drivers/gpu/drm/i915/i915_vma.c
> > > > > +++ b/drivers/gpu/drm/i915/i915_vma.c
> > > > > @@ -1735,14 +1735,33 @@ static void
> > > > > __i915_vma_remove_closed(struct i915_vma *vma)
> > > > > =C2=A0	list_del_init(&vma->closed_link);
> > > > > =C2=A0}
> > > > > =C2=A0
> > > > > -void i915_vma_reopen(struct i915_vma *vma)
> > > > > +static struct i915_vma *i915_vma_reopen(struct i915_vma
> > > > > *vma)
> > > > > +{
> > > > > +	if (atomic_read(&vma->flags) & I915_VMA_PARKED)
> > > > > +		return NULL;
> > > > > +
> > > > > +	__i915_vma_remove_closed(vma);
> > > > > +	return vma;
> > > > > +}
> > > > > +
> > > > > +struct i915_vma *i915_vma_open(struct i915_vma *vma)
> > > > > =C2=A0{
> > > > > =C2=A0	struct intel_gt *gt =3D vma->vm->gt;
> > > > > =C2=A0
> > > > > +	if (atomic_inc_not_zero(&vma->open_count))
> > > > > +		return vma;
> > > > > +
> > > > > =C2=A0	spin_lock_irq(&gt->closed_lock);
> > > > > -	if (i915_vma_is_closed(vma))
> > > > > -		__i915_vma_remove_closed(vma);
> > > > > +	if (!atomic_inc_not_zero(&vma->open_count)) {
> > > > > +		if (i915_vma_is_closed(vma))
> > > > > +			vma =3D i915_vma_reopen(vma);
> > > > > +
> > > > > +		if (vma)
> > > > > +			atomic_inc(&vma->open_count);
> > > > > +	}
> > > > > =C2=A0	spin_unlock_irq(&gt->closed_lock);
> > > > > +
> > > > > +	return vma;
> > > > > =C2=A0}
> > > > > =C2=A0
> > > > > =C2=A0static void force_unbind(struct i915_vma *vma)
> > > > > @@ -1770,7 +1789,8 @@ static void release_references(struct
> > > > > i915_vma *vma, struct intel_gt *gt,
> > > > > =C2=A0	spin_unlock(&obj->vma.lock);
> > > > > =C2=A0
> > > > > =C2=A0	spin_lock_irq(&gt->closed_lock);
> > > > > -	__i915_vma_remove_closed(vma);
> > > > > +	if (!(atomic_read(&vma->flags) & I915_VMA_PARKED))
> > > > > +		__i915_vma_remove_closed(vma);
> > > > > =C2=A0	spin_unlock_irq(&gt->closed_lock);
> > > > > =C2=A0
> > > > > =C2=A0	if (vm_ddestroy)
> > > > > @@ -1854,22 +1874,22 @@ void i915_vma_parked(struct intel_gt
> > > > > *gt)
> > > > > =C2=A0		}
> > > > > =C2=A0
> > > > > =C2=A0		list_move(&vma->closed_link, &closed);
> > > > > +		atomic_or(I915_VMA_PARKED, &vma->flags);
> > > > > =C2=A0	}
> > > > > =C2=A0	spin_unlock_irq(&gt->closed_lock);
> > > > > =C2=A0
> > > > > -	/* As the GT is held idle, no vma can be reopened as
> > > > > we destroy them */
> > > > > =C2=A0	list_for_each_entry_safe(vma, next, &closed,
> > > > > closed_link) {
> > > > > =C2=A0		struct drm_i915_gem_object *obj =3D vma->obj;
> > > > > =C2=A0		struct i915_address_space *vm =3D vma->vm;
> > > > > =C2=A0
> > > > > =C2=A0		if (i915_gem_object_trylock(obj, NULL)) {
> > > > > -			INIT_LIST_HEAD(&vma->closed_link);
> > > > > =C2=A0			i915_vma_destroy(vma);
> > > > > =C2=A0			i915_gem_object_unlock(obj);
> > > > > =C2=A0		} else {
> > > > > =C2=A0			/* back you go.. */
> > > > > =C2=A0			spin_lock_irq(&gt->closed_lock);
> > > > > =C2=A0			list_add(&vma->closed_link, &gt-
> > > > > >closed_vma);
> > > > > +			atomic_andnot(I915_VMA_PARKED, &vma-
> > > > > >flags);
> > > > > =C2=A0			spin_unlock_irq(&gt->closed_lock);
> > > > > =C2=A0		}
> > > > > =C2=A0
> > > > > diff --git a/drivers/gpu/drm/i915/i915_vma.h
> > > > > b/drivers/gpu/drm/i915/i915_vma.h
> > > > > index e356dfb883d34..331d19672c764 100644
> > > > > --- a/drivers/gpu/drm/i915/i915_vma.h
> > > > > +++ b/drivers/gpu/drm/i915/i915_vma.h
> > > > > @@ -268,7 +268,7 @@ int __must_check
> > > > > i915_vma_unbind_async(struct i915_vma *vma, bool trylock_vm);
> > > > > =C2=A0int __must_check i915_vma_unbind_unlocked(struct i915_vma
> > > > > *vma);
> > > > > =C2=A0void i915_vma_unlink_ctx(struct i915_vma *vma);
> > > > > =C2=A0void i915_vma_close(struct i915_vma *vma);
> > > > > -void i915_vma_reopen(struct i915_vma *vma);
> > > > > +struct i915_vma *i915_vma_open(struct i915_vma *vma);
> > > > > =C2=A0
> > > > > =C2=A0void i915_vma_destroy_locked(struct i915_vma *vma);
> > > > > =C2=A0void i915_vma_destroy(struct i915_vma *vma);
> > > > > diff --git a/drivers/gpu/drm/i915/i915_vma_types.h
> > > > > b/drivers/gpu/drm/i915/i915_vma_types.h
> > > > > index 559de74d0b114..41784c3025349 100644
> > > > > --- a/drivers/gpu/drm/i915/i915_vma_types.h
> > > > > +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> > > > > @@ -263,6 +263,9 @@ struct i915_vma {
> > > > > =C2=A0#define I915_VMA_SCANOUT_BIT	17
> > > > > =C2=A0#define
> > > > > I915_VMA_SCANOUT	((int)BIT(I915_VMA_SCANOUT_BIT))
> > > > > =C2=A0
> > > > > +#define I915_VMA_PARKED_BIT	18
> > > > > +#define
> > > > > I915_VMA_PARKED		((int)BIT(I915_VMA_PARKED_BIT))
> > > > > +
> > > > > =C2=A0	struct i915_active active;
> > > > > =C2=A0
> > > > > =C2=A0#define I915_VMA_PAGES_BIAS 24
> > > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> >=20
>=20
>=20
>=20
>=20

