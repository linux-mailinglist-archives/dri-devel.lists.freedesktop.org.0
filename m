Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6D195B012
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 10:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E411010E396;
	Thu, 22 Aug 2024 08:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cm/1cF3j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75ACE10E396
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 08:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724314912; x=1755850912;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=znW26SsR+zeR+BV7janUJDDlPXgyz06sdklPluKCgSU=;
 b=Cm/1cF3je/6tD5bbGG6oiWsibfxBOZcf0TtoonIJKI1NilNEbA2dkDJz
 Ef6JJGmquqABVkQ+vByGkduqirQfXuh2rya9uvKs2+CQrQfybYTQCE1/P
 RMSu2zscjdcx37LO7aMiWHlyMLMeJZqnmfiJ2bxperOtvowGnfHxU07vH
 xopcVmOEWfCTzYxI/WVNvnKL6JihY+KvoNq0SBXVnAeNzWPW9Q/64JvJ1
 pQNQIArCj/neOfIuJVqZ6afFlKhyfesTFwxsiTrM3Opt67fXHZzwkGmYe
 86RdsEr0yuKN0mMyvBs+mEPbSvglyBjXFpGDyrm8uQrb1w38jQvyNIDLp w==;
X-CSE-ConnectionGUID: JFYQbEpkRBCAKlE0xhr+vw==
X-CSE-MsgGUID: eaoPPn76RUmo4fIFjtzLjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="40176252"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="40176252"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 01:21:51 -0700
X-CSE-ConnectionGUID: xQQbbKBITfSS59EVyu/ZpQ==
X-CSE-MsgGUID: sHzOlfTJTs+inEt0rIxdfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="61393367"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO [10.245.244.60])
 ([10.245.244.60])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 01:21:49 -0700
Message-ID: <75bce0097d86896fa70d6dba4c8ddb429a5bc1bc.camel@linux.intel.com>
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org,  David Airlie <airlied@linux.ie>
Date: Thu, 22 Aug 2024 10:21:47 +0200
In-Reply-To: <8b479754-ea3f-4eb9-a739-26ee38530a23@amd.com>
References: <20240710124301.1628-1-christian.koenig@amd.com>
 <20240710124301.1628-5-christian.koenig@amd.com>
 <Zo7QpJKtVNw4RvUd@DUT025-TGLU.fm.intel.com>
 <14b70a4d-dc65-4886-940c-ffc1a8197821@gmail.com>
 <77995ffc6de401bc8ed2f4181848dffb18540666.camel@linux.intel.com>
 <20bceb24-8cae-4f0a-897e-326dbf8dc186@amd.com>
 <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
 <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
 <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
 <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
 <13a47d22fb6753e20046a983126c6fea675beed2.camel@linux.intel.com>
 <006ba26a-48ed-43e7-8213-72ca0ae553e1@amd.com>
 <fe3a72942e558af26f1b2794f946920a33d316ab.camel@linux.intel.com>
 <e3716526ae9b530adddc815ca12c402b4cf7678b.camel@linux.intel.com>
 <8b479754-ea3f-4eb9-a739-26ee38530a23@amd.com>
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

On Thu, 2024-08-22 at 09:55 +0200, Christian K=C3=B6nig wrote:
> Am 22.08.24 um 08:47 schrieb Thomas Hellstr=C3=B6m:
> > > > > As Sima said, this is complicated but not beyond
> > > > > comprehension:
> > > > > i915
> > > > > https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm=
/i915/gem/i915_gem_shrinker.c#L317
> > > > As far as I can tell what i915 does here is extremely
> > > > questionable.
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (sc->nr_scanned < sc->nr_to_scan =
&&
> > > > current_is_kswapd()) {
> > > > ....
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 with_intel_runtim=
e_pm(&i915->runtime_pm, wakeref) {
> > > >=20
> > > > with_intel_runtime_pm() then calls pm_runtime_get_sync().
> > > >=20
> > > > So basically the i915 shrinker assumes that when called from
> > > > kswapd()
> > > > that it can synchronously wait for runtime PM to power up the
> > > > device
> > > > again.
> > > >=20
> > > > As far as I can tell that means that a device driver makes
> > > > strong
> > > > and
> > > > completely undocumented assumptions how kswapd works
> > > > internally.
> > > Admittedly that looks weird
> > >=20
> > > But I'd really expect a reclaim lockdep splat to happen there if
> > > the
> > > i915 pm did something not-allowed. IIRC, the design direction the
> > > i915
> > > people got from mm people regarding the shrinkers was to avoid
> > > any
> > > sleeps in direct reclaim and punt it to kswapd. Need to ask i915
> > > people
> > > how they can get away with that.
> > >=20
> > >=20
> > So it turns out that Xe integrated pm resume is reclaim-safe, and
> > I'd
> > expect i915's to be as well. Xe discrete pm resume isn't.
> >=20
> > So that means that, at least for integrated, the i915 shrinker
> > should
> > be ok from that POW, and punting certain bos to kswapd is not
> > AFAICT
> > abusing any undocumented features of kswapd but rather a way to
> > avoid
> > resuming the device during direct reclaim, like documented.
>=20
> The more I think about this the more I disagree to this driver
> design.=20
> In my opinion device drivers should *never* resume runtime PM in a=20
> shrinker callback in the first place.

Runtime PM resume is allowed even from irq context if carefully
implemented by the driver and flagged as such to the core.=20

https://docs.kernel.org/power/runtime_pm.html

Resuming runtime PM from reclaim therefore shouldn't be an issue IMO,
and really up to the driver.=20

>=20
> When the device is turned off it means that all of it's operations
> are=20
> stopped and eventually power to caches etc turned off as well. So I=20
> don't see any ongoing writeback operations or similar either.
>=20
> So the question is why do we need to power on the device in a
> shrinker=20
> in the first place?
>=20
> What could be is that the device needs to flush GART TLBs or similar=20
> when it is turned on, e.g. that you grab a PM reference to make sure=20
> that during your HW operation the device doesn't suspend.

Exactly why the i915 needs to flush the GART I'm not sure of but I
suspect the gart TLB might be forgotten while suspended.

>=20
> But that doesn't mean that you should resume the device. In other
> words=20
> when the device is powered down you shouldn't power it up again.
>=20
> And for GART we already have the necessary move callback implemented
> in=20
> TTM. This is done by radeon, amdgpu and nouveu in a common way as far
> as=20
> I can see.
>=20
> So why should Xe be special and follow the very questionable approach
> of=20
> i915 here?

For Xe, Lunar Lake (integrated) has the interesting design that each bo
carries compression metadata that needs to be blitted to system pages
during shrinking. The alternative is to resolve all buffer objects at
device runtime suspend...

But runtime PM aside, with a one-bo only approach we still have the
drawbacks that it=20

* eliminates possibility for driver deadlock avoidance
* Requires TTM knowledge of "purgeable" bos
* Requires an additional LRU to avoid O(n2) traversal of already
shrunken objects
* Drivers with legitimate shrinker designs that don't fit in the TTM-
enforced model will have frustrated maintainers.

Thanks,
Thomas


>=20
> Regards,
> Christian.
>=20
>=20
> >=20
> > /Thomas
> >=20
> >=20
> >=20

