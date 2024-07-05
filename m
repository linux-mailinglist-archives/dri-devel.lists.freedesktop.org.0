Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEA79289BE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 15:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716F610E1B5;
	Fri,  5 Jul 2024 13:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S74Tvjx4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D072010E1B5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 13:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720186422; x=1751722422;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NQJt0oVBMB6nfsZbWY48G7tWz8oznM37wU46AF4PXEk=;
 b=S74Tvjx4HgLeQaADZJP8jsfmCpVpdV9a4L7TplgkvVyT2U08Sh70UreG
 0yaoDaaAbwZKTlyPTv2y3TgfWLLZ5QqjmLMvLCz7CqXezOzu52wId5EbX
 URbOvt/u+oeQOLOCVkCtLTm0P8iaPdm8XombrVnMS98Ql+bIranHaISXe
 xny9eKYChnKGZgjVg37b3cWpnz7NDieE6A9hZr3WOeJVnZPIOGfmFOxY7
 Xb4x6QLm95y5y0n1dguVlj28bx1fBUTuCzqMa3EpdrvE0MM8k9zQN0i0j
 vjVNH8uoXHlQ9OMEmOQOh0iywTEJRjwRMWcVZV6S/4dDv3urMElp62731 A==;
X-CSE-ConnectionGUID: is3gS+ZMQOS6NzfaDgKAQw==
X-CSE-MsgGUID: EorNZK6NRvGum4d4dg6Rvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="21293192"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="21293192"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 06:33:42 -0700
X-CSE-ConnectionGUID: svof4Ni/Tpyt71IigJNJIA==
X-CSE-MsgGUID: WX4G6Tb7SfqbQjvy2lQ5mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="46850930"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO [10.245.245.166])
 ([10.245.245.166])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 06:33:40 -0700
Message-ID: <030210bc0cbc8d797f2c6c424862097212affbc7.camel@linux.intel.com>
Subject: Re: [PATCH 2/5] drm/exec: don't immediately add the prelocked obj
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org
Date: Fri, 05 Jul 2024 15:33:38 +0200
In-Reply-To: <1aff22d6-09e4-42d9-9412-fc44ace145ac@gmail.com>
References: <20240703132602.4756-1-christian.koenig@amd.com>
 <20240703132602.4756-3-christian.koenig@amd.com>
 <c2b5145c72a4d4598bfdde23c532f3f657f0c075.camel@linux.intel.com>
 <1aff22d6-09e4-42d9-9412-fc44ace145ac@gmail.com>
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

On Fri, 2024-07-05 at 14:41 +0200, Christian K=C3=B6nig wrote:
> Am 03.07.24 um 17:51 schrieb Thomas Hellstr=C3=B6m:
> > On Wed, 2024-07-03 at 15:25 +0200, Christian K=C3=B6nig wrote:
> > > Some contended objects might never be locked again in the case of
> > > eviction
> > > handling for example.
> > >=20
> > > Make sure that those doesn't show up in the list of locked
> > > objects
> > > until
> > > they are explicitely mentioned.
> > Could you be a bit more specific in the commit message about in
> > what
> > situations that is bad?
>=20
> The prelocked object is not necessarily expected to be in the list of
> locked objects.
>=20
> I ran into issues because amdgpu tried to validate all locked objects
> and so tried to also validate the prelocked one (which was only
> locked=20
> for eviction).
>=20
> That obviously didn't made much sense.

Indeed. Could you add a similar description to the commit message?

/Thomas



>=20
> Regards,
> Christian.
>=20
> >=20
> > /Thomas
> >=20
> >=20
> >=20
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/drm_exec.c | 18 +++++++++---------
> > > =C2=A0=C2=A01 file changed, 9 insertions(+), 9 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_exec.c
> > > b/drivers/gpu/drm/drm_exec.c
> > > index 2da094bdf8a4..220df336fbd9 100644
> > > --- a/drivers/gpu/drm/drm_exec.c
> > > +++ b/drivers/gpu/drm/drm_exec.c
> > > @@ -61,8 +61,11 @@ static void drm_exec_unlock_all(struct
> > > drm_exec
> > > *exec)
> > > =C2=A0=C2=A0		drm_gem_object_put(obj);
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > -	drm_gem_object_put(exec->prelocked);
> > > -	exec->prelocked =3D NULL;
> > > +	if (exec->prelocked) {
> > > +		dma_resv_unlock(exec->prelocked->resv);
> > > +		drm_gem_object_put(exec->prelocked);
> > > +		exec->prelocked =3D NULL;
> > > +	}
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > =C2=A0=C2=A0/**
> > > @@ -179,16 +182,9 @@ static int drm_exec_lock_contended(struct
> > > drm_exec *exec)
> > > =C2=A0=C2=A0		dma_resv_lock_slow(obj->resv, &exec->ticket);
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > -	ret =3D drm_exec_obj_locked(exec, obj);
> > > -	if (unlikely(ret))
> > > -		goto error_unlock;
> > > -
> > > =C2=A0=C2=A0	exec->prelocked =3D obj;
> > > =C2=A0=C2=A0	return 0;
> > > =C2=A0=20
> > > -error_unlock:
> > > -	dma_resv_unlock(obj->resv);
> > > -
> > > =C2=A0=C2=A0error_dropref:
> > > =C2=A0=C2=A0	drm_gem_object_put(obj);
> > > =C2=A0=C2=A0	return ret;
> > > @@ -214,6 +210,10 @@ int drm_exec_lock_obj(struct drm_exec *exec,
> > > struct drm_gem_object *obj)
> > > =C2=A0=C2=A0		return ret;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	if (exec->prelocked =3D=3D obj) {
> > > +		ret =3D drm_exec_obj_locked(exec, obj);
> > > +		if (unlikely(ret))
> > > +			return ret;
> > > +
> > > =C2=A0=C2=A0		drm_gem_object_put(exec->prelocked);
> > > =C2=A0=C2=A0		exec->prelocked =3D NULL;
> > > =C2=A0=C2=A0		return 0;
>=20

