Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CACA959726
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 11:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDEC10E501;
	Wed, 21 Aug 2024 09:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FxNY3rFx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D85610E501
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 09:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724232718; x=1755768718;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=D9QjcWKQAt2pS0N6qX+deEauZmkG8lWFGlyw1dCVFDk=;
 b=FxNY3rFxF8Rn11vgyjUoyCTrcKjurdRBKhMUjvGUhwBHJzitPv0GYe0d
 4T32cZo8GwtmRrhD15S2eKjLI33EppMdWGTxiY82OZXBqLW2rOGcvYItu
 xK4JZA1ZW2TBngyZgtHMo9uqyxEuSNW+hgrUoeaL+TGepR8LVpoivD3Wp
 MMCbss9lFMOnq7YcUY4xvLis2D9AV4MYMFbeTyHeYjA4f3Noy4J5WInyd
 YCCee6DNwUPdHB51MZzD01K287adzjVBLp4xGiVO49NmVvYaf2etWBva2
 XJtkDY5kCA/ziOvyXJ6T/ZQcpfEVVlWNTJOHbgGO6jyjfFFCdKq44uWwK Q==;
X-CSE-ConnectionGUID: MBF06+ESSkW8jEkXu0NqPg==
X-CSE-MsgGUID: hYHsbox4SVq82KAxZ+JcKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26334763"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="26334763"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 02:31:57 -0700
X-CSE-ConnectionGUID: 9G+tTO1xTZ+Oykmo6xDydA==
X-CSE-MsgGUID: RRn0tgojT4es3CRIoOsR8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61057275"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO [10.245.245.182])
 ([10.245.245.182])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 02:31:56 -0700
Message-ID: <d7a76a505fe2236265ecd4e1b29a95b94b893889.camel@linux.intel.com>
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Date: Wed, 21 Aug 2024 11:31:53 +0200
In-Reply-To: <13a47d22fb6753e20046a983126c6fea675beed2.camel@linux.intel.com>
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

On Wed, 2024-08-21 at 10:57 +0200, Thomas Hellstr=C3=B6m wrote:
> On Wed, 2024-08-21 at 10:14 +0200, Christian K=C3=B6nig wrote:
> > Am 20.08.24 um 18:00 schrieb Thomas Hellstr=C3=B6m:
> > > > Or why exactly should shrinking fail?
> > > A common example would be not having runtime pm and the
> > > particular
> > > bo
> > > needs it to unbind, we want to try the next bo. Example: i915
> > > GGTT
> > > bound bos and Lunar Lake PL_TT bos.
> >=20
> > WHAT? So you basically block shrinking BOs because you can't unbind
> > them=20
> > because the device is powered down?
> >=20
> > I would say that this is a serious NO-GO. It basically means that=20
> > powered down devices can lock down system memory for undefined
> > amount
> > of=20
> > time.
> >=20
> > In other words an application can allocate memory, map it into GGTT
> > and=20
> > then suspend or even get killed and we are not able to recover the=20
> > memory because there is no activity on the GPU any more?
> >=20
> > That really sounds like a bug in the driver design to me.
>=20
> It's bad but it's not as bad as it sounds.
>=20
> Problem is we can't wake up during direct reclaim IIRC due to runtime
> pm lockdep violations, but we can and do fire up a thread to wake the
> device and after the wakeup delay have subsequent shrink calls
> succeed,
> or punt to kswapd or the oom handler.
> I think that's an orthogonal discussion, though. There are other
> reasons shrinking might fail, like the bo being busy in direct
> reclaim
> (shouldn't wait for idle there but ok in kswapd), Other points of
> failure is ofc shmem radix tree allocations (not seen one yet,
> though)
> which might succeed with a smaller bo.
> (Not saying, though, that there isn't more to be done with the xe
> runtime pm implementation).
>=20
> >=20
> > > And again, all other drm bo shrinkers do this. We just want to do
> > > the
> > > same.
> >=20
> > Do you have pointers?
>=20
> As Sima said, this is complicated but not beyond comprehension: i915
> https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/i915/ge=
m/i915_gem_shrinker.c#L317
>=20
> msm:
> https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/i915/ge=
m/i915_gem_shrinker.c#L317
> which uses
> https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/drm_gem=
.c#L1426
> that is very similar in structure to what I implemented for TTM.
>=20
> Panfrost: (although only purgeable objects AFAICT).
> https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/drm_gem=
.c#L1426
>=20
>=20
> >=20
> > > > > If we bump LRU we could end up with infinite loops.
> > > > > So IMO we need to be able to loop. I don't really care wether
> > > > > we do
> > > > > this as an explicit loop or whether we use the LRU walker,
> > > > > but
> > > > > I
> > > > > think
> > > > > from a maintainability point-of-view it is better to keep LRU
> > > > > walking
> > > > > in a single place.
> > > > >=20
> > > > > If we return an unlocked object, we'd need to refcount and
> > > > > drop
> > > > > the
> > > > > lru
> > > > > lock, but maybe that's not a bad thing.
> > > > >=20
> > > > > But what's the main drawback of exporting the existing
> > > > > helper.
> > > > Well that we re-creates exactly the mid-layer mess I worked so
> > > > hard
> > > > to
> > > > remove from TTM.
> > > It doesn't IMO. I agree the first attempt did. This affects only
> > > the
> > > LRU iteration itself and I'm even fine to get rid of the callback
> > > using
> > > a for_ macro.
> >=20
> > Well, I mean using a for_each approach is objectively better than
> > having=20
> > a callback and a state bag.
> >=20
> > But the fundamental question is if drivers are allowed to reject=20
> > shrinking. And I think the answer is no, they need to be designed
> > in
> > a=20
> > way where shrinking is always possible.
>=20
> Rejects can be out of our control, due to anticipated deadlocks, oom
> and deferring to kswapd.
>=20
> >=20
> > What can be that we can't get the necessary locks to evict and
> > object
> > (because it's about to be used etc...), but that are the per-
> > requisites=20
> > TTM should be checking.
> >=20
> > > > > In any case, I don't think TTM should enforce a different way
> > > > > of
> > > > > shrinking by the means of a severely restricted helper?
> > > > Well, as far as I can see that is exactly what TTM should do.
> > > >=20
> > > > I mean the main advantage to make a common component is to
> > > > enforce
> > > > correct behavior.
> > > But if all other drivers don't agree this as correct behavior and
> > > instead want to keep behavior that is proven to work, that's a
> > > dead
> > > end.
> >=20
> > Well no, even if all drivers agree to (for example) drop security=20
> > precautions it's still not something acceptable.
> >=20
> > And same thing here, if we block shrinking because drivers think
> > they
> > want their runtime PM implemented in a certain way then upstream
> > needs=20
> > to block this and push back.
> >=20
> > As far as I can see it's mandatory to have shrinkers not depend on=20
> > runtime PM, cause otherwise you run into resources handling which=20
> > depends on the well behavior of userspace and that in turn in
> > something=20
> > we can't allow.
>=20
> Please see the above explanation for runtime pm, and for the record I
> agree that enforcing disallowed or security violations is a
> completely
> valid thing.

Meant to say enforcing disallowing security violations..

Another thing that came to my mind is ofc swap_space. Depending on how
backup is done if we're out of swap space we can only shrink purgeable
WONTNEED objects (user-space pools typically), and TTM has no knowledge
of those (currently at least).

/Thomas


>=20
> /Thomas
>=20
> >=20
> > Regards,
> > Christian.
> >=20
> > >=20
> > > /Thomas
> > >=20
> > >=20
> > > > Regards,
> > > > Christian.
> > > >=20
> > > > > /Thomas
> > > > >=20
>=20

