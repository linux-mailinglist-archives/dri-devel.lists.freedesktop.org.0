Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5E392654B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 17:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FE210E6D1;
	Wed,  3 Jul 2024 15:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ILvQV6NM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F1B10E610
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 15:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720021892; x=1751557892;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ms394A/zPqDI3DaDC87RCpTsmOlsNg4WPz8+xELa/fs=;
 b=ILvQV6NMDXT0hIPZTOEyUlJY4Hbc7EnprSVyI5xcl3tVda3DlLQL2nJ5
 ouTofSMsI+xHXn7k7QiCVHfcRWgO8ikiVNmTE41ps6M40ZZWxBKatsyDM
 ahjFRIhu70YAsech0Pf68fc6f+scTR6EirPrYgOCqrY1pdBHt64wtHyyB
 um1OyWVmisQKq+hsMeoQKq2NvuxZIAH8YqsT/XTx8f/MZo40xYehdeE8h
 B2tLJZ4Dg42WESpcRnVzax4Al3DymMhw10GX6AhqptEcc1+yVbKOOkP6j
 hK7/ajrYGMFmLxtGCnzpMXpeLul8v6BVBrmK8CQ500H5AsfRrBY7bp5E3 w==;
X-CSE-ConnectionGUID: T8ePmQmGQSS3XAmx1PvGEA==
X-CSE-MsgGUID: 3OIOBEzkT16c4h8Yl8OKpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28652813"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="28652813"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 08:51:32 -0700
X-CSE-ConnectionGUID: LOYlVwlDT4SbmdchFoAZ0A==
X-CSE-MsgGUID: CC+7XF+XRVy6U4A3TMiyVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="51254171"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.244.226]) ([10.245.244.226])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 08:51:30 -0700
Message-ID: <c2b5145c72a4d4598bfdde23c532f3f657f0c075.camel@linux.intel.com>
Subject: Re: [PATCH 2/5] drm/exec: don't immediately add the prelocked obj
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org
Date: Wed, 03 Jul 2024 17:51:27 +0200
In-Reply-To: <20240703132602.4756-3-christian.koenig@amd.com>
References: <20240703132602.4756-1-christian.koenig@amd.com>
 <20240703132602.4756-3-christian.koenig@amd.com>
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

On Wed, 2024-07-03 at 15:25 +0200, Christian K=C3=B6nig wrote:
> Some contended objects might never be locked again in the case of
> eviction
> handling for example.
>=20
> Make sure that those doesn't show up in the list of locked objects
> until
> they are explicitely mentioned.

Could you be a bit more specific in the commit message about in what
situations that is bad?

/Thomas



>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/drm_exec.c | 18 +++++++++---------
> =C2=A01 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
> index 2da094bdf8a4..220df336fbd9 100644
> --- a/drivers/gpu/drm/drm_exec.c
> +++ b/drivers/gpu/drm/drm_exec.c
> @@ -61,8 +61,11 @@ static void drm_exec_unlock_all(struct drm_exec
> *exec)
> =C2=A0		drm_gem_object_put(obj);
> =C2=A0	}
> =C2=A0
> -	drm_gem_object_put(exec->prelocked);
> -	exec->prelocked =3D NULL;
> +	if (exec->prelocked) {
> +		dma_resv_unlock(exec->prelocked->resv);
> +		drm_gem_object_put(exec->prelocked);
> +		exec->prelocked =3D NULL;
> +	}
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -179,16 +182,9 @@ static int drm_exec_lock_contended(struct
> drm_exec *exec)
> =C2=A0		dma_resv_lock_slow(obj->resv, &exec->ticket);
> =C2=A0	}
> =C2=A0
> -	ret =3D drm_exec_obj_locked(exec, obj);
> -	if (unlikely(ret))
> -		goto error_unlock;
> -
> =C2=A0	exec->prelocked =3D obj;
> =C2=A0	return 0;
> =C2=A0
> -error_unlock:
> -	dma_resv_unlock(obj->resv);
> -
> =C2=A0error_dropref:
> =C2=A0	drm_gem_object_put(obj);
> =C2=A0	return ret;
> @@ -214,6 +210,10 @@ int drm_exec_lock_obj(struct drm_exec *exec,
> struct drm_gem_object *obj)
> =C2=A0		return ret;
> =C2=A0
> =C2=A0	if (exec->prelocked =3D=3D obj) {
> +		ret =3D drm_exec_obj_locked(exec, obj);
> +		if (unlikely(ret))
> +			return ret;
> +
> =C2=A0		drm_gem_object_put(exec->prelocked);
> =C2=A0		exec->prelocked =3D NULL;
> =C2=A0		return 0;

