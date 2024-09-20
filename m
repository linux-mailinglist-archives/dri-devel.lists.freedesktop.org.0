Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD70497D1F2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 09:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4890910E7D0;
	Fri, 20 Sep 2024 07:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+NudMcg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C665710E0AC;
 Fri, 20 Sep 2024 07:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726818396; x=1758354396;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sh9MfekUbazKEajbVSy1ZCdAZiqR3S/QEcTbLqenAdA=;
 b=M+NudMcgLDOEDciVa3IcRYUV57IsvMfUCOxF8uABLpLMZF7WoQ4Zyxh0
 B2YoaWtLj1CKqyp1WcBh9NcN4DlwwUbrUaP8/uVn+/5kkBsKlwprhLf44
 NK7OQ1f0CQMKzn+bIuybPNuXGlk53WQX+q2fpBwSqhrICdMZwdjgTO1Rm
 /VaWi+G0ASiBerb6RvRYGvTjAihaHYkDVXv8fyXXbo2SWCJxDY0qMV4B8
 7iSDky/BpT9ZHPXeO4O5n7CmoRNx+A+cxxOsZHqOCmmE87Q9yAaz5UDF2
 Fr21wXvXKFlLA+oC1aRKHJgEsnCD26oxcXPoD0Rf3RA9grt3HabxlBWNd Q==;
X-CSE-ConnectionGUID: zNVmC5iEQ3WmMk5Ml7tGYA==
X-CSE-MsgGUID: 2VsW6Mi3QCKi+jZ9PAIhIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25961482"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="25961482"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 00:46:36 -0700
X-CSE-ConnectionGUID: 3sUMhZ/vSxuQWSRbBEh1yg==
X-CSE-MsgGUID: Ge+iiJX/ROKrhVGt+YbvZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="70453949"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.0])
 ([10.245.245.0])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 00:46:34 -0700
Message-ID: <3a31238d9477902b63499a5587e6c79bbfe293a0.camel@linux.intel.com>
Subject: Re: RESEND Re: [RFC PATCH] dma-buf/dma-fence: Use a successful
 read_trylock() annotation for dma_fence_begin_signalling()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
 linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Fri, 20 Sep 2024 09:46:31 +0200
In-Reply-To: <b6808146-b798-45b6-b2b3-61d97825a85f@amd.com>
References: <20230428125233.228353-1-thomas.hellstrom@linux.intel.com>
 <be9b192a-a125-6774-bb4f-8b9fb517ce0d@linux.intel.com>
 <ZrxYdIDdEJXRTFrn@phenom.ffwll.local>
 <0d406a89b1b63ebf53c5d0848843c72299c1ff75.camel@linux.intel.com>
 <a97c5f63053000b5fcfc14cb56c79c8ff976b4ad.camel@linux.intel.com>
 <b6808146-b798-45b6-b2b3-61d97825a85f@amd.com>
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

On Wed, 2024-09-18 at 15:18 +0200, Christian K=C3=B6nig wrote:
> Sorry, somehow completely missed that. Feel free to push it to=20
> drm-misc-next.
>=20
> Christian.

Pushed, thanks.
/Thomas


>=20
> Am 18.09.24 um 14:34 schrieb Thomas Hellstr=C3=B6m:
> > Christian,
> >=20
> > Ping?
> >=20
> >=20
> > On Wed, 2024-08-14 at 10:37 +0200, Thomas Hellstr=C3=B6m wrote:
> > > Christian,
> > >=20
> > > Ack to merge this through drm-misc-next, or do you want to pick
> > > it up
> > > for dma-buf?
> > >=20
> > > Thanks,
> > > Thomas
> > >=20
> > >=20
> > > On Wed, 2024-08-14 at 09:10 +0200, Daniel Vetter wrote:
> > > > On Fri, May 26, 2023 at 01:11:28PM +0200, Thomas Hellstr=C3=B6m
> > > > wrote:
> > > > > Daniel,
> > > > >=20
> > > > > On 4/28/23 14:52, Thomas Hellstr=C3=B6m wrote:
> > > > > > Condsider the following call sequence:
> > > > > >=20
> > > > > > /* Upper layer */
> > > > > > dma_fence_begin_signalling();
> > > > > > lock(tainted_shared_lock);
> > > > > > /* Driver callback */
> > > > > > dma_fence_begin_signalling();
> > > > > > ...
> > > > > >=20
> > > > > > The driver might here use a utility that is annotated as
> > > > > > intended
> > > > > > for the
> > > > > > dma-fence signalling critical path. Now if the upper layer
> > > > > > isn't
> > > > > > correctly
> > > > > > annotated yet for whatever reason, resulting in
> > > > > >=20
> > > > > > /* Upper layer */
> > > > > > lock(tainted_shared_lock);
> > > > > > /* Driver callback */
> > > > > > dma_fence_begin_signalling();
> > > > > >=20
> > > > > > We will receive a false lockdep locking order violation
> > > > > > notification from
> > > > > > dma_fence_begin_signalling(). However entering a dma-fence
> > > > > > signalling
> > > > > > critical section itself doesn't block and could not cause a
> > > > > > deadlock.
> > > > > >=20
> > > > > > So use a successful read_trylock() annotation instead for
> > > > > > dma_fence_begin_signalling(). That will make sure that the
> > > > > > locking order
> > > > > > is correctly registered in the first case, and doesn't
> > > > > > register
> > > > > > any
> > > > > > locking order in the second case.
> > > > > >=20
> > > > > > The alternative is of course to make sure that the "Upper
> > > > > > layer"
> > > > > > is always
> > > > > > correctly annotated. But experience shows that's not easily
> > > > > > achievable
> > > > > > in all cases.
> > > > > >=20
> > > > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > > > <thomas.hellstrom@linux.intel.com>
> > > > > Resurrecting the discussion on this one. I can't see a
> > > > > situation
> > > > > where we
> > > > > would miss *relevant* locking
> > > > > order violation warnings with this patch. Ofc if we have a
> > > > > scheduler
> > > > > annotation patch that would work fine as well, but the lack
> > > > > of
> > > > > annotation in
> > > > > the scheduler callbacks is really starting to hurt us.
> > > > Yeah this is just a bit too brain-melting to review, but I
> > > > concur
> > > > now.
> > > >=20
> > > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > > > I think what would help is some lockdep selftests to check that
> > > > we
> > > > both
> > > > catch the stuff we want to, and don't incur false positives.
> > > > Maybe
> > > > with a
> > > > plea that lockdep should have some native form of cross-release
> > > > annotations ...
> > > >=20
> > > > But definitely seperate patch set, since it might take a few
> > > > rounds
> > > > of
> > > > review by lockdep folks.
> > > > -Sima
> > > >=20
> > > > > Thanks,
> > > > >=20
> > > > > Thomas
> > > > >=20
> > > > >=20
> > > > >=20
> > > > > > ---
> > > > > > =C2=A0=C2=A0 drivers/dma-buf/dma-fence.c | 6 +++---
> > > > > > =C2=A0=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > >=20
> > > > > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-
> > > > > > buf/dma-
> > > > > > fence.c
> > > > > > index f177c56269bb..17f632768ef9 100644
> > > > > > --- a/drivers/dma-buf/dma-fence.c
> > > > > > +++ b/drivers/dma-buf/dma-fence.c
> > > > > > @@ -308,8 +308,8 @@ bool dma_fence_begin_signalling(void)
> > > > > > =C2=A0=C2=A0=C2=A0	if (in_atomic())
> > > > > > =C2=A0=C2=A0=C2=A0		return true;
> > > > > > -	/* ... and non-recursive readlock */
> > > > > > -	lock_acquire(&dma_fence_lockdep_map, 0, 0, 1, 1,
> > > > > > NULL,
> > > > > > _RET_IP_);
> > > > > > +	/* ... and non-recursive successful read_trylock
> > > > > > */
> > > > > > +	lock_acquire(&dma_fence_lockdep_map, 0, 1, 1, 1,
> > > > > > NULL,
> > > > > > _RET_IP_);
> > > > > > =C2=A0=C2=A0=C2=A0	return false;
> > > > > > =C2=A0=C2=A0 }
> > > > > > @@ -340,7 +340,7 @@ void __dma_fence_might_wait(void)
> > > > > > =C2=A0=C2=A0=C2=A0	lock_map_acquire(&dma_fence_lockdep_map);
> > > > > > =C2=A0=C2=A0=C2=A0	lock_map_release(&dma_fence_lockdep_map);
> > > > > > =C2=A0=C2=A0=C2=A0	if (tmp)
> > > > > > -		lock_acquire(&dma_fence_lockdep_map, 0, 0,
> > > > > > 1,
> > > > > > 1,
> > > > > > NULL, _THIS_IP_);
> > > > > > +		lock_acquire(&dma_fence_lockdep_map, 0, 1,
> > > > > > 1,
> > > > > > 1,
> > > > > > NULL, _THIS_IP_);
> > > > > > =C2=A0=C2=A0 }
> > > > > > =C2=A0=C2=A0 #endif
>=20

