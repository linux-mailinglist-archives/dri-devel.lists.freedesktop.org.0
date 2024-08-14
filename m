Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C7B9516B6
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 10:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22DE10E426;
	Wed, 14 Aug 2024 08:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jzox4HYB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5C710E085;
 Wed, 14 Aug 2024 08:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723624651; x=1755160651;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=r6hQI285XiNG3jP1yP4sfudPxl+4NbESVi71bND8sV0=;
 b=Jzox4HYBZ0XQiMaxOsyEJY82rgNBowULgfeCXaw2HhhtkI6iLV/OpPje
 JIYv7Sg3EUfMnU7CiR6IYFQde/+DQFrYm4uli/QT5k2yzFEa5f9hSvd2Q
 HjGDBdYDq+wlR1cn4994uGzKnkeooTEe9KTZjfYJxQuzciGjKMByZQHHq
 afs0BEGc+ZIoooDeG+VVj92ogQQkuetaVOcogroEBxReQH9l+hIM6qlV1
 80A60DPeixRzqlWG6lb96WNvG3iof4uGaiotj8i1Vcg1aGqm3gB7s6LFo
 hD8R/DMCBcgcR94nXu6RMiZh3hNiRSR/ssuLHjB7vzCenQFWn4zcDxwRV Q==;
X-CSE-ConnectionGUID: kFv44a/RSDm4jRkyDtWBQg==
X-CSE-MsgGUID: s2iiXAwCTo+W6riACpJFCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32452315"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="32452315"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 01:37:29 -0700
X-CSE-ConnectionGUID: YPXlBIFlS2u7ul1SOEoLGg==
X-CSE-MsgGUID: uH6fRw81QQCTDigiZrWEzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="63350259"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO [10.245.245.21])
 ([10.245.245.21])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 01:37:28 -0700
Message-ID: <0d406a89b1b63ebf53c5d0848843c72299c1ff75.camel@linux.intel.com>
Subject: Re: [RFC PATCH] dma-buf/dma-fence: Use a successful read_trylock()
 annotation for dma_fence_begin_signalling()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian Koenig <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
 linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Wed, 14 Aug 2024 10:37:26 +0200
In-Reply-To: <ZrxYdIDdEJXRTFrn@phenom.ffwll.local>
References: <20230428125233.228353-1-thomas.hellstrom@linux.intel.com>
 <be9b192a-a125-6774-bb4f-8b9fb517ce0d@linux.intel.com>
 <ZrxYdIDdEJXRTFrn@phenom.ffwll.local>
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

Christian,

Ack to merge this through drm-misc-next, or do you want to pick it up
for dma-buf?

Thanks,
Thomas


On Wed, 2024-08-14 at 09:10 +0200, Daniel Vetter wrote:
> On Fri, May 26, 2023 at 01:11:28PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Daniel,
> >=20
> > On 4/28/23 14:52, Thomas Hellstr=C3=B6m wrote:
> > > Condsider the following call sequence:
> > >=20
> > > /* Upper layer */
> > > dma_fence_begin_signalling();
> > > lock(tainted_shared_lock);
> > > /* Driver callback */
> > > dma_fence_begin_signalling();
> > > ...
> > >=20
> > > The driver might here use a utility that is annotated as intended
> > > for the
> > > dma-fence signalling critical path. Now if the upper layer isn't
> > > correctly
> > > annotated yet for whatever reason, resulting in
> > >=20
> > > /* Upper layer */
> > > lock(tainted_shared_lock);
> > > /* Driver callback */
> > > dma_fence_begin_signalling();
> > >=20
> > > We will receive a false lockdep locking order violation
> > > notification from
> > > dma_fence_begin_signalling(). However entering a dma-fence
> > > signalling
> > > critical section itself doesn't block and could not cause a
> > > deadlock.
> > >=20
> > > So use a successful read_trylock() annotation instead for
> > > dma_fence_begin_signalling(). That will make sure that the
> > > locking order
> > > is correctly registered in the first case, and doesn't register
> > > any
> > > locking order in the second case.
> > >=20
> > > The alternative is of course to make sure that the "Upper layer"
> > > is always
> > > correctly annotated. But experience shows that's not easily
> > > achievable
> > > in all cases.
> > >=20
> > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com>
> >=20
> > Resurrecting the discussion on this one. I can't see a situation
> > where we
> > would miss *relevant* locking
> > order violation warnings with this patch. Ofc if we have a
> > scheduler
> > annotation patch that would work fine as well, but the lack of
> > annotation in
> > the scheduler callbacks is really starting to hurt us.
>=20
> Yeah this is just a bit too brain-melting to review, but I concur
> now.
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>










>=20
> I think what would help is some lockdep selftests to check that we
> both
> catch the stuff we want to, and don't incur false positives. Maybe
> with a
> plea that lockdep should have some native form of cross-release
> annotations ...
>=20
> But definitely seperate patch set, since it might take a few rounds
> of
> review by lockdep folks.
> -Sima
>=20
> >=20
> > Thanks,
> >=20
> > Thomas
> >=20
> >=20
> >=20
> > > ---
> > > =C2=A0 drivers/dma-buf/dma-fence.c | 6 +++---
> > > =C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-
> > > fence.c
> > > index f177c56269bb..17f632768ef9 100644
> > > --- a/drivers/dma-buf/dma-fence.c
> > > +++ b/drivers/dma-buf/dma-fence.c
> > > @@ -308,8 +308,8 @@ bool dma_fence_begin_signalling(void)
> > > =C2=A0=C2=A0	if (in_atomic())
> > > =C2=A0=C2=A0		return true;
> > > -	/* ... and non-recursive readlock */
> > > -	lock_acquire(&dma_fence_lockdep_map, 0, 0, 1, 1, NULL,
> > > _RET_IP_);
> > > +	/* ... and non-recursive successful read_trylock */
> > > +	lock_acquire(&dma_fence_lockdep_map, 0, 1, 1, 1, NULL,
> > > _RET_IP_);
> > > =C2=A0=C2=A0	return false;
> > > =C2=A0 }
> > > @@ -340,7 +340,7 @@ void __dma_fence_might_wait(void)
> > > =C2=A0=C2=A0	lock_map_acquire(&dma_fence_lockdep_map);
> > > =C2=A0=C2=A0	lock_map_release(&dma_fence_lockdep_map);
> > > =C2=A0=C2=A0	if (tmp)
> > > -		lock_acquire(&dma_fence_lockdep_map, 0, 0, 1, 1,
> > > NULL, _THIS_IP_);
> > > +		lock_acquire(&dma_fence_lockdep_map, 0, 1, 1, 1,
> > > NULL, _THIS_IP_);
> > > =C2=A0 }
> > > =C2=A0 #endif
>=20

