Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BAA9265C2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 18:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CDB10E129;
	Wed,  3 Jul 2024 16:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBeA53c0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F85C10E129
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 16:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720023188; x=1751559188;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UOmeGACHs+60ehVlCPorngFLNXfYsUn/85fNe0EYbHQ=;
 b=TBeA53c01tzTTAyM+rF0kvrKo8u2yGVHCmyiWaiQnDP5w4tlh5mGiUBE
 oMKep/FKJbC6eQviEoXtiHqHF84d/Ui3b4cGK63NHmSCDjdnY5NWzYLH/
 PLXDcRHtTxogN+yLDh7oWp8VF1aP/AKYXtfz19tPnXpV8AcnE5kgPnX57
 ZYDjlUpsrv/nwt3e4v5WawoTWCPNlrCbUetFAu5gouqX3QgkLlIPiF9Il
 uYYXvNadxXvB6DOU0etM6zSLbGUfb01U+gLuugT+eKyY/cIf8kgFJ19qT
 iyS/hfQ236i0WfhjWzC9R81w4a0CgnvcM2B5b8LhiSc1kpGVbz1XD5oVm A==;
X-CSE-ConnectionGUID: OHgC+DeUQQ6Rf9SQYvr0ww==
X-CSE-MsgGUID: uV+XzIJWSiWZzFE5EEABTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="21025410"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="21025410"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 09:13:08 -0700
X-CSE-ConnectionGUID: t+fq1g3YSmaLLootEDngig==
X-CSE-MsgGUID: 4Mm7fdN4QTCwQxEufkxiCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="51265236"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.244.226]) ([10.245.244.226])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 09:13:07 -0700
Message-ID: <1fe1ee4ce82f56d8b666fe829d65e6895b2c7050.camel@linux.intel.com>
Subject: Re: [PATCH 3/5] drm/exec: provide trylock interface for eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org
Date: Wed, 03 Jul 2024 18:13:04 +0200
In-Reply-To: <20240703132602.4756-4-christian.koenig@amd.com>
References: <20240703132602.4756-1-christian.koenig@amd.com>
 <20240703132602.4756-4-christian.koenig@amd.com>
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

On Wed, 2024-07-03 at 15:26 +0200, Christian K=C3=B6nig wrote:
> The TTM eviction path has some additional requirements which make it
> necessary to trylock an object and then eventually keep or drop the
> lock
> again.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/drm_exec.c | 77
> ++++++++++++++++++++++++++++++++++++++
> =C2=A0include/drm/drm_exec.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +++
> =C2=A02 files changed, 82 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
> index 220df336fbd9..b81bf5a92d97 100644
> --- a/drivers/gpu/drm/drm_exec.c
> +++ b/drivers/gpu/drm/drm_exec.c
> @@ -336,5 +336,82 @@ int drm_exec_prepare_array(struct drm_exec
> *exec,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_exec_prepare_array);
> =C2=A0
> +/**
> + * drm_exec_trylock_obj - try to lock a GEM object
> + * @exec: the drm_exec object with the state
> + * @obj: the GEM object to trylock
> + *
> + * Try to lock a GEM object but don't grab a reference yet.
> + *
> + * Since we can't handle contention here it's illegal to trylock the
> first
> + * object.
> + *
> + * This function is suposed to be used from atomic context and we
> don't
> + * know if the GEM object will actually be used or not. So we don't
> grab a
> + * reference yet.

With the pending LRU walker the *need* for atomic context here is gone.

> + *
> + * Returns: True if the object could be locked, false otherwise.
> + */
> +bool drm_exec_trylock_obj(struct drm_exec *exec, struct
> drm_gem_object *obj)
> +{
> +	if (WARN_ON(!exec->num_objects))
> +		return false;

I think we were in the middle of the discussion here about how to
handle this. IIRC the last suggestion was to=20

if (exec->contended)
     return false;

and provide a=20

drm_exec_sanitize_for_trylock() function that could be used to pre-lock
the contended lock (and perhaps provide any needed memory to register
so that a lock in atomic context could be made)

The use-case I'm worried about moving forward is, again, bo creation
where I think a push out of the validation will make the conversion of
drm_exec buffer object creation in drivers much more complicated than
it already is. Or perhaps I'm misunderstanding how that was supposed to
work.

/Thomas


> +
> +	if (exec->prelocked =3D=3D obj)
> +		return true;
> +
> +	return dma_resv_trylock_ctx(obj->resv, &exec->ticket);
> +}
> +EXPORT_SYMBOL(drm_exec_trylock_obj);
> +
> +/**
> + * drm_exec_keep_trylocked_obj - keep the trylocked obj
> + * @exec: the drm_exec object with the state
> + * @obj: the GEM object to trylock
> + *
> + * Keep a trylocked object in the drm_exec state object. Grabs a
> reference to
> + * the object and adds it to the container of locked objects.
> + */

So these could be dropped.


> +int drm_exec_keep_trylocked_obj(struct drm_exec *exec,
> +				struct drm_gem_object *obj)
> +{
> +	int ret;
> +
> +	ret =3D drm_exec_obj_locked(exec, obj);
> +	if (ret) {
> +		dma_resv_unlock(obj->resv);
> +		return ret;
> +	}
> +
> +	if (exec->prelocked =3D=3D obj) {
> +		drm_gem_object_put(exec->prelocked);
> +		exec->prelocked =3D NULL;
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_exec_keep_trylocked_obj);
> +
> +/**
> + * drm_exec_drop_trylocked_obj - drop the trylocked obj
> + * @exec: the drm_exec object with the state
> + * @obj: the GEM object to trylock
> + *
> + * Used to drop a trylocked object in the drm_exec state object,
> drop the
> + * reservation lock again and cleanup all references.
> + */
> +void drm_exec_drop_trylocked_obj(struct drm_exec *exec,
> +				 struct drm_gem_object *obj)
> +{
> +	/*
> +	 * We can't drop the reference of prelocked objects since we
> might still
> +	 * be in atomic context. Additionally it makes sense to keep
> the
> +	 * prelocked object around since we might need it again
> later on.
> +	 */
> +	if (exec->prelocked !=3D obj)
> +		dma_resv_unlock(obj->resv);
> +}
> +EXPORT_SYMBOL(drm_exec_drop_trylocked_obj);
> +
> =C2=A0MODULE_DESCRIPTION("DRM execution context");
> =C2=A0MODULE_LICENSE("Dual MIT/GPL");
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index aa786b828a0a..a3943057a3e8 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -146,5 +146,10 @@ int drm_exec_prepare_array(struct drm_exec
> *exec,
> =C2=A0			=C2=A0=C2=A0 struct drm_gem_object **objects,
> =C2=A0			=C2=A0=C2=A0 unsigned int num_objects,
> =C2=A0			=C2=A0=C2=A0 unsigned int num_fences);
> +bool drm_exec_trylock_obj(struct drm_exec *exec, struct
> drm_gem_object *obj);
> +int drm_exec_keep_trylocked_obj(struct drm_exec *exec,
> +				struct drm_gem_object *obj);
> +void drm_exec_drop_trylocked_obj(struct drm_exec *exec,
> +				struct drm_gem_object *obj);
> =C2=A0
> =C2=A0#endif

