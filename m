Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7433F92624A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 15:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A1010E85C;
	Wed,  3 Jul 2024 13:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHzv3XKT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEF510E85C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 13:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720014808; x=1751550808;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jZT1MdnpePgoDTvA9QOLpcXfYEpSu4xgoo8p2GKJVIo=;
 b=GHzv3XKT1YSXggeVKgwOx9epxvxw3TZZVbXgxY+Q6zDbAEnYfqBRoIA0
 gtE35gFK0Kx1QFWfYVvBYXKAjsbOzRV8d6zEaERKAkyum5osWHnZau9wJ
 YvRXUSG8NUagy7bZHatFMOq1NVUC3HoGgakdHQBxh3XpNZ/sNk3ch3c3d
 SfsgPqGwaXjLaHLQ50nTx6TygXyxrk0j/IfHkKwPJOvkwhxW/5jmhDsNh
 QQUByxLBZGL6oDpZeLeb4hwjrae6Z4SywT3YcUiuEZ1huZ31Z7KgsLS/8
 Xei3zfoSzNZYkR0hdcRwRSOeS/T2+NYW9bIiVuzUwao4caWuZUOeElAqB w==;
X-CSE-ConnectionGUID: r/pxEDqNSL6xstcL4PEDHw==
X-CSE-MsgGUID: Ntb1N8g5R7qwbbHVVYgMOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="34694410"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="34694410"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 06:53:28 -0700
X-CSE-ConnectionGUID: RvdDwxXjRAOplRAldgk+xQ==
X-CSE-MsgGUID: O8LZgq1iRMKe1g+5cCDbOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46330663"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.244.226]) ([10.245.244.226])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 06:53:27 -0700
Message-ID: <10c7178a311b0b4abe9e5474de332c08262b4840.camel@linux.intel.com>
Subject: Re: Using drm_exec for TTMs BO eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org
Date: Wed, 03 Jul 2024 15:53:24 +0200
In-Reply-To: <aa97506c2bd1db39eb42f4801e5499adbd57b34c.camel@linux.intel.com>
References: <20240703132602.4756-1-christian.koenig@amd.com>
 <aa97506c2bd1db39eb42f4801e5499adbd57b34c.camel@linux.intel.com>
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

On Wed, 2024-07-03 at 15:40 +0200, Thomas Hellstr=C3=B6m wrote:
> Hi, Christian,
>=20
> On Wed, 2024-07-03 at 15:25 +0200, Christian K=C3=B6nig wrote:
> > Hi guys,
> >=20
> > We recently ran into a problem with deadlocks during eviction and
> > while back Thomas worked on a patch set which was going into the
> > direction of solving this.
> >=20
> > So I simplified it to just the functionality needed to resolve this
> > issue at. The resulting patch set is just the initial first step of
> > using drm_exec in TTM for locking BOs during eviction.
> >=20
> > Should a deadlock happen the drm_exec object is now used to resolve
> > it and prelock the contended object. This approach solves this the
> > ENOMEM issue on contending evictions quite nicely.
> >=20
> > Please review and comment,
> > Christian.
>=20
> Overall it looks sane, but I think it makes sense to review and=C2=A0 lan=
d
> the part of the shrinker series first that touches this eviction path
> and gets rid of a lot of code that's hard to understand and
> simplifies
> the locking a lot. (That part doesn't touch drm_exec), and it has
> been
> pending reviews for some time.
>=20
> I don't think it's correct to bypass that. Then we could work out the
> drm_exec implications.

It's

https://patchwork.freedesktop.org/series/131815/

And in particular patch 7 there brings in the restartable LRU
functionality and sipmlifies eviction immensely and would make the
usage of this patchset's rudimentary drm_exec support easier to
understand and review.

/Thomas


>=20
> /Thomas
>=20
>=20
> >=20
> >=20
>=20

