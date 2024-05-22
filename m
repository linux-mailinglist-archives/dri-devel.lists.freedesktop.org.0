Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 079178CC25A
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 15:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99A410E2DB;
	Wed, 22 May 2024 13:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fu3Uq12n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CFB10E2DB;
 Wed, 22 May 2024 13:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716385455; x=1747921455;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VD5Wc3oOx0N1/SDi7/kgS6+VPKBdxjRwTtrwWz8tUQU=;
 b=Fu3Uq12nGU77wIe7SasnMgl0ApDsUK3d67JaHv9zamWZntO1DvuHB2RZ
 CmOLE1V2xgVESzYYoHvRtebOijw2Q7d/7OcdF2/StJQaXaZ2sJ20e/XrF
 9zq+Wla1RnjbenKza5QFjc5Y0yzQ4vUWetsTnG/NEPuDR03WBaoTY0kSi
 fMI5bSM5A6suoSz6yPxvgXuGIsMTx93lxsJiVrs30PFsy3M+4ohjP+Fkk
 SpvBmTwbVwyfHTI8a3DEBzBfpnQQmbGWK2xX6idpQoSoFCNmODB0xAifC
 9cD5h0wiCrs8xTxJ26hYerHz9vvrGt6e7hK4AQAchTMHoV5SukEmgfygj g==;
X-CSE-ConnectionGUID: lhlco6FHR9eRIy8Pw6aUCQ==
X-CSE-MsgGUID: 5UC721I0QL2gTk76LsiuMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12578156"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="12578156"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 06:44:14 -0700
X-CSE-ConnectionGUID: 5CAFpPfJQPWd895TaALACw==
X-CSE-MsgGUID: Mg6hENdbQRuUkC6g3j11IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="37871463"
Received: from sbutnari-mobl1.ger.corp.intel.com (HELO [10.245.246.224])
 ([10.245.246.224])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 06:44:12 -0700
Message-ID: <13c4f7f1a4440ca5643e3f042af7a878a02e0852.camel@linux.intel.com>
Subject: Re: [RFC PATCH v3 16/21] drm/exec: Introduce an evict mode
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Matthew Brost
 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Date: Wed, 22 May 2024 15:44:09 +0200
In-Reply-To: <66a2e207-49f7-4435-ad2e-71c0608ab761@amd.com>
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
 <20240521071639.77614-17-thomas.hellstrom@linux.intel.com>
 <66a2e207-49f7-4435-ad2e-71c0608ab761@amd.com>
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

On Wed, 2024-05-22 at 15:28 +0200, Christian K=C3=B6nig wrote:
> Am 21.05.24 um 09:16 schrieb Thomas Hellstr=C3=B6m:
> > Locking for eviction is in some way different from locking for
> > submission:
> >=20
> > 1) We can't lock objects that are already locked for submission,
> > hence DRM_EXEC_IGNORE_DUPLICATES must be unset.
> > 2) We must be able to re-lock objects locked for eviction,
> > either for submission or for yet another eviction, in
> > particular objects sharing a single resv must be considered.
>=20
> Yeah, I was already thinking about that as well.
>=20
> My idea so far was to have a separate function for locking eviction
> BOs.=20
> This function would then use trylock or blocking depending on some
> setting.

Downstream i915 also has a separate locking function for this. I'm fine
with that as well. Probably the most sane choice.


>=20
> > 3) There is no point to keep a contending object after the
> > transaction restart. We don't know whether we actually want to use
> > it again.
>=20
> Well that isn't true as far as I know.
>=20
> If we don't use trylock we still need to lock the object after
> rollback=20
> to make sure that we waited for it to become available.

Yes, the transaction restart mentioned above is *after* the relaxation,
so the rollback becomes:

unlock_all
lock_contending_lock.
unlock_contending_lock.
drop_contending lock.


/Thomas


>=20
> Regards,
> Christian.
>=20
> > So introduce a drm_exec evict mode, and for now instead of
> > explicitly setting it using a function call or implement separate
> > locking functions that use evict mode, assume evict mode if
> > there is a snapshot registered. This can easily be changed later.
> >=20
> > To keep track of resvs locked for eviction, use a pointer set
> > implemented by an xarray. This is probably not the most efficient
> > data structure but used as an easy-to-implement first approach.
> > If the set is empty (evict mode never used), the performance-
> > and memory usage impact will be very small.
> >=20
> > TODO: Probably want to implement the set using an open addressing
> > hash table.
> >=20
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0 drivers/gpu/drm/drm_exec.c | 77
> > ++++++++++++++++++++++++++++++++++----
> > =C2=A0 include/drm/drm_exec.h=C2=A0=C2=A0=C2=A0=C2=A0 | 15 ++++++++
> > =C2=A0 2 files changed, 85 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_exec.c
> > b/drivers/gpu/drm/drm_exec.c
> > index 9eea5d0d3a98..ea79d96f5439 100644
> > --- a/drivers/gpu/drm/drm_exec.c
> > +++ b/drivers/gpu/drm/drm_exec.c
> > @@ -65,6 +65,10 @@ static void drm_exec_unlock_all(struct drm_exec
> > *exec)
> > =C2=A0=20
> > =C2=A0=C2=A0	drm_gem_object_put(exec->prelocked);
> > =C2=A0=C2=A0	exec->prelocked =3D NULL;
> > +
> > +	/* garbage collect */
> > +	xa_destroy(&exec->resv_set);
> > +	xa_init(&exec->resv_set);
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 /**
> > @@ -92,6 +96,8 @@ void drm_exec_init(struct drm_exec *exec, u32
> > flags, unsigned nr)
> > =C2=A0=C2=A0	exec->contended =3D DRM_EXEC_DUMMY;
> > =C2=A0=C2=A0	exec->prelocked =3D NULL;
> > =C2=A0=C2=A0	exec->snap =3D NULL;
> > +	exec->drop_contended =3D false;
> > +	xa_init(&exec->resv_set);
> > =C2=A0 }
> > =C2=A0 EXPORT_SYMBOL(drm_exec_init);
> > =C2=A0=20
> > @@ -110,6 +116,7 @@ void drm_exec_fini(struct drm_exec *exec)
> > =C2=A0=C2=A0		drm_gem_object_put(exec->contended);
> > =C2=A0=C2=A0		ww_acquire_fini(&exec->ticket);
> > =C2=A0=C2=A0	}
> > +	xa_destroy(&exec->resv_set);
> > =C2=A0 }
> > =C2=A0 EXPORT_SYMBOL(drm_exec_fini);
> > =C2=A0=20
> > @@ -139,6 +146,30 @@ bool drm_exec_cleanup(struct drm_exec *exec)
> > =C2=A0 }
> > =C2=A0 EXPORT_SYMBOL(drm_exec_cleanup);
> > =C2=A0=20
> > +static unsigned long drm_exec_resv_to_key(const struct dma_resv
> > *resv)
> > +{
> > +	return (unsigned long)resv / __alignof__(typeof(*resv));
> > +}
> > +
> > +static void
> > +drm_exec_resv_set_erase(struct drm_exec *exec, unsigned long key)
> > +{
> > +	if (xa_load(&exec->resv_set, key))
> > +		xa_erase(&exec->resv_set, key);
> > +}
> > +
> > +static bool drm_exec_in_evict_mode(struct drm_exec *exec)
> > +{
> > +	return !!exec->snap;
> > +}
> > +
> > +static void drm_exec_set_evict_mode(struct drm_exec *exec,
> > +				=C2=A0=C2=A0=C2=A0 struct drm_exec_snapshot
> > *snap)
> > +{
> > +	exec->snap =3D snap;
> > +	exec->flags &=3D ~DRM_EXEC_IGNORE_DUPLICATES;
> > +}
> > +
> > =C2=A0 /* Track the locked object in the array */
> > =C2=A0 static int drm_exec_obj_locked(struct drm_exec *exec,
> > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gem_obje=
ct *obj,
> > @@ -161,6 +192,14 @@ static int drm_exec_obj_locked(struct drm_exec
> > *exec,
> > =C2=A0=C2=A0	drm_gem_object_get(obj);
> > =C2=A0=C2=A0	exec->objects[exec->num_objects++] =3D obj;
> > =C2=A0=20
> > +	/*
> > +	 * Errors here are not fatal, It means the object we
> > locked
> > +	 * for eviction can't be locked again. If that is
> > problematic
> > +	 * we may need to reconsider this.
> > +	 */
> > +	if (drm_exec_in_evict_mode(exec))
> > +		(void)xa_store(&exec->resv_set,
> > drm_exec_resv_to_key(obj->resv),
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 obj->resv, gfp | __GFP_NOWARN)=
;
> > =C2=A0=C2=A0	return 0;
> > =C2=A0 }
> > =C2=A0=20
> > @@ -184,6 +223,9 @@ static int drm_exec_lock_contended(struct
> > drm_exec *exec)
> > =C2=A0=C2=A0		dma_resv_lock_slow(obj->resv, &exec->ticket);
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > +	if (exec->drop_contended)
> > +		goto error_unlock;
> > +
> > =C2=A0=C2=A0	ret =3D drm_exec_obj_locked(exec, obj, GFP_KERNEL);
> > =C2=A0=C2=A0	if (unlikely(ret))
> > =C2=A0=C2=A0		goto error_unlock;
> > @@ -245,10 +287,19 @@ int drm_exec_trylock_obj(struct drm_exec
> > *exec, struct drm_gem_object *obj)
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > =C2=A0=C2=A0	if (!dma_resv_trylock_ctx(obj->resv, &exec->ticket)) {
> > -		if (dma_resv_locking_ctx(obj->resv) =3D=3D &exec-
> > >ticket)
> > -			return (exec->flags &
> > DRM_EXEC_IGNORE_DUPLICATES) ? 0 : -EALREADY;
> > -		else
> > +		if (dma_resv_locking_ctx(obj->resv) =3D=3D &exec-
> > >ticket) {
> > +			unsigned long key =3D
> > drm_exec_resv_to_key(obj->resv);
> > +
> > +			if (exec->flags &
> > DRM_EXEC_IGNORE_DUPLICATES ||
> > +			=C2=A0=C2=A0=C2=A0 xa_load(&exec->resv_set, key)) {
> > +				if (!drm_exec_in_evict_mode(exec))
> > +					drm_exec_resv_set_erase(ex
> > ec, key);
> > +				return 0;
> > +			}
> > +			return -EALREADY;
> > +		} else {
> > =C2=A0=C2=A0			return -EBUSY;
> > +		}
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > =C2=A0=C2=A0	ret =3D drm_exec_obj_locked(exec, obj, GFP_ATOMIC |
> > __GFP_NOWARN);
> > @@ -288,12 +339,20 @@ int drm_exec_lock_obj(struct drm_exec *exec,
> > struct drm_gem_object *obj)
> > =C2=A0=C2=A0	if (unlikely(ret =3D=3D -EDEADLK)) {
> > =C2=A0=C2=A0		drm_gem_object_get(obj);
> > =C2=A0=C2=A0		exec->contended =3D obj;
> > +		exec->drop_contended =3D
> > drm_exec_in_evict_mode(exec);
> > =C2=A0=C2=A0		return -EDEADLK;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > -	if (unlikely(ret =3D=3D -EALREADY) &&
> > -	=C2=A0=C2=A0=C2=A0 exec->flags & DRM_EXEC_IGNORE_DUPLICATES)
> > -		return 0;
> > +	if (unlikely(ret =3D=3D -EALREADY)) {
> > +		unsigned long key =3D drm_exec_resv_to_key(obj-
> > >resv);
> > +
> > +		if (exec->flags & DRM_EXEC_IGNORE_DUPLICATES ||
> > +		=C2=A0=C2=A0=C2=A0 xa_load(&exec->resv_set, key)) {
> > +			if (!drm_exec_in_evict_mode(exec))
> > +				drm_exec_resv_set_erase(exec,
> > key);
> > +			return 0;
> > +		}
> > +	}
> > =C2=A0=20
> > =C2=A0=C2=A0	if (unlikely(ret))
> > =C2=A0=C2=A0		return ret;
> > @@ -324,6 +383,7 @@ void drm_exec_unlock_obj(struct drm_exec *exec,
> > struct drm_gem_object *obj)
> > =C2=A0=20
> > =C2=A0=C2=A0	for (i =3D exec->num_objects; i--;) {
> > =C2=A0=C2=A0		if (exec->objects[i] =3D=3D obj) {
> > +			drm_exec_resv_set_erase(exec,
> > drm_exec_resv_to_key(obj->resv));
> > =C2=A0=C2=A0			dma_resv_unlock(obj->resv);
> > =C2=A0=C2=A0			for (++i; i < exec->num_objects; ++i)
> > =C2=A0=C2=A0				exec->objects[i - 1] =3D exec-
> > >objects[i];
> > @@ -415,12 +475,14 @@ void drm_exec_restore(struct drm_exec *exec,
> > struct drm_exec_snapshot *snap)
> > =C2=A0=C2=A0		if (index + 1 =3D=3D snap->num_locked)
> > =C2=A0=C2=A0			break;
> > =C2=A0=20
> > +		xa_erase(&exec->resv_set,
> > drm_exec_resv_to_key(obj->resv));
> > =C2=A0=C2=A0		dma_resv_unlock(obj->resv);
> > =C2=A0=C2=A0		drm_gem_object_put(obj);
> > =C2=A0=C2=A0		exec->objects[index] =3D NULL;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > =C2=A0=C2=A0	exec->num_objects =3D snap->num_locked;
> > +	exec->flags =3D snap->flags;
> > =C2=A0=20
> > =C2=A0=C2=A0	if (!exec->prelocked)
> > =C2=A0=C2=A0		exec->prelocked =3D snap->prelocked;
> > @@ -443,8 +505,9 @@ void drm_exec_snapshot(struct drm_exec *exec,
> > struct drm_exec_snapshot *snap)
> > =C2=A0=C2=A0	snap->prelocked =3D exec->prelocked;
> > =C2=A0=C2=A0	if (snap->prelocked)
> > =C2=A0=C2=A0		drm_gem_object_get(snap->prelocked);
> > +	snap->flags =3D exec->flags;
> > =C2=A0=C2=A0	snap->saved_snap =3D exec->snap;
> > -	exec->snap =3D snap;
> > +	drm_exec_set_evict_mode(exec, snap);
> > =C2=A0 }
> > =C2=A0 EXPORT_SYMBOL(drm_exec_snapshot);
> > =C2=A0=20
> > diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> > index 0ce4d749511b..0b6d5ac0c092 100644
> > --- a/include/drm/drm_exec.h
> > +++ b/include/drm/drm_exec.h
> > @@ -5,6 +5,7 @@
> > =C2=A0=20
> > =C2=A0 #include <linux/compiler.h>
> > =C2=A0 #include <linux/ww_mutex.h>
> > +#include <linux/xarray.h>
> > =C2=A0=20
> > =C2=A0 #define DRM_EXEC_INTERRUPTIBLE_WAIT	BIT(0)
> > =C2=A0 #define DRM_EXEC_IGNORE_DUPLICATES	BIT(1)
> > @@ -53,6 +54,17 @@ struct drm_exec {
> > =C2=A0=C2=A0	 * @snap: Pointer to the last snapshot taken or NULL if
> > none.
> > =C2=A0=C2=A0	 */
> > =C2=A0=C2=A0	struct drm_exec_snapshot *snap;
> > +
> > +	/**
> > +	 * @resv_set: Set of pointers to locked objects in evict
> > mode.
> > +	 */
> > +	struct xarray resv_set;
> > +
> > +	/**
> > +	 * @drop_contended: Drop the contended object after WW
> > transaction
> > +	 * relaxation.
> > +	 */
> > +	bool drop_contended;
> > =C2=A0 };
> > =C2=A0=20
> > =C2=A0 /**
> > @@ -67,6 +79,9 @@ struct drm_exec_snapshot {
> > =C2=A0=20
> > =C2=A0=C2=A0	/** @num_locked: Number of locked objects at snapshot
> > time. */
> > =C2=A0=C2=A0	unsigned long num_locked;
> > +
> > +	/** @flags: The drm_exec flags at snapshot time. */
> > +	u32 flags;
> > =C2=A0 };
> > =C2=A0=20
> > =C2=A0 int drm_exec_handle_contended(struct drm_exec *exec);
>=20

