Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A1D95ADF1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF7B10E775;
	Thu, 22 Aug 2024 06:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YWVztXYf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2794810E775
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 06:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724309273; x=1755845273;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=iw3Su6fSP5Sgq1NVoPRyIsjoV0ccqKsNA+OwpfyzNqU=;
 b=YWVztXYfOdkg2CrVDrUMBEwHajVTT0MuGQWbaNtUZrZelxTyOTf4Rfyc
 TNbRyAXHYxECTqIL0tUaoa0asTZUiei4H+oy9WfaVn4otMY4Li44LvVLe
 wR7ELLEUKiELTK12Rph8v6aTuRvq9oC3Jz3LE1B9fkSadIDqXS0Zyi/LZ
 DtWaOZq65tMJV/TK9XFLHf2/Kb/7NRzATcqJXWsec26Hh1sE7ypqad2yV
 40ibaM9PX8ykmq47gFYoBNl0DpkpkZYq1dG4k++MH2vDnjkoA2g1oHjrM
 mvnBESyZrXVoMp4JpFpbQhkc+5+vYumOquU4C2cA29ZAotTxBU3xbJu6S A==;
X-CSE-ConnectionGUID: gYigW84lQBKJTfHaVu64jg==
X-CSE-MsgGUID: p232O9deTQSUNt+1My/eIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="45229605"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="45229605"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 23:47:52 -0700
X-CSE-ConnectionGUID: uNm3qYZkTCO7PI2jdbrurg==
X-CSE-MsgGUID: tCgfh1J8R4mLV252LdxzRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="61367200"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO [10.245.244.60])
 ([10.245.244.60])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 23:47:51 -0700
Message-ID: <e3716526ae9b530adddc815ca12c402b4cf7678b.camel@linux.intel.com>
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org,  David Airlie <airlied@linux.ie>
Date: Thu, 22 Aug 2024 08:47:48 +0200
In-Reply-To: <fe3a72942e558af26f1b2794f946920a33d316ab.camel@linux.intel.com>
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

On Wed, 2024-08-21 at 14:00 +0200, Thomas Hellstr=C3=B6m wrote:
> Hi,
>=20
> On Wed, 2024-08-21 at 11:48 +0200, Christian K=C3=B6nig wrote:
> > Am 21.08.24 um 10:57 schrieb Thomas Hellstr=C3=B6m:
> > > On Wed, 2024-08-21 at 10:14 +0200, Christian K=C3=B6nig wrote:
> > > > Am 20.08.24 um 18:00 schrieb Thomas Hellstr=C3=B6m:
> > > > > > Or why exactly should shrinking fail?
> > > > > A common example would be not having runtime pm and the
> > > > > particular
> > > > > bo
> > > > > needs it to unbind, we want to try the next bo. Example: i915
> > > > > GGTT
> > > > > bound bos and Lunar Lake PL_TT bos.
> > > > WHAT? So you basically block shrinking BOs because you can't
> > > > unbind
> > > > them
> > > > because the device is powered down?
> > > >=20
> > > > I would say that this is a serious NO-GO. It basically means
> > > > that
> > > > powered down devices can lock down system memory for undefined
> > > > amount
> > > > of
> > > > time.
> > > >=20
> > > > In other words an application can allocate memory, map it into
> > > > GGTT
> > > > and
> > > > then suspend or even get killed and we are not able to recover
> > > > the
> > > > memory because there is no activity on the GPU any more?
> > > >=20
> > > > That really sounds like a bug in the driver design to me.
> > > It's bad but it's not as bad as it sounds.
> > >=20
> > > Problem is we can't wake up during direct reclaim IIRC due to
> > > runtime
> > > pm lockdep violations, but we can and do fire up a thread to wake
> > > the
> > > device and after the wakeup delay have subsequent shrink calls
> > > succeed,
> > > or punt to kswapd or the oom handler.
> >=20
> > Yeah that is obvious. The runtime PM is an interface designed to be
> > used=20
> > from a very high level IOCTL/system call.
> >=20
> > And delegating that from a shrinker to a worker is not valid as far
> > as I=20
> > can see, instead of reducing the memory pressure the shrinker would
> > then=20
> > increase it.
>=20
> Perhaps an ignorant question, but aren't IO devices potentially woken
> up for swapout at memory pressure time using runtime PM, thereby
> increasing memory pressure in a similar way?
>=20
> >=20
> > > I think that's an orthogonal discussion, though. There are other
> > > reasons shrinking might fail, like the bo being busy in direct
> > > reclaim
> > > (shouldn't wait for idle there but ok in kswapd), Other points of
> > > failure is ofc shmem radix tree allocations (not seen one yet,
> > > though)
> > > which might succeed with a smaller bo.
> > > (Not saying, though, that there isn't more to be done with the xe
> > > runtime pm implementation).
> >=20
> > I don't think that argumentation is valid.
> >=20
> > When a BO is locked then that it is ok to not shrink it, but TTM
> > should=20
> > be able to determine all those prerequisites.
> >=20
> > In other words the idea of a function returning a BO to the driver
> > is
> > that the driver is obligated to shrink that one.
>=20
> But that doesn't take potential driver deadlock avoidance into
> account,
> so it would restrict=C2=A0the driver shrinkers by assuming that all
> deadlock
> avoidance needed is known by TTM.
>=20
> And since small memory allocations are allowed even at reclaim time
> to
> be able so reclaim or shrink even more memory, IMO the pm resume
> problem reduces into a deadlock avoidance problem where we use
> pm_tryget similar to bo_trylock. Important thing, though, in both
> cases, that the device is woken or similarly the lock is released in
> reasonable time for the reclaim to retry and succeed.
>=20
> >=20
> > That other necessary allocation can fail like shmen for example is=20
> > obvious as well, but that's why we discussed to allow shrinking BOs
> > partially as well.
>=20
> Good point, that eliminates that problem.
>=20
> >=20
> > And I really don't think this discussion is orthogonal. We are
> > basically=20
> > discussing what drivers should do and not should do. And as far as
> > I
> > can=20
> > see the requirement to expose the LRUs to drivers comes up only
> > because=20
> > the driver wants to do something it shouldn't.
>=20
> Currently we have the purgeable vs non-purgeable and driver-level
> trylock-type deadlock avoidance not falling into those categories.
> And
> I'd like to categorize runtime pm as a trylock-type deadlock
> avoidance.
>=20
> bo trylock and idle could, as you say, be handled in the TTM helper,
> so
> can purgeable and non-purgeable at lack of swap-space, provided that
> we
> provide such a flag in the ttm_bo ofc?
>=20
> >=20
> > > > > And again, all other drm bo shrinkers do this. We just want
> > > > > to
> > > > > do
> > > > > the
> > > > > same.
> > > > Do you have pointers?
> > > As Sima said, this is complicated but not beyond comprehension:
> > > i915
> > > https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/i91=
5/gem/i915_gem_shrinker.c#L317
> >=20
> > As far as I can tell what i915 does here is extremely questionable.
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 if (sc->nr_scanned < sc->nr_to_scan && current=
_is_kswapd()) {
> > ....
> > =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 with_intel_runtime_pm(&i915=
->runtime_pm, wakeref) {
> >=20
> > with_intel_runtime_pm() then calls pm_runtime_get_sync().
> >=20
> > So basically the i915 shrinker assumes that when called from
> > kswapd()
> > that it can synchronously wait for runtime PM to power up the
> > device
> > again.
> >=20
> > As far as I can tell that means that a device driver makes strong
> > and
> > completely undocumented assumptions how kswapd works internally.
>=20
> Admittedly that looks weird
>=20
> But I'd really expect a reclaim lockdep splat to happen there if the
> i915 pm did something not-allowed. IIRC, the design direction the
> i915
> people got from mm people regarding the shrinkers was to avoid any
> sleeps in direct reclaim and punt it to kswapd. Need to ask i915
> people
> how they can get away with that.
>=20
>=20

So it turns out that Xe integrated pm resume is reclaim-safe, and I'd
expect i915's to be as well. Xe discrete pm resume isn't.

So that means that, at least for integrated, the i915 shrinker should
be ok from that POW, and punting certain bos to kswapd is not AFAICT
abusing any undocumented features of kswapd but rather a way to avoid
resuming the device during direct reclaim, like documented.

/Thomas



