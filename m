Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E45598BE63E
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 16:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2D110FD84;
	Tue,  7 May 2024 14:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SeTI8Iga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D625D10FD84;
 Tue,  7 May 2024 14:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715092896; x=1746628896;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=OOefQy1OnUSF9uW1Yz7kfD1xKpXKTazZrOFwd6DOppY=;
 b=SeTI8IgaqXO0epEdBk6aCOYTVRBbkb7l/05jzWqfct1FE3YBnJEYaeSD
 FZImg0tZ04AaPgAriQoDPQokuIyT+rrdy416rSUCfPReRKTr6g95nPzKy
 1lYGiZI4WiWPzj07ICWPdxKu2ijYLD2gGq/aSRrTQ17NFtEwWvScSBOd9
 gJp6xsC2bhy+s0yUKKTcFQfmB2FYPQ3uknx3x3yIbDAvTSjNYVwqENnIL
 uZM/vjI938ZWcK+tPXOdWFYwA0rtwicfwLx3wum/FCIlu++VIdJyWKGXK
 NbvQqudxM4kjpqJ7HnjoEh64+s5+Qp3I0OJT3vgSYfnf9GVGrffm1o07Y g==;
X-CSE-ConnectionGUID: dk8zQL6hS7OUN24Xw2jIyA==
X-CSE-MsgGUID: C+pA5qbUQTehXG09b3vFLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11049601"
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; d="scan'208";a="11049601"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 07:41:35 -0700
X-CSE-ConnectionGUID: 39awC9IGS8CSAK5MaujBmw==
X-CSE-MsgGUID: SIaABrMeTqm1xmYLRosQxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; d="scan'208";a="28600907"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO [10.245.246.27])
 ([10.245.246.27])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 07:41:33 -0700
Message-ID: <953c157bf69df12d831a781f0f638d93717bb044.camel@linux.intel.com>
Subject: Re: drm_exec changes for eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Tue, 07 May 2024 16:41:31 +0200
In-Reply-To: <e54f1ffc-854f-4dc0-b1b5-257cbe5d9772@amd.com>
References: <9f5f8b3b93b629c8530bbcce9567b51a320c5537.camel@linux.intel.com>
 <e54f1ffc-854f-4dc0-b1b5-257cbe5d9772@amd.com>
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

On Tue, 2024-05-07 at 15:36 +0200, Christian K=C3=B6nig wrote:
> Am 06.05.24 um 11:46 schrieb Thomas Hellstr=C3=B6m:
> > Hi Christian, Others.
> >=20
> > In order to support exhaustive eviction there are some changes that
> > I
> > think needs to be made to drm_exec:
> >=20
> > 1) Trylock support
> > (This is for ttm_bo_vm, ttm_buffer_object_init_reserved, and also
> > for
> > the eviction path where I think we want to make a trylock pass
> > before a
> > sleeping lock pass).
>=20
> Not sure why we need this for ttm_bo_vm, but in general that sounds
> like=20
> the right approach to me as well.

In current ttm_bo_vm, if the trylock fails, the mmap lock is typically
dropped while we wait for the lock to become available, and then the
fault is retried, using the fault retry mechanism. (This is only to
avoid blocking the mmap lock unnecessarily- the comment around that
code is obsolete).

>=20
> > In essence this means we can't leave any contending lock unlocked
> > until
> > the next sleeping lock, but rather need to relock it on
> > drm_exec_retry_on_contention(), meaning that that macro also gets
> > passed and returns an error code to handle -EINTR.
>=20
> Hui what? I can't really follow what you mean here.

Currently drm_exec keeps a reference to the contended lock, which is
not locked. And it is locked on the *next* drm_exec_lock_obj() after a
restart. So the question arises what to do if the *next* lock is a
trylock. We shouldn't really do a sleeping lock of the contended object
at that point. So the suggestion here was to do it during
drm_exec_retry_on_contention() instead. But then we face the problem
that the locking of the contended object might fail with -EINTR.

>=20
> >=20
> > 2) Snapshot unlock
> > After successfully obtaining backing store, we want to unlock all
> > evicted objects. So snapshot the drm_exec state when eviction
> > begins,
> > and unlock everything down to the snapshot after successful backing
> > store allocation. Essentially the snapshot contains the number of
> > locked objects and a pointer to the prelocked object.
>=20
> Interesting idea, never though about that. Not sure if that makes the
> situation better or worse.
>=20
> One goal of drm_exec was to be able to keep evicted BOs locked until
> the=20
> whole submission is completed and that obviously contradicts that.

We've tried both approaches on i915 downstream (non-ttm). IIRC the
snapshot idea was originally brought up by Sima. Couldn't see any real
difference, but I think snapshotting should be sufficient to avoid
starvation.

/Thomas


>=20
> Regards,
> Christian.
>=20
> >=20
> > Any concerns?
> > Thanks,
> > Thomas
> >=20
>=20

