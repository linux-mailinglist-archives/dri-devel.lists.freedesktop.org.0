Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 923D98CC365
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 16:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EDB10F5E5;
	Wed, 22 May 2024 14:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Luw7xr10";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE6E10F5E5;
 Wed, 22 May 2024 14:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716388869; x=1747924869;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8s1PMwdBu3ali5VC6BocfAa0yPaVCZZ3zCZqD68P2VE=;
 b=Luw7xr10oyUQtn7+PqsWJb4KfONKQOvujR/nFtTjPTAhx/+sMI4Hiws7
 p/4KxVmj0jciHKLIwimeVyQjjsxidb7u9SV/zYD7fnvS62OOr8f5t23Ce
 rKhREm42PS3+01yWjICFRV3+h+kEKW1jof+nmIdI1/azw24fI/rL8wPtS
 lZroNodiUN1RUAa5LxvuQ9OdKtGNqoKfQp78Vec3kqXjR8UfeTFQ7664b
 dWWQKACiSReFwlJheVnNEMnaI6mzPE3WDfUWb8qn0obmP8y5T0ax79Gn+
 gBCYEItVISu/EfikKzVb6NTtakNx/ZaOOOXmCxU+uUNDaDs0C/P42zIC9 A==;
X-CSE-ConnectionGUID: LkmYhG7QQj+qzjiyxmNK7A==
X-CSE-MsgGUID: 5fGhXrnZQ8SN2mi88Io5Gw==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="30150128"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="30150128"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 07:41:08 -0700
X-CSE-ConnectionGUID: 85ERgBTSRtuGgolg5qgnlA==
X-CSE-MsgGUID: JXOJQlbwTMOrhz7E/T2voQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33754965"
Received: from sbutnari-mobl1.ger.corp.intel.com (HELO [10.245.246.224])
 ([10.245.246.224])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 07:41:07 -0700
Message-ID: <ec9d05b089da404a81bb901891149875e9e1b2df.camel@linux.intel.com>
Subject: Re: [RFC PATCH v3 15/21] drm/exec: Add a snapshot capability
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Matthew Brost
 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, Daniel Vetter
 <daniel@ffwll.ch>
Date: Wed, 22 May 2024 16:41:04 +0200
In-Reply-To: <356482150ac036b506a1afbfe0b3cc40a0a72731.camel@linux.intel.com>
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
 <20240521071639.77614-16-thomas.hellstrom@linux.intel.com>
 <964e2a3c-5417-40c9-b3cf-a9614881bc51@amd.com>
 <356482150ac036b506a1afbfe0b3cc40a0a72731.camel@linux.intel.com>
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

On Wed, 2024-05-22 at 15:54 +0200, Thomas Hellstr=C3=B6m wrote:
> On Wed, 2024-05-22 at 13:27 +0200, Christian K=C3=B6nig wrote:
> > Am 21.05.24 um 09:16 schrieb Thomas Hellstr=C3=B6m:
> > > When validating a buffer object for submission, we might need to
> > > lock
> > > a number of object for eviction to make room for the validation.
> > >=20
> > > This makes it pretty likely that validation will eventually
> > > succeed,
> > > since eventually the validating process will hold most dma_resv
> > > locks
> > > of the buffer objects residing in the memory type being validated
> > > for.
> > >=20
> > > However, once validation of a single object has succeeded it
> > > might
> > > not
> > > be beneficial to hold on to those locks anymore, and the
> > > validator
> > > would want to drop the locks of all objects taken during
> > > validation.
> >=20
> > Exactly avoiding that was one of the goals of developing the
> > drm_exec
> > object.
> >=20
> > When objects are unlocked after evicting them it just gives
> > concurrent=20
> > operations an opportunity to lock them and re-validate them into
> > the=20
> > contended domain.
> >=20
> > So why should that approach here be beneficial at all?
>=20
> It's a matter of being nice to the rest of the system while *still
> guaranteeing progress*. For each object we're trying to validate, we
> keep on evicting other objects until we make progress even if we lock
> all the objects in the domain.
>=20
> If we were unlocking after each eviction, we can't really guarantee
> progress.
>=20
> OTOH, a concurrent locker of the object may well be one with higher
> priority (lower ticket number) just wanting to perform a pagefault
>=20
> So it's a tradeoff between locking just locking other processes out
> to
> allow us to make one step of progress and to in addition hit them
> with
> the big sledgehammer.

I thought I'd also mention that the ideal solution here I think would
be to have an rw_mutex per manager. Ordinary allocations take it in
read mode, evictions take it in write mode. Now the bad thing is it
sits in between ww_mutexes so it would have to be a ww_rw_mutex which
would probably be too nasty to implement.

/Thomas

>=20
> /Thomas
>=20
> >=20
> > Regards,
> > Christian.
> >=20
> > >=20
> > > Introduce a drm_exec snapshot functionality that can be used to
> > > record the locks held at a certain time, and a restore
> > > functionality
> > > that restores the drm_exec state to the snapshot by dropping all
> > > locks.
> > >=20
> > > Snapshots can be nested if needed.
> > >=20
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: <dri-devel@lists.freedesktop.org>
> > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com>
> > > ---
> > > =C2=A0 drivers/gpu/drm/drm_exec.c | 55
> > > +++++++++++++++++++++++++++++++++++++-
> > > =C2=A0 include/drm/drm_exec.h=C2=A0=C2=A0=C2=A0=C2=A0 | 23 ++++++++++=
+++++-
> > > =C2=A0 2 files changed, 76 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_exec.c
> > > b/drivers/gpu/drm/drm_exec.c
> > > index 1383680ffa4a..9eea5d0d3a98 100644
> > > --- a/drivers/gpu/drm/drm_exec.c
> > > +++ b/drivers/gpu/drm/drm_exec.c
> > > @@ -57,6 +57,7 @@ static void drm_exec_unlock_all(struct drm_exec
> > > *exec)
> > > =C2=A0=C2=A0	struct drm_gem_object *obj;
> > > =C2=A0=C2=A0	unsigned long index;
> > > =C2=A0=20
> > > +	WARN_ON(exec->snap);
> > > =C2=A0=C2=A0	drm_exec_for_each_locked_object_reverse(exec, index,
> > > obj)
> > > {
> > > =C2=A0=C2=A0		dma_resv_unlock(obj->resv);
> > > =C2=A0=C2=A0		drm_gem_object_put(obj);
> > > @@ -90,6 +91,7 @@ void drm_exec_init(struct drm_exec *exec, u32
> > > flags, unsigned nr)
> > > =C2=A0=C2=A0	exec->num_objects =3D 0;
> > > =C2=A0=C2=A0	exec->contended =3D DRM_EXEC_DUMMY;
> > > =C2=A0=C2=A0	exec->prelocked =3D NULL;
> > > +	exec->snap =3D NULL;
> > > =C2=A0 }
> > > =C2=A0 EXPORT_SYMBOL(drm_exec_init);
> > > =C2=A0=20
> > > @@ -301,7 +303,6 @@ int drm_exec_lock_obj(struct drm_exec *exec,
> > > struct drm_gem_object *obj)
> > > =C2=A0=C2=A0		goto error_unlock;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	return 0;
> > > -
> > > =C2=A0 error_unlock:
> > > =C2=A0=C2=A0	dma_resv_unlock(obj->resv);
> > > =C2=A0=C2=A0	return ret;
> > > @@ -395,5 +396,57 @@ int drm_exec_prepare_array(struct drm_exec
> > > *exec,
> > > =C2=A0 }
> > > =C2=A0 EXPORT_SYMBOL(drm_exec_prepare_array);
> > > =C2=A0=20
> > > +/**
> > > + * drm_exec_restore() - Restore the drm_exec state to the point
> > > of
> > > a snapshot.
> > > + * @exec: The drm_exec object with the state.
> > > + * @snap: The snapshot state.
> > > + *
> > > + * Restores the drm_exec object by means of unlocking and
> > > dropping
> > > references
> > > + * to objects locked after the snapshot.
> > > + */
> > > +void drm_exec_restore(struct drm_exec *exec, struct
> > > drm_exec_snapshot *snap)
> > > +{
> > > +	struct drm_gem_object *obj;
> > > +	unsigned int index;
> > > +
> > > +	exec->snap =3D snap->saved_snap;
> > > +
> > > +	drm_exec_for_each_locked_object_reverse(exec, index,
> > > obj)
> > > {
> > > +		if (index + 1 =3D=3D snap->num_locked)
> > > +			break;
> > > +
> > > +		dma_resv_unlock(obj->resv);
> > > +		drm_gem_object_put(obj);
> > > +		exec->objects[index] =3D NULL;
> > > +	}
> > > +
> > > +	exec->num_objects =3D snap->num_locked;
> > > +
> > > +	if (!exec->prelocked)
> > > +		exec->prelocked =3D snap->prelocked;
> > > +	else
> > > +		drm_gem_object_put(snap->prelocked);
> > > +}
> > > +EXPORT_SYMBOL(drm_exec_restore);
> > > +
> > > +/**
> > > + * drm_exec_snapshot() - Take a snapshot of the drm_exec state
> > > + * @exec: The drm_exec object with the state.
> > > + * @snap: The snapshot state.
> > > + *
> > > + * Records the @exec state in @snap. The @snap object is
> > > typically
> > > allocated
> > > + * in the stack of the caller.
> > > + */
> > > +void drm_exec_snapshot(struct drm_exec *exec, struct
> > > drm_exec_snapshot *snap)
> > > +{
> > > +	snap->num_locked =3D exec->num_objects;
> > > +	snap->prelocked =3D exec->prelocked;
> > > +	if (snap->prelocked)
> > > +		drm_gem_object_get(snap->prelocked);
> > > +	snap->saved_snap =3D exec->snap;
> > > +	exec->snap =3D snap;
> > > +}
> > > +EXPORT_SYMBOL(drm_exec_snapshot);
> > > +
> > > =C2=A0 MODULE_DESCRIPTION("DRM execution context");
> > > =C2=A0 MODULE_LICENSE("Dual MIT/GPL");
> > > diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> > > index ea0f2117ee0c..0ce4d749511b 100644
> > > --- a/include/drm/drm_exec.h
> > > +++ b/include/drm/drm_exec.h
> > > @@ -19,7 +19,6 @@ struct drm_exec {
> > > =C2=A0=C2=A0	 * @flags: Flags to control locking behavior
> > > =C2=A0=C2=A0	 */
> > > =C2=A0=C2=A0	u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags=
;
> > > -
> > > =C2=A0=C2=A0	/**
> > > =C2=A0=C2=A0	 * @ticket: WW ticket used for acquiring locks
> > > =C2=A0=C2=A0	 */
> > > @@ -49,6 +48,25 @@ struct drm_exec {
> > > =C2=A0=C2=A0	 * @prelocked: already locked GEM object due to
> > > contention
> > > =C2=A0=C2=A0	 */
> > > =C2=A0=C2=A0	struct drm_gem_object *prelocked;
> > > +
> > > +	/**
> > > +	 * @snap: Pointer to the last snapshot taken or NULL if
> > > none.
> > > +	 */
> > > +	struct drm_exec_snapshot *snap;
> > > +};
> > > +
> > > +/**
> > > + * struct drm_exec_snapshot - drm_exec snapshot information
> > > + */
> > > +struct drm_exec_snapshot {
> > > +	/** @saved_snap: Pointer to the previous snapshot or
> > > NULL.
> > > */
> > > +	struct drm_exec_snapshot *saved_snap;
> > > +
> > > +	/** @prelocked: Refcounted pointer to the prelocked
> > > object
> > > at snapshot time. */
> > > +	struct drm_gem_object *prelocked;
> > > +
> > > +	/** @num_locked: Number of locked objects at snapshot
> > > time. */
> > > +	unsigned long num_locked;
> > > =C2=A0 };
> > > =C2=A0=20
> > > =C2=A0 int drm_exec_handle_contended(struct drm_exec *exec);
> > > @@ -160,5 +178,8 @@ int drm_exec_prepare_array(struct drm_exec
> > > *exec,
> > > =C2=A0=C2=A0			=C2=A0=C2=A0 struct drm_gem_object **objects,
> > > =C2=A0=C2=A0			=C2=A0=C2=A0 unsigned int num_objects,
> > > =C2=A0=C2=A0			=C2=A0=C2=A0 unsigned int num_fences);
> > > +void drm_exec_snapshot(struct drm_exec *exec, struct
> > > drm_exec_snapshot *snap);
> > > +void drm_exec_restore(struct drm_exec *exec, struct
> > > drm_exec_snapshot *snap);
> > > +
> > > =C2=A0=20
> > > =C2=A0 #endif
> >=20
>=20

