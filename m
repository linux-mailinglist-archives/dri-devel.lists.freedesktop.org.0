Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4A5996D72
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 16:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEFB10E738;
	Wed,  9 Oct 2024 14:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMNhURoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F5C10E738
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 14:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728483460; x=1760019460;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ceNz/NXXd3wUgSVZAe8Ij2SvVaANTVYuIwOrlzMBpyc=;
 b=VMNhURoV134NvOQtryBwxCiWBbRwbEjBNBe2xkuMZb5yuoywQ12fyGIw
 WCZb9tGSzBK5X+67rkWsEI3ssDV4NfxQks+UhlhIYYozWWLCixGNsPKd1
 2ujcA5hIxt2r8hYqrOly8OOq2055Wun6FTyxQrv5a3aGr4Xb7jRmxIrMR
 fFyHNM2xGHzpJaBZLpvPASxBOwRl5T6HGrzoZsxmOdlSPRkCEvQdT77DW
 PU7mxZplJsrTsAn271GYGskl68o4qIZnr/JuTnYbXMuxfdQiWemXJ9iDA
 gzEy/ryoNQIIN5EDCB1BBtIT+mFSehBib190KF6cBUABtec7mgyUpQduB A==;
X-CSE-ConnectionGUID: yMr2/OuaTNOvTAWugNUHxg==
X-CSE-MsgGUID: VCWu2csvT6yNxOY9m7HQ7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="53193622"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="53193622"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 07:17:40 -0700
X-CSE-ConnectionGUID: C8vcvHZnTgmf728Oiazj4Q==
X-CSE-MsgGUID: boTye5pzRseU9guiOoTJxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="80256289"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.243])
 ([10.245.245.243])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 07:17:38 -0700
Message-ID: <ff1d2e900d66664bd2ee6d29955ed7a858c0e44d.camel@linux.intel.com>
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Simona
 Vetter <simona.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Date: Wed, 09 Oct 2024 16:17:36 +0200
In-Reply-To: <d48f5c1ef67bfe57253aa33370f3105080577534.camel@linux.intel.com>
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
 <2bca2a15-029e-4d8a-9eb4-3dc54f42798e@amd.com>
 <d48f5c1ef67bfe57253aa33370f3105080577534.camel@linux.intel.com>
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

On Wed, 2024-10-09 at 15:39 +0200, Thomas Hellstr=C3=B6m wrote:
> On Mon, 2024-10-07 at 11:08 +0200, Christian K=C3=B6nig wrote:
> > Hi Thomas,
> >=20
> > I'm on sick leave, but I will try to answer questions and share
> > some=20
> > thoughts on this to unblock you.
> >=20
> > Am 18.09.24 um 14:57 schrieb Thomas Hellstr=C3=B6m:
> > > Sima, Christian
> > >=20
> > > I've updated the shrinker series now with a guarded for_each
> > > macro
> > > instead:
> > >=20
> > > https://patchwork.freedesktop.org/patch/614514/?series=3D131815&rev=
=3D9
> >=20
> > Yeah that looks like a big step in the right direction.
> >=20
> > > (Note I forgot to remove the export of the previous LRU walker).
> > >=20
> > > =C2=A0 so the midlayer argument is now not an issue anymore. The
> > > cleanup.h
> > > guard provides some additional protection against drivers exiting
> > > the
> > > LRU loop early.
> > >=20
> > > So remaining is the question whether the driver is allowed to
> > > discard a
> > > suggested bo to shrink from TTM.
> > >=20
> > > Arguments for:
> > >=20
> > > 1) Not allowing that would require teaching TTM about purgeable
> > > objects.
> >=20
> > I think that is actually not correct. TTM already knows about
> > purgeable=20
> > objects.
> >=20
> > E.g. when TTM asks the driver what to do with evicted objects it is
> > perfectly valid to return an empty placement list indicating that
> > the
> > backing store can just be thrown away.
> >=20
> > We use this for things like temporary buffers for example.
> >=20
> > That this doesn't apply to swapping looks like a design bug in the=20
> > driver/TTM interface to me.
>=20
> Yes we can do that with TTM, but for shrinking there's no point in
> trying to shrink when there is no swap-space left, other than
> purgeable
> object. The number of shrinkable objects returned in shrinker::count
> needs to reflect that, and *then* only those objects should be
> selected
> for shrinking. If we were to announce that to TTM using a callback,
> we're actually back to version 1 of this series which was rejected by
> you exactly since it was using callbacks a year or so ago????
>=20
> >=20
> > > 2) Devices who need the blitter during shrinking would want to
> > > punt
> > > runtime_pm_get() to kswapd to avoid sleeping direct reclaim.
> >=20
> > I think the outcome of the discussion is that runtime PM should
> > never
> > be=20
> > mixed into TTM swapping.
> >=20
> > You can power up blocks to enable a HW blitter for swapping, but
> > this
> > then can't be driven by the runtime PM framework.
>=20
> Still that power-on might be sleeping, so what's the difference using
> runtime-pm or not? Why should the driver implement yet another power
> interface, just because TTM refuses to publish a sane LRU walk
> interface?
>=20
> >=20
> > > 3) If those devices end up blitting (LNL) to be able to shrink,
> > > they
> > > would want to punt waiting for the fence to signal to kswapd to
> > > avoid
> > > waiting in direct reclaim.
> >=20
> > Mhm, what do you mean with that?
>=20
> When we fired the blitter from direct reclaim, we get a fence. If we
> wait for it in direct reclaim we will be sleeping waiting for gpu,
> which is bad form. We'd like return a failure so the object is
> retried
> when idle, or from kswapd.
>=20
> >=20
> >=20
> > > 4) It looks like we need to resort to folio_trylock in the shmem
> > > backup
> > > backend when shrinking is called for gfp_t =3D GFP_NOFS. A failing
> > > trylock will require a new bo.
> >=20
> > Why would a folio trylock succeed with one BO and not another?
>=20
> Good point. We'd fail anyway but would perhaps need to call
> SHRINK_STOP..
>=20
> >=20
> > And why would that trylock something the device specific driver
> > should=20
> > handle?
>=20
> It happens in the TTM shrinker helper called from the driver in the
> spirit of demidlayering.
>=20
> >=20
> > > Arguments against:
> > > None really. I thought the idea of demidlayering would be to
> > > allow
> > > the
> > > driver more freedom.
> >=20
> > Well that is a huge argument against it. Giving drivers more
> > freedom
> > is=20
> > absolutely not something which turned out to be valuable in the
> > past.
>=20
> So then what's the point of demidlayering?
>=20
> >=20
> > Instead we should put device drivers in a very strict corset of=20
> > validated approaches to do things.
> >=20
> > Background is that in my experience driver developers are perfectly
> > willing to do unclean approaches which only work in like 99% of all
> > cases just to get a bit more performance or simpler driver
> > implementation.
> >=20
> > Those approaches are not legal and in my opinion as subsystem
> > maintainer=20
> > I think we need to be more strict and push back much harder on
> > stuff=20
> > like that.
>=20
> Still, historically that has made developers abandon common
> components
> for driver-specific solutions.=20
>=20
> And the question is still not answered.
>=20
> Exactly *why* can't the driver fail and continue traversing the LRU,
> because all our argumentation revolves around this and you have yet
> to
> provide an objective reason why.=20

And in the end, while I think there definitely things worthy of
discussion in this series,=C2=A0

I don't think there is a point in trying to land a LNL shrinker
operating against a crippled TTM LRU walk interface, nor do I think
anyone would want to attempt to port i915 over, and reworking it three
times I'm now pretty familiar with what works and what doesn't.

So question becomes, with proper reviews can I merge the series here as
is, *with* the de-midlayered LRU walk and noting your advise against
it, or not?

Thanks,
Thomas





>=20
> /Thomas
>=20
>=20
>=20
>=20
> >=20
> > Regards,
> > Christian.
> >=20
> > >=20
> > > So any feedback appreciated. If that is found acceptable we can
> > > proceed
> > > with reviewing this patch and also with the shrinker series.
> > >=20
> > > Thanks,
> > > Thomas
> > >=20
> > >=20
> > > On Mon, 2024-09-02 at 13:07 +0200, Daniel Vetter wrote:
> > > > On Wed, Aug 28, 2024 at 02:20:34PM +0200, Christian K=C3=B6nig
> > > > wrote:
> > > > > Am 27.08.24 um 19:53 schrieb Daniel Vetter:
> > > > > > On Tue, Aug 27, 2024 at 06:52:13PM +0200, Daniel Vetter
> > > > > > wrote:
> > > > > > > On Thu, Aug 22, 2024 at 03:19:29PM +0200, Christian K=C3=B6ni=
g
> > > > > > > wrote:
> > > > > > > > Completely agree that this is complicated, but I still
> > > > > > > > don't
> > > > > > > > see the need
> > > > > > > > for it.
> > > > > > > >=20
> > > > > > > > Drivers just need to use pm_runtime_get_if_in_use()
> > > > > > > > inside
> > > > > > > > the shrinker and
> > > > > > > > postpone all hw activity until resume.
> > > > > > > Not good enough, at least long term I think. Also
> > > > > > > postponing hw
> > > > > > > activity
> > > > > > > to resume doesn't solve the deadlock issue, if you still
> > > > > > > need
> > > > > > > to grab ttm
> > > > > > > locks on resume.
> > > > > > Pondered this specific aspect some more, and I think you
> > > > > > still
> > > > > > have a race
> > > > > > here (even if you avoid the deadlock): If the condiditional
> > > > > > rpm_get call
> > > > > > fails there's no guarantee that the device will
> > > > > > suspend/resume
> > > > > > and clean
> > > > > > up the GART mapping.
> > > > > Well I think we have a major disconnect here. When the device
> > > > > is
> > > > > powered
> > > > > down there is no GART mapping to clean up any more.
> > > > >=20
> > > > > In other words GART is a table in local memory (VRAM) when
> > > > > the
> > > > > device is
> > > > > powered down this table is completely destroyed. Any BO which
> > > > > was
> > > > > mapped
> > > > > inside this table is now not mapped any more.
> > > > >=20
> > > > > So when the shrinker wants to evict a BO which is marked as
> > > > > mapped
> > > > > to GART
> > > > > and the device is powered down we just skip the GART
> > > > > unmapping
> > > > > part
> > > > > because
> > > > > that has already implicitly happened during power down.
> > > > >=20
> > > > > Before mapping any BO into the GART again we power the GPU up
> > > > > through the
> > > > > runtime PM calls. And while powering it up again the GART is
> > > > > restored.
> > > > My point is that you can't tell whether the device will power
> > > > down or
> > > > not,
> > > > you can only tell whether there's a chance it might be powering
> > > > down
> > > > and
> > > > so you can't get at the rpm reference without deadlock issues.
> > > >=20
> > > > > > The race gets a bit smaller if you use
> > > > > > pm_runtime_get_if_active(), but even then you might catch
> > > > > > it
> > > > > > right when
> > > > > > resume almost finished.
> > > > > What race are you talking about?
> > > > >=20
> > > > > The worst thing which could happen is that we restore a GART
> > > > > entry
> > > > > which
> > > > > isn't needed any more, but that is pretty much irrelevant
> > > > > since
> > > > > we
> > > > > only
> > > > > clear them to avoid some hw bugs.
> > > > The race I'm seeing is where you thought the GART entry is not
> > > > issue,
> > > > tossed an object, but the device didn't suspend, so might still
> > > > use
> > > > it.
> > > >=20
> > > > I guess if we're clearly separating the sw allocation of the
> > > > TTM_TT
> > > > with
> > > > the physical entries in the GART that should all work, but
> > > > feels
> > > > a
> > > > bit
> > > > tricky. The race I've seen is essentially these two getting out
> > > > of
> > > > sync.
> > > >=20
> > > > So maybe it was me who's stuck.
> > > >=20
> > > > What I wonder is whether it works in practice, since on the
> > > > restore
> > > > side
> > > > you need to get some locks to figure out which gart mappings
> > > > exist
> > > > and
> > > > need restoring. And that's the same locks as the shrinker needs
> > > > to
> > > > figure
> > > > out whether it might need to reap a gart mapping.
> > > >=20
> > > > Or do you just copy the gart entries over and restore them
> > > > exactly
> > > > as-is,
> > > > so that there's no shared locks?
> > > >=20
> > > > > > That means we'll have ttm bo hanging around with GART
> > > > > > allocations/mappings
> > > > > > which aren't actually valid anymore (since they might
> > > > > > escape
> > > > > > the
> > > > > > cleanup
> > > > > > upon resume due to the race). That doesn't feel like a
> > > > > > solid
> > > > > > design
> > > > > > either.
> > > > > I'm most likely missing something, but I'm really scratching
> > > > > my
> > > > > head where
> > > > > you see a problem here.
> > > > I guess one issue is that at least traditionally, igfx drivers
> > > > have
> > > > nested
> > > > runtime pm within dma_resv lock. And dgpu drivers the other way
> > > > round.
> > > > Which is a bit awkward if you're trying for common code.
> > > >=20
> > > > Cheers, Sima
> >=20
>=20

