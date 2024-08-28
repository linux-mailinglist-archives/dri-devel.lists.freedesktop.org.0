Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682E8962CBA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D845A10E3BD;
	Wed, 28 Aug 2024 15:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dkkZhmSQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0114C10E3BD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 15:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724859936; x=1756395936;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CUo7u/EpqMWSRnCF3zsVEccEp+9UbVJuHQxoq717yIo=;
 b=dkkZhmSQOPV21+1/uFyjEAlADLhF+6gzyH1Vo+N+YlmGctCGgCzoTNY4
 cWFHVgQ8Tn2bkrBCKlYiZv2eK+ysiU78Cs57ZzA5TMSr3D9MuPJYprMCT
 QXAKTr4bpHzqWplQLsAw2FXT/De3CiR2WbI0pm1Jag1UIPoCW+tF7n43m
 6eS2UuHD7R3pK6QAUYcjpXJ5RyF1n03Wg0btAYTb06sW7cqG8gu1qbF79
 DVyuxPv2RIA+TAl/BnLrpHVDfrUZHF30EQsGXGenPc5Ot8mg93jW4csOr
 4W2KyJ3yegd5T5VhMjciK1gVqOVEnK6jM/6jRosmIdt8BQtu2lP9COQTr g==;
X-CSE-ConnectionGUID: 3RyOp+hBR/W6KYWN51NEGw==
X-CSE-MsgGUID: 1bk93Z9OSUiuXQ1Y5sb4Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34022638"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="34022638"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 08:45:35 -0700
X-CSE-ConnectionGUID: Gac6m2pCRUuUTj0Gh4M3DA==
X-CSE-MsgGUID: 5Vc12zcfQ8GsrWZieqTOeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="67403516"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.168])
 ([10.245.244.168])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 08:45:34 -0700
Message-ID: <4ca412438f4e316adbe497051425ac1090da3b3a.camel@linux.intel.com>
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Date: Wed, 28 Aug 2024 17:45:32 +0200
In-Reply-To: <afd2f497-88db-4609-ac4a-841039d61677@amd.com>
References: <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
 <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
 <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
 <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
 <ZscDox5KoiNHXxne@phenom.ffwll.local>
 <3afe3ab2-4a58-49a9-acd7-c989980c68f2@amd.com>
 <Zs4EPT1DR7OrE5X-@phenom.ffwll.local> <Zs4Ss8LJ-n9NbBcb@phenom.ffwll.local>
 <c890ecbf-e7eb-479d-bb54-807edd1f66e6@amd.com>
 <010f1193a4c21fff566f4847d49289091b9b49c6.camel@linux.intel.com>
 <afd2f497-88db-4609-ac4a-841039d61677@amd.com>
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

On Wed, 2024-08-28 at 17:25 +0200, Christian K=C3=B6nig wrote:
> Am 28.08.24 um 16:05 schrieb Thomas Hellstr=C3=B6m:
> > On Wed, 2024-08-28 at 14:20 +0200, Christian K=C3=B6nig wrote:
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
> > > > > > the
> > > > > > shrinker and
> > > > > > postpone all hw activity until resume.
> > > > > Not good enough, at least long term I think. Also postponing
> > > > > hw
> > > > > activity
> > > > > to resume doesn't solve the deadlock issue, if you still need
> > > > > to
> > > > > grab ttm
> > > > > locks on resume.
> > > > Pondered this specific aspect some more, and I think you still
> > > > have
> > > > a race
> > > > here (even if you avoid the deadlock): If the condiditional
> > > > rpm_get
> > > > call
> > > > fails there's no guarantee that the device will suspend/resume
> > > > and
> > > > clean
> > > > up the GART mapping.
> > > Well I think we have a major disconnect here. When the device is
> > > powered
> > > down there is no GART mapping to clean up any more.
> > >=20
> > > In other words GART is a table in local memory (VRAM) when the
> > > device
> > > is
> > > powered down this table is completely destroyed. Any BO which was
> > > mapped
> > > inside this table is now not mapped any more.
> > >=20
> > > So when the shrinker wants to evict a BO which is marked as
> > > mapped to
> > > GART and the device is powered down we just skip the GART
> > > unmapping
> > > part
> > > because that has already implicitly happened during power down.
> > >=20
> > > Before mapping any BO into the GART again we power the GPU up
> > > through
> > > the runtime PM calls. And while powering it up again the GART is
> > > restored.
> > I think you're forgetting the main Xe use-case of Lunar-lake
> > compression metadata. I'ts retained by the device during D3hot, but
> > cannot, at that time, be accessed for shrinking.
>=20
> Yeah, that is really something we don't have an equivalent for on AMD
> GPUs.
>=20
> When the ASIC is powered down VRAM is basically dead as well because
> it=20
> won't get refreshed any more.
>=20
> > And copying it all out "Just in case" when transitioning to D3hot
> > just
> > isn't a viable solution.
>=20
> I would say that this is solvable with a hierarchy of power
> management=20
> functionality.
>=20
> E.g. the runtime PM interface works the same for you as it does for=20
> amdgpu with evicting TTM BOs etc....
>=20
> Then separate from runtime PM you have a reference count for the=20
> accessibility of compressed metadata. And while shrinking you only=20
> resume this specific part.

Well this looks like exactly what have with current hardware, or rather
*current* hardware that needs to take the bo lock during runtime pm
doesn't need this type of metadata access, which is currently Lunar-
lake only.

So from a runtime pm deadlock point-of-view we're safe. But then we
need to blit out the metadata and we get a fence to wait for, which
we've been told to avoid in direct reclaim but rather is preferred from
kswapd.

And I must admit I still don't get what the problem is with allowing a
driver LRU loop? The fact that some AMD eviction_valuable()
implementations made bad decisions by far doesn't weigh up for  the
loss of flexibility IMO.

/Thomas

>=20
> Christian.
>=20
> >=20
> > /Thomas
> >=20
>=20

