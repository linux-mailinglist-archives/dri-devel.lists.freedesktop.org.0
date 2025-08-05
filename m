Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EBCB1B750
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 17:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FE310E6B4;
	Tue,  5 Aug 2025 15:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="HsJuXBiY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E54D10E6AD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 15:19:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1754407156; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iWIoVDa+wTOrQJ/dj3bgnFlDxndNvdkiL/v5MN/wUVhKQZe42OSa/R18u+TqKtBbiwpdZCmm7QBYNPkcYxIagosHjfEC8dB/KHKvvsPL19sUJaNr4prO2zvoPtjHstxoPwe6bPWAho3/WI58nHGFZ+Eo+hKrmopE8wn+zEHORXs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1754407156;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=beYGwomH+lbWL9jpEDBGEPmwoZ7gaJ8/W3aJ1x/dddw=; 
 b=jtlUEpWGOXoAagS566GxH3w2IUe/HsFkwA9I2qBti0QF4sZFdz2G+9NwLZKelEH79GkE4MCc2AOSenDizyyDqPz/Eq1XpGSQM074RfUN5x380w1lAn1p1oOSVm16ogCnpNGG7dhFbqok6X9DNMpjtQ65+k6dJ22EyS4IHmPCXuI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754407156; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=beYGwomH+lbWL9jpEDBGEPmwoZ7gaJ8/W3aJ1x/dddw=;
 b=HsJuXBiYcKPZ4jLf1RWopBpzcMLObSjqYIeD24MqPJsDbK78NtGQhAij/0h7JX67
 TpvYtrcqLAC3URwnYS5Na86QneEx8ZfDPru2tJn0eh+PdFkteU3bv1BLRzO01oqXtrW
 Iuvk2DA91GTe5Ysq8AhFw/KqoasRArLY2uzMRUPM=
Received: by mx.zohomail.com with SMTPS id 1754407153738359.155186405833;
 Tue, 5 Aug 2025 08:19:13 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DBS8REY5E82S.3937FAHS25ANA@kernel.org>
Date: Tue, 5 Aug 2025 12:18:56 -0300
Cc: Onur <work@onurozkan.dev>, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 longman@redhat.com, felipe_life@live.com, daniel@sedlak.dev,
 bjorn3_gh@protonmail.com, dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8B1FB608-7D43-4DD9-8737-DCE59ED74CCA@collabora.com>
References: <20250621184454.8354-1-work@onurozkan.dev>
 <20250621184454.8354-3-work@onurozkan.dev>
 <DASY7BECFRCT.332X5ZHZMV2W@kernel.org> <aFlQ7K_mYYbrG8Cl@Mac.home>
 <DATYHYJVPL3L.3NLMH7PPHYU9@kernel.org> <aFlpFQ4ivKw81d-y@Mac.home>
 <DAU0ELV91E2Q.35FZOII18W44J@kernel.org> <20250707163913.5ffc046d@nimda.home>
 <DB5XIWGZ8U36.1VB58YBJFL7OT@kernel.org> <20250707210613.2fd5bb55@nimda.home>
 <DB62ZN1LTO31.1HVWDLAWJWVM8@kernel.org>
 <FF481535-86EF-41EB-830A-1DA2434AAEA0@collabora.com>
 <DBRVNP4MM5KO.3IXLMXKGK4XTS@kernel.org>
 <E997DCAF-552F-4EF2-BF94-1385ECADF543@collabora.com>
 <DBS8REY5E82S.3937FAHS25ANA@kernel.org>
To: Benno Lossin <lossin@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External
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

Hi Benno,

> On 2 Aug 2025, at 17:58, Benno Lossin <lossin@kernel.org> wrote:
>=20
> On Sat Aug 2, 2025 at 4:15 PM CEST, Daniel Almeida wrote:
>> On 2 Aug 2025, at 07:42, Benno Lossin <lossin@kernel.org> wrote:
>>> On Fri Aug 1, 2025 at 11:22 PM CEST, Daniel Almeida wrote:
>>>> One thing I didn=E2=80=99t understand with your approach: is it =
amenable to loops?
>>>> i.e.: are things like drm_exec() implementable?
>>>=20
>>> I don't think so, see also my reply here:
>>>=20
>>>   https://lore.kernel.org/all/DBOPIJHY9NZ7.2CU5XP7UY7ES3@kernel.org
>>>=20
>>> The type-based approach with tuples doesn't handle dynamic number of
>>> locks.
>>>=20
>>=20
>> This is probably the default use-case by the way.
>=20
> That's an important detail. In that case, a type state won't we a good
> idea. Unless it's also common to have a finite number of them, in =
which
> case we should have two API.
>=20
>>>> /**
>>>> * drm_exec_until_all_locked - loop until all GEM objects are locked
>>>> * @exec: drm_exec object
>>>> *
>>>> * Core functionality of the drm_exec object. Loops until all GEM =
objects are
>>>> * locked and no more contention exists. At the beginning of the =
loop it is
>>>> * guaranteed that no GEM object is locked.
>>>> *
>>>> * Since labels can't be defined local to the loops body we use a =
jump pointer
>>>> * to make sure that the retry is only used from within the loops =
body.
>>>> */
>>>> #define drm_exec_until_all_locked(exec) \
>>>> __PASTE(__drm_exec_, __LINE__): \
>>>> for (void *__drm_exec_retry_ptr; ({ \
>>>> __drm_exec_retry_ptr =3D &&__PASTE(__drm_exec_, __LINE__);\
>>>> (void)__drm_exec_retry_ptr; \
>>>> drm_exec_cleanup(exec); \
>>>> });)
>>>=20
>>> My understanding of C preprocessor macros is not good enough to =
parse or
>>> understand this :( What is that `__PASTE` thing?
>>=20
>> This macro is very useful, but also cursed :)
>>=20
>> This declares a unique label before the loop, so you can jump back to =
it on
>> contention. It is usually used in conjunction with:
>=20
> Ahh, I missed the `:` at the end of the line. Thanks for explaining!
> (also Miguel in the other reply!) If you don't mind I'll ask some more
> basic C questions :)
>=20
> And yeah it's pretty cursed...
>=20
>> /**
>> * drm_exec_retry_on_contention - restart the loop to grap all locks
>> * @exec: drm_exec object
>> *
>> * Control flow helper to continue when a contention was detected and =
we need to
>> * clean up and re-start the loop to prepare all GEM objects.
>> */
>> #define drm_exec_retry_on_contention(exec) \
>> do { \
>> if (unlikely(drm_exec_is_contended(exec))) \
>> goto *__drm_exec_retry_ptr; \
>> } while (0)
>=20
> The `do { ... } while(0)` is used because C doesn't have `{ ... }`
> scopes? (& because you want to be able to have this be called from an =
if
> without braces?)

do {} while (0) makes this behave as a single statement. It usually used =
in
macros to ensure that they can be correctly called from control =
statements even
when no braces are used, like you said. It also enforces that a =
semi-colon has
to be placed at the end when the macro is called, which makes it behave =
a bit
more like a function call.

There may be other uses that I am not aware of, but it=E2=80=99s not =
something that
specific to =E2=80=9Cdrm_exec_retry_on_contention".

>=20
>> The termination is handled by:
>>=20
>> /**
>> * drm_exec_cleanup - cleanup when contention is detected
>> * @exec: the drm_exec object to cleanup
>> *
>> * Cleanup the current state and return true if we should stay inside =
the retry
>> * loop, false if there wasn't any contention detected and we can keep =
the
>> * objects locked.
>> */
>> bool drm_exec_cleanup(struct drm_exec *exec)
>> {
>> if (likely(!exec->contended)) {
>> ww_acquire_done(&exec->ticket);
>> return false;
>> }
>>=20
>> if (likely(exec->contended =3D=3D DRM_EXEC_DUMMY)) {
>> exec->contended =3D NULL;
>> ww_acquire_init(&exec->ticket, &reservation_ww_class);
>> return true;
>> }
>>=20
>> drm_exec_unlock_all(exec);
>> exec->num_objects =3D 0;
>> return true;
>> }
>> EXPORT_SYMBOL(drm_exec_cleanup);
>>=20
>> The third clause in the loop is empty.
>>=20
>> For example, in amdgpu:
>>=20
>> /**
>> * reserve_bo_and_vm - reserve a BO and a VM unconditionally.
>> * @mem: KFD BO structure.
>> * @vm: the VM to reserve.
>> * @ctx: the struct that will be used in unreserve_bo_and_vms().
>> */
>> static int reserve_bo_and_vm(struct kgd_mem *mem,
>>      struct amdgpu_vm *vm,
>>      struct bo_vm_reservation_context *ctx)
>> {
>> struct amdgpu_bo *bo =3D mem->bo;
>> int ret;
>>=20
>> WARN_ON(!vm);
>>=20
>> ctx->n_vms =3D 1;
>> ctx->sync =3D &mem->sync;
>> drm_exec_init(&ctx->exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>> drm_exec_until_all_locked(&ctx->exec) {
>> ret =3D amdgpu_vm_lock_pd(vm, &ctx->exec, 2);
>> drm_exec_retry_on_contention(&ctx->exec);
>> if (unlikely(ret))
>> goto error;
>>=20
>> ret =3D drm_exec_prepare_obj(&ctx->exec, &bo->tbo.base, 1);
>> drm_exec_retry_on_contention(&ctx->exec);
>> if (unlikely(ret))
>> goto error;
>> }
>>        // <=E2=80=94=E2=80=94 everything is locked at this point.
>=20
> Which function call locks the mutexes?

The function below, which is indirectly called from amdgpu_vm_lock_pd() =
in
this particular example:

```
/**
 * drm_exec_lock_obj - lock a GEM object for use
 * @exec: the drm_exec object with the state
 * @obj: the GEM object to lock
 *
 * Lock a GEM object for use and grab a reference to it.
 *
 * Returns: -EDEADLK if a contention is detected, -EALREADY when object =
is
 * already locked (can be suppressed by setting the =
DRM_EXEC_IGNORE_DUPLICATES
 * flag), -ENOMEM when memory allocation failed and zero for success.
 */
int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
{
	int ret;

	ret =3D drm_exec_lock_contended(exec);
	if (unlikely(ret))
		return ret;

	if (exec->prelocked =3D=3D obj) {
		drm_gem_object_put(exec->prelocked);
		exec->prelocked =3D NULL;
		return 0;
	}

	if (exec->flags & DRM_EXEC_INTERRUPTIBLE_WAIT)
		ret =3D dma_resv_lock_interruptible(obj->resv, =
&exec->ticket);
	else
		ret =3D dma_resv_lock(obj->resv, &exec->ticket);

	if (unlikely(ret =3D=3D -EDEADLK)) {
		drm_gem_object_get(obj);
		exec->contended =3D obj;
		return -EDEADLK;
	}

	if (unlikely(ret =3D=3D -EALREADY) &&
	    exec->flags & DRM_EXEC_IGNORE_DUPLICATES)
		return 0;

	if (unlikely(ret))
		return ret;

	ret =3D drm_exec_obj_locked(exec, obj);
	if (ret)
		goto error_unlock;

	return 0;

error_unlock:
	dma_resv_unlock(obj->resv);
	return ret;
}
EXPORT_SYMBOL(drm_exec_lock_obj);
```

And the tracking of locked objects is done at:

```
/* Track the locked object in the array */
static int drm_exec_obj_locked(struct drm_exec *exec,
			       struct drm_gem_object *obj)
{
	if (unlikely(exec->num_objects =3D=3D exec->max_objects)) {
		size_t size =3D exec->max_objects * sizeof(void *);
		void *tmp;

		tmp =3D kvrealloc(exec->objects, size + PAGE_SIZE, =
GFP_KERNEL);
		if (!tmp)
			return -ENOMEM;

		exec->objects =3D tmp;
		exec->max_objects +=3D PAGE_SIZE / sizeof(void *);
	}
	drm_gem_object_get(obj);
	exec->objects[exec->num_objects++] =3D obj;

	return 0;
}
```

Note that dma_resv_lock() is:

```
static inline int dma_resv_lock(struct dma_resv *obj,
				struct ww_acquire_ctx *ctx)
{
	return ww_mutex_lock(&obj->lock, ctx);
}
```


Again, this is GEM-specific, but the idea is to generalize it.


>=20
>> return 0;
>>=20
>>=20
>> So, something like:
>>=20
>> some_unique_label:
>> for(void *retry_ptr;
>>    ({ retry_ptr =3D &some_unique_label; drm_exec_cleanup(); });
>=20
> Normally this should be a condition, or rather an expression =
evaluating
> to bool, why is this okay? Or does C just take the value of the last
> function call due to the `({})`?

This is described here [0]. As per the docs, it evaluates to bool (as
drm_exec_cleanup() is last, and that evaluates to bool)=20

>=20
> Why isn't `({})` used instead of `do { ... } while(0)` above?

I=E2=80=99m not sure I understand what you=E2=80=99re trying to ask.

If you=E2=80=99re asking why ({}) is being used here, then it=E2=80=99s =
because we need
to return (i.e. evaluate to) a value, and a do {=E2=80=A6} while(0) does =
not do
that.

>=20
>>    /* empty *) {
>>     /* user code here, which potentially jumps back to =
some_unique_label  */
>> }
>=20
> Thanks for the example & the macro expansion. What I gather from this =
is
> that we'd probably want a closure that executes the code & reruns it
> when contention is detected.

Yep, I think so, too.

>=20
>>>> In fact, perhaps we can copy drm_exec, basically? i.e.:
>>>>=20
>>>> /**
>>>> * struct drm_exec - Execution context
>>>> */
>>>> struct drm_exec {
>>>> /**
>>>> * @flags: Flags to control locking behavior
>>>> */
>>>> u32                     flags;
>>>>=20
>>>> /**
>>>> * @ticket: WW ticket used for acquiring locks
>>>> */
>>>> struct ww_acquire_ctx ticket;
>>>>=20
>>>> /**
>>>> * @num_objects: number of objects locked
>>>> */
>>>> unsigned int num_objects;
>>>>=20
>>>> /**
>>>> * @max_objects: maximum objects in array
>>>> */
>>>> unsigned int max_objects;
>>>>=20
>>>> /**
>>>> * @objects: array of the locked objects
>>>> */
>>>> struct drm_gem_object **objects;
>>>>=20
>>>> /**
>>>> * @contended: contended GEM object we backed off for
>>>> */
>>>> struct drm_gem_object *contended;
>>>>=20
>>>> /**
>>>> * @prelocked: already locked GEM object due to contention
>>>> */
>>>> struct drm_gem_object *prelocked;
>>>> };
>>>>=20
>>>> This is GEM-specific, but we could perhaps implement the same idea =
by
>>>> tracking ww_mutexes instead of GEM objects.
>>>=20
>>> But this would only work for `Vec<WwMutex<T>>`, right?
>>=20
>> I=E2=80=99m not sure if I understand your point here.
>>=20
>> The list of ww_mutexes that we've managed to currently lock would be =
something
>> that we'd keep track internally in our context. In what way is a KVec =
an issue?
>=20
> I saw "array of the locked objects" and thus thought so this must only
> work for an array of locks. Looking at the type a bit closer, it
> actually is an array of pointers, so it does work for arbitrary data
> structures storing the locks.
>=20
> So essentially it would amount to storing `Vec<WwMutexGuard<'_, T>>` =
in
> Rust IIUC. I was under the impression that we wanted to avoid that,
> because it's an extra allocation.

It=E2=80=99s the price to pay for correctness IMHO.

The =E2=80=9Cexec=E2=80=9D abstraction also allocates:

```
/* Track the locked object in the array */
static int drm_exec_obj_locked(struct drm_exec *exec,
			       struct drm_gem_object *obj)
{
	if (unlikely(exec->num_objects =3D=3D exec->max_objects)) {
		size_t size =3D exec->max_objects * sizeof(void *);
		void *tmp;

		tmp =3D kvrealloc(exec->objects, size + PAGE_SIZE, =
GFP_KERNEL);
		if (!tmp)
			return -ENOMEM;

		exec->objects =3D tmp;
		exec->max_objects +=3D PAGE_SIZE / sizeof(void *);
	}
	drm_gem_object_get(obj);
	exec->objects[exec->num_objects++] =3D obj;

	return 0;
}
```



>=20
> But maybe that's actually what's done on the C side.

See above.

>=20
>> Btw, I can also try to implement a proof of concept, so long as =
people agree that
>> this approach makes sense.
>=20
> I'm not sure I understand what you are proposing, so I can't give a
> recommendation yet.
>=20

I am suggesting what you said above and more:

a) run a user closure where the user can indicate which ww_mutexes they =
want to lock
b) keep track of the objects above
c) keep track of whether a contention happened
d) rollback if a contention happened, releasing all locks
e) rerun the user closure from a clean slate after rolling back
f)  run a separate user closure whenever we know that all objects have =
been locked.

That=E2=80=99s a very broad description, but I think it can work.

Note that the operations above would be implemented by a separate type, =
not by
the ww_mutex abstraction itself. But users should probably be using the =
API
above unless there=E2=80=99s a strong reason not to.

> ---
> Cheers,
> Benno
>=20

=E2=80=94 Daniel


[0]: https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html=
